Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F8CC5DF66
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 19:41:42 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16143.1786909295038730740
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 12:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=GuP4xUqq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20260816194133183039de2100020751-jf2zpl@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260816194133183039de2100020751
        for <openembedded-core@lists.openembedded.org>;
        Sun, 16 Aug 2026 21:41:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=jr5FrpUu+jUtL4D2+jd2IOYubjPS2PB7HwN6uh0M4CY=;
 b=GuP4xUqqz3ycYAabaU3n+lYcbd1VyXYAJ8ReYwoyY2H/bdvD7bIWEDl9vuwuutl1A6GucZ
 RvD5RNyG/WHQ/Gu0Wns1OheL4vSjACzyWoEt4lpgsTa3wJ2h9nhr3RjzQKHobEBD0mY2ozod
 GF4Qjl2C4PA2qeKOXpEvZgBHn1ts1cIgd/moQsPd4v+ko6uP9PuhzNPeRgiVb7ZqeXavH2zv
 1m4jS2LtAq3Q8dI6CGL/Z7/KZZ90/bmg8oxFTp0RS6snP82BxVAW69DhVArq6wzyQ05k72Ce
 JLVCEQHkre2t2vf/3n8UrYzjR4yfGFrzZl8dRWXCpnJ69gTU6nzAVXIw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 14/14] oe-selftest: devtool ide-sdk: verify attach debug workflow
Date: Sun, 16 Aug 2026 21:40:57 +0200
Message-ID: <20260816194127.86607-15-adrian.freihofer@siemens.com>
In-Reply-To: <20260816194127.86607-1-adrian.freihofer@siemens.com>
References: <20260816194127.86607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 19:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243557

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add attach-mode debug verification in ide=code selftests and document
the intended execution flow:

- Verify attach postDebugTask labels against tasks.json.
- Run attach checks before once checks to avoid Build-ID mismatch from
  once/deploy side effects on the still-running service process.
- In attach mode, set a temporary breakpoint on sleep(), continue once
  to hit it, then detach immediately.

This verifies debugger control flow against the already-running loop
without fragile inferior expression evaluation.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 152 +++++++++++++++++++-----
 1 file changed, 119 insertions(+), 33 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 5301b6013e..52aa199319 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3339,10 +3339,19 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
     def _verify_launch_json(self, tempdir):
         """Verify the launch.json file created is valid and contains proper debug configurations"""
         launch_json_path = os.path.join(tempdir, '.vscode', 'launch.json')
+        tasks_json_path = os.path.join(tempdir, '.vscode', 'tasks.json')
         self.assertTrue(os.path.exists(launch_json_path), "launch.json file should exist")
+        self.assertTrue(os.path.exists(tasks_json_path), "tasks.json file should exist")
 
         with open(launch_json_path) as launch_j:
             launch_d = json.load(launch_j)
+        with open(tasks_json_path) as tasks_j:
+            tasks_d = json.load(tasks_j)
+        task_labels = {
+            task.get("label")
+            for task in tasks_d.get("tasks", [])
+            if task.get("label")
+        }
 
         self.assertIn("configurations", launch_d)
         configurations = launch_d["configurations"]
@@ -3418,6 +3427,8 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
                 self.assertIn("_attach", task, f"attach configuration '{config_name}' should have attach preLaunchTask")
                 # Verify postDebugTask exists for attach configurations (kill gdbserver)
                 self.assertIn("postDebugTask", config, f"attach configuration '{config_name}' should have postDebugTask")
+                self.assertIn(config["postDebugTask"], task_labels,
+                              f"attach configuration '{config_name}' postDebugTask should exist in tasks.json")
 
             # Categorize configurations
             config_name = config["name"]
@@ -3431,34 +3442,11 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         self.assertEqual(len(attach_configs), 1, f"Should have one attach configuration, found: {attach_configs}")
 
     def _verify_launch_json_debugging(self, tempdir, qemu, example_exe):
-        """Verify remote debugging and deployment works using launch.json configurations
+        """Verify launch.json debugging configs for one target executable.
 
-        This method tests the VSCode debug configurations by:
-        1. Starting gdbserver on target using tasks.json commands
-        2. Running gdb debugging session with batch commands
-            $BUILDDIR/tmp/work/x86_64-linux/gdb-cross-x86_64/16.3/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gdb --batch  \
-            -ex 'set sysroot $BUILDDIR/tmp/work/x86-64-v3-poky-linux/cmake-example/1.0/image'  \
-            -ex 'set substitute-path /usr/include $BUILDDIR/tmp/work/x86-64-v3-poky-linux/cmake-example/1.0/recipe-sysroot/usr/include'  \
-            -ex 'set substitute-path /usr/src/debug/cmake-example/1.0 $BUILDDIR/workspace/sources/cmake-example'  \
-            -ex 'set substitute-path /usr/src/debug $BUILDDIR/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/usr/src/debug'  \
-            -ex 'set solib-search-path $BUILDDIR/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/lib/.debug:\
-                $BUILDDIR/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/usr/lib/.debug:\
-                $BUILDDIR/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/usr/lib/debug:\
-                $BUILDDIR/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/lib:\
-                $BUILDDIR/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/usr/lib:\
-                $BUILDDIR/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs/lib:\
-                $BUILDDIR/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs/usr/lib'  \
-            -ex 'file $BUILDDIR/tmp/work/x86-64-v3-poky-linux/cmake-example/1.0/image/usr/bin/cmake-example'  \
-            -ex 'target remote 192.168.7.2:1234'  \
-            -ex 'break main'  \
-            -ex 'continue'  \
-            -ex 'break CppExample::print_json()'  \
-            -ex 'continue'  \
-            -ex 'print CppExample::test_string.compare("cpp-example-lib Magic: 123456789")'  \
-            -ex 'print CppExample::test_string.compare("cpp-example-lib Magic: 123456789aaa")'  \
-            -ex 'list cpp-example-lib.hpp:15,15'  \
-            -ex 'continue'
-        3. Verifying debug output and stopping gdbserver
+        Runs attach-mode first against the already-running service process,
+        then validates the once configuration. This ordering avoids Build-ID
+        mismatch from once/deploy side effects before attach is tested.
         """
         with open(os.path.join(tempdir, '.vscode', 'launch.json')) as launch_j:
             launch_d = json.load(launch_j)
@@ -3474,18 +3462,116 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         # as the recipe name (e.g. meson-example installs a binary named
         # "mesonex").
         once_config_count = 0
+        attach_config_count = 0
+
+        # Run attach first. The attach test targets the already-running
+        # service process in the image; running a once configuration first can
+        # deploy/update binaries and trigger Build-ID mismatch warnings against
+        # that still-running process.
+        for config in configurations:
+            if f"usr-bin-{example_exe}_attach" in config["name"]:
+                attach_config_count += 1
+                self._verify_launch_config_attach(tempdir, config, qemu, example_exe)
+
         for config in configurations:
             if f"usr-bin-{example_exe}_once" in config["name"]:
                 once_config_count += 1
                 self._verify_launch_config(tempdir, config, tasks, qemu, example_exe,
                                            self._gdb_debug_cpp_example, self._gdb_debug_cpp_example_check)
-            # It works but is not 100% reliable in VSCode
-            # This one: https://github.com/microsoft/vscode-cpptools/issues/4243 ?
-            # elif f"usr-bin-{example_exe}_attach" in config["name"]
-            #     self._verify_launch_config(tempdir, config, tasks, qemu, example_exe)
-            else:
-                continue
         self.assertEqual(once_config_count, 1, f"Should have one once configuration, found: {once_config_count}")
+        self.assertEqual(attach_config_count, 1, f"Should have one attach configuration, found: {attach_config_count}")
+
+    def _verify_launch_config_attach(self, tempdir, launch_config, qemu, example_exe):
+        """Verify attach-mode debugging by exercising debugger control flow.
+
+        The attached service runs an endless loop, and each loop iteration
+        executes sleep(). We break on sleep() to prove that attach-mode gdb is
+        controlling the already-running process at a point that is expected to
+        be reached repeatedly during normal service execution, then detach.
+        """
+        self.assertEqual(launch_config.get("request"), "attach")
+
+        tasks_path = os.path.join(tempdir, '.vscode', 'tasks.json')
+        self.assertExists(tasks_path, 'tasks.json not found at %s' % tasks_path)
+        with open(tasks_path) as tasks_j:
+            tasks_d = json.load(tasks_j)
+        task_by_label = {
+            task.get('label'): task
+            for task in tasks_d.get('tasks', [])
+            if task.get('label')
+        }
+
+        debugger_path = launch_config["miDebuggerPath"]
+        server_addr = launch_config["miDebuggerServerAddress"]
+        prelaunch_task_name = launch_config["preLaunchTask"]
+        post_debug_task_name = launch_config.get("postDebugTask")
+        program = launch_config["program"]
+        additional_so_lib_search_path = launch_config["additionalSOLibSearchPath"]
+        source_file_map = launch_config["sourceFileMap"]
+        setup_commands = launch_config["setupCommands"]
+
+        self.assertTrue(post_debug_task_name,
+                        "attach configuration should define postDebugTask")
+        self.assertIn(prelaunch_task_name, task_by_label)
+        self.assertIn(post_debug_task_name, task_by_label)
+
+        status, _ = qemu.run('test -x /usr/bin/gdbserver')
+        self.assertEqual(status, 0, "gdbserver should be installed on target")
+        status, _ = qemu.run('test -x ' + os.path.join('/usr/bin', example_exe))
+        self.assertEqual(status, 0, "Example binary should be installed on target")
+
+        # The attach preLaunchTask has no dependsOn (it attaches to an already
+        # running service instead of building/deploying), so it can be run
+        # directly without a dependency chain runner.
+        prelaunch_task = task_by_label[prelaunch_task_name]
+        prelaunch_cmd = [prelaunch_task["command"]] + [str(arg)
+                                                         for arg in prelaunch_task.get("args", [])]
+        # The tasks.json command is shell-quoted and escapes '$' for an
+        # intermediate shell, so undo that before passing argv to subprocess.
+        if prelaunch_cmd[-1].startswith('"') and prelaunch_cmd[-1].endswith('"'):
+            prelaunch_cmd[-1] = prelaunch_cmd[-1][1:-1].replace('\\$', '$')
+        runCmd(prelaunch_cmd, output_log=self._cmd_logger)
+
+        # Attach to the service process currently running on the target.
+        status, output = qemu.run("pgrep '^%s$'" % example_exe)
+        self.assertEqual(status, 0, msg="%s service not running: %s" %
+                         (example_exe, output))
+        service_pid = output.strip()
+        self.assertRegex(service_pid, r'^\d+$')
+
+        gdb_batch_cmd = debugger_path + " --batch"
+        for setup_command in setup_commands:
+            setup_cmd = setup_command["text"].strip()
+            if setup_cmd.startswith("-"):
+                continue
+            gdb_batch_cmd += ' -ex ' + shlex.quote(setup_cmd)
+        for k, v in source_file_map.items():
+            gdb_batch_cmd += " -ex 'set substitute-path %s %s'" % (k, v.replace("${workspaceFolder}", tempdir))
+        gdb_batch_cmd += " -ex 'set solib-search-path %s'" % additional_so_lib_search_path
+        gdb_batch_cmd += " -ex 'file %s'" % program
+        gdb_batch_cmd += " -ex 'target extended-remote %s'" % server_addr
+        gdb_batch_cmd += " -ex 'attach %s'" % service_pid
+        gdb_batch_cmd += " -ex 'set breakpoint pending on'"
+        gdb_batch_cmd += " -ex 'tbreak sleep'"
+        gdb_batch_cmd += " -ex 'continue'"
+        gdb_batch_cmd += " -ex 'detach'"
+        self.logger.debug(f"Starting attach gdb session with command: {gdb_batch_cmd}")
+
+        r = runCmd(gdb_batch_cmd, output_log=self._cmd_logger)
+        self.assertEqual(r.status, 0)
+        self.assertIn("sleep", r.output)
+
+        # Stop the persistent attach server and verify the service survives.
+        post_debug_task = task_by_label[post_debug_task_name]
+        post_debug_cmd = [post_debug_task["command"]] + [str(arg)
+                                                          for arg in post_debug_task.get("args", [])]
+        if post_debug_cmd[-1].startswith('"') and post_debug_cmd[-1].endswith('"'):
+            post_debug_cmd[-1] = post_debug_cmd[-1][1:-1].replace('\\$', '$')
+        runCmd(post_debug_cmd, output_log=self._cmd_logger)
+
+        status, output = qemu.run("pgrep '^%s$'" % example_exe)
+        self.assertEqual(status, 0, msg="%s service should still be running after attach stop: %s" %
+                         (example_exe, output))
 
     def _verify_launch_config(self, tempdir, launch_config, tasks, qemu, example_exe, debug_func=None, debug_check_func=None):
         self.assertIsNotNone(launch_config, "Should have at least one launch debug configuration")
-- 
2.55.0


