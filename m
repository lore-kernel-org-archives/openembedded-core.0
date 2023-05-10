Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62180C7EE23
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 12:59:59 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.15972.1683723594582273836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 05:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pwjQ8-004Ovg-OR; Wed, 10 May 2023 15:59:52 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pwjQ8-00HI6a-GC; Wed, 10 May 2023 15:59:52 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 3/3] qemurunner: add boot logs to do_testimage task logs in real time
Date: Wed, 10 May 2023 15:59:35 +0300
Message-Id: <20230510125935.4120156-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230510125935.4120156-1-mikko.rapeli@linaro.org>
References: <20230510125935.4120156-1-mikko.rapeli@linaro.org>
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
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230510125935.4120156-3-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 12:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181110

Complex boot sequences take a lot of time to reach serial console login.
In our case boot involves multiple bootloaders like u-boot and grub,
then hypervisors like xen, then initramfs images which do things like
validating secure boot and encrypting the main rootfs. All these happen
before main rootfs serial console login prompt is reached and thus many
things can go wrong, including race conditions, hangs and deadlocks, and
thus logging the details is important for development.

This change adds the qemu serial console logs to do_testimage task logs while
they are being read out. The logs are not added to bitbake output. This
enables debugging and tracing the do_testimage via task log file while the boot
and tests are running.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c06268f5bc..7f520d47c3 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -480,6 +480,7 @@ class QemuRunner:
                         self.logger.error('Invalid file type: %s\n%s' % (file))
                         read = b''
 
+                    self.logger.debug2('Partial boot log:\n%s' % (read.decode('utf-8', errors='ignore')))
                     data = data + read
                     if data:
                         bootlog += data
-- 
2.34.1


