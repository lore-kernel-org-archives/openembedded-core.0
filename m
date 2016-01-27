Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 5A93D77145
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 14:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 9CD122E09F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:39:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id G03myZw52XXf
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:39:54 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 687082E1A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:39:54 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 50F5E1581
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:39:54 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 40855157E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:39:54 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 3ECD034279
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:39:54 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u0REdsW9021423
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:39:54 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u0REdsPh021419
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jan 2016 15:39:54 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 15:39:52 +0100
Message-Id: <36978e6037b5ca927cd53bcfc9f5210a5561aa4b.1453905512.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1453905512.git.pkj@axis.com>
References: <cover.1453905512.git.pkj@axis.com>
In-Reply-To: <cover.1453905512.git.pkj@axis.com>
References: <cover.1453905512.git.pkj@axis.com>
Subject: [master, jethro][PATCH 1/1] lib/oe/patch: Make GitApplyTree._applypatch() support read-only .git/hooks
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
X-List-Received-Date: Wed, 27 Jan 2016 14:40:01 -0000

Rather than modifying files in .git/hooks, which can be read-only
(e.g., if it is a link to a directory in /usr/share), move away the
entire .git/hooks directory temporarily.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/patch.py | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 2255ce4..4e77168 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -411,14 +411,15 @@ class GitApplyTree(PatchTree):
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
@@ -467,12 +468,9 @@ class GitApplyTree(PatchTree):
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
2.1.0


