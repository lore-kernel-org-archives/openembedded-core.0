Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D4DC5AD68
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 09:36:50 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6421.1786268196863023839
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 02:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=PcgMepvF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20260809093633eef150bfc20002074a-pgfnmb@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260809093633eef150bfc20002074a
        for <openembedded-core@lists.openembedded.org>;
        Sun, 09 Aug 2026 11:36:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=WXFDCsJgtNrfO2XVI70VkwvnsFP9RpSqjMs9K9ldZGg=;
 b=PcgMepvFJCuJcWEQWFRWPDOjKRNw4qodlEfilHrEFaRnlJFZKMU4/dwHbt0QxVEuMPUvs/
 uAedDYRQkUr2YbUlHXwesTMrAcz/9B1gSlQP0mZDUCbbrUeJMDQIRH4E9TVknKLlzK/3jh8G
 9I95hmAiJ6GyVGhWgkB2cGrItdep3duPfx55o0nIzEx9P6Lv6yVDs3+RNwiU++cHyCgJ9gX5
 aZBX35vcbuJOYO0boPRu2IgfIt+PafGtJkKWLZlpmsmQ9R6jsLlhGGsia5DqSlv3Kbt+3QLu
 czGVk6+vKU+zeoQGLNFimOwbbtL1x4+ecvglfwDqc0cSaB+MWnACqC3w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 4/8] oe-selftest: devtool ide-sdk: wait for gdbserver readiness
Date: Sun,  9 Aug 2026 11:35:55 +0200
Message-ID: <20260809093629.3457107-5-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243069

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Replace the fixed delay and process-list probe for GDB background tasks
with a wait for the readiness marker generated in tasks.json. This
verifies the same background-task contract VS Code uses before starting
the debugger session.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 30 ++++++++++++++++---------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 04a42b8906..11a26f03bb 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2747,6 +2747,20 @@ class RunCmdBackground:
 
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
@@ -3514,16 +3528,12 @@ class DevtoolIdeSdkTests(DevtoolBase):
         if len(ssh_gdbserver_cmd) > 0 and ssh_gdbserver_cmd[-1].startswith('"') and ssh_gdbserver_cmd[-1].endswith('"'):
             ssh_gdbserver_cmd[-1] = ssh_gdbserver_cmd[-1][1:-1].replace('\\$', '$')
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
+            self.assertTrue(
+                gdbserver.wait_for_output(ready_pattern, timeout=15),
+                "gdbserver did not report readiness on port %s" % server_port)
 
             if debug_func and debug_check_func:
                 # Do a gdb remote session using the once configuration
-- 
2.55.0


