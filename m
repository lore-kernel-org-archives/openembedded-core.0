Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81774C56205
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:00:53 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14705.1785844843949806631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Yml0UZon;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20260804120039999d2d7168000207bc-watjvd@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260804120039999d2d7168000207bc
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 14:00:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ozaIefXT8Dn6uxpiDQ7Q7l2kyje+P0hOazpzXE1hiqs=;
 b=Yml0UZonWbZIedWWEerVad4+fF1emod91AitqQ86Z3ROtFA+1s86u0rKadc82MquLdeqc1
 b2xOD/9XzRTx5WQyHFUSeKClxQ7675Rkz7eYBozMT94ibayMSK7f6cY37FY4kh4QvNEMuOol
 r1JTMU5+pQambc+yO4jLPNetqNnZVRNe96QecpwU9QNDZSxpjfJLHRW1Zbs1Yj5JsdNr5Ak3
 XfaGpsH/Lnq03YejKhthAddPgYo6cwPLHUPnSAMZfzBSULlmrZebpuDwRmWP6jDaJ/EKdBYM
 232qXx94y1QdHYIzTIjZzeH/vjzGMsv9AByzQY6ca0I6+LsTmEEt3gug==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 09/14] devtool: ide-sdk: wait for gdbserver port before returning
Date: Tue,  4 Aug 2026 13:59:33 +0200
Message-ID: <20260804120034.378787-10-adrian.freihofer@siemens.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242723

From: Adrian Freihofer <adrian.freihofer@siemens.com>

In MULTI mode, gdbserver is started as a background process and the SSH
command returned immediately, leaving a race between the caller
connecting to gdbserver and gdbserver finishing its bind()/listen()
sequence.

The race condition was observed with lldb-server not with gdbserver, but
it is likely to affect both. It might be a fix for gdbserver as well,
but at least it is a preparatory step for adding LLDB support, which is
the next planned item.

There are two possible synchronisation points:
- The pid file: written by the shell immediately after fork(), before
  gdbserver has called bind() or listen() — not useful as a readiness
  signal.
- /proc/net/tcp: the port entry appears after remote_prepare() completes
  socket()+bind()+listen(), which is the earliest point at which
  gdbserver will accept a connection.

Replace the pid-file idempotency check with a /proc/net/tcp port check
so that:
- the SSH command doubles as a readiness probe (exits only when
  gdbserver is actually listening, or after a 10 s timeout with exit 1)
- re-running the start command while the server is already up is still
  a no-op

The VSCode task for MULTI mode is changed accordingly: since the SSH
command now exits as soon as the server is ready, VSCode no longer
needs isBackground + a pattern matcher — a plain task with an empty
problemMatcher suffices.

The pid file is still written so that the stop script can kill the
server by PID.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py |  7 ++-
 scripts/lib/devtool/ide_plugins/ide_code.py | 59 +++++++++++++--------
 2 files changed, 42 insertions(+), 24 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 4a1686a034..cfb067548d 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -170,11 +170,14 @@ class GdbCrossConfig(DebuggerCrossConfig):
             else:
                 raise DevtoolError("Cannot use gdbserver attach mode for binary %s. No PID found." % self.binary.binary_path)
         elif server_mode == DebuggerServerModes.MULTI:
-            gdbserver_cmd_start = "test -f %s && exit 0; " % self._gdbserver_pid_file(server_mode)
+            hex_port = "%04X" % self.debug_server_port
+            gdbserver_cmd_start = "grep -q :%s /proc/net/tcp /proc/net/tcp6 2>/dev/null && exit 0; " % hex_port
             gdbserver_cmd_start += "mkdir -p %s; " % self._gdbserver_tmp_dir(server_mode)
             gdbserver_cmd_start += "%s --multi :%s > %s 2>&1 & " % (
                 self.debugger_cross.debug_server_path, self.debug_server_port, self._gdbserver_log_file(server_mode))
-            gdbserver_cmd_start += "echo \\$! > %s;" % self._gdbserver_pid_file(server_mode)
+            gdbserver_cmd_start += "echo \\$! > %s; " % self._gdbserver_pid_file(server_mode)
+            gdbserver_cmd_start += "_w=0; while ! grep -q :%s /proc/net/tcp /proc/net/tcp6 2>/dev/null; " % hex_port
+            gdbserver_cmd_start += "do _w=\\$((_w+1)); [ \\$_w -lt 100 ] || exit 1; sleep 0.1; done;"
         else:
             raise DevtoolError("Unsupported gdbserver mode: %s" % server_mode)
         return "\"/bin/sh -c '" + gdbserver_cmd_start + "'\""
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index dfaba3cff6..d237ab8f66 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -456,30 +456,45 @@ class IdeVSCode(IdeBase):
             if cross_debug_config.modified_recipe is not modified_recipe:
                 continue
             for server_mode in cross_debug_config.server_modes():
-                new_task = {
-                    "label": cross_debug_config.id_pretty_mode(server_mode),
-                    "type": "shell",
-                    "isBackground": True,
-                    "command": cross_debug_config.debugger_cross.target_device.ssh_sshexec,
-                    "args": cross_debug_config.target_ssh_gdbserver_start_args(server_mode),
-                    "problemMatcher": [
-                        {
-                            "pattern": [
-                                {
-                                    "regexp": ".",
-                                    "file": 1,
-                                    "location": 2,
-                                    "message": 3
+                if server_mode == DebuggerServerModes.MULTI:
+                    # MULTI mode: the SSH command blocks until the port is ready
+                    # (wait loop in _target_start_cmd), so VSCode treats this as
+                    # a regular non-background task.
+                    new_task = {
+                        "label": cross_debug_config.id_pretty_mode(server_mode),
+                        "type": "shell",
+                        "command": cross_debug_config.debugger_cross.target_device.ssh_sshexec,
+                        "args": cross_debug_config.target_ssh_gdbserver_start_args(server_mode),
+                        "problemMatcher": []
+                    }
+                else:
+                    # ONCE / ATTACH: gdbserver runs in the foreground for the
+                    # whole session, so VSCode needs isBackground + a pattern
+                    # matcher to avoid waiting for the task to exit.
+                    new_task = {
+                        "label": cross_debug_config.id_pretty_mode(server_mode),
+                        "type": "shell",
+                        "isBackground": True,
+                        "command": cross_debug_config.debugger_cross.target_device.ssh_sshexec,
+                        "args": cross_debug_config.target_ssh_gdbserver_start_args(server_mode),
+                        "problemMatcher": [
+                            {
+                                "pattern": [
+                                    {
+                                        "regexp": ".",
+                                        "file": 1,
+                                        "location": 2,
+                                        "message": 3
+                                    }
+                                ],
+                                "background": {
+                                    "activeOnStart": True,
+                                    "beginsPattern": ".",
+                                    "endsPattern": ".",
                                 }
-                            ],
-                            "background": {
-                                "activeOnStart": True,
-                                "beginsPattern": ".",
-                                "endsPattern": ".",
                             }
-                        }
-                    ]
-                }
+                        ]
+                    }
                 # Deploy the artifacts to the target before starting gdbserver if not already running
                 if server_mode != DebuggerServerModes.ATTACH:
                     new_task['dependsOn'] = [
-- 
2.55.0


