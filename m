Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C194C61DFD
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 14:29:54 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9453.1788100183423622171
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 07:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=U5FOK71D;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-2026083014294068bad33313000207a3-g5tgoh@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026083014294068bad33313000207a3
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 16:29:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=K1qrykSNcjEu7y502YB/cPZ2jFJx5l8WZmcl82y5JFc=;
 b=U5FOK71D/ECR9yS/iDbGoF+Hm5fUXLNrtU7MfRlO6JQf2ofq15NsLMqpbKuGriQCVGR1Xd
 cdWD/z6ZzbgPv+c1szi4EOL8CT+ogw8LOAFZFaGdftvAOD2vCWW/kht3OQIMQ7wnZI7linUx
 J9qTL1lRFqLvRk4CUowYKZVM/j3pmduGs39gM2hTKkYMIZdr1Jv+DLQDli88kX4u3s1UaN9+
 QWlgClr3yZGNNhWTgtA2PWNJ6dWqBlIRMmHsujqJrDJESlGRAXsK7g10TTrVelaKvufzHyWA
 cy0sD0cr2e3yTwrXqBiDk8925Gn24AhWNeVJm6c6c+1COCYq1LKfcI/g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 06/24] oe-selftest: devtool ide-sdk: adapt tests for auto-written image debug settings
Date: Sun, 30 Aug 2026 16:28:33 +0200
Message-ID: <20260830142922.17241-7-adrian.freihofer@siemens.com>
In-Reply-To: <20260830142922.17241-1-adrian.freihofer@siemens.com>
References: <20260830142922.17241-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 14:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244676

From: Adrian Freihofer <adrian.freihofer@siemens.com>

devtool ide-sdk now writes IMAGE_GEN_DEBUGFS, IMAGE_CLASSES +=
"image-combined-dbg" and the required IMAGE_INSTALL entries
(gdbserver/lldb-server, per-recipe ptest packages) to the image
workspace bbappend automatically. _write_bb_config() therefore no
longer sets these in local.conf, so tests also exercise that ide-sdk
does not need help from local.conf to enable image debug support.

Tests that use runqemu now call devtool ide-sdk once before starting
QEMU to build the image with the debug settings already applied, and
again with --skip-bitbake -t root@<ip> once the real target IP is
known, to update the deploy scripts without triggering a redundant
image rebuild.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 111 +++++++++++++-----------
 1 file changed, 61 insertions(+), 50 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 87efa1ee80..1ecf4c24f5 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2889,15 +2889,15 @@ class DevtoolIdeSdkTests(DevtoolBase):
         if self.logger.isEnabledFor(logging.DEBUG):
             self._cmd_logger = self.logger
 
-    def _write_bb_config(self, recipe_names, extra_packages=None):
-        """Helper to write the bitbake local.conf file"""
-        image_install = 'gdbserver ' + ' '.join([r + '-ptest' for r in recipe_names])
-        if extra_packages:
-            image_install += ' ' + ' '.join(extra_packages)
+    def _write_bb_config(self):
+        """Helper to write the bitbake local.conf file.
+
+        Image debug settings (IMAGE_GEN_DEBUGFS, IMAGE_CLASSES += image-combined-dbg,
+        IMAGE_INSTALL for gdbserver/lldb-server and the recipe under test) are written
+        automatically by devtool ide-sdk to the image workspace bbappend.
+        Only settings not managed by ide_sdk are configured here.
+        """
         conf_lines = [
-            'IMAGE_CLASSES += "image-combined-dbg"',
-            'IMAGE_GEN_DEBUGFS = "1"',
-            'IMAGE_INSTALL:append = " %s"' % image_install,
             'DISTRO_FEATURES:append = " ptest"',
             # Static UIDs/GIDs are required so that files installed via
             # "install -o ${BPN}" in do_install embed the same UID that gets
@@ -3374,70 +3374,67 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         testimage = "oe-selftest-image"
 
         self._check_workspace()
-        self._write_bb_config(recipe_names)
+        self._write_bb_config()
         self._check_runqemu_prerequisites()
 
         # Verify deployment to Qemu (system mode) works
-        bitbake(testimage)
+        tempdir_cmake = self._devtool_ide_sdk_recipe("cmake-example", "CMakeLists.txt", None)
+        tempdir_meson = self._devtool_ide_sdk_recipe("meson-example", "meson.build", testimage)
+        runCmd('devtool ide-sdk cmake-example meson-example %s -c --ide=none' % testimage,
+               output_log=self._cmd_logger)
+
         with runqemu(testimage, runqemuparams="nographic") as qemu:
             # cmake-example recipe
             recipe_name = "cmake-example"
             example_exe = "cmake-example"
             example_user_group = "cmake-example"
             conf_file = "/etc/cmake-example.conf"
-            build_file = "CMakeLists.txt"
 
             # Verify the cmake-example service is running on the target
             self._verify_service_running(qemu, example_exe)
             # Verify /etc/cmake-example.conf is owned by the cmake-example user
             self._verify_conf_file(qemu, conf_file, example_user_group, example_user_group)
 
-            # Setup the recipe with devtool ide-sdk cmake-example ...
-            tempdir = self._devtool_ide_sdk_recipe(
-                recipe_name, build_file, testimage)
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=none' % (
+            # Re-run ide-sdk with the actual QEMU IP; image is already built
+            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=none' % (
                 recipe_name, testimage, qemu.ip)
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
 
             self._gdb_cross()
-            compile_cmd = self._verify_cmake_preset(tempdir)
-            self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe, compile_cmd)
+            compile_cmd = self._verify_cmake_preset(tempdir_cmake)
+            self._devtool_ide_sdk_qemu(tempdir_cmake, qemu, recipe_name, example_exe, compile_cmd)
 
             # Verify the oe-scripts sym-link is valid
             self.assertEqual(self._workspace_scripts_dir(
-                recipe_name), self._sources_scripts_dir(tempdir))
+                recipe_name), self._sources_scripts_dir(tempdir_cmake))
 
             # Verify /etc/cmake-example.conf is still owned by the cmake-example user
             # after the install and deploy scripts updated the file
             self._verify_conf_file(qemu, conf_file, example_exe, example_exe)
 
-
             # meson-example recipe
             recipe_name = "meson-example"
             example_exe = "mesonex"
             example_user_group = "meson-example"
             conf_file = "/etc/meson-example.conf"
-            build_file = "meson.build"
 
             # Verify the meson-example service is running on the target
             self._verify_service_running(qemu, example_exe)
             # Verify /etc/meson-example.conf is owned by the meson-example user
             self._verify_conf_file(qemu, conf_file, example_user_group, example_user_group)
 
-            # Setup the recipe with devtool ide-sdk meson-example ...
-            tempdir = self._devtool_ide_sdk_recipe(
-                recipe_name, build_file, testimage)
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=none' % (
+            # Re-run ide-sdk with the actual QEMU IP; image is already built
+            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=none' % (
                 recipe_name, testimage, qemu.ip)
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
 
             self._gdb_cross()
-            compile_cmd = self._verify_meson_build(tempdir, recipe_name)
-            self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe, compile_cmd)
+            compile_cmd = self._verify_meson_build(tempdir_meson, recipe_name)
+            self._devtool_ide_sdk_qemu(tempdir_meson, qemu, recipe_name, example_exe, compile_cmd)
 
             # Verify the oe-scripts sym-link is valid
             self.assertEqual(self._workspace_scripts_dir(
-                recipe_name), self._sources_scripts_dir(tempdir))
+                recipe_name), self._sources_scripts_dir(tempdir_meson))
 
             # Verify /etc/meson-example.conf is still owned by the meson-example user
             # after the install and deploy scripts updated the file
@@ -3784,15 +3781,17 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         build_file = "CMakeLists.txt"
 
         self._check_workspace()
-        self._write_bb_config([recipe_name])
+        self._write_bb_config()
 
-        # Verify deployment to Qemu (system mode) works
+        # Build image with debug settings before starting QEMU
         self._check_runqemu_prerequisites()
-        bitbake(testimage)
+        tempdir = self._devtool_ide_sdk_recipe(recipe_name, build_file, testimage)
+        runCmd('devtool ide-sdk %s %s -c --ide=code' % (recipe_name, testimage),
+               output_log=self._cmd_logger)
+
         with runqemu(testimage, runqemuparams="nographic") as qemu:
-            tempdir = self._devtool_ide_sdk_recipe(
-                recipe_name, build_file, testimage)
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=code' % (
+            # Re-run with actual QEMU IP; image is already built
+            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=code' % (
                 recipe_name, testimage, qemu.ip)
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
             self._verify_cmake_preset(tempdir)
@@ -3814,15 +3813,18 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         testimage = "oe-selftest-image"
 
         self._check_workspace()
-        self._write_bb_config([recipe_name])
+        self._write_bb_config()
 
-        # Verify deployment to Qemu (system mode) works
+        # Build image with debug settings before starting QEMU
         self._check_runqemu_prerequisites()
-        bitbake(testimage)
+        tempdir = self._devtool_ide_sdk_recipe(
+            recipe_name, build_file, testimage)
+        runCmd('devtool ide-sdk %s %s -c --ide=code' % (recipe_name, testimage),
+               output_log=self._cmd_logger)
+
         with runqemu(testimage, runqemuparams="nographic") as qemu:
-            tempdir = self._devtool_ide_sdk_recipe(
-                recipe_name, build_file, testimage)
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=code' % (
+            # Re-run with actual QEMU IP; image is already built
+            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=code' % (
                 recipe_name, testimage, qemu.ip)
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
 
@@ -4507,13 +4509,17 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
         testimage = "oe-selftest-image"
 
         self._check_workspace()
-        self._write_bb_config([recipe_name], extra_packages=['lldb-server'])
+        self._write_bb_config()
 
+        # Build image with debug settings (lldb-server for clang) before starting QEMU
         self._check_runqemu_prerequisites()
-        bitbake(testimage)
+        tempdir = self._devtool_ide_sdk_recipe(recipe_name, build_file, testimage)
+        runCmd('devtool ide-sdk %s %s -c --ide=code' % (recipe_name, testimage),
+               output_log=self._cmd_logger)
+
         with runqemu(testimage, runqemuparams="nographic") as qemu:
-            tempdir = self._devtool_ide_sdk_recipe(recipe_name, build_file, testimage)
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=code' % (
+            # Re-run with actual QEMU IP; image is already built
+            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=code' % (
                 recipe_name, testimage, qemu.ip)
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
 
@@ -4566,7 +4572,7 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
         testimage = "oe-selftest-image"
 
         self._check_workspace()
-        self._write_bb_config([recipe_name], extra_packages=['lldb-server'])
+        self._write_bb_config()
 
         # Build image with debug settings (lldb-server for clang) before starting QEMU
         self._check_runqemu_prerequisites()
@@ -4678,12 +4684,17 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
         testimage = 'oe-selftest-image'
 
         self._check_workspace()
-        self._write_bb_config([recipe_name], extra_packages=['lldb-server'])
+        self._write_bb_config()
         self._check_runqemu_prerequisites()
-        bitbake(testimage)
+
+        # Build image with debug settings (lldb-server for clang) before starting QEMU
+        tempdir = self._devtool_ide_sdk_recipe(recipe_name, build_file, testimage)
+        runCmd('devtool ide-sdk %s %s -c --ide=none' % (recipe_name, testimage),
+               output_log=self._cmd_logger)
+
         with runqemu(testimage, runqemuparams='nographic') as qemu:
-            tempdir = self._devtool_ide_sdk_recipe(recipe_name, build_file, testimage)
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=none' % (
+            # Re-run with actual QEMU IP; image is already built
+            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=none' % (
                 recipe_name, testimage, qemu.ip)
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
 
@@ -4742,7 +4753,7 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
         testimage = 'oe-selftest-image'
 
         self._check_workspace()
-        self._write_bb_config([recipe_name], extra_packages=['lldb-server'])
+        self._write_bb_config()
         self._check_runqemu_prerequisites()
 
         # Build image with debug settings (lldb-server for clang) before starting QEMU
@@ -4803,7 +4814,7 @@ class DevtoolIdeSdkMiscTests(DevtoolIdeSdkTests):
         shared_recipe_name = "cmake-example"
 
         self._check_workspace()
-        self._write_bb_config([modified_recipe_name])
+        self._write_bb_config()
         tempdir = self._devtool_ide_sdk_recipe(
             modified_recipe_name, modified_build_file, None)
 
-- 
2.55.0


