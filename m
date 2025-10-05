Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97DBECCD183
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 22:01:03 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.20223.1759701661440345322
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 15:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=FLYIIoim;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-2025100522005834d3bd826200020755-_qbluy@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2025100522005834d3bd826200020755
        for <openembedded-core@lists.openembedded.org>;
        Mon, 06 Oct 2025 00:00:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Dbo7+i+PAJxvg2VlMtMjvPJ0QtWtfZwDw5ji5hDs224=;
 b=FLYIIoimOiltAPpT2PngJx+l73E8r7sWd10iwqp8XUYpeO8xLKL/qV4EElzghv8LeNN2P8
 pSlBtCD7gFy+2P9rKme/JsAfBM92uCgjn9v7pPC2HH8zT9iGGeeIvcejpmuWoWVYsTjnlOZp
 /wCsI8jcXeUS3Mc8uXX1mSkBQOU2eshCE7zGVvJ+VxQdVz7srIJD73xoSEEwDHuFwToVU1X1
 i1ycSUsUjuXcBjfLKmaWyx6YoAa9CCzLBEYChldjTT0wpj9eVj45i45C0wp4bJtg+gs+A7Ob
 xLi3Q1wUQHMnHHAm2iDGwggr41OU+gO8S73SAwOeSK4+JyMmwMvNcKEw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 4/4] oe-selftest: devtool: DevtoolIdeSdkTests debug logging
Date: Mon,  6 Oct 2025 00:00:34 +0200
Message-ID: <20251005220047.4101591-5-adrian.freihofer@siemens.com>
In-Reply-To: <20251005220047.4101591-1-adrian.freihofer@siemens.com>
References: <20251005220047.4101591-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 22:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224450

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add optional debug logging to all runCmd calls in DevtoolIdeSdkTests
to improve debugging capabilities when tests fail. The logging is only
enabled when the test logger is set to DEBUG level.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 101 +++++++++++++++---------
 1 file changed, 63 insertions(+), 38 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b92f017b81..2b7c02ec6a 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -13,6 +13,7 @@ import glob
 import fnmatch
 import unittest
 import json
+import logging
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
@@ -2523,6 +2524,13 @@ class DevtoolUpgradeTests(DevtoolBase):
 
 
 class DevtoolIdeSdkTests(DevtoolBase):
+
+    def setUp(self):
+        super().setUp()
+        self._cmd_logger = None
+        if self.logger.isEnabledFor(logging.DEBUG):
+            self._cmd_logger = self.logger
+
     def _write_bb_config(self, recipe_names):
         """Helper to write the bitbake local.conf file"""
         conf_lines = [
@@ -2562,7 +2570,8 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.track_for_cleanup(tempdir)
         self.add_command_to_tearDown('bitbake -c clean %s' % recipe_name)
 
-        result = runCmd('devtool modify %s -x %s --debug-build' % (recipe_name, tempdir))
+        result = runCmd('devtool modify %s -x %s --debug-build' % (recipe_name, tempdir),
+                        output_log=self._cmd_logger)
         self.assertExists(os.path.join(tempdir, build_file),
                           'Extracted source could not be found')
         self.assertExists(os.path.join(self.workspacedir, 'conf',
@@ -2572,7 +2581,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertTrue(matches, 'bbappend not created %s' % result.output)
 
         # Test devtool status
-        result = runCmd('devtool status')
+        result = runCmd('devtool status', output_log=self._cmd_logger)
         self.assertIn(recipe_name, result.output)
         self.assertIn(tempdir, result.output)
         self._check_src_repo(tempdir)
@@ -2628,7 +2637,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
             self._workspace_scripts_dir(recipe_name), i_and_d_script)
         self.assertExists(install_deploy_cmd,
                           '%s script not found' % install_deploy_cmd)
-        runCmd(install_deploy_cmd)
+        runCmd(install_deploy_cmd, output_log=self._cmd_logger)
 
         MAGIC_STRING_ORIG = "Magic: 123456789"
         MAGIC_STRING_NEW = "Magic: 987654321"
@@ -2661,7 +2670,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
             cpp_code = cpp_code.replace(MAGIC_STRING_ORIG, MAGIC_STRING_NEW)
         with open(cpp_example_lib_hpp, 'w') as file:
             file.write(cpp_code)
-        runCmd(install_deploy_cmd, cwd=tempdir)
+        runCmd(install_deploy_cmd, cwd=tempdir, output_log=self._cmd_logger)
 
         # Verify the modified example prints the modified magic string
         status, output = qemu.run(example_exe)
@@ -2688,7 +2697,8 @@ class DevtoolIdeSdkTests(DevtoolBase):
 
         native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", gdb_recipe)
         r = runCmd("%s --version" % gdb_binary,
-                   native_sysroot=native_sysroot, target_sys=target_sys)
+                   native_sysroot=native_sysroot, target_sys=target_sys,
+                   output_log=self._cmd_logger)
         self.assertEqual(r.status, 0)
         self.assertIn("GNU gdb", r.output)
 
@@ -2716,18 +2726,20 @@ class DevtoolIdeSdkTests(DevtoolBase):
             recipe_name), 'gdb_1234_usr-bin-' + example_exe)
 
         # Start a gdbserver
-        r = runCmd(gdbserver_script)
+        r = runCmd(gdbserver_script, output_log=self._cmd_logger)
         self.assertEqual(r.status, 0)
 
         # Check there is a gdbserver running
-        r = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, 'ps'))
+        r = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, 'ps'),
+                   output_log=self._cmd_logger)
         self.assertEqual(r.status, 0)
         self.assertIn("gdbserver ", r.output)
 
         # Check the pid file is correct
         test_cmd = "cat /proc/$(cat /tmp/gdbserver_1234_usr-bin-" + \
             example_exe + "/pid)/cmdline"
-        r = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, test_cmd))
+        r = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, test_cmd),
+                   output_log=self._cmd_logger)
         self.assertEqual(r.status, 0)
         self.assertIn("gdbserver", r.output)
 
@@ -2738,7 +2750,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         gdb_batch_cmd += " -ex 'print CppExample::test_string.compare(\"cpp-example-lib %saaa\")'" % magic_string
         gdb_batch_cmd += " -ex 'list cpp-example-lib.hpp:13,13'"
         gdb_batch_cmd += " -ex 'continue'"
-        r = runCmd(gdb_script + gdb_batch_cmd)
+        r = runCmd(gdb_script + gdb_batch_cmd, output_log=self._cmd_logger)
         self.logger.debug("%s %s returned: %s", gdb_script,
                           gdb_batch_cmd, r.output)
         self.assertEqual(r.status, 0)
@@ -2750,11 +2762,11 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertIn("exited normally", r.output)
 
         # Stop the gdbserver
-        r = runCmd(gdbserver_script + ' stop')
+        r = runCmd(gdbserver_script + ' stop', output_log=self._cmd_logger)
         self.assertEqual(r.status, 0)
 
         # Check there is no gdbserver running
-        r = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, 'ps'))
+        r = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, 'ps'), output_log=self._cmd_logger)
         self.assertEqual(r.status, 0)
         self.assertNotIn("gdbserver ", r.output)
 
@@ -2775,29 +2787,29 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertExists(cmake_exe)
 
         # Verify the cmake preset generated by devtool ide-sdk is available
-        result = runCmd('%s --list-presets' % cmake_exe, cwd=tempdir)
+        result = runCmd('%s --list-presets' % cmake_exe, cwd=tempdir, output_log=self._cmd_logger)
         self.assertIn(preset_name, result.output)
 
         # Verify cmake re-uses the o files compiled by bitbake
         result = runCmd('%s --build --preset %s' %
-                        (cmake_exe, preset_name), cwd=tempdir)
+                        (cmake_exe, preset_name), cwd=tempdir, output_log=self._cmd_logger)
         self.assertIn("ninja: no work to do.", result.output)
 
         # Verify the unit tests work (in Qemu user mode)
         result = runCmd('%s --build --preset %s --target test' %
-                        (cmake_exe, preset_name), cwd=tempdir)
+                        (cmake_exe, preset_name), cwd=tempdir, output_log=self._cmd_logger)
         self.assertIn("100% tests passed", result.output)
 
         # Verify re-building and testing works again
         result = runCmd('%s --build --preset %s --target clean' %
-                        (cmake_exe, preset_name), cwd=tempdir)
+                        (cmake_exe, preset_name), cwd=tempdir, output_log=self._cmd_logger)
         self.assertIn("Cleaning", result.output)
         result = runCmd('%s --build --preset %s' %
-                        (cmake_exe, preset_name), cwd=tempdir)
+                        (cmake_exe, preset_name), cwd=tempdir, output_log=self._cmd_logger)
         self.assertIn("Building", result.output)
         self.assertIn("Linking", result.output)
         result = runCmd('%s --build --preset %s --target test' %
-                        (cmake_exe, preset_name), cwd=tempdir)
+                        (cmake_exe, preset_name), cwd=tempdir, output_log=self._cmd_logger)
         self.assertIn("Running tests...", result.output)
         self.assertIn("100% tests passed", result.output)
 
@@ -2822,7 +2834,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
                 recipe_name, build_file, testimage)
             bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=none' % (
                 recipe_name, testimage, qemu.ip)
-            runCmd(bitbake_sdk_cmd)
+            runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
             self._gdb_cross()
             self._verify_cmake_preset(tempdir)
             self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe)
@@ -2838,7 +2850,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
                 recipe_name, build_file, testimage)
             bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=none' % (
                 recipe_name, testimage, qemu.ip)
-            runCmd(bitbake_sdk_cmd)
+            runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
             self._gdb_cross()
             self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe)
             # Verify the oe-scripts sym-link is valid
@@ -2857,7 +2869,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
             recipe_name, build_file, testimage)
         bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@192.168.17.17 -c --ide=code' % (
             recipe_name, testimage)
-        runCmd(bitbake_sdk_cmd)
+        runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
         self._verify_cmake_preset(tempdir)
         self._verify_install_script_code(tempdir,  recipe_name)
         self._gdb_cross()
@@ -2874,7 +2886,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
             recipe_name, build_file, testimage)
         bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@192.168.17.17 -c --ide=code' % (
             recipe_name, testimage)
-        runCmd(bitbake_sdk_cmd)
+        runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
 
         with open(os.path.join(tempdir, '.vscode', 'settings.json')) as settings_j:
             settings_d = json.load(settings_j)
@@ -2886,20 +2898,25 @@ class DevtoolIdeSdkTests(DevtoolBase):
 
         # Verify meson re-uses the o files compiled by bitbake
         result = runCmd('%s compile -C  %s' %
-                        (meson_exe, meson_build_folder), cwd=tempdir)
+                       (meson_exe, meson_build_folder), cwd=tempdir,
+                       output_log=self._cmd_logger)
         self.assertIn("ninja: no work to do.", result.output)
 
         # Verify the unit tests work (in Qemu)
-        runCmd('%s test -C %s' % (meson_exe, meson_build_folder), cwd=tempdir)
+        runCmd('%s test -C %s' % (meson_exe, meson_build_folder), cwd=tempdir,
+               output_log=self._cmd_logger)
 
         # Verify re-building and testing works again
         result = runCmd('%s compile -C  %s --clean' %
-                        (meson_exe, meson_build_folder), cwd=tempdir)
+                        (meson_exe, meson_build_folder), cwd=tempdir,
+                        output_log=self._cmd_logger)
         self.assertIn("Cleaning...", result.output)
         result = runCmd('%s compile -C  %s' %
-                        (meson_exe, meson_build_folder), cwd=tempdir)
+                        (meson_exe, meson_build_folder), cwd=tempdir,
+                        output_log=self._cmd_logger)
         self.assertIn("Linking target", result.output)
-        runCmd('%s test -C %s' % (meson_exe, meson_build_folder), cwd=tempdir)
+        runCmd('%s test -C %s' % (meson_exe, meson_build_folder), cwd=tempdir,
+               output_log=self._cmd_logger)
 
         self._verify_install_script_code(tempdir,  recipe_name)
         self._gdb_cross()
@@ -2911,7 +2928,8 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self._check_workspace()
 
         result_init = runCmd(
-            'devtool ide-sdk -m shared oe-selftest-image cmake-example meson-example --ide=code')
+            'devtool ide-sdk -m shared oe-selftest-image cmake-example meson-example --ide=code',
+            output_log=self._cmd_logger)
         bb_vars = get_bb_vars(
             ['REAL_MULTIMACH_TARGET_SYS', 'DEPLOY_DIR_IMAGE', 'COREBASE'], "meta-ide-support")
         environment_script = 'environment-setup-%s' % bb_vars['REAL_MULTIMACH_TARGET_SYS']
@@ -2926,18 +2944,21 @@ class DevtoolIdeSdkTests(DevtoolBase):
         def runCmdEnv(cmd, cwd):
             cmd = '/bin/sh -c ". %s > /dev/null && %s"' % (
                 environment_script_path, cmd)
-            return runCmd(cmd, cwd)
+            return runCmd(cmd, cwd, output_log=self._cmd_logger)
 
         # Verify building the C++ example works with CMake
         tempdir_cmake = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir_cmake)
 
-        result_cmake = runCmdEnv("which cmake", cwd=tempdir_cmake)
+        result_cmake = runCmdEnv("which cmake", cwd=tempdir_cmake,
+                                 output_log=self._cmd_logger)
         cmake_native = os.path.normpath(result_cmake.output.strip())
         self.assertExists(cmake_native)
 
-        runCmdEnv('cmake %s' % cpp_example_src, cwd=tempdir_cmake)
-        runCmdEnv('cmake --build %s' % tempdir_cmake, cwd=tempdir_cmake)
+        runCmdEnv('cmake %s' % cpp_example_src, cwd=tempdir_cmake,
+                  output_log=self._cmd_logger)
+        runCmdEnv('cmake --build %s' % tempdir_cmake, cwd=tempdir_cmake,
+                  output_log=self._cmd_logger)
 
         # Verify the printed note really referres to a cmake executable
         cmake_native_code = ""
@@ -2953,12 +2974,14 @@ class DevtoolIdeSdkTests(DevtoolBase):
         tempdir_meson = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir_meson)
 
-        result_cmake = runCmdEnv("which meson", cwd=tempdir_meson)
+        result_cmake = runCmdEnv("which meson", cwd=tempdir_meson,
+                                 output_log=self._cmd_logger)
         meson_native = os.path.normpath(result_cmake.output.strip())
         self.assertExists(meson_native)
 
-        runCmdEnv('meson setup %s' % tempdir_meson, cwd=cpp_example_src)
-        runCmdEnv('meson compile', cwd=tempdir_meson)
+        runCmdEnv('meson setup %s' % tempdir_meson, cwd=cpp_example_src,
+                  output_log=self._cmd_logger)
+        runCmdEnv('meson compile', cwd=tempdir_meson, output_log=self._cmd_logger)
 
     def test_devtool_ide_sdk_plugins(self):
         """Test that devtool ide-sdk can use plugins from other layers."""
@@ -2981,7 +3004,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
             return m.group(1).split(',')
 
         # verify the default plugins are available but the foo plugin is not
-        result = runCmd('devtool ide-sdk -h')
+        result = runCmd('devtool ide-sdk -h', output_log=self._cmd_logger)
         found_ides = get_ides_from_help(result.output)
         self.assertIn('code', found_ides)
         self.assertIn('none', found_ides)
@@ -3012,7 +3035,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
             plugin_file.write(plugin_code)
 
         # Verify the foo plugin is available as well
-        result = runCmd('devtool ide-sdk -h')
+        result = runCmd('devtool ide-sdk -h', output_log=self._cmd_logger)
         found_ides = get_ides_from_help(result.output)
         self.assertIn('code', found_ides)
         self.assertIn('none', found_ides)
@@ -3020,14 +3043,16 @@ class DevtoolIdeSdkTests(DevtoolBase):
 
         # Verify the foo plugin generates a shared config
         result = runCmd(
-            'devtool ide-sdk -m shared --skip-bitbake --ide foo %s' % shared_recipe_name)
+            'devtool ide-sdk -m shared --skip-bitbake --ide foo %s' % shared_recipe_name,
+            output_log=self._cmd_logger)
         with open(shared_config_file) as shared_config:
             shared_config_new = shared_config.read()
         self.assertEqual(shared_config_str, shared_config_new)
 
         # Verify the foo plugin generates a modified config
         result = runCmd('devtool ide-sdk --skip-bitbake --ide foo %s %s' %
-                        (modified_recipe_name, testimage))
+                        (modified_recipe_name, testimage),
+                        output_log=self._cmd_logger)
         with open(modified_config_file) as modified_config:
             modified_config_new = modified_config.read()
         self.assertEqual(modified_config_str, modified_config_new)
-- 
2.51.0


