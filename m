Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C83C4332F
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 05:55:23 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web09.20585.1664949318409745945
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 22:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25,
 mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ofxNE-00CbDx-0P; Wed, 05 Oct 2022 08:55:16 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ofxND-007kKU-LJ; Wed, 05 Oct 2022 08:55:15 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/2] wic: bootimg-efi: implement --include-path
Date: Wed,  5 Oct 2022 08:55:04 +0300
Message-Id: <20221005055504.1836847-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221005055504.1836847-1-mikko.rapeli@linaro.org>
References: <20221005055504.1836847-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: RCPT_COUNT_THREE(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_DN_SOME(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20221005055504.1836847-2-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 05:55:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171442

From: Maxim Uvarov <maxim.uvarov@linaro.org>

--include-path can be used for placing files on ESP,
like dtbs.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 70c55ce2f0..4b00913a70 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -420,6 +420,11 @@ class BootimgEFIPlugin(SourcePlugin):
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
2.17.1


