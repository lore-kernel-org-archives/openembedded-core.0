Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBB8C5B570
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 06:57:00 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48708.1786431410979871879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 23:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=PtiFnP+Q;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-202608110656473e935a31fd00020761-yslwph@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202608110656473e935a31fd00020761
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Aug 2026 08:56:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=I7c3NU26NEBx/MtPHsHv81f3sw5wKjXQuzH7Fjke7kA=;
 b=PtiFnP+QcXPmhtPJCUaGwERaEg9Gjh+26q8pQxdvYGQiwQbWxoad9cDw5HA4KNUu2OMLJ6
 fzrvLBuUXfgQS9BE9/6NB/grJIDwG+Gdd90nS7QGs8r51C5UObGMciEl9duDf5SefPQqUjbG
 z89SUgkKJEroOXRyQscveXm2T6c7pAYYP7A3POFNYl8uOsLAUZMijF4GMZQSzmow24BlKoRp
 +IqqOndLzUU70UJHZFtsqc3lLUJeQsDVdDvJy5Tohd7vfiCcqueIwY96GU9mt7Cv156HqOCC
 3vrQqGUORhUe7o55PNH6zbZeRpj8xT5uou1olZ0n5M11gKy7oOJbrK0w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] devtool: ide-sdk: report why the debug server did not start
Date: Tue, 11 Aug 2026 08:56:44 +0200
Message-ID: <20260811065645.51586-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 06:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243153

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The generated preLaunchTask SSH command waits for the debug server to listen
on its port by polling /proc/net/tcp(6), and gave up after 100 retries with a
0.1s sleep each, reporting only "<server> did not start on port <port>".

test_devtool_ide_sdk_code_cmake_clang hit this intermittently on the
autobuilder. The message does not say whether the server was still starting or
had already failed, so the cause could not be determined from the logs.

Dump the debug server log to stderr when giving up, so the reason ends up in
the SSH command output which both the IDE and oe-selftest already surface, and
include the number of retries reached.

Raise the retry count from 100 to 300. The loop sleeps 0.1s per retry, and the
wall-clock time is dominated by that sleep: it barely grows under CPU load (100
retries took 10.5s idle and 12.0s with the host CPUs oversubscribed 4x), so the
previous limit really was a ~10s budget for the debug server to come up.

The helper is used by the lldb-server path only, so the gdbserver commands are
unchanged.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index deb6050907..63e9682e73 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -97,19 +97,28 @@ class DebuggerCrossConfig:
             modes.append(DebuggerServerModes.ATTACH)
         return modes
 
+    # Re-tries in 0.1s Example: 300 * 0.1s, i.e. ~30s.
+    TARGET_START_RETRIES = 300
+
     def _target_tcp_port_check_cmd(self):
         hex_port = "%04X" % self.debug_server_port
         return "grep -q :%s /proc/net/tcp /proc/net/tcp6 2>/dev/null" % hex_port
 
-    def _target_wait_for_tcp_port_cmd(self, pid_var=None):
+    def _target_wait_for_tcp_port_cmd(self, pid_var=None, log_file=None):
+        """Shell fragment waiting until the debug server listens on its port.
+
+        The server log is dumped to stderr when giving up.
+        """
+        dump_log = "cat %s >&2; " % log_file if log_file else ""
         cleanup = ""
         if pid_var:
             cleanup = "kill \\$_%s 2>/dev/null; " % pid_var
         return (
-            "_w=0; while ! %s; do _w=\\$((_w+1)); [ \\$_w -lt 100 ] || { "
-            "%secho %s did not start on port %s >&2; exit 1; }; sleep 0.1; done;"
-            % (self._target_tcp_port_check_cmd(), cleanup, self.DEBUG_SERVER_NAME,
-               self.debug_server_port))
+            "_w=0; while ! %s; do _w=\\$((_w+1)); [ \\$_w -lt %d ] || { "
+            "%secho %s did not start on port %s after \\$_w retries >&2; %sexit 1; }; "
+            "sleep 0.1; done;"
+            % (self._target_tcp_port_check_cmd(), self.TARGET_START_RETRIES,
+               cleanup, self.DEBUG_SERVER_NAME, self.debug_server_port, dump_log))
 
     def initialize(self):
         """Called after construction to generate any required config files."""
@@ -249,7 +258,7 @@ class LldbServerConfig(DebuggerCrossConfig):
                 lldb_server, self.debug_server_port, log_file)
             cmd += "echo \\$_lldb_server_pid > %s; " % pid_file
             cmd += self._target_wait_for_tcp_port_cmd(
-                "lldb_server_pid")
+                "lldb_server_pid", log_file)
         else:
             raise DevtoolError(
                 "lldb-server does not support mode %s "
-- 
2.55.0


