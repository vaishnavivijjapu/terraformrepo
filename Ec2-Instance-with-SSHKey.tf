# First create ssh keys in current directory using
# ssh-keygen -f terraform_ec2_key
# This will create two files in current directory
# 1. terraform_ec2_key
# 2. terraform_ec2_key.pub

# Now create instance which will use these keys
### vim instance-with-ssh-keys.tf ####

provider "aws" {
  region     = "us-east-1"
}


resource "aws_instance" "Test-Server" {
  ami           = "ami-05c13eab67c5d8861"
  instance_type = "t2.micro"
  key_name = "key"
}

resource "aws_key_pair" "terraform_ec2_key" {
	key_name = "key"
	public_key = "${file("key.pub")}"
}

#### file ends here ####
# terraform validate
# terraform plan
# terraform apply
# Once the ec2 instance is created, go to aws dashboard
# copy the ssh command (remove .pem) 
# ssh -i "terraform_ec2_key" ec2-user@your-ip-address
# 
# finally destroy everything
# terraform destroy
