Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C44FC47074
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 10:15:21 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.50877.1704363312561719960
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 02:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1rLKkm-008l04-0M;
	Thu, 04 Jan 2024 12:15:08 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1rLKkP-00ArF2-G1; Thu, 04 Jan 2024 12:14:45 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2] runqemu: match .rootfs. in addition to -image- for rootfs
Date: Thu,  4 Jan 2024 12:14:37 +0200
Message-Id: <20240104101437.2586980-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: FROM_HAS_DN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: MIME_GOOD(-0.10)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(0.00)
 Symbol: R_DKIM_NA(0.00)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: ARC_NA(0.00)
 Symbol: ASN(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: RCPT_COUNT_THREE(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Message-ID: 20240104101437.2586980-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 10:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193313

Also change path.exists() and !path.isdir() to a single
path.isfile() which should be equal.

Enables running tests against image recipes which are not called
"bla-image" but plain "bla". Currently they fail with do_testimage/runqemu
error:

runqemu - ERROR - Unknown path arg /home/builder/src/base/build/tmp_qemuarm64/deploy/images/qemuarm64/img-qemuarm64.rootfs.wic

Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v2: check for both -image- and .rootfs. in file names as suggested by
    Richard Purdie <richard.purdie@linuxfoundation.org>, and using
    isfile() instead of both exists() and !isdir()

v1: https://lists.openembedded.org/g/openembedded-core/message/193280

diff --git a/scripts/runqemu b/scripts/runqemu
index 18aeb7f5f0..9ed3ab17ac 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -373,7 +373,7 @@ class BaseConfig(object):
              re.search('zImage', p) or re.search('vmlinux', p) or \
              re.search('fitImage', p) or re.search('uImage', p):
             self.kernel =  p
-        elif os.path.exists(p) and (not os.path.isdir(p)) and '-image-' in os.path.basename(p):
+        elif os.path.isfile(p) and ('-image-' in os.path.basename(p) or '.rootfs.' in os.path.basename(p)):
             self.rootfs = p
             # Check filename against self.fstypes can handle <file>.cpio.gz,
             # otherwise, its type would be "gz", which is incorrect.
-- 
2.34.1


