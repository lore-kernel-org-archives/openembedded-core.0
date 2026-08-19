Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3831FC5DF8F
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 22:01:54 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1139.1787176907730668893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 15:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=LJseACLd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202608192201442e19c648060002078b-95jnn9@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202608192201442e19c648060002078b
        for <openembedded-core@lists.openembedded.org>;
        Thu, 20 Aug 2026 00:01:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Lp4qr8ZkeRFl5i/3d+XcsYqI0A0WKP9Yb4xuX+di3Q4=;
 b=LJseACLdbzuW7O8aCxzp6BnU4sOk6zMOuJjTNMXjjpLcgTatsl/UF0scUL+QrPrgZ2CgqA
 wHOHNfrwbzgsFmTcPaR/gymYb/QZB+P6pobjXdijRMOlgw6xGsyW+d3hlP2jjtYvX2MUQQMo
 Dd/bkCWdjTFMQlIKLkdh9kHGNm43SwNmeMAauEjEkncojenMBCzMnCqyPgIAIhUmrXm2SE4q
 7a0mc8gy3QyVVO4pOT20bafUOtuxQ1Z52dILQL0myB7yWksjexiYrsY/51GSh+tlyDkjcd4U
 HKeqyhQGm0ZC3hW+naS2a6wKhtTTmD/RtbUg3XTYQBEtVp2U0zh4UnWQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 09/14] devtool: ide-sdk: attach via extended-remote
Date: Thu, 20 Aug 2026 00:00:16 +0200
Message-ID: <20260819220138.4095398-10-adrian.freihofer@siemens.com>
In-Reply-To: <20260819220138.4095398-1-adrian.freihofer@siemens.com>
References: <20260819220138.4095398-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 22:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243796

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The old ATTACH mode started gdbserver with "--attach :<port>
$(pidof <binary>)" and used a plain "request": "launch" config. This
is the classic cpptools attach setup, which is fragile and has several
long-standing, unfixed bugs, e.g.
https://github.com/microsoft/vscode-cpptools/issues/4166.

{
    "name": "Attach with GDB",
    "type": "cppdbg",
    "request": "launch",
    "program": "<program>",
    "stopAtEntry": true,
    "cwd": "${workspaceFolder}",
    "environment": [],
    "externalConsole": false,
    "MIMode": "gdb",
    "miDebuggerPath": "/usr/bin/gdb",
    "miDebuggerServerAddress": "<target>:<port>",
    "postDebugTask": "kill_gdbserver_..."
}

cppdbg also supports attaching over the extended-remote protocol:

{
    "name": "Attach with GDB",
    "type": "cppdbg",
    "request": "attach",
    "program": "<program>",
    "MIMode": "gdb",
    "miDebuggerPath": "/usr/bin/gdb",
    "miDebuggerServerAddress": "<target>:<port>",
    "useExtendedRemote": true
}

Switch to this instead: merge ATTACH into the same persistent
"gdbserver --multi" server already used for MULTI mode, since both are
now extended-remote sessions that only differ on the client side, and
stop it by PID instead of pgrep/killall. ONCE mode gets the same
readiness synchronization MULTI already had, since gdbserver now
always writes a PID file that the stop commands wait on.

Allocate a separate debug server port for each mode. This prevents the
persistent attach endpoint from colliding with a once session for the
same binary.

Until https://github.com/microsoft/vscode-cpptools/pull/14684 is
merged, this comes with one downside (which was the blocker for using
extended-remote attach mode until now): the user is prompted to pick the
process to attach to, instead of it being selected automatically. But
this is a temporary limitation, and the new setup is more robust and
fixes several long-standing issues with the old ATTACH mode.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py     |  23 +++-
 scripts/lib/devtool/ide_plugins/__init__.py | 110 +++++++++++++-------
 scripts/lib/devtool/ide_plugins/ide_code.py |  94 +++++++++--------
 scripts/lib/devtool/ide_plugins/ide_none.py |  44 ++++----
 4 files changed, 172 insertions(+), 99 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 0791422461..35abc6a48f 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3397,21 +3397,31 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         # Track configurations found
         once_configs = []
         attach_configs = []
+        server_addresses = []
 
         for config in configurations:
             # Verify required fields exist
-            required_fields = ["name", "type", "request", "program", "cwd", "MIMode",
+            required_fields = ["name", "type", "request", "program", "MIMode",
                              "miDebuggerPath", "miDebuggerServerAddress"]
             for field in required_fields:
                 self.assertIn(field, config, f"Configuration '{config.get('name', 'Unknown')}' missing required field: {field}")
 
             # Verify common configuration values
             self.assertEqual(config["type"], "cppdbg", f"Configuration '{config['name']}' should use cppdbg type")
-            self.assertEqual(config["request"], "launch", f"Configuration '{config['name']}' should be launch type")
-            self.assertEqual(config["cwd"], "${workspaceFolder}", f"Configuration '{config['name']}' should use workspaceFolder as cwd")
             self.assertEqual(config["MIMode"], "gdb", f"Configuration '{config['name']}' should use gdb MIMode")
-            self.assertEqual(config.get("externalConsole", False), False, f"Configuration '{config['name']}' should not use external console")
-            self.assertEqual(config.get("stopAtEntry", True), True, f"Configuration '{config['name']}' should stop at entry")
+
+            if config["request"] == "launch":
+                self.assertEqual(config["cwd"], "${workspaceFolder}", f"Configuration '{config['name']}' should use workspaceFolder as cwd")
+                self.assertEqual(config.get("externalConsole", False), False, f"Configuration '{config['name']}' should not use external console")
+                self.assertEqual(config.get("stopAtEntry", True), True, f"Configuration '{config['name']}' should stop at entry")
+            elif config["request"] == "attach":
+                # Attaching to a process running on the target requires the
+                # extended-remote protocol. Stopping the session then detaches
+                # from the process instead of killing it.
+                self.assertTrue(config.get("useExtendedRemote"), f"Configuration '{config['name']}' should use useExtendedRemote")
+                self.assertNotIn("cwd", config, f"Configuration '{config['name']}' should not set cwd in attach mode")
+            else:
+                self.fail(f"Configuration '{config['name']}' has unexpected request type: {config['request']}")
 
             # Verify program path is absolute and exists conceptually
             program = config["program"]
@@ -3426,6 +3436,7 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
             # Verify server address format
             server_addr = config["miDebuggerServerAddress"]
             self.assertRegex(server_addr, r"^\d+\.\d+\.\d+\.\d+:\d+$", f"Configuration '{config['name']}' server address should be IP:PORT format: {server_addr}")
+            server_addresses.append(server_addr)
 
             # Verify additional SO lib search path exists and contains debug paths
             so_paths = config.get("additionalSOLibSearchPath", [])
@@ -3466,6 +3477,8 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         # Verify we have expected configuration types
         self.assertEqual(len(once_configs), 2, f"Should have two once configuration, found: {once_configs}")
         self.assertEqual(len(attach_configs), 1, f"Should have one attach configuration, found: {attach_configs}")
+        self.assertEqual(len(server_addresses), len(set(server_addresses)),
+                 "Each debug configuration should use a distinct server address")
 
     def _verify_launch_json_debugging(self, tempdir, qemu, example_exe):
         """Verify remote debugging and deployment works using launch.json configurations
diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 5211df5806..136ddd8914 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -59,8 +59,11 @@ class DebuggerCrossConfig:
         self.binary = binary
         self.default_mode = default_mode
         self.binary_pretty = self.binary.binary_path.replace(os.sep, '-').lstrip('-')
-        self.debug_server_port = DebuggerCrossConfig._port_next
-        DebuggerCrossConfig._port_next += 1
+        self.debug_server_ports = {}
+        for mode in self.server_modes():
+            self.debug_server_ports[mode] = DebuggerCrossConfig._port_next
+            DebuggerCrossConfig._port_next += 1
+        self.debug_server_port = self.debug_server_ports[self.default_mode]
         self.id_pretty = "%d_%s" % (self.debug_server_port, self.binary_pretty)
 
         if self.id_pretty in DebuggerCrossConfig._configs:
@@ -68,8 +71,14 @@ class DebuggerCrossConfig:
                 "debugger config for binary %s is already generated" % binary)
         DebuggerCrossConfig._configs[self.id_pretty] = self
 
+    def port(self, mode=None):
+        """Return the debug server port allocated for a server mode."""
+        if mode is None:
+            mode = self.default_mode
+        return self.debug_server_ports[mode]
+
     def id_pretty_mode(self, mode):
-        return "%s_%s" % (self.id_pretty, mode.name.lower())
+        return "%d_%s_%s" % (self.port(mode), self.binary_pretty, mode.name.lower())
 
     # Host-side script paths
     @property
@@ -100,15 +109,16 @@ class DebuggerCrossConfig:
     # Re-tries in 0.1s Example: 300 * 0.1s, i.e. ~30s.
     TARGET_START_RETRIES = 300
 
-    def _target_tcp_port_check_cmd(self):
-        hex_port = "%04X" % self.debug_server_port
+    def _target_tcp_port_check_cmd(self, mode=None):
+        hex_port = "%04X" % self.port(mode)
         return "grep -q :%s /proc/net/tcp /proc/net/tcp6 2>/dev/null" % hex_port
 
-    def _target_wait_for_tcp_port_cmd(self, pid_var=None, log_file=None):
+    def _target_wait_for_tcp_port_cmd(self, pid_var=None, log_file=None, mode=None):
         """Shell fragment waiting until the debug server listens on its port.
 
         The server log is dumped to stderr when giving up.
         """
+        port = self.port(mode)
         dump_log = "cat %s >&2; " % log_file if log_file else ""
         cleanup = ""
         if pid_var:
@@ -117,8 +127,15 @@ class DebuggerCrossConfig:
             "_w=0; while ! %s; do _w=\\$((_w+1)); [ \\$_w -lt %d ] || { "
             "%secho %s did not start on port %s after \\$_w retries >&2; %sexit 1; }; "
             "sleep 0.1; done;"
-            % (self._target_tcp_port_check_cmd(), self.TARGET_START_RETRIES,
-               cleanup, self.DEBUG_SERVER_NAME, self.debug_server_port, dump_log))
+                % (self._target_tcp_port_check_cmd(mode), self.TARGET_START_RETRIES,
+                    cleanup, self.DEBUG_SERVER_NAME, port, dump_log))
+
+    def _target_wait_for_process_exit_cmd(self, pid_var):
+        return (
+            "_w=0; while kill -0 \\$_%s 2>/dev/null; do _w=\\$((_w+1)); "
+            "[ \\$_w -lt 100 ] || { echo %s did not stop >&2; exit 1; }; "
+            "sleep 0.1; done;"
+            % (pid_var, self.DEBUG_SERVER_NAME))
 
     def initialize(self):
         """Called after construction to generate any required config files."""
@@ -128,7 +145,7 @@ class DebuggerCrossConfig:
     def _target_start_cmd(self, mode):
         raise NotImplementedError
 
-    def _target_kill_cmd(self):
+    def _target_stop_cmd(self, mode):
         raise NotImplementedError
 
 
@@ -181,33 +198,59 @@ class GdbCrossConfig(DebuggerCrossConfig):
         Returns something like:
           "\"/bin/sh -c '/usr/bin/gdbserver --once :1234 /usr/bin/cmake-example'\""
         """
+        port = self.port(server_mode)
         if server_mode == DebuggerServerModes.ONCE:
+            # gdbserver runs directly in the foreground for the whole debug
+            # session and exits by itself once it ends. Its own "Listening
+            # on port ..." message (matched by get_debug_server_ready_pattern())
+            # is the readiness signal, so no backgrounding, PID file or
+            # separate polling loop is needed here.
             gdbserver_cmd_start = "%s --once :%s %s" % (
-                self.debugger_cross.debug_server_path, self.debug_server_port, self.binary.binary_path)
-        elif server_mode == DebuggerServerModes.ATTACH:
-            pid_command = self.binary.pid_command
-            if pid_command:
-                gdbserver_cmd_start = "%s --attach :%s \\$(%s)" % (
-                    self.debugger_cross.debug_server_path,
-                    self.debug_server_port,
-                    pid_command)
-            else:
-                raise DevtoolError("Cannot use gdbserver attach mode for binary %s. No PID found." % self.binary.binary_path)
-        elif server_mode == DebuggerServerModes.MULTI:
-            gdbserver_cmd_start = self._target_tcp_port_check_cmd() + " && exit 0; "
+                self.debugger_cross.debug_server_path, port, self.binary.binary_path)
+        elif server_mode in (DebuggerServerModes.ATTACH, DebuggerServerModes.MULTI):
+            # Both modes run a persistent server speaking the extended-remote
+            # protocol. They differ on the client side only: ATTACH attaches to
+            # a process that is already running on the target.
+            pid_file = self._gdbserver_pid_file(server_mode)
+            log_file = self._gdbserver_log_file(server_mode)
+            # Reuse an already-running server for this configuration instead
+            # of starting a second one on the same port.
+            gdbserver_cmd_start = "if test -f %s && kill -0 \\$(cat %s) 2>/dev/null; then exit 0; fi; " % (
+                pid_file, pid_file)
             gdbserver_cmd_start += "mkdir -p %s; " % self._gdbserver_tmp_dir(server_mode)
             gdbserver_cmd_start += "%s --multi :%s > %s 2>&1 & _gdbserver_pid=\\$!; " % (
-                self.debugger_cross.debug_server_path, self.debug_server_port,
-                self._gdbserver_log_file(server_mode))
-            gdbserver_cmd_start += "echo \\$_gdbserver_pid > %s; " % self._gdbserver_pid_file(server_mode)
-            gdbserver_cmd_start += self._target_wait_for_tcp_port_cmd("gdbserver_pid")
+                self.debugger_cross.debug_server_path, port, log_file)
+            gdbserver_cmd_start += "echo \\$_gdbserver_pid > %s; " % pid_file
+            gdbserver_cmd_start += self._target_wait_for_tcp_port_cmd(
+                "gdbserver_pid", mode=server_mode)
         else:
             raise DevtoolError("Unsupported gdbserver mode: %s" % server_mode)
         return "\"/bin/sh -c '" + gdbserver_cmd_start + "'\""
 
-    def _target_kill_cmd(self):
-        """SSH command to kill gdbserver on the target device."""
-        return "\"kill \\$(pgrep -o -f 'gdbserver --attach :%s') 2>/dev/null || true\"" % self.debug_server_port
+    def get_debug_server_ready_pattern(self, mode=None):
+        """Regex matching gdbserver's own "Listening on port N" startup message.
+
+        Used as the problemMatcher endsPattern for VS Code and by selftests to
+        detect readiness directly from gdbserver's output, instead of a
+        separate polling probe.
+        """
+        return r"^Listening on port %d$" % self.port(mode)
+
+    def _target_stop_cmd(self, server_mode):
+        """SSH command to stop gdbserver on the target device.
+
+        Stopping is based on the PID file written by the start command. Other
+        debug sessions run their own gdbserver on the target, so anything
+        matching by process name would hit them as well.
+        """
+        pid_file = self._gdbserver_pid_file(server_mode)
+        gdbserver_cmd_stop = "if test -f %s; then _gdbserver_pid=\\$(cat %s); " % (
+            pid_file, pid_file)
+        gdbserver_cmd_stop += "kill \\$_gdbserver_pid 2>/dev/null; "
+        gdbserver_cmd_stop += self._target_wait_for_process_exit_cmd(
+            "gdbserver_pid")
+        gdbserver_cmd_stop += " fi; rm -rf %s" % self._gdbserver_tmp_dir(server_mode)
+        return "\"/bin/sh -c '" + gdbserver_cmd_stop + "'\""
 
 
 class LldbServerConfig(DebuggerCrossConfig):
@@ -244,10 +287,7 @@ class LldbServerConfig(DebuggerCrossConfig):
         # lldb-server 21.x and the remote lldb client connects from the host.
         # Start from /tmp because lldb-server creates temp files in its cwd and
         # the SSH default cwd (/home/root) may not exist on a minimal image.
-        if mode == DebuggerServerModes.ONCE:
-            cmd = "cd /tmp && %s platform --one-shot --server --listen *:%s" % (
-                lldb_server, self.debug_server_port)
-        elif mode == DebuggerServerModes.MULTI:
+        if mode == DebuggerServerModes.MULTI:
             pid_file = self._lldb_server_pid_file(mode)
             tmp_dir = self._lldb_server_tmp_dir(mode)
             log_file = self._lldb_server_log_file(mode)
@@ -261,11 +301,11 @@ class LldbServerConfig(DebuggerCrossConfig):
                 "lldb_server_pid", log_file)
         else:
             raise DevtoolError(
-                "lldb-server does not support mode %s "
-                "(ATTACH is handled client-side with 'process attach')" % mode)
+                "lldb-server only supports MULTI mode; "
+                "ATTACH is handled client-side with 'process attach': %s" % mode)
         return "\"/bin/sh -c '" + cmd + "'\""
 
-    def _target_kill_cmd(self):
+    def _target_stop_cmd(self, server_mode):
         """SSH command to stop a MULTI-mode lldb-server on the target."""
         pid_file = self._lldb_server_pid_file(DebuggerServerModes.MULTI)
         tmp_dir = self._lldb_server_tmp_dir(DebuggerServerModes.MULTI)
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index d190858d44..1a8a79f623 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -32,14 +32,12 @@ class GdbCrossConfigVSCode(GdbCrossConfig):
             self._target_start_cmd(mode)
         ]
 
-    def target_ssh_gdbserver_kill_args(self):
-        """Get the ssh command arguments to kill gdbserver on the target device
-
-        returns something like:
-          ['-p', '2222', 'root@target', '"kill $(pgrep -o -f \'gdbserver --attach :1234\') 2>/dev/null || true"']
-        """
+    def target_ssh_gdbserver_stop_args(self, mode=None):
+        """Get the ssh command arguments to stop gdbserver on the target device"""
+        if mode is None:
+            mode = self.default_mode
         return self._target_ssh_args() + [
-            self._target_kill_cmd()
+            self._target_stop_cmd(mode)
         ]
 
 
@@ -59,10 +57,12 @@ class LldbServerConfigVSCode(LldbServerConfig):
             self._target_start_cmd(mode)
         ]
 
-    def target_ssh_gdbserver_kill_args(self):
+    def target_ssh_gdbserver_stop_args(self, mode=None):
         """SSH argument list to stop a running MULTI-mode lldb-server"""
+        if mode is None:
+            mode = self.default_mode
         return self._target_ssh_args() + [
-            self._target_kill_cmd()
+            self._target_stop_cmd(mode)
         ]
 
 class IdeVSCode(IdeBase):
@@ -338,25 +338,43 @@ class IdeVSCode(IdeBase):
             return self._vscode_launch_bin_dbg_lldb(cross_debug_config, server_mode)
         return self._vscode_launch_bin_dbg_gdb(cross_debug_config, server_mode)
 
+    @staticmethod
+    def _stop_task_label(cross_debug_config, server_mode):
+        return "stop_%s_%s" % (cross_debug_config.DEBUG_SERVER_NAME,
+                               cross_debug_config.id_pretty_mode(server_mode))
+
     def _vscode_launch_bin_dbg_gdb(self, cross_debug_config, server_mode):
         """Generate a cppdbg (GDB) launch configuration entry for launch.json."""
         modified_recipe = cross_debug_config.modified_recipe
 
+        is_attach = server_mode == DebuggerServerModes.ATTACH
+
         launch_config = {
             "name": cross_debug_config.id_pretty_mode(server_mode),
             "type": "cppdbg",
-            "request": "launch",
+            "request": "attach" if is_attach else "launch",
             "program": cross_debug_config.binary.binary_host_path,
-            "stopAtEntry": True,
-            "cwd": "${workspaceFolder}",
-            "environment": [],
-            "externalConsole": False,
             "MIMode": "gdb",
             "preLaunchTask": cross_debug_config.id_pretty_mode(server_mode),
             "miDebuggerPath": modified_recipe.debugger_cross.gdb,
-            "miDebuggerServerAddress": "%s:%d" % (modified_recipe.debugger_cross.host, cross_debug_config.debug_server_port)
+            "miDebuggerServerAddress": "%s:%d" % (modified_recipe.debugger_cross.host, cross_debug_config.port(server_mode))
         }
 
+        if is_attach:
+            # Without useExtendedRemote, cppdbg rejects attaching to a remote
+            # target. It also makes cppdbg offer a picker listing the processes
+            # running on the target, so the PID does not have to be known when
+            # this configuration is generated. Stopping the session detaches
+            # from the process instead of killing it.
+            launch_config["useExtendedRemote"] = True
+        else:
+            # cwd, environment and externalConsole configure the process the
+            # debugger starts, they are not part of the attach schema.
+            launch_config["cwd"] = "${workspaceFolder}"
+            launch_config["environment"] = []
+            launch_config["externalConsole"] = False
+            launch_config["stopAtEntry"] = True
+
         # Search for header files in recipe-sysroot.
         src_file_map = {
             "/usr/include": os.path.join(modified_recipe.recipe_sysroot, "usr", "include")
@@ -415,10 +433,10 @@ class IdeVSCode(IdeBase):
         launch_config['sourceFileMap'] = src_file_map
         launch_config['setupCommands'] = setup_commands
 
-        # Add postDebugTask for attach mode to clean up gdbserver
-        if server_mode == DebuggerServerModes.ATTACH:
-            kill_task_label = "kill_gdbserver_" + cross_debug_config.id_pretty_mode(server_mode)
-            launch_config["postDebugTask"] = kill_task_label
+        if is_attach:
+            # The extended-remote server outlives the debug session
+            launch_config["postDebugTask"] = self._stop_task_label(
+                cross_debug_config, server_mode)
 
         return launch_config
 
@@ -574,8 +592,9 @@ class IdeVSCode(IdeBase):
             if cross_debug_config.modified_recipe is not modified_recipe:
                 continue
             for server_mode in cross_debug_config.server_modes():
-                if server_mode == DebuggerServerModes.MULTI:
-                    # MULTI mode: the SSH command blocks until the port is ready
+                if server_mode in (DebuggerServerModes.MULTI,
+                                   DebuggerServerModes.ATTACH):
+                    # The SSH command blocks until the port is ready
                     # (wait loop in _target_start_cmd), so VSCode treats this as
                     # a regular non-background task.
                     new_task = {
@@ -586,7 +605,7 @@ class IdeVSCode(IdeBase):
                         "problemMatcher": []
                     }
                 else:
-                    # ONCE / ATTACH: gdbserver runs in the foreground for the
+                    # ONCE: gdbserver runs in the foreground for the
                     # whole session, so VSCode needs isBackground + a pattern
                     # matcher to avoid waiting for the task to exit.
                     new_task = {
@@ -608,7 +627,7 @@ class IdeVSCode(IdeBase):
                                 "background": {
                                     "activeOnStart": True,
                                     "beginsPattern": ".",
-                                    "endsPattern": ".",
+                                    "endsPattern": cross_debug_config.get_debug_server_ready_pattern(server_mode),
                                 }
                             }
                         ]
@@ -621,28 +640,20 @@ class IdeVSCode(IdeBase):
 
                 tasks_dict['tasks'].append(new_task)
 
-                # For attach mode, add a kill task to stop a previously running gdbserver
-                # This is a known issue with gdbserver --attach that it does not terminate
-                # after detaching. With this helper task, it is possible to:
-                # 1. Start debugging in attach mode
-                # 2. Add breakpoints, step, continue, etc.
-                # 3. Press the Continue button
-                # 4. Press the Stop button which detaches gdbserver from the debugged process
-                # 5. Start debugging again in attach mode
-                # Without this kill task, step 5 would fail because gdbserver is still running
+                # The extended-remote server used by attach mode keeps running
+                # after the debug session, launch.json refers to this task as
+                # postDebugTask.
                 if server_mode == DebuggerServerModes.ATTACH:
-                    new_task_kill_label = "kill_gdbserver_"+ cross_debug_config.id_pretty_mode(server_mode)
-                    new_task_kill = {
-                        "label": new_task_kill_label,
+                    tasks_dict['tasks'].append({
+                        "label": self._stop_task_label(cross_debug_config, server_mode),
                         "type": "shell",
                         "command": cross_debug_config.debugger_cross.target_device.ssh_sshexec,
-                        "args": cross_debug_config.target_ssh_gdbserver_kill_args(),
+                        "args": cross_debug_config.target_ssh_gdbserver_stop_args(server_mode),
                         "presentation": {
                             "close": True
                         },
                         "problemMatcher": []
-                    }
-                    tasks_dict['tasks'].append(new_task_kill)
+                    })
 
         tasks_file = 'tasks.json'
         IdeBase.update_json_file(
@@ -804,8 +815,9 @@ class IdeVSCode(IdeBase):
                 if cross_debug_config.modified_recipe is not modified_recipe:
                     continue
                 for server_mode in cross_debug_config.server_modes():
-                    if server_mode == DebuggerServerModes.MULTI:
-                        # MULTI mode: SSH command blocks until port is ready, treat as
+                    if server_mode in (DebuggerServerModes.MULTI,
+                                       DebuggerServerModes.ATTACH):
+                        # SSH command blocks until port is ready, treat as
                         # a regular non-background task (same as vscode_tasks_cpp).
                         new_task = {
                             "label": cross_debug_config.id_pretty_mode(server_mode),
@@ -815,7 +827,7 @@ class IdeVSCode(IdeBase):
                             "problemMatcher": []
                         }
                     else:
-                        # ONCE / ATTACH: server runs for the whole session, needs
+                        # ONCE: server runs for the whole session, needs
                         # isBackground so VSCode does not wait for the task to exit.
                         new_task = {
                             "label": cross_debug_config.id_pretty_mode(server_mode),
diff --git a/scripts/lib/devtool/ide_plugins/ide_none.py b/scripts/lib/devtool/ide_plugins/ide_none.py
index a8ddc3f39f..959140cedb 100644
--- a/scripts/lib/devtool/ide_plugins/ide_none.py
+++ b/scripts/lib/devtool/ide_plugins/ide_none.py
@@ -21,16 +21,19 @@ class GdbCrossConfigNone(GdbCrossConfig):
                          default_mode)
 
     def _target_gdbserver_stop_cmd(self, server_mode):
-        """Kill a gdbserver process"""
-        # This is the usual behavior: gdbserver is stopped on demand
-        if server_mode == DebuggerServerModes.MULTI:
-            gdbserver_cmd_stop = "test -f %s && kill \\$(cat %s);" % (
-                self._gdbserver_pid_file(server_mode), self._gdbserver_pid_file(server_mode))
-            gdbserver_cmd_stop += " rm -rf %s" % self._gdbserver_tmp_dir(server_mode)
-        # This is unexpected since gdbserver should terminate after each debug session
-        # Just kill all gdbserver instances to keep it simple
-        else:
-            gdbserver_cmd_stop = "killall gdbserver"
+        """Kill a gdbserver process
+
+        Stopping is based on the PID file written by the start command. Other
+        debug sessions run their own gdbserver on the target, so anything
+        matching by process name would hit them as well.
+        """
+        pid_file = self._gdbserver_pid_file(server_mode)
+        gdbserver_cmd_stop = "if test -f %s; then _gdbserver_pid=\\$(cat %s); " % (
+            pid_file, pid_file)
+        gdbserver_cmd_stop += "kill \\$_gdbserver_pid 2>/dev/null; "
+        gdbserver_cmd_stop += self._target_wait_for_process_exit_cmd(
+            "gdbserver_pid")
+        gdbserver_cmd_stop += " fi; rm -rf %s" % self._gdbserver_tmp_dir(server_mode)
         return "\"/bin/sh -c '" + gdbserver_cmd_stop + "'\""
 
     def _gen_gdbserver_start_script(self, server_mode=None):
@@ -165,14 +168,19 @@ class LldbServerConfigNone(LldbServerConfig):
         return os.path.join(self.script_dir, 'lldb_' + self.id_pretty)
 
     def _target_lldb_server_stop_cmd(self, server_mode):
-        """SSH command to stop lldb-server on the target."""
-        if server_mode == DebuggerServerModes.MULTI:
-            pid_file = self._lldb_server_pid_file(server_mode)
-            tmp_dir = self._lldb_server_tmp_dir(server_mode)
-            cmd = ("test -f %(pf)s && kill \\$(cat %(pf)s) 2>/dev/null; rm -rf %(td)s"
-                   % {'pf': pid_file, 'td': tmp_dir})
-        else:
-            cmd = "killall lldb-server 2>/dev/null || true"
+        """SSH command to stop lldb-server on the target.
+
+        Stopping is based on the PID file written by the start command. Other
+        debug sessions run their own lldb-server on the target, so anything
+        matching by process name would hit them as well.
+        """
+        pid_file = self._lldb_server_pid_file(server_mode)
+        tmp_dir = self._lldb_server_tmp_dir(server_mode)
+        cmd = "if test -f %s; then _lldb_server_pid=\\$(cat %s); " % (
+            pid_file, pid_file)
+        cmd += "kill \\$_lldb_server_pid 2>/dev/null; "
+        cmd += self._target_wait_for_process_exit_cmd("lldb_server_pid")
+        cmd += " fi; rm -rf %s" % tmp_dir
         return "\"/bin/sh -c '" + cmd + "'\""
 
     def _gen_lldb_server_start_script(self, server_mode=None):
-- 
2.55.0


