Return-Path: <georgex.l.musat@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3A47024B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 08:40:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 09 Jul 2014 01:33:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,630,1400050800"; d="scan'208";a="559279993"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2014 01:39:40 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id C893D6A4087;
	Wed,  9 Jul 2014 01:39:07 -0700 (PDT)
From: Lucian Musat <georgex.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jul 2014 11:36:47 +0300
Message-Id: <1404895007-684-1-git-send-email-georgex.l.musat@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] Added test case decorators for the rest of selftest testcases except toaster
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
X-List-Received-Date: Wed, 09 Jul 2014 08:40:07 -0000

Signed-off-by: Lucian Musat <georgex.l.musat@intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py     | 22 ++++++++++++++++++++++
 meta/lib/oeqa/selftest/oescripts.py   | 12 +++---------
 meta/lib/oeqa/selftest/prservice.py   | 10 +++++++++-
 meta/lib/oeqa/selftest/sstatetests.py | 25 +++++++++++++++----------
 4 files changed, 49 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index d730bfd..e765e36 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -7,19 +7,23 @@ import shutil
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.decorators import testcase
 
 class BitbakeTests(oeSelfTest):
 
+    @testcase(789)
     def test_run_bitbake_from_dir_1(self):
         os.chdir(os.path.join(self.builddir, 'conf'))
         bitbake('-e')
 
+    @testcase(790)
     def test_run_bitbake_from_dir_2(self):
         my_env = os.environ.copy()
         my_env['BBPATH'] = my_env['BUILDDIR']
         os.chdir(os.path.dirname(os.environ['BUILDDIR']))
         bitbake('-e', env=my_env)
 
+    @testcase(806)
     def test_event_handler(self):
         self.write_config("INHERIT += \"test_events\"")
         result = bitbake('m4-native')
@@ -29,6 +33,7 @@ class BitbakeTests(oeSelfTest):
         self.assertTrue(find_build_completed, msg = "Match failed in:\n%s" % result.output)
         self.assertFalse('Test for bb.event.InvalidEvent' in result.output)
 
+    @testcase(103)
     def test_local_sstate(self):
         bitbake('m4-native -ccleansstate')
         bitbake('m4-native')
@@ -37,14 +42,17 @@ class BitbakeTests(oeSelfTest):
         find_setscene = re.search("m4-native.*do_.*_setscene", result.output)
         self.assertTrue(find_setscene)
 
+    @testcase(105)
     def test_bitbake_invalid_recipe(self):
         result = bitbake('-b asdf', ignore_status=True)
         self.assertTrue("ERROR: Unable to find any recipe file matching 'asdf'" in result.output)
 
+    @testcase(107)
     def test_bitbake_invalid_target(self):
         result = bitbake('asdf', ignore_status=True)
         self.assertTrue("ERROR: Nothing PROVIDES 'asdf'" in result.output)
 
+    @testcase(106)
     def test_warnings_errors(self):
         result = bitbake('-b asdf', ignore_status=True)
         find_warnings = re.search("Summary: There w.{2,3}? [1-9][0-9]* WARNING messages* shown", result.output)
@@ -52,6 +60,7 @@ class BitbakeTests(oeSelfTest):
         self.assertTrue(find_warnings, msg="Did not find the mumber of warnings at the end of the build:\n" + result.output)
         self.assertTrue(find_errors, msg="Did not find the mumber of errors at the end of the build:\n" + result.output)
 
+    @testcase(108)
     def test_invalid_patch(self):
         self.write_recipeinc('man', 'SRC_URI += "file://man-1.5h1-make.patch"')
         result = bitbake('man -c patch', ignore_status=True)
@@ -59,6 +68,7 @@ class BitbakeTests(oeSelfTest):
         bitbake('-cclean man')
         self.assertTrue("ERROR: Function failed: patch_do_patch" in result.output)
 
+    @testcase(163)
     def test_force_task(self):
         bitbake('m4-native')
         result = bitbake('-C compile m4-native')
@@ -67,6 +77,7 @@ class BitbakeTests(oeSelfTest):
             find_task = re.search("m4-native.*%s" % task, result.output)
             self.assertTrue(find_task)
 
+    @testcase(167)
     def test_bitbake_g(self):
         result = bitbake('-g core-image-full-cmdline')
         self.assertTrue('NOTE: PN build list saved to \'pn-buildlist\'' in result.output)
@@ -74,6 +85,7 @@ class BitbakeTests(oeSelfTest):
         for f in ['pn-buildlist', 'pn-depends.dot', 'package-depends.dot', 'task-depends.dot']:
             os.remove(f)
 
+    @testcase(899)
     def test_image_manifest(self):
         bitbake('core-image-minimal')
         deploydir = get_bb_var("DEPLOY_DIR_IMAGE", target="core-image-minimal")
@@ -81,6 +93,7 @@ class BitbakeTests(oeSelfTest):
         manifest = os.path.join(deploydir, imagename + ".manifest")
         self.assertTrue(os.path.islink(manifest), msg="No manifest file created for image")
 
+    @testcase(168)
     def test_invalid_recipe_src_uri(self):
         data = 'SRC_URI = "file://invalid"'
         self.write_recipeinc('man', data)
@@ -92,6 +105,7 @@ class BitbakeTests(oeSelfTest):
         self.assertTrue('ERROR: Fetcher failure: Unable to find file file://invalid anywhere. The paths that were searched were:' in result.output)
         self.assertTrue('ERROR: Function failed: Fetcher failure for URL: \'file://invalid\'. Unable to fetch URL from any source.' in result.output)
 
+    @testcase(171)
     def test_rename_downloaded_file(self):
         data = 'SRC_URI_append = ";downloadfilename=test-aspell.tar.gz"'
         self.write_recipeinc('aspell', data)
@@ -103,25 +117,30 @@ class BitbakeTests(oeSelfTest):
         self.assertTrue(os.path.isfile(os.path.join(get_bb_var("DL_DIR"), 'test-aspell.tar.gz.done')))
         bitbake('-ccleanall aspell')
 
+    @testcase(1028)
     def test_environment(self):
 	self.append_config("TEST_ENV=\"localconf\"")
 	result = runCmd('bitbake -e | grep TEST_ENV=')
 	self.assertTrue('localconf' in result.output)
 	self.remove_config("TEST_ENV=\"localconf\"")
 
+    @testcase(1029)
     def test_dry_run(self):
 	result = runCmd('bitbake -n m4-native')
 	self.assertEqual(0, result.status)
 
+    @testcase(1030)
     def test_just_parse(self):
 	result = runCmd('bitbake -p')
 	self.assertEqual(0, result.status)
 
+    @testcase(1031)
     def test_version(self):
 	result = runCmd('bitbake -s | grep wget')
 	find = re.search("wget *:([0-9a-zA-Z\.\-]+)", result.output)
 	self.assertTrue(find) 
 
+    @testcase(1032)
     def test_prefile(self):
 	preconf = os.path.join(self.builddir, 'conf/prefile.conf')
 	self.track_for_cleanup(preconf)
@@ -133,6 +152,7 @@ class BitbakeTests(oeSelfTest):
 	self.assertTrue('localconf' in result.output)
 	self.remove_config("TEST_PREFILE=\"localconf\"")
 
+    @testcase(1033)
     def test_postfile(self):
 	postconf = os.path.join(self.builddir, 'conf/postfile.conf')
 	self.track_for_cleanup(postconf)
@@ -142,10 +162,12 @@ class BitbakeTests(oeSelfTest):
 	self.assertTrue('postfile' in result.output)
 	self.remove_config("TEST_POSTFILE=\"localconf\"")
 
+    @testcase(1034)
     def test_checkuri(self):
 	result = runCmd('bitbake -c checkuri m4')
 	self.assertEqual(0, result.status)
 
+    @testcase(1035)
     def test_continue(self):
 	self.write_recipeinc('man',"\ndo_fail_task () {\nexit 1 \n}\n\naddtask do_fail_task before do_fetch\n" )
 	runCmd('bitbake -c cleanall man xcursor-transparent-theme')
diff --git a/meta/lib/oeqa/selftest/oescripts.py b/meta/lib/oeqa/selftest/oescripts.py
index 4aab2ed..31cd508 100644
--- a/meta/lib/oeqa/selftest/oescripts.py
+++ b/meta/lib/oeqa/selftest/oescripts.py
@@ -8,9 +8,11 @@ import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
 from oeqa.selftest.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var, get_test_layer
+from oeqa.utils.decorators import testcase
 
 class TestScripts(oeSelfTest):
 
+    @testcase(300)
     def test_cleanup_workdir(self):
         path = os.path.dirname(get_bb_var('WORKDIR', 'gzip'))
         old_version_recipe = os.path.join(get_bb_var('COREBASE'), 'meta/recipes-extended/gzip/gzip_1.3.12.bb')
@@ -41,6 +43,7 @@ class TestScripts(oeSelfTest):
 
 class BuildhistoryDiffTests(BuildhistoryBase):
 
+    @testcase(295)
     def test_buildhistory_diff(self):
         self.add_command_to_tearDown('cleanup-workdir')
         target = 'xcursor-transparent-theme'
@@ -49,12 +52,3 @@ class BuildhistoryDiffTests(BuildhistoryBase):
         result = runCmd("buildhistory-diff -p %s" % get_bb_var('BUILDHISTORY_DIR'))
         expected_output = 'PR changed from "r1" to "r0"'
         self.assertTrue(expected_output in result.output, msg="Did not find expected output: %s" % result.output)
-
-
-
-
-
-
-
-
-
diff --git a/meta/lib/oeqa/selftest/prservice.py b/meta/lib/oeqa/selftest/prservice.py
index 789c05f..fb6d68d 100644
--- a/meta/lib/oeqa/selftest/prservice.py
+++ b/meta/lib/oeqa/selftest/prservice.py
@@ -8,6 +8,7 @@ import datetime
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.decorators import testcase
 
 class BitbakePrTests(oeSelfTest):
 
@@ -87,27 +88,34 @@ class BitbakePrTests(oeSelfTest):
         bitbake("-ccleansstate %s" % package_name)
         self.assertTrue(pr_2 - pr_1 == 1)
 
-
+    @testcase(930)
     def test_import_export_replace_db(self):
         self.run_test_pr_export_import('m4')
 
+    @testcase(931)
     def test_import_export_override_db(self):
         self.run_test_pr_export_import('m4', replace_current_db=False)
 
+    @testcase(932)
     def test_pr_service_rpm_arch_dep(self):
         self.run_test_pr_service('m4', 'rpm', 'do_package')
 
+    @testcase(934)
     def test_pr_service_deb_arch_dep(self):
         self.run_test_pr_service('m4', 'deb', 'do_package')
 
+    @testcase(933)
     def test_pr_service_ipk_arch_dep(self):
         self.run_test_pr_service('m4', 'ipk', 'do_package')
 
+    @testcase(935)
     def test_pr_service_rpm_arch_indep(self):
         self.run_test_pr_service('xcursor-transparent-theme', 'rpm', 'do_package')
 
+    @testcase(937)
     def test_pr_service_deb_arch_indep(self):
         self.run_test_pr_service('xcursor-transparent-theme', 'deb', 'do_package')
 
+    @testcase(936)
     def test_pr_service_ipk_arch_indep(self):
         self.run_test_pr_service('xcursor-transparent-theme', 'ipk', 'do_package')
diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 44dcea8..3789426 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -8,7 +8,7 @@ import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
 from oeqa.selftest.sstate import SStateBase
-
+from oeqa.utils.decorators import testcase
 
 class SStateTests(SStateBase):
 
@@ -28,17 +28,21 @@ class SStateTests(SStateBase):
         else:
             self.assertTrue(not file_tracker , msg="Found sstate files in the wrong place for: %s" % ', '.join(map(str, targets)))
 
+    @testcase(975)
     def test_sstate_creation_distro_specific_pass(self):
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_sstate_creation(['binutils-cross-'+ targetarch, 'binutils-native'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
+    @testcase(975)
     def test_sstate_creation_distro_specific_fail(self):
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_sstate_creation(['binutils-cross-'+ targetarch, 'binutils-native'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True, should_pass=False)
 
+    @testcase(976)
     def test_sstate_creation_distro_nonspecific_pass(self):
         self.run_test_sstate_creation(['eglibc-initial'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
+    @testcase(976)
     def test_sstate_creation_distro_nonspecific_fail(self):
         self.run_test_sstate_creation(['eglibc-initial'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True, should_pass=False)
 
@@ -60,13 +64,16 @@ class SStateTests(SStateBase):
         tgz_removed = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
         self.assertTrue(not tgz_removed, msg="do_cleansstate didn't remove .tgz sstate files for: %s" % ', '.join(map(str, targets)))
 
+    @testcase(977)
     def test_cleansstate_task_distro_specific_nonspecific(self):
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_cleansstate_task(['binutils-cross-' + targetarch, 'binutils-native', 'eglibc-initial'], distro_specific=True, distro_nonspecific=True, temp_sstate_location=True)
 
+    @testcase(977)
     def test_cleansstate_task_distro_nonspecific(self):
         self.run_test_cleansstate_task(['eglibc-initial'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
+    @testcase(977)
     def test_cleansstate_task_distro_specific(self):
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_cleansstate_task(['binutils-cross-'+ targetarch, 'binutils-native', 'eglibc-initial'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
@@ -98,14 +105,17 @@ class SStateTests(SStateBase):
         created_once = [x for x in file_tracker_2 if x not in file_tracker_1]
         self.assertTrue(created_once == [], msg="The following sstate files ware created only in the second run: %s" % ', '.join(map(str, created_once)))
 
+    @testcase(175)
     def test_rebuild_distro_specific_sstate_cross_native_targets(self):
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + targetarch, 'binutils-native'], temp_sstate_location=True)
 
+    @testcase(175)
     def test_rebuild_distro_specific_sstate_cross_target(self):
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + targetarch], temp_sstate_location=True)
 
+    @testcase(175)
     def test_rebuild_distro_specific_sstate_native_target(self):
         self.run_test_rebuild_distro_specific_sstate(['binutils-native'], temp_sstate_location=True)
 
@@ -153,7 +163,7 @@ class SStateTests(SStateBase):
         expected_not_actual = [x for x in expected_remaining_sstate if x not in actual_remaining_sstate]
         self.assertFalse(expected_not_actual, msg="Extra files ware removed: %s" ', '.join(map(str, expected_not_actual)))
 
-
+    @testcase(973)
     def test_sstate_cache_management_script_using_pr_1(self):
         global_config = []
         target_config = []
@@ -161,6 +171,7 @@ class SStateTests(SStateBase):
         target_config.append('PR = "0"')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
+    @testcase(978)
     def test_sstate_cache_management_script_using_pr_2(self):
         global_config = []
         target_config = []
@@ -170,6 +181,7 @@ class SStateTests(SStateBase):
         target_config.append('PR = "1"')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
+    @testcase(979)
     def test_sstate_cache_management_script_using_pr_3(self):
         global_config = []
         target_config = []
@@ -181,6 +193,7 @@ class SStateTests(SStateBase):
         target_config.append('PR = "1"')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
+    @testcase(974)
     def test_sstate_cache_management_script_using_machine(self):
         global_config = []
         target_config = []
@@ -189,11 +202,3 @@ class SStateTests(SStateBase):
         global_config.append('MACHINE = "qemux86"')
         target_config.append('')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
-
-
-
-
-
-
-
-
-- 
1.9.1


