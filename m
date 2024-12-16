Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A23E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 11:35:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.54603.1734348939237113197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 03:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SIym4c5Y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3D6520003;
	Mon, 16 Dec 2024 11:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734348937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Flus2GmQdmqrVfH5cETsQA8yPwo1KLJqM/J9pxEtuEE=;
	b=SIym4c5YXmXz7Z2UNbFuYsgd0UT4Ilw31iCI0qr1dgNAu3aQmrdOBy3t1cIv5LpEpSNRn9
	ObEpbiPDX2zn3+zUd3BEShiDgnxpLbovAHHN0TlChANpYGaDWde9uhBw8MfQbiY/eUqhxb
	rLoCEWus9tshrULiIw5Aqrrmr+4HrCFj0BZKGViP6ybqrEpz0Bko/B8da+GhGlWVFNL0yJ
	NplsccDF+eutQRyQeJOrOdFxg6cE3033z7IhbWmohQkAQL1nEYUyy2+TvQAU/ZVMvBz4YD
	c56YYECsdMeu3rR0rWAeUV0eBGOcRFXhhRz7c7YSJt24Oat5p/ZriVdBi9jKUg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 16 Dec 2024 12:35:24 +0100
Subject: [PATCH] kernel-yocto: use oe.types.boolean on KMETA_AUDIT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-kmeta-audit-vartrue-v1-1-51bbb0b2085a@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAHwQYGcC/x3MSwqAMAwA0atI1gbaoBW8irioGjWIH9Iqgnh3i
 8u3mHkgsAoHqLMHlC8Jsm8JNs+gn/02McqQDGSosGQdLitHj/4cJOLlNerJ6Fxp+o7MWDmCVB7
 Ko9z/tWnf9wM4GR2MZQAAAA==
X-Change-ID: 20241216-kmeta-audit-vartrue-6650cb20f762
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bruce Ashfield <bruce.ashfield@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=MRU+3wHVo3BLlzyQjNYn17IdZR3EyljQkdJjHoGXsPQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnYBCIvM2lnP6XAlSBRc3tRIbf/8OPQS3/pPjW0
 49Knp2oBPmJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2AQiAAKCRDRgEFAKaOo
 NigEEAC1Jv2WPkqnJX+v+XGibWv8YeKsI1486kKYNxZu8PvTBShh5dvOiqW2ZqesZ4bKEtCZbDS
 heeywQIPqM+YJ8aSlOuHzg19efj3Sry6eL2nu+/FliUqPtuz77km3QOKSFvrdFlR9Qa3DoxDgwV
 i5F45qlwg2q2s93tL2h27w1FHyjot/DAYEND/nN3BksGY5YcW0Jf3hPZ6tEgvo/McxXmK+ZPY9f
 Sjsog90Gti1XbjEF0BjX9TWXupO6wsaQZUrhCj222Pj6UdIpRf9T8gZKG8+qKyT8PrlJnO1ZBko
 NHvMcoFXg+4XHbQ3gOGlq6+7wwCuskoB4DmFi5LfQCjerg04oeYqn8u/3K27as2/gdksy/O4qBd
 b2Y72s6/CmbzBBqaW5Wix/vSuIi35eeZq+0rYuEI5qZ6XhQCbEfi/WmWAuMDz/T3G6/8NUtOz8S
 a1lBhOj1gZ6M5v7h8JrugIKjCftBukPmERkcA0mK/iv/5cdCOcYacZXx9m04ONT76t92yIMq85I
 lWVHA/J+fDyGneUk1AwTum+kD6vvhzPqt0je9zmF8NxH9hfdWeRgaTWmUUPR7ayr7et6jsGSHws
 zTnHA1LhvWmwZUxWP2A0AtxwN79rmhE9rqr3jfRyT2EaWHia1SjZ4VC/Wdb+6L6QOzIkguyeIUg
 b82S3WoRAVv6IfA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 11:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208761

Following commit a39a1f7cf78ad1ca07438bce634a47e970f25047
("kernel-yocto: allow early exit to configuration audit"), we can
disable auditing of the kernel configuration by setting KMETA_AUDIT
empty.

Since the default value of this variables is "yes", use
oe.types.boolean() so that it will also be disabled when setting it to
"no", and avoid potential confusion.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index a5d89dc2c8bc912539f7c9ffc25a2576920f580a..1493ba20a0c25df556df41fa4137ab17f67c91e7 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -568,7 +568,9 @@ python do_config_analysis() {
 python do_kernel_configcheck() {
     import re, string, sys, subprocess
 
-    audit_flag = d.getVar( "KMETA_AUDIT" )
+    audit_flag = False
+    if d.getVar("KMETA_AUDIT"):
+        audit_flag = oe.types.boolean(d.getVar("KMETA_AUDIT"))
     if not audit_flag:
        bb.note( "kernel config audit disabled, skipping .." )
        return

---
base-commit: e345b34703d4fa5e0bc9a82ac33b7c1fd84f99fe
change-id: 20241216-kmeta-audit-vartrue-6650cb20f762

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


