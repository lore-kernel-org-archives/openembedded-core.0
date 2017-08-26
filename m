Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 70F5478200
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Aug 2017 22:35:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7QMZ5RA012468
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 26 Aug 2017 23:35:06 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dljfV-0007n5-LM; Sat, 26 Aug 2017 23:35:05 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 26 Aug 2017 23:35:04 +0100
Message-Id: <1503786904-29908-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sat, 26 Aug 2017 23:35:06 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] staging: Avoid sysroot removal races
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
X-List-Received-Date: Sat, 26 Aug 2017 22:35:07 -0000

Currently a task could remove a dependency needed by another task leading
to build failures, often due to missing dependencies (e.g. dynamic libraries
not being found). This was often seen for all-arch recipes in package_write_rpm.

When removing a dependency, first check that no other task active for the
recipe has that same dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 9d3d2ad..8b833d3 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -247,6 +247,7 @@ python extend_recipe_sysroot() {
     import subprocess
     import errno
     import collections
+    import glob
 
     taskdepdata = d.getVar("BB_TASKDEPDATA", False)
     mytaskname = d.getVar("BB_RUNTASK")
@@ -531,6 +532,7 @@ python extend_recipe_sysroot() {
     # to be insignificant
     taskindex = depdir + "/" + "index." + mytaskname
     if os.path.exists(taskindex):
+        potential = []
         with open(taskindex, "r") as f:
             for l in f:
                 l = l.strip()
@@ -539,11 +541,24 @@ python extend_recipe_sysroot() {
                     if not os.path.exists(l):
                         # Was likely already uninstalled
                         continue
-                    bb.note("Task %s no longer depends on %s, removing from sysroot" % (mytaskname, l))
-                    lnk = os.readlink(l)
-                    sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
-                    os.unlink(l)
-                    os.unlink(l + ".complete")
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
     with open(taskindex, "w") as f:
         for l in sorted(installed):
             f.write(l + "\n")
-- 
2.7.4


