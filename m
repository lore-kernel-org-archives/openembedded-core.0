Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8531DE9413A
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 08:47:39 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60922.1767084455973752649
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 00:47:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=exqJMUJl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20251230084734715d90367f0002079d-cas2ek@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20251230084734715d90367f0002079d
        for <openembedded-core@lists.openembedded.org>;
        Tue, 30 Dec 2025 09:47:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=zFY7iwpeCYRnLCURU7AmoVu6wXWgmkiyAFaFWBi6jKE=;
 b=exqJMUJlhMlaW0Leu5LdN13sqGXq9nzZ2zKM5CnbaGGx8efsR0YjZk5VX0ZRK4LX648/cJ
 IUgr89r0bh5ji4qROAkywqxOuicFi4ohS3eIwFz7uxvi4pCGY+qv9MM9NISYb3HYX0NxA8Ro
 1iRJVVpF9+BVEM8dA5irKgRsAIdAoB1PLO0zcttatccdd53TPweV9ScrH65ydRbAf7vVCxCk
 TCnUeYtCW/m+BgQMkrfW3gyomhh2MlB+GGPzkE9wg1Nvf6cSVpVHDinv8msKsP7su4xoD5Gu
 dgZjtbEyCDaWM+0mkV3NA4i41vWQiqhGqr9kwI5oQNSDDkaa3iLre9Ww==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 14/14] oe-selftest: devtool: add compile step in ide-sdk tests
Date: Tue, 30 Dec 2025 09:46:54 +0100
Message-ID: <20251230084720.2371227-15-adrian.freihofer@siemens.com>
In-Reply-To: <20251230084720.2371227-1-adrian.freihofer@siemens.com>
References: <20251230084720.2371227-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 08:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228636

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add explicit compile step to the ide-sdk test workflow. The current
implementation relies on calling bitbake -c install to perform the
install step, which also triggers a build. But this will change when
bitbake will support task execution without handling dependencies.
To make the tests future-proof, add an explicit compile step after
modifying the source code.

This also improves the test coverage for meson based recipes, as the
compile step is now explicitly tested.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 65 +++++++++++++++++++------
 1 file changed, 51 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 092ffd5e9e..6d107df778 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2574,6 +2574,9 @@ class DevtoolIdeSdkTests(DevtoolBase):
     def _sources_scripts_dir(self, src_dir):
         return os.path.realpath(os.path.join(src_dir, 'oe-scripts'))
 
+    def _sources_workdir_dir(self, src_dir):
+        return os.path.realpath(os.path.join(src_dir, 'oe-workdir'))
+
     def _workspace_gdbinit_dir(self, recipe_name):
         return os.path.realpath(os.path.join(self.builddir, 'workspace', 'ide-sdk', recipe_name, 'scripts', 'gdbinit'))
 
@@ -2642,7 +2645,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
             self._workspace_scripts_dir(recipe_name), i_and_d_script)
         self.assertExists(i_and_d_script_path)
 
-    def _devtool_ide_sdk_qemu(self, tempdir, qemu, recipe_name, example_exe):
+    def _devtool_ide_sdk_qemu(self, tempdir, qemu, recipe_name, example_exe, compile_cmd):
         """Verify deployment and execution in Qemu system work for one recipe.
 
         This function checks the entire SDK workflow: changing the code, recompiling
@@ -2687,6 +2690,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
             cpp_code = cpp_code.replace(DevtoolIdeSdkTests.MAGIC_STRING_ORIG, MAGIC_STRING_NEW)
         with open(cpp_example_lib_hpp, 'w') as file:
             file.write(cpp_code)
+        runCmd(compile_cmd, cwd=tempdir, output_log=self._cmd_logger)
         runCmd(install_deploy_cmd, cwd=tempdir, output_log=self._cmd_logger)
 
         # Verify the modified example prints the modified magic string
@@ -2817,6 +2821,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertEqual(len(config_presets), 1)
         cmake_exe = config_presets[0]["cmakeExecutable"]
         preset_name = config_presets[0]["name"]
+        compile_cmd = '%s --build --preset %s' % (cmake_exe, preset_name)
 
         # Verify the wrapper for cmake native is available
         self.assertExists(cmake_exe)
@@ -2826,28 +2831,59 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertIn(preset_name, result.output)
 
         # Verify cmake re-uses the o files compiled by bitbake
-        result = runCmd('%s --build --preset %s' %
-                        (cmake_exe, preset_name), cwd=tempdir, output_log=self._cmd_logger)
+        result = runCmd(compile_cmd, cwd=tempdir, output_log=self._cmd_logger)
         self.assertIn("ninja: no work to do.", result.output)
 
         # Verify the unit tests work (in Qemu user mode)
-        result = runCmd('%s --build --preset %s --target test' %
-                        (cmake_exe, preset_name), cwd=tempdir, output_log=self._cmd_logger)
+        result = runCmd('%s --target test' % compile_cmd, cwd=tempdir, output_log=self._cmd_logger)
         self.assertIn("100% tests passed", result.output)
 
         # Verify re-building and testing works again
-        result = runCmd('%s --build --preset %s --target clean' %
-                        (cmake_exe, preset_name), cwd=tempdir, output_log=self._cmd_logger)
+        result = runCmd('%s --target clean' % compile_cmd, cwd=tempdir, output_log=self._cmd_logger)
         self.assertIn("Cleaning", result.output)
-        result = runCmd('%s --build --preset %s' %
-                        (cmake_exe, preset_name), cwd=tempdir, output_log=self._cmd_logger)
+        result = runCmd(compile_cmd, cwd=tempdir, output_log=self._cmd_logger)
         self.assertIn("Building", result.output)
         self.assertIn("Linking", result.output)
-        result = runCmd('%s --build --preset %s --target test' %
-                        (cmake_exe, preset_name), cwd=tempdir, output_log=self._cmd_logger)
+        result = runCmd('%s --target test' % compile_cmd, cwd=tempdir, output_log=self._cmd_logger)
         self.assertIn("Running tests...", result.output)
         self.assertIn("100% tests passed", result.output)
 
+        return compile_cmd
+
+    def _verify_meson_build(self, tempdir, recipe_name):
+        """Verify meson works as expected
+
+        Check if compiling works
+        Check if unit tests can be executed in qemu (not qemu-system)
+        """
+        meson_exe = os.path.join(self._workspace_scripts_dir(recipe_name), "meson")
+        self.assertExists(meson_exe)
+        build_dir = os.path.join(self._sources_workdir_dir(tempdir), recipe_name + "-1.0")
+        compile_cmd = '%s compile -C %s' % (meson_exe, build_dir)
+
+        # Verify meson re-uses the o files compiled by bitbake
+        result = runCmd(compile_cmd, cwd=tempdir, output_log=self._cmd_logger)
+        self.assertIn("ninja: no work to do.", result.output)
+
+        # Verify the unit tests work (in Qemu user mode)
+        result = runCmd('%s test -C %s' % (meson_exe, build_dir),
+                        cwd=tempdir, output_log=self._cmd_logger)
+        self.assertEqual(result.status, 0)
+        self.assertIn("Fail:              0", result.output)
+
+        # Verify re-building and testing works again
+        result = runCmd('%s compile -C %s --clean' % (meson_exe, build_dir),
+                        cwd=tempdir, output_log=self._cmd_logger)
+        self.assertIn("Cleaning...", result.output)
+        result = runCmd(compile_cmd, cwd=tempdir, output_log=self._cmd_logger)
+        self.assertIn("Linking target", result.output)
+        result = runCmd('%s test -C %s' % (meson_exe, build_dir),
+                        cwd=tempdir, output_log=self._cmd_logger)
+        self.assertEqual(result.status, 0)
+        self.assertIn("Fail:              0", result.output)
+
+        return compile_cmd
+
     def _verify_service_running(self, qemu, service_name):
         """Helper to verify a service is running in Qemu"""
         status, output = qemu.run("pgrep %s" % service_name)
@@ -2897,8 +2933,8 @@ class DevtoolIdeSdkTests(DevtoolBase):
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
 
             self._gdb_cross()
-            self._verify_cmake_preset(tempdir)
-            self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe)
+            compile_cmd = self._verify_cmake_preset(tempdir)
+            self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe, compile_cmd)
 
             # Verify the oe-scripts sym-link is valid
             self.assertEqual(self._workspace_scripts_dir(
@@ -2929,7 +2965,8 @@ class DevtoolIdeSdkTests(DevtoolBase):
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
 
             self._gdb_cross()
-            self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe)
+            compile_cmd = self._verify_meson_build(tempdir, recipe_name)
+            self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe, compile_cmd)
 
             # Verify the oe-scripts sym-link is valid
             self.assertEqual(self._workspace_scripts_dir(
-- 
2.52.0


