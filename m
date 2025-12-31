Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6249EE6453
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 11:47:51 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83936.1767181666334600467
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Dec 2025 03:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=dIdHHTP4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20251231114744e63ce839aa000207ad-_mifdb@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20251231114744e63ce839aa000207ad
        for <openembedded-core@lists.openembedded.org>;
        Wed, 31 Dec 2025 12:47:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=38cE4Hy99EkwyvcFQuVpDPTsnaWHlZY19sQvJ4dJAqI=;
 b=dIdHHTP46iLjm3Vg1Aa4Lb3bo9joQA4kJkTPlASUXYmwuXZWAweD+V5+j0C8AzhddnIOF7
 rjs+Vs39EcJViavgCvBfq5RY+7XN7cdU3odlPBVWWJQ9T+/u/KH/2CixBppjEKqR7gQnXm/8
 /ysz9CIhZljInzp0i2I3Wwrfh1ZGkYmNcRYSDO/EH1KCB7HYPSL4rOjDWCh1LIHjBfjWI31T
 mlpjyPjAA+znVwXMHog8Q6ZLrLtarLkdEBwEgnivbTz4+o36W2w2Y37eaku/jRay0q0Fd98I
 k1HArGIKnOafvWrCGeOAQLWtyAIV4Lx9XyjNjdLLS+wZLX2cmQsom6pA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 14/14] oe-selftest: devtool: add compile step in ide-sdk tests
Date: Wed, 31 Dec 2025 12:46:44 +0100
Message-ID: <20251231114718.4031606-15-adrian.freihofer@siemens.com>
In-Reply-To: <20251231114718.4031606-1-adrian.freihofer@siemens.com>
References: <20251231114718.4031606-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Dec 2025 11:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228736

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
index 3f00ce8ffb..73282111d5 100644
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
@@ -2818,6 +2822,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertEqual(len(config_presets), 1)
         cmake_exe = config_presets[0]["cmakeExecutable"]
         preset_name = config_presets[0]["name"]
+        compile_cmd = '%s --build --preset %s' % (cmake_exe, preset_name)
 
         # Verify the wrapper for cmake native is available
         self.assertExists(cmake_exe)
@@ -2827,28 +2832,59 @@ class DevtoolIdeSdkTests(DevtoolBase):
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
@@ -2898,8 +2934,8 @@ class DevtoolIdeSdkTests(DevtoolBase):
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
 
             self._gdb_cross()
-            self._verify_cmake_preset(tempdir)
-            self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe)
+            compile_cmd = self._verify_cmake_preset(tempdir)
+            self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe, compile_cmd)
 
             # Verify the oe-scripts sym-link is valid
             self.assertEqual(self._workspace_scripts_dir(
@@ -2930,7 +2966,8 @@ class DevtoolIdeSdkTests(DevtoolBase):
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
 
             self._gdb_cross()
-            self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe)
+            compile_cmd = self._verify_meson_build(tempdir, recipe_name)
+            self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe, compile_cmd)
 
             # Verify the oe-scripts sym-link is valid
             self.assertEqual(self._workspace_scripts_dir(
-- 
2.52.0


