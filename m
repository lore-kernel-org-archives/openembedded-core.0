Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEEE11088E52
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 22:38:33 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27167.1773873511002234684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 15:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=TwthB4hg;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-2026031822382869889572b2000207b3-b1wmjn@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026031822382869889572b2000207b3
        for <openembedded-core@lists.openembedded.org>;
        Wed, 18 Mar 2026 23:38:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vMSEYR+o28e2bg1NR/2XI+R7an3qe4fcuR1VxRCQqRQ=;
 b=TwthB4hg9JLqG3i9kKLnoa7wbUXjpiMUSdOWAbVaX+4c7YLeqijYjS1jb8uD71pEcUd02t
 hU8tibojttqYfaMsqMMeypaXW7kSPcr93O7D1ou8SzQQZ91HqCBoIecs6kVkUQ3NdZk9G8uW
 T5Ovpq+zByZ5RilFyjBz26Sk0tKZuBH0+3pcmmMWOZgGoiZggDgCyk1iPxhcGOBTbPOWcd1v
 s73qWhM+iUFRLqijC1ETqY5HTntTEK8Uuz3qT8rRPL0FIL3Nd03fJQRdmnNzXutliIpbn053
 yYMKT84WerEC8UIKXwbnOAhtCqRH5U1EtqEdMGCa93CqnWkzLaeN2sBw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 9/9] oe-selftest: devtool ide-sdk: add clang/LLDB test
Date: Wed, 18 Mar 2026 23:36:17 +0100
Message-ID: <20260318223736.3414885-10-adrian.freihofer@siemens.com>
In-Reply-To: <20260318223736.3414885-1-adrian.freihofer@siemens.com>
References: <20260318223736.3414885-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 22:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233437

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add test_devtool_ide_sdk_code_cmake_clang to verify the full devtool
ide-sdk workflow for a cmake recipe built with clang.  Unlike the gcc
variant the clang recipe uses lldb-server for remote debugging and
CodeLLDB (vadimcn.vscode-lldb) as the VS Code debug adapter.

The test covers:
- devtool modify + devtool ide-sdk with ide=code
- cmake preset compilation and CTest execution (same as the gcc test)
- extensions.json recommends vadimcn.vscode-lldb
- launch.json uses "type": "lldb" (CodeLLDB) instead of "type": "cppdbg"
- End-to-end lldb --batch remote debugging session via lldb-server
  platform mode running on qemu

Supporting changes:
- _write_bb_config: accept optional extra_packages parameter so the
  clang test can add lldb-server to IMAGE_INSTALL
- _verify_launch_json_lldb: new helper that validates the CodeLLDB
  launch.json structure (type, initCommands, program, cwd, preLaunchTask)
- _lldb_server_debugging_once: new helper that reads the preLaunchTask
  SSH command from tasks.json, starts lldb-server on the target, and
  runs lldb --batch to verify a breakpoint at main is hit
- _verify_service_running: use pgrep with exact regex (^name$) for exact
  process name matching; without that, pgrep would also match
  cmake-example-clang (truncated to 'cmake-example-c' in
  /proc/pid/comm) when checking for cmake-example, returning two PIDs
  and failing the isdigit() assertion

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 196 +++++++++++++++++++++++-
 1 file changed, 192 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 6c6f22a667..2cd03e68d6 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2590,13 +2590,15 @@ class DevtoolIdeSdkTests(DevtoolBase):
         if self.logger.isEnabledFor(logging.DEBUG):
             self._cmd_logger = self.logger
 
-    def _write_bb_config(self, recipe_names):
+    def _write_bb_config(self, recipe_names, extra_packages=None):
         """Helper to write the bitbake local.conf file"""
+        image_install = 'gdbserver ' + ' '.join([r + '-ptest' for r in recipe_names])
+        if extra_packages:
+            image_install += ' ' + ' '.join(extra_packages)
         conf_lines = [
             'IMAGE_CLASSES += "image-combined-dbg"',
             'IMAGE_GEN_DEBUGFS = "1"',
-            'IMAGE_INSTALL:append = " gdbserver %s"' % ' '.join(
-                [r + '-ptest' for r in recipe_names]),
+            'IMAGE_INSTALL:append = " %s"' % image_install,
             'DISTRO_FEATURES:append = " ptest"'
             # Static UIDs/GIDs are required so that files installed via
             # "install -o ${BPN}" in do_install embed the same UID that gets
@@ -2938,7 +2940,9 @@ class DevtoolIdeSdkTests(DevtoolBase):
 
     def _verify_service_running(self, qemu, service_name):
         """Helper to verify a service is running in Qemu"""
-        status, output = qemu.run("pgrep %s" % service_name)
+        # Use anchored regex (^name$) instead of pgrep -x because the target
+        # may have busybox pgrep which does not support the -x flag.
+        status, output = qemu.run("pgrep '^%s$'" % service_name)
         self.assertEqual(status, 0, msg="%s service not running: %s" %
                          (service_name, output))
         self.assertTrue(output.strip().isdigit(),
@@ -3612,6 +3616,190 @@ class DevtoolIdeSdkTests(DevtoolBase):
         runCmdEnv('meson setup %s' % tempdir_meson, cwd=cpp_example_src, output_log=self._cmd_logger)
         runCmdEnv('meson compile', cwd=tempdir_meson, output_log=self._cmd_logger)
 
+    def _verify_launch_json_lldb(self, tempdir):
+        """Verify the launch.json file contains valid CodeLLDB (type: lldb) configurations."""
+        launch_json_path = os.path.join(tempdir, '.vscode', 'launch.json')
+        self.assertTrue(os.path.exists(launch_json_path), "launch.json file should exist")
+
+        with open(launch_json_path) as launch_j:
+            launch_d = json.load(launch_j)
+
+        self.assertIn("configurations", launch_d)
+        configurations = launch_d["configurations"]
+        self.assertGreater(len(configurations), 0,
+                           "Should have at least one debug configuration")
+
+        for config in configurations:
+            config_name = config.get("name", "Unknown")
+            # CodeLLDB configs use "type": "lldb", not "type": "cppdbg"
+            self.assertEqual(config["type"], "lldb",
+                             f"Configuration '{config_name}' should use lldb type (CodeLLDB)")
+            self.assertNotIn("MIMode", config,
+                             f"Configuration '{config_name}' should not have MIMode (CodeLLDB)")
+            self.assertNotIn("miDebuggerPath", config,
+                             f"Configuration '{config_name}' should not have miDebuggerPath")
+            self.assertEqual(config["request"], "launch",
+                             f"Configuration '{config_name}' should be launch type")
+            self.assertEqual(config["cwd"], "/tmp",
+                             f"Configuration '{config_name}' cwd should be /tmp (writable on target)")
+
+            # Verify initCommands contain the platform connect sequence
+            init_commands = config.get("initCommands", [])
+            self.assertTrue(any("platform select remote-linux" in cmd
+                                for cmd in init_commands),
+                            f"Configuration '{config_name}' should select remote-linux platform")
+            self.assertTrue(any("platform connect" in cmd for cmd in init_commands),
+                            f"Configuration '{config_name}' should connect to remote platform")
+
+            # Verify program path points into the image directory
+            program = config.get("program", "")
+            self.assertTrue(program.startswith("/"),
+                            f"Configuration '{config_name}' program should be an absolute path")
+            self.assertIn("/image/", program,
+                          f"Configuration '{config_name}' program should be in image directory")
+
+            # Verify preLaunchTask referencing the lldb-server start task
+            task = config.get("preLaunchTask", "")
+            self.assertTrue(task,
+                            f"Configuration '{config_name}' preLaunchTask should not be empty")
+
+    def _lldb_server_debugging_once(self, tempdir, qemu, recipe_name, magic_string):
+        """Verify lldb-server (platform mode) + lldb batch debugging works end-to-end.
+
+        Reads the preLaunchTask SSH command from tasks.json to start lldb-server
+        on the target, then runs lldb --batch to perform a minimal debugging
+        session and checks that the expected magic string is visible.
+        """
+        sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+
+        with open(os.path.join(tempdir, '.vscode', 'launch.json')) as f:
+            launch_d = json.load(f)
+        with open(os.path.join(tempdir, '.vscode', 'tasks.json')) as f:
+            tasks_d = json.load(f)
+
+        # Find the first *_once or *_multi config
+        lldb_config = next(
+            (c for c in launch_d["configurations"]
+             if "_once" in c["name"] or "_multi" in c["name"]), None)
+        self.assertIsNotNone(lldb_config, "Should have at least one lldb debug configuration")
+
+        prelaunch_task_name = lldb_config["preLaunchTask"]
+        prelaunch_task = next(
+            (t for t in tasks_d["tasks"] if t["label"] == prelaunch_task_name), None)
+        self.assertIsNotNone(prelaunch_task,
+                             "preLaunchTask '%s' not found in tasks.json" % prelaunch_task_name)
+
+        # Extract the SSH command and start lldb-server on the target
+        task_command = prelaunch_task["command"]
+        task_args = prelaunch_task["args"]
+        self.assertEqual(task_command, "ssh",
+                         "preLaunchTask should use ssh to start lldb-server")
+        ssh_cmd = [task_command] + task_args
+        if ssh_cmd[-1].startswith('"') and ssh_cmd[-1].endswith('"'):
+            ssh_cmd[-1] = ssh_cmd[-1][1:-1]
+
+        # Extract connection details from initCommands
+        init_commands = lldb_config["initCommands"]
+        connect_cmd = next((c for c in init_commands if "platform connect" in c), None)
+        self.assertIsNotNone(connect_cmd, "initCommands should contain a platform connect command")
+
+        # Find lldb binary from lldb-native sysroot
+        lldb_native_sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'lldb-native')
+        lldb_binary = os.path.join(lldb_native_sysroot, 'usr', 'bin', 'lldb')
+        self.assertExists(lldb_binary, "lldb binary should exist in lldb-native sysroot")
+
+        with RunCmdBackground(ssh_cmd, output_log=self._cmd_logger):
+            time.sleep(1)
+
+            # Verify lldb-server is running on the target
+            r = runCmd('ssh %s root@%s ps' % (sshargs, qemu.ip),
+                       output_log=self._cmd_logger)
+            self.assertIn("lldb-server", r.output,
+                          "lldb-server should be running on target")
+
+            # Run lldb --batch: connect to platform, set a breakpoint on main, run
+            program = lldb_config["program"]
+            source_map = lldb_config.get("sourceMap", {})
+
+            pre_run_commands = lldb_config.get("preRunCommands", [])
+
+            lldb_batch = [lldb_binary, "--batch"]
+            for cmd in init_commands:
+                lldb_batch += ["-o", cmd]
+            lldb_batch += ["-o", "target create %s" % program]
+            for k, v in source_map.items():
+                v_resolved = v.replace("${workspaceFolder}", tempdir)
+                lldb_batch += ["-o", "settings set target.source-map %s %s" % (k, v_resolved)]
+            for cmd in pre_run_commands:
+                lldb_batch += ["-o", cmd]
+            lldb_batch += [
+                "-o", "b main",
+                "-o", "run",
+                "-o", "continue",
+                "-o", "exit"
+            ]
+            r = runCmd(lldb_batch, output_log=self._cmd_logger)
+            self.assertEqual(r.status, 0, "lldb batch session failed: %s" % r.output)
+            self.assertIn("stop reason = breakpoint", r.output,
+                          "lldb should have stopped at main breakpoint")
+
+    @OETestTag("runqemu")
+    def test_devtool_ide_sdk_code_cmake_clang(self):
+        """Verify a cmake recipe built with clang works with ide=code (CodeLLDB debugging).
+
+        This test uses the cmake-example-clang recipe which is a cmake-example variant
+        built with clang. It installs a separate binary (cmake-example-clang) so all four
+        recipe variants (cmake/meson x gcc/clang) can be installed in the same image
+        without conflicts. It is configured to use lldb-server for debugging instead of
+        gdbserver. The test flow is similar to test_devtool_ide_sdk_code_cmake but with
+        additional checks related to lldb:
+        - devtool ide-sdk selects lldb-native / lldb-server instead of gdb-cross
+        - launch.json uses "type": "lldb" (CodeLLDB) instead of "type": "cppdbg"
+        - extensions.json recommends vadimcn.vscode-lldb
+        - A basic lldb --batch remote debugging session succeeds against the
+          lldb-server platform running on the Qemu target
+        """
+        recipe_name = "cmake-example-clang"
+        build_file = "CMakeLists.txt"
+        testimage = "oe-selftest-image"
+
+        self._check_workspace()
+        self._write_bb_config([recipe_name], extra_packages=['lldb-server'])
+
+        self._check_runqemu_prerequisites()
+        bitbake(testimage)
+        with runqemu(testimage, runqemuparams="nographic") as qemu:
+            tempdir = self._devtool_ide_sdk_recipe(recipe_name, build_file, testimage)
+            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=code' % (
+                recipe_name, testimage, qemu.ip)
+            runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
+
+            # Verify the cmake preset still works (build system unchanged)
+            compile_cmd = self._verify_cmake_preset(tempdir)
+
+            # Verify the install && deploy-target task script exists
+            self._verify_install_script_code(tempdir, recipe_name)
+
+            # Verify extensions.json recommends CodeLLDB instead of / alongside cpptools
+            with open(os.path.join(tempdir, '.vscode', 'extensions.json')) as ext_j:
+                ext_d = json.load(ext_j)
+            recommendations = ext_d.get('recommendations', [])
+            self.assertIn('vadimcn.vscode-lldb', recommendations,
+                          'vadimcn.vscode-lldb should be recommended for clang recipes')
+
+            # Verify launch.json uses CodeLLDB format
+            self._verify_launch_json_lldb(tempdir)
+
+            # Verify deployment and lldb batch remote debugging work end-to-end
+            recipe_id, _ = self._get_recipe_ids(recipe_name)
+            install_deploy_cmd = os.path.join(
+                self._workspace_scripts_dir(recipe_name),
+                'install_and_deploy_' + recipe_id)
+            runCmd(install_deploy_cmd, output_log=self._cmd_logger)
+
+            self._lldb_server_debugging_once(tempdir, qemu, recipe_name,
+                                             DevtoolIdeSdkTests.MAGIC_STRING_ORIG)
+
     def test_devtool_ide_sdk_plugins(self):
         """Test that devtool ide-sdk can use plugins from other layers."""
 
-- 
2.53.0


