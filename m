Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6D69F78304
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 03:10:39 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 20:10:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,342,1493708400"; d="scan'208";a="868125521"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2017 20:10:40 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 13:01:12 -0700
Message-Id: <1497470472-76873-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497470472-76873-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1497470472-76873-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH] selftest/devtool: replace file assertTrue/False with assertExists/NotExists
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
X-List-Received-Date: Thu, 15 Jun 2017 03:10:39 -0000

Current osselftest print confusing assertion message when using
self.assertTrue(os.path.exists(filepath)) to test file path,
example of confusing assertion message:
	AssertionError: False is not true

Replce assertTrue/assertFalse with assertExists/assertNotExists to test
file path, this will improve assertion message and simplify coding,
self.assertExists(filepath) will print below
	AssertionError: <filepath> does not exist

[YOCTO #11356]

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 128 ++++++++++++++++----------------
 1 file changed, 63 insertions(+), 65 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 06ecf40..e84202b 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -204,7 +204,7 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake -c cleansstate pv')
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool add pv %s' % srcdir)
-        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
         # Test devtool status
         result = runCmd('devtool status')
         self.assertIn('pv', result.output)
@@ -242,7 +242,7 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         # Don't specify a name since we should be able to auto-detect it
         result = runCmd('devtool add %s' % srcdir)
-        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
         # Check the recipe name is correct
         recipefile = get_bb_var('FILE', pn)
         self.assertIn('%s_git.bb' % pn, recipefile, 'Recipe file incorrectly named')
@@ -277,7 +277,7 @@ class DevtoolTests(DevtoolBase):
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool add libftdi %s -V %s' % (srcdir, version))
-        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
         # Test devtool status
         result = runCmd('devtool status')
         self.assertIn('libftdi', result.output)
@@ -325,7 +325,7 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake -c cleansstate %s' % testrecipe)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool add %s %s -f %s' % (testrecipe, srcdir, url))
-        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created. %s' % result.output)
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created. %s' % result.output)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'setup.py')), 'Unable to find setup.py in source directory')
         self.assertTrue(os.path.isdir(os.path.join(srcdir, '.git')), 'git repository for external source tree was not created')
         # Test devtool status
@@ -370,7 +370,7 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake -c cleansstate %s' % testrecipe)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool add %s %s -a -f %s' % (testrecipe, srcdir, url))
-        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created: %s' % result.output)
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created: %s' % result.output)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'imraa', 'imraa.c')), 'Unable to find imraa/imraa.c in source directory')
         # Test devtool status
         result = runCmd('devtool status')
@@ -418,7 +418,7 @@ class DevtoolTests(DevtoolBase):
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool add %s' % url)
-        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created. %s' % result.output)
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created. %s' % result.output)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure')), 'Unable to find configure script in source directory')
         self.assertTrue(os.path.isdir(os.path.join(srcdir, '.git')), 'git repository for external source tree was not created')
         # Test devtool status
@@ -443,8 +443,8 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         self.add_command_to_tearDown('bitbake -c clean mdadm')
         result = runCmd('devtool modify mdadm -x %s' % tempdir)
-        self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile')), 'Extracted source could not be found')
-        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
+        self.assertExists(os.path.join(tempdir, 'Makefile'), 'Extracted source could not be found')
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
         matches = glob.glob(os.path.join(self.workspacedir, 'appends', 'mdadm_*.bbappend'))
         self.assertTrue(matches, 'bbappend not created %s' % result.output)
 
@@ -494,10 +494,10 @@ class DevtoolTests(DevtoolBase):
     def test_devtool_buildclean(self):
         def assertFile(path, *paths):
             f = os.path.join(path, *paths)
-            self.assertTrue(os.path.exists(f), "%r does not exist" % f)
+            self.assertExists(f)
         def assertNoFile(path, *paths):
             f = os.path.join(path, *paths)
-            self.assertFalse(os.path.exists(os.path.join(f)), "%r exists" % f)
+            self.assertNotExists(f)
 
         # Clean up anything in the workdir/sysroot/sstate cache
         bitbake('mdadm m4 -c cleansstate')
@@ -611,8 +611,8 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
-        self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile')), 'Extracted source could not be found')
-        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created. devtool output: %s' % result.output)
+        self.assertExists(os.path.join(tempdir, 'Makefile'), 'Extracted source could not be found')
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created. devtool output: %s' % result.output)
         matches = glob.glob(os.path.join(self.workspacedir, 'appends', 'mkelfimage_*.bbappend'))
         self.assertTrue(matches, 'bbappend not created')
         # Test devtool status
@@ -644,8 +644,8 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
-        self.assertTrue(os.path.exists(os.path.join(tempdir, 'configure.ac')), 'Extracted source could not be found')
-        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
+        self.assertExists(os.path.join(tempdir, 'configure.ac'), 'Extracted source could not be found')
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
         matches = glob.glob(os.path.join(self.workspacedir, 'appends', '%s_*.bbappend' % testrecipe))
         self.assertTrue(matches, 'bbappend not created')
         # Test devtool status
@@ -665,8 +665,8 @@ class DevtoolTests(DevtoolBase):
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool modify %s -x %s' % (virtrecipe, tempdir))
-        self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile.am')), 'Extracted source could not be found')
-        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
+        self.assertExists(os.path.join(tempdir, 'Makefile.am'), 'Extracted source could not be found')
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
         matches = glob.glob(os.path.join(self.workspacedir, 'appends', '%s_*.bbappend' % realrecipe))
         self.assertTrue(matches, 'bbappend not created %s' % result.output)
         # Test devtool status
@@ -817,7 +817,7 @@ class DevtoolTests(DevtoolBase):
         appenddir = os.path.join(templayerdir, splitpath[-2], splitpath[-1])
         bbappendfile = self._check_bbappend(testrecipe, recipefile, appenddir)
         patchfile = os.path.join(appenddir, testrecipe, '0001-Add-our-custom-version.patch')
-        self.assertTrue(os.path.exists(patchfile), 'Patch file not created')
+        self.assertExists(patchfile, 'Patch file not created')
 
         # Check bbappend contents
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -834,7 +834,7 @@ class DevtoolTests(DevtoolBase):
         # Drop new commit and check patch gets deleted
         result = runCmd('git reset HEAD^', cwd=tempsrcdir)
         result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
-        self.assertFalse(os.path.exists(patchfile), 'Patch file not deleted')
+        self.assertNotExists(patchfile, 'Patch file not deleted')
         expectedlines2 = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n']
         with open(bbappendfile, 'r') as f:
@@ -845,7 +845,7 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('bitbake-layers remove-layer %s' % templayerdir, cwd=self.builddir)
         result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
         self.assertIn('WARNING: Specified layer is not currently enabled in bblayers.conf', result.output)
-        self.assertTrue(os.path.exists(patchfile), 'Patch file not created (with disabled layer)')
+        self.assertExists(patchfile, 'Patch file not created (with disabled layer)')
         with open(bbappendfile, 'r') as f:
             self.assertEqual(expectedlines, f.readlines())
         # Deleting isn't expected to work under these circumstances
@@ -898,7 +898,7 @@ class DevtoolTests(DevtoolBase):
         splitpath = os.path.dirname(recipefile).split(os.sep)
         appenddir = os.path.join(templayerdir, splitpath[-2], splitpath[-1])
         bbappendfile = self._check_bbappend(testrecipe, recipefile, appenddir)
-        self.assertFalse(os.path.exists(os.path.join(appenddir, testrecipe)), 'Patch directory should not be created')
+        self.assertNotExists(os.path.join(appenddir, testrecipe), 'Patch directory should not be created')
 
         # Check bbappend contents
         result = runCmd('git rev-parse HEAD', cwd=tempsrcdir)
@@ -916,7 +916,7 @@ class DevtoolTests(DevtoolBase):
         # Drop new commit and check SRCREV changes
         result = runCmd('git reset HEAD^', cwd=tempsrcdir)
         result = runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
-        self.assertFalse(os.path.exists(os.path.join(appenddir, testrecipe)), 'Patch directory should not be created')
+        self.assertNotExists(os.path.join(appenddir, testrecipe), 'Patch directory should not be created')
         result = runCmd('git rev-parse HEAD', cwd=tempsrcdir)
         expectedlines = set(['SRCREV = "%s"\n' % result.output,
                              '\n',
@@ -930,7 +930,7 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('bitbake-layers remove-layer %s' % templayerdir, cwd=self.builddir)
         result = runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
         self.assertIn('WARNING: Specified layer is not currently enabled in bblayers.conf', result.output)
-        self.assertFalse(os.path.exists(os.path.join(appenddir, testrecipe)), 'Patch directory should not be created')
+        self.assertNotExists(os.path.join(appenddir, testrecipe), 'Patch directory should not be created')
         result = runCmd('git rev-parse HEAD', cwd=tempsrcdir)
         expectedlines = set(['SRCREV = "%s"\n' % result.output,
                              '\n',
@@ -1075,7 +1075,7 @@ class DevtoolTests(DevtoolBase):
         # (don't bother with cleaning the recipe on teardown, we won't be building it)
         result = runCmd('devtool modify %s' % testrecipe)
         testfile = os.path.join(self.workspacedir, 'sources', testrecipe, 'testfile')
-        self.assertTrue(os.path.exists(testfile), 'Extracted source could not be found')
+        self.assertExists(testfile, 'Extracted source could not be found')
         with open(testfile, 'r') as f:
             contents = f.read().rstrip()
         self.assertEqual(contents, 'Modified version', 'File has apparently not been overwritten as it should have been')
@@ -1092,9 +1092,9 @@ class DevtoolTests(DevtoolBase):
         self.track_for_cleanup(tempdir)
         self.append_config('PREFERRED_PROVIDER_virtual/make = "remake"')
         result = runCmd('devtool extract remake %s' % tempdir)
-        self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile.am')), 'Extracted source could not be found')
+        self.assertExists(os.path.join(tempdir, 'Makefile.am'), 'Extracted source could not be found')
         # devtool extract shouldn't create the workspace
-        self.assertFalse(os.path.exists(self.workspacedir))
+        self.assertNotExists(self.workspacedir)
         self._check_src_repo(tempdir)
 
     @OETestID(1379)
@@ -1103,9 +1103,9 @@ class DevtoolTests(DevtoolBase):
         # Try devtool extract
         self.track_for_cleanup(tempdir)
         result = runCmd('devtool extract virtual/make %s' % tempdir)
-        self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile.am')), 'Extracted source could not be found')
+        self.assertExists(os.path.join(tempdir, 'Makefile.am'), 'Extracted source could not be found')
         # devtool extract shouldn't create the workspace
-        self.assertFalse(os.path.exists(self.workspacedir))
+        self.assertNotExists(self.workspacedir)
         self._check_src_repo(tempdir)
 
     @OETestID(1168)
@@ -1280,10 +1280,10 @@ class DevtoolTests(DevtoolBase):
         # Check if srctree at least is populated
         self.assertTrue(len(os.listdir(tempdir)) > 0, 'srctree (%s) should be populated with new (%s) source code' % (tempdir, version))
         # Check new recipe subdirectory is present
-        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipe, '%s-%s' % (recipe, version))), 'Recipe folder should exist')
+        self.assertExists(os.path.join(self.workspacedir, 'recipes', recipe, '%s-%s' % (recipe, version)), 'Recipe folder should exist')
         # Check new recipe file is present
         newrecipefile = os.path.join(self.workspacedir, 'recipes', recipe, '%s_%s.bb' % (recipe, version))
-        self.assertTrue(os.path.exists(newrecipefile), 'Recipe file should exist after upgrade')
+        self.assertExists(newrecipefile, 'Recipe file should exist after upgrade')
         # Check devtool status and make sure recipe is present
         result = runCmd('devtool status')
         self.assertIn(recipe, result.output)
@@ -1298,7 +1298,7 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool reset %s -n' % recipe)
         result = runCmd('devtool status')
         self.assertNotIn(recipe, result.output)
-        self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipe)), 'Recipe directory should not exist after resetting')
+        self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after resetting')
 
     @OETestID(1433)
     def test_devtool_upgrade_git(self):
@@ -1320,7 +1320,7 @@ class DevtoolTests(DevtoolBase):
         self.assertTrue(len(os.listdir(tempdir)) > 0, 'srctree (%s) should be populated with new (%s) source code' % (tempdir, commit))
         # Check new recipe file is present
         newrecipefile = os.path.join(self.workspacedir, 'recipes', recipe, os.path.basename(oldrecipefile))
-        self.assertTrue(os.path.exists(newrecipefile), 'Recipe file should exist after upgrade')
+        self.assertExists(newrecipefile, 'Recipe file should exist after upgrade')
         # Check devtool status and make sure recipe is present
         result = runCmd('devtool status')
         self.assertIn(recipe, result.output)
@@ -1335,7 +1335,7 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool reset %s -n' % recipe)
         result = runCmd('devtool status')
         self.assertNotIn(recipe, result.output)
-        self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipe)), 'Recipe directory should not exist after resetting')
+        self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after resetting')
 
     @OETestID(1352)
     def test_devtool_layer_plugins(self):
@@ -1352,7 +1352,7 @@ class DevtoolTests(DevtoolBase):
 
     def _copy_file_with_cleanup(self, srcfile, basedstdir, *paths):
         dstdir = basedstdir
-        self.assertTrue(os.path.exists(dstdir))
+        self.assertExists(dstdir)
         for p in paths:
             dstdir = os.path.join(dstdir, p)
             if not os.path.exists(dstdir):
@@ -1427,7 +1427,7 @@ class DevtoolTests(DevtoolBase):
         recipedir = os.path.dirname(oldrecipefile)
         olddir = os.path.join(recipedir, recipe + '-' + oldversion)
         patchfn = '0001-Add-a-note-line-to-the-quick-reference.patch'
-        self.assertTrue(os.path.exists(os.path.join(olddir, patchfn)), 'Original patch file does not exist')
+        self.assertExists(os.path.join(olddir, patchfn), 'Original patch file does not exist')
         return recipe, oldrecipefile, recipedir, olddir, newversion, patchfn
 
     def test_devtool_finish_upgrade_origlayer(self):
@@ -1439,14 +1439,14 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool finish %s meta-selftest' % recipe)
         result = runCmd('devtool status')
         self.assertNotIn(recipe, result.output, 'Recipe should have been reset by finish but wasn\'t')
-        self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipe)), 'Recipe directory should not exist after finish')
-        self.assertFalse(os.path.exists(oldrecipefile), 'Old recipe file should have been deleted but wasn\'t')
-        self.assertFalse(os.path.exists(os.path.join(olddir, patchfn)), 'Old patch file should have been deleted but wasn\'t')
+        self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after finish')
+        self.assertNotExists(oldrecipefile, 'Old recipe file should have been deleted but wasn\'t')
+        self.assertNotExists(os.path.join(olddir, patchfn), 'Old patch file should have been deleted but wasn\'t')
         newrecipefile = os.path.join(recipedir, '%s_%s.bb' % (recipe, newversion))
         newdir = os.path.join(recipedir, recipe + '-' + newversion)
-        self.assertTrue(os.path.exists(newrecipefile), 'New recipe file should have been copied into existing layer but wasn\'t')
-        self.assertTrue(os.path.exists(os.path.join(newdir, patchfn)), 'Patch file should have been copied into new directory but wasn\'t')
-        self.assertTrue(os.path.exists(os.path.join(newdir, '0002-Add-a-comment-to-the-code.patch')), 'New patch file should have been created but wasn\'t')
+        self.assertExists(newrecipefile, 'New recipe file should have been copied into existing layer but wasn\'t')
+        self.assertExists(os.path.join(newdir, patchfn), 'Patch file should have been copied into new directory but wasn\'t')
+        self.assertExists(os.path.join(newdir, '0002-Add-a-comment-to-the-code.patch'), 'New patch file should have been created but wasn\'t')
 
     def test_devtool_finish_upgrade_otherlayer(self):
         recipe, oldrecipefile, recipedir, olddir, newversion, patchfn = self._setup_test_devtool_finish_upgrade()
@@ -1462,13 +1462,13 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool finish %s oe-core' % recipe)
         result = runCmd('devtool status')
         self.assertNotIn(recipe, result.output, 'Recipe should have been reset by finish but wasn\'t')
-        self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipe)), 'Recipe directory should not exist after finish')
-        self.assertTrue(os.path.exists(oldrecipefile), 'Old recipe file should not have been deleted')
-        self.assertTrue(os.path.exists(os.path.join(olddir, patchfn)), 'Old patch file should not have been deleted')
+        self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after finish')
+        self.assertExists(oldrecipefile, 'Old recipe file should not have been deleted')
+        self.assertExists(os.path.join(olddir, patchfn), 'Old patch file should not have been deleted')
         newdir = os.path.join(newrecipedir, recipe + '-' + newversion)
-        self.assertTrue(os.path.exists(newrecipefile), 'New recipe file should have been copied into existing layer but wasn\'t')
-        self.assertTrue(os.path.exists(os.path.join(newdir, patchfn)), 'Patch file should have been copied into new directory but wasn\'t')
-        self.assertTrue(os.path.exists(os.path.join(newdir, '0002-Add-a-comment-to-the-code.patch')), 'New patch file should have been created but wasn\'t')
+        self.assertExists(newrecipefile, 'New recipe file should have been copied into existing layer but wasn\'t')
+        self.assertExists(os.path.join(newdir, patchfn), 'Patch file should have been copied into new directory but wasn\'t')
+        self.assertExists(os.path.join(newdir, '0002-Add-a-comment-to-the-code.patch'), 'New patch file should have been created but wasn\'t')
 
     def _setup_test_devtool_finish_modify(self):
         # Check preconditions
@@ -1485,7 +1485,7 @@ class DevtoolTests(DevtoolBase):
         self.track_for_cleanup(tempdir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool modify %s %s' % (recipe, tempdir))
-        self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile')), 'Extracted source could not be found')
+        self.assertExists(os.path.join(tempdir, 'Makefile'), 'Extracted source could not be found')
         # Test devtool status
         result = runCmd('devtool status')
         self.assertIn(recipe, result.output)
@@ -1512,7 +1512,7 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool finish %s meta' % recipe)
         result = runCmd('devtool status')
         self.assertNotIn(recipe, result.output, 'Recipe should have been reset by finish but wasn\'t')
-        self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipe)), 'Recipe directory should not exist after finish')
+        self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after finish')
         expected_status = [(' M', '.*/%s$' % os.path.basename(oldrecipefile)),
                            ('??', '.*/.*-Add-a-comment-to-the-code.patch$')]
         self._check_repo_status(recipedir, expected_status)
@@ -1529,14 +1529,14 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool finish %s meta-selftest' % recipe)
         result = runCmd('devtool status')
         self.assertNotIn(recipe, result.output, 'Recipe should have been reset by finish but wasn\'t')
-        self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipe)), 'Recipe directory should not exist after finish')
+        self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after finish')
         result = runCmd('git status --porcelain .', cwd=recipedir)
         if result.output.strip():
             self.fail('Recipe directory for %s contains the following unexpected changes after finish:\n%s' % (recipe, result.output.strip()))
         recipefn = os.path.splitext(os.path.basename(oldrecipefile))[0]
         recipefn = recipefn.split('_')[0] + '_%'
         appendfile = os.path.join(appenddir, recipefn + '.bbappend')
-        self.assertTrue(os.path.exists(appendfile), 'bbappend %s should have been created but wasn\'t' % appendfile)
+        self.assertExists(appendfile, 'bbappend %s should have been created but wasn\'t' % appendfile)
         newdir = os.path.join(appenddir, recipe)
         files = os.listdir(newdir)
         foundpatch = None
@@ -1563,8 +1563,8 @@ class DevtoolTests(DevtoolBase):
         url = 'http://downloads.yoctoproject.org/mirror/sources/i2c-tools-%s.tar.bz2' % recipever
         def add_recipe():
             result = runCmd('devtool add %s' % url)
-            self.assertTrue(os.path.exists(recipefile), 'Expected recipe file not created')
-            self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'sources', recipename)), 'Source directory not created')
+            self.assertExists(recipefile, 'Expected recipe file not created')
+            self.assertExists(os.path.join(self.workspacedir, 'sources', recipename), 'Source directory not created')
             checkvars = {}
             checkvars['S'] = None
             checkvars['SRC_URI'] = url.replace(recipever, '${PV}')
@@ -1575,10 +1575,10 @@ class DevtoolTests(DevtoolBase):
         newrecipever = '456'
         newrecipefile = os.path.join(self.workspacedir, 'recipes', newrecipename, '%s_%s.bb' % (newrecipename, newrecipever))
         result = runCmd('devtool rename %s %s -V %s' % (recipename, newrecipename, newrecipever))
-        self.assertTrue(os.path.exists(newrecipefile), 'Recipe file not renamed')
-        self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipename)), 'Old recipe directory still exists')
+        self.assertExists(newrecipefile, 'Recipe file not renamed')
+        self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipename), 'Old recipe directory still exists')
         newsrctree = os.path.join(self.workspacedir, 'sources', newrecipename)
-        self.assertTrue(os.path.exists(newsrctree), 'Source directory not renamed')
+        self.assertExists(newsrctree, 'Source directory not renamed')
         checkvars = {}
         checkvars['S'] = '${WORKDIR}/%s-%s' % (recipename, recipever)
         checkvars['SRC_URI'] = url
@@ -1589,9 +1589,9 @@ class DevtoolTests(DevtoolBase):
         add_recipe()
         newrecipefile = os.path.join(self.workspacedir, 'recipes', newrecipename, '%s_%s.bb' % (newrecipename, recipever))
         result = runCmd('devtool rename %s %s' % (recipename, newrecipename))
-        self.assertTrue(os.path.exists(newrecipefile), 'Recipe file not renamed')
-        self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipename)), 'Old recipe directory still exists')
-        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'sources', newrecipename)), 'Source directory not renamed')
+        self.assertExists(newrecipefile, 'Recipe file not renamed')
+        self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipename), 'Old recipe directory still exists')
+        self.assertExists(os.path.join(self.workspacedir, 'sources', newrecipename), 'Source directory not renamed')
         checkvars = {}
         checkvars['S'] = '${WORKDIR}/%s-${PV}' % recipename
         checkvars['SRC_URI'] = url.replace(recipever, '${PV}')
@@ -1602,8 +1602,8 @@ class DevtoolTests(DevtoolBase):
         add_recipe()
         newrecipefile = os.path.join(self.workspacedir, 'recipes', recipename, '%s_%s.bb' % (recipename, newrecipever))
         result = runCmd('devtool rename %s -V %s' % (recipename, newrecipever))
-        self.assertTrue(os.path.exists(newrecipefile), 'Recipe file not renamed')
-        self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'sources', recipename)), 'Source directory no longer exists')
+        self.assertExists(newrecipefile, 'Recipe file not renamed')
+        self.assertExists(os.path.join(self.workspacedir, 'sources', recipename), 'Source directory no longer exists')
         checkvars = {}
         checkvars['S'] = '${WORKDIR}/${BPN}-%s' % recipever
         checkvars['SRC_URI'] = url
@@ -1648,16 +1648,14 @@ class DevtoolTests(DevtoolBase):
         buildir= get_bb_var('TOPDIR')
         #Step 2
         runCmd('cp %s %s' % (bbconfig, buildir))
-        self.assertTrue(os.path.exists(os.path.join(buildir, '.config')),
-                        'Could not copy .config file from kernel')
+        self.assertExists(os.path.join(buildir, '.config'), 'Could not copy .config file from kernel')
 
         tmpconfig = os.path.join(buildir, '.config')
         #Step 3
         bitbake('%s -c clean' % kernel_provider)
         #Step 4.1
         runCmd('devtool modify virtual/kernel -x %s' % tempdir)
-        self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile')),
-                        'Extracted source could not be found')
+        self.assertExists(os.path.join(tempdir, 'Makefile'), 'Extracted source could not be found')
         #Step 4.2
         configfile = os.path.join(tempdir,'.config')
         diff = runCmd('diff %s %s' % (tmpconfig, configfile))
@@ -1667,7 +1665,7 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool build %s' % kernel_provider)
         self.assertEqual(0,result.status,'Cannot build kernel using `devtool build`')
         kernelfile = os.path.join(get_bb_var('KBUILD_OUTPUT', kernel_provider), 'vmlinux')
-        self.assertTrue(os.path.exists(kernelfile),'Kernel was not build correctly')
+        self.assertExists(kernelfile, 'Kernel was not build correctly')
 
         #Modify the kernel source
         modfile = os.path.join(tempdir,'arch/x86/boot/header.S')
-- 
2.7.4


