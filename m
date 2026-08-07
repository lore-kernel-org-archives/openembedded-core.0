Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92DECC5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 09:37:41 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39042.1786095457986964513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 02:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Pn3JBSBb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202608070937347d8ab833a0000207cf-9ou_ec@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202608070937347d8ab833a0000207cf
        for <openembedded-core@lists.openembedded.org>;
        Fri, 07 Aug 2026 11:37:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=WL2MdTziRhCcp4qLSGjD+OxUvIj3UDvVtvU1aXNBztg=;
 b=Pn3JBSBbXoJiuo1f637zvuxK3unf3xQxSnK1lCXk/AQZOC088BsZWVrT6tYuVt3W8jfouK
 EM1aTJrJZeJqccJZlDBZRUQ/GOKTuanYJ8e0U32Z1nAcPxjko2ksJjmNoQkaskc5OSQc0ApG
 BPRSCyEqoOHsXSeN30+HP3be/hjbt38N4Nm8OPcGfsHF66AkIEOm/9aTVY26IcV2Aotv3IxD
 0+aAmGi0NOIH56W2q+yzbBWkAqDv/yS2LFSdodcsou54l60uRavvTFiQMfteaHbZySXoOJMj
 9JAUUNOca3shK4nFXY8G66qjJc98iEDBjWzubyB1GN4lQziqum2+/CXw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] oe-selftest: devtool ide-sdk: fix lldb connect race in _lldb_server_debugging_once
Date: Fri,  7 Aug 2026 11:37:24 +0200
Message-ID: <20260807093724.1449937-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 09:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242995

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Replace the fixed time.sleep(1) + "ps" check with a socket-based polling
loop that probes the lldb-server TCP port directly. The old approach would
declare lldb-server "ready" as soon as the process appeared in ps, but the
listening socket may not yet be bound at that point. On a loaded autobuilder
with several concurrent QEMU instances the resulting race caused sporadic
"Failed to connect" failures in test_devtool_ide_sdk_code_meson_clang (and
the other lldb-based variants).

The new loop attempts socket.create_connection() every 0.5 s for up to 30 s.
A successful TCP handshake guarantees the port is open before lldb --batch
is invoked, eliminating the race.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 44 +++++++++++++++++++++----
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 7145755fed..ac176d6f26 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -8,6 +8,7 @@ import errno
 import os
 import re
 import shutil
+import socket
 import tempfile
 import time
 import glob
@@ -4218,14 +4219,43 @@ class DevtoolIdeSdkTests(DevtoolBase):
         lldb_binary = os.path.join(lldb_native_sysroot, 'usr', 'bin', 'lldb')
         self.assertExists(lldb_binary, "lldb binary should exist in lldb-native sysroot")
 
-        with RunCmdBackground(ssh_cmd, output_log=self._cmd_logger):
-            time.sleep(1)
+        # Parse host and port from the "platform connect connect://host:port" command
+        connect_match = re.search(r'connect://([^:]+):(\d+)', connect_cmd)
+        self.assertIsNotNone(connect_match, "Could not parse host:port from: %s" % connect_cmd)
+        lldb_server_host = connect_match.group(1)
+        lldb_server_port = int(connect_match.group(2))
 
-            # Verify lldb-server is running on the target
-            r = runCmd('ssh %s root@%s ps' % (sshargs, qemu.ip),
-                       output_log=self._cmd_logger)
-            self.assertIn("lldb-server", r.output,
-                          "lldb-server should be running on target")
+        self.logger.debug("Starting lldb-server via SSH: %s", " ".join(ssh_cmd))
+        with RunCmdBackground(ssh_cmd, output_log=self._cmd_logger):
+            # Poll the lldb-server port instead of sleeping a fixed amount.
+            # On a loaded autobuilder the process may take several seconds to
+            # bind its listening socket even after appearing in "ps".
+            t_start = time.monotonic()
+            deadline = t_start + 30
+            while True:
+                try:
+                    with socket.create_connection((lldb_server_host, lldb_server_port), timeout=1):
+                        break
+                except OSError as e:
+                    elapsed = time.monotonic() - t_start
+                    if time.monotonic() >= deadline:
+                        diag = ""
+                        try:
+                            r_ps = runCmd(
+                                'ssh %s root@%s "ps && echo --- && cat /proc/net/tcp /proc/net/tcp6 2>/dev/null"'
+                                % (sshargs, lldb_server_host))
+                            diag = "\nTarget diagnostics:\n" + r_ps.output
+                        except Exception:
+                            pass
+                        self.fail(
+                            "lldb-server did not start listening on %s:%d within 30s "
+                            "(last error: %s)%s" % (lldb_server_host, lldb_server_port, e, diag))
+                    self.logger.debug(
+                        "Waiting for lldb-server on %s:%d (%.1fs elapsed, error: %s)",
+                        lldb_server_host, lldb_server_port, elapsed, e)
+                    time.sleep(0.5)
+            self.logger.debug("lldb-server ready on %s:%d after %.1fs",
+                              lldb_server_host, lldb_server_port, time.monotonic() - t_start)
 
             # Run lldb --batch: connect to platform, create target with remote-file,
             # set a source-level breakpoint, and run.
-- 
2.55.0


