Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A20C5AD7B
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 09:36:50 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6562.1786268196863272765
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 02:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=eBKroHBC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-2026080909363309e3f3462700020753-vrrs8t@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2026080909363309e3f3462700020753
        for <openembedded-core@lists.openembedded.org>;
        Sun, 09 Aug 2026 11:36:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=0QCLf/SR6s3v5jfzjMn+UKkes0XSYZ2/St+bM6A+8QM=;
 b=eBKroHBCBQj+zI3ZNC0QrLxCMmn10amNMc5UuWuqD99qrgCazAZfUCLfEunzT4eFBPWVN4
 IDi8uWlU9zmH3AW2d4meLYnWWLOMrIGh9qj8qdMiSL8GfvfTTEzetoD58ANk+al4V/tBq2Nc
 Rok56CdXV0SZE1Ny1BmjsFSocEqNFv8brsU1KFBEINleyzSbCe+dUtpO1Xx+01RhS+prVhJP
 l54GTJoVBQvPZhShUiJz38ehI2F0SEO7hYAvHWZumqHtsRDxtyDXCv4n7i7+eoUG4M9krIAg
 Pzu5xRD2k+Ixr/kJ8kkdLshbL6liXIpTOcKJj6RnwnEm79dFLQ+fRUcw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 3/8] devtool: ide-sdk: synchronize debugger server readiness
Date: Sun,  9 Aug 2026 11:35:54 +0200
Message-ID: <20260809093629.3457107-4-adrian.freihofer@siemens.com>
In-Reply-To: <20260809093629.3457107-1-adrian.freihofer@siemens.com>
References: <20260809093629.3457107-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 09:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243066

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Have GDB ONCE and ATTACH target commands wait for the listening socket,
report a generated readiness marker, and remain active for the debug
session. Make the VS Code background-task matcher wait for that marker
instead of accepting arbitrary output.

Centralize TCP readiness checks, timeout cleanup, server names, and
marker generation in DebuggerCrossConfig. Reuse the TCP wait for
persistent GDB and LLDB servers, and reject the unused LLDB one-shot
mode explicitly.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py     |  7 ++--
 scripts/lib/devtool/ide_plugins/__init__.py | 41 ++++++++++++++-------
 scripts/lib/devtool/ide_plugins/ide_code.py |  7 +++-
 3 files changed, 37 insertions(+), 18 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index d84a18e8b6..04a42b8906 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3508,10 +3508,11 @@ class DevtoolIdeSdkTests(DevtoolBase):
 
         # Start gdbserver on target using the task command (keep the ssh connection open while debugging)
         ssh_gdbserver_cmd = [task_command] + task_args
-        # Fix shell command escaping - remove extra quotes from the last argument
-        # The task_args likely contains a quoted shell command that needs to be unquoted
+        # The tasks.json argument is formatted for an intermediate shell. Strip
+        # its quotes and restore dollar expansions before passing it directly to
+        # SSH via subprocess.
         if len(ssh_gdbserver_cmd) > 0 and ssh_gdbserver_cmd[-1].startswith('"') and ssh_gdbserver_cmd[-1].endswith('"'):
-            ssh_gdbserver_cmd[-1] = ssh_gdbserver_cmd[-1][1:-1]  # Remove surrounding quotes
+            ssh_gdbserver_cmd[-1] = ssh_gdbserver_cmd[-1][1:-1].replace('\\$', '$')
         self.logger.debug(f"Starting gdbserver with command: {' '.join(ssh_gdbserver_cmd)}")
         with RunCmdBackground(ssh_gdbserver_cmd, output_log=self._cmd_logger):
             # Give gdbserver a moment to start
diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index deb6050907..6c88e0e34e 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -101,6 +101,12 @@ class DebuggerCrossConfig:
         hex_port = "%04X" % self.debug_server_port
         return "grep -q :%s /proc/net/tcp /proc/net/tcp6 2>/dev/null" % hex_port
 
+    def get_debug_server_ready_marker(self, port):
+        return "%s ready on port %s" % (self.DEBUG_SERVER_NAME, port)
+
+    def get_debug_server_ready_marker_pattern(self):
+        return "^%s$" % self.get_debug_server_ready_marker("[0-9]+")
+
     def _target_wait_for_tcp_port_cmd(self, pid_var=None):
         cleanup = ""
         if pid_var:
@@ -130,6 +136,7 @@ class GdbCrossConfig(DebuggerCrossConfig):
     gdbinit / gdb wrapper scripts used by ide=none as well as the
     target-side tmp/pid/log paths consumed by the gdbserver start command.
     """
+    DEBUG_SERVER_NAME = "gdbserver"
 
     def __init__(self, image_recipe, modified_recipe, binary,
                  default_mode=DebuggerServerModes.MULTI):
@@ -172,26 +179,35 @@ class GdbCrossConfig(DebuggerCrossConfig):
           "\"/bin/sh -c '/usr/bin/gdbserver --once :1234 /usr/bin/cmake-example'\""
         """
         if server_mode == DebuggerServerModes.ONCE:
-            gdbserver_cmd_start = "%s --once :%s %s" % (
+            gdbserver_cmd_start = "%s --once :%s %s & " % (
                 self.debugger_cross.debug_server_path, self.debug_server_port, self.binary.binary_path)
+            gdbserver_cmd_start += "_gdbserver_pid=\\$!; "
+            gdbserver_cmd_start += self._target_wait_for_tcp_port_cmd(
+                "gdbserver_pid") + " "
+            gdbserver_cmd_start += "echo %s; wait \\$_gdbserver_pid" % (
+                self.get_debug_server_ready_marker(self.debug_server_port))
         elif server_mode == DebuggerServerModes.ATTACH:
             pid_command = self.binary.pid_command
             if pid_command:
-                gdbserver_cmd_start = "%s --attach :%s \\$(%s)" % (
+                gdbserver_cmd_start = "%s --attach :%s \\$(%s) & " % (
                     self.debugger_cross.debug_server_path,
                     self.debug_server_port,
                     pid_command)
+                gdbserver_cmd_start += "_gdbserver_pid=\\$!; "
+                gdbserver_cmd_start += self._target_wait_for_tcp_port_cmd(
+                    "gdbserver_pid") + " "
+                gdbserver_cmd_start += "echo %s; wait \\$_gdbserver_pid" % (
+                    self.get_debug_server_ready_marker(self.debug_server_port))
             else:
                 raise DevtoolError("Cannot use gdbserver attach mode for binary %s. No PID found." % self.binary.binary_path)
         elif server_mode == DebuggerServerModes.MULTI:
-            hex_port = "%04X" % self.debug_server_port
-            gdbserver_cmd_start = "grep -q :%s /proc/net/tcp /proc/net/tcp6 2>/dev/null && exit 0; " % hex_port
+            gdbserver_cmd_start = self._target_tcp_port_check_cmd() + " && exit 0; "
             gdbserver_cmd_start += "mkdir -p %s; " % self._gdbserver_tmp_dir(server_mode)
-            gdbserver_cmd_start += "%s --multi :%s > %s 2>&1 & " % (
+            gdbserver_cmd_start += "%s --multi :%s > %s 2>&1 & _gdbserver_pid=\\$!; " % (
                 self.debugger_cross.debug_server_path, self.debug_server_port, self._gdbserver_log_file(server_mode))
-            gdbserver_cmd_start += "echo \\$! > %s; " % self._gdbserver_pid_file(server_mode)
-            gdbserver_cmd_start += "_w=0; while ! grep -q :%s /proc/net/tcp /proc/net/tcp6 2>/dev/null; " % hex_port
-            gdbserver_cmd_start += "do _w=\\$((_w+1)); [ \\$_w -lt 100 ] || exit 1; sleep 0.1; done;"
+            gdbserver_cmd_start += "echo \\$_gdbserver_pid > %s; " % self._gdbserver_pid_file(server_mode)
+            gdbserver_cmd_start += self._target_wait_for_tcp_port_cmd(
+                "gdbserver_pid")
         else:
             raise DevtoolError("Unsupported gdbserver mode: %s" % server_mode)
         return "\"/bin/sh -c '" + gdbserver_cmd_start + "'\""
@@ -235,10 +251,7 @@ class LldbServerConfig(DebuggerCrossConfig):
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
@@ -252,8 +265,8 @@ class LldbServerConfig(DebuggerCrossConfig):
                 "lldb_server_pid")
         else:
             raise DevtoolError(
-                "lldb-server does not support mode %s "
-                "(ATTACH is handled client-side with 'process attach')" % mode)
+                "lldb-server only supports MULTI mode; "
+                "ATTACH is handled client-side with 'process attach': %s" % mode)
         return "\"/bin/sh -c '" + cmd + "'\""
 
     def _target_kill_cmd(self):
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 9faba3f2d1..5b66c56e35 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -609,6 +609,11 @@ class IdeVSCode(IdeBase):
                     # ONCE / ATTACH: gdbserver runs in the foreground for the
                     # whole session, so VSCode needs isBackground + a pattern
                     # matcher to avoid waiting for the task to exit.
+                    if server_mode in (DebuggerServerModes.ONCE,
+                                       DebuggerServerModes.ATTACH):
+                        ends_pattern = cross_debug_config.get_debug_server_ready_marker_pattern()
+                    else:
+                        ends_pattern = "."
                     new_task = {
                         "label": cross_debug_config.id_pretty_mode(server_mode),
                         "type": "shell",
@@ -628,7 +633,7 @@ class IdeVSCode(IdeBase):
                                 "background": {
                                     "activeOnStart": True,
                                     "beginsPattern": ".",
-                                    "endsPattern": ".",
+                                    "endsPattern": ends_pattern,
                                 }
                             }
                         ]
-- 
2.55.0


