#!/bin/bash
#This script is to setup Ansible Master Node on a AWS EC2 RHEL 7
sudo yum -y update

#Install Git
yum -y install git

#Install Wget
yum -y install wget

#Download RedHat Extra Repo
wget https://archive.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

#Install Ansible
sudo rpm -i epel-release-latest-7.noarch.rpm
sudo yum -y update
sudo yum -y install ansible

#Install AWS CLI
curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
export PATH=~/.local/bin:$PATH
source ~/.bash_profile
pip install awscli --upgrade --user

#Test Ansible & AWS CLI
echo "##### Ansible Ping Test ####"
ansible localhost -m ping

echo "#### AWS CLI Version ####"
aws --version
