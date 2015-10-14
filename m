Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BA107770E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 20:27:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Oct 2015 13:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,682,1437462000"; d="scan'208";a="826791032"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.25.92])
	by orsmga002.jf.intel.com with ESMTP; 14 Oct 2015 13:27:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 21:27:26 +0100
Message-Id: <10890ee2b661e2649f01f63c5da5a3450f991461.1444854425.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1444854425.git.paul.eggleton@linux.intel.com>
References: <cover.1444854425.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1444854425.git.paul.eggleton@linux.intel.com>
References: <cover.1444854425.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] devtool: handle virtual providers
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
X-List-Received-Date: Wed, 14 Oct 2015 20:27:34 -0000

For modify / extract / upgrade, if the specified "recipe" is not
actually a recipe but a virtual target such as virtual/kernel, map it
correctly to the actual recipe and make sure we use that name within the
workspace. Thanks to Chris Larson for reminding me this was still broken
and for a hint on how to fix it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py        |  6 +++++-
 meta/lib/oeqa/selftest/devtool.py | 32 ++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py   | 24 ++++++++++++++++++------
 scripts/lib/devtool/upgrade.py    | 12 +++++++++---
 4 files changed, 64 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 207c300..119a688 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -31,9 +31,13 @@ def pn_to_recipe(cooker, pn):
     import bb.providers
 
     if pn in cooker.recipecache.pkg_pn:
-        filenames = cooker.recipecache.pkg_pn[pn]
         best = bb.providers.findBestProvider(pn, cooker.data, cooker.recipecache, cooker.recipecache.pkg_pn)
         return best[3]
+    elif pn in cooker.recipecache.providers:
+        filenames = cooker.recipecache.providers[pn]
+        eligible, foundUnique = bb.providers.filterProviders(filenames, pn, cooker.expanded_data, cooker.recipecache)
+        filename = eligible[0]
+        return filename
     else:
         return None
 
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index baa56d6..e4de309 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -466,6 +466,28 @@ class DevtoolTests(DevtoolBase):
         # Try building
         bitbake(testrecipe)
 
+    def test_devtool_modify_virtual(self):
+        # Try modifying a virtual recipe
+        virtrecipe = 'virtual/libx11'
+        realrecipe = 'libx11'
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool modify %s -x %s' % (virtrecipe, tempdir))
+        self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile.am')), 'Extracted source could not be found')
+        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
+        matches = glob.glob(os.path.join(self.workspacedir, 'appends', '%s_*.bbappend' % realrecipe))
+        self.assertTrue(matches, 'bbappend not created %s' % result.output)
+        # Test devtool status
+        result = runCmd('devtool status')
+        self.assertNotIn(virtrecipe, result.output)
+        self.assertIn(realrecipe, result.output)
+        # Check git repo
+        self._check_src_repo(tempdir)
+        # This is probably sufficient
+
+
     @testcase(1169)
     def test_devtool_update_recipe(self):
         # Check preconditions
@@ -805,6 +827,16 @@ class DevtoolTests(DevtoolBase):
         self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile.am')), 'Extracted source could not be found')
         self._check_src_repo(tempdir)
 
+    def test_devtool_extract_virtual(self):
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        # Try devtool extract
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool extract virtual/libx11 %s' % tempdir)
+        self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile.am')), 'Extracted source could not be found')
+        self._check_src_repo(tempdir)
+
     @testcase(1168)
     def test_devtool_reset_all(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 5d7e903..1285974 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -45,6 +45,10 @@ def add(args, config, basepath, workspace):
     if reason:
         raise DevtoolError(reason)
 
+    # FIXME this ought to be in validate_pn but we're using that in other contexts
+    if '/' in args.recipename:
+        raise DevtoolError('"/" is not a valid character in recipe names')
+
     srctree = os.path.abspath(args.srctree)
     if os.path.exists(srctree):
         if args.fetch:
@@ -514,6 +518,14 @@ def modify(args, config, basepath, workspace):
     rd = parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
         return 1
+
+    pn = rd.getVar('PN', True)
+    if pn != args.recipename:
+        logger.info('Mapping %s to %s' % (args.recipename, pn))
+    if pn in workspace:
+        raise DevtoolError("recipe %s is already in your workspace" %
+                           pn)
+
     recipefile = rd.getVar('FILE', True)
     appendname = os.path.splitext(os.path.basename(recipefile))[0]
     if args.wildcard:
@@ -524,9 +536,9 @@ def modify(args, config, basepath, workspace):
         raise DevtoolError("Another variant of recipe %s is already in your "
                            "workspace (only one variant of a recipe can "
                            "currently be worked on at once)"
-                           % args.recipename)
+                           % pn)
 
-    _check_compatible_recipe(args.recipename, rd)
+    _check_compatible_recipe(pn, rd)
 
     initial_rev = None
     commits = []
@@ -574,11 +586,11 @@ def modify(args, config, basepath, workspace):
 
         f.write('\ninherit externalsrc\n')
         f.write('# NOTE: We use pn- overrides here to avoid affecting multiple variants in the case where the recipe uses BBCLASSEXTEND\n')
-        f.write('EXTERNALSRC_pn-%s = "%s"\n' % (args.recipename, srctree))
+        f.write('EXTERNALSRC_pn-%s = "%s"\n' % (pn, srctree))
 
         b_is_s = use_external_build(args.same_dir, args.no_same_dir, rd)
         if b_is_s:
-            f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (args.recipename, srctree))
+            f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (pn, srctree))
 
         if bb.data.inherits_class('kernel', rd):
             f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout do_fetch do_unpack"\n')
@@ -587,9 +599,9 @@ def modify(args, config, basepath, workspace):
             for commit in commits:
                 f.write('# commit: %s\n' % commit)
 
-    _add_md5(config, args.recipename, appendfile)
+    _add_md5(config, pn, appendfile)
 
-    logger.info('Recipe %s now set up to build from %s' % (args.recipename, srctree))
+    logger.info('Recipe %s now set up to build from %s' % (pn, srctree))
 
     return 0
 
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 4f850cf..d387623 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -300,7 +300,13 @@ def upgrade(args, config, basepath, workspace):
     if not rd:
         return 1
 
-    standard._check_compatible_recipe(args.recipename, rd)
+    pn = rd.getVar('PN', True)
+    if pn != args.recipename:
+        logger.info('Mapping %s to %s' % (args.recipename, pn))
+    if pn in workspace:
+        raise DevtoolError("recipe %s is already in your workspace" % pn)
+
+    standard._check_compatible_recipe(pn, rd)
     if rd.getVar('PV', True) == args.version and rd.getVar('SRCREV', True) == args.srcrev:
         raise DevtoolError("Current and upgrade versions are the same version" % version)
 
@@ -315,11 +321,11 @@ def upgrade(args, config, basepath, workspace):
         _upgrade_error(e, rf, args.srctree)
     except DevtoolError as e:
         _upgrade_error(e, rf, args.srctree)
-    standard._add_md5(config, args.recipename, os.path.dirname(rf))
+    standard._add_md5(config, pn, os.path.dirname(rf))
 
     af = _write_append(rf, args.srctree, args.same_dir, args.no_same_dir, rev2,
                        config.workspace_path, rd)
-    standard._add_md5(config, args.recipename, af)
+    standard._add_md5(config, pn, af)
     logger.info('Upgraded source extracted to %s' % args.srctree)
     return 0
 
-- 
2.1.0


