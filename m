Return-Path: <gizero@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id A551C78509
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 09:19:44 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g32so13754309wrd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 02:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pyS71x0pwpTDJj33nQ5jaZFKsyiGufgfq16SAjlQU3s=;
	b=Q0a+aWwUTbHMrogkZidEByhchr/yybKewtqofdrrqnE17/EGc7xZEkVjklzXaMbm/u
	4Jlixzcs9ZvpCL3JZbMtXLM3DGqlB2TgBIv8X6KjoHMzhfa9rTZHQ5mcB+8ZKXj/samZ
	iIJOrmAwBeMLmyLRz6TNXR3jyRb2hXo0hyrQoUJn3BJDM2om/GzXCAGTjWXp4OSMl7sS
	7cwelhTqSPNO5+9haCFJPLMawgcYsjN9STCYJ9lwTwvdEVEB+SfVQvl4uokaDn4N/FIi
	71JedxCZOfiSYztdltQ2IjKdLDnzR/qWJPC5E4J/331975n/sI1q9Mbb0DBbPYGKuApA
	7i2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pyS71x0pwpTDJj33nQ5jaZFKsyiGufgfq16SAjlQU3s=;
	b=V0FhEJmgGwCfaW5fdN6r56hHqgSt6LXfpd56o0MuEbzodS4i1K80a56Pgvpss7/+M1
	8jREOcZ2AFt9W8bBhWHPh4OKXiSltkj3NgPRLZ9Njy5+byTMDstEQgfKnfyg+/L9Z+1e
	wowz6JRFzdKexBot/6OthRrwa6xomXckOLhyL5+mHh/luLM31C/IAzfneeX6AGHuUU8U
	W26Wr20oThKq4TsmsG9mbr6V/gOFrrchW4KEXlHXQCDt0xFxGMOM/7mX//SDsaGzUE7V
	w4p9GrcH+CYAqUev9BGB8UrjXtsM4b9sMcsblx9BvYrv4OXI1dnNsvGYMCiKpAyiFBTg
	mc7A==
X-Gm-Message-State: AIVw110q1k0aair33cWDsqny9rEPZBAjCEziz/RMhEKiu5yPylCm4J9d
	eWZuoSdtASUlnfI6
X-Received: by 10.223.163.16 with SMTP id c16mr13033509wrb.173.1501492784798; 
	Mon, 31 Jul 2017 02:19:44 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host193-245-static.58-79-b.business.telecomitalia.it.
	[79.58.245.193]) by smtp.gmail.com with ESMTPSA id
	l25sm2914103wrb.44.2017.07.31.02.19.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Jul 2017 02:19:44 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 11:19:18 +0200
Message-Id: <1501492758-29076-2-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501492758-29076-1-git-send-email-gizero@gmail.com>
References: <1501492758-29076-1-git-send-email-gizero@gmail.com>
Subject: [PATCH 2/2] scripts/oe-publish-sdk: use hook to call git update-server-info
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
X-List-Received-Date: Mon, 31 Jul 2017 09:19:44 -0000

The author's initial intent was to use a git hook to automatically call
update-server-info, but the wrong hook type was chosen (post-update). A
post-commit one will do the job, hence allowing to drop the explicit call to
update-server-info.

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 scripts/oe-publish-sdk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index 9f7963c..ee33acf 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -114,9 +114,9 @@ def publish(args):
 
     # Setting up the git repo
     if not is_remote:
-        cmd = 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; echo "*.pyc\n*.pyo\npyshtables.py" > .gitignore; fi; git add -A .; git config user.email "oe@oe.oe" && git config user.name "OE" && git commit -q -m "init repo" || true; git update-server-info' % (destination, destination)
+        cmd = 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; cp .git/hooks/post-update.sample .git/hooks/post-commit; echo "*.pyc\n*.pyo\npyshtables.py" > .gitignore; fi; git add -A .; git config user.email "oe@oe.oe" && git config user.name "OE" && git commit -q -m "init repo" || true' % (destination, destination)
     else:
-        cmd = "ssh %s 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; echo '*.pyc\n*.pyo\npyshtables.py' > .gitignore; fi; git add -A .; git config user.email 'oe@oe.oe' && git config user.name 'OE' && git commit -q -m \"init repo\" || true; git update-server-info'" % (host, destdir, destdir)
+        cmd = "ssh %s 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; cp .git/hooks/post-update.sample .git/hooks/post-commit; echo '*.pyc\n*.pyo\npyshtables.py' > .gitignore; fi; git add -A .; git config user.email 'oe@oe.oe' && git config user.name 'OE' && git commit -q -m \"init repo\" || true'" % (host, destdir, destdir)
     ret = subprocess.call(cmd, shell=True)
     if ret == 0:
         logger.info('SDK published successfully')
-- 
2.7.4


