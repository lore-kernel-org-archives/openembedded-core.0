Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15CFC54EAA
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 14:45:08 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.75993.1674225901377692856
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 06:45:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pIsdX-006KV5-Jm; Fri, 20 Jan 2023 16:44:59 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pIsdX-00CETX-Aj; Fri, 20 Jan 2023 16:44:59 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 05/14] testimage.bbclass: add debug prints for major state changes
Date: Fri, 20 Jan 2023 16:44:41 +0200
Message-Id: <20230120144450.2913935-6-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230120144450.2913935-1-mikko.rapeli@linaro.org>
References: <20230120144450.2913935-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: BAYES_HAM(-3.00)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: R_DKIM_NA(0.00)
 Symbol: ASN(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230120144450.2913935-6-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 14:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176196

When a test target hangs completely, it is important to know what
happened before that in do_testimage() task logs.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/testimage.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 5cc408b0c4..79ac28a327 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -211,6 +211,7 @@ def testimage_main(d):
         """
         Catch SIGTERM from worker in order to stop qemu.
         """
+        bb.note('SIGTERM received, killing qemu with SIGINT')
         os.kill(os.getpid(), signal.SIGINT)
 
     def handle_test_timeout(timeout):
@@ -373,14 +374,18 @@ def testimage_main(d):
     complete = False
     orig_sigterm_handler = signal.signal(signal.SIGTERM, sigterm_exception)
     try:
+        bb.debug(1, 'Starting qemu')
         # We need to check if runqemu ends unexpectedly
         # or if the worker send us a SIGTERM
         tc.target.start(params=d.getVar("TEST_QEMUPARAMS"), runqemuparams=d.getVar("TEST_RUNQEMUPARAMS"))
         import threading
         try:
+            bb.debug(1, 'Setting timer for TEST_OVERALL_TIMEOUT')
             threading.Timer(int(d.getVar("TEST_OVERALL_TIMEOUT")), handle_test_timeout, (int(d.getVar("TEST_OVERALL_TIMEOUT")),)).start()
         except ValueError:
+            bb.debug(1, 'Timer exception: ValueError')
             pass
+        bb.debug(1, 'Running tests')
         results = tc.runTests()
         complete = True
     except (KeyboardInterrupt, BlockingIOError) as err:
@@ -389,10 +394,13 @@ def testimage_main(d):
         else:
             bb.error('runqemu failed, shutting down...')
         if results:
+            bb.debug(1, 'Stopping')
             results.stop()
         results = tc.results
     finally:
+        bb.debug(1, 'Resetting SIGTERM handler')
         signal.signal(signal.SIGTERM, orig_sigterm_handler)
+        bb.debug(1, 'Stopping qemu target')
         tc.target.stop()
 
     # Show results (if we have them)
-- 
2.34.1


