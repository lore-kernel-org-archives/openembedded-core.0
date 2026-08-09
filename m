Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DB6C5AD6A
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 09:36:49 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6424.1786268196863467459
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 02:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=dnH1utVM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-2026080909363308ec9d11800002073c-4pwry3@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026080909363308ec9d11800002073c
        for <openembedded-core@lists.openembedded.org>;
        Sun, 09 Aug 2026 11:36:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/KVFK8zdGoAkNiEcJTSxsKXK8/JXaOhLToBQaEk3T+U=;
 b=dnH1utVMkPtOiFMSWfMum7qyMu4eWKsa7VxfXFB8U5Z3aoePA26tZkDjqKiz0YsEPb17ZF
 bU2lzxvVlidxrAj++T7ddiQsxkGihScmMx6fL9B1QQcbpUyQu860WcP19xXenT+N8HYJx6pk
 OgwJUAYGD9+aPrA1FXcERh6X1mu/TeG2xno+HgkVuy+yClUVgeVUJ6Z2+bfuyQ1sv832jeW+
 oITxzw7lAtqQbL+OtD2e9NZIuy6Tm7hm7DIKNAdHXOmlypBy47CWDJBMUM5UvICEtgcpfnzn
 vIOeGrhsKrFqy9xmZZZPd0XQfiCtcecbRkxeT//EyGkL303JQorQU9Kw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 1/8] devtool: ide-sdk: wait for lldb-server readiness
Date: Sun,  9 Aug 2026 11:35:52 +0200
Message-ID: <20260809093629.3457107-2-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243070

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Start lldb-server in the target background, record its PID, and wait for
the listener before the generated MULTI pre-launch task returns. This
ensures a client can connect only after lldb-server is accepting
connections and preserves timeout cleanup.

Move reusable TCP listener checks and bounded wait generation into
DebuggerCrossConfig to make it reusable for GDB as well.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py | 26 ++++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index d50ba7bc65..deb6050907 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -97,6 +97,20 @@ class DebuggerCrossConfig:
             modes.append(DebuggerServerModes.ATTACH)
         return modes
 
+    def _target_tcp_port_check_cmd(self):
+        hex_port = "%04X" % self.debug_server_port
+        return "grep -q :%s /proc/net/tcp /proc/net/tcp6 2>/dev/null" % hex_port
+
+    def _target_wait_for_tcp_port_cmd(self, pid_var=None):
+        cleanup = ""
+        if pid_var:
+            cleanup = "kill \\$_%s 2>/dev/null; " % pid_var
+        return (
+            "_w=0; while ! %s; do _w=\\$((_w+1)); [ \\$_w -lt 100 ] || { "
+            "%secho %s did not start on port %s >&2; exit 1; }; sleep 0.1; done;"
+            % (self._target_tcp_port_check_cmd(), cleanup, self.DEBUG_SERVER_NAME,
+               self.debug_server_port))
+
     def initialize(self):
         """Called after construction to generate any required config files."""
         pass
@@ -197,6 +211,7 @@ class LldbServerConfig(DebuggerCrossConfig):
     The ATTACH mode is not supported because lldb-server platform does not take a
     PID argument; attaching is done client-side via 'process attach'.
     """
+    DEBUG_SERVER_NAME = "lldb-server"
 
     def __init__(self, image_recipe, modified_recipe, binary,
                  default_mode=DebuggerServerModes.MULTI):
@@ -224,18 +239,17 @@ class LldbServerConfig(DebuggerCrossConfig):
             cmd = "cd /tmp && %s platform --one-shot --server --listen *:%s" % (
                 lldb_server, self.debug_server_port)
         elif mode == DebuggerServerModes.MULTI:
-            hex_port = "%04X" % self.debug_server_port
             pid_file = self._lldb_server_pid_file(mode)
             tmp_dir = self._lldb_server_tmp_dir(mode)
             log_file = self._lldb_server_log_file(mode)
-            cmd = "grep -q :%s /proc/net/tcp /proc/net/tcp6 2>/dev/null && exit 0; " % hex_port
+            cmd = self._target_tcp_port_check_cmd() + " && exit 0; "
             cmd += "mkdir -p %s; " % tmp_dir
             cmd += "cd %s; " % tmp_dir
-            cmd += "%s platform --server --listen *:%s > %s 2>&1 & " % (
+            cmd += "%s platform --server --listen *:%s > %s 2>&1 & _lldb_server_pid=\\$!; " % (
                 lldb_server, self.debug_server_port, log_file)
-            cmd += "echo \\$! > %s; " % pid_file
-            cmd += "_w=0; while ! grep -q :%s /proc/net/tcp /proc/net/tcp6 2>/dev/null; " % hex_port
-            cmd += "do _w=\\$((_w+1)); [ \\$_w -lt 100 ] || { echo lldb-server did not start on port %s >&2; exit 1; }; sleep 0.1; done;" % self.debug_server_port
+            cmd += "echo \\$_lldb_server_pid > %s; " % pid_file
+            cmd += self._target_wait_for_tcp_port_cmd(
+                "lldb_server_pid")
         else:
             raise DevtoolError(
                 "lldb-server does not support mode %s "
-- 
2.55.0


