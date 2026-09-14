Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB04C88E50
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 12:29:52 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19110.1789388987927074234
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 05:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=hKzVECJ7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-202609141229438216f89bda0002074c-abbchl@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202609141229438216f89bda0002074c
        for <openembedded-core@lists.openembedded.org>;
        Mon, 14 Sep 2026 14:29:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=C8ApXBYkX5VHaKpaR/vmYG0cUK8r9T9CvL+0u+8v2uc=;
 b=hKzVECJ7/uJf9mz9uCKq3oMyUZwta8cUtnm7Zqkmd+K9lbA1v5+A45JQmiwvbgw/C47orT
 loFDLm9LbA18ZzOyfTwZXP6tH9HmCfM81645S/ZHjzdnNSmgVwGH55MO7l6DAYIjmmvv7We+
 hfxlus7sozsc5L0v/3PcheTq3klM9ihuhFdFy3MJD4pq1n1XE8IL7VRB45cAoJdfLEtGpn8s
 CqaOHn9vhjwUBk+ARC/jGOgttaHieKCVJuAoqw/vE1ADCoBgxZ+kj4SGIqDjCT9jMkO2sDWl
 KOwCATVr7XGIKnlYLFolJ6CNPsiK7VGE3Cdr4KlDcVP4qdh0+xIWT77g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] oeqa/runtime: fix minidebuginfo test for full binary path in stack frames
Date: Mon, 14 Sep 2026 14:29:40 +0200
Message-ID: <20260914122940.1951188-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 12:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245779

From: Adrian Freihofer <adrian.freihofer@siemens.com>

coredumpctl renders the full binary path in stack frames
(e.g. /usr/bin/busybox.nosuid) instead of just the basename
(busybox.nosuid). Use assertRegex with an optional path prefix so
the assertion validates both the function name and the correct
binary regardless of how coredumpctl formats the executable path.

  File ".../openembedded-core/meta/lib/oeqa/runtime/cases/systemd.py", line 169, in test_systemd_coredump_minidebuginfo
    self.assertEqual('sleep_for_duration (busybox.nosuid' in output or 'xnanosleep (sleep.coreutils' in output,
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                     True, msg='Call stack is missing minidebuginfo symbols (functions shown as "n/a"): %s' % output)
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AssertionError: False != True : Call stack is missing minidebuginfo symbols (functions shown as "n/a"):            PID: 9661 (sleep)
           UID: 0 (root)
           GID: 0 (root)
        Signal: 11 (SEGV)
     Timestamp: Tue 2026-08-04 22:41:41 UTC (1s ago)
  Command Line: sleep 1000
    Executable: /usr/bin/busybox.nosuid
 Control Group: /system.slice/system-dropbear.slice/dropbear@11-8-10.0.2.15:22-10.0.2.2:50980.service
          Unit: dropbear@11-8-10.0.2.15:22-10.0.2.2:50980.service
         Slice: system-dropbear.slice
       Boot ID: 986c0a0096f3438cb90fe64ff32e9e15
    Machine ID: 84f8b285af8c46288f07ddb18356b617
      Hostname: ConnectX500-140006B0DB
       Storage: /var/lib/systemd/coredump/core.sleep.0.986c0a0096f3438cb90fe64ff32e9e15.9661.1785883301000000.zst (present)
  Size on Disk: 24.9K
       Message: Process 9661 (sleep) of user 0 dumped core.

                Stack trace of thread 9661:
                #0  0x0000ffffbbd357a0 __internal_syscall_cancel (libc.so.6 + 0x857a0)
                #1  0x0000ffffbbd7101c clock_nanosleep (libc.so.6 + 0xc101c)
                #2  0x0000ffffbbd7b5a0 __nanosleep (libc.so.6 + 0xcb5a0)
----->          #3  0x0000aaaad9125fc8 sleep_for_duration (/usr/bin/busybox.nosuid + 0xa5fc8)
                #4  0x0000aaaad9125fc8 sleep_for_duration (/usr/bin/busybox.nosuid + 0xa5fc8)
                #5  0x0000ffffbbcd305c __libc_start_main (libc.so.6 + 0x2305c)
                ELF object binary architecture: AARCH64

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/runtime/cases/systemd.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index 640f28abe9..23dd3a3009 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -166,8 +166,10 @@ class SystemdServiceTests(SystemdTest):
 
         (status, output) = self.target.run('coredumpctl info %s' % sleep_pid)
         self.assertEqual(status, 0, msg='MiniDebugInfo Test failed: %s' % output)
-        self.assertEqual('sleep_for_duration (busybox.nosuid' in output or 'xnanosleep (sleep.coreutils' in output,
-                         True, msg='Call stack is missing minidebuginfo symbols (functions shown as "n/a"): %s' % output)
+        self.assertRegex(output,
+                         r'sleep_for_duration \((?:.*/)?busybox\.nosuid'
+                         r'|xnanosleep \((?:.*/)?sleep\.coreutils',
+                         msg='Call stack is missing minidebuginfo symbols (functions shown as "n/a"): %s' % output)
 
 class SystemdJournalTests(SystemdTest):
 
-- 
2.55.0


