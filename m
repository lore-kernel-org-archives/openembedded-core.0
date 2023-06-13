Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8833BC7EE29
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 08:02:35 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.8259.1686643348310149731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 01:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1q8yyu-00757P-2R; Tue, 13 Jun 2023 11:02:24 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1q8yyt-0074YF-Fr; Tue, 13 Jun 2023 11:02:23 +0300
From: mikko.rapeli@linaro.org
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] useradd-staticids.bbclass: improve error message
Date: Tue, 13 Jun 2023 11:02:16 +0300
Message-Id: <20230613080216.1685339-1-mikko.rapeli@linaro.org>
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
 Message-ID: 20230613080216.1685339-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 08:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182695

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Current error message is difficult to read:

ERROR: Nothing PROVIDES 'image'
trs-image was skipped: image - image: normal username test does not have a static ID defined. Add test to one of these files

It's not clear that first "image" is recipe name, second "image" is
binary package name and that "test" is the user account which does not
have a static ID defined. Improve the error message so that these are
more explicit. Now the error message looks like:

image was skipped: Recipe image, package image: normal username "test" does not have a static ID defined.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes/useradd-staticids.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index abe484eb46..1dbcba2bf1 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -47,7 +47,7 @@ def update_useradd_static_config(d):
     def handle_missing_id(id, type, pkg, files, var, value):
         # For backwards compatibility we accept "1" in addition to "error"
         error_dynamic = d.getVar('USERADD_ERROR_DYNAMIC')
-        msg = "%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN'), pkg, type, id)
+        msg = 'Recipe %s, package %s: %sname "%s" does not have a static ID defined.' % (d.getVar('PN'), pkg, type, id)
         if files:
             msg += " Add %s to one of these files: %s" % (id, files)
         else:
-- 
2.34.1


