Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679BBC5DF94
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 22:01:54 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1128.1787176907030634526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 15:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=cfFr0tRp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-202608192201442bd4f68318000207b0-2qig7l@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202608192201442bd4f68318000207b0
        for <openembedded-core@lists.openembedded.org>;
        Thu, 20 Aug 2026 00:01:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=UB7eVCqupIConBytoa/cucXR0nlNYoUrSRPxeIrccyk=;
 b=cfFr0tRpERcePlLcChFEYuVx4RrG5baDquj/6KyfzXLc9kpYqfGwyk41oZz4ahONjdT7bw
 V+qZfop+k4kNp+SD/EB/hxAGpJ0Vwm1YfErjotUX+7qt8JDBYs0/0VwuLCtoJKCmHbX3voBa
 OOzELC0aYngPJ7jSGrC8xG3fXLcABFhOkPdYkjE+9YEpcLaCezk9hmh1NDmWxwLo0jhMG6DT
 Lwy737ri0g8vwXMGl/wn04odo1/Q39dWnr3F00321aZtGxa8s2WDqb6E/YgbZ+p7t3VpKboW
 UU42Z1E6jg+9z3Jte+qv6dcMr1n3g0+5zOsuQo9M+Bm2QcceGqcnA81w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 07/14] devtool: ide-sdk: let gdbserver reuse the shared debug server wait helper
Date: Thu, 20 Aug 2026 00:00:14 +0200
Message-ID: <20260819220138.4095398-8-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243784

From: Adrian Freihofer <adrian.freihofer@siemens.com>

GdbCrossConfig open coded its own copy of the loop which waits for the
debug server to listen on its port, while LldbServerConfig already used
the _target_wait_for_tcp_port_cmd() helper of the common base class.

Use the helper for gdbserver too, which requires capturing the gdbserver
pid in a shell variable so the helper can refer to it, and defining
DEBUG_SERVER_NAME for GdbCrossConfig.

Beside removing the duplication this also gives gdbserver the two things
the helper already did for lldb-server: the server is killed instead of
left behind when it never starts listening, and the reason is printed
rather than exiting silently.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 63e9682e73..5211df5806 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -139,6 +139,7 @@ class GdbCrossConfig(DebuggerCrossConfig):
     gdbinit / gdb wrapper scripts used by ide=none as well as the
     target-side tmp/pid/log paths consumed by the gdbserver start command.
     """
+    DEBUG_SERVER_NAME = "gdbserver"
 
     def __init__(self, image_recipe, modified_recipe, binary,
                  default_mode=DebuggerServerModes.MULTI):
@@ -193,14 +194,13 @@ class GdbCrossConfig(DebuggerCrossConfig):
             else:
                 raise DevtoolError("Cannot use gdbserver attach mode for binary %s. No PID found." % self.binary.binary_path)
         elif server_mode == DebuggerServerModes.MULTI:
-            hex_port = "%04X" % self.debug_server_port
-            gdbserver_cmd_start = "grep -q :%s /proc/net/tcp /proc/net/tcp6 2>/dev/null && exit 0; " % hex_port
+            gdbserver_cmd_start = self._target_tcp_port_check_cmd() + " && exit 0; "
             gdbserver_cmd_start += "mkdir -p %s; " % self._gdbserver_tmp_dir(server_mode)
-            gdbserver_cmd_start += "%s --multi :%s > %s 2>&1 & " % (
-                self.debugger_cross.debug_server_path, self.debug_server_port, self._gdbserver_log_file(server_mode))
-            gdbserver_cmd_start += "echo \\$! > %s; " % self._gdbserver_pid_file(server_mode)
-            gdbserver_cmd_start += "_w=0; while ! grep -q :%s /proc/net/tcp /proc/net/tcp6 2>/dev/null; " % hex_port
-            gdbserver_cmd_start += "do _w=\\$((_w+1)); [ \\$_w -lt 100 ] || exit 1; sleep 0.1; done;"
+            gdbserver_cmd_start += "%s --multi :%s > %s 2>&1 & _gdbserver_pid=\\$!; " % (
+                self.debugger_cross.debug_server_path, self.debug_server_port,
+                self._gdbserver_log_file(server_mode))
+            gdbserver_cmd_start += "echo \\$_gdbserver_pid > %s; " % self._gdbserver_pid_file(server_mode)
+            gdbserver_cmd_start += self._target_wait_for_tcp_port_cmd("gdbserver_pid")
         else:
             raise DevtoolError("Unsupported gdbserver mode: %s" % server_mode)
         return "\"/bin/sh -c '" + gdbserver_cmd_start + "'\""
-- 
2.55.0


