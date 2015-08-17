Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EDEAA65CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 11:23:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 17 Aug 2015 04:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,694,1432623600"; d="scan'208";a="626925826"
Received: from jwanrooi-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.11.216])
	by orsmga003.jf.intel.com with ESMTP; 17 Aug 2015 04:23:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Aug 2015 12:23:05 +0100
Message-Id: <afcd13b979ea4c9a464c3084370f1fc13cc958c8.1439810551.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1439810551.git.paul.eggleton@linux.intel.com>
References: <cover.1439810551.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1439810551.git.paul.eggleton@linux.intel.com>
References: <cover.1439810551.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] devtool: fix handling of BBCLASSEXTENDed recipes
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
X-List-Received-Date: Mon, 17 Aug 2015 11:23:13 -0000

If a recipe is BBCLASSEXTENDed (e.g. to -native), its PN value and the
name of the bbappend will be different; we were assuming them to be the
same when reading in the workspace, leading to us seeing the base recipe
name everywhere afterwards.

Also add a test so we ensure this doesn't regress in future.

Fixes [YOCTO #8157].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 30 ++++++++++++++++++++++++++++++
 scripts/devtool                   | 12 ++++++------
 scripts/lib/devtool/standard.py   | 20 ++++++++++++--------
 3 files changed, 48 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index b59db15..947d8ee 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -367,6 +367,36 @@ class DevtoolTests(DevtoolBase):
             self.assertNotEqual(result.status, 0, 'devtool modify on %s should have failed. devtool output: %s' %  (testrecipe, result.output))
             self.assertIn('ERROR: ', result.output, 'devtool modify on %s should have given an ERROR' % testrecipe)
 
+    def test_devtool_modify_native(self):
+        # Check preconditions
+        workspacedir = os.path.join(self.builddir, 'workspace')
+        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        # Try modifying some recipes
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+
+        bbclassextended = False
+        inheritnative = False
+        testrecipes = 'mtools-native apt-native desktop-file-utils-native'.split()
+        for testrecipe in testrecipes:
+            checkextend = 'native' in (get_bb_var('BBCLASSEXTEND', testrecipe) or '').split()
+            if not bbclassextended:
+                bbclassextended = checkextend
+            if not inheritnative:
+                inheritnative = not checkextend
+            result = runCmd('devtool modify %s -x %s' % (testrecipe, os.path.join(tempdir, testrecipe)))
+            self.assertNotIn('ERROR: ', result.output, 'ERROR in devtool modify output: %s' % result.output)
+            result = runCmd('devtool build %s' % testrecipe)
+            self.assertNotIn('ERROR: ', result.output, 'ERROR in devtool build output: %s' % result.output)
+            result = runCmd('devtool reset %s' % testrecipe)
+            self.assertNotIn('ERROR: ', result.output, 'ERROR in devtool reset output: %s' % result.output)
+
+        self.assertTrue(bbclassextended, 'None of these recipes are BBCLASSEXTENDed to native - need to adjust testrecipes list: %s' % ', '.join(testrecipes))
+        self.assertTrue(inheritnative, 'None of these recipes do "inherit native" - need to adjust testrecipes list: %s' % ', '.join(testrecipes))
+
+
     @testcase(1165)
     def test_devtool_modify_git(self):
         # Check preconditions
diff --git a/scripts/devtool b/scripts/devtool
index 1c22438..b9d3bb9 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -104,15 +104,15 @@ def read_workspace():
         _enable_workspace_layer(config.workspace_path, config, basepath)
 
     logger.debug('Reading workspace in %s' % config.workspace_path)
-    externalsrc_re = re.compile(r'^EXTERNALSRC(_pn-[^ =]+)? =.*$')
+    externalsrc_re = re.compile(r'^EXTERNALSRC(_pn-([^ =]+))? *= *"([^"]*)"$')
     for fn in glob.glob(os.path.join(config.workspace_path, 'appends', '*.bbappend')):
-        pn = os.path.splitext(os.path.basename(fn))[0].split('_')[0]
         with open(fn, 'r') as f:
             for line in f:
-                if externalsrc_re.match(line.rstrip()):
-                    splitval = line.split('=', 2)
-                    workspace[pn] = splitval[1].strip('" \n\r\t')
-                    break
+                res = externalsrc_re.match(line.rstrip())
+                if res:
+                    pn = res.group(2) or os.path.splitext(os.path.basename(fn))[0].split('_')[0]
+                    workspace[pn] = {'srctree': res.group(3),
+                                     'bbappend': fn}
 
 def create_workspace(args, config, basepath, workspace):
     if args.layerpath:
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 658076c..e85e1ad 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -430,6 +430,16 @@ def modify(args, config, basepath, workspace):
     if not rd:
         return 1
     recipefile = rd.getVar('FILE', True)
+    appendname = os.path.splitext(os.path.basename(recipefile))[0]
+    if args.wildcard:
+        appendname = re.sub(r'_.*', '_%', appendname)
+    appendpath = os.path.join(config.workspace_path, 'appends')
+    appendfile = os.path.join(appendpath, appendname + '.bbappend')
+    if os.path.exists(appendfile):
+        raise DevtoolError("Another variant of recipe %s is already in your "
+                           "workspace (only one variant of a recipe can "
+                           "currently be worked on at once)"
+                           % args.recipename)
 
     _check_compatible_recipe(args.recipename, rd)
 
@@ -467,14 +477,8 @@ def modify(args, config, basepath, workspace):
         srcsubdir = os.path.relpath(s, workdir).split(os.sep, 1)[1]
         srctree = os.path.join(srctree, srcsubdir)
 
-    appendpath = os.path.join(config.workspace_path, 'appends')
     if not os.path.exists(appendpath):
         os.makedirs(appendpath)
-
-    appendname = os.path.splitext(os.path.basename(recipefile))[0]
-    if args.wildcard:
-        appendname = re.sub(r'_.*', '_%', appendname)
-    appendfile = os.path.join(appendpath, appendname + '.bbappend')
     with open(appendfile, 'w') as f:
         f.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n\n')
         f.write('inherit externalsrc\n')
@@ -777,7 +781,7 @@ def update_recipe(args, config, basepath, workspace):
     else:
         mode = args.mode
 
-    srctree = workspace[args.recipename]
+    srctree = workspace[args.recipename]['srctree']
 
     if mode == 'srcrev':
         _update_recipe_srcrev(args, srctree, rd, tinfoil.config_data)
@@ -793,7 +797,7 @@ def status(args, config, basepath, workspace):
     """Entry point for the devtool 'status' subcommand"""
     if workspace:
         for recipe, value in workspace.iteritems():
-            print("%s: %s" % (recipe, value))
+            print("%s: %s" % (recipe, value['srctree']))
     else:
         logger.info('No recipes currently in your workspace - you can use "devtool modify" to work on an existing recipe or "devtool add" to add a new one')
     return 0
-- 
2.1.0


