Return-Path: <georgex.l.musat@intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 787656AD16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 15:14:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 May 2014 08:09:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,880,1392192000"; d="scan'208";a="515484843"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 21 May 2014 08:12:04 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id D38686A4007;
	Wed, 21 May 2014 08:11:39 -0700 (PDT)
From: Lucian Musat <georgex.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 May 2014 18:10:02 +0300
Message-Id: <1400685003-28267-1-git-send-email-georgex.l.musat@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] Added test case numbers to test cases to aid in future automation of testopia status change.
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
X-List-Received-Date: Wed, 21 May 2014 15:14:54 -0000

We need automated tests to be mapped to Testopia test cases in order to aid in results logging.

Signed-off-by: Lucian Musat <georgex.l.musat@intel.com>
---
 meta/lib/oeqa/selftest/bblayers.py     | 10 +++++-----
 meta/lib/oeqa/selftest/bbtests.py      | 26 +++++++++++++-------------
 meta/lib/oeqa/selftest/buildoptions.py | 16 ++++++++--------
 meta/lib/oeqa/selftest/oescripts.py    |  4 ++--
 meta/lib/oeqa/selftest/prservice.py    | 16 ++++++++--------
 meta/lib/oeqa/selftest/sstatetests.py  | 28 ++++++++++++++--------------
 6 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/bblayers.py
index 52aa4f8..498d39f 100644
--- a/meta/lib/oeqa/selftest/bblayers.py
+++ b/meta/lib/oeqa/selftest/bblayers.py
@@ -10,23 +10,23 @@ from oeqa.utils.commands import runCmd
 
 class BitbakeLayers(oeSelfTest):
 
-    def test_bitbakelayers_showcrossdepends(self):
+    def test_bitbakelayers_showcrossdepends_tc_756(self):
         result = runCmd('bitbake-layers show-cross-depends')
         self.assertTrue('aspell' in result.output)
 
-    def test_bitbakelayers_showlayers(self):
+    def test_bitbakelayers_showlayers_tc_83(self):
         result = runCmd('bitbake-layers show_layers')
         self.assertTrue('meta-selftest' in result.output)
 
-    def test_bitbakelayers_showappends(self):
+    def test_bitbakelayers_showappends_tc_93(self):
         result = runCmd('bitbake-layers show_appends')
         self.assertTrue('xcursor-transparent-theme_0.1.1.bbappend' in result.output, msg='xcursor-transparent-theme_0.1.1.bbappend file was not recognised')
 
-    def test_bitbakelayers_showoverlayed(self):
+    def test_bitbakelayers_showoverlayed_tc_90(self):
         result = runCmd('bitbake-layers show_overlayed')
         self.assertTrue('aspell' in result.output, msg='xcursor-transparent-theme_0.1.1.bbappend file was not recognised')
 
-    def test_bitbakelayers_flatten(self):
+    def test_bitbakelayers_flatten_tc_95(self):
         self.assertFalse(os.path.isdir(os.path.join(self.builddir, 'test')))
         result = runCmd('bitbake-layers flatten test')
         bb_file = os.path.join(self.builddir, 'test/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb')
diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 6815ecf..5509625 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -10,17 +10,17 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 
 class BitbakeTests(oeSelfTest):
 
-    def test_run_bitbake_from_dir_1(self):
+    def test_run_bitbake_from_dir_tc_789(self):
         os.chdir(os.path.join(self.builddir, 'conf'))
         bitbake('-e')
 
-    def test_run_bitbake_from_dir_2(self):
+    def test_run_bitbake_from_dir_tc_790(self):
         my_env = os.environ.copy()
         my_env['BBPATH'] = my_env['BUILDDIR']
         os.chdir(os.path.dirname(os.environ['BUILDDIR']))
         bitbake('-e', env=my_env)
 
-    def test_event_handler(self):
+    def test_event_handler_tc_806(self):
         self.write_config("INHERIT += \"test_events\"")
         result = bitbake('m4-native')
         find_build_started = re.search("NOTE: Test for bb\.event\.BuildStarted(\n.*)*NOTE: Preparing runqueue", result.output)
@@ -29,7 +29,7 @@ class BitbakeTests(oeSelfTest):
         self.assertTrue(find_build_completed, msg = "Match failed in:\n%s" % result.output)
         self.assertFalse('Test for bb.event.InvalidEvent' in result.output)
 
-    def test_local_sstate(self):
+    def test_local_sstate_tc_103(self):
         bitbake('m4-native -ccleansstate')
         bitbake('m4-native')
         bitbake('m4-native -cclean')
@@ -37,29 +37,29 @@ class BitbakeTests(oeSelfTest):
         find_setscene = re.search("m4-native.*do_.*_setscene", result.output)
         self.assertTrue(find_setscene)
 
-    def test_bitbake_invalid_recipe(self):
+    def test_bitbake_invalid_recipe_tc_105(self):
         result = bitbake('-b asdf', ignore_status=True)
         self.assertTrue("ERROR: Unable to find any recipe file matching 'asdf'" in result.output)
 
-    def test_bitbake_invalid_target(self):
+    def test_bitbake_invalid_target_tc_107(self):
         result = bitbake('asdf', ignore_status=True)
         self.assertTrue("ERROR: Nothing PROVIDES 'asdf'" in result.output)
 
-    def test_warnings_errors(self):
+    def test_warnings_errors_tc_106(self):
         result = bitbake('-b asdf', ignore_status=True)
         find_warnings = re.search("Summary: There w.{2,3}? [1-9][0-9]* WARNING messages* shown", result.output)
         find_errors = re.search("Summary: There w.{2,3}? [1-9][0-9]* ERROR messages* shown", result.output)
         self.assertTrue(find_warnings, msg="Did not find the mumber of warnings at the end of the build:\n" + result.output)
         self.assertTrue(find_errors, msg="Did not find the mumber of errors at the end of the build:\n" + result.output)
 
-    def test_invalid_patch(self):
+    def test_invalid_patch_tc_108(self):
         self.write_recipeinc('man', 'SRC_URI += "file://man-1.5h1-make.patch"')
         result = bitbake('man -c patch', ignore_status=True)
         self.delete_recipeinc('man')
         bitbake('-cclean man')
         self.assertTrue("ERROR: Function failed: patch_do_patch" in result.output)
 
-    def test_force_task(self):
+    def test_force_task_tc_163(self):
         bitbake('m4-native')
         result = bitbake('-C compile m4-native')
         look_for_tasks = ['do_compile', 'do_install', 'do_populate_sysroot']
@@ -67,21 +67,21 @@ class BitbakeTests(oeSelfTest):
             find_task = re.search("m4-native.*%s" % task, result.output)
             self.assertTrue(find_task)
 
-    def test_bitbake_g(self):
+    def test_bitbake_g_tc_167(self):
         result = bitbake('-g core-image-full-cmdline')
         self.assertTrue('NOTE: PN build list saved to \'pn-buildlist\'' in result.output)
         self.assertTrue('openssh' in ftools.read_file(os.path.join(self.builddir, 'pn-buildlist')))
         for f in ['pn-buildlist', 'pn-depends.dot', 'package-depends.dot', 'task-depends.dot']:
             os.remove(f)
 
-    def test_image_manifest(self):
+    def test_image_manifest_tc_899(self):
         bitbake('core-image-minimal')
         deploydir = get_bb_var("DEPLOY_DIR_IMAGE", target="core-image-minimal")
         imagename = get_bb_var("IMAGE_LINK_NAME", target="core-image-minimal")
         manifest = os.path.join(deploydir, imagename + ".manifest")
         self.assertTrue(os.path.islink(manifest), msg="No manifest file created for image")
 
-    def test_invalid_recipe_src_uri(self):
+    def test_invalid_recipe_src_uri_tc_168(self):
         data = 'SRC_URI = "file://invalid"'
         self.write_recipeinc('man', data)
         bitbake('-ccleanall man')
@@ -92,7 +92,7 @@ class BitbakeTests(oeSelfTest):
         self.assertTrue('ERROR: Fetcher failure: Unable to find file file://invalid anywhere. The paths that were searched were:' in result.output)
         self.assertTrue('ERROR: Function failed: Fetcher failure for URL: \'file://invalid\'. Unable to fetch URL from any source.' in result.output)
 
-    def test_rename_downloaded_file(self):
+    def test_rename_downloaded_file_tc_171(self):
         data = 'SRC_URI_append = ";downloadfilename=test-aspell.tar.gz"'
         self.write_recipeinc('aspell', data)
         bitbake('-ccleanall aspell')
diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 27fc452..576ef8f 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -10,7 +10,7 @@ import oeqa.utils.ftools as ftools
 
 class ImageOptionsTests(oeSelfTest):
 
-    def test_incremental_image_generation(self):
+    def test_incremental_image_generation_tc_761(self):
         bitbake("-c cleanall core-image-minimal")
         self.write_config('INC_RPM_IMAGE_GEN = "1"')
         self.append_config('IMAGE_FEATURES += "ssh-server-openssh"')
@@ -22,7 +22,7 @@ class ImageOptionsTests(oeSelfTest):
         res = runCmd("grep 'Removing openssh-sshd' %s" %(os.path.join(get_bb_var("WORKDIR", "core-image-minimal"), "temp/log.do_rootfs")),ignore_status=True)
         self.assertEqual(0, res.status, msg="openssh-sshd was not removed from image")
 
-    def test_rm_old_image(self):
+    def test_rm_old_image_tc_925(self):
         bitbake("core-image-minimal")
         deploydir = get_bb_var("DEPLOY_DIR_IMAGE", target="core-image-minimal")
         imagename = get_bb_var("IMAGE_LINK_NAME", target="core-image-minimal")
@@ -37,7 +37,7 @@ class ImageOptionsTests(oeSelfTest):
         remaining_not_expected = [path for path in track_original_files if os.path.basename(path) in deploydir_files]
         self.assertFalse(remaining_not_expected, msg="\nThe following image files ware not removed: %s" % ', '.join(map(str, remaining_not_expected)))
 
-    def test_ccache_tool(self):
+    def test_ccache_tool_tc_286(self):
         bitbake("ccache-native")
         self.assertTrue(os.path.isfile(os.path.join(get_bb_var('STAGING_BINDIR_NATIVE', 'ccache-native'), "ccache")))
         self.write_config('INHERIT += "ccache"')
@@ -50,7 +50,7 @@ class ImageOptionsTests(oeSelfTest):
 
 class DiskMonTest(oeSelfTest):
 
-    def test_stoptask_behavior(self):
+    def test_stoptask_behavior_tc_277(self):
         self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"')
         res = bitbake("m4", ignore_status = True)
         self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.output)
@@ -65,7 +65,7 @@ class DiskMonTest(oeSelfTest):
 
 class SanityOptionsTest(oeSelfTest):
 
-    def test_options_warnqa_errorqa_switch(self):
+    def test_options_warnqa_errorqa_switch_tc_927(self):
         bitbake("xcursor-transparent-theme -ccleansstate")
 
         if "packages-list" not in get_bb_var("ERROR_QA"):
@@ -84,7 +84,7 @@ class SanityOptionsTest(oeSelfTest):
         self.delete_recipeinc('xcursor-transparent-theme')
         self.assertTrue("WARNING: QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors." in res.output)
 
-    def test_sanity_userspace_dependency(self):
+    def test_sanity_userspace_dependency_tc_278(self):
         self.append_config('WARN_QA_append = " unsafe-references-in-binaries unsafe-references-in-scripts"')
         bitbake("-ccleansstate gzip nfs-utils")
         res = bitbake("gzip nfs-utils")
@@ -93,11 +93,11 @@ class SanityOptionsTest(oeSelfTest):
 
 class BuildhistoryTests(BuildhistoryBase):
 
-    def test_buildhistory_basic(self):
+    def test_buildhistory_basic_tc_293(self):
         self.run_buildhistory_operation('xcursor-transparent-theme')
         self.assertTrue(os.path.isdir(get_bb_var('BUILDHISTORY_DIR')))
 
-    def test_buildhistory_buildtime_pr_backwards(self):
+    def test_buildhistory_buildtime_pr_backwards_tc_294(self):
         self.add_command_to_tearDown('cleanup-workdir')
         target = 'xcursor-transparent-theme'
         error = "ERROR: QA Issue: Package version for package %s went backwards which would break package feeds from (.*-r1 to .*-r0)" % target
diff --git a/meta/lib/oeqa/selftest/oescripts.py b/meta/lib/oeqa/selftest/oescripts.py
index 4aab2ed..e178a34 100644
--- a/meta/lib/oeqa/selftest/oescripts.py
+++ b/meta/lib/oeqa/selftest/oescripts.py
@@ -11,7 +11,7 @@ from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var, get_test_l
 
 class TestScripts(oeSelfTest):
 
-    def test_cleanup_workdir(self):
+    def test_cleanup_workdir_tc_300(self):
         path = os.path.dirname(get_bb_var('WORKDIR', 'gzip'))
         old_version_recipe = os.path.join(get_bb_var('COREBASE'), 'meta/recipes-extended/gzip/gzip_1.3.12.bb')
         old_version = '1.3.12'
@@ -41,7 +41,7 @@ class TestScripts(oeSelfTest):
 
 class BuildhistoryDiffTests(BuildhistoryBase):
 
-    def test_buildhistory_diff(self):
+    def test_buildhistory_diff_tc_295(self):
         self.add_command_to_tearDown('cleanup-workdir')
         target = 'xcursor-transparent-theme'
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
diff --git a/meta/lib/oeqa/selftest/prservice.py b/meta/lib/oeqa/selftest/prservice.py
index 789c05f..d3a588e 100644
--- a/meta/lib/oeqa/selftest/prservice.py
+++ b/meta/lib/oeqa/selftest/prservice.py
@@ -88,26 +88,26 @@ class BitbakePrTests(oeSelfTest):
         self.assertTrue(pr_2 - pr_1 == 1)
 
 
-    def test_import_export_replace_db(self):
+    def test_import_export_replace_db_tc_930(self):
         self.run_test_pr_export_import('m4')
 
-    def test_import_export_override_db(self):
+    def test_import_export_override_db_tc_931(self):
         self.run_test_pr_export_import('m4', replace_current_db=False)
 
-    def test_pr_service_rpm_arch_dep(self):
+    def test_pr_service_rpm_arch_dep_tc_932(self):
         self.run_test_pr_service('m4', 'rpm', 'do_package')
 
-    def test_pr_service_deb_arch_dep(self):
+    def test_pr_service_deb_arch_dep_tc_934(self):
         self.run_test_pr_service('m4', 'deb', 'do_package')
 
-    def test_pr_service_ipk_arch_dep(self):
+    def test_pr_service_ipk_arch_dep_tc_933(self):
         self.run_test_pr_service('m4', 'ipk', 'do_package')
 
-    def test_pr_service_rpm_arch_indep(self):
+    def test_pr_service_rpm_arch_indep_tc_935(self):
         self.run_test_pr_service('xcursor-transparent-theme', 'rpm', 'do_package')
 
-    def test_pr_service_deb_arch_indep(self):
+    def test_pr_service_deb_arch_indep_tc_937(self):
         self.run_test_pr_service('xcursor-transparent-theme', 'deb', 'do_package')
 
-    def test_pr_service_ipk_arch_indep(self):
+    def test_pr_service_ipk_arch_indep_tc_936(self):
         self.run_test_pr_service('xcursor-transparent-theme', 'ipk', 'do_package')
diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 44dcea8..2626483 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -28,18 +28,18 @@ class SStateTests(SStateBase):
         else:
             self.assertTrue(not file_tracker , msg="Found sstate files in the wrong place for: %s" % ', '.join(map(str, targets)))
 
-    def test_sstate_creation_distro_specific_pass(self):
+    def test_sstate_creation_distro_specific_pass_tc_975(self):
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_sstate_creation(['binutils-cross-'+ targetarch, 'binutils-native'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
-    def test_sstate_creation_distro_specific_fail(self):
+    def test_sstate_creation_distro_specific_fail_tc_975(self):
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_sstate_creation(['binutils-cross-'+ targetarch, 'binutils-native'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True, should_pass=False)
 
-    def test_sstate_creation_distro_nonspecific_pass(self):
+    def test_sstate_creation_distro_nonspecific_pass_976(self):
         self.run_test_sstate_creation(['eglibc-initial'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
-    def test_sstate_creation_distro_nonspecific_fail(self):
+    def test_sstate_creation_distro_nonspecific_fail_976(self):
         self.run_test_sstate_creation(['eglibc-initial'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True, should_pass=False)
 
 
@@ -60,14 +60,14 @@ class SStateTests(SStateBase):
         tgz_removed = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
         self.assertTrue(not tgz_removed, msg="do_cleansstate didn't remove .tgz sstate files for: %s" % ', '.join(map(str, targets)))
 
-    def test_cleansstate_task_distro_specific_nonspecific(self):
+    def test_cleansstate_task_distro_specific_nonspecific_tc_977(self):
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_cleansstate_task(['binutils-cross-' + targetarch, 'binutils-native', 'eglibc-initial'], distro_specific=True, distro_nonspecific=True, temp_sstate_location=True)
 
-    def test_cleansstate_task_distro_nonspecific(self):
+    def test_cleansstate_task_distro_nonspecific_tc_977(self):
         self.run_test_cleansstate_task(['eglibc-initial'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
-    def test_cleansstate_task_distro_specific(self):
+    def test_cleansstate_task_distro_specific_tc_977(self):
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_cleansstate_task(['binutils-cross-'+ targetarch, 'binutils-native', 'eglibc-initial'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
@@ -98,15 +98,15 @@ class SStateTests(SStateBase):
         created_once = [x for x in file_tracker_2 if x not in file_tracker_1]
         self.assertTrue(created_once == [], msg="The following sstate files ware created only in the second run: %s" % ', '.join(map(str, created_once)))
 
-    def test_rebuild_distro_specific_sstate_cross_native_targets(self):
+    def test_rebuild_distro_specific_sstate_cross_native_targets_tc_175(self):
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + targetarch, 'binutils-native'], temp_sstate_location=True)
 
-    def test_rebuild_distro_specific_sstate_cross_target(self):
+    def test_rebuild_distro_specific_sstate_cross_target_tc_175(self):
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + targetarch], temp_sstate_location=True)
 
-    def test_rebuild_distro_specific_sstate_native_target(self):
+    def test_rebuild_distro_specific_sstate_native_target_tc_175(self):
         self.run_test_rebuild_distro_specific_sstate(['binutils-native'], temp_sstate_location=True)
 
 
@@ -154,14 +154,14 @@ class SStateTests(SStateBase):
         self.assertFalse(expected_not_actual, msg="Extra files ware removed: %s" ', '.join(map(str, expected_not_actual)))
 
 
-    def test_sstate_cache_management_script_using_pr_1(self):
+    def test_sstate_cache_management_script_using_pr_tc_973(self):
         global_config = []
         target_config = []
         global_config.append('')
         target_config.append('PR = "0"')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
-    def test_sstate_cache_management_script_using_pr_2(self):
+    def test_sstate_cache_management_script_using_pr_tc_978(self):
         global_config = []
         target_config = []
         global_config.append('')
@@ -170,7 +170,7 @@ class SStateTests(SStateBase):
         target_config.append('PR = "1"')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
-    def test_sstate_cache_management_script_using_pr_3(self):
+    def test_sstate_cache_management_script_using_pr_tc_979(self):
         global_config = []
         target_config = []
         global_config.append('MACHINE = "qemux86-64"')
@@ -181,7 +181,7 @@ class SStateTests(SStateBase):
         target_config.append('PR = "1"')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
-    def test_sstate_cache_management_script_using_machine(self):
+    def test_sstate_cache_management_script_using_machine_tc_974(self):
         global_config = []
         target_config = []
         global_config.append('MACHINE = "qemux86-64"')
-- 
1.9.1


