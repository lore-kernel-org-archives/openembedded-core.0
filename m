Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 690BD738AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 07:24:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBE7Of9t004939
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 23:24:41 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Dec 2016 23:24:39 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2016 23:24:32 -0800
Message-ID: <5c102012f81a3d26f7f81454dd17f78217faa4cc.1481700149.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1481700149.git.liezhi.yang@windriver.com>
References: <cover.1481700149.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 4/8] oe-publish-sdk: make cmd easier to read
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
X-List-Received-Date: Wed, 14 Dec 2016 07:24:39 -0000
Content-Type: text/plain

The command was too long to read and maintain.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/oe-publish-sdk | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index 4fe8974..d95c623 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -113,10 +113,25 @@ def publish(args):
             return ret
 
     # Setting up the git repo
+    cmd_common = "if [ ! -e .git ]; then"
+    cmd_common += "    git init .;"
+    cmd_common += "    mv .git/hooks/post-update.sample .git/hooks/post-update;"
+    cmd_common += "    echo '*.pyc\n*.pyo' > .gitignore;"
+    cmd_common += "fi;"
+    cmd_common += "git add -A .;"
+    cmd_common += "git config user.email 'oe@oe.oe' && git config user.name 'OE' && git commit -q -m 'init repo' || true;"
     if not is_remote:
-        cmd = 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; echo "*.pyc\n*.pyo" > .gitignore; fi; git add -A .; git config user.email "oe@oe.oe" && git config user.name "OE" && git commit -q -m "init repo" || true; git update-server-info' % (destination, destination)
+        cmd = "set -e;"
+        cmd += "mkdir -p %s/layers;" % destination
+        cmd += "cd %s/layers;" % destination
+        cmd += cmd_common
+        cmd += "git update-server-info"
     else:
-        cmd = "ssh %s 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; echo '*.pyc\n*.pyo' > .gitignore; fi; git add -A .; git config user.email 'oe@oe.oe' && git config user.name 'OE' && git commit -q -m \"init repo\" || true; git update-server-info'" % (host, destdir, destdir)
+        cmd = "ssh %s 'set -e;" % host
+        cmd += "mkdir -p %s/layers;" % destdir
+        cmd += "cd %s/layers;" % destdir
+        cmd += cmd_common
+        cmd += "git update-server-info'"
     ret = subprocess.call(cmd, shell=True)
     if ret == 0:
         logger.info('SDK published successfully')
-- 
2.10.2


