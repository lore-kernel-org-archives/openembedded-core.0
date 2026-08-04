Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F2AC55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:01:04 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14711.1785844847606000387
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=k8L/lhmw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20260804120040655197ba9600020775-9nft0t@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260804120040655197ba9600020775
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 14:00:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=4kA6xC9OKiwdqmfBKWt2oZsXbkU20yO9Wm8R4yvHkEY=;
 b=k8L/lhmw6aT+JLqX5n96EPUiPWjnstytr0Pnsj1cvJAX0UWzmfxOgLcgANqdW6yh7JkVuv
 vvE7sCta7w8hdaXXL3VK+swxWbscgdT7gz3nR2VGZVRk1fO1cHuOqV3VrH0YCxx2HAir5y2q
 LXuqc5kWUslqaxu5Gb3M8gtgbsv1ua1Pf+y8x7dJrVOrQHh6WwnoTFTlOH7QdPy+wE19WxHT
 XUgbl/SFpNe3DTSLri8tiYuMng43/Ml4FHY2Li1fcFgEg15mh0OBKu0X6OJofxKeACIIe5c3
 CCzkN1u7enrdicd0pmr230hDYZT6bkIY6atSV6oBGhNM8U+saZL+0Bzw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 13/14] oe-selftest: devtool ide-sdk: add clang/LLDB test
Date: Tue,  4 Aug 2026 13:59:37 +0200
Message-ID: <20260804120034.378787-14-adrian.freihofer@siemens.com>
In-Reply-To: <20260804120034.378787-1-adrian.freihofer@siemens.com>
References: <20260804120034.378787-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:01:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242733

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
 meta/lib/oeqa/selftest/cases/devtool.py | 478 +++++++++++++++++++++++-
 1 file changed, 474 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 3b24ce3914..e9b8f38449 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2762,13 +2762,15 @@ class DevtoolIdeSdkTests(DevtoolBase):
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
             'DISTRO_FEATURES:append = " ptest"',
             # Static UIDs/GIDs are required so that files installed via
             # "install -o ${BPN}" in do_install embed the same UID that gets
@@ -3217,7 +3219,9 @@ class DevtoolIdeSdkTests(DevtoolBase):
 
     def _verify_service_running(self, qemu, service_name):
         """Helper to verify a service is running in Qemu"""
-        status, output = qemu.run("pgrep %s" % service_name)
+        # Use anchored regex (^name$) instead of pgrep -x because the target
+        # may have busybox pgrep which does not support the -x flag.
+        status, output = qemu.run("pgrep '^%s$'" % service_name)
         self.assertEqual(status, 0, msg="%s service not running: %s" %
                          (service_name, output))
         self.assertTrue(output.strip().isdigit(),
@@ -3908,6 +3912,472 @@ class DevtoolIdeSdkTests(DevtoolBase):
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
+            # Verify targetCreateCommands creates the target with --remote-file so
+            # LLDB uses the host debug binary for symbols but executes the pre-deployed
+            # binary on the target (avoiding the module-cache upload path).
+            target_create_commands = config.get("targetCreateCommands", [])
+            self.assertTrue(len(target_create_commands) > 0,
+                            f"Configuration '{config_name}' should have targetCreateCommands")
+            create_cmd = target_create_commands[0]
+            self.assertIn("--remote-file", create_cmd,
+                          f"Configuration '{config_name}' targetCreateCommands should use "
+                          "--remote-file to specify the remote binary path")
+            self.assertIn("/image/", create_cmd,
+                          f"Configuration '{config_name}' targetCreateCommands should reference "
+                          "the host debug binary in the image directory")
+
+            # Verify preLaunchTask referencing the lldb-server start task
+            task = config.get("preLaunchTask", "")
+            self.assertTrue(task,
+                            f"Configuration '{config_name}' preLaunchTask should not be empty")
+
+    def _find_source_break_line(self, tempdir, source_file, marker):
+        """Find the 1-based line number of `marker` in tempdir/source_file
+
+        Used to set a source-level (file:line) breakpoint at a stable,
+        self-documenting location instead of hard-coding a line number that
+        would silently go stale whenever the example source changes.
+        """
+        source_path = os.path.join(tempdir, source_file)
+        with open(source_path) as f:
+            for lineno, line in enumerate(f, start=1):
+                if marker in line:
+                    return lineno
+        self.fail("Could not find marker %r in %s" % (marker, source_path))
+
+    def _lldb_debug_cpp_example_batch_commands(self, tempdir):
+        """Get a list of lldb --batch '-o' commands to debug the cpp-example-lib example
+
+        Mirrors _gdb_debug_cpp_example: sets source-level (file:line)
+        breakpoints in the executable (cpp-example.cpp), the library's own
+        .cpp file (cpp-example-lib.cpp) and a header-only inline function
+        (cpp-example-lib.hpp), then inspects a variable at each stop. This
+        exercises breakpoint resolution against all three distinct debug-info
+        sources (executable, library, header-only), instead of only the
+        single call-site breakpoint in the executable used previously.
+
+        The breakpoints are deliberately set by source file:line (rather than
+        by function/symbol name, e.g. "b main") because that is what exercises
+        CodeLLDB/LLDB's sourceMap reverse-lookup: translating a source file
+        path back into debug-info space to resolve the breakpoint location.
+        A symbol breakpoint resolves directly from the symbol table and would
+        not catch a broken/ambiguous sourceMap (see the "fix source map for
+        lldb" change), so it is not a sufficient regression test on its own.
+
+        Line numbers are (re-)discovered via markers rather than hard-coded,
+        so the same commands keep working after a caller shifts lines with
+        _shift_cpp_example_lines_and_recompile() and recompiles.
+        """
+        exe_break_line = self._find_source_break_line(
+            tempdir, 'cpp-example.cpp', 'cpp_example.print_json();')
+        lib_break_line = self._find_source_break_line(
+            tempdir, 'cpp-example-lib.cpp',
+            'std::cout << json_object_to_json_string_ext(jobj, flag) << std::endl;')
+        hpp_break_line = self._find_source_break_line(
+            tempdir, 'cpp-example-lib.hpp', 'int scaled = n * 7;')
+
+        return [
+            "-o", "breakpoint set --file cpp-example.cpp --line %d" % exe_break_line,
+            "-o", "breakpoint set --file cpp-example-lib.cpp --line %d" % lib_break_line,
+            "-o", "breakpoint set --file cpp-example-lib.hpp --line %d" % hpp_break_line,
+            # Report the resolved location count right away: sourceMap
+            # ambiguity/underflow (the meson/ninja relative-path bug) leaves a
+            # breakpoint at "locations = 0 (pending)" even though the
+            # breakpoint gutter/status can otherwise look "verified".
+            "-o", "breakpoint list",
+            "-o", "run",
+            # Stop 1: the executable's own breakpoint, right before the call
+            # into the library.
+            "-o", "p cpp_example.get_string()",
+            "-o", "continue",
+            # Stop 2: inside the library's own .cpp file, by file:line. This
+            # is the breakpoint that would fail to resolve (or resolve to a
+            # stale line) if the freshly rebuilt library debug info was not
+            # preferred over a stale rootfs-dbg copy. Inspect a plain local
+            # variable (rather than the CppExample::test_string static class
+            # member, as the GDB test does) because LLDB cannot reliably
+            # evaluate an expression that needs to trigger the lazy
+            # initialization guard of a C++17 inline static std::string over
+            # a remote gdb-remote connection ("Couldn't look up symbols").
+            "-o", "p flag",
+            "-o", "continue",
+            # Stop 3: inside an inline function defined directly in the
+            # header (cpp-example-lib.hpp).
+            "-o", "p n",
+            "-o", "continue",
+            "-o", "exit",
+        ]
+
+    def _lldb_debug_cpp_example_check(self, output, magic_string):
+        """Check the output of an lldb --batch session run with the commands
+        from _lldb_debug_cpp_example_batch_commands()"""
+        self.assertNotIn("(pending)", output,
+                         "breakpoints should resolve to a location instead of staying "
+                         "pending (sourceMap/prefix-map path mismatch): %s" % output)
+        # LLDB emits this when the MD5 checksum embedded in the DWARF line
+        # table (recorded by the compiler at compile time) doesn't match the
+        # file currently on disk. This should never happen for a freshly
+        # (re)compiled and (re)deployed example: it would mean the debugger
+        # is displaying/attributing source lines that don't actually
+        # correspond to the binary being debugged. Treat it as a hard
+        # failure instead of silently tolerating it, so a regression here
+        # (e.g. a sourceMap entry getting clobbered, causing LLDB to resolve
+        # a source file against the wrong, stale location) doesn't go
+        # unnoticed.
+        self.assertNotIn("source file checksum mismatch", output,
+                         "debug info should match the current source files exactly "
+                         "(sourceMap resolving to a stale copy of the file?): %s" % output)
+        # exe (by file:line), library (by file:line) and header (by
+        # file:line) breakpoints should all have been hit: 1 + 1 + 1 = 3
+        self.assertEqual(output.count("stop reason = breakpoint"), 3,
+                         "expected 3 breakpoint hits (executable once, library "
+                         "once, header inline function once): %s" % output)
+        # a local variable should be inspectable at the library breakpoint,
+        # proving the library's own debug info is usable (JSON_C_TO_STRING_SPACED
+        # | JSON_C_TO_STRING_PRETTY == 3). LLDB doesn't always print a "$N ="
+        # value slot (e.g. "(const int) 3" for a compile-time constant vs.
+        # "(int) $0 = 3"/"(int) 3" for an ordinary variable), so anchor the
+        # check on the "p flag" command itself rather than assuming a "="
+        # appears in its output.
+        self.assertRegex(output, r"\(lldb\) p flag\r?\n[^\n]*\b3\b",
+                        "should be able to inspect flag at the library breakpoint: %s" % output)
+        # the magic string should be visible in the program's own output,
+        # proving the freshly (re)compiled example actually ran
+        self.assertIn(magic_string, output,
+                     "should be able to see the magic string printed by the example")
+        # the header-only inline function was hit once, called with n == 6
+        self.assertRegex(output, r"\(lldb\) p n\r?\n[^\n]*\b6\b",
+                        "should be able to inspect n == 6 at the header breakpoint: %s" % output)
+        self.assertIn("exited with status = 0", output,
+                     "the example should run to completion and exit normally: %s" % output)
+
+    def _shift_cpp_example_lines_and_recompile(self, tempdir, compile_cmd, install_deploy_cmd,
+                                               magic_string_new, line_shift=3):
+        """Change the magic string and insert line_shift extra lines before the
+        statements the LLDB file:line breakpoints target, then recompile and redeploy.
+
+        Mirrors the code-change step of _devtool_ide_sdk_qemu (used by the GDB
+        tests): shifts the executable's, the library's and the header's source
+        lines so that a subsequent debugging pass' file:line breakpoints only
+        resolve correctly if they are based on the freshly rebuilt debug info,
+        rather than a stale/cached line-to-address mapping (or, for the
+        library, a stale rootfs-dbg copy instead of the freshly redeployed
+        image folder).
+        """
+        extra_lines = "".join(
+            "    // extra line %d inserted by the test to shift subsequent line numbers\n" % i
+            for i in range(line_shift))
+
+        cpp_example_lib_hpp = os.path.join(tempdir, 'cpp-example-lib.hpp')
+        with open(cpp_example_lib_hpp, 'r') as file:
+            cpp_code = file.read()
+        cpp_code = cpp_code.replace(DevtoolIdeSdkTests.MAGIC_STRING_ORIG, magic_string_new)
+        cpp_code = cpp_code.replace(
+            "    inline static int scale_number(int n)",
+            extra_lines + "    inline static int scale_number(int n)")
+        with open(cpp_example_lib_hpp, 'w') as file:
+            file.write(cpp_code)
+
+        cpp_example_cpp = os.path.join(tempdir, 'cpp-example.cpp')
+        with open(cpp_example_cpp, 'r') as file:
+            cpp_code = file.read()
+        cpp_code = cpp_code.replace(
+            "    cpp_example.print_json();",
+            extra_lines + "    cpp_example.print_json();")
+        with open(cpp_example_cpp, 'w') as file:
+            file.write(cpp_code)
+
+        cpp_example_lib_cpp = os.path.join(tempdir, 'cpp-example-lib.cpp')
+        with open(cpp_example_lib_cpp, 'r') as file:
+            cpp_code = file.read()
+        cpp_code = cpp_code.replace(
+            "    std::cout << json_object_to_json_string_ext(jobj, flag) << std::endl;",
+            extra_lines + "    std::cout << json_object_to_json_string_ext(jobj, flag) << std::endl;")
+        with open(cpp_example_lib_cpp, 'w') as file:
+            file.write(cpp_code)
+
+        runCmd(compile_cmd, cwd=tempdir, output_log=self._cmd_logger)
+        runCmd(install_deploy_cmd, cwd=tempdir, output_log=self._cmd_logger)
+
+    def _lldb_cross_debugging_multi(self, tempdir, recipe_name, compile_cmd, lldb_session_func):
+        """Verify LLDB remote debugging in Qemu, before and after a code change.
+
+        Mirrors _devtool_ide_sdk_qemu (the GDB equivalent): debugs the example
+        once, then edits the source (magic string + line shift on the
+        executable, library and header), recompiles, redeploys, and debugs a
+        second time to prove the breakpoints resolve against the freshly
+        rebuilt debug info rather than a stale/cached line-to-address mapping,
+        closing the coverage gap between the GDB and LLDB test paths.
+
+        lldb_session_func is called once per pass with the magic string
+        expected for that pass; it is expected to run an lldb --batch session
+        and check its output (e.g. a closure around _lldb_server_debugging_once
+        or _lldb_none_debugging_multi).
+        """
+        recipe_id, _ = self._get_recipe_ids(recipe_name)
+        install_deploy_cmd = os.path.join(
+            self._workspace_scripts_dir(recipe_name), 'install_and_deploy_' + recipe_id)
+        self.assertExists(install_deploy_cmd, '%s script not found' % install_deploy_cmd)
+        runCmd(install_deploy_cmd, output_log=self._cmd_logger)
+
+        # First pass: debug the freshly deployed, unmodified example
+        lldb_session_func(DevtoolIdeSdkTests.MAGIC_STRING_ORIG)
+
+        # Change the magic string, shift breakpoint lines, recompile and redeploy
+        magic_string_new = "Magic: 987654321"
+        self._shift_cpp_example_lines_and_recompile(
+            tempdir, compile_cmd, install_deploy_cmd, magic_string_new)
+
+        # Second pass: debug again, breakpoints now resolved at shifted line numbers
+        lldb_session_func(magic_string_new)
+
+    def _lldb_server_debugging_once(self, tempdir, qemu, magic_string):
+        """Verify lldb-server (platform mode) + lldb batch debugging works end-to-end.
+
+        Reads the preLaunchTask SSH command from tasks.json to start lldb-server
+        on the target, then runs lldb --batch to perform a debugging session
+        covering the executable, the library and a header-only inline function
+        (see _lldb_debug_cpp_example_batch_commands), and checks that the
+        expected magic string and variable values are visible.
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
+            # The tasks.json arg is formatted for a shell double-quoted context
+            # (e.g. bash running "ssh ... \"...\$((...))...\"").  Strip the
+            # surrounding quotes and undo the \$ → $ escaping that would
+            # normally be done by bash, so the arg works when passed directly
+            # to SSH via subprocess without an intermediate shell.
+            ssh_cmd[-1] = ssh_cmd[-1][1:-1].replace('\\$', '$')
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
+            # Run lldb --batch: connect to platform, create target with remote-file,
+            # set a source-level breakpoint, and run.
+            # targetCreateCommands replaces the "program" field; each entry is
+            # passed as a separate -o command in batch mode.
+            target_create_commands = lldb_config.get("targetCreateCommands", [])
+            source_map = lldb_config.get("sourceMap", {})
+
+            lldb_batch = [lldb_binary, "--batch"]
+            for cmd in init_commands:
+                lldb_batch += ["-o", cmd]
+            for cmd in target_create_commands:
+                lldb_batch += ["-o", cmd]
+            if source_map:
+                # "settings set target.source-map" replaces the *entire*
+                # mapping list rather than appending to it. Issuing one
+                # "-o settings set target.source-map ..." per entry (as done
+                # previously) silently discards all but the last mapping, so
+                # LLDB ends up resolving source files (and verifying their
+                # DWARF MD5 checksum) against the wrong location, e.g. a
+                # stale rootfs-dbg copy of a devtool-modified recipe's own
+                # sources instead of the freshly edited workspace srctree.
+                # All pairs must therefore be set together in a single
+                # command, exactly like CodeLLDB itself does.
+                source_map_args = []
+                for k, v in source_map.items():
+                    v_resolved = v.replace("${workspaceFolder}", tempdir)
+                    source_map_args += [k, v_resolved]
+                lldb_batch += ["-o", "settings set target.source-map %s" % " ".join(source_map_args)]
+            lldb_batch += self._lldb_debug_cpp_example_batch_commands(tempdir)
+            r = runCmd(lldb_batch, output_log=self._cmd_logger)
+            self.assertEqual(r.status, 0, "lldb batch session failed: %s" % r.output)
+            self._lldb_debug_cpp_example_check(r.output, magic_string)
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
+            # Verify deployment and lldb batch remote debugging work end-to-end,
+            # before and after a code change/recompile/redeploy cycle (see
+            # _lldb_cross_debugging_multi)
+            self._lldb_cross_debugging_multi(
+                tempdir, recipe_name, compile_cmd,
+                lambda magic_string: self._lldb_server_debugging_once(
+                    tempdir, qemu, magic_string))
+
+    @OETestTag("runqemu")
+    def test_devtool_ide_sdk_code_meson_clang(self):
+        """Verify a meson recipe built with clang works with ide=code (CodeLLDB debugging).
+
+        This is the meson/ninja counterpart of test_devtool_ide_sdk_code_cmake_clang.
+        It matters as its own test (rather than being covered by the cmake/clang
+        test alone) because meson/ninja invoke the compiler with source paths
+        relative to the build directory, unlike cmake (with the Ninja or
+        Makefiles generators used here), which normally passes absolute source
+        paths. That relative-path compilation is what previously caused
+        -fdebug-prefix-map/-ffile-prefix-map underflow (DW_AT_name climbing
+        above DW_AT_comp_dir with excess dot-dot components) for devtool
+        workspaces, breaking source-level breakpoint resolution in CodeLLDB.
+        The cmake/clang test alone would not catch that regression.
+
+        This test uses the meson-example-clang recipe which is a meson-example
+        variant built with clang. It installs a separate binary
+        (mesonex-clang) so all four recipe variants (cmake/meson x gcc/clang)
+        can be installed in the same image without conflicts.
+        """
+        recipe_name = "meson-example-clang"
+        build_file = "meson.build"
+        testimage = "oe-selftest-image"
+
+        self._check_workspace()
+        self._write_bb_config([recipe_name], extra_packages=['lldb-server'])
+
+        # Build image with debug settings (lldb-server for clang) before starting QEMU
+        self._check_runqemu_prerequisites()
+        tempdir = self._devtool_ide_sdk_recipe(recipe_name, build_file, testimage)
+        runCmd('devtool ide-sdk %s %s -c --ide=code' % (recipe_name, testimage),
+               output_log=self._cmd_logger)
+
+        with runqemu(testimage, runqemuparams="nographic") as qemu:
+            # Re-run with actual QEMU IP; image is already built
+            bitbake_sdk_cmd = 'devtool ide-sdk %s %s -t root@%s -c --skip-bitbake --ide=code' % (
+                recipe_name, testimage, qemu.ip)
+            runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
+
+            # Verify the meson build system still works (unchanged by clang/lldb support)
+            compile_cmd = self._verify_meson_build(tempdir, recipe_name)
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
+            # Verify deployment and lldb batch remote debugging work end-to-end,
+            # before and after a code change/recompile/redeploy cycle (see
+            # _lldb_cross_debugging_multi)
+            self._lldb_cross_debugging_multi(
+                tempdir, recipe_name, compile_cmd,
+                lambda magic_string: self._lldb_server_debugging_once(
+                    tempdir, qemu, magic_string))
+
     def test_devtool_ide_sdk_plugins(self):
         """Test that devtool ide-sdk can use plugins from other layers."""
 
-- 
2.55.0


