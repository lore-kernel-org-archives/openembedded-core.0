Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735CEC5DF70
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 06:31:42 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3326.1787034698953510541
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 23:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=LQYB8Xv3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20260818063141670c8628e100020711-xbkeel@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260818063141670c8628e100020711
        for <openembedded-core@lists.openembedded.org>;
        Tue, 18 Aug 2026 08:31:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=XnPM01sJcrcqbV/8Mrj4GFC0YJzTxFPBrhmYW1Wrn0U=;
 b=LQYB8Xv3X1+/RnQL26+oCZClg7plwEyODumfQjwM1ENwlKydc4FHKF/4il4yc+7bGkLnZt
 Kj5/Tm/vWWQ135tbmazBJFR6HhyHc08APl6oScivHcmgRyEwueQup+X6UtjxtOiZtOsNITj0
 ACLWduaplsfWMOI9ImuTS0Uu10vwyr0b9ikKEukYi0s3WgGTQSHxwtj1rSIKAkRBuf/ZY3Hk
 u17aQD2NFQepkIBcRhzffYqkGt9GCNOvYSRybNLlFgsQkIe9fCVrcozurw0lmMpExCuaahfZ
 Jifu55gsycT4voidqyi16xs6by/jdmErafTdsUQbTTOEw/+JXVO0UVOQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 11/14] oe-selftest: devtool ide-sdk: wait for gdbserver readiness
Date: Tue, 18 Aug 2026 08:30:50 +0200
Message-ID: <20260818063120.73042-12-adrian.freihofer@siemens.com>
In-Reply-To: <20260818063120.73042-1-adrian.freihofer@siemens.com>
References: <20260818063120.73042-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 06:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243662

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Replace the fixed delay and process-list probe for GDB background tasks
with a wait for the readiness marker generated in tasks.json. This
verifies the same background-task contract VS Code uses before starting
the debugger session.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 36 ++++++++++++++++++-------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 35abc6a48f..461ebf5900 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2811,6 +2811,22 @@ class RunCmdBackground:
 
     def __enter__(self):
         self.cmd.run()
+        return self
+
+    def output(self):
+        return b"".join(self.cmd._output_chunks).decode(
+            "utf-8", errors="replace")
+
+    def wait_for_output(self, pattern, timeout):
+        pattern = re.compile(pattern, re.MULTILINE)
+        deadline = time.monotonic() + timeout
+        while time.monotonic() < deadline:
+            if pattern.search(self.output()):
+                return True
+            if self.cmd.process.poll() is not None:
+                break
+            time.sleep(0.1)
+        return False
 
     def __exit__(self, exc_type, exc_val, exc_tb):
         self.cmd.stop()
@@ -3595,16 +3611,16 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
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
+                "gdbserver did not report readiness on port %s:\n%s" %
+                (server_port, gdbserver.output()))
 
             if debug_func and debug_check_func:
                 # Do a gdb remote session using the once configuration
-- 
2.55.0


