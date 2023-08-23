Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDBDEE49B0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 06:10:44 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.5731.1692771039816966428
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 23:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qYh4g-004KY3-0q;
	Wed, 23 Aug 2023 09:10:38 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qYh4g-00Gamr-0V; Wed, 23 Aug 2023 09:10:38 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 8/9] oeqa selftest runtime_test.py: append to TEST_RUNQEMUPARAMS
Date: Wed, 23 Aug 2023 09:10:24 +0300
Message-Id: <20230823061025.3952909-8-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
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
 Message-ID: 20230823061025.3952909-8-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 06:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186553

Don't overwrite TEST_RUNQEMUPARAMS since user may have added "slirp"
or similar things to it in site.conf, auto.conf or local.conf. Use
:append to add to it. Fixes failing tests when only "slirp" networking
works with qemu and tun based one is broken on the host machine.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 19c8f0e9ec..5f90bc658f 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -251,11 +251,11 @@ TEST_RUNQEMUPARAMS:append = " slirp"
         features += 'TEST_SUITES = "ping ssh virgl"\n'
         features += 'IMAGE_FEATURES:append = " ssh-server-dropbear"\n'
         features += 'IMAGE_INSTALL:append = " kmscube"\n'
-        features_gtk = features + 'TEST_RUNQEMUPARAMS = "gtk gl"\n'
+        features_gtk = features + 'TEST_RUNQEMUPARAMS:append = " gtk gl"\n'
         self.write_config(features_gtk)
         bitbake('core-image-minimal')
         bitbake('-c testimage core-image-minimal')
-        features_sdl = features + 'TEST_RUNQEMUPARAMS = "sdl gl"\n'
+        features_sdl = features + 'TEST_RUNQEMUPARAMS:append = " sdl gl"\n'
         self.write_config(features_sdl)
         bitbake('core-image-minimal')
         bitbake('-c testimage core-image-minimal')
@@ -283,7 +283,7 @@ TEST_RUNQEMUPARAMS:append = " slirp"
         features += 'TEST_SUITES = "ping ssh virgl"\n'
         features += 'IMAGE_FEATURES:append = " ssh-server-dropbear"\n'
         features += 'IMAGE_INSTALL:append = " kmscube"\n'
-        features += 'TEST_RUNQEMUPARAMS = "egl-headless"\n'
+        features += 'TEST_RUNQEMUPARAMS:append = " egl-headless"\n'
         self.write_config(features)
         bitbake('core-image-minimal')
         bitbake('-c testimage core-image-minimal')
-- 
2.34.1


