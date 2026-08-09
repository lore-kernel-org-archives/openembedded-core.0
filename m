Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C214FC5AD4E
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 09:36:49 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6423.1786268196863316516
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 02:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=EoTo/osq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202608090936346da5eaf9f00002076f-n3ixht@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202608090936346da5eaf9f00002076f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 09 Aug 2026 11:36:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=he5Ky0q+sH573P14tRLma9ZoYdRWa7OslcGISsdPw80=;
 b=EoTo/osqok0l+cZ7AWHJt5pE/F20Xqa9uOqiYfNayeLO1oh9xrEt/+CLEcmqy4lrBg9/3j
 HkVMTgoQi79ZsIi42IN5z/e1nAWxc7Pk4AEV+DPHvWh+SdH5zFvw0hu6XeNqtmcrR4YW99uy
 9l12DzEZhE7g2x1awzdU8zNj9+r1diPXG/NFEoAPiWvPJGwWlrXuH3OHbK28VY39++vWrEqf
 DF7M636zdwdkIfSA4zQ7AL73W6WH0uJzBjnSvaLgkvBXofgpnD/0pzWmMwTMevNQzYksm1rK
 tlfowgJi8qL6NYlmgsHQjLad1HuSYxkwm72cY4nUCOPqQUjZW5o+NSHA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 5/8] devtool: ide-sdk: wait for debugger server shutdown
Date: Sun,  9 Aug 2026 11:35:56 +0200
Message-ID: <20260809093629.3457107-6-adrian.freihofer@siemens.com>
In-Reply-To: <20260809093629.3457107-1-adrian.freihofer@siemens.com>
References: <20260809093629.3457107-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 09:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243071

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Have the ide=none GDB and LLDB stop scripts wait for their recorded
server PID to exit before removing their state. This makes a successful
stop command a reliable target-side lifecycle boundary and reports a
timeout when the server cannot be stopped.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py |  7 +++++++
 scripts/lib/devtool/ide_plugins/ide_none.py | 17 ++++++++++++-----
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 6c88e0e34e..1c4288a8b5 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -117,6 +117,13 @@ class DebuggerCrossConfig:
             % (self._target_tcp_port_check_cmd(), cleanup, self.DEBUG_SERVER_NAME,
                self.debug_server_port))
 
+    def _target_wait_for_process_exit_cmd(self, pid_var):
+        return (
+            "_w=0; while kill -0 \\$_%s 2>/dev/null; do _w=\\$((_w+1)); "
+            "[ \\$_w -lt 100 ] || { echo %s did not stop >&2; exit 1; }; "
+            "sleep 0.1; done;"
+            % (pid_var, self.DEBUG_SERVER_NAME))
+
     def initialize(self):
         """Called after construction to generate any required config files."""
         pass
diff --git a/scripts/lib/devtool/ide_plugins/ide_none.py b/scripts/lib/devtool/ide_plugins/ide_none.py
index a8ddc3f39f..8e01c2fc41 100644
--- a/scripts/lib/devtool/ide_plugins/ide_none.py
+++ b/scripts/lib/devtool/ide_plugins/ide_none.py
@@ -24,9 +24,13 @@ class GdbCrossConfigNone(GdbCrossConfig):
         """Kill a gdbserver process"""
         # This is the usual behavior: gdbserver is stopped on demand
         if server_mode == DebuggerServerModes.MULTI:
-            gdbserver_cmd_stop = "test -f %s && kill \\$(cat %s);" % (
-                self._gdbserver_pid_file(server_mode), self._gdbserver_pid_file(server_mode))
-            gdbserver_cmd_stop += " rm -rf %s" % self._gdbserver_tmp_dir(server_mode)
+            pid_file = self._gdbserver_pid_file(server_mode)
+            gdbserver_cmd_stop = "if test -f %s; then _gdbserver_pid=\\$(cat %s); " % (
+                pid_file, pid_file)
+            gdbserver_cmd_stop += "kill \\$_gdbserver_pid 2>/dev/null; "
+            gdbserver_cmd_stop += self._target_wait_for_process_exit_cmd(
+                "gdbserver_pid")
+            gdbserver_cmd_stop += " fi; rm -rf %s" % self._gdbserver_tmp_dir(server_mode)
         # This is unexpected since gdbserver should terminate after each debug session
         # Just kill all gdbserver instances to keep it simple
         else:
@@ -169,8 +173,11 @@ class LldbServerConfigNone(LldbServerConfig):
         if server_mode == DebuggerServerModes.MULTI:
             pid_file = self._lldb_server_pid_file(server_mode)
             tmp_dir = self._lldb_server_tmp_dir(server_mode)
-            cmd = ("test -f %(pf)s && kill \\$(cat %(pf)s) 2>/dev/null; rm -rf %(td)s"
-                   % {'pf': pid_file, 'td': tmp_dir})
+            cmd = "if test -f %s; then _lldb_server_pid=\\$(cat %s); " % (
+                pid_file, pid_file)
+            cmd += "kill \\$_lldb_server_pid 2>/dev/null; "
+            cmd += self._target_wait_for_process_exit_cmd("lldb_server_pid")
+            cmd += " fi; rm -rf %s" % tmp_dir
         else:
             cmd = "killall lldb-server 2>/dev/null || true"
         return "\"/bin/sh -c '" + cmd + "'\""
-- 
2.55.0


