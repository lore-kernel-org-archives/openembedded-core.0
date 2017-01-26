Return-Path: <gizero@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1218671997
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 23:35:03 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id c85so94170434wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 15:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nmehY/p9lwgMZeKdcl/Il02P/BTRS/dr1upsBWMMZZI=;
	b=IIQa8j37I5I/ZPLwunTfgvSYZuI6xNY9duWbfK2+m21rdru4cjsrAHOGd1vFwcFVFP
	BsNltRaJNfLjfsN1lP3qPDx89ch+7lVW5hdi1GPHyl0LNKDGnXJFAIukxTbizuq7CQrl
	BNVuGrHZyV1sDQFmfFze2OVWXJd8rYBYKlbkVY0O73AfQQ6uLGjTgtKggkXYiSPr6VnW
	hvFA+XESTpZFf3hlzzvoCzsupVMST85q9EII0D0b6ct88ECj201kED+9NlkYyHzgHmQN
	jHPQ6eqjQRAjqbqLKtYKT/CaKJDQcbUFYjt6+wo4erpVY1jwJc4CKpsv/caecadYDhaY
	gG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nmehY/p9lwgMZeKdcl/Il02P/BTRS/dr1upsBWMMZZI=;
	b=gz/+tO7lTqXKi67alLgvPtKV59s2znxwCnLCe/x4gAoEZXTUcpffmEjg6zbDgks6iT
	yguJpRT50rQL2uKfyVC22t7D5NgwoeRtX2JHpNYpAB4uOmXTjTgr0AB9Ji33B+hawgEl
	+ULZdxCU9YbIFvZyaiygt+40jCPDEYQzLLJNtkOERJQ3+mVaulGqsZamv9th3XPhETUG
	6T/w0b5r1tk6j6gOGS/DIPbj3Q6dis8dRXL2UPqdIMNbu1bayrJxEkt5CjdV7+1Un34d
	TlENLhcQk9D68OGYp/QtVisl+N1rTZ7p5xnaV24VWZPLj1CH5rW97M0NOunePzAP6r65
	lcIw==
X-Gm-Message-State: AIkVDXKy9nH6U+Z4a7cdbaofqpLJp/S1d7jcm05i6jNwMPKEfncAPObUfIAbsukQ2UYBBA==
X-Received: by 10.28.23.70 with SMTP id 67mr609549wmx.23.1485473703790;
	Thu, 26 Jan 2017 15:35:03 -0800 (PST)
Received: from gizero-desktop.tw.it
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by smtp.gmail.com with ESMTPSA id i73sm879948wmd.11.2017.01.26.15.35.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jan 2017 15:35:03 -0800 (PST)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 00:34:55 +0100
Message-Id: <1485473695-2239-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] oe-publish-sdk: add pyshtables.py to .gitignore
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jan 2017 23:35:05 -0000

pyshtables.py should be ignored by git as it is generated. If kept in
the repo, causes subsequent runs of sdk-update to fail.

[ YOCTO #10963 ]

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
Changes in v2:
- don't hardcode pyshtables.py path in .gitconfig
---
 scripts/oe-publish-sdk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index 4fe8974..9f7963c 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -114,9 +114,9 @@ def publish(args):
 
     # Setting up the git repo
     if not is_remote:
-        cmd = 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; echo "*.pyc\n*.pyo" > .gitignore; fi; git add -A .; git config user.email "oe@oe.oe" && git config user.name "OE" && git commit -q -m "init repo" || true; git update-server-info' % (destination, destination)
+        cmd = 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; echo "*.pyc\n*.pyo\npyshtables.py" > .gitignore; fi; git add -A .; git config user.email "oe@oe.oe" && git config user.name "OE" && git commit -q -m "init repo" || true; git update-server-info' % (destination, destination)
     else:
-        cmd = "ssh %s 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; echo '*.pyc\n*.pyo' > .gitignore; fi; git add -A .; git config user.email 'oe@oe.oe' && git config user.name 'OE' && git commit -q -m \"init repo\" || true; git update-server-info'" % (host, destdir, destdir)
+        cmd = "ssh %s 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; echo '*.pyc\n*.pyo\npyshtables.py' > .gitignore; fi; git add -A .; git config user.email 'oe@oe.oe' && git config user.name 'OE' && git commit -q -m \"init repo\" || true; git update-server-info'" % (host, destdir, destdir)
     ret = subprocess.call(cmd, shell=True)
     if ret == 0:
         logger.info('SDK published successfully')
-- 
2.7.4


