Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB432C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 14:39:02 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.19989.1667486339339283837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 07:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oqbMs-005oFj-UN; Thu, 03 Nov 2022 16:38:55 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oqbMs-009afK-KI; Thu, 03 Nov 2022 16:38:54 +0200
From: mikko.rapeli@linaro.org
To: openembedded-core@lists.openembedded.org
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 2/2] wic: bootimg-efi: implement --include-path
Date: Thu,  3 Nov 2022 16:38:50 +0200
Message-Id: <20221103143850.2285312-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20221103143850.2285312-1-mikko.rapeli@linaro.org>
References: <20221103143850.2285312-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_FIVE(0.00)
 Symbol: FROM_NO_DN(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20221103143850.2285312-2-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 14:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172633

From: Maxim Uvarov <maxim.uvarov@linaro.org>

--include-path can be used for placing files on ESP,
like dtbs.

(From OE-Core rev: 46ca73f504b0792766dc4d4bbad38beb04ef4ed0)

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index f74aaa4a81..8f09e41eef 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -400,6 +400,11 @@ class BootimgEFIPlugin(SourcePlugin):
             cp_cmd = "cp %s %s/" % (startup, hdddir)
             exec_cmd(cp_cmd, True)
 
+        for paths in part.include_path or []:
+            for path in paths:
+                cp_cmd = "cp -r %s %s/" % (path, hdddir)
+                exec_cmd(cp_cmd, True)
+
         du_cmd = "du -bks %s" % hdddir
         out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
-- 
2.35.1


