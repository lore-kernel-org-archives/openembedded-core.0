Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587BDC5B560
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 09:36:50 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6563.1786268196863498907
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 02:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=aAQ9pUg4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20260809093634a1c8874642000207cd-byjmsx@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260809093634a1c8874642000207cd
        for <openembedded-core@lists.openembedded.org>;
        Sun, 09 Aug 2026 11:36:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=FLuk/Fp1RICuFTSdCz+nPCQeL2R9xp0EjDtD3nk2R2U=;
 b=aAQ9pUg41mc09rNi2JGWAQszjqvqn8eANp4TiGpky/WNB9RzrFXQq3ZBHyBELkdlZS+UPT
 iKaBViHbu7ZhhrXg5mzEuSlRXJXiK9VKxzdcGaAPxiNBr4mLKIT+VrLCrKNQQEAVYSmueq0k
 dTawHS2VAXrY1Mxa+Gy/kbagg5Q2AdIXRqwAHQRNkNh3ixKJAXIbmPe+ksJYVUJqY7gcjlw4
 CQ0sk8LkwlxFjMleljTNK8ZOkY6TFwlVa42ZsCYo5bGE9osoQAF9l76VedowVaZpNdz/vNln
 0rFj/XK0gTtkv2rr5RDVpfv5dtTDtU4fKCmb4cfxOqESSx9W5NcsVu0w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 6/8] oe-selftest: devtool ide-sdk: verify debugger shutdown
Date: Sun,  9 Aug 2026 11:35:57 +0200
Message-ID: <20260809093629.3457107-7-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243065

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Use the QEMU target command interface to inspect the generated ide=none
server PID files and process command lines. Verify that the stop helpers
remove both the tracked process and its PID file, without relying on
broad ps output.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 61 +++++++++++--------------
 1 file changed, 27 insertions(+), 34 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 11a26f03bb..df77c628bb 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3112,7 +3112,6 @@ class DevtoolIdeSdkTests(DevtoolBase):
         numbers after recompiling, to prove the breakpoints resolve via the
         freshly rebuilt debug info.
         """
-        sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
         gdbserver_script = os.path.join(self._workspace_scripts_dir(
             recipe_name), 'gdbserver_1234_usr-bin-' + example_exe + '_multi')
         gdb_script = os.path.join(self._workspace_scripts_dir(
@@ -3122,19 +3121,18 @@ class DevtoolIdeSdkTests(DevtoolBase):
         r = runCmd(gdbserver_script, output_log=self._cmd_logger)
         self.assertEqual(r.status, 0)
 
-        # Check there is a gdbserver running
-        r = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, 'ps'), output_log=self._cmd_logger)
-        self.assertEqual(r.status, 0)
-        self.assertIn("gdbserver ", r.output)
+        pid_file = '/tmp/gdbserver_1234_usr-bin-%s_multi/gdbserver.pid' % example_exe
+        status, output = qemu.run('cat %s' % pid_file)
+        self.assertEqual(status, 0)
+        gdbserver_pid = output.strip()
+        self.assertRegex(gdbserver_pid, r'^\d+$')
 
-        # Check the pid file is correct
-        test_cmd = "'cat /proc/$(cat /tmp/gdbserver_1234_usr-bin-" + \
-            example_exe + "_multi/gdbserver.pid)/cmdline'"
-        r = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, test_cmd), output_log=self._cmd_logger)
-        self.assertEqual(r.status, 0)
-        self.assertIn("gdbserver", r.output)
-        self.assertIn("--multi", r.output)
-        self.assertIn("1234", r.output)
+        # Check the pid file identifies the expected gdbserver process
+        status, output = qemu.run('cat /proc/%s/cmdline' % gdbserver_pid)
+        self.assertEqual(status, 0)
+        self.assertIn("gdbserver", output)
+        self.assertIn("--multi", output)
+        self.assertIn("1234", output)
 
         # Test remote debugging works
         gdb_batch_cmd = " --batch " + self._gdb_debug_cpp_example(
@@ -3151,10 +3149,10 @@ class DevtoolIdeSdkTests(DevtoolBase):
         r = runCmd(gdbserver_script + ' stop', output_log=self._cmd_logger)
         self.assertEqual(r.status, 0)
 
-        # Check there is no gdbserver running
-        r = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, 'ps'), output_log=self._cmd_logger)
-        self.assertEqual(r.status, 0)
-        self.assertNotIn("gdbserver ", r.output)
+        # The stop script waits for its recorded PID before it succeeds.
+        status, _ = qemu.run('test ! -d /proc/%s && test ! -e %s' % (
+            gdbserver_pid, pid_file))
+        self.assertEqual(status, 0)
 
     def _verify_cmake_preset(self, tempdir):
         """Verify the generated cmake preset works as expected
@@ -4396,7 +4394,6 @@ class DevtoolIdeSdkTests(DevtoolBase):
         lldbinit source map / debug-file-search-paths setup for the library's
         own debug info specifically.
         """
-        sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
         scripts_dir = self._workspace_scripts_dir(recipe_name)
         binary_pretty = 'usr-bin-' + example_exe
         lldb_server_script = os.path.join(
@@ -4410,19 +4407,16 @@ class DevtoolIdeSdkTests(DevtoolBase):
         r = runCmd(lldb_server_script, output_log=self._cmd_logger)
         self.assertEqual(r.status, 0)
 
-        # Verify lldb-server is running on the target
-        r = runCmd('ssh %s root@%s ps' % (sshargs, qemu.ip),
-                   output_log=self._cmd_logger)
-        self.assertEqual(r.status, 0)
-        self.assertIn('lldb-server', r.output)
+        pid_file = '/tmp/lldb_server_1234_%s_multi/lldb_server.pid' % binary_pretty
+        status, output = qemu.run('cat %s' % pid_file)
+        self.assertEqual(status, 0)
+        lldb_server_pid = output.strip()
+        self.assertRegex(lldb_server_pid, r'^\d+$')
 
         # Verify the pid file points at the running lldb-server process
-        pid_file = '/tmp/lldb_server_1234_%s_multi/lldb_server.pid' % binary_pretty
-        test_cmd = "'cat /proc/$(cat %s)/cmdline'" % pid_file
-        r = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, test_cmd),
-                   output_log=self._cmd_logger)
-        self.assertEqual(r.status, 0)
-        self.assertIn('lldb-server', r.output)
+        status, output = qemu.run('cat /proc/%s/cmdline' % lldb_server_pid)
+        self.assertEqual(status, 0)
+        self.assertIn('lldb-server', output)
 
         # Run an lldb batch session covering the executable, library and
         # header breakpoints, then continue to completion
@@ -4437,11 +4431,10 @@ class DevtoolIdeSdkTests(DevtoolBase):
         r = runCmd(lldb_server_script + ' stop', output_log=self._cmd_logger)
         self.assertEqual(r.status, 0)
 
-        # Verify lldb-server is no longer running
-        r = runCmd('ssh %s root@%s ps' % (sshargs, qemu.ip),
-                   output_log=self._cmd_logger)
-        self.assertEqual(r.status, 0)
-        self.assertNotIn('lldb-server', r.output)
+        # The stop script waits for its recorded PID before it succeeds.
+        status, _ = qemu.run('test ! -d /proc/%s && test ! -e %s' % (
+            lldb_server_pid, pid_file))
+        self.assertEqual(status, 0)
 
     @OETestTag("runqemu")
     def test_devtool_ide_sdk_none_cmake_clang(self):
-- 
2.55.0


