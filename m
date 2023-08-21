Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65A9EE49A6
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 10:17:53 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.7764.1692613072229198137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 03:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qY1if-007Fcc-0c;
	Mon, 21 Aug 2023 13:01:09 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qY1ie-00CHjH-3o; Mon, 21 Aug 2023 13:01:08 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 3/3] selftest runtime_test.py: add testimage.bbclass slirp test
Date: Mon, 21 Aug 2023 13:00:52 +0300
Message-Id: <20230821100052.2924726-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230821100052.2924726-1-mikko.rapeli@linaro.org>
References: <20230821100052.2924726-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230821100052.2924726-3-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 10:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186427

Builds core-image-minimal with testimage.bbclass and an ssh server
and then runs tests with slirp networking. Default test suite must
pass.

With full caches on x86_64 with x86_64 target the test passes in 416 seconds:

2023-08-21 09:01:12,295 - oe-selftest - INFO - Ran 1 test in 464.955s
2023-08-21 09:01:12,295 - oe-selftest - INFO - OK
2023-08-21 09:01:19,648 - oe-selftest - INFO - RESULTS:
2023-08-21 09:01:19,648 - oe-selftest - INFO - RESULTS - runtime_test.TestImage.test_testimage_slirp: PASSED (416.62s)
2023-08-21 09:01:19,711 - oe-selftest - INFO - SUMMARY:
2023-08-21 09:01:19,711 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 464.956s
2023-08-21 09:01:19,711 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 463679dd32..d8dca7f671 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -129,6 +129,21 @@ class TestImage(OESelftestTestCase):
         bitbake('core-image-full-cmdline socat')
         bitbake('-c testimage core-image-full-cmdline')
 
+    def test_testimage_slirp(self):
+        """
+        Summary: Check basic testimage functionality with qemu and slirp networking.
+        """
+
+        features = '''
+IMAGE_CLASSES += "testimage"
+IMAGE_FEATURES += "ssh-server-dropbear"
+TEST_RUNQEMUPARAMS += "slirp"
+'''
+        self.write_config(features)
+
+        bitbake('core-image-minimal')
+        bitbake('-c testimage core-image-minimal')
+
     def test_testimage_dnf(self):
         """
         Summary: Check package feeds functionality for dnf
-- 
2.34.1


