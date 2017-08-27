Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EE3EB60721
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Aug 2017 08:33:38 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7R8XadK031823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 27 Aug 2017 09:33:37 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dlt0i-0000wW-KY; Sun, 27 Aug 2017 09:33:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Aug 2017 09:33:35 +0100
Message-Id: <1503822815-3586-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sun, 27 Aug 2017 09:33:37 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] staging: Ensure dependencies are removed before being added
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
X-List-Received-Date: Sun, 27 Aug 2017 08:33:39 -0000

Currently items are added to the sysroot, the obsolete items are removed. If
a change such as pkgconfig -> pkgconf is made, this leads to conflicts of
overlapping files in the sysroot.

In order to better support this, handle removing items before adding them.
This requires some minor refactoring to construct the installed list
before the main function loop, otherwise there are no changes in this
patch other than reordering the operations.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 77 ++++++++++++++++++++++----------------------
 1 file changed, 39 insertions(+), 38 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 8b833d3..eb06f39 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -389,8 +389,6 @@ python extend_recipe_sysroot() {
     multilibs = {}
     manifests = {}
 
-    installed = []
-
     for f in os.listdir(depdir):
         if not f.endswith(".complete"):
             continue
@@ -402,16 +400,52 @@ python extend_recipe_sysroot() {
             os.unlink(f)
             os.unlink(f.replace(".complete", ""))
 
+    installed = []
     for dep in configuredeps:
         c = setscenedeps[dep][0]
-        taskhash = setscenedeps[dep][5]
-        taskmanifest = depdir + "/" + c + "." + taskhash
         if mytaskname in ["do_sdk_depends", "do_populate_sdk_ext"] and c.endswith("-initial"):
             bb.note("Skipping initial setscene dependency %s for installation into the sysroot" % c)
             continue
-
         installed.append(c)
 
+    # We want to remove anything which this task previously installed but is no longer a dependency
+    taskindex = depdir + "/" + "index." + mytaskname
+    if os.path.exists(taskindex):
+        potential = []
+        with open(taskindex, "r") as f:
+            for l in f:
+                l = l.strip()
+                if l not in installed:
+                    l = depdir + "/" + l
+                    if not os.path.exists(l):
+                        # Was likely already uninstalled
+                        continue
+                    potential.append(l)
+        # We need to ensure not other task needs this dependency. We hold the sysroot
+        # lock so we ca search the indexes to check
+        if potential:
+            for i in glob.glob(depdir + "/index.*"):
+                if i.endswith("." + mytaskname):
+                    continue
+                with open(i, "r") as f:
+                    for l in f:
+                        l = l.strip()
+                        if l in potential:
+                            potential.remove(l)
+        for l in potential:
+            bb.note("Task %s no longer depends on %s, removing from sysroot" % (mytaskname, l))
+            lnk = os.readlink(l)
+            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
+            os.unlink(l)
+            os.unlink(l + ".complete")
+
+    for dep in configuredeps:
+        c = setscenedeps[dep][0]
+        if c not in installed:
+            continue
+        taskhash = setscenedeps[dep][5]
+        taskmanifest = depdir + "/" + c + "." + taskhash
+
         if os.path.exists(depdir + "/" + c):
             lnk = os.readlink(depdir + "/" + c)
             if lnk == c + "." + taskhash and os.path.exists(depdir + "/" + c + ".complete"):
@@ -526,39 +560,6 @@ python extend_recipe_sysroot() {
         c = setscenedeps[dep][0]
         os.symlink(manifests[dep], depdir + "/" + c + ".complete")
 
-    # We want to remove anything which this task previously installed but is no longer a dependency
-    # This could potentially race against another task which also installed it but still requires it
-    # but the alternative is not doing anything at all and that race window should be small enough
-    # to be insignificant
-    taskindex = depdir + "/" + "index." + mytaskname
-    if os.path.exists(taskindex):
-        potential = []
-        with open(taskindex, "r") as f:
-            for l in f:
-                l = l.strip()
-                if l not in installed:
-                    l = depdir + "/" + l
-                    if not os.path.exists(l):
-                        # Was likely already uninstalled
-                        continue
-                    potential.append(l)
-        # We need to ensure not other task needs this dependency. We hold the sysroot
-        # lock so we ca search the indexes to check
-        if potential:
-            for i in glob.glob(depdir + "/index.*"):
-                if i.endswith("." + mytaskname):
-                    continue
-                with open(i, "r") as f:
-                    for l in f:
-                        l = l.strip()
-                        if l in potential:
-                            potential.remove(l)
-        for l in potential:
-            bb.note("Task %s no longer depends on %s, removing from sysroot" % (mytaskname, l))
-            lnk = os.readlink(l)
-            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
-            os.unlink(l)
-            os.unlink(l + ".complete")
     with open(taskindex, "w") as f:
         for l in sorted(installed):
             f.write(l + "\n")
-- 
2.7.4


