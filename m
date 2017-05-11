Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3DEC273002
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 16:13:13 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4BGDDqo000494
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 11 May 2017 17:13:14 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1d8qiH-0006Rq-DJ; Thu, 11 May 2017 17:13:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 May 2017 17:13:07 +0100
Message-Id: <1494519187-24730-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494519187-24730-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1494519187-24730-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 11 May 2017 17:13:14 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 4/4] staging: Allow BB_LIMITEDDEPS to avoid BB_TASKDEPDATA
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
X-List-Received-Date: Thu, 11 May 2017 16:13:14 -0000

In the limited dependency case we don't use any of the data from
BB_TASKDEPDATA. Restructure the code so this variable doesn't have
to be set. This allows the function to be called from other contexts
without creating artificial constructs. There should be no functional
change, behaviour remains unchanged.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 565638f..9c26794 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -331,12 +331,26 @@ python extend_recipe_sysroot() {
 
     taskdepdata = d.getVar("BB_TASKDEPDATA", False)
     mytaskname = d.getVar("BB_RUNTASK")
+    if mytaskname.endswith("_setscene"):
+        mytaskname = mytaskname.replace("_setscene", "")
     workdir = d.getVar("WORKDIR")
     #bb.warn(str(taskdepdata))
     pn = d.getVar("PN")
 
-    if mytaskname.endswith("_setscene"):
-        mytaskname = mytaskname.replace("_setscene", "")
+    stagingdir = d.getVar("STAGING_DIR")
+    sharedmanifests = d.getVar("COMPONENTS_DIR") + "/manifests"
+    recipesysroot = d.getVar("RECIPE_SYSROOT")
+    recipesysrootnative = d.getVar("RECIPE_SYSROOT_NATIVE")
+    current_variant = d.getVar("BBEXTENDVARIANT")
+
+    # Detect bitbake -b usage
+    nodeps = d.getVar("BB_LIMITEDDEPS") or False
+    if nodeps:
+        lock = bb.utils.lockfile(recipesysroot + "/sysroot.lock")
+        staging_populate_sysroot_dir(recipesysroot, recipesysrootnative, True, d)
+        staging_populate_sysroot_dir(recipesysroot, recipesysrootnative, False, d)
+        bb.utils.unlockfile(lock)
+        return
 
     start = None
     configuredeps = []
@@ -441,20 +455,6 @@ python extend_recipe_sysroot() {
 
     bb.note("\n".join(msgbuf))
 
-    stagingdir = d.getVar("STAGING_DIR")
-    sharedmanifests = d.getVar("COMPONENTS_DIR") + "/manifests"
-    recipesysroot = d.getVar("RECIPE_SYSROOT")
-    recipesysrootnative = d.getVar("RECIPE_SYSROOT_NATIVE")
-    current_variant = d.getVar("BBEXTENDVARIANT")
-
-    # Detect bitbake -b usage
-    nodeps = d.getVar("BB_LIMITEDDEPS") or False
-    if nodeps:
-        lock = bb.utils.lockfile(recipesysroot + "/sysroot.lock")
-        staging_populate_sysroot_dir(recipesysroot, recipesysrootnative, True, d)
-        staging_populate_sysroot_dir(recipesysroot, recipesysrootnative, False, d)
-        bb.utils.unlockfile(lock)
-
     depdir = recipesysrootnative + "/installeddeps"
     bb.utils.mkdirhier(depdir)
     bb.utils.mkdirhier(sharedmanifests)
-- 
2.7.4


