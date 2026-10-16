Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC4BCC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 09:42:55 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17725.1792143769479478040
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 02:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=kc5NuKl1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-2026101609424427785c88bc0002072a-zoibz_@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026101609424427785c88bc0002072a
        for <openembedded-core@lists.openembedded.org>;
        Fri, 16 Oct 2026 11:42:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=q6FfQWWbwqAKTnZ+lGZvQlHgEMao6N2akl6GydFiNYI=;
 b=kc5NuKl18M/ldoXJ1Mimf5DHO/E68pxStYnMYOhm+pyN6FTyezpzncGc6Pi1r6UdxubYNn
 h554VitrM7tmsjDe4QH1Eq3IsQe9o1KNOcAYA8CwqD2AbShBt9SElrcsM0QuJMncnp87gQLo
 eTyN0GGroeHEZPxkE9wy18bchjodJsHk6FN+24/4abyuzojUVsBOQ5EsNPyqfONJFXLO27Bk
 TU54jNg+uMyhdJGlefUOaRXPrtiklmIZ/0E61wtW3W5T4wHslT0/6c1TmRqInfz+LTCVUTF/
 vmCAP9XLChCo5QmGfdb6qQowjihaqLB/0BBP07KyhIwiGjRP8MadzYHw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] oe-selftest: devtool: retry lldb batch on handshake timeout
Date: Fri, 16 Oct 2026 11:42:39 +0200
Message-ID: <20261016094239.371468-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 09:42:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248008

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The ide-sdk lldb tests intermittently fail on the autobuilder with
"failed to get reply to handshake packet within timeout of 6.0 seconds".
LLDB hard-codes a 6 s minimum for this handshake, which a slow
lldb-server on a loaded target (NFS root, emulated) can exceed.
https://github.com/llvm/llvm-project/blob/release/23.x/lldb/source/Plugins/Process/gdb-remote/GDBRemoteCommunicationClient.cpp

Retry the lldb batch once in that case and log the target's lldb-server
log after each timeout so the cause can be diagnosed if it persists.

[YOCTO #16452]

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 26 ++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 265f2147a4..b848623a6e 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -4963,6 +4963,25 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
         # Second pass: debug again, breakpoints now resolved at shifted line numbers
         lldb_session_func(magic_string_new)
 
+    def _run_lldb_batch(self, qemu, lldb_cmd):
+        """Run an lldb --batch session, retrying once on a gdb-remote handshake timeout.
+
+        lldb hard-codes a 6 s minimum wait for lldb-server's first reply, which
+        can be exceeded on a heavily loaded host (NFS root, emulated target).
+        On such a failure the lldb-server log is fetched from the target for
+        diagnosis. Any other failure is reported unchanged.
+        """
+        handshake_timeout = 'failed to get reply to handshake packet'
+        for attempt in (1, 2):
+            r = runCmd(lldb_cmd, ignore_status=True, output_log=self._cmd_logger)
+            if r.status == 0 or handshake_timeout not in r.output:
+                break
+            _, server_log = qemu.run('tail -n 50 /tmp/lldb_server_*/lldb_server.log')
+            self.logger.warning("lldb handshake timed out (attempt %d), lldb-server log:\n%s",
+                                attempt, server_log)
+        self.assertEqual(r.status, 0, "lldb batch session failed: %s" % r.output)
+        return r
+
     def _lldb_server_debugging_once(self, tempdir, qemu, magic_string):
         """Verify lldb-server (platform mode) + lldb batch debugging works end-to-end.
 
@@ -5050,8 +5069,7 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
                 source_map_args += [k, v_resolved]
             lldb_batch += ["-o", "settings set target.source-map %s" % " ".join(source_map_args)]
         lldb_batch += self._lldb_debug_cpp_example_batch_commands(tempdir)
-        r = runCmd(lldb_batch, output_log=self._cmd_logger)
-        self.assertEqual(r.status, 0, "lldb batch session failed: %s" % r.output)
+        r = self._run_lldb_batch(qemu, lldb_batch)
         self._lldb_debug_cpp_example_check(r.output, magic_string)
 
     def _verify_nfs_launch_json(self, tempdir, nfs_rootfs):
@@ -5111,10 +5129,8 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
         # Run an lldb batch session covering the executable, library and
         # header breakpoints, then continue to completion
         lldb_batch_args = self._lldb_debug_cpp_example_batch_commands(tempdir)
-        r = runCmd([lldb_script, '--batch'] + lldb_batch_args,
-                   output_log=self._cmd_logger)
+        r = self._run_lldb_batch(qemu, [lldb_script, '--batch'] + lldb_batch_args)
         self.logger.debug("lldb batch output: %s", r.output)
-        self.assertEqual(r.status, 0)
         self._lldb_debug_cpp_example_check(r.output, magic_string)
 
         # Stop lldb-server
-- 
2.56.0


