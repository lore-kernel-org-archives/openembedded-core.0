Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF38C5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 22:01:52 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1130.1787176907559735133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 15:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=eMmcuHud;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-2026081922014559c5f0207500020721-xerhnt@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026081922014559c5f0207500020721
        for <openembedded-core@lists.openembedded.org>;
        Thu, 20 Aug 2026 00:01:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=yzuIkvYb2zYO1NmLwX4RfLhs4EAR4vWj6e2G4dUhdqY=;
 b=eMmcuHudqQjjoCMuLjh1ZSblr6pANnuRz7Zc93gZiHwDWBsfDVJB0vlNrHa17sFED5Vd0U
 mxCG+N2l+pAVFVVMdXKcJQhdHl98uz/ZhdkrjXDD49J9hidJgnRbip+6CURmkYUTGO3Vhexf
 G3XAkwxXi4Eg4N3ghP9JDVZibisBhv8CdNW2H+FzkOWZCjgW0kDvg7XGltx/QE0jqRp+g/SG
 ZBEjtvlgEKEDUb958a0YZDCXsF/8+j2HXFRFgyrhWpWk+MfHvTtpia8Z0cqRwrAJkn6YlpUk
 00Lz8q8MljniU7iYDCrd2hX9deGXMMnCYBXFsO8NmLqdyfEwF1i7T7wA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 11/14] oe-selftest: devtool ide-sdk: verify debugger shutdown
Date: Thu, 20 Aug 2026 00:00:18 +0200
Message-ID: <20260819220138.4095398-12-adrian.freihofer@siemens.com>
In-Reply-To: <20260819220138.4095398-1-adrian.freihofer@siemens.com>
References: <20260819220138.4095398-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 22:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243797

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
index 7c2ca6afb2..0f9ee471b3 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3325,7 +3325,6 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         numbers after recompiling, to prove the breakpoints resolve via the
         freshly rebuilt debug info.
         """
-        sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
         gdbserver_script = os.path.join(self._workspace_scripts_dir(
             recipe_name), 'gdbserver_1234_usr-bin-' + example_exe + '_multi')
         gdb_script = os.path.join(self._workspace_scripts_dir(
@@ -3335,19 +3334,18 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
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
@@ -3364,10 +3362,10 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
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
 
     @OETestTag("runqemu")
     def test_devtool_ide_sdk_none_qemu(self):
@@ -4536,7 +4534,6 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
         lldbinit source map / debug-file-search-paths setup for the library's
         own debug info specifically.
         """
-        sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
         scripts_dir = self._workspace_scripts_dir(recipe_name)
         binary_pretty = 'usr-bin-' + example_exe
         lldb_server_script = os.path.join(
@@ -4550,19 +4547,16 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
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
@@ -4577,11 +4571,10 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
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
     def test_devtool_ide_sdk_none_cmake(self):
-- 
2.55.0


