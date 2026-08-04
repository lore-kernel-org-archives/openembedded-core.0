Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D72C5620A
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:00:54 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14577.1785844850523472426
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=H3Y4i8xq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-202608041200397e5f1eff7700020741-kr4q9d@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202608041200397e5f1eff7700020741
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 14:00:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=QxrzNH6HUoHOfL0LV6BOP3tcS7Y8Psw+E/5mesx8zWg=;
 b=H3Y4i8xqzG2YEFRoLzPAQJks2Whwkcen6QY6NzUBGPElJnXB373WM2IBNO0hUNB5LHU9d8
 J1ddL82IGgmZkDpK547WlFPdKmFYoXWbl2lpj5o8M6g24klypfF4fKusG8XzXa8Mpv438fBM
 nbmqH8172y9B+EkDLjSQrv+vR1+grVvFQcokMYT/xfAln9wnISCa7OqQYKY16ZcQShvo/02n
 66Vx7EYKTRW0WVQrtHudpZJub5+xDYD79sp0REHQkQTzDck5o69AP3FIH+7NJxeixyqBsKCx
 SXKBLN4D6xUDmE4SoQYiXvHOxw0Wbk76+yeUiHy+SPyC8bw5Lw0rnMPw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 07/14] oe-selftest: devtool ide-sdk: add real debug coverage for meson+code
Date: Tue,  4 Aug 2026 13:59:31 +0200
Message-ID: <20260804120034.378787-8-adrian.freihofer@siemens.com>
In-Reply-To: <20260804120034.378787-1-adrian.freihofer@siemens.com>
References: <20260804120034.378787-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:00:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242731

From: Adrian Freihofer <adrian.freihofer@siemens.com>

test_devtool_ide_sdk_code_meson never booted qemu-system (missing
@OETestTag("runqemu") and runqemu()), passed a hardcoded, non-existent
target address (root@192.168.17.17), and only checked _gdb_cross()
(gdb-cross --version). It never validated the generated launch.json
nor performed an actual remote debugging session, unlike its cmake
sibling test_devtool_ide_sdk_code_cmake.

Bring it to parity with test_devtool_ide_sdk_code_cmake: boot
qemu-system, use the real qemu.ip as target address, and call
_verify_launch_json() plus _verify_launch_json_debugging() to exercise
a genuine gdbserver-based debug session through the generated
launch.json/tasks.json. This closes the last gap in the 2x2 matrix of
build system (cmake/meson) x ide mode (code/none): all four
combinations now have real breakpoint-debugging coverage.

_verify_launch_json_debugging() matched the 'once' debug configuration
by looking for "usr-bin-{recipe_name}_once" in its name. But the
config name is derived from the binary's install path, so it is
"usr-bin-{example_exe}_once". This happened to work for cmake-example,
where the binary name equals the recipe name, but not for
meson-example, whose recipe name is 'meson-example' while the
installed binary is 'mesonex'. Match on example_exe instead, and drop
the now-unused recipe_name parameter.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 83 +++++++++++++++----------
 1 file changed, 50 insertions(+), 33 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index dbcb05022a..3b24ce3914 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3395,7 +3395,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertEqual(len(once_configs), 2, f"Should have two once configuration, found: {once_configs}")
         self.assertEqual(len(attach_configs), 1, f"Should have one attach configuration, found: {attach_configs}")
 
-    def _verify_launch_json_debugging(self, tempdir, qemu, recipe_name, example_exe):
+    def _verify_launch_json_debugging(self, tempdir, qemu, example_exe):
         """Verify remote debugging and deployment works using launch.json configurations
 
         This method tests the VSCode debug configurations by:
@@ -3434,15 +3434,19 @@ class DevtoolIdeSdkTests(DevtoolBase):
         tasks = tasks_d["tasks"]
 
         # Test one configuration for remote debugging
+        # The config name is derived from the binary's install path
+        # (e.g. "usr-bin-<example_exe>"), which is not necessarily the same
+        # as the recipe name (e.g. meson-example installs a binary named
+        # "mesonex").
         once_config_count = 0
         for config in configurations:
-            if f"usr-bin-{recipe_name}_once" in config["name"]:
+            if f"usr-bin-{example_exe}_once" in config["name"]:
                 once_config_count += 1
                 self._verify_launch_config(tempdir, config, tasks, qemu, example_exe,
                                            self._gdb_debug_cpp_example, self._gdb_debug_cpp_example_check)
             # It works but is not 100% reliable in VSCode
             # This one: https://github.com/microsoft/vscode-cpptools/issues/4243 ?
-            # elif f"usr-bin-{recipe_name}_attach" in config["name"]
+            # elif f"usr-bin-{example_exe}_attach" in config["name"]
             #     self._verify_launch_config(tempdir, config, tasks, qemu, example_exe)
             else:
                 continue
@@ -3569,51 +3573,64 @@ class DevtoolIdeSdkTests(DevtoolBase):
             self._verify_launch_json(tempdir)
 
             # Verify deployment and remote debugging works
-            self._verify_launch_json_debugging(tempdir, qemu, recipe_name, example_exe)
+            self._verify_launch_json_debugging(tempdir, qemu, example_exe)
 
+    @OETestTag("runqemu")
     def test_devtool_ide_sdk_code_meson(self):
         """Verify a meson recipe works with ide=code mode"""
         recipe_name = "meson-example"
+        example_exe = "mesonex"
         build_file = "meson.build"
         testimage = "oe-selftest-image"
 
         self._check_workspace()
         self._write_bb_config([recipe_name])
-        tempdir = self._devtool_ide_sdk_recipe(
-            recipe_name, build_file, testimage)
-        bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@192.168.17.17 -c --ide=code' % (
-            recipe_name, testimage)
-        runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
 
-        with open(os.path.join(tempdir, '.vscode', 'settings.json')) as settings_j:
-            settings_d = json.load(settings_j)
-        meson_exe = settings_d["mesonbuild.mesonPath"]
-        meson_build_folder = settings_d["mesonbuild.buildFolder"]
+        # Verify deployment to Qemu (system mode) works
+        self._check_runqemu_prerequisites()
+        bitbake(testimage)
+        with runqemu(testimage, runqemuparams="nographic") as qemu:
+            tempdir = self._devtool_ide_sdk_recipe(
+                recipe_name, build_file, testimage)
+            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=code' % (
+                recipe_name, testimage, qemu.ip)
+            runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
 
-        # Verify the wrapper for meson native is available
-        self.assertExists(meson_exe)
+            with open(os.path.join(tempdir, '.vscode', 'settings.json')) as settings_j:
+                settings_d = json.load(settings_j)
+            meson_exe = settings_d["mesonbuild.mesonPath"]
+            meson_build_folder = settings_d["mesonbuild.buildFolder"]
 
-        # Verify meson re-uses the o files compiled by bitbake
-        result = runCmd('%s compile -C  %s' %
-                        (meson_exe, meson_build_folder), cwd=tempdir, output_log=self._cmd_logger)
-        self.assertIn("ninja: no work to do.", result.output)
+            # Verify the wrapper for meson native is available
+            self.assertExists(meson_exe)
 
-        # Verify the unit tests work (in Qemu)
-        runCmd('%s test -C %s' % (meson_exe, meson_build_folder), cwd=tempdir,
-               output_log=self._cmd_logger)
+            # Verify meson re-uses the o files compiled by bitbake
+            result = runCmd('%s compile -C  %s' %
+                            (meson_exe, meson_build_folder), cwd=tempdir, output_log=self._cmd_logger)
+            self.assertIn("ninja: no work to do.", result.output)
 
-        # Verify re-building and testing works again
-        result = runCmd('%s compile -C  %s --clean' %
-                        (meson_exe, meson_build_folder), cwd=tempdir, output_log=self._cmd_logger)
-        self.assertIn("Cleaning...", result.output)
-        result = runCmd('%s compile -C  %s' %
-                        (meson_exe, meson_build_folder), cwd=tempdir, output_log=self._cmd_logger)
-        self.assertIn("Linking target", result.output)
-        runCmd('%s test -C %s' % (meson_exe, meson_build_folder), cwd=tempdir,
-               output_log=self._cmd_logger)
+            # Verify the unit tests work (in Qemu user mode)
+            runCmd('%s test -C %s' % (meson_exe, meson_build_folder), cwd=tempdir,
+                   output_log=self._cmd_logger)
 
-        self._verify_install_script_code(tempdir,  recipe_name)
-        self._gdb_cross()
+            # Verify re-building and testing works again
+            result = runCmd('%s compile -C  %s --clean' %
+                            (meson_exe, meson_build_folder), cwd=tempdir, output_log=self._cmd_logger)
+            self.assertIn("Cleaning...", result.output)
+            result = runCmd('%s compile -C  %s' %
+                            (meson_exe, meson_build_folder), cwd=tempdir, output_log=self._cmd_logger)
+            self.assertIn("Linking target", result.output)
+            runCmd('%s test -C %s' % (meson_exe, meson_build_folder), cwd=tempdir,
+                   output_log=self._cmd_logger)
+
+            self._verify_install_script_code(tempdir,  recipe_name)
+            self._gdb_cross()
+
+            # Verify the launch.json file created is valid
+            self._verify_launch_json(tempdir)
+
+            # Verify deployment and remote debugging works
+            self._verify_launch_json_debugging(tempdir, qemu, example_exe)
 
     @OETestTag("runqemu")
     def test_devtool_ide_sdk_code_kernel_module(self):
-- 
2.55.0


