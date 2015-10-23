Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F316373710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 12:06:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2015 05:06:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,186,1444719600"; d="scan'208";a="801080776"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2015 05:06:04 -0700
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id A6F7B6A4083;
	Fri, 23 Oct 2015 05:05:03 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Oct 2015 15:07:51 +0300
Message-Id: <1445602071-23108-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oeqa/selftest: Added testcase decorators.
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
X-List-Received-Date: Fri, 23 Oct 2015 12:06:05 -0000

Added testcase decorators for testopia integration.

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/devtool.py     | 11 +++++++++--
 meta/lib/oeqa/selftest/manifest.py    |  2 ++
 meta/lib/oeqa/selftest/recipetool.py  | 11 +++++++++++
 meta/lib/oeqa/selftest/sstatetests.py | 14 ++++++++------
 4 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index fb46559..f48e6a2 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -378,6 +378,7 @@ class DevtoolTests(DevtoolBase):
             self.assertNotEqual(result.status, 0, 'devtool modify on %s should have failed. devtool output: %s' %  (testrecipe, result.output))
             self.assertIn('ERROR: ', result.output, 'devtool modify on %s should have given an ERROR' % testrecipe)
 
+    @testcase(1365)
     def test_devtool_modify_native(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
@@ -466,6 +467,7 @@ class DevtoolTests(DevtoolBase):
         # Try building
         bitbake(testrecipe)
 
+    @testcase(1378)
     def test_devtool_modify_virtual(self):
         # Try modifying a virtual recipe
         virtrecipe = 'virtual/libx11'
@@ -745,7 +747,7 @@ class DevtoolTests(DevtoolBase):
             self.assertEqual(expectedlines, f.readlines())
         # Deleting isn't expected to work under these circumstances
 
-    @testcase(1173)
+    @testcase(1370)
     def test_devtool_update_recipe_local_files(self):
         """Check that local source files are copied over instead of patched"""
         testrecipe = 'makedevs'
@@ -775,7 +777,7 @@ class DevtoolTests(DevtoolBase):
                            ('??', '.*/makedevs/0001-Add-new-file.patch$')]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
-    @testcase(1174)
+    @testcase(1371)
     def test_devtool_update_recipe_local_files_2(self):
         """Check local source files support when oe-local-files is in Git"""
         testrecipe = 'lzo'
@@ -827,6 +829,7 @@ class DevtoolTests(DevtoolBase):
         self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile.am')), 'Extracted source could not be found')
         self._check_src_repo(tempdir)
 
+    @testcase(1379)
     def test_devtool_extract_virtual(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         # Try devtool extract
@@ -864,6 +867,7 @@ class DevtoolTests(DevtoolBase):
         matches2 = glob.glob(stampprefix2 + '*')
         self.assertFalse(matches2, 'Stamp files exist for recipe %s that should have been cleaned' % testrecipe2)
 
+    @testcase(1272)
     def test_devtool_deploy_target(self):
         # NOTE: Whilst this test would seemingly be better placed as a runtime test,
         # unfortunately the runtime tests run under bitbake and you can't run
@@ -948,6 +952,7 @@ class DevtoolTests(DevtoolBase):
             result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand), ignore_status=True)
             self.assertNotEqual(result, 0, 'undeploy-target did not remove command as it should have')
 
+    @testcase(1366)
     def test_devtool_build_image(self):
         """Test devtool build-image plugin"""
         # Check preconditions
@@ -981,6 +986,7 @@ class DevtoolTests(DevtoolBase):
         if reqpkgs:
             self.fail('The following packages were not present in the image as expected: %s' % ', '.join(reqpkgs))
 
+    @testcase(1367)
     def test_devtool_upgrade(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
@@ -1016,6 +1022,7 @@ class DevtoolTests(DevtoolBase):
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
 
+    @testcase(1352)
     def test_devtool_layer_plugins(self):
         """Test that devtool can use plugins from other layers.
 
diff --git a/meta/lib/oeqa/selftest/manifest.py b/meta/lib/oeqa/selftest/manifest.py
index c813c1d..44d0404 100644
--- a/meta/lib/oeqa/selftest/manifest.py
+++ b/meta/lib/oeqa/selftest/manifest.py
@@ -59,6 +59,7 @@ class VerifyManifest(oeSelfTest):
             unittest.SkipTest("{}: Cannot setup testing scenario"\
                     .format(self.classname))
 
+    @testcase(1380)
     def test_SDK_manifest_entries(self):
         '''Verifying the SDK manifest entries exist, this may take a build'''
 
@@ -124,6 +125,7 @@ class VerifyManifest(oeSelfTest):
                 self.log.info(msg)
                 self.fail(logmsg)
 
+    @testcase(1381)
     def test_image_manifest_entries(self):
         '''Verifying the image manifest entries exist'''
 
diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index c34ad68..b1f1d2a 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -492,9 +492,12 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
 
 
 class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
+
+    @testcase(1273)
     def test_recipetool_appendsrcfile_basic(self):
         self._test_appendsrcfile('base-files', 'a-file')
 
+    @testcase(1274)
     def test_recipetool_appendsrcfile_basic_wildcard(self):
         testrecipe = 'base-files'
         self._test_appendsrcfile(testrecipe, 'a-file', options='-w')
@@ -502,12 +505,15 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
         bbappendfile = self._check_bbappend(testrecipe, recipefile, self.templayerdir)
         self.assertEqual(os.path.basename(bbappendfile), '%s_%%.bbappend' % testrecipe)
 
+    @testcase(1281)
     def test_recipetool_appendsrcfile_subdir_basic(self):
         self._test_appendsrcfile('base-files', 'a-file', 'tmp')
 
+    @testcase(1282)
     def test_recipetool_appendsrcfile_subdir_basic_dirdest(self):
         self._test_appendsrcfile('base-files', destdir='tmp')
 
+    @testcase(1280)
     def test_recipetool_appendsrcfile_srcdir_basic(self):
         testrecipe = 'bash'
         srcdir = get_bb_var('S', testrecipe)
@@ -515,12 +521,14 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
         subdir = os.path.relpath(srcdir, workdir)
         self._test_appendsrcfile(testrecipe, 'a-file', srcdir=subdir)
 
+    @testcase(1275)
     def test_recipetool_appendsrcfile_existing_in_src_uri(self):
         testrecipe = 'base-files'
         filepath = self._get_first_file_uri(testrecipe)
         self.assertTrue(filepath, 'Unable to test, no file:// uri found in SRC_URI for %s' % testrecipe)
         self._test_appendsrcfile(testrecipe, filepath, has_src_uri=False)
 
+    @testcase(1276)
     def test_recipetool_appendsrcfile_existing_in_src_uri_diff_params(self):
         testrecipe = 'base-files'
         subdir = 'tmp'
@@ -530,6 +538,7 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
         output = self._test_appendsrcfile(testrecipe, filepath, subdir, has_src_uri=False)
         self.assertTrue(any('with different parameters' in l for l in output))
 
+    @testcase(1277)
     def test_recipetool_appendsrcfile_replace_file_srcdir(self):
         testrecipe = 'bash'
         filepath = 'Makefile.in'
@@ -541,6 +550,7 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
         bitbake('%s:do_unpack' % testrecipe)
         self.assertEqual(open(self.testfile, 'r').read(), open(os.path.join(srcdir, filepath), 'r').read())
 
+    @testcase(1278)
     def test_recipetool_appendsrcfiles_basic(self, destdir=None):
         newfiles = [self.testfile]
         for i in range(1, 5):
@@ -550,5 +560,6 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
             newfiles.append(testfile)
         self._test_appendsrcfiles('gcc', newfiles, destdir=destdir, options='-W')
 
+    @testcase(1279)
     def test_recipetool_appendsrcfiles_basic_subdir(self):
         self.test_recipetool_appendsrcfiles_basic(destdir='testdir')
diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 9ccc7bb..3c23062 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -34,7 +34,7 @@ class SStateTests(SStateBase):
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_sstate_creation(['binutils-cross-'+ targetarch, 'binutils-native'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
-    @testcase(975)
+    @testcase(1374)
     def test_sstate_creation_distro_specific_fail(self):
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_sstate_creation(['binutils-cross-'+ targetarch, 'binutils-native'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True, should_pass=False)
@@ -43,7 +43,7 @@ class SStateTests(SStateBase):
     def test_sstate_creation_distro_nonspecific_pass(self):
         self.run_test_sstate_creation(['glibc-initial'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
-    @testcase(976)
+    @testcase(1375)
     def test_sstate_creation_distro_nonspecific_fail(self):
         self.run_test_sstate_creation(['glibc-initial'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True, should_pass=False)
 
@@ -70,11 +70,11 @@ class SStateTests(SStateBase):
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_cleansstate_task(['binutils-cross-' + targetarch, 'binutils-native', 'glibc-initial'], distro_specific=True, distro_nonspecific=True, temp_sstate_location=True)
 
-    @testcase(977)
+    @testcase(1376)
     def test_cleansstate_task_distro_nonspecific(self):
         self.run_test_cleansstate_task(['glibc-initial'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
-    @testcase(977)
+    @testcase(1377)
     def test_cleansstate_task_distro_specific(self):
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_cleansstate_task(['binutils-cross-'+ targetarch, 'binutils-native', 'glibc-initial'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
@@ -111,12 +111,12 @@ class SStateTests(SStateBase):
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + targetarch, 'binutils-native'], temp_sstate_location=True)
 
-    @testcase(175)
+    @testcase(1372)
     def test_rebuild_distro_specific_sstate_cross_target(self):
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + targetarch], temp_sstate_location=True)
 
-    @testcase(175)
+    @testcase(1373)
     def test_rebuild_distro_specific_sstate_native_target(self):
         self.run_test_rebuild_distro_specific_sstate(['binutils-native'], temp_sstate_location=True)
 
@@ -283,6 +283,7 @@ NATIVELSBSTRING = \"DistroB\"
         self.maxDiff = None
         self.assertItemsEqual(files1, files2)
 
+    @testcase(1368)
     def test_sstate_allarch_samesigs(self):
         """
         The sstate checksums of allarch packages should be independent of whichever 
@@ -330,6 +331,7 @@ MACHINE = \"qemuarm\"
         self.maxDiff = None
         self.assertItemsEqual(files1, files2)
 
+    @testcase(1369)
     def test_sstate_sametune_samesigs(self):
         """
         The sstate checksums of two identical machines (using the same tune) should be the 
-- 
2.1.0


