Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BF0EE642B
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 11:47:51 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83934.1767181666334449266
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Dec 2025 03:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=KEyeIcWK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20251231114744c2127513c10002077b-ucyz2h@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20251231114744c2127513c10002077b
        for <openembedded-core@lists.openembedded.org>;
        Wed, 31 Dec 2025 12:47:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Iw0H6MeQQ5UK9rTtgl0uAB8+WIIx9WHV991TIS6Xrp4=;
 b=KEyeIcWKqtpLBn8sk9KWgmzDtCsqPOED2nc7b4fm69Vi2J18wGXTPmX3q7yq5cFGiI8/Mo
 ZE+lHbr0MWplQtZMk/DZimx8dkCtj3eS4pCMc2OkiWhD7ym6TRXqkTIB6D5sbA7HXou/BdaX
 BiBHiXkNY+5bL7oNnljGMvLo8rORMrRQd3OIZ5QpuWxY8AA1gxUv4uYl7VI+oWtBlRnD6wNm
 Ohp/Cv94v7Rh1nlnfQ+U8dXnIRmREmvIV6g791F/PWSaSppnj6aoJnTdukFPWdjfsZmADtQ8
 Sucl9fZFe61s0JNeTn3/UF56dL2qjZkyxoCGzOFyxv0E8aJPbbm5x/9w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 09/14] oe-selftest: devtool ide-sdk cover vscode remote debugging
Date: Wed, 31 Dec 2025 12:46:39 +0100
Message-ID: <20251231114718.4031606-10-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228746

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This adds more test coverage for devtool ide-sdk, with VSCode. The cmake
test case has now a full remote debugging test on Qemu. The test checks
the generated launch.json and tasks.json files, starts gdbserver and
connects to it. The test verifies breakpoints, variables and source file
listing.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 325 ++++++++++++++++++++++--
 1 file changed, 297 insertions(+), 28 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b40323c109..df5c863a85 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -9,20 +9,23 @@ import os
 import re
 import shutil
 import tempfile
+import time
 import glob
 import fnmatch
 import unittest
 import json
 import logging
+import shlex
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
+from oeqa.utils.commands import runCmd, Command, bitbake, get_bb_var, create_temp_layer
 from oeqa.utils.commands import get_bb_vars, runqemu, runqemu_check_taps, get_test_layer
 from oeqa.core.decorator import OETestTag
 from bb.utils import mkdirhier, edit_bblayers_conf
 
 oldmetapath = None
 
+
 def setUpModule():
     global templayerdir
     templayerdir = tempfile.mkdtemp(prefix='devtoolqa')
@@ -2524,8 +2527,23 @@ class DevtoolUpgradeTests(DevtoolBase):
         runCmd("grep %s %s" % (modconfopt, codeconfigfile))
 
 
+
+class RunCmdBackground:
+    """Context manager to manage a background subprocess"""
+    def __init__(self, command, output_log=None, **options):
+        self.cmd = Command(command, bg=True, output_log=output_log, **options)
+
+    def __enter__(self):
+        self.cmd.run()
+
+    def __exit__(self, exc_type, exc_val, exc_tb):
+        self.cmd.stop()
+
+
 class DevtoolIdeSdkTests(DevtoolBase):
 
+    MAGIC_STRING_ORIG = "Magic: 123456789"
+
     def setUp(self):
         super().setUp()
         self._cmd_logger = None
@@ -2639,7 +2657,6 @@ class DevtoolIdeSdkTests(DevtoolBase):
                           '%s script not found' % install_deploy_cmd)
         runCmd(install_deploy_cmd, output_log=self._cmd_logger)
 
-        MAGIC_STRING_ORIG = "Magic: 123456789"
         MAGIC_STRING_NEW = "Magic: 987654321"
         ptest_cmd = "ptest-runner " + recipe_name
 
@@ -2652,7 +2669,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         status, output = qemu.run(example_exe)
         self.assertEqual(status, 0, msg="%s failed: %s" %
                          (example_exe, output))
-        self.assertIn(MAGIC_STRING_ORIG, output)
+        self.assertIn(DevtoolIdeSdkTests.MAGIC_STRING_ORIG, output)
 
         # Verify the unmodified ptests work
         status, output = qemu.run(ptest_cmd)
@@ -2661,13 +2678,13 @@ class DevtoolIdeSdkTests(DevtoolBase):
 
         # Verify remote debugging works
         self._gdb_cross_debugging_multi(
-            qemu, recipe_name, example_exe, MAGIC_STRING_ORIG)
+            qemu, recipe_name, example_exe, DevtoolIdeSdkTests.MAGIC_STRING_ORIG)
 
         # Replace the Magic String in the code, compile and deploy to Qemu
         cpp_example_lib_hpp = os.path.join(tempdir, 'cpp-example-lib.hpp')
         with open(cpp_example_lib_hpp, 'r') as file:
             cpp_code = file.read()
-            cpp_code = cpp_code.replace(MAGIC_STRING_ORIG, MAGIC_STRING_NEW)
+            cpp_code = cpp_code.replace(DevtoolIdeSdkTests.MAGIC_STRING_ORIG, MAGIC_STRING_NEW)
         with open(cpp_example_lib_hpp, 'w') as file:
             file.write(cpp_code)
         runCmd(install_deploy_cmd, cwd=tempdir, output_log=self._cmd_logger)
@@ -2676,7 +2693,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         status, output = qemu.run(example_exe)
         self.assertEqual(status, 0, msg="%s failed: %s" %
                          (example_exe, output))
-        self.assertNotIn(MAGIC_STRING_ORIG, output)
+        self.assertNotIn(DevtoolIdeSdkTests.MAGIC_STRING_ORIG, output)
         self.assertIn(MAGIC_STRING_NEW, output)
 
         # Verify the modified example ptests work
@@ -2701,6 +2718,24 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertEqual(r.status, 0)
         self.assertIn("GNU gdb", r.output)
 
+    def _gdb_debug_cpp_example(self, magic_string, gdb_start_cmd="run"):
+        """Get a series of gdb commands to debug the cpp-example-lib example"""
+        gdb_batch_cmd = " -ex 'break main' -ex '%s'" % gdb_start_cmd
+        gdb_batch_cmd += " -ex 'break CppExample::print_json()' -ex 'continue'"
+        gdb_batch_cmd += " -ex 'print CppExample::test_string.compare(\"cpp-example-lib %s\")'" % magic_string
+        gdb_batch_cmd += " -ex 'print CppExample::test_string.compare(\"cpp-example-lib %saaa\")'" % magic_string
+        gdb_batch_cmd += " -ex 'list cpp-example-lib.hpp:14,14'"
+        gdb_batch_cmd += " -ex 'continue'"
+        return gdb_batch_cmd
+
+    def _gdb_debug_cpp_example_check(self, gdb_output, magic_string):
+        self.assertIn("Breakpoint 1, main", gdb_output)
+        self.assertIn("$1 = 0", gdb_output)  # test.string.compare equal
+        self.assertIn("$2 = -3", gdb_output)  # test.string.compare longer
+        self.assertIn(
+            'inline static const std::string test_string = "cpp-example-lib %s";' % magic_string, gdb_output)
+        self.assertIn("exited normally", gdb_output)
+
     def _gdb_cross_debugging_multi(self, qemu, recipe_name, example_exe, magic_string):
         """Verify gdb-cross is working
 
@@ -2743,24 +2778,12 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertIn("1234", r.output)
 
         # Test remote debugging works
-        gdb_batch_cmd = " --batch -ex 'break main' -ex 'run'"
-        gdb_batch_cmd += " -ex 'break CppExample::print_json()' -ex 'continue'"
-        gdb_batch_cmd += " -ex 'print CppExample::test_string.compare(\"cpp-example-lib %s\")'" % magic_string
-        gdb_batch_cmd += " -ex 'print CppExample::test_string.compare(\"cpp-example-lib %saaa\")'" % magic_string
-        gdb_batch_cmd += " -ex 'list cpp-example-lib.hpp:14,14'"
-        gdb_batch_cmd += " -ex 'continue'"
-        return gdb_batch_cmd
-
+        gdb_batch_cmd = " --batch " + self._gdb_debug_cpp_example(magic_string)
         r = runCmd(gdb_script + gdb_batch_cmd, output_log=self._cmd_logger)
         self.logger.debug("%s %s returned: %s", gdb_script,
                           gdb_batch_cmd, r.output)
         self.assertEqual(r.status, 0)
-        self.assertIn("Breakpoint 1, main", r.output)
-        self.assertIn("$1 = 0", r.output)  # test.string.compare equal
-        self.assertIn("$2 = -3", r.output)  # test.string.compare longer
-        self.assertIn(
-            'inline static const std::string test_string = "cpp-example-lib %s";' % magic_string, r.output)
-        self.assertIn("exited normally", r.output)
+        self._gdb_debug_cpp_example_check(r.output, magic_string=magic_string)
 
         # Stop the gdbserver
         r = runCmd(gdbserver_script + ' stop', output_log=self._cmd_logger)
@@ -2861,6 +2884,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
             bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=none' % (
                 recipe_name, testimage, qemu.ip)
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
+
             self._gdb_cross()
             self._verify_cmake_preset(tempdir)
             self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe)
@@ -2892,6 +2916,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
             bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=none' % (
                 recipe_name, testimage, qemu.ip)
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
+
             self._gdb_cross()
             self._devtool_ide_sdk_qemu(tempdir, qemu, recipe_name, example_exe)
 
@@ -2903,22 +2928,266 @@ class DevtoolIdeSdkTests(DevtoolBase):
             # after the install and deploy scripts updated the file
             self._verify_conf_file(qemu, conf_file, example_user_group, example_user_group)
 
+    def _verify_launch_json(self, tempdir):
+        """Verify the launch.json file created is valid and contains proper debug configurations"""
+        launch_json_path = os.path.join(tempdir, '.vscode', 'launch.json')
+        self.assertTrue(os.path.exists(launch_json_path), "launch.json file should exist")
+
+        with open(launch_json_path) as launch_j:
+            launch_d = json.load(launch_j)
+
+        self.assertIn("configurations", launch_d)
+        configurations = launch_d["configurations"]
+        self.assertEqual(len(configurations), 3, "Should have exactly three debug configurations")
+
+        # Track configurations found
+        once_configs = []
+        attach_configs = []
+
+        for config in configurations:
+            # Verify required fields exist
+            required_fields = ["name", "type", "request", "program", "cwd", "MIMode",
+                             "miDebuggerPath", "miDebuggerServerAddress"]
+            for field in required_fields:
+                self.assertIn(field, config, f"Configuration '{config.get('name', 'Unknown')}' missing required field: {field}")
+
+            # Verify common configuration values
+            self.assertEqual(config["type"], "cppdbg", f"Configuration '{config['name']}' should use cppdbg type")
+            self.assertEqual(config["request"], "launch", f"Configuration '{config['name']}' should be launch type")
+            self.assertEqual(config["cwd"], "${workspaceFolder}", f"Configuration '{config['name']}' should use workspaceFolder as cwd")
+            self.assertEqual(config["MIMode"], "gdb", f"Configuration '{config['name']}' should use gdb MIMode")
+            self.assertEqual(config.get("externalConsole", False), False, f"Configuration '{config['name']}' should not use external console")
+            self.assertEqual(config.get("stopAtEntry", True), True, f"Configuration '{config['name']}' should stop at entry")
+
+            # Verify program path is absolute and exists conceptually
+            program = config["program"]
+            self.assertTrue(program.startswith("/"), f"Configuration '{config['name']}' program path should be absolute: {program}")
+            self.assertIn("/image/usr/bin/", program, f"Configuration '{config['name']}' program should be in image/usr/bin")
+
+            # Verify debugger path
+            debugger_path = config["miDebuggerPath"]
+            self.assertTrue(debugger_path.endswith("-gdb"), f"Configuration '{config['name']}' debugger should end with -gdb: {debugger_path}")
+            self.assertIn("/recipe-sysroot-native/usr/bin/", debugger_path, f"Configuration '{config['name']}' debugger should be in sysroot-native")
+
+            # Verify server address format
+            server_addr = config["miDebuggerServerAddress"]
+            self.assertRegex(server_addr, r"^\d+\.\d+\.\d+\.\d+:\d+$", f"Configuration '{config['name']}' server address should be IP:PORT format: {server_addr}")
+
+            # Verify additional SO lib search path exists and contains debug paths
+            so_paths = config.get("additionalSOLibSearchPath", [])
+            self.assertIn("/.debug", so_paths, f"Configuration '{config['name']}' should include debug symbol paths")
+            self.assertIn("/rootfs-dbg/", so_paths, f"Configuration '{config['name']}' should include rootfs-dbg paths")
+
+            # Verify source file mappings
+            source_map = config.get("sourceFileMap", {})
+            self.assertIsInstance(source_map, dict, f"Configuration '{config['name']}' sourceFileMap should be a dictionary")
+            self.assertIn("/usr/src/debug", source_map, f"Configuration '{config['name']}' should map /usr/src/debug")
+            self.assertIn("${workspaceFolder}", str(source_map), f"Configuration '{config['name']}' should map to workspaceFolder")
+
+            # Verify setup commands for sysroot
+            setup_commands = config.get("setupCommands", [])
+            self.assertTrue(len(setup_commands) >= 1, f"Configuration '{config['name']}' should have setup commands")
+            sysroot_cmd = setup_commands[0]
+            self.assertIn("sysroot", sysroot_cmd.get("text", ""), f"Configuration '{config['name']}' should set sysroot in setup commands")
+
+            # Verify preLaunchTask exists and matches name pattern
+            task = config.get("preLaunchTask", "")
+            self.assertTrue(task, f"Configuration '{config['name']}' preLaunchTask should not be empty")
+            # Task should contain port number and executable name from config name
+            config_name = config["name"]
+            if "_once" in config_name:
+                self.assertIn("_once", task, f"once configuration '{config_name}' should have once preLaunchTask")
+            elif "_attach" in config_name:
+                self.assertIn("_attach", task, f"attach configuration '{config_name}' should have attach preLaunchTask")
+                # Verify postDebugTask exists for attach configurations (kill gdbserver)
+                self.assertIn("postDebugTask", config, f"attach configuration '{config_name}' should have postDebugTask")
+
+            # Categorize configurations
+            config_name = config["name"]
+            if "_once" in config_name:
+                once_configs.append(config_name)
+            elif "_attach" in config_name:
+                attach_configs.append(config_name)
+
+        # Verify we have expected configuration types
+        self.assertEqual(len(once_configs), 2, f"Should have two once configuration, found: {once_configs}")
+        self.assertEqual(len(attach_configs), 1, f"Should have one attach configuration, found: {attach_configs}")
+
+    def _verify_launch_json_debugging(self, tempdir, qemu, recipe_name, example_exe):
+        """Verify remote debugging and deployment works using launch.json configurations
+
+        This method tests the VSCode debug configurations by:
+        1. Starting gdbserver on target using tasks.json commands
+        2. Running gdb debugging session with batch commands
+            $BUILDDIR/tmp/work/x86_64-linux/gdb-cross-x86_64/16.3/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gdb --batch  \
+            -ex 'set sysroot $BUILDDIR/tmp/work/x86-64-v3-poky-linux/cmake-example/1.0/image'  \
+            -ex 'set substitute-path /usr/include $BUILDDIR/tmp/work/x86-64-v3-poky-linux/cmake-example/1.0/recipe-sysroot/usr/include'  \
+            -ex 'set substitute-path /usr/src/debug/cmake-example/1.0 $BUILDDIR/workspace/sources/cmake-example'  \
+            -ex 'set substitute-path /usr/src/debug $BUILDDIR/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/usr/src/debug'  \
+            -ex 'set solib-search-path $BUILDDIR/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/lib/.debug:\
+                $BUILDDIR/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/usr/lib/.debug:\
+                $BUILDDIR/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/usr/lib/debug:\
+                $BUILDDIR/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/lib:\
+                $BUILDDIR/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/usr/lib:\
+                $BUILDDIR/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs/lib:\
+                $BUILDDIR/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs/usr/lib'  \
+            -ex 'file $BUILDDIR/tmp/work/x86-64-v3-poky-linux/cmake-example/1.0/image/usr/bin/cmake-example'  \
+            -ex 'target remote 192.168.7.2:1234'  \
+            -ex 'break main'  \
+            -ex 'continue'  \
+            -ex 'break CppExample::print_json()'  \
+            -ex 'continue'  \
+            -ex 'print CppExample::test_string.compare("cpp-example-lib Magic: 123456789")'  \
+            -ex 'print CppExample::test_string.compare("cpp-example-lib Magic: 123456789aaa")'  \
+            -ex 'list cpp-example-lib.hpp:14,14'  \
+            -ex 'continue'
+        3. Verifying debug output and stopping gdbserver
+        """
+        with open(os.path.join(tempdir, '.vscode', 'launch.json')) as launch_j:
+            launch_d = json.load(launch_j)
+        with open(os.path.join(tempdir, '.vscode', 'tasks.json')) as tasks_j:
+            tasks_d = json.load(tasks_j)
+
+        configurations = launch_d["configurations"]
+        tasks = tasks_d["tasks"]
+
+        # Test one configuration for remote debugging
+        once_config_count = 0
+        for config in configurations:
+            if f"usr-bin-{recipe_name}_once" in config["name"]:
+                once_config_count += 1
+                self._verify_launch_config(tempdir, config, tasks, qemu, example_exe,
+                                           self._gdb_debug_cpp_example, self._gdb_debug_cpp_example_check)
+            # It works but is not 100% reliable in VSCode
+            # This one: https://github.com/microsoft/vscode-cpptools/issues/4243 ?
+            # elif f"usr-bin-{recipe_name}_attach" in config["name"]
+            #     self._verify_launch_config(tempdir, config, tasks, qemu, example_exe)
+            else:
+                continue
+        self.assertEqual(once_config_count, 1, f"Should have one once configuration, found: {once_config_count}")
+
+    def _verify_launch_config(self, tempdir, launch_config, tasks, qemu, example_exe, debug_func=None, debug_check_func=None):
+        self.assertIsNotNone(launch_config, "Should have at least one launch debug configuration")
+
+        # Extract configuration values for launch.json
+        debugger_path = launch_config["miDebuggerPath"]
+        server_addr = launch_config["miDebuggerServerAddress"]
+        prelaunch_task_name = launch_config["preLaunchTask"]
+        program = launch_config["program"]
+        additional_so_lib_search_path = launch_config["additionalSOLibSearchPath"]
+        source_file_map = launch_config["sourceFileMap"]
+        setup_commands = launch_config["setupCommands"]
+
+        # Find the preLaunchTask in tasks.json
+        prelaunch_task = next(
+            (task for task in tasks if task["label"] == prelaunch_task_name), None)
+        self.assertIsNotNone(prelaunch_task, f"PreLaunchTask '{prelaunch_task_name}' not found in tasks.json")
+
+        # Find the dependsOn task if exists (install and deploy-target)
+        if "dependsOn" in prelaunch_task:
+            depends_task_names = prelaunch_task["dependsOn"]
+            for depends_task_name in depends_task_names:
+                depends_task = next(
+                    (task for task in tasks if task["label"] == depends_task_name), None)
+                self.assertIsNotNone(depends_task, f"DependsOn task '{depends_task_name}' not found in tasks.json")
+                # For simplicity, we assume the dependsOn task is a prerequisite and does not affect the main command
+                self.logger.debug(f"PreLaunchTask '{prelaunch_task_name}' depends on '{depends_task_name}'")
+
+                # Extract command details from dependsOn task
+                depends_task_command = depends_task["command"]
+                depends_task_args = depends_task.get("args", [])
+                self.logger.debug(f"Would execute dependsOn task: {depends_task_command} {' '.join(depends_task_args)}")
+                runCmd(f"{depends_task_command} {' '.join(depends_task_args)}", output_log=self._cmd_logger)
+
+        # Verify task structure and extract command details
+        self.assertEqual(prelaunch_task["type"], "shell", f"Task '{prelaunch_task_name}' should be shell type")
+        task_command = prelaunch_task["command"]
+        task_args = prelaunch_task["args"]
+
+        # The command should be ssh for remote execution
+        self.assertEqual(task_command, "ssh", f"Task '{prelaunch_task_name}' should use ssh command")
+        self.assertTrue(len(task_args) >= 2, f"Task '{prelaunch_task_name}' should have at least 2 args (ssh options and remote command)")
+
+        sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+        result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, 'test -x /usr/bin/gdbserver'),
+                        output_log=self._cmd_logger)
+        self.assertEqual(result.status, 0, "gdbserver should be installed on target")
+        result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, 'test -x ' + os.path.join('/usr/bin', example_exe)),
+                        output_log=self._cmd_logger)
+        self.assertEqual(result.status, 0, "Example binary should be installed on target")
+
+        # Start gdbserver on target using the task command (keep the ssh connection open while debugging)
+        ssh_gdbserver_cmd = [task_command] + task_args
+        # Fix shell command escaping - remove extra quotes from the last argument
+        # The task_args likely contains a quoted shell command that needs to be unquoted
+        if len(ssh_gdbserver_cmd) > 0 and ssh_gdbserver_cmd[-1].startswith('"') and ssh_gdbserver_cmd[-1].endswith('"'):
+            ssh_gdbserver_cmd[-1] = ssh_gdbserver_cmd[-1][1:-1]  # Remove surrounding quotes
+        self.logger.debug(f"Starting gdbserver with command: {' '.join(ssh_gdbserver_cmd)}")
+        with RunCmdBackground(ssh_gdbserver_cmd, output_log=self._cmd_logger):
+            # Give gdbserver a moment to start
+            time.sleep(1)
+
+            # Verify gdbserver is running on target and listening on expected port
+            result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, 'ps'), output_log=self._cmd_logger)
+            self.assertEqual(result.status, 0, "Failed to check processes on target")
+            self.assertIn("gdbserver", result.output, "gdbserver should be running on target")
+            _, server_port = server_addr.split(':')
+            self.assertIn(server_port, result.output, f"gdbserver should be listening on port {server_port}")
+
+            if debug_func and debug_check_func:
+                # Do a gdb remote session using the once configuration
+                gdb_batch_cmd = debugger_path + " --batch"
+                for setup_command in setup_commands:
+                    # What VSCode does, for tracing add "logging": {"engineLogging": true } to launch.json
+                    setup_cmd = setup_command["text"].strip()
+                    if setup_cmd.startswith("-"):
+                        # Ignore commands starting with '-' as they are VSCode internal commands?
+                        continue
+                    else:
+                        gdb_batch_cmd += ' -ex ' + shlex.quote(setup_cmd)
+                for k, v in source_file_map.items():
+                    gdb_batch_cmd += " -ex 'set substitute-path %s %s'" % (k, v.replace("${workspaceFolder}", tempdir))
+                gdb_batch_cmd += " -ex 'set solib-search-path %s'" % additional_so_lib_search_path
+                gdb_batch_cmd += " -ex 'file %s'" % program
+                gdb_batch_cmd += " -ex 'target remote %s'" % server_addr
+                # Add a basic set of command performing a simple debugging session
+                gdb_batch_cmd += debug_func(DevtoolIdeSdkTests.MAGIC_STRING_ORIG, "continue")
+                self.logger.debug(f"Starting gdb session with command: {gdb_batch_cmd}")
+                r = runCmd(gdb_batch_cmd, output_log=self._cmd_logger)
+                self.logger.debug("%s %s returned: %s", debugger_path, gdb_batch_cmd, r.output)
+                self.assertEqual(r.status, 0)
+                debug_check_func(r.output, DevtoolIdeSdkTests.MAGIC_STRING_ORIG)
+
+    @OETestTag("runqemu")
     def test_devtool_ide_sdk_code_cmake(self):
         """Verify a cmake recipe works with ide=code mode"""
         recipe_name = "cmake-example"
+        example_exe = "cmake-example"
         build_file = "CMakeLists.txt"
         testimage = "oe-selftest-image"
+        build_file = "CMakeLists.txt"
 
         self._check_workspace()
         self._write_bb_config([recipe_name])
-        tempdir = self._devtool_ide_sdk_recipe(
-            recipe_name, build_file, testimage)
-        bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@192.168.17.17 -c --ide=code' % (
-            recipe_name, testimage)
-        runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
-        self._verify_cmake_preset(tempdir)
-        self._verify_install_script_code(tempdir,  recipe_name)
-        self._gdb_cross()
+
+        # Verify deployment to Qemu (system mode) works
+        self._check_runqemu_prerequisites()
+        bitbake(testimage)
+        with runqemu(testimage, runqemuparams="nographic") as qemu:
+            tempdir = self._devtool_ide_sdk_recipe(
+                recipe_name, build_file, testimage)
+            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --ide=code' % (
+                recipe_name, testimage, qemu.ip)
+            runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
+            self._verify_cmake_preset(tempdir)
+            self._verify_install_script_code(tempdir,  recipe_name)
+            self._gdb_cross()
+
+            # Verify the launch.json file created is valid
+            self._verify_launch_json(tempdir)
+
+            # Verify deployment and remote debugging works
+            self._verify_launch_json_debugging(tempdir, qemu, recipe_name, example_exe)
 
     def test_devtool_ide_sdk_code_meson(self):
         """Verify a meson recipe works with ide=code mode"""
-- 
2.52.0


