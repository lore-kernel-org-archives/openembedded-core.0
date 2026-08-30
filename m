Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F9BC624A6
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 21:49:26 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17275.1788126560349007126
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 14:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=B4i7B/Wt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-202608302149180de3ec6c6a000207a2-jkitu_@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202608302149180de3ec6c6a000207a2
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 23:49:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=uvvjk5mDWov4odCeb+80KHOhC+w3aYRuOrQdfDxLQFE=;
 b=B4i7B/Wt5kUXhXDrQwIjkZ2leJ4EXZXI/f5x5uk4gk4qYbotzefaVAWRDRCNfpL+v8Ydgc
 B6tgga0yNSn/tJ9gAAof+Lbo8SB9TrM7pRWe3gKfGU6AhC5ff4oHG80HXmV7sEifo9i/tOQK
 om/jcsUhR/GL46d/EhafdVeL27YQdxfpCCGWPgYr8P1tBjIK/2FOJUoWooxYkeOaMI7UYFXU
 mI894pRYAnzDy48p2TULBkRWZWtZFPn9hLtG3WVH2JmF2uJSzbmVma9QQsWP+g8Nh5KfIa4D
 2BhXRIf+iga0qSG7A+jYv6joXbjT7sk89ajP7zkDsv1LHCWEmoH1mRWg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 14/25] oe-selftest: devtool ide-sdk: cover --package filters
Date: Sun, 30 Aug 2026 23:48:36 +0200
Message-ID: <20260830214912.1346063-15-adrian.freihofer@siemens.com>
In-Reply-To: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
References: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 21:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244714

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Extend ide-sdk selftests to pass recipe-scoped --package filters through
both ide=none and ide=code flows.

The ide=none multi-recipe test now exercises repeated filter forwarding:
- --package cmake-example:,-ptest
- --package meson-example:,-ptest

The ide=code cmake and meson tests now also pass:
- --package <recipe>:,-ptest

Example command covered by the test:
- devtool ide-sdk cmake-example meson-example oe-selftest-image \
    -c --ide=none --package cmake-example:,-ptest \
    --package meson-example:,-ptest

Example ide=code command covered by the test:
- devtool ide-sdk cmake-example oe-selftest-image \
    -c --ide=code --package cmake-example:,-ptest

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 55 ++++++++++++++++++-------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b3eb3c28fb..3e0eb7948f 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3039,7 +3039,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         recipe_id_pretty = recipe_name + ": " + package_arch
         return (recipe_id, recipe_id_pretty)
 
-    def _verify_install_script_code(self, tempdir, recipe_name):
+    def _verify_install_script_code(self, tempdir, recipe_name, package_args=None):
         """Verify the scripts referred by the tasks.json file are fine.
 
         This function does not depend on Qemu. Therefore it verifies the scripts
@@ -3053,12 +3053,22 @@ class DevtoolIdeSdkTests(DevtoolBase):
         task_install = next(
             (task for task in tasks if task["label"] == "install && deploy-target %s" % recipe_id_pretty), None)
         self.assertIsNot(task_install, None)
+        for package_arg in package_args or []:
+            self.assertIn("--package", task_install["args"])
+            self.assertIn(package_arg, task_install["args"])
         # execute only the bb_run_do_install script since the deploy would require e.g. Qemu running.
         i_and_d_script = "install_and_deploy_" + recipe_id
         i_and_d_script_path = os.path.join(
             self._workspace_scripts_dir(recipe_name), i_and_d_script)
         self.assertExists(i_and_d_script_path)
 
+        deploy_script_path = os.path.join(
+            self._workspace_scripts_dir(recipe_name), 'deploy_target_' + recipe_id)
+        with open(deploy_script_path) as deploy_script:
+            deploy_script_content = deploy_script.read()
+        self.assertIn('packages_files = ', deploy_script_content)
+        self.assertNotIn("'package':", deploy_script_content)
+
     def _devtool_ide_sdk_qemu(self, tempdir, qemu, recipe_name, example_exe, compile_cmd):
         """Verify deployment, execution and remote debugging in Qemu system work for one recipe.
 
@@ -3434,6 +3444,12 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
     def test_devtool_ide_sdk_none_qemu(self):
         """Start qemu-system and run tests for multiple recipes. ide=none is used."""
         recipe_names = ["cmake-example", "meson-example"]
+        package_filters = [
+            # Exercise multi-recipe package scoping via repeated --package:
+            # RECIPE:,-ptest expands to RECIPE and RECIPE-ptest.
+            "cmake-example:,-ptest",
+            "meson-example:,-ptest",
+        ]
         testimage = "oe-selftest-image"
 
         self._check_workspace()
@@ -3443,7 +3459,8 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         # Verify deployment to Qemu (system mode) works
         tempdir_cmake = self._devtool_ide_sdk_recipe("cmake-example", "CMakeLists.txt", None)
         tempdir_meson = self._devtool_ide_sdk_recipe("meson-example", "meson.build", testimage)
-        runCmd('devtool ide-sdk cmake-example meson-example %s -c --ide=none' % testimage,
+        package_opts = ' '.join('--package %s' % p for p in package_filters)
+        runCmd('devtool ide-sdk cmake-example meson-example %s -c --ide=none %s' % (testimage, package_opts),
                output_log=self._cmd_logger)
 
         with runqemu(testimage, runqemuparams="nographic") as qemu:
@@ -3458,9 +3475,11 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
             # Verify /etc/cmake-example.conf is owned by the cmake-example user
             self._verify_conf_file(qemu, conf_file, example_user_group, example_user_group)
 
-            # Re-run ide-sdk with the actual QEMU IP; image is already built
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=none' % (
-                recipe_name, testimage, qemu.ip)
+            # Re-run ide-sdk with only the image name. Modified recipes must
+            # be discovered from workspace appends; the image bbappend itself
+            # must not be mistaken for a modified recipe.
+            bitbake_sdk_cmd = 'devtool ide-sdk %s -t root@%s -c --skip-bitbake --ide=none %s' % (
+                testimage, qemu.ip, package_opts)
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
 
             self._gdb_cross()
@@ -3486,9 +3505,9 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
             # Verify /etc/meson-example.conf is owned by the meson-example user
             self._verify_conf_file(qemu, conf_file, example_user_group, example_user_group)
 
-            # Re-run ide-sdk with the actual QEMU IP; image is already built
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=none' % (
-                recipe_name, testimage, qemu.ip)
+            # Re-run ide-sdk with the actual QEMU IP for this recipe
+            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=none %s' % (
+                recipe_name, testimage, qemu.ip, package_opts)
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
 
             self._gdb_cross()
@@ -3839,6 +3858,7 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         """Verify a cmake recipe works with ide=code mode"""
         recipe_name = "cmake-example"
         example_exe = "cmake-example"
+        package_opt = '--package %s:,-ptest' % recipe_name
         build_file = "CMakeLists.txt"
         testimage = "oe-selftest-image"
         build_file = "CMakeLists.txt"
@@ -3849,16 +3869,17 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         # Build image with debug settings before starting QEMU
         self._check_runqemu_prerequisites()
         tempdir = self._devtool_ide_sdk_recipe(recipe_name, build_file, testimage)
-        runCmd('devtool ide-sdk %s %s -c --ide=code' % (recipe_name, testimage),
+        runCmd('devtool ide-sdk %s %s -c --ide=code %s' % (recipe_name, testimage, package_opt),
                output_log=self._cmd_logger)
 
         with runqemu(testimage, runqemuparams="nographic") as qemu:
             # Re-run with actual QEMU IP; image is already built
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=code' % (
-                recipe_name, testimage, qemu.ip)
+            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=code %s' % (
+                recipe_name, testimage, qemu.ip, package_opt)
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
             self._verify_cmake_preset(tempdir)
-            self._verify_install_script_code(tempdir,  recipe_name)
+            self._verify_install_script_code(
+                tempdir, recipe_name, ['%s:,-ptest' % recipe_name])
             self._gdb_cross()
 
             # Verify the launch.json file created is valid
@@ -3872,6 +3893,7 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         """Verify a meson recipe works with ide=code mode"""
         recipe_name = "meson-example"
         example_exe = "mesonex"
+        package_opt = '--package %s:,-ptest' % recipe_name
         build_file = "meson.build"
         testimage = "oe-selftest-image"
 
@@ -3882,13 +3904,13 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         self._check_runqemu_prerequisites()
         tempdir = self._devtool_ide_sdk_recipe(
             recipe_name, build_file, testimage)
-        runCmd('devtool ide-sdk %s %s -c --ide=code' % (recipe_name, testimage),
+        runCmd('devtool ide-sdk %s %s -c --ide=code %s' % (recipe_name, testimage, package_opt),
                output_log=self._cmd_logger)
 
         with runqemu(testimage, runqemuparams="nographic") as qemu:
             # Re-run with actual QEMU IP; image is already built
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=code' % (
-                recipe_name, testimage, qemu.ip)
+            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=code %s' % (
+                recipe_name, testimage, qemu.ip, package_opt)
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
 
             with open(os.path.join(tempdir, '.vscode', 'settings.json')) as settings_j:
@@ -3918,7 +3940,8 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
             runCmd('%s test -C %s' % (meson_exe, meson_build_folder), cwd=tempdir,
                    output_log=self._cmd_logger)
 
-            self._verify_install_script_code(tempdir,  recipe_name)
+            self._verify_install_script_code(
+                tempdir, recipe_name, ['%s:,-ptest' % recipe_name])
             self._gdb_cross()
 
             # Verify the launch.json file created is valid
-- 
2.55.0


