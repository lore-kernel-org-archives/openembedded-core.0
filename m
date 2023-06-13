Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8716FC7EE2E
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 08:15:05 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.8383.1686644100107079987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 01:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1q8zB2-0078oA-5u; Tue, 13 Jun 2023 11:14:56 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1q8zB1-007Hti-TB; Tue, 13 Jun 2023 11:14:55 +0300
From: mikko.rapeli@linaro.org
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] selftest reproducible.py: support different build targets
Date: Tue, 13 Jun 2023 11:14:51 +0300
Message-Id: <20230613081451.1736892-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: FROM_NO_DN(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230613081451.1736892-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 08:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182696

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Allow users to set different build reproducibility targets than
the defaults using OEQA_REPRODUCIBLE_TEST_TARGET and
OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS variables in local.conf.

Fixing all issues from "world" builds is not possible in some
complex build environments with lots of layers. Limiting the focus to
a smaller subset allows using this test to detect and fix build
reproduction issues incrementally.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index cd7aa8aafa..5c588461fa 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -134,9 +134,13 @@ class ReproducibleTests(OESelftestTestCase):
     max_report_size = 250 * 1024 * 1024
 
     # targets are the things we want to test the reproducibility of
-    targets = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline', 'core-image-weston', 'world']
+    targets = get_bb_var("OEQA_REPRODUCIBLE_TEST_TARGET")
+    if targets:
+        targets = targets.split()
+    else:
+        targets = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline', 'core-image-weston', 'world']
     # sstate targets are things to pull from sstate to potentially cut build/debugging time
-    sstate_targets = []
+    sstate_targets = (get_bb_var("OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS") or "").split()
     save_results = False
     if 'OEQA_DEBUGGING_SAVED_OUTPUT' in os.environ:
         save_results = os.environ['OEQA_DEBUGGING_SAVED_OUTPUT']
-- 
2.34.1


