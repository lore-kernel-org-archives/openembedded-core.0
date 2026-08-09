Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710ABC5AC80
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 09:36:48 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6422.1786268196863093921
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 02:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Vm+gBXEM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-2026080909363315f36ffe9100020748-7nr_tu@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026080909363315f36ffe9100020748
        for <openembedded-core@lists.openembedded.org>;
        Sun, 09 Aug 2026 11:36:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Kum9CQdJuuamVg6rmFywavt0Xv/I1XmIkTkUItQHSsU=;
 b=Vm+gBXEMt2Kh2+FQqDyeO7E/O96XmfSnM0LSGY3ll0sUmmZvok7/Io9413XPgwDZRbVUPT
 Gmmm2slSDM5efPNnDGAeHXpmZ8YzZL/jiVnGTrNpJGpyTndszAkLSrEpFxEPxymkofUDBkih
 DT7+gQIQ3DSxSVqaUii328B+exYo6f4jnlDwz6cOdTxb3h72BJBd/bownBv9LPOqIyC6gLuI
 i5Joa7o7SO7zzumg3y/FOdrO+YjPNkBk3YojwRYrGWQYRx7p7VRHZK/bqXM8dpdwUeYTgUa7
 LF7/LTjPx3jHeQMbCSGrSdPRO5JcXLiNujTJP7hFfuJkwLCPbpND0E5A==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 2/8] oe-selftest: devtool ide-sdk: wait for lldb-server readiness
Date: Sun,  9 Aug 2026 11:35:53 +0200
Message-ID: <20260809093629.3457107-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260809093629.3457107-1-adrian.freihofer@siemens.com>
References: <20260809093629.3457107-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 09:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243073

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The generated MULTI preLaunchTask starts lldb-server on the target and waits
for its TCP port to appear before its SSH command completes. The selftest
bypassed that contract by starting SSH in the background, sleeping for one
second, and only checking that lldb-server appeared in ps. On a loaded
autobuilder this allowed lldb --batch to connect before lldb-server had bound
its listening socket.

Run the generated preLaunchTask SSH command synchronously before lldb --batch.
This follows VS Code's foreground-task behavior and leaves listener readiness
and timeout handling in _target_start_cmd(), where the server is started.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 78 ++++++++++++-------------
 1 file changed, 36 insertions(+), 42 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 7145755fed..d84a18e8b6 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -4175,8 +4175,6 @@ class DevtoolIdeSdkTests(DevtoolBase):
         (see _lldb_debug_cpp_example_batch_commands), and checks that the
         expected magic string and variable values are visible.
         """
-        sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
-
         with open(os.path.join(tempdir, '.vscode', 'launch.json')) as f:
             launch_d = json.load(f)
         with open(os.path.join(tempdir, '.vscode', 'tasks.json')) as f:
@@ -4208,7 +4206,9 @@ class DevtoolIdeSdkTests(DevtoolBase):
             # to SSH via subprocess without an intermediate shell.
             ssh_cmd[-1] = ssh_cmd[-1][1:-1].replace('\\$', '$')
 
-        # Extract connection details from initCommands
+        # The generated foreground preLaunchTask does not complete until its
+        # target-side command has observed lldb-server listening.  Run it
+        # synchronously so this selftest follows the same ordering as VS Code.
         init_commands = lldb_config["initCommands"]
         connect_cmd = next((c for c in init_commands if "platform connect" in c), None)
         self.assertIsNotNone(connect_cmd, "initCommands should contain a platform connect command")
@@ -4218,47 +4218,41 @@ class DevtoolIdeSdkTests(DevtoolBase):
         lldb_binary = os.path.join(lldb_native_sysroot, 'usr', 'bin', 'lldb')
         self.assertExists(lldb_binary, "lldb binary should exist in lldb-native sysroot")
 
-        with RunCmdBackground(ssh_cmd, output_log=self._cmd_logger):
-            time.sleep(1)
+        self.logger.debug("Starting lldb-server via SSH: %s", " ".join(ssh_cmd))
+        runCmd(ssh_cmd, output_log=self._cmd_logger)
 
-            # Verify lldb-server is running on the target
-            r = runCmd('ssh %s root@%s ps' % (sshargs, qemu.ip),
-                       output_log=self._cmd_logger)
-            self.assertIn("lldb-server", r.output,
-                          "lldb-server should be running on target")
+        # Run lldb --batch: connect to platform, create target with remote-file,
+        # set a source-level breakpoint, and run.
+        # targetCreateCommands replaces the "program" field; each entry is
+        # passed as a separate -o command in batch mode.
+        target_create_commands = lldb_config.get("targetCreateCommands", [])
+        source_map = lldb_config.get("sourceMap", {})
 
-            # Run lldb --batch: connect to platform, create target with remote-file,
-            # set a source-level breakpoint, and run.
-            # targetCreateCommands replaces the "program" field; each entry is
-            # passed as a separate -o command in batch mode.
-            target_create_commands = lldb_config.get("targetCreateCommands", [])
-            source_map = lldb_config.get("sourceMap", {})
-
-            lldb_batch = [lldb_binary, "--batch"]
-            for cmd in init_commands:
-                lldb_batch += ["-o", cmd]
-            for cmd in target_create_commands:
-                lldb_batch += ["-o", cmd]
-            if source_map:
-                # "settings set target.source-map" replaces the *entire*
-                # mapping list rather than appending to it. Issuing one
-                # "-o settings set target.source-map ..." per entry (as done
-                # previously) silently discards all but the last mapping, so
-                # LLDB ends up resolving source files (and verifying their
-                # DWARF MD5 checksum) against the wrong location, e.g. a
-                # stale rootfs-dbg copy of a devtool-modified recipe's own
-                # sources instead of the freshly edited workspace srctree.
-                # All pairs must therefore be set together in a single
-                # command, exactly like CodeLLDB itself does.
-                source_map_args = []
-                for k, v in source_map.items():
-                    v_resolved = v.replace("${workspaceFolder}", tempdir)
-                    source_map_args += [k, v_resolved]
-                lldb_batch += ["-o", "settings set target.source-map %s" % " ".join(source_map_args)]
-            lldb_batch += self._lldb_debug_cpp_example_batch_commands(tempdir)
-            r = runCmd(lldb_batch, output_log=self._cmd_logger)
-            self.assertEqual(r.status, 0, "lldb batch session failed: %s" % r.output)
-            self._lldb_debug_cpp_example_check(r.output, magic_string)
+        lldb_batch = [lldb_binary, "--batch"]
+        for cmd in init_commands:
+            lldb_batch += ["-o", cmd]
+        for cmd in target_create_commands:
+            lldb_batch += ["-o", cmd]
+        if source_map:
+            # "settings set target.source-map" replaces the *entire*
+            # mapping list rather than appending to it. Issuing one
+            # "-o settings set target.source-map ..." per entry (as done
+            # previously) silently discards all but the last mapping, so
+            # LLDB ends up resolving source files (and verifying their
+            # DWARF MD5 checksum) against the wrong location, e.g. a
+            # stale rootfs-dbg copy of a devtool-modified recipe's own
+            # sources instead of the freshly edited workspace srctree.
+            # All pairs must therefore be set together in a single
+            # command, exactly like CodeLLDB itself does.
+            source_map_args = []
+            for k, v in source_map.items():
+                v_resolved = v.replace("${workspaceFolder}", tempdir)
+                source_map_args += [k, v_resolved]
+            lldb_batch += ["-o", "settings set target.source-map %s" % " ".join(source_map_args)]
+        lldb_batch += self._lldb_debug_cpp_example_batch_commands(tempdir)
+        r = runCmd(lldb_batch, output_log=self._cmd_logger)
+        self.assertEqual(r.status, 0, "lldb batch session failed: %s" % r.output)
+        self._lldb_debug_cpp_example_check(r.output, magic_string)
 
     @OETestTag("runqemu")
     def test_devtool_ide_sdk_code_cmake_clang(self):
-- 
2.55.0


