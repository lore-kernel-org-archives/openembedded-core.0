Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97C2C5DF79
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 19:41:42 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16147.1786909295039641110
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 12:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=bWA6QbxZ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202608161941337894109740000207f2-rbb012@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202608161941337894109740000207f2
        for <openembedded-core@lists.openembedded.org>;
        Sun, 16 Aug 2026 21:41:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=QMISVk6pfFFVobY/G982l2WwDFAoVsk8Bx8dKHcsqvM=;
 b=bWA6QbxZu0qHcstdhdwz44614HgldHzUmVnXN5FBQtaqwurPDBEjmN0Imrrkgcb+vVCsSl
 s+CU11eT76VYofjmsbl7JcXfrImdKUND5pzyDldDSaB3/8kuCAGokjXmLK9i3YVU+INXhlvW
 DWh3XAPg6QRpwRR5dSd22XURZwHxgINwZC9zftjBhmRq3eMZZP2klfl5Y7eArkV/Qfx6fLUP
 o/YUwolZftGl8yjn0mLjJEswGpzK27qLegsewdDHHTN02KEUoIr5PlXFe4Ypl2K4ewtoDl4L
 zq5HrnNDmSzubcxNtBOIncl63c2bDw2AEGN9g9PlENd+trR9kcd7DWsQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 11/14] oe-selftest: devtool ide-sdk: wait for gdbserver readiness
Date: Sun, 16 Aug 2026 21:40:54 +0200
Message-ID: <20260816194127.86607-12-adrian.freihofer@siemens.com>
In-Reply-To: <20260816194127.86607-1-adrian.freihofer@siemens.com>
References: <20260816194127.86607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 19:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243558

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Replace the fixed delay and process-list probe for GDB background tasks
with a wait for the readiness marker generated in tasks.json. This
verifies the same background-task contract VS Code uses before starting
the debugger session.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 33 +++++++++++++++++--------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index a07214f8b3..493889aa51 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2753,6 +2753,20 @@ class RunCmdBackground:
 
     def __enter__(self):
         self.cmd.run()
+        return self
+
+    def wait_for_output(self, pattern, timeout):
+        pattern = re.compile(pattern, re.MULTILINE)
+        deadline = time.monotonic() + timeout
+        while time.monotonic() < deadline:
+            output = b"".join(self.cmd._output_chunks).decode(
+                "utf-8", errors="replace")
+            if pattern.search(output):
+                return True
+            if self.cmd.process.poll() is not None:
+                break
+            time.sleep(0.1)
+        return False
 
     def __exit__(self, exc_type, exc_val, exc_tb):
         self.cmd.stop()
@@ -3533,16 +3547,15 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         if len(ssh_gdbserver_cmd) > 0 and ssh_gdbserver_cmd[-1].startswith('"') and ssh_gdbserver_cmd[-1].endswith('"'):
             ssh_gdbserver_cmd[-1] = ssh_gdbserver_cmd[-1][1:-1].replace('\\$', '$')  # Remove surrounding quotes
         self.logger.debug(f"Starting gdbserver with command: {' '.join(ssh_gdbserver_cmd)}")
-        with RunCmdBackground(ssh_gdbserver_cmd, output_log=self._cmd_logger):
-            # Give gdbserver a moment to start
-            time.sleep(1)
-
-            # Verify gdbserver is running on target and listening on expected port
-            result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, 'ps'), output_log=self._cmd_logger)
-            self.assertEqual(result.status, 0, "Failed to check processes on target")
-            self.assertIn("gdbserver", result.output, "gdbserver should be running on target")
-            _, server_port = server_addr.split(':')
-            self.assertIn(server_port, result.output, f"gdbserver should be listening on port {server_port}")
+        _, server_port = server_addr.split(':')
+        with RunCmdBackground(ssh_gdbserver_cmd, output_log=self._cmd_logger) as gdbserver:
+            ready_pattern = prelaunch_task["problemMatcher"][0]["background"]["endsPattern"]
+            # Must exceed the target side budget (TARGET_START_RETRIES * 0.1s),
+            # otherwise this gives up while the target is still waiting and its
+            # diagnostics never make it into the failure.
+            self.assertTrue(
+                gdbserver.wait_for_output(ready_pattern, timeout=60),
+                "gdbserver did not report readiness on port %s" % server_port)
 
             if debug_func and debug_check_func:
                 # Do a gdb remote session using the once configuration
-- 
2.55.0


