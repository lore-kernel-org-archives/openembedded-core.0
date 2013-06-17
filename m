Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 35B2F6098F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 13:46:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jun 2013 06:46:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,881,1363158000"; d="scan'208";a="354729765"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.47])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2013 06:46:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2013 14:46:03 +0100
Message-Id: <1371476763-31156-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] classes/externalsrc: enable global inherit and simplify usage
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
X-List-Received-Date: Mon, 17 Jun 2013 13:46:42 -0000

This class can now be inherited globally using INHERIT += rather than
needing to inherit it in the recipe itself. Additionally, instead of
setting S (and optionally B), set EXTERNALSRC (and optionally
EXTERNALSRC_BUILD) to point to the external source and build locations
respectively.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 51 ++++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 18 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 7e00ef8..c759289 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -8,18 +8,23 @@
 # the build system to build a piece of software rather than the usual fetch/unpack/patch
 # process.
 #
-# To use, set S to point at the directory you want to use containing the sources
-# e.g. S = "/path/to/my/source/tree"
+# To use, add externalsrc to the global inherit and set EXTERNALSRC to point at the
+# directory you want to use containing the sources e.g. from local.conf for a recipe
+# called "myrecipe" you would do:
 #
-# If the class is to work for both target and native versions (or with multilibs/
-# cross or other BBCLASSEXTEND variants), its expected that setting B to point to 
-# where to place the compiled binaries will work (split source and build directories).
-# This is the default but B can be set to S if circumstaces dictate.
+# INHERIT += "externalsrc"
+# EXTERNALSRC_pn-myrecipe = "/path/to/my/source/tree"
+#
+# In order to make this class work for both target and native versions (or with
+# multilibs/cross or other BBCLASSEXTEND variants), B is set to point to a separate
+# directory under the work directory (split source and build directories). This is
+# the default, but the build directory can be set to the source directory if
+# circumstances dictate by setting EXTERNALSRC_BUILD to the same value, e.g.:
+#
+# EXTERNALSRC_BUILD_pn-myrecipe = "/path/to/my/source/tree"
 #
 
-SRC_URI = ""
 SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
-B = "${WORKDIR}/${BPN}-${PV}/"
 
 def remove_tasks(tasks, deltasks, d):
     for task in tasks:
@@ -37,17 +42,27 @@ def remove_tasks(tasks, deltasks, d):
     d.setVar('__BBTASKS', tasklist)
 
 python () {
-    tasks = filter(lambda k: d.getVarFlag(k, "task"), d.keys())
-    covered = d.getVar("SRCTREECOVEREDTASKS", True).split()
-
-    for task in tasks:
-        if task.endswith("_setscene"):
-            # sstate is never going to work for external source trees, disable it
-            covered.append(task)
+    externalsrc = d.getVar('EXTERNALSRC', True)
+    if externalsrc:
+        d.setVar('S', externalsrc)
+        externalsrcbuild = d.getVar('EXTERNALSRC_BUILD', True)
+        if externalsrcbuild:
+            d.setVar('B', externalsrcbuild)
         else:
-            # Since configure will likely touch ${S}, ensure only we lock so one task has access at a time
-            d.appendVarFlag(task, "lockfiles", "${S}/singletask.lock")
+            d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
+        d.setVar('SRC_URI', '')
+
+        tasks = filter(lambda k: d.getVarFlag(k, "task"), d.keys())
+        covered = d.getVar("SRCTREECOVEREDTASKS", True).split()
+
+        for task in tasks:
+            if task.endswith("_setscene"):
+                # sstate is never going to work for external source trees, disable it
+                covered.append(task)
+            else:
+                # Since configure will likely touch ${S}, ensure only we lock so one task has access at a time
+                d.appendVarFlag(task, "lockfiles", "${S}/singletask.lock")
 
-    remove_tasks(tasks, covered, d)
+        remove_tasks(tasks, covered, d)
 }
 
-- 
1.8.1.2


