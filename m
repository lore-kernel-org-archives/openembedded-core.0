Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22460C5DF90
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 22:01:54 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1132.1787176907030115728
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 15:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=CBsQKN9X;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-2026081922014496e7fcb54b000207d8-owcwhf@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026081922014496e7fcb54b000207d8
        for <openembedded-core@lists.openembedded.org>;
        Thu, 20 Aug 2026 00:01:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Qai1DHqi9kGoKWfXhURQZyjKw424V1USx7ruMcyVSAs=;
 b=CBsQKN9Xs2y/aDCzALphUvxJu61ef5/eF9bpmL8ufZpTeYomvbkkDLy15zeNb9N5hEs6Es
 w91Nr3vfVI4vrRUaltj47WzUZytm4hsN6elR2XTo6kM4yIEvwfJDnWLH205HK3zJxFj6Vlap
 qjq7qqaDrmt9XvMGwiU3qVTEC9Um2eobZnlcGgjx0g0kveXJCXz2w8ZZVC8Wbr3GaBkQT61A
 A2sguZSOiXBTtw3aiv3qYvayJCgm5XSH6/P6481OwnlU35NiX228lpgTkmE0tNqAlR5OeTX2
 C9AR+n5b275Ji1Ff2d35dojZGAlmRR1snWreewQ1yOaA/1zp7A86LQqw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 10/14] oe-selftest: devtool ide-sdk: wait for gdbserver readiness
Date: Thu, 20 Aug 2026 00:00:17 +0200
Message-ID: <20260819220138.4095398-11-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243798

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Replace the fixed delay and process-list probe for GDB background tasks
with a wait for the readiness marker generated in tasks.json. This
verifies the same background-task contract VS Code uses before starting
the debugger session.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 93 +++++++++++++++++++++----
 1 file changed, 78 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 35abc6a48f..7c2ca6afb2 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -8,7 +8,9 @@ import errno
 import os
 import re
 import shutil
+import subprocess
 import tempfile
+import threading
 import time
 import glob
 import fnmatch
@@ -18,7 +20,7 @@ import logging
 import shlex
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, Command, bitbake, get_bb_var, create_temp_layer
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
 from oeqa.utils.commands import get_bb_vars, runqemu, runqemu_check_taps, get_test_layer
 from oeqa.core.decorator import OETestTag
 from oeqa.core.decorator.data import skipIfNotFeature
@@ -2805,15 +2807,76 @@ class DevtoolUpgradeTests(DevtoolBase):
 
 
 class RunCmdBackground:
-    """Context manager to manage a background subprocess"""
+    """Context manager running a command in the background
+
+    This mirrors what VS Code itself does with a task's "isBackground" +
+    "problemMatcher": ["background"]["endsPattern"] (see the generated
+    tasks.json and how _verify_launch_config() reads
+    prelaunch_task["problemMatcher"][0]["background"]["endsPattern"]): VS
+    Code also watches the task's output incrementally and considers the
+    background task "ready" as soon as a line matches endsPattern, rather
+    than waiting for the task to exit or polling on an interval.
+    """
     def __init__(self, command, output_log=None, **options):
-        self.cmd = Command(command, bg=True, output_log=output_log, **options)
+        self.command = command
+        self.output_log = output_log
+        self.options = options
+        self.process = None
+        self._reader_thread = None
+        self._cond = threading.Condition()
+        self._chunks = []
 
     def __enter__(self):
-        self.cmd.run()
+        popen_options = dict(self.options)
+        popen_options.setdefault("stdout", subprocess.PIPE)
+        popen_options.setdefault("stderr", subprocess.STDOUT)
+        popen_options.setdefault("shell", isinstance(self.command, str))
+        self.process = subprocess.Popen(self.command, **popen_options)
+        self._reader_thread = threading.Thread(target=self._read_output, daemon=True)
+        self._reader_thread.start()
+        return self
+
+    def _read_output(self):
+        for line in self.process.stdout:
+            text = line.decode("utf-8", errors="replace")
+            if self.output_log:
+                self.output_log.info(text.rstrip())
+            with self._cond:
+                self._chunks.append(text)
+                self._cond.notify_all()
+        # Wake up a waiter still blocked once stdout closes, in case the
+        # process exited without ever producing the awaited pattern.
+        with self._cond:
+            self._cond.notify_all()
+
+    def output(self):
+        with self._cond:
+            return "".join(self._chunks)
+
+    def wait_for_output(self, pattern, timeout):
+        """Block until pattern appears in the output, the process exits, or timeout elapses."""
+        pattern = re.compile(pattern, re.MULTILINE)
+        deadline = time.monotonic() + timeout
+        with self._cond:
+            while True:
+                if pattern.search("".join(self._chunks)):
+                    return True
+                if self.process.poll() is not None:
+                    return False
+                remaining = deadline - time.monotonic()
+                if remaining <= 0:
+                    return False
+                self._cond.wait(remaining)
 
     def __exit__(self, exc_type, exc_val, exc_tb):
-        self.cmd.stop()
+        if self.process.poll() is None:
+            self.process.terminate()
+            try:
+                self.process.wait(timeout=5)
+            except subprocess.TimeoutExpired:
+                self.process.kill()
+                self.process.wait()
+        self._reader_thread.join(timeout=5)
 
 
 class DevtoolIdeSdkTests(DevtoolBase):
@@ -3595,16 +3658,16 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
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


