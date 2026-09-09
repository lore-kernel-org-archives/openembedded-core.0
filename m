Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A541C79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:53:51 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.97.1788990825719636477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=bSbspDtv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-2026090921534333679adddb00020771-amydjm@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026090921534333679adddb00020771
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Sep 2026 23:53:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=mSN9J9d3II87Tssj/0I0soOiAt74SryyoPtZ1oQ0X4w=;
 b=bSbspDtv5x37MFe4eF0OIfoLGgg5Ni6wUQMi45qWyR5tDe1UZ8rY7aF615W45e2dam6BZz
 P0BT4M66FabyekErsSL17sUfF7d06AxscIu8Gs5/7dFElHO2T34WpV33bQ4o11uhgDbOIWcn
 pHHHh8h6ZyfEkzWnqm3su3CAerEi4t59GW2npBa39XF1UOZsNUVouKzGR7WbFRCqJ7nDh48R
 nOoWPXSEpNnnWrxkeIOYkKnTOMzzyzsGNeV99cdFmKUhEQ0QxW2IJrQzC4gdZEWYcauHCPfi
 FGC1wpIuQSDCO4tc3b6TahhfzWsR7nsxsPmQR83HJxjgVmCSj36u8fkA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 13/15] devtool: ide-sdk: support LLDB ATTACH mode
Date: Wed,  9 Sep 2026 23:53:13 +0200
Message-ID: <20260909215337.89106-14-adrian.freihofer@siemens.com>
In-Reply-To: <20260909215337.89106-1-adrian.freihofer@siemens.com>
References: <20260909215337.89106-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 21:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245516

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Bring support for LLDB ATTACH mode to the IDE SDK as it is already
supported for GDB.

lldb-server platform mode has no launch/attach distinction on the
target: it just offers a platform connection, and the CodeLLDB client
decides client-side whether to launch or attach. ATTACH was previously
rejected outright because gdbserver's PID-based attach model doesn't
apply, but lldb-server can serve both modes identically.

Give each server_modes() entry (MULTI and ATTACH, for service binaries)
its own gdbserver_ports entry instead of the single gdbserver_port, so
both get their own slirp-forwarded port. _vscode_launch_bin_dbg_lldb()
now emits "request": "attach" with a postDebugTask to stop the
lldb-server instance afterwards, and drops the launch-only
stopOnEntry/cwd keys, which are invalid in the attach schema.
ide_none.py's lldbinit generation and LldbServerConfigNone.initialize()
are updated the same way to also generate the ATTACH-mode start script
for service binaries.

Also update the tests accordingly to verify the new ATTACH mode
configurations.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py     | 19 +++++--
 scripts/lib/devtool/ide_plugins/__init__.py | 60 ++++++++++-----------
 scripts/lib/devtool/ide_plugins/ide_code.py | 23 +++++---
 scripts/lib/devtool/ide_plugins/ide_none.py | 15 +++---
 4 files changed, 66 insertions(+), 51 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 1cc9843a72..ec257f9859 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -4640,10 +4640,21 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
                              f"Configuration '{config_name}' should not have MIMode (CodeLLDB)")
             self.assertNotIn("miDebuggerPath", config,
                              f"Configuration '{config_name}' should not have miDebuggerPath")
-            self.assertEqual(config["request"], "launch",
-                             f"Configuration '{config_name}' should be launch type")
-            self.assertEqual(config["cwd"], "/tmp",
-                             f"Configuration '{config_name}' cwd should be /tmp (writable on target)")
+
+            is_attach = "_attach" in config_name
+            if is_attach:
+                self.assertEqual(config["request"], "attach",
+                                 f"Configuration '{config_name}' should be attach type")
+                self.assertNotIn("cwd", config,
+                                 f"Configuration '{config_name}' should not set cwd in attach mode")
+                self.assertIn("postDebugTask", config,
+                              f"attach configuration '{config_name}' should have postDebugTask "
+                              "to stop the lldb-server platform instance afterwards")
+            else:
+                self.assertEqual(config["request"], "launch",
+                                 f"Configuration '{config_name}' should be launch type")
+                self.assertEqual(config["cwd"], "/tmp",
+                                 f"Configuration '{config_name}' cwd should be /tmp (writable on target)")
 
             # Verify initCommands contain the platform connect sequence
             init_commands = config.get("initCommands", [])
diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index bb9f100652..bc0b2ca9b7 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -267,9 +267,6 @@ class LldbServerConfig(DebuggerCrossConfig):
     Unlike gdbserver, lldb-server platform mode is architecture-agnostic on the host
     side: a single lldb-native binary handles all target architectures via the
     LLDB platform protocol that CodeLLDB speaks natively.
-
-    The ATTACH mode is not supported because lldb-server platform does not take a
-    PID argument; attaching is done client-side via 'process attach'.
     """
     DEBUG_SERVER_NAME = "lldb-server"
     TARGET_START_RETRIES = 600
@@ -281,10 +278,12 @@ class LldbServerConfig(DebuggerCrossConfig):
         # lldb-server platform spawns a separate gdb-remote-protocol
         # "gdbserver" instance per debug session; without --gdbserver-port it
         # picks a random port, which cannot be forwarded through slirp NAT.
-        # Pin it to a fixed, dedicated port that gets slirp-forwarded too.
-        self.gdbserver_port = DebuggerCrossConfig._port_next
-        DebuggerCrossConfig._port_next += 1
-        self.extra_ports.append(self.gdbserver_port)
+        # Pin a fixed, dedicated port per mode, each gets slirp-forwarded too.
+        self.gdbserver_ports = {}
+        for mode in self.server_modes():
+            self.gdbserver_ports[mode] = DebuggerCrossConfig._port_next
+            DebuggerCrossConfig._port_next += 1
+            self.extra_ports.append(self.gdbserver_ports[mode])
 
     def _lldb_server_tmp_dir(self, mode):
         return os.path.join('/tmp', 'lldb_server_%s' % self.id_pretty_mode(mode))
@@ -296,35 +295,38 @@ class LldbServerConfig(DebuggerCrossConfig):
         return os.path.join(self._lldb_server_tmp_dir(mode), 'lldb_server.log')
 
     def _target_start_cmd(self, mode):
-        """SSH command to start lldb-server in platform mode on the target."""
+        """SSH command to start lldb-server in platform mode on the target.
+
+        Used identically for MULTI and ATTACH: in both cases lldb-server just
+        offers a platform connection, it does not care whether the client that
+        connects to it goes on to launch a new process or attach to an
+        existing one.
+        """
+        if mode not in (DebuggerServerModes.MULTI, DebuggerServerModes.ATTACH):
+            raise DevtoolError("Unsupported lldb-server mode: %s" % mode)
         lldb_server = self.debugger_cross.debug_server_path
         # Use '*:<port>' so lldb-server binds on all interfaces (0.0.0.0), not
         # just loopback.  The bare ':<port>' form only binds to 127.0.0.1 in
         # lldb-server 21.x and the remote lldb client connects from the host.
         # Start from /tmp because lldb-server creates temp files in its cwd and
         # the SSH default cwd (/home/root) may not exist on a minimal image.
-        if mode == DebuggerServerModes.MULTI:
-            pid_file = self._lldb_server_pid_file(mode)
-            tmp_dir = self._lldb_server_tmp_dir(mode)
-            log_file = self._lldb_server_log_file(mode)
-            cmd = self._target_tcp_port_check_cmd() + " && exit 0; "
-            cmd += "mkdir -p %s; " % tmp_dir
-            cmd += "cd %s; " % tmp_dir
-            cmd += "%s platform --server --listen *:%s --gdbserver-port %s > %s 2>&1 & _lldb_server_pid=\\$!; " % (
-                lldb_server, self.debug_server_port, self.gdbserver_port, log_file)
-            cmd += "echo \\$_lldb_server_pid > %s; " % pid_file
-            cmd += self._target_wait_for_tcp_port_cmd(
-                "lldb_server_pid", log_file)
-        else:
-            raise DevtoolError(
-                "lldb-server only supports MULTI mode; "
-                "ATTACH is handled client-side with 'process attach': %s" % mode)
+        pid_file = self._lldb_server_pid_file(mode)
+        tmp_dir = self._lldb_server_tmp_dir(mode)
+        log_file = self._lldb_server_log_file(mode)
+        cmd = self._target_tcp_port_check_cmd(mode) + " && exit 0; "
+        cmd += "mkdir -p %s; " % tmp_dir
+        cmd += "cd %s; " % tmp_dir
+        cmd += "%s platform --server --listen *:%s --gdbserver-port %s > %s 2>&1 & _lldb_server_pid=\\$!; " % (
+            lldb_server, self.port(mode), self.gdbserver_ports[mode], log_file)
+        cmd += "echo \\$_lldb_server_pid > %s; " % pid_file
+        cmd += self._target_wait_for_tcp_port_cmd(
+            "lldb_server_pid", log_file, mode)
         return "\"/bin/sh -c '" + cmd + "'\""
 
     def _target_stop_cmd(self, server_mode):
-        """SSH command to stop a MULTI-mode lldb-server on the target."""
-        pid_file = self._lldb_server_pid_file(DebuggerServerModes.MULTI)
-        tmp_dir = self._lldb_server_tmp_dir(DebuggerServerModes.MULTI)
+        """SSH command to stop the lldb-server platform instance for the given mode."""
+        pid_file = self._lldb_server_pid_file(server_mode)
+        tmp_dir = self._lldb_server_tmp_dir(server_mode)
         cmd = ("test -f %(pf)s && kill \\$(cat %(pf)s) 2>/dev/null; rm -rf %(td)s"
                % {'pf': pid_file, 'td': tmp_dir})
         return "\"/bin/sh -c '" + cmd + "'\""
@@ -335,10 +337,6 @@ class LldbServerConfig(DebuggerCrossConfig):
     def server_script(self, mode):
         return os.path.join(self.script_dir, self.server_script_file(mode))
 
-    def server_modes(self):
-        """ATTACH mode is not applicable for lldb-server platform."""
-        return [self.default_mode]
-
 class IdeBase:
     """Base class defining the interface for IDE plugins"""
 
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index f8036f15de..081dc08657 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -508,11 +508,12 @@ class IdeVSCode(IdeBase):
         return launch_config
 
     def _vscode_launch_bin_dbg_lldb(self, lldb_config, server_mode):
-        """Generate a CodeLLDB (type: lldb) launch configuration entry for launch.json.
+        """Generate a CodeLLDB (type: lldb) launch/attach configuration entry for launch.json.
 
         CodeLLDB connects to lldb-server via the LLDB platform protocol.  The
         initCommands select the remote platform and open the connection before
-        the process is launched, so CodeLLDB can inspect and control it.
+        the process is launched or attached to, so CodeLLDB can inspect and
+        control it.
 
         Using targetCreateCommands instead of "program" so we can pass both the
         local host binary (for debug symbols) and the remote target path (where
@@ -520,14 +521,16 @@ class IdeVSCode(IdeBase):
         "target create --remote-file".  This prevents LLDB from uploading the
         binary from its module cache to a temporary directory and ensures the
         process starts from its installed location where the dynamic linker can
-        find shared libraries via the standard search paths.
+        find shared libraries via the standard search paths. In ATTACH mode the
+        same lldb-server platform connection is used.
         """
         modified_recipe = lldb_config.modified_recipe
         debugger_cross = modified_recipe.debugger_cross
+        is_attach = server_mode == DebuggerServerModes.ATTACH
 
         init_commands = [
             "platform select remote-linux",
-            "platform connect connect://%s:%d" % (debugger_cross.host, lldb_config.debug_server_port),
+            "platform connect connect://%s:%d" % (debugger_cross.host, lldb_config.port(server_mode)),
             # Clear the default step-avoid-regexp so std:: and other library
             # namespaces are not silently skipped on step-in. (default is "std::" in LLDB 15+)
             "settings set target.process.thread.step-avoid-regexp \"\"",
@@ -592,15 +595,21 @@ class IdeVSCode(IdeBase):
         launch_config = {
             "name": lldb_config.id_pretty_mode(server_mode),
             "type": "lldb",
-            "request": "launch",
+            "request": "attach" if is_attach else "launch",
             # Use targetCreateCommands instead of "program" to control both
             # the local binary (for debug symbols) and the remote path.
             "targetCreateCommands": [target_create_cmd],
-            "stopOnEntry": False,
-            "cwd": "/tmp",
             "preLaunchTask": lldb_config.id_pretty_mode(server_mode),
             "initCommands": init_commands,
         }
+        if is_attach:
+            launch_config["postDebugTask"] = self._stop_task_label(
+                lldb_config, server_mode)
+        else:
+            # cwd configures the process the debugger launches, it is not
+            # part of the attach schema.
+            launch_config["stopOnEntry"] = False
+            launch_config["cwd"] = "/tmp"
         if source_map:
             launch_config["sourceMap"] = source_map
         if modified_recipe.b:
diff --git a/scripts/lib/devtool/ide_plugins/ide_none.py b/scripts/lib/devtool/ide_plugins/ide_none.py
index 559940fda2..eba576bfdb 100644
--- a/scripts/lib/devtool/ide_plugins/ide_none.py
+++ b/scripts/lib/devtool/ide_plugins/ide_none.py
@@ -205,20 +205,15 @@ class LldbServerConfigNone(LldbServerConfig):
         if server_mode is None:
             server_mode = self.default_mode
         lines = ['# This file is generated by devtool ide-sdk']
-        if server_mode == DebuggerServerModes.MULTI:
-            lines.append('# On the remote target:')
-            lines.append('#   lldb-server platform --server --listen *:%d --gdbserver-port %d' % (
-                self.debug_server_port, self.gdbserver_port))
-        else:
-            lines.append('# On the remote target:')
-            lines.append('#   lldb-server platform --one-shot --server --listen *:%d --gdbserver-port %d' % (
-                self.debug_server_port, self.gdbserver_port))
+        lines.append('# On the remote target:')
+        lines.append('#   lldb-server platform --server --listen *:%d --gdbserver-port %d' % (
+            self.port(server_mode), self.gdbserver_ports[server_mode]))
         lines.append('# On the build machine:')
         lines.append('#   cd ' + self.modified_recipe.real_srctree)
         lines.append('#   ' + self.debugger_cross.lldb + ' -s ' + self.lldbinit)
         lines.append('platform select remote-linux')
         lines.append('platform connect connect://%s:%d' % (
-            self.debugger_cross.host, self.debug_server_port))
+            self.debugger_cross.host, self.port(server_mode)))
         lines.append('settings set target.process.thread.step-avoid-regexp ""')
 
         if self.image_recipe.rootfs_dbg:
@@ -267,6 +262,8 @@ class LldbServerConfigNone(LldbServerConfig):
 
     def initialize(self):
         self._gen_lldb_server_start_script()
+        if self.binary.runs_as_service and self.default_mode != DebuggerServerModes.ATTACH:
+            self._gen_lldb_server_start_script(DebuggerServerModes.ATTACH)
         self._gen_lldbinit_config()
         self._gen_lldb_start_script()
 
-- 
2.55.0


