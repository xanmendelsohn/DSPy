##notes
## generate ssh key: ssh-keygen -t rsa
## print key: cat <path given>
## add new key to git
## clone git repo with ssh key from git: git clone <>
## create vm: python3 -m venv ~/.DSPy
## set source to vm: source ~/.DSPy/bin/activate
## check source: which python
## create Makefile, requirements.txt, test.py: touch Makefileg
# make install, make setup, make test ...

##jupyter
##run: jupyter notebook
##go to: http://localhost:8888 

create-env:
	# Create a virtual environment
	python3 -m venv ~/.DSPy


activate-env:
	 # Activate the virtual environment
	 source ~/.DSPy/bin/activate
	
install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=cli --cov=mlib --cov=utilscli --cov=app test.py

#format:
#	black *.py

lint:
	pylint --disable=R,C test.py
	#lint Dockerfile
	#docker run --rm -i hadolint/hadolint < Dockerfile

#deploy:
	#push to ECR for deploy
#	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 561744971673.dkr.ecr.us-east-1.amazonaws.com
#	docker build -t mlops .
#	docker tag mlops:latest 561744971673.dkr.ecr.us-east-1.amazonaws.com/mlops:latest
#	docker push 561744971673.dkr.ecr.us-east-1.amazonaws.com/mlops:latest
	
#all: install lint test format deploy