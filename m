Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 882AA7391B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 14:19:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2015 07:17:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,409,1422950400"; d="scan'208";a="680778166"
Received: from sgconnee-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.217])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2015 07:19:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 14:18:51 +0000
Message-Id: <0624c04986c4d62a7a982d4442a3a017c5ee12a4.1426515313.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/16] devtool: modify/extract: prevent usage with incompatible recipes
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
X-List-Received-Date: Mon, 16 Mar 2015 14:19:12 -0000

Consolidate code for checking compatible recipes and consider meta and
packagegroup recipes as well as package-index and gcc-source to be
incompatible.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 24 ++++++++++++++++++++
 scripts/lib/devtool/standard.py   | 48 ++++++++++++++++++++++++++++-----------
 2 files changed, 59 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index a8c339a..2574e4b 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -227,6 +227,30 @@ class DevtoolTests(oeSelfTest):
         matches = glob.glob(stampprefix + '*')
         self.assertFalse(matches, 'Stamp files exist for recipe mdadm that should have been cleaned')
 
+    def test_devtool_modify_invalid(self):
+        # Check preconditions
+        workspacedir = os.path.join(self.builddir, 'workspace')
+        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        # Try modifying some recipes
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+
+        testrecipes = 'perf gcc-source kernel-devsrc package-index core-image-minimal meta-toolchain packagegroup-core-sdk meta-ide-support'.split()
+        for testrecipe in testrecipes:
+            # Check it's a valid recipe
+            bitbake('%s -e' % testrecipe)
+            # devtool extract should fail
+            result = runCmd('devtool extract %s %s' % (testrecipe, os.path.join(tempdir, testrecipe)), ignore_status=True)
+            self.assertNotEqual(result.status, 0, 'devtool extract on %s should have failed' % testrecipe)
+            self.assertNotIn('Fetching ', result.output, 'devtool extract on %s should have errored out before trying to fetch' % testrecipe)
+            self.assertIn('ERROR: ', result.output, 'devtool extract on %s should have given an ERROR' % testrecipe)
+            # devtool modify should fail
+            result = runCmd('devtool modify %s -x %s' % (testrecipe, os.path.join(tempdir, testrecipe)), ignore_status=True)
+            self.assertNotEqual(result.status, 0, 'devtool modify on %s should have failed' % testrecipe)
+            self.assertIn('ERROR: ', result.output, 'devtool modify on %s should have given an ERROR' % testrecipe)
+
     def test_devtool_modify_git(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index f9369ee..54920b2 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -87,6 +87,38 @@ def add(args, config, basepath, workspace):
     return 0
 
 
+def _check_compatible_recipe(pn, d):
+    if pn == 'perf':
+        logger.error("The perf recipe does not actually check out source and thus cannot be supported by this tool")
+        return False
+
+    if pn in ['gcc-source', 'kernel-devsrc', 'package-index']:
+        logger.error("The %s recipe is not supported by this tool" % pn)
+        return False
+
+    if bb.data.inherits_class('image', d):
+        logger.error("The %s recipe is an image, and therefore is not supported by this tool" % pn)
+        return False
+
+    if bb.data.inherits_class('populate_sdk', d):
+        logger.error("The %s recipe is an SDK, and therefore is not supported by this tool" % pn)
+        return False
+
+    if bb.data.inherits_class('packagegroup', d):
+        logger.error("The %s recipe is a packagegroup, and therefore is not supported by this tool" % pn)
+        return False
+
+    if bb.data.inherits_class('meta', d):
+        logger.error("The %s recipe is a meta-recipe, and therefore is not supported by this tool" % pn)
+        return False
+
+    if bb.data.inherits_class('externalsrc', d) and d.getVar('EXTERNALSRC', True):
+        logger.error("externalsrc is currently enabled for the %s recipe. This prevents the normal do_patch task from working. You will need to disable this first." % pn)
+        return False
+
+    return True
+
+
 def _get_recipe_file(cooker, pn):
     import oe.recipeutils
     recipefile = oe.recipeutils.pn_to_recipe(cooker, pn)
@@ -133,16 +165,7 @@ def _extract_source(srctree, keep_temp, devbranch, d):
 
     pn = d.getVar('PN', True)
 
-    if pn == 'perf':
-        logger.error("The perf recipe does not actually check out source and thus cannot be supported by this tool")
-        return None
-
-    if bb.data.inherits_class('image', d):
-        logger.error("The %s recipe is an image, and therefore is not supported by this tool" % pn)
-        return None
-
-    if bb.data.inherits_class('externalsrc', d) and d.getVar('EXTERNALSRC', True):
-        logger.error("externalsrc is currently enabled for the %s recipe. This prevents the normal do_patch task from working. You will need to disable this first." % pn)
+    if not _check_compatible_recipe(pn, d):
         return None
 
     if os.path.exists(srctree):
@@ -310,9 +333,8 @@ def modify(args, config, basepath, workspace):
         return -1
     rd = oe.recipeutils.parse_recipe(recipefile, tinfoil.config_data)
 
-    if bb.data.inherits_class('image', rd):
-        logger.error("The %s recipe is an image, and therefore is not supported by this tool" % args.recipename)
-        return None
+    if not _check_compatible_recipe(args.recipename, rd):
+        return -1
 
     initial_rev = None
     commits = []
-- 
1.9.3


