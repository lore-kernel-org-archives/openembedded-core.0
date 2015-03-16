Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 47CB1738EC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 14:19:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2015 07:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,409,1422950400"; d="scan'208";a="680778144"
Received: from sgconnee-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.217])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2015 07:19:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 14:18:49 +0000
Message-Id: <a0ea1a51d3564a306552a1815ab30616f4dcdaed.1426515313.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/16] devtool: reset: add ability to reset entire workspace
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

Add a -a/--all option to allow you to quickly reset all recipes in your
workspace.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 29 ++++++++++++++++++++++
 scripts/lib/devtool/standard.py   | 52 +++++++++++++++++++++++++--------------
 2 files changed, 62 insertions(+), 19 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 932d6b9..a8c339a 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -384,3 +384,32 @@ class DevtoolTests(oeSelfTest):
         result = runCmd('devtool extract remake %s' % tempdir)
         self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile.am')), 'Extracted source could not be found')
         self.assertTrue(os.path.isdir(os.path.join(tempdir, '.git')), 'git repository for external source tree not found')
+
+    def test_devtool_reset_all(self):
+        # Check preconditions
+        workspacedir = os.path.join(self.builddir, 'workspace')
+        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        testrecipe1 = 'mdadm'
+        testrecipe2 = 'cronie'
+        result = runCmd('devtool modify -x %s %s' % (testrecipe1, os.path.join(tempdir, testrecipe1)))
+        result = runCmd('devtool modify -x %s %s' % (testrecipe2, os.path.join(tempdir, testrecipe2)))
+        result = runCmd('devtool build %s' % testrecipe1)
+        result = runCmd('devtool build %s' % testrecipe2)
+        stampprefix1 = get_bb_var('STAMP', testrecipe1)
+        self.assertTrue(stampprefix1, 'Unable to get STAMP value for recipe %s' % testrecipe1)
+        stampprefix2 = get_bb_var('STAMP', testrecipe2)
+        self.assertTrue(stampprefix2, 'Unable to get STAMP value for recipe %s' % testrecipe2)
+        result = runCmd('devtool reset -a')
+        self.assertIn(testrecipe1, result.output)
+        self.assertIn(testrecipe2, result.output)
+        result = runCmd('devtool status')
+        self.assertNotIn(testrecipe1, result.output)
+        self.assertNotIn(testrecipe2, result.output)
+        matches1 = glob.glob(stampprefix1 + '*')
+        self.assertFalse(matches1, 'Stamp files exist for recipe %s that should have been cleaned' % testrecipe1)
+        matches2 = glob.glob(stampprefix2 + '*')
+        self.assertFalse(matches2, 'Stamp files exist for recipe %s that should have been cleaned' % testrecipe2)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 435878c..32fb3b6 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -556,28 +556,42 @@ def status(args, config, basepath, workspace):
 
 def reset(args, config, basepath, workspace):
     import bb.utils
-    if not args.recipename in workspace:
-        logger.error("no recipe named %s in your workspace" % args.recipename)
+    if args.recipename:
+        if args.all:
+            logger.error("Recipe cannot be specified if -a/--all is used")
+            return -1
+        elif not args.recipename in workspace:
+            logger.error("no recipe named %s in your workspace" % args.recipename)
+            return -1
+    elif not args.all:
+        logger.error("Recipe must be specified, or specify -a/--all to reset all recipes")
         return -1
 
-    if not args.no_clean:
-        logger.info('Cleaning sysroot for recipe %s...' % args.recipename)
-        exec_build_env_command(config.init_path, basepath, 'bitbake -c clean %s' % args.recipename)
+    if args.all:
+        recipes = workspace
+    else:
+        recipes = [args.recipename]
+
+    for pn in recipes:
+        if not args.no_clean:
+            logger.info('Cleaning sysroot for recipe %s...' % pn)
+            exec_build_env_command(config.init_path, basepath, 'bitbake -c clean %s' % pn)
 
-    _check_preserve(config, args.recipename)
+        _check_preserve(config, pn)
 
-    preservepath = os.path.join(config.workspace_path, 'attic', args.recipename)
-    def preservedir(origdir):
-        if os.path.exists(origdir):
-            for fn in os.listdir(origdir):
-                logger.warn('Preserving %s in %s' % (fn, preservepath))
-                bb.utils.mkdirhier(preservepath)
-                shutil.move(os.path.join(origdir, fn), os.path.join(preservepath, fn))
-            os.rmdir(origdir)
+        preservepath = os.path.join(config.workspace_path, 'attic', pn)
+        def preservedir(origdir):
+            if os.path.exists(origdir):
+                for fn in os.listdir(origdir):
+                    logger.warn('Preserving %s in %s' % (fn, preservepath))
+                    bb.utils.mkdirhier(preservepath)
+                    shutil.move(os.path.join(origdir, fn), os.path.join(preservepath, fn))
+                os.rmdir(origdir)
+
+        preservedir(os.path.join(config.workspace_path, 'recipes', pn))
+        # We don't automatically create this dir next to appends, but the user can
+        preservedir(os.path.join(config.workspace_path, 'appends', pn))
 
-    preservedir(os.path.join(config.workspace_path, 'recipes', args.recipename))
-    # We don't automatically create this dir next to appends, but the user can
-    preservedir(os.path.join(config.workspace_path, 'appends', args.recipename))
     return 0
 
 
@@ -644,7 +658,7 @@ def register_commands(subparsers, context):
     parser_reset = subparsers.add_parser('reset', help='Remove a recipe from your workspace',
                                          description='Removes the specified recipe from your workspace (resetting its state)',
                                          formatter_class=argparse.ArgumentDefaultsHelpFormatter)
-    parser_reset.add_argument('recipename', help='Recipe to reset')
+    parser_reset.add_argument('recipename', nargs='?', help='Recipe to reset')
+    parser_reset.add_argument('--all', '-a', action="store_true", help='Reset all recipes (clear workspace)')
     parser_reset.add_argument('--no-clean', '-n', action="store_true", help='Don\'t clean the sysroot to remove recipe output')
     parser_reset.set_defaults(func=reset)
-
-- 
1.9.3


