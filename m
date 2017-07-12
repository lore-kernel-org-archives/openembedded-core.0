Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4962E78170
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 19:37:11 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 12:37:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,351,1496127600"; d="scan'208";a="286133834"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2017 12:37:11 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 14:37:03 -0500
Message-Id: <c8b1da1ae2094ef0233e4c9495fe5c013f6e572f.1499887935.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv2 17/29] oeqa/selftest/cases: Use wrapper methods from OESelfTestCase class
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
X-List-Received-Date: Wed, 12 Jul 2017 19:37:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to support threaded runs in oe-selftest cases, there is a need
to use wrapper methods that takes into account the current builddir
by Test class.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../lib/oeqa/selftest/cases/_sstatetests_noauto.py |  16 ++--
 meta/lib/oeqa/selftest/cases/archiver.py           |  21 +++--
 meta/lib/oeqa/selftest/cases/bblayers.py           |  45 ++++-----
 meta/lib/oeqa/selftest/cases/bbtests.py            | 101 +++++++++++----------
 meta/lib/oeqa/selftest/cases/buildhistory.py       |   9 +-
 meta/lib/oeqa/selftest/cases/buildoptions.py       |  51 ++++++-----
 meta/lib/oeqa/selftest/cases/containerimage.py     |   9 +-
 meta/lib/oeqa/selftest/cases/distrodata.py         |   7 +-
 meta/lib/oeqa/selftest/cases/image_typedep.py      |   8 +-
 meta/lib/oeqa/selftest/cases/layerappend.py        |  22 ++---
 meta/lib/oeqa/selftest/cases/liboe.py              |  13 +--
 meta/lib/oeqa/selftest/cases/lic_checksum.py       |   8 +-
 meta/lib/oeqa/selftest/cases/manifest.py           |  13 +--
 meta/lib/oeqa/selftest/cases/oelib/buildhistory.py |   7 +-
 meta/lib/oeqa/selftest/cases/oescripts.py          |   5 +-
 meta/lib/oeqa/selftest/cases/package.py            |  10 +-
 meta/lib/oeqa/selftest/cases/pkgdata.py            |  73 +++++++--------
 meta/lib/oeqa/selftest/cases/prservice.py          |  19 ++--
 meta/lib/oeqa/selftest/cases/signing.py            |  38 ++++----
 meta/lib/oeqa/selftest/cases/sstate.py             |   5 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py        |  51 ++++++-----
 21 files changed, 273 insertions(+), 258 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
index 98b8b60f51a..08e71f33526 100644
--- a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
+++ b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
@@ -2,19 +2,15 @@ import os
 import shutil
 
 import oeqa.utils.ftools as ftools
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.selftest.cases.sstate import SStateBase
 
-
 class RebuildFromSState(SStateBase):
-
-    @classmethod
-    def setUpClass(self):
-        super(RebuildFromSState, self).setUpClass()
+    _use_own_builddir = True
+    _main_thread = False
 
     def get_dep_targets(self, primary_targets):
         found_targets = []
-        bitbake("-g " + ' '.join(map(str, primary_targets)))
+        self.bitbake("-g " + ' '.join(map(str, primary_targets)))
         with open(os.path.join(self.builddir, 'pn-buildlist'), 'r') as pnfile:
             found_targets = pnfile.read().splitlines()
         return found_targets
@@ -59,7 +55,7 @@ class RebuildFromSState(SStateBase):
             rebuild_targets = primary_targets
 
         self.configure_builddir(buildA)
-        runCmd((". %s/oe-init-build-env %s && " % (get_bb_var('COREBASE'), buildA)) + 'bitbake  ' + ' '.join(map(str, primary_targets)), shell=True, executable='/bin/bash')
+        self.runCmd((". %s/oe-init-build-env %s && " % (self.get_bb_var('COREBASE'), buildA)) + 'bitbake  ' + ' '.join(map(str, primary_targets)), shell=True, executable='/bin/bash')
         self.hardlink_tree(os.path.join(buildA, 'sstate-cache'), os.path.join(self.builddir, 'sstate-cache-buildA'))
         shutil.rmtree(buildA)
 
@@ -69,13 +65,13 @@ class RebuildFromSState(SStateBase):
             self.configure_builddir(buildB)
             self.hardlink_tree(os.path.join(self.builddir, 'sstate-cache-buildA'), os.path.join(buildB, 'sstate-cache'))
 
-            result_cleansstate = runCmd((". %s/oe-init-build-env %s && " % (get_bb_var('COREBASE'), buildB)) + 'bitbake -ccleansstate ' + target, ignore_status=True, shell=True, executable='/bin/bash')
+            result_cleansstate = self.runCmd((". %s/oe-init-build-env %s && " % (self.get_bb_var('COREBASE'), buildB)) + 'bitbake -ccleansstate ' + target, ignore_status=True, shell=True, executable='/bin/bash')
             if not result_cleansstate.status == 0:
                 failed_cleansstate.append(target)
                 shutil.rmtree(buildB)
                 continue
 
-            result_build = runCmd((". %s/oe-init-build-env %s && " % (get_bb_var('COREBASE'), buildB)) + 'bitbake ' + target, ignore_status=True, shell=True, executable='/bin/bash')
+            result_build = self.runCmd((". %s/oe-init-build-env %s && " % (self.get_bb_var('COREBASE'), buildB)) + 'bitbake ' + target, ignore_status=True, shell=True, executable='/bin/bash')
             if not result_build.status == 0:
                 failed_rebuild.append(target)
 
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 72026d573cc..347d0a8a5f5 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -1,10 +1,11 @@
 import os
 import glob
-from oeqa.utils.commands import bitbake, get_bb_vars
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator.oeid import OETestID
 
 class Archiver(OESelftestTestCase):
+    _use_own_builddir = True
+    _main_thread = False
 
     @OETestID(1345)
     def test_archiver_allows_to_filter_on_recipe_name(self):
@@ -26,10 +27,10 @@ class Archiver(OESelftestTestCase):
         features += 'COPYLEFT_PN_EXCLUDE = "%s"\n' % exclude_recipe
         self.write_config(features)
 
-        bitbake('-c clean %s %s' % (include_recipe, exclude_recipe))
-        bitbake("-c deploy_archives %s %s" % (include_recipe, exclude_recipe))
+        self.bitbake('-c clean %s %s' % (include_recipe, exclude_recipe))
+        self.bitbake("-c deploy_archives %s %s" % (include_recipe, exclude_recipe))
 
-        bb_vars = get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS'])
+        bb_vars = self.get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS'])
         src_path = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['TARGET_SYS'])
 
         # Check that include_recipe was included
@@ -58,10 +59,10 @@ class Archiver(OESelftestTestCase):
         features += 'COPYLEFT_RECIPE_TYPES = "target"\n'
         self.write_config(features)
 
-        bitbake('-c clean %s %s' % (target_recipe, native_recipe))
-        bitbake("%s -c deploy_archives %s" % (target_recipe, native_recipe))
+        self.bitbake('-c clean %s %s' % (target_recipe, native_recipe))
+        self.bitbake("%s -c deploy_archives %s" % (target_recipe, native_recipe))
 
-        bb_vars = get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS', 'BUILD_SYS'])
+        bb_vars = self.get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS', 'BUILD_SYS'])
         src_path_target = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['TARGET_SYS'])
         src_path_native = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['BUILD_SYS'])
 
@@ -95,10 +96,10 @@ class Archiver(OESelftestTestCase):
         features += 'COPYLEFT_PN_EXCLUDE = "%s"\n' % target_recipes[1]
         self.write_config(features)
 
-        bitbake('-c clean %s %s' % (' '.join(target_recipes), ' '.join(native_recipes)))
-        bitbake('-c deploy_archives %s %s' % (' '.join(target_recipes), ' '.join(native_recipes)))
+        self.bitbake('-c clean %s %s' % (' '.join(target_recipes), ' '.join(native_recipes)))
+        self.bitbake('-c deploy_archives %s %s' % (' '.join(target_recipes), ' '.join(native_recipes)))
 
-        bb_vars = get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS', 'BUILD_SYS'])
+        bb_vars = self.get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS', 'BUILD_SYS'])
         src_path_target = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['TARGET_SYS'])
         src_path_native = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['BUILD_SYS'])
 
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 90a2249b081..12a741323bd 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -2,33 +2,34 @@ import os
 import re
 
 import oeqa.utils.ftools as ftools
-from oeqa.utils.commands import runCmd, get_bb_var
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator.oeid import OETestID
 
 class BitbakeLayers(OESelftestTestCase):
+    _use_own_builddir = True
+    _main_thread = False
 
     @OETestID(756)
     def test_bitbakelayers_showcrossdepends(self):
-        result = runCmd('bitbake-layers show-cross-depends')
+        result = self.runCmd('bitbake-layers show-cross-depends')
         self.assertTrue('aspell' in result.output, msg = "No dependencies were shown. bitbake-layers show-cross-depends output: %s" % result.output)
 
     @OETestID(83)
     def test_bitbakelayers_showlayers(self):
-        result = runCmd('bitbake-layers show-layers')
+        result = self.runCmd('bitbake-layers show-layers')
         self.assertTrue('meta-selftest' in result.output, msg = "No layers were shown. bitbake-layers show-layers output: %s" % result.output)
 
     @OETestID(93)
     def test_bitbakelayers_showappends(self):
         recipe = "xcursor-transparent-theme"
         bb_file = self.get_recipe_basename(recipe)
-        result = runCmd('bitbake-layers show-appends')
+        result = self.runCmd('bitbake-layers show-appends')
         self.assertTrue(bb_file in result.output, msg="%s file was not recognised. bitbake-layers show-appends output: %s" % (bb_file, result.output))
 
     @OETestID(90)
     def test_bitbakelayers_showoverlayed(self):
-        result = runCmd('bitbake-layers show-overlayed')
+        result = self.runCmd('bitbake-layers show-overlayed')
         self.assertTrue('aspell' in result.output, msg="aspell overlayed recipe was not recognised bitbake-layers show-overlayed %s" % result.output)
 
     @OETestID(95)
@@ -39,7 +40,7 @@ class BitbakeLayers(OESelftestTestCase):
         testoutdir = os.path.join(self.builddir, 'test_bitbakelayers_flatten')
         self.assertFalse(os.path.isdir(testoutdir), msg = "test_bitbakelayers_flatten should not exist at this point in time")
         self.track_for_cleanup(testoutdir)
-        result = runCmd('bitbake-layers flatten %s' % testoutdir)
+        result = self.runCmd('bitbake-layers flatten %s' % testoutdir)
         bb_file = os.path.join(testoutdir, recipe_path, recipe_file)
         self.assertTrue(os.path.isfile(bb_file), msg = "Cannot find xcursor-transparent-theme_0.1.1.bb in the test_bitbakelayers_flatten local dir.")
         contents = ftools.read_file(bb_file)
@@ -48,46 +49,46 @@ class BitbakeLayers(OESelftestTestCase):
 
     @OETestID(1195)
     def test_bitbakelayers_add_remove(self):
-        test_layer = os.path.join(get_bb_var('COREBASE'), 'meta-skeleton')
-        result = runCmd('bitbake-layers show-layers')
+        test_layer = os.path.join(self.get_bb_var('COREBASE'), 'meta-skeleton')
+        result = self.runCmd('bitbake-layers show-layers')
         self.assertNotIn('meta-skeleton', result.output, "This test cannot run with meta-skeleton in bblayers.conf. bitbake-layers show-layers output: %s" % result.output)
-        result = runCmd('bitbake-layers add-layer %s' % test_layer)
-        result = runCmd('bitbake-layers show-layers')
+        result = self.runCmd('bitbake-layers add-layer %s' % test_layer)
+        result = self.runCmd('bitbake-layers show-layers')
         self.assertIn('meta-skeleton', result.output, msg = "Something wrong happened. meta-skeleton layer was not added to conf/bblayers.conf.  bitbake-layers show-layers output: %s" % result.output)
-        result = runCmd('bitbake-layers remove-layer %s' % test_layer)
-        result = runCmd('bitbake-layers show-layers')
+        result = self.runCmd('bitbake-layers remove-layer %s' % test_layer)
+        result = self.runCmd('bitbake-layers show-layers')
         self.assertNotIn('meta-skeleton', result.output, msg = "meta-skeleton should have been removed at this step.  bitbake-layers show-layers output: %s" % result.output)
-        result = runCmd('bitbake-layers add-layer %s' % test_layer)
-        result = runCmd('bitbake-layers show-layers')
+        result = self.runCmd('bitbake-layers add-layer %s' % test_layer)
+        result = self.runCmd('bitbake-layers show-layers')
         self.assertIn('meta-skeleton', result.output, msg = "Something wrong happened. meta-skeleton layer was not added to conf/bblayers.conf.  bitbake-layers show-layers output: %s" % result.output)
-        result = runCmd('bitbake-layers remove-layer */meta-skeleton')
-        result = runCmd('bitbake-layers show-layers')
+        result = self.runCmd('bitbake-layers remove-layer */meta-skeleton')
+        result = self.runCmd('bitbake-layers show-layers')
         self.assertNotIn('meta-skeleton', result.output, msg = "meta-skeleton should have been removed at this step.  bitbake-layers show-layers output: %s" % result.output)
 
     @OETestID(1384)
     def test_bitbakelayers_showrecipes(self):
-        result = runCmd('bitbake-layers show-recipes')
+        result = self.runCmd('bitbake-layers show-recipes')
         self.assertIn('aspell:', result.output)
         self.assertIn('mtd-utils:', result.output)
         self.assertIn('core-image-minimal:', result.output)
-        result = runCmd('bitbake-layers show-recipes mtd-utils')
+        result = self.runCmd('bitbake-layers show-recipes mtd-utils')
         self.assertIn('mtd-utils:', result.output)
         self.assertNotIn('aspell:', result.output)
-        result = runCmd('bitbake-layers show-recipes -i image')
+        result = self.runCmd('bitbake-layers show-recipes -i image')
         self.assertIn('core-image-minimal', result.output)
         self.assertNotIn('mtd-utils:', result.output)
-        result = runCmd('bitbake-layers show-recipes -i cmake,pkgconfig')
+        result = self.runCmd('bitbake-layers show-recipes -i cmake,pkgconfig')
         self.assertIn('libproxy:', result.output)
         self.assertNotIn('mtd-utils:', result.output) # doesn't inherit either
         self.assertNotIn('wget:', result.output) # doesn't inherit cmake
         self.assertNotIn('waffle:', result.output) # doesn't inherit pkgconfig
-        result = runCmd('bitbake-layers show-recipes -i nonexistentclass', ignore_status=True)
+        result = self.runCmd('bitbake-layers show-recipes -i nonexistentclass', ignore_status=True)
         self.assertNotEqual(result.status, 0, 'bitbake-layers show-recipes -i nonexistentclass should have failed')
         self.assertIn('ERROR:', result.output)
 
     def get_recipe_basename(self, recipe):
         recipe_file = ""
-        result = runCmd("bitbake-layers show-recipes -f %s" % recipe)
+        result = self.runCmd("bitbake-layers show-recipes -f %s" % recipe)
         for line in result.output.splitlines():
             if recipe in line:
                 recipe_file = line
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index df11a6bc6d0..9e61b8c27d0 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -2,12 +2,12 @@ import os
 import re
 
 import oeqa.utils.ftools as ftools
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
-
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator.oeid import OETestID
 
 class BitbakeTests(OESelftestTestCase):
+    _use_own_builddir = True
+    _main_thread = False
 
     def getline(self, res, line):
         for l in res.output.split('\n'):
@@ -16,20 +16,20 @@ class BitbakeTests(OESelftestTestCase):
 
     @OETestID(789)
     def test_run_bitbake_from_dir_1(self):
-        os.chdir(os.path.join(self.builddir, 'conf'))
-        self.assertEqual(bitbake('-e').status, 0, msg = "bitbake couldn't run from \"conf\" dir")
+        kwargs = {}
+        kwargs['cwd'] = os.path.join(self.builddir, 'conf')
+        self.assertEqual(self.bitbake('-e', **kwargs).status, 0, msg = "bitbake couldn't run from \"conf\" dir")
 
     @OETestID(790)
     def test_run_bitbake_from_dir_2(self):
         my_env = os.environ.copy()
         my_env['BBPATH'] = self.builddir
-        os.chdir(os.path.dirname(self.builddir))
-        self.assertEqual(bitbake('-e', env=my_env).status, 0, msg = "bitbake couldn't run from builddir")
+        self.assertEqual(self.bitbake('-e', env=my_env).status, 0, msg = "bitbake couldn't run from builddir")
 
     @OETestID(806)
     def test_event_handler(self):
         self.write_config("INHERIT += \"test_events\"")
-        result = bitbake('m4-native')
+        result = self.bitbake('m4-native')
         find_build_started = re.search("NOTE: Test for bb\.event\.BuildStarted(\n.*)*NOTE: Executing RunQueue Tasks", result.output)
         find_build_completed = re.search("Tasks Summary:.*(\n.*)*NOTE: Test for bb\.event\.BuildCompleted", result.output)
         self.assertTrue(find_build_started, msg = "Match failed in:\n%s"  % result.output)
@@ -38,25 +38,25 @@ class BitbakeTests(OESelftestTestCase):
 
     @OETestID(103)
     def test_local_sstate(self):
-        bitbake('m4-native')
-        bitbake('m4-native -cclean')
-        result = bitbake('m4-native')
+        self.bitbake('m4-native')
+        self.bitbake('m4-native -cclean')
+        result = self.bitbake('m4-native')
         find_setscene = re.search("m4-native.*do_.*_setscene", result.output)
         self.assertTrue(find_setscene, msg = "No \"m4-native.*do_.*_setscene\" message found during bitbake m4-native. bitbake output: %s" % result.output )
 
     @OETestID(105)
     def test_bitbake_invalid_recipe(self):
-        result = bitbake('-b asdf', ignore_status=True)
+        result = self.bitbake('-b asdf', ignore_status=True)
         self.assertTrue("ERROR: Unable to find any recipe file matching 'asdf'" in result.output, msg = "Though asdf recipe doesn't exist, bitbake didn't output any err. message. bitbake output: %s" % result.output)
 
     @OETestID(107)
     def test_bitbake_invalid_target(self):
-        result = bitbake('asdf', ignore_status=True)
+        result = self.bitbake('asdf', ignore_status=True)
         self.assertTrue("ERROR: Nothing PROVIDES 'asdf'" in result.output, msg = "Though no 'asdf' target exists, bitbake didn't output any err. message. bitbake output: %s" % result.output)
 
     @OETestID(106)
     def test_warnings_errors(self):
-        result = bitbake('-b asdf', ignore_status=True)
+        result = self.bitbake('-b asdf', ignore_status=True)
         find_warnings = re.search("Summary: There w.{2,3}? [1-9][0-9]* WARNING messages* shown", result.output)
         find_errors = re.search("Summary: There w.{2,3}? [1-9][0-9]* ERROR messages* shown", result.output)
         self.assertTrue(find_warnings, msg="Did not find the mumber of warnings at the end of the build:\n" + result.output)
@@ -68,9 +68,9 @@ class BitbakeTests(OESelftestTestCase):
         # patch to fail.
         self.write_recipeinc('man', 'SRC_URI += "file://man-1.5h1-make.patch"')
         self.write_config("INHERIT_remove = \"report-error\"")
-        result = bitbake('man -c patch', ignore_status=True)
+        result = self.bitbake('man -c patch', ignore_status=True)
         self.delete_recipeinc('man')
-        bitbake('-cclean man')
+        self.bitbake('-cclean man')
         line = self.getline(result, "Function failed: patch_do_patch")
         self.assertTrue(line and line.startswith("ERROR:"), msg = "Repeated patch application didn't fail. bitbake output: %s" % result.output)
 
@@ -79,24 +79,24 @@ class BitbakeTests(OESelftestTestCase):
         # test 1 from bug 5875
         test_recipe = 'zlib'
         test_data = "Microsoft Made No Profit From Anyone's Zunes Yo"
-        bb_vars = get_bb_vars(['D', 'PKGDEST', 'mandir'], test_recipe)
+        bb_vars = self.get_bb_vars(['D', 'PKGDEST', 'mandir'], test_recipe)
         image_dir = bb_vars['D']
         pkgsplit_dir = bb_vars['PKGDEST']
         man_dir = bb_vars['mandir']
 
-        bitbake('-c clean %s' % test_recipe)
-        bitbake('-c package -f %s' % test_recipe)
+        self.bitbake('-c clean %s' % test_recipe)
+        self.bitbake('-c package -f %s' % test_recipe)
         self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
 
         man_file = os.path.join(image_dir + man_dir, 'man3/zlib.3')
         ftools.append_file(man_file, test_data)
-        bitbake('-c package -f %s' % test_recipe)
+        self.bitbake('-c package -f %s' % test_recipe)
 
         man_split_file = os.path.join(pkgsplit_dir, 'zlib-doc' + man_dir, 'man3/zlib.3')
         man_split_content = ftools.read_file(man_split_file)
         self.assertIn(test_data, man_split_content, 'The man file has not changed in packages-split.')
 
-        ret = bitbake(test_recipe)
+        ret = self.bitbake(test_recipe)
         self.assertIn('task do_package_write_rpm:', ret.output, 'Task do_package_write_rpm did not re-executed.')
 
     @OETestID(163)
@@ -104,26 +104,27 @@ class BitbakeTests(OESelftestTestCase):
         # test 2 from bug 5875
         test_recipe = 'zlib'
 
-        bitbake(test_recipe)
+        self.bitbake(test_recipe)
         self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
 
-        result = bitbake('-C compile %s' % test_recipe)
+        result = self.bitbake('-C compile %s' % test_recipe)
         look_for_tasks = ['do_compile:', 'do_install:', 'do_populate_sysroot:', 'do_package:']
         for task in look_for_tasks:
             self.assertIn(task, result.output, msg="Couldn't find %s task.")
 
     @OETestID(167)
     def test_bitbake_g(self):
-        result = bitbake('-g core-image-minimal')
+        result = self.bitbake('-g core-image-minimal')
+
         for f in ['pn-buildlist', 'recipe-depends.dot', 'task-depends.dot']:
-            self.addCleanup(os.remove, f)
+            self.addCleanup(os.remove, os.path.join(self.builddir, f))
         self.assertTrue('Task dependencies saved to \'task-depends.dot\'' in result.output, msg = "No task dependency \"task-depends.dot\" file was generated for the given task target. bitbake output: %s" % result.output)
         self.assertTrue('busybox' in ftools.read_file(os.path.join(self.builddir, 'task-depends.dot')), msg = "No \"busybox\" dependency found in task-depends.dot file.")
 
     @OETestID(899)
     def test_image_manifest(self):
-        bitbake('core-image-minimal')
-        bb_vars = get_bb_vars(["DEPLOY_DIR_IMAGE", "IMAGE_LINK_NAME"], "core-image-minimal")
+        self.bitbake('core-image-minimal')
+        bb_vars = self.get_bb_vars(["DEPLOY_DIR_IMAGE", "IMAGE_LINK_NAME"], "core-image-minimal")
         deploydir = bb_vars["DEPLOY_DIR_IMAGE"]
         imagename = bb_vars["IMAGE_LINK_NAME"]
         manifest = os.path.join(deploydir, imagename + ".manifest")
@@ -139,9 +140,9 @@ INHERIT_remove = \"report-error\"
 """)
         self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
 
-        bitbake('-ccleanall man')
-        result = bitbake('-c fetch man', ignore_status=True)
-        bitbake('-ccleanall man')
+        self.bitbake('-ccleanall man')
+        result = self.bitbake('-c fetch man', ignore_status=True)
+        self.bitbake('-ccleanall man')
         self.delete_recipeinc('man')
         self.assertEqual(result.status, 1, msg="Command succeded when it should have failed. bitbake output: %s" % result.output)
         self.assertTrue('Fetcher failure: Unable to find file file://invalid anywhere. The paths that were searched were:' in result.output, msg = "\"invalid\" file \
@@ -161,32 +162,32 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 
         data = 'SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz;downloadfilename=test-aspell.tar.gz"'
         self.write_recipeinc('aspell', data)
-        result = bitbake('-f -c fetch aspell', ignore_status=True)
+        result = self.bitbake('-f -c fetch aspell', ignore_status=True)
         self.delete_recipeinc('aspell')
         self.assertEqual(result.status, 0, msg = "Couldn't fetch aspell. %s" % result.output)
-        dl_dir = get_bb_var("DL_DIR")
+        dl_dir = self.get_bb_var("DL_DIR")
         self.assertTrue(os.path.isfile(os.path.join(dl_dir, 'test-aspell.tar.gz')), msg = "File rename failed. No corresponding test-aspell.tar.gz file found under %s" % dl_dir)
         self.assertTrue(os.path.isfile(os.path.join(dl_dir, 'test-aspell.tar.gz.done')), "File rename failed. No corresponding test-aspell.tar.gz.done file found under %s" % dl_dir)
 
     @OETestID(1028)
     def test_environment(self):
         self.write_config("TEST_ENV=\"localconf\"")
-        result = runCmd('bitbake -e | grep TEST_ENV=')
+        result = self.runCmd('bitbake -e | grep TEST_ENV=')
         self.assertTrue('localconf' in result.output, msg = "bitbake didn't report any value for TEST_ENV variable. To test, run 'bitbake -e | grep TEST_ENV='")
 
     @OETestID(1029)
     def test_dry_run(self):
-        result = runCmd('bitbake -n m4-native')
+        result = self.runCmd('bitbake -n m4-native')
         self.assertEqual(0, result.status, "bitbake dry run didn't run as expected. %s" % result.output)
 
     @OETestID(1030)
     def test_just_parse(self):
-        result = runCmd('bitbake -p')
+        result = self.runCmd('bitbake -p')
         self.assertEqual(0, result.status, "errors encountered when parsing recipes. %s" % result.output)
 
     @OETestID(1031)
     def test_version(self):
-        result = runCmd('bitbake -s | grep wget')
+        result = self.runCmd('bitbake -s | grep wget')
         find = re.search("wget *:([0-9a-zA-Z\.\-]+)", result.output)
         self.assertTrue(find, "No version returned for searched recipe. bitbake output: %s" % result.output)
 
@@ -194,11 +195,15 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
     def test_prefile(self):
         preconf = os.path.join(self.builddir, 'conf/prefile.conf')
         self.track_for_cleanup(preconf)
+
+        cmd = 'bitbake -r %s -e | grep TEST_PREFILE=' % preconf
+
         ftools.write_file(preconf ,"TEST_PREFILE=\"prefile\"")
-        result = runCmd('bitbake -r conf/prefile.conf -e | grep TEST_PREFILE=')
+        result = self.runCmd(cmd)
         self.assertTrue('prefile' in result.output, "Preconfigure file \"prefile.conf\"was not taken into consideration. ")
+
         self.write_config("TEST_PREFILE=\"localconf\"")
-        result = runCmd('bitbake -r conf/prefile.conf -e | grep TEST_PREFILE=')
+        result = self.runCmd(cmd)
         self.assertTrue('localconf' in result.output, "Preconfigure file \"prefile.conf\"was not taken into consideration.")
 
     @OETestID(1033)
@@ -207,12 +212,12 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.track_for_cleanup(postconf)
         ftools.write_file(postconf , "TEST_POSTFILE=\"postfile\"")
         self.write_config("TEST_POSTFILE=\"localconf\"")
-        result = runCmd('bitbake -R conf/postfile.conf -e | grep TEST_POSTFILE=')
+        result = self.runCmd('bitbake -R conf/postfile.conf -e | grep TEST_POSTFILE=')
         self.assertTrue('postfile' in result.output, "Postconfigure file \"postfile.conf\"was not taken into consideration.")
 
     @OETestID(1034)
     def test_checkuri(self):
-        result = runCmd('bitbake -c checkuri m4')
+        result = self.runCmd('bitbake -c checkuri m4')
         self.assertEqual(0, result.status, msg = "\"checkuri\" task was not executed. bitbake output: %s" % result.output)
 
     @OETestID(1035)
@@ -223,8 +228,8 @@ INHERIT_remove = \"report-error\"
 """)
         self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
         self.write_recipeinc('man',"\ndo_fail_task () {\nexit 1 \n}\n\naddtask do_fail_task before do_fetch\n" )
-        runCmd('bitbake -c cleanall man xcursor-transparent-theme')
-        result = runCmd('bitbake -c unpack -k man xcursor-transparent-theme', ignore_status=True)
+        self.runCmd('bitbake -c cleanall man xcursor-transparent-theme')
+        result = self.runCmd('bitbake -c unpack -k man xcursor-transparent-theme', ignore_status=True)
         errorpos = result.output.find('ERROR: Function failed: do_fail_task')
         manver = re.search("NOTE: recipe xcursor-transparent-theme-(.*?): task do_unpack: Started", result.output)
         continuepos = result.output.find('NOTE: recipe xcursor-transparent-theme-%s: task do_unpack: Started' % manver.group(1))
@@ -233,9 +238,9 @@ INHERIT_remove = \"report-error\"
     @OETestID(1119)
     def test_non_gplv3(self):
         self.write_config('INCOMPATIBLE_LICENSE = "GPLv3"')
-        result = bitbake('selftest-ed', ignore_status=True)
+        result = self.bitbake('selftest-ed', ignore_status=True)
         self.assertEqual(result.status, 0, "Bitbake failed, exit code %s, output %s" % (result.status, result.output))
-        lic_dir = get_bb_var('LICENSE_DIRECTORY')
+        lic_dir = self.get_bb_var('LICENSE_DIRECTORY')
         self.assertFalse(os.path.isfile(os.path.join(lic_dir, 'selftest-ed/generic_GPLv3')))
         self.assertTrue(os.path.isfile(os.path.join(lic_dir, 'selftest-ed/generic_GPLv2')))
 
@@ -244,9 +249,9 @@ INHERIT_remove = \"report-error\"
         """ Bitbake option to restore from sstate only within a build (i.e. execute no real tasks, only setscene)"""
         test_recipe = 'ed'
 
-        bitbake(test_recipe)
-        bitbake('-c clean %s' % test_recipe)
-        ret = bitbake('--setscene-only %s' % test_recipe)
+        self.bitbake(test_recipe)
+        self.bitbake('-c clean %s' % test_recipe)
+        ret = self.bitbake('--setscene-only %s' % test_recipe)
 
         tasks = re.findall(r'task\s+(do_\S+):', ret.output)
 
@@ -258,7 +263,7 @@ INHERIT_remove = \"report-error\"
     def test_bbappend_order(self):
         """ Bitbake should bbappend to recipe in a predictable order """
         test_recipe = 'ed'
-        bb_vars = get_bb_vars(['SUMMARY', 'PV'], test_recipe)
+        bb_vars = self.get_bb_vars(['SUMMARY', 'PV'], test_recipe)
         test_recipe_summary_before = bb_vars['SUMMARY']
         test_recipe_pv = bb_vars['PV']
         recipe_append_file = test_recipe + '_' + test_recipe_pv + '.bbappend'
@@ -275,5 +280,5 @@ INHERIT_remove = \"report-error\"
         self.add_command_to_tearDown('rm -rf %s' % os.path.join(self.testlayer_path, 'recipes-test',
                                                                test_recipe + '_test_*'))
 
-        test_recipe_summary_after = get_bb_var('SUMMARY', test_recipe)
+        test_recipe_summary_after = self.get_bb_var('SUMMARY', test_recipe)
         self.assertEqual(expected_recipe_summary, test_recipe_summary_after)
diff --git a/meta/lib/oeqa/selftest/cases/buildhistory.py b/meta/lib/oeqa/selftest/cases/buildhistory.py
index 06792d9146d..ed0965bf261 100644
--- a/meta/lib/oeqa/selftest/cases/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/buildhistory.py
@@ -3,13 +3,10 @@ import re
 import datetime
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, get_bb_vars
-
 
 class BuildhistoryBase(OESelftestTestCase):
-
     def config_buildhistory(self, tmp_bh_location=False):
-        bb_vars = get_bb_vars(['USER_CLASSES', 'INHERIT'])
+        bb_vars = self.get_bb_vars(['USER_CLASSES', 'INHERIT'])
         if (not 'buildhistory' in bb_vars['USER_CLASSES']) and (not 'buildhistory' in bb_vars['INHERIT']):
             add_buildhistory_config = 'INHERIT += "buildhistory"\nBUILDHISTORY_COMMIT = "1"'
             self.append_config(add_buildhistory_config)
@@ -30,8 +27,8 @@ class BuildhistoryBase(OESelftestTestCase):
 
         self.append_config(global_config)
         self.append_recipeinc(target, target_config)
-        bitbake("-cclean %s" % target)
-        result = bitbake(target, ignore_status=True)
+        self.bitbake("-cclean %s" % target)
+        result = self.bitbake(target, ignore_status=True)
         self.remove_config(global_config)
         self.remove_recipeinc(target, target_config)
 
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 1f1bb7ae631..9efe8fb1b08 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -5,51 +5,52 @@ import shutil
 import tempfile
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.selftest.cases.buildhistory import BuildhistoryBase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 import oeqa.utils.ftools as ftools
 from oeqa.core.decorator.oeid import OETestID
 
 class ImageOptionsTests(OESelftestTestCase):
+    _use_own_builddir = True
+    _main_thread = False
 
     @OETestID(761)
     def test_incremental_image_generation(self):
-        image_pkgtype = get_bb_var("IMAGE_PKGTYPE")
+        image_pkgtype = self.get_bb_var("IMAGE_PKGTYPE")
         if image_pkgtype != 'rpm':
             self.skipTest('Not using RPM as main package format')
-        bitbake("-c clean core-image-minimal")
+        self.bitbake("-c clean core-image-minimal")
         self.write_config('INC_RPM_IMAGE_GEN = "1"')
         self.append_config('IMAGE_FEATURES += "ssh-server-openssh"')
-        bitbake("core-image-minimal")
-        log_data_file = os.path.join(get_bb_var("WORKDIR", "core-image-minimal"), "temp/log.do_rootfs")
+        self.bitbake("core-image-minimal")
+        log_data_file = os.path.join(self.get_bb_var("WORKDIR", "core-image-minimal"), "temp/log.do_rootfs")
         log_data_created = ftools.read_file(log_data_file)
         incremental_created = re.search(r"Installing\s*:\s*packagegroup-core-ssh-openssh", log_data_created)
         self.remove_config('IMAGE_FEATURES += "ssh-server-openssh"')
         self.assertTrue(incremental_created, msg = "Match failed in:\n%s" % log_data_created)
-        bitbake("core-image-minimal")
+        self.bitbake("core-image-minimal")
         log_data_removed = ftools.read_file(log_data_file)
         incremental_removed = re.search(r"Erasing\s*:\s*packagegroup-core-ssh-openssh", log_data_removed)
         self.assertTrue(incremental_removed, msg = "Match failed in:\n%s" % log_data_removed)
 
     @OETestID(286)
     def test_ccache_tool(self):
-        bitbake("ccache-native")
-        bb_vars = get_bb_vars(['SYSROOT_DESTDIR', 'bindir'], 'ccache-native')
+        self.bitbake("ccache-native")
+        bb_vars = self.get_bb_vars(['SYSROOT_DESTDIR', 'bindir'], 'ccache-native')
         p = bb_vars['SYSROOT_DESTDIR'] + bb_vars['bindir'] + "/" + "ccache"
         self.assertTrue(os.path.isfile(p), msg = "No ccache found (%s)" % p)
         self.write_config('INHERIT += "ccache"')
         self.add_command_to_tearDown('bitbake -c clean m4')
-        bitbake("m4 -f -c compile")
-        log_compile = os.path.join(get_bb_var("WORKDIR","m4"), "temp/log.do_compile")
-        res = runCmd("grep ccache %s" % log_compile, ignore_status=True)
+        self.bitbake("m4 -f -c compile")
+        log_compile = os.path.join(self.get_bb_var("WORKDIR","m4"), "temp/log.do_compile")
+        res = self.runCmd("grep ccache %s" % log_compile, ignore_status=True)
         self.assertEqual(0, res.status, msg="No match for ccache in m4 log.do_compile. For further details: %s" % log_compile)
 
     @OETestID(1435)
     def test_read_only_image(self):
-        distro_features = get_bb_var('DISTRO_FEATURES')
+        distro_features = self.get_bb_var('DISTRO_FEATURES')
         if not ('x11' in distro_features and 'opengl' in distro_features):
             self.skipTest('core-image-sato requires x11 and opengl in distro features')
         self.write_config('IMAGE_FEATURES += "read-only-rootfs"')
-        bitbake("core-image-sato")
+        self.bitbake("core-image-sato")
         # do_image will fail if there are any pending postinsts
 
 class DiskMonTest(OESelftestTestCase):
@@ -57,15 +58,15 @@ class DiskMonTest(OESelftestTestCase):
     @OETestID(277)
     def test_stoptask_behavior(self):
         self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"')
-        res = bitbake("m4", ignore_status = True)
+        res = self.bitbake("m4", ignore_status = True)
         self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.output, msg = "Tasks should have stopped. Disk monitor is set to STOPTASK: %s" % res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
         self.write_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},100000G,100K"')
-        res = bitbake("m4", ignore_status = True)
+        res = self.bitbake("m4", ignore_status = True)
         self.assertTrue('ERROR: Immediately abort since the disk space monitor action is "ABORT"!' in res.output, "Tasks should have been aborted immediatelly. Disk monitor is set to ABORT: %s" % res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
         self.write_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},100000G,100K"')
-        res = bitbake("m4")
+        res = self.bitbake("m4")
         self.assertTrue('WARNING: The free space' in res.output, msg = "A warning should have been displayed for disk monitor is set to WARN: %s" %res.output)
 
 class SanityOptionsTest(OESelftestTestCase):
@@ -78,12 +79,12 @@ class SanityOptionsTest(OESelftestTestCase):
     def test_options_warnqa_errorqa_switch(self):
 
         self.write_config("INHERIT_remove = \"report-error\"")
-        if "packages-list" not in get_bb_var("ERROR_QA"):
+        if "packages-list" not in self.get_bb_var("ERROR_QA"):
             self.append_config("ERROR_QA_append = \" packages-list\"")
 
         self.write_recipeinc('xcursor-transparent-theme', 'PACKAGES += \"${PN}-dbg\"')
         self.add_command_to_tearDown('bitbake -c clean xcursor-transparent-theme')
-        res = bitbake("xcursor-transparent-theme -f -c package", ignore_status=True)
+        res = self.bitbake("xcursor-transparent-theme -f -c package", ignore_status=True)
         self.delete_recipeinc('xcursor-transparent-theme')
         line = self.getline(res, "QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors.")
         self.assertTrue(line and line.startswith("ERROR:"), msg=res.output)
@@ -91,7 +92,7 @@ class SanityOptionsTest(OESelftestTestCase):
         self.write_recipeinc('xcursor-transparent-theme', 'PACKAGES += \"${PN}-dbg\"')
         self.append_config('ERROR_QA_remove = "packages-list"')
         self.append_config('WARN_QA_append = " packages-list"')
-        res = bitbake("xcursor-transparent-theme -f -c package")
+        res = self.bitbake("xcursor-transparent-theme -f -c package")
         self.delete_recipeinc('xcursor-transparent-theme')
         line = self.getline(res, "QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors.")
         self.assertTrue(line and line.startswith("WARNING:"), msg=res.output)
@@ -101,7 +102,7 @@ class SanityOptionsTest(OESelftestTestCase):
         self.write_config('WARN_QA_append = " unsafe-references-in-scripts"')
 
         self.add_command_to_tearDown('bitbake -c clean gzip')
-        res = bitbake("gzip -f -c package_qa")
+        res = self.bitbake("gzip -f -c package_qa")
         line = self.getline(res, "QA Issue: gzip")
         self.assertFalse(line, "WARNING: QA Issue: gzip message is present in bitbake's output and shouldn't be: %s" % res.output)
 
@@ -110,7 +111,7 @@ do_install_append_pn-gzip () {
 	echo "\n${bindir}/test" >> ${D}${bindir}/zcat
 }
 """)
-        res = bitbake("gzip -f -c package_qa")
+        res = self.bitbake("gzip -f -c package_qa")
         line = self.getline(res, "QA Issue: gzip")
         self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA Issue: gzip message is not present in bitbake's output: %s" % res.output)
 
@@ -145,7 +146,7 @@ do_install_append_pn-gzip () {
 
         test_recipe = 'ed'
 
-        ret = bitbake('-n %s' % test_recipe)
+        ret = self.bitbake('-n %s' % test_recipe)
 
         err = 'fatal: Not a git repository'
 
@@ -159,7 +160,7 @@ class BuildhistoryTests(BuildhistoryBase):
     @OETestID(293)
     def test_buildhistory_basic(self):
         self.run_buildhistory_operation('xcursor-transparent-theme')
-        self.assertTrue(os.path.isdir(get_bb_var('BUILDHISTORY_DIR')), "buildhistory dir was not created.")
+        self.assertTrue(os.path.isdir(self.get_bb_var('BUILDHISTORY_DIR')), "buildhistory dir was not created.")
 
     @OETestID(294)
     def test_buildhistory_buildtime_pr_backwards(self):
@@ -175,9 +176,9 @@ class ArchiverTest(OESelftestTestCase):
         Test for archiving the work directory and exporting the source files.
         """
         self.write_config("INHERIT += \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nARCHIVER_MODE[srpm] = \"1\"")
-        res = bitbake("xcursor-transparent-theme", ignore_status=True)
+        res = self.bitbake("xcursor-transparent-theme", ignore_status=True)
         self.assertEqual(res.status, 0, "\nCouldn't build xcursortransparenttheme.\nbitbake output %s" % res.output)
-        deploy_dir_src = get_bb_var('DEPLOY_DIR_SRC')
+        deploy_dir_src = self.get_bb_var('DEPLOY_DIR_SRC')
         pkgs_path = g.glob(str(deploy_dir_src) + "/allarch*/xcurs*")
         src_file_glob = str(pkgs_path[0]) + "/xcursor*.src.rpm"
         tar_file_glob = str(pkgs_path[0]) + "/xcursor*.tar.gz"
diff --git a/meta/lib/oeqa/selftest/cases/containerimage.py b/meta/lib/oeqa/selftest/cases/containerimage.py
index 99a5cc9e575..4220d80ac4a 100644
--- a/meta/lib/oeqa/selftest/cases/containerimage.py
+++ b/meta/lib/oeqa/selftest/cases/containerimage.py
@@ -1,7 +1,6 @@
 import os
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, get_bb_vars, runCmd
 from oeqa.core.decorator.oeid import OETestID
 
 # This test builds an image with using the "container" IMAGE_FSTYPE, and
@@ -18,6 +17,8 @@ from oeqa.core.decorator.oeid import OETestID
 # default other than what is in ROOTFS_BOOTSTRAP_INSTALL.
 #
 class ContainerImageTests(OESelftestTestCase):
+    _use_own_builddir = True
+    _main_thread = False
 
     # Verify that when specifying a IMAGE_TYPEDEP_ of the form "foo.bar" that
     # the conversion type bar gets added as a dep as well
@@ -41,7 +42,7 @@ PACKAGE_CLASSES = "package_ipk"
 IMAGE_FEATURES = ""
 """)
 
-        bbvars = get_bb_vars(['bindir', 'sysconfdir', 'localstatedir',
+        bbvars = self.get_bb_vars(['bindir', 'sysconfdir', 'localstatedir',
                               'DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'],
                               target='container-test-image')
         expected_files = [
@@ -75,11 +76,11 @@ IMAGE_FEATURES = ""
         expected_files = sorted(expected_files)
 
         # Build the image of course
-        bitbake('container-test-image')
+        self.bitbake('container-test-image')
 
         image = os.path.join(bbvars['DEPLOY_DIR_IMAGE'],
                              bbvars['IMAGE_LINK_NAME'] + '.tar.bz2')
 
         # Ensure the files in the image are what we expect
-        result = runCmd("tar tf {} | sort".format(image), shell=True)
+        result = self.runCmd("tar tf {} | sort".format(image), shell=True)
         self.assertEqual(result.output.split('\n'), expected_files)
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index d5d286d5cc3..86c99a71b80 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -1,9 +1,10 @@
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 from oeqa.utils.decorators import testcase
 from oeqa.utils.ftools import write_file
 
 class Distrodata(OESelftestTestCase):
+    _use_own_builddir = True
+    _main_thread = False
 
     @classmethod
     def setUpClass(cls):
@@ -21,8 +22,8 @@ class Distrodata(OESelftestTestCase):
         feature += 'LICENSE_FLAGS_WHITELIST += " commercial"\n'
 
         self.write_config(feature)
-        bitbake('-c checkpkg world')
-        checkpkg_result = open(os.path.join(get_bb_var("LOG_DIR"), "checkpkg.csv")).readlines()[1:]
+        self.bitbake('-c checkpkg world')
+        checkpkg_result = open(os.path.join(self.get_bb_var("LOG_DIR"), "checkpkg.csv")).readlines()[1:]
         exceptions = [exc.strip() for exc in open(self.exceptions_path).readlines()]
         failed_upstream_checks = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] if pkg_data[11] == '']
         regressed_failures = set(failed_upstream_checks) - set(exceptions)
diff --git a/meta/lib/oeqa/selftest/cases/image_typedep.py b/meta/lib/oeqa/selftest/cases/image_typedep.py
index e6788853a36..647725760a1 100644
--- a/meta/lib/oeqa/selftest/cases/image_typedep.py
+++ b/meta/lib/oeqa/selftest/cases/image_typedep.py
@@ -1,10 +1,11 @@
 import os
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake
 from oeqa.core.decorator.oeid import OETestID
 
 class ImageTypeDepTests(OESelftestTestCase):
+    _use_own_builddir = True
+    _main_thread = False
 
     # Verify that when specifying a IMAGE_TYPEDEP_ of the form "foo.bar" that
     # the conversion type bar gets added as a dep as well
@@ -27,8 +28,9 @@ inherit image
 """)
         # First get the dependency that should exist for bz2, it will look
         # like CONVERSION_DEPENDS_bz2="somedep"
-        result = bitbake('-e emptytest')
+        result = self.bitbake('-e emptytest')
 
+        dep = ''
         for line in result.output.split('\n'):
             if line.startswith('CONVERSION_DEPENDS_bz2'):
                 dep = line.split('=')[1].strip('"')
@@ -36,7 +38,7 @@ inherit image
 
         # Now get the dependency task list and check for the expected task
         # dependency
-        bitbake('-g emptytest')
+        self.bitbake('-g emptytest')
 
         taskdependsfile = os.path.join(self.builddir, 'task-depends.dot')
         dep =  dep + ".do_populate_sysroot"
diff --git a/meta/lib/oeqa/selftest/cases/layerappend.py b/meta/lib/oeqa/selftest/cases/layerappend.py
index 95621163090..518e31def6f 100644
--- a/meta/lib/oeqa/selftest/cases/layerappend.py
+++ b/meta/lib/oeqa/selftest/cases/layerappend.py
@@ -1,11 +1,13 @@
 import os
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 import oeqa.utils.ftools as ftools
 from oeqa.core.decorator.oeid import OETestID
 
 class LayerAppendTests(OESelftestTestCase):
+    _use_own_builddir = True
+    _main_thread = False
+
     layerconf = """
 # We have a conf and classes directory, append to BBPATH
 BBPATH .= ":${LAYERDIR}"
@@ -51,10 +53,8 @@ SRC_URI_append += "file://appendtest.txt"
 
     @OETestID(1196)
     def test_layer_appends(self):
-        corebase = get_bb_var("COREBASE")
-
         for l in ["0", "1", "2"]:
-            layer = os.path.join(corebase, "meta-layertest" + l)
+            layer = os.path.join(self.builddir, "meta-layertest" + l)
             self.assertFalse(os.path.exists(layer))
             os.mkdir(layer)
             os.mkdir(layer + "/conf")
@@ -78,18 +78,18 @@ SRC_URI_append += "file://appendtest.txt"
                     f.write("Layer 2 test")
             self.track_for_cleanup(layer)
 
-        self.layerappend = "BBLAYERS += \"{0}/meta-layertest0 {0}/meta-layertest1 {0}/meta-layertest2\"".format(corebase)
+        self.layerappend = "BBLAYERS += \"{0}/meta-layertest0 {0}/meta-layertest1 {0}/meta-layertest2\"".format(self.builddir)
         ftools.append_file(self.builddir + "/conf/bblayers.conf", self.layerappend)
-        stagingdir = get_bb_var("SYSROOT_DESTDIR", "layerappendtest")
-        bitbake("layerappendtest")
+        stagingdir = self.get_bb_var("SYSROOT_DESTDIR", "layerappendtest")
+        self.bitbake("layerappendtest")
         data = ftools.read_file(stagingdir + "/appendtest.txt")
         self.assertEqual(data, "Layer 2 test")
-        os.remove(corebase + "/meta-layertest2/recipes-test/layerappendtest/appendtest.txt")
-        bitbake("layerappendtest")
+        os.remove(self.builddir + "/meta-layertest2/recipes-test/layerappendtest/appendtest.txt")
+        self.bitbake("layerappendtest")
         data = ftools.read_file(stagingdir + "/appendtest.txt")
         self.assertEqual(data, "Layer 1 test")
-        with open(corebase + "/meta-layertest2/recipes-test/layerappendtest/appendtest.txt", "w") as f:
+        with open(self.builddir + "/meta-layertest2/recipes-test/layerappendtest/appendtest.txt", "w") as f:
             f.write("Layer 2 test")
-        bitbake("layerappendtest")
+        self.bitbake("layerappendtest")
         data = ftools.read_file(stagingdir + "/appendtest.txt")
         self.assertEqual(data, "Layer 2 test")
diff --git a/meta/lib/oeqa/selftest/cases/liboe.py b/meta/lib/oeqa/selftest/cases/liboe.py
index e84609246a7..cfe15866419 100644
--- a/meta/lib/oeqa/selftest/cases/liboe.py
+++ b/meta/lib/oeqa/selftest/cases/liboe.py
@@ -1,15 +1,16 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator.oeid import OETestID
-from oeqa.utils.commands import get_bb_var, get_bb_vars, bitbake, runCmd
 import oe.path
 import os
 
 class LibOE(OESelftestTestCase):
+    _use_own_builddir = True
+    _main_thread = False
 
     @classmethod
     def setUpClass(cls):
         super(LibOE, cls).setUpClass()
-        cls.tmp_dir = get_bb_var('TMPDIR')
+        cls.tmp_dir = cls.get_bb_var('TMPDIR')
 
     @OETestID(1635)
     def test_copy_tree_special(self):
@@ -54,20 +55,20 @@ class LibOE(OESelftestTestCase):
         testfilename = 'testxattr'
 
         # ensure we have setfattr available
-        bitbake("attr-native")
+        self.bitbake("attr-native")
 
-        bb_vars = get_bb_vars(['SYSROOT_DESTDIR', 'bindir'], 'attr-native')
+        bb_vars = self.get_bb_vars(['SYSROOT_DESTDIR', 'bindir'], 'attr-native')
         destdir = bb_vars['SYSROOT_DESTDIR']
         bindir = bb_vars['bindir']
         bindir = destdir + bindir
 
         # create a file with xattr and copy it
         open(oe.path.join(src, testfilename), 'w+b').close()
-        runCmd('%s/setfattr -n user.oetest -v "testing liboe" %s' % (bindir, oe.path.join(src, testfilename)))
+        self.runCmd('%s/setfattr -n user.oetest -v "testing liboe" %s' % (bindir, oe.path.join(src, testfilename)))
         oe.path.copytree(src, dst)
 
         # ensure file in dest has user.oetest xattr
-        result = runCmd('%s/getfattr -n user.oetest %s' % (bindir, oe.path.join(dst, testfilename)))
+        result = self.runCmd('%s/getfattr -n user.oetest %s' % (bindir, oe.path.join(dst, testfilename)))
         self.assertIn('user.oetest="testing liboe"', result.output, 'Extended attribute not sert in dst')
 
         oe.path.remove(testloc)
diff --git a/meta/lib/oeqa/selftest/cases/lic_checksum.py b/meta/lib/oeqa/selftest/cases/lic_checksum.py
index 37407157c1e..6b4eb32e07c 100644
--- a/meta/lib/oeqa/selftest/cases/lic_checksum.py
+++ b/meta/lib/oeqa/selftest/cases/lic_checksum.py
@@ -2,11 +2,11 @@ import os
 import tempfile
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake
-from oeqa.utils import CommandError
 from oeqa.core.decorator.oeid import OETestID
 
 class LicenseTests(OESelftestTestCase):
+    _use_own_builddir = True
+    _main_thread = False
 
     # Verify that changing a license file that has an absolute path causes
     # the license qa to fail due to a mismatched md5sum.
@@ -24,12 +24,12 @@ INHIBIT_DEFAULT_DEPS = "1"
 LIC_FILES_CHKSUM = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
 SRC_URI = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
 """ % (lic_path, lic_path))
-        result = bitbake(bitbake_cmd)
+        result = self.bitbake(bitbake_cmd)
 
         with open(lic_path, "w") as f:
             f.write("data")
 
         self.write_config("INHERIT_remove = \"report-error\"")
-        result = bitbake(bitbake_cmd, ignore_status=True)
+        result = self.bitbake(bitbake_cmd, ignore_status=True)
         if error_msg not in result.output:
             raise AssertionError(result.output)
diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
index 146071934dd..534a9075902 100644
--- a/meta/lib/oeqa/selftest/cases/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -1,7 +1,6 @@
 import os
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import get_bb_var, get_bb_vars, bitbake
 from oeqa.core.decorator.oeid import OETestID
 
 class ManifestEntry:
@@ -12,6 +11,8 @@ class ManifestEntry:
 
 class VerifyManifest(OESelftestTestCase):
     '''Tests for the manifest files and contents of an image'''
+    _use_own_builddir = True
+    _main_thread = False
 
     @classmethod
     def check_manifest_entries(self, manifest, path):
@@ -37,7 +38,7 @@ class VerifyManifest(OESelftestTestCase):
     @classmethod
     def get_dir_from_bb_var(self, bb_var, target = None):
         target == self.buildtarget if target == None else target
-        directory = get_bb_var(bb_var, target);
+        directory = self.get_bb_var(bb_var, target);
         if not directory or not os.path.isdir(directory):
             self.logger.debug("{}: {} points to {} when target = {}"\
                     .format(self.classname, bb_var, directory, target))
@@ -53,7 +54,7 @@ class VerifyManifest(OESelftestTestCase):
 
         self.logger.info("{}: doing bitbake {} as a prerequisite of the test"\
                 .format(self.classname, self.buildtarget))
-        if bitbake(self.buildtarget).status:
+        if self.bitbake(self.buildtarget).status:
             self.logger.debug("{} Failed to setup {}"\
                     .format(self.classname, self.buildtarget))
             self.skipTest("{}: Cannot setup testing scenario"\
@@ -69,7 +70,7 @@ class VerifyManifest(OESelftestTestCase):
         bbargs = sdktask + ' ' + self.buildtarget
         self.logger.debug("{}: doing bitbake {} as a prerequisite of the test"\
                 .format(self.classname, bbargs))
-        if bitbake(bbargs).status:
+        if self.bitbake(bbargs).status:
             self.logger.debug("{} Failed to bitbake {}"\
                     .format(self.classname, bbargs))
             self.skipTest("{}: Cannot setup testing scenario"\
@@ -84,7 +85,7 @@ class VerifyManifest(OESelftestTestCase):
         try:
             mdir = self.get_dir_from_bb_var('SDK_DEPLOY', self.buildtarget)
             for k in d_target.keys():
-                bb_vars = get_bb_vars(['SDK_NAME', 'SDK_VERSION'], self.buildtarget)
+                bb_vars = self.get_bb_vars(['SDK_NAME', 'SDK_VERSION'], self.buildtarget)
                 mfilename[k] = "{}-toolchain-{}.{}.manifest".format(
                         bb_vars['SDK_NAME'],
                         bb_vars['SDK_VERSION'],
@@ -134,7 +135,7 @@ class VerifyManifest(OESelftestTestCase):
         try:
             mdir = self.get_dir_from_bb_var('DEPLOY_DIR_IMAGE',
                                                 self.buildtarget)
-            mfilename = get_bb_var("IMAGE_LINK_NAME", self.buildtarget)\
+            mfilename = self.get_bb_var("IMAGE_LINK_NAME", self.buildtarget)\
                     + ".manifest"
             mpath = os.path.join(mdir, mfilename)
             if not os.path.isfile(mpath): raise IOError
diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index 08675fd8208..b77aa228a02 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -1,15 +1,18 @@
 import os
 from oeqa.selftest.case import OESelftestTestCase
 import tempfile
-from oeqa.utils.commands import get_bb_var
 from oeqa.core.decorator.oeid import OETestID
+from git import Repo
+from oe.buildhistory_analysis import blob_to_dict, compare_dict_blobs
 
 class TestBlobParsing(OESelftestTestCase):
+    _use_own_builddir = True
+    _main_thread = False
 
     def setUp(self):
         import time
         self.repo_path = tempfile.mkdtemp(prefix='selftest-buildhistory',
-            dir=get_bb_var('TOPDIR'))
+            dir=self.get_bb_var('TOPDIR'))
 
         try:
             from git import Repo
diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index f7fe200cfac..8d6aa04d3e0 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -1,15 +1,16 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.selftest.cases.buildhistory import BuildhistoryBase
-from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var
 from oeqa.core.decorator.oeid import OETestID
 
 class BuildhistoryDiffTests(BuildhistoryBase):
+    _use_own_builddir = True
+    _main_thread = False
 
     @OETestID(295)
     def test_buildhistory_diff(self):
         target = 'xcursor-transparent-theme'
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
         self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True)
-        result = runCmd("buildhistory-diff -p %s" % get_bb_var('BUILDHISTORY_DIR'))
+        result = self.runCmd("buildhistory-diff -p %s" % self.get_bb_var('BUILDHISTORY_DIR'))
         expected_output = 'PR changed from "r1" to "r0"'
         self.assertTrue(expected_output in result.output, msg="Did not find expected output: %s" % result.output)
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 169698f780d..0debb0b2172 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -1,10 +1,12 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator.oeid import OETestID
-from oeqa.utils.commands import bitbake, get_bb_vars
 import subprocess, os
 import oe.path
 
 class VersionOrdering(OESelftestTestCase):
+    _use_own_builddir = True
+    _main_thread = False
+
     # version1, version2, sort order
     tests = (
         ("1.0", "1.0", 0),
@@ -20,11 +22,11 @@ class VersionOrdering(OESelftestTestCase):
         super().setUpClass()
 
         # Build the tools we need and populate a sysroot
-        bitbake("dpkg-native opkg-native rpm-native python3-native")
-        bitbake("build-sysroots -c build_native_sysroot")
+        cls.bitbake("dpkg-native opkg-native rpm-native python3-native")
+        cls.bitbake("build-sysroots -c build_native_sysroot")
 
         # Get the paths so we can point into the sysroot correctly
-        vars = get_bb_vars(["STAGING_DIR", "BUILD_ARCH", "bindir_native", "libdir_native"])
+        vars = cls.get_bb_vars(["STAGING_DIR", "BUILD_ARCH", "bindir_native", "libdir_native"])
         cls.staging = oe.path.join(vars["STAGING_DIR"], vars["BUILD_ARCH"])
         cls.bindir = oe.path.join(cls.staging, vars["bindir_native"])
         cls.libdir = oe.path.join(cls.staging, vars["libdir_native"])
diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index 0b4caf1b2c2..042d6e74442 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -3,80 +3,81 @@ import tempfile
 import fnmatch
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 from oeqa.core.decorator.oeid import OETestID
 
 class OePkgdataUtilTests(OESelftestTestCase):
+    _use_own_builddir = True
+    _main_thread = False
 
     @classmethod
     def setUpClass(cls):
         super(OePkgdataUtilTests, cls).setUpClass()
         # Ensure we have the right data in pkgdata
         cls.logger.info('Running bitbake to generate pkgdata')
-        bitbake('busybox zlib m4')
+        cls.bitbake('busybox zlib m4')
 
     @OETestID(1203)
     def test_lookup_pkg(self):
         # Forward tests
-        result = runCmd('oe-pkgdata-util lookup-pkg "zlib busybox"')
+        result = self.runCmd('oe-pkgdata-util lookup-pkg "zlib busybox"')
         self.assertEqual(result.output, 'libz1\nbusybox')
-        result = runCmd('oe-pkgdata-util lookup-pkg zlib-dev')
+        result = self.runCmd('oe-pkgdata-util lookup-pkg zlib-dev')
         self.assertEqual(result.output, 'libz-dev')
-        result = runCmd('oe-pkgdata-util lookup-pkg nonexistentpkg', ignore_status=True)
+        result = self.runCmd('oe-pkgdata-util lookup-pkg nonexistentpkg', ignore_status=True)
         self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
         # Reverse tests
-        result = runCmd('oe-pkgdata-util lookup-pkg -r "libz1 busybox"')
+        result = self.runCmd('oe-pkgdata-util lookup-pkg -r "libz1 busybox"')
         self.assertEqual(result.output, 'zlib\nbusybox')
-        result = runCmd('oe-pkgdata-util lookup-pkg -r libz-dev')
+        result = self.runCmd('oe-pkgdata-util lookup-pkg -r libz-dev')
         self.assertEqual(result.output, 'zlib-dev')
-        result = runCmd('oe-pkgdata-util lookup-pkg -r nonexistentpkg', ignore_status=True)
+        result = self.runCmd('oe-pkgdata-util lookup-pkg -r nonexistentpkg', ignore_status=True)
         self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
 
     @OETestID(1205)
     def test_read_value(self):
-        result = runCmd('oe-pkgdata-util read-value PN libz1')
+        result = self.runCmd('oe-pkgdata-util read-value PN libz1')
         self.assertEqual(result.output, 'zlib')
-        result = runCmd('oe-pkgdata-util read-value PKG libz1')
+        result = self.runCmd('oe-pkgdata-util read-value PKG libz1')
         self.assertEqual(result.output, 'libz1')
-        result = runCmd('oe-pkgdata-util read-value PKGSIZE m4')
+        result = self.runCmd('oe-pkgdata-util read-value PKGSIZE m4')
         pkgsize = int(result.output.strip())
         self.assertGreater(pkgsize, 1, "Size should be greater than 1. %s" % result.output)
 
     @OETestID(1198)
     def test_find_path(self):
-        result = runCmd('oe-pkgdata-util find-path /lib/libz.so.1')
+        result = self.runCmd('oe-pkgdata-util find-path /lib/libz.so.1')
         self.assertEqual(result.output, 'zlib: /lib/libz.so.1')
-        result = runCmd('oe-pkgdata-util find-path /usr/bin/m4')
+        result = self.runCmd('oe-pkgdata-util find-path /usr/bin/m4')
         self.assertEqual(result.output, 'm4: /usr/bin/m4')
-        result = runCmd('oe-pkgdata-util find-path /not/exist', ignore_status=True)
+        result = self.runCmd('oe-pkgdata-util find-path /not/exist', ignore_status=True)
         self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: Unable to find any package producing path /not/exist')
 
     @OETestID(1204)
     def test_lookup_recipe(self):
-        result = runCmd('oe-pkgdata-util lookup-recipe "libz-staticdev busybox"')
+        result = self.runCmd('oe-pkgdata-util lookup-recipe "libz-staticdev busybox"')
         self.assertEqual(result.output, 'zlib\nbusybox')
-        result = runCmd('oe-pkgdata-util lookup-recipe libz-dbg')
+        result = self.runCmd('oe-pkgdata-util lookup-recipe libz-dbg')
         self.assertEqual(result.output, 'zlib')
-        result = runCmd('oe-pkgdata-util lookup-recipe nonexistentpkg', ignore_status=True)
+        result = self.runCmd('oe-pkgdata-util lookup-recipe nonexistentpkg', ignore_status=True)
         self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
 
     @OETestID(1202)
     def test_list_pkgs(self):
         # No arguments
-        result = runCmd('oe-pkgdata-util list-pkgs')
+        result = self.runCmd('oe-pkgdata-util list-pkgs')
         pkglist = result.output.split()
         self.assertIn('zlib', pkglist, "Listed packages: %s" % result.output)
         self.assertIn('zlib-dev', pkglist, "Listed packages: %s" % result.output)
         # No pkgspec, runtime
-        result = runCmd('oe-pkgdata-util list-pkgs -r')
+        result = self.runCmd('oe-pkgdata-util list-pkgs -r')
         pkglist = result.output.split()
         self.assertIn('libz-dev', pkglist, "Listed packages: %s" % result.output)
         # With recipe specified
-        result = runCmd('oe-pkgdata-util list-pkgs -p zlib')
+        result = self.runCmd('oe-pkgdata-util list-pkgs -p zlib')
         pkglist = sorted(result.output.split())
         try:
             pkglist.remove('zlib-ptest') # in case ptest is disabled
@@ -84,7 +85,7 @@ class OePkgdataUtilTests(OESelftestTestCase):
             pass
         self.assertEqual(pkglist, ['zlib', 'zlib-dbg', 'zlib-dev', 'zlib-doc', 'zlib-staticdev'], "Packages listed after remove: %s" % result.output)
         # With recipe specified, runtime
-        result = runCmd('oe-pkgdata-util list-pkgs -p zlib -r')
+        result = self.runCmd('oe-pkgdata-util list-pkgs -p zlib -r')
         pkglist = sorted(result.output.split())
         try:
             pkglist.remove('libz-ptest') # in case ptest is disabled
@@ -92,19 +93,19 @@ class OePkgdataUtilTests(OESelftestTestCase):
             pass
         self.assertEqual(pkglist, ['libz-dbg', 'libz-dev', 'libz-doc', 'libz-staticdev', 'libz1'], "Packages listed after remove: %s" % result.output)
         # With recipe specified and unpackaged
-        result = runCmd('oe-pkgdata-util list-pkgs -p zlib -u')
+        result = self.runCmd('oe-pkgdata-util list-pkgs -p zlib -u')
         pkglist = sorted(result.output.split())
         self.assertIn('zlib-locale', pkglist, "Listed packages: %s" % result.output)
         # With recipe specified and unpackaged, runtime
-        result = runCmd('oe-pkgdata-util list-pkgs -p zlib -u -r')
+        result = self.runCmd('oe-pkgdata-util list-pkgs -p zlib -u -r')
         pkglist = sorted(result.output.split())
         self.assertIn('libz-locale', pkglist, "Listed packages: %s" % result.output)
         # With recipe specified and pkgspec
-        result = runCmd('oe-pkgdata-util list-pkgs -p zlib "*-d*"')
+        result = self.runCmd('oe-pkgdata-util list-pkgs -p zlib "*-d*"')
         pkglist = sorted(result.output.split())
         self.assertEqual(pkglist, ['zlib-dbg', 'zlib-dev', 'zlib-doc'], "Packages listed: %s" % result.output)
         # With recipe specified and pkgspec, runtime
-        result = runCmd('oe-pkgdata-util list-pkgs -p zlib -r "*-d*"')
+        result = self.runCmd('oe-pkgdata-util list-pkgs -p zlib -r "*-d*"')
         pkglist = sorted(result.output.split())
         self.assertEqual(pkglist, ['libz-dbg', 'libz-dev', 'libz-doc'], "Packages listed: %s" % result.output)
 
@@ -122,20 +123,20 @@ class OePkgdataUtilTests(OESelftestTestCase):
                     curpkg = line.split(':')[0]
                     files[curpkg] = []
             return files
-        bb_vars = get_bb_vars(['base_libdir', 'libdir', 'includedir', 'mandir'])
+        bb_vars = self.get_bb_vars(['base_libdir', 'libdir', 'includedir', 'mandir'])
         base_libdir = bb_vars['base_libdir']
         libdir = bb_vars['libdir']
         includedir = bb_vars['includedir']
         mandir = bb_vars['mandir']
         # Test recipe-space package name
-        result = runCmd('oe-pkgdata-util list-pkg-files zlib-dev zlib-doc')
+        result = self.runCmd('oe-pkgdata-util list-pkg-files zlib-dev zlib-doc')
         files = splitoutput(result.output)
         self.assertIn('zlib-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
         self.assertIn('zlib-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
         # Test runtime package name
-        result = runCmd('oe-pkgdata-util list-pkg-files -r libz1 libz-dev')
+        result = self.runCmd('oe-pkgdata-util list-pkg-files -r libz1 libz-dev')
         files = splitoutput(result.output)
         self.assertIn('libz1', list(files.keys()), "listed pkgs. files: %s" %result.output)
         self.assertIn('libz-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
@@ -149,7 +150,7 @@ class OePkgdataUtilTests(OESelftestTestCase):
         self.assertTrue(found, 'Could not find zlib library file %s in libz1 package file list: %s' % (libspec, files['libz1']))
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['libz-dev'])
         # Test recipe
-        result = runCmd('oe-pkgdata-util list-pkg-files -p zlib')
+        result = self.runCmd('oe-pkgdata-util list-pkg-files -p zlib')
         files = splitoutput(result.output)
         self.assertIn('zlib-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
         self.assertIn('zlib-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
@@ -162,7 +163,7 @@ class OePkgdataUtilTests(OESelftestTestCase):
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
         self.assertIn(os.path.join(libdir, 'libz.a'), files['zlib-staticdev'])
         # Test recipe, runtime
-        result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -r')
+        result = self.runCmd('oe-pkgdata-util list-pkg-files -p zlib -r')
         files = splitoutput(result.output)
         self.assertIn('libz-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
         self.assertIn('libz-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
@@ -174,7 +175,7 @@ class OePkgdataUtilTests(OESelftestTestCase):
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['libz-doc'])
         self.assertIn(os.path.join(libdir, 'libz.a'), files['libz-staticdev'])
         # Test recipe, unpackaged
-        result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -u')
+        result = self.runCmd('oe-pkgdata-util list-pkg-files -p zlib -u')
         files = splitoutput(result.output)
         self.assertIn('zlib-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
         self.assertIn('zlib-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
@@ -186,7 +187,7 @@ class OePkgdataUtilTests(OESelftestTestCase):
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
         self.assertIn(os.path.join(libdir, 'libz.a'), files['zlib-staticdev'])
         # Test recipe, runtime, unpackaged
-        result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -r -u')
+        result = self.runCmd('oe-pkgdata-util list-pkg-files -p zlib -r -u')
         files = splitoutput(result.output)
         self.assertIn('libz-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
         self.assertIn('libz-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
@@ -206,19 +207,19 @@ class OePkgdataUtilTests(OESelftestTestCase):
         with open(pkglistfile, 'w') as f:
             f.write('libz1\n')
             f.write('busybox\n')
-        result = runCmd('oe-pkgdata-util glob %s "*-dev"' % pkglistfile)
+        result = self.runCmd('oe-pkgdata-util glob %s "*-dev"' % pkglistfile)
         desiredresult = ['libz-dev', 'busybox-dev']
         self.assertEqual(sorted(result.output.split()), sorted(desiredresult))
         # The following should not error (because when we use this during rootfs construction, sometimes the complementary package won't exist)
-        result = runCmd('oe-pkgdata-util glob %s "*-nonexistent"' % pkglistfile)
+        result = self.runCmd('oe-pkgdata-util glob %s "*-nonexistent"' % pkglistfile)
         self.assertEqual(result.output, '')
         # Test exclude option
-        result = runCmd('oe-pkgdata-util glob %s "*-dev *-dbg" -x "^libz"' % pkglistfile)
+        result = self.runCmd('oe-pkgdata-util glob %s "*-dev *-dbg" -x "^libz"' % pkglistfile)
         resultlist = result.output.split()
         self.assertNotIn('libz-dev', resultlist)
         self.assertNotIn('libz-dbg', resultlist)
 
     @OETestID(1206)
     def test_specify_pkgdatadir(self):
-        result = runCmd('oe-pkgdata-util -p %s lookup-pkg zlib' % get_bb_var('PKGDATA_DIR'))
+        result = self.runCmd('oe-pkgdata-util -p %s lookup-pkg zlib' % self.get_bb_var('PKGDATA_DIR'))
         self.assertEqual(result.output, 'libz1')
diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index ed36f0fed76..67ef931927b 100644
--- a/meta/lib/oeqa/selftest/cases/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -5,16 +5,17 @@ import datetime
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.network import get_free_port
 
 class BitbakePrTests(OESelftestTestCase):
+    _use_own_builddir = True
+    _main_thread = False
 
     @classmethod
     def setUpClass(cls):
         super(BitbakePrTests, cls).setUpClass()
-        cls.pkgdata_dir = get_bb_var('PKGDATA_DIR')
+        cls.pkgdata_dir = cls.get_bb_var('PKGDATA_DIR')
 
     def get_pr_version(self, package_name):
         package_data_file = os.path.join(self.pkgdata_dir, 'runtime', package_name)
@@ -24,7 +25,7 @@ class BitbakePrTests(OESelftestTestCase):
         return int(find_pr.group(1))
 
     def get_task_stamp(self, package_name, recipe_task):
-        stampdata = get_bb_var('STAMP', target=package_name).split('/')
+        stampdata = self.get_bb_var('STAMP', target=package_name).split('/')
         prefix = stampdata[-1]
         package_stamps_path = "/".join(stampdata[:-1])
         stamps = []
@@ -39,7 +40,7 @@ class BitbakePrTests(OESelftestTestCase):
     def increment_package_pr(self, package_name):
         inc_data = "do_package_append() {\n    bb.build.exec_func('do_test_prserv', d)\n}\ndo_test_prserv() {\necho \"The current date is: %s\"\n}" % datetime.datetime.now()
         self.write_recipeinc(package_name, inc_data)
-        res = bitbake(package_name, ignore_status=True)
+        res = self.bitbake(package_name, ignore_status=True)
         self.delete_recipeinc(package_name)
         self.assertEqual(res.status, 0, msg=res.output)
         self.assertTrue("NOTE: Started PRServer with DBfile" in res.output, msg=res.output)
@@ -71,15 +72,15 @@ class BitbakePrTests(OESelftestTestCase):
         pr_1 = self.get_pr_version(package_name)
 
         exported_db_path = os.path.join(self.builddir, 'export.inc')
-        export_result = runCmd("bitbake-prserv-tool export %s" % exported_db_path, ignore_status=True)
+        export_result = self.runCmd("bitbake-prserv-tool export %s" % exported_db_path, ignore_status=True)
         self.assertEqual(export_result.status, 0, msg="PR Service database export failed: %s" % export_result.output)
 
         if replace_current_db:
-            current_db_path = os.path.join(get_bb_var('PERSISTENT_DIR'), 'prserv.sqlite3')
+            current_db_path = os.path.join(self.get_bb_var('PERSISTENT_DIR'), 'prserv.sqlite3')
             self.assertTrue(os.path.exists(current_db_path), msg="Path to current PR Service database is invalid: %s" % current_db_path)
             os.remove(current_db_path)
 
-        import_result = runCmd("bitbake-prserv-tool import %s" % exported_db_path, ignore_status=True)
+        import_result = self.runCmd("bitbake-prserv-tool import %s" % exported_db_path, ignore_status=True)
         os.remove(exported_db_path)
         self.assertEqual(import_result.status, 0, msg="PR Service database import failed: %s" % import_result.output)
 
@@ -124,8 +125,8 @@ class BitbakePrTests(OESelftestTestCase):
     def test_stopping_prservice_message(self):
         port = get_free_port()
 
-        runCmd('bitbake-prserv --host localhost --port %s --loglevel=DEBUG --start' % port)
-        ret = runCmd('bitbake-prserv --host localhost --port %s --loglevel=DEBUG --stop' % port)
+        self.runCmd('bitbake-prserv --host localhost --port %s --loglevel=DEBUG --start' % port)
+        ret = self.runCmd('bitbake-prserv --host localhost --port %s --loglevel=DEBUG --stop' % port)
 
         self.assertEqual(ret.status, 0)
 
diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 6ef8d8eb5d0..e4a4514a026 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -1,5 +1,4 @@
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 import os
 import glob
 import re
@@ -8,8 +7,9 @@ import tempfile
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.ftools import write_file
 
-
 class Signing(OESelftestTestCase):
+    _use_own_builddir = True
+    _main_thread = False
 
     gpg_dir = ""
     pub_key_path = ""
@@ -28,7 +28,7 @@ class Signing(OESelftestTestCase):
         cls.pub_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.pub")
         cls.secret_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.secret")
 
-        runCmd('gpg --batch --homedir %s --import %s %s' % (cls.gpg_dir, cls.pub_key_path, cls.secret_key_path))
+        cls.runCmd('gpg --batch --homedir %s --import %s %s' % (cls.gpg_dir, cls.pub_key_path, cls.secret_key_path))
 
     @OETestID(1362)
     def test_signing_packages(self):
@@ -43,7 +43,7 @@ class Signing(OESelftestTestCase):
         """
         import oe.packagedata
 
-        package_classes = get_bb_var('PACKAGE_CLASSES')
+        package_classes = self.get_bb_var('PACKAGE_CLASSES')
         if 'package_rpm' not in package_classes:
             self.skipTest('This test requires RPM Packaging.')
 
@@ -56,13 +56,13 @@ class Signing(OESelftestTestCase):
 
         self.write_config(feature)
 
-        bitbake('-c clean %s' % test_recipe)
-        bitbake('-f -c package_write_rpm %s' % test_recipe)
+        self.bitbake('-c clean %s' % test_recipe)
+        self.bitbake('-f -c package_write_rpm %s' % test_recipe)
 
         self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
 
         needed_vars = ['PKGDATA_DIR', 'DEPLOY_DIR_RPM', 'PACKAGE_ARCH', 'STAGING_BINDIR_NATIVE']
-        bb_vars = get_bb_vars(needed_vars, test_recipe)
+        bb_vars = self.get_bb_vars(needed_vars, test_recipe)
         pkgdatadir = bb_vars['PKGDATA_DIR']
         pkgdata = oe.packagedata.read_pkgdatafile(pkgdatadir + "/runtime/ed")
         if 'PKGE' in pkgdata:
@@ -78,10 +78,10 @@ class Signing(OESelftestTestCase):
         # Use a temporary rpmdb
         rpmdb = tempfile.mkdtemp(prefix='oeqa-rpmdb')
 
-        runCmd('%s/rpmkeys --define "_dbpath %s" --import %s' %
+        self.runCmd('%s/rpmkeys --define "_dbpath %s" --import %s' %
                (staging_bindir_native, rpmdb, self.pub_key_path))
 
-        ret = runCmd('%s/rpmkeys --define "_dbpath %s" --checksig %s' %
+        ret = self.runCmd('%s/rpmkeys --define "_dbpath %s" --checksig %s' %
                      (staging_bindir_native, rpmdb, pkg_deploy))
         # tmp/deploy/rpm/i586/ed-1.9-r0.i586.rpm: rsa sha1 md5 OK
         self.assertIn('rsa sha1 (md5) pgp md5 OK', ret.output, 'Package signed incorrectly.')
@@ -89,8 +89,8 @@ class Signing(OESelftestTestCase):
 
         #Check that an image can be built from signed packages
         self.add_command_to_tearDown('bitbake -c clean core-image-minimal')
-        bitbake('-c clean core-image-minimal')
-        bitbake('core-image-minimal')
+        self.bitbake('-c clean core-image-minimal')
+        self.bitbake('core-image-minimal')
 
 
     @OETestID(1382)
@@ -121,8 +121,8 @@ class Signing(OESelftestTestCase):
 
         self.write_config(feature)
 
-        bitbake('-c clean %s' % test_recipe)
-        bitbake(test_recipe)
+        self.bitbake('-c clean %s' % test_recipe)
+        self.bitbake(test_recipe)
 
         recipe_sig = glob.glob(sstatedir + '/*/*:ed:*_package.tgz.sig')
         recipe_tgz = glob.glob(sstatedir + '/*/*:ed:*_package.tgz')
@@ -130,7 +130,7 @@ class Signing(OESelftestTestCase):
         self.assertEqual(len(recipe_sig), 1, 'Failed to find .sig file.')
         self.assertEqual(len(recipe_tgz), 1, 'Failed to find .tgz file.')
 
-        ret = runCmd('gpg --homedir %s --verify %s %s' % (self.gpg_dir, recipe_sig[0], recipe_tgz[0]))
+        ret = self.runCmd('gpg --homedir %s --verify %s %s' % (self.gpg_dir, recipe_sig[0], recipe_tgz[0]))
         # gpg: Signature made Thu 22 Oct 2015 01:45:09 PM EEST using RSA key ID 61EEFB30
         # gpg: Good signature from "testuser (nocomment) <testuser@email.com>"
         self.assertIn('gpg: Good signature from', ret.output, 'Package signed incorrectly.')
@@ -153,19 +153,19 @@ class LockedSignatures(OESelftestTestCase):
 
         self.add_command_to_tearDown('rm -f %s' % os.path.join(self.builddir, locked_sigs_file))
 
-        bitbake(test_recipe)
+        self.bitbake(test_recipe)
         # Generate locked sigs include file
-        bitbake('-S none %s' % test_recipe)
+        self.bitbake('-S none %s' % test_recipe)
 
         feature = 'require %s\n' % locked_sigs_file
         feature += 'SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn"\n'
         self.write_config(feature)
 
         # Build a locked recipe
-        bitbake(test_recipe)
+        self.bitbake(test_recipe)
 
         # Make a change that should cause the locked task signature to change
-        recipe_append_file = test_recipe + '_' + get_bb_var('PV', test_recipe) + '.bbappend'
+        recipe_append_file = test_recipe + '_' + self.get_bb_var('PV', test_recipe) + '.bbappend'
         recipe_append_path = os.path.join(self.testlayer_path, 'recipes-test', test_recipe, recipe_append_file)
         feature = 'SUMMARY += "test locked signature"\n'
 
@@ -175,7 +175,7 @@ class LockedSignatures(OESelftestTestCase):
         self.add_command_to_tearDown('rm -rf %s' % os.path.join(self.testlayer_path, 'recipes-test', test_recipe))
 
         # Build the recipe again
-        ret = bitbake(test_recipe)
+        ret = self.bitbake(test_recipe)
 
         # Verify you get the warning and that the real task *isn't* run (i.e. the locked signature has worked)
         patt = r'WARNING: The %s:do_package sig is computed to be \S+, but the sig is locked to \S+ in SIGGEN_LOCKEDSIGS\S+' % test_recipe
diff --git a/meta/lib/oeqa/selftest/cases/sstate.py b/meta/lib/oeqa/selftest/cases/sstate.py
index b8c2880ad06..e29787f6e11 100644
--- a/meta/lib/oeqa/selftest/cases/sstate.py
+++ b/meta/lib/oeqa/selftest/cases/sstate.py
@@ -6,7 +6,6 @@ import shutil
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_vars
 
 
 class SStateBase(OESelftestTestCase):
@@ -16,7 +15,7 @@ class SStateBase(OESelftestTestCase):
         self.temp_sstate_location = None
         needed_vars = ['SSTATE_DIR', 'NATIVELSBSTRING', 'TCLIBC', 'TUNE_ARCH',
                        'TOPDIR', 'TARGET_VENDOR', 'TARGET_OS']
-        bb_vars = get_bb_vars(needed_vars)
+        bb_vars = self.get_bb_vars(needed_vars)
         self.sstate_path = bb_vars['SSTATE_DIR']
         self.hostdistro = bb_vars['NATIVELSBSTRING']
         self.tclibc = bb_vars['TCLIBC']
@@ -35,7 +34,7 @@ class SStateBase(OESelftestTestCase):
             config_temp_sstate = "SSTATE_DIR = \"%s\"" % temp_sstate_path
             self.append_config(config_temp_sstate)
             self.track_for_cleanup(temp_sstate_path)
-        bb_vars = get_bb_vars(['SSTATE_DIR', 'NATIVELSBSTRING'])
+        bb_vars = self.get_bb_vars(['SSTATE_DIR', 'NATIVELSBSTRING'])
         self.sstate_path = bb_vars['SSTATE_DIR']
         self.hostdistro = bb_vars['NATIVELSBSTRING']
         self.distro_specific_sstate = os.path.join(self.sstate_path, self.hostdistro)
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 4617d16d212..40b4748619d 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -4,22 +4,23 @@ import glob
 import subprocess
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.selftest.cases.sstate import SStateBase
 from oeqa.core.decorator.oeid import OETestID
 
 class SStateTests(SStateBase):
+    _use_own_builddir = True
+    _main_thread = False
 
     # Test sstate files creation and their location
     def run_test_sstate_creation(self, targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True, should_pass=True):
         self.config_sstate(temp_sstate_location, [self.sstate_path])
 
         if  self.temp_sstate_location:
-            bitbake(['-cclean'] + targets)
+            self.bitbake(['-cclean'] + targets)
         else:
-            bitbake(['-ccleansstate'] + targets)
+            self.bitbake(['-ccleansstate'] + targets)
 
-        bitbake(targets)
+        self.bitbake(targets)
         file_tracker = []
         results = self.search_sstate('|'.join(map(str, targets)), distro_specific, distro_nonspecific)
         if distro_nonspecific:
@@ -55,16 +56,16 @@ class SStateTests(SStateBase):
     def run_test_cleansstate_task(self, targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True):
         self.config_sstate(temp_sstate_location, [self.sstate_path])
 
-        bitbake(['-ccleansstate'] + targets)
+        self.bitbake(['-ccleansstate'] + targets)
 
-        bitbake(targets)
+        self.bitbake(targets)
         tgz_created = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
         self.assertTrue(tgz_created, msg="Could not find sstate .tgz files for: %s (%s)" % (', '.join(map(str, targets)), str(tgz_created)))
 
         siginfo_created = self.search_sstate('|'.join(map(str, [s + '.*?\.siginfo$' for s in targets])), distro_specific, distro_nonspecific)
         self.assertTrue(siginfo_created, msg="Could not find sstate .siginfo files for: %s (%s)" % (', '.join(map(str, targets)), str(siginfo_created)))
 
-        bitbake(['-ccleansstate'] + targets)
+        self.bitbake(['-ccleansstate'] + targets)
         tgz_removed = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
         self.assertTrue(not tgz_removed, msg="do_cleansstate didn't remove .tgz sstate files for: %s (%s)" % (', '.join(map(str, targets)), str(tgz_removed)))
 
@@ -89,9 +90,9 @@ class SStateTests(SStateBase):
     def run_test_rebuild_distro_specific_sstate(self, targets, temp_sstate_location=True):
         self.config_sstate(temp_sstate_location, [self.sstate_path])
 
-        bitbake(['-ccleansstate'] + targets)
+        self.bitbake(['-ccleansstate'] + targets)
 
-        bitbake(targets)
+        self.bitbake(targets)
         results = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific=False, distro_nonspecific=True)
         filtered_results = []
         for r in results:
@@ -106,8 +107,8 @@ class SStateTests(SStateBase):
         shutil.copytree(self.distro_specific_sstate, self.distro_specific_sstate + "_old")
         shutil.rmtree(self.distro_specific_sstate)
 
-        bitbake(['-cclean'] + targets)
-        bitbake(targets)
+        self.bitbake(['-cclean'] + targets)
+        self.bitbake(targets)
         file_tracker_2 = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
         self.assertTrue(len(file_tracker_2) >= len(targets), msg = "Not all sstate files ware created for: %s" % ', '.join(map(str, targets)))
 
@@ -150,13 +151,13 @@ class SStateTests(SStateBase):
         for idx in range(len(target_config)):
             self.append_config(global_config[idx])
             self.append_recipeinc(target, target_config[idx])
-            sstate_arch = get_bb_var('SSTATE_PKGARCH', target)
+            sstate_arch = self.get_bb_var('SSTATE_PKGARCH', target)
             if not sstate_arch in sstate_archs_list:
                 sstate_archs_list.append(sstate_arch)
             if target_config[idx] == target_config[-1]:
                 target_sstate_before_build = self.search_sstate(target + '.*?\.tgz$')
-            bitbake("-cclean %s" % target)
-            result = bitbake(target, ignore_status=True)
+            self.bitbake("-cclean %s" % target)
+            result = self.bitbake(target, ignore_status=True)
             if target_config[idx] == target_config[-1]:
                 target_sstate_after_build = self.search_sstate(target + '.*?\.tgz$')
                 expected_remaining_sstate += [x for x in target_sstate_after_build if x not in target_sstate_before_build if not any(pattern in x for pattern in ignore_patterns)]
@@ -164,7 +165,7 @@ class SStateTests(SStateBase):
             self.remove_recipeinc(target, target_config[idx])
             self.assertEqual(result.status, 0, msg = "build of %s failed with %s" % (target, result.output))
 
-        runCmd("sstate-cache-management.sh -y --cache-dir=%s --remove-duplicated --extra-archs=%s" % (self.sstate_path, ','.join(map(str, sstate_archs_list))))
+        self.runCmd("sstate-cache-management.sh -y --cache-dir=%s --remove-duplicated --extra-archs=%s" % (self.sstate_path, ','.join(map(str, sstate_archs_list))))
         actual_remaining_sstate = [x for x in self.search_sstate(target + '.*?\.tgz$') if not any(pattern in x for pattern in ignore_patterns)]
 
         actual_not_expected = [x for x in actual_remaining_sstate if x not in expected_remaining_sstate]
@@ -230,7 +231,7 @@ SDKMACHINE = "x86_64"
 PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
-        bitbake("core-image-sato -S none")
+        self.bitbake("core-image-sato -S none")
         self.write_config("""
 MACHINE = "qemux86"
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
@@ -240,7 +241,7 @@ SDKMACHINE = "i686"
 PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
-        bitbake("core-image-sato -S none")
+        self.bitbake("core-image-sato -S none")
 
         def get_files(d):
             f = []
@@ -272,13 +273,13 @@ TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
 NATIVELSBSTRING = \"DistroA\"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
-        bitbake("core-image-sato -S none")
+        self.bitbake("core-image-sato -S none")
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
 NATIVELSBSTRING = \"DistroB\"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
-        bitbake("core-image-sato -S none")
+        self.bitbake("core-image-sato -S none")
 
         def get_files(d):
             f = []
@@ -338,10 +339,10 @@ MULTILIBS = \"\"
 
         self.write_config(configA)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
-        bitbake("world meta-toolchain -S none")
+        self.bitbake("world meta-toolchain -S none")
         self.write_config(configB)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
-        bitbake("world meta-toolchain -S none")
+        self.bitbake("world meta-toolchain -S none")
 
         def get_files(d):
             f = {}
@@ -382,7 +383,7 @@ MULTILIBS = "multilib:lib32"
 DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
-        bitbake("world meta-toolchain -S none")
+        self.bitbake("world meta-toolchain -S none")
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
 MACHINE = \"qemux86copy\"
@@ -391,7 +392,7 @@ MULTILIBS = "multilib:lib32"
 DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
-        bitbake("world meta-toolchain -S none")
+        self.bitbake("world meta-toolchain -S none")
 
         def get_files(d):
             f = []
@@ -430,7 +431,7 @@ http_proxy = ""
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
         self.track_for_cleanup(self.topdir + "/download1")
-        bitbake("world meta-toolchain -S none")
+        self.bitbake("world meta-toolchain -S none")
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
 BB_NUMBER_THREADS = "${@oe.utils.cpu_count()+1}"
@@ -445,7 +446,7 @@ http_proxy = "http://example.com/"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
         self.track_for_cleanup(self.topdir + "/download2")
-        bitbake("world meta-toolchain -S none")
+        self.bitbake("world meta-toolchain -S none")
 
         def get_files(d):
             f = {}
-- 
2.11.0


