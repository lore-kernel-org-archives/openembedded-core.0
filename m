Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A0E5D601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 06:51:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2E6pqRR024163
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 23:51:52 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 13 Mar 2016 23:51:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Mar 2016 23:51:48 -0700
Message-ID: <c21121846c197c1c78481145dec55b604d96e29b.1457938004.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1457938004.git.liezhi.yang@windriver.com>
References: <cover.1457938004.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] lib/oe/patch: Make GitApplyTree._applypatch() support read-only .git/hooks
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
X-List-Received-Date: Mon, 14 Mar 2016 06:51:53 -0000
Content-Type: text/plain

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Rather than modifying files in .git/hooks, which can be read-only
(e.g., if it is a link to a directory in /usr/share), move away the
entire .git/hooks directory temporarily.

(From OE-Core master rev: a88d603b51a9ebb39210d54b667519acfbe465c3)

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/patch.py |   26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 2bf501e..c25d3c7 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -383,14 +383,15 @@ class GitApplyTree(PatchTree):
         reporoot = (runcmd("git rev-parse --show-toplevel".split(), self.dir) or '').strip()
         if not reporoot:
             raise Exception("Cannot get repository root for directory %s" % self.dir)
-        commithook = os.path.join(reporoot, '.git', 'hooks', 'commit-msg')
-        commithook_backup = commithook + '.devtool-orig'
-        applyhook = os.path.join(reporoot, '.git', 'hooks', 'applypatch-msg')
-        applyhook_backup = applyhook + '.devtool-orig'
-        if os.path.exists(commithook):
-            shutil.move(commithook, commithook_backup)
-        if os.path.exists(applyhook):
-            shutil.move(applyhook, applyhook_backup)
+        hooks_dir = os.path.join(reporoot, '.git', 'hooks')
+        hooks_dir_backup = hooks_dir + '.devtool-orig'
+        if os.path.lexists(hooks_dir_backup):
+            raise Exception("Git hooks backup directory already exists: %s" % hooks_dir_backup)
+        if os.path.lexists(hooks_dir):
+            shutil.move(hooks_dir, hooks_dir_backup)
+        os.mkdir(hooks_dir)
+        commithook = os.path.join(hooks_dir, 'commit-msg')
+        applyhook = os.path.join(hooks_dir, 'applypatch-msg')
         with open(commithook, 'w') as f:
             # NOTE: the formatting here is significant; if you change it you'll also need to
             # change other places which read it back
@@ -439,12 +440,9 @@ class GitApplyTree(PatchTree):
                     os.remove(tmpfile)
                 return output
         finally:
-            os.remove(commithook)
-            os.remove(applyhook)
-            if os.path.exists(commithook_backup):
-                shutil.move(commithook_backup, commithook)
-            if os.path.exists(applyhook_backup):
-                shutil.move(applyhook_backup, applyhook)
+            shutil.rmtree(hooks_dir)
+            if os.path.lexists(hooks_dir_backup):
+                shutil.move(hooks_dir_backup, hooks_dir)
 
 
 class QuiltTree(PatchSet):
-- 
1.7.9.5


