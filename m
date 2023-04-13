Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBECC77B6C
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 10:31:32 +0000 (UTC)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
 by mx.groups.io with SMTP id smtpd.web10.9191.1681381884087700670
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 03:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: aspeedtech.com, ip: 211.20.114.71, mailfrom: jamin_lin@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 33DAFH00011548
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 18:15:17 +0800 (GMT-8)
	(envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.121) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 13 Apr
 2023 18:31:15 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] uboot-sign: support 64bits address
Date: Thu, 13 Apr 2023 18:31:09 +0800
Message-ID: <20230413103109.5604-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230413103109.5604-1-jamin_lin@aspeedtech.com>
References: <20230413103109.5604-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.121]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 33DAFH00011548
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 10:31:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179970

The default value of address-cells is "1", so the generated "its" file
only support 32bits address for uboot FIT image.
However, some platforms may want to support 64bits address of
UBOOT_LOADADDRESS and UBOOT_ENTRYPOINT.
Therefore, add variables to support both 64bits and 32bits address.

By default, the address-cell is 1 which is used for 32bits load address.
If users would like to use 64bits load address,
users are able to set as following for "0x400000000" 64bits load address.
1. FIT_ADDRESS_CELLS = "2"
2. UBOOT_LOADADDRESS= "0x04 0x00000000"

(From OE-Core rev: f79046d082f3a7752e6780b2990470dcd36cbba4)

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 3065c54577..ad04c82378 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -81,6 +81,10 @@ UBOOT_FIT_KEY_REQ_ARGS ?= "-batch -new"
 # Standard format for public key certificate
 UBOOT_FIT_KEY_SIGN_PKCS ?= "-x509"
 
+# length of address in number of <u32> cells
+# ex: 1 32bits address, 2 64bits address
+UBOOT_FIT_ADDRESS_CELLS ?= "1"
+
 # This is only necessary for determining the signing configuration
 KERNEL_PN = "${PREFERRED_PROVIDER_virtual/kernel}"
 
@@ -234,7 +238,7 @@ uboot_fitimage_assemble() {
 
 / {
     description = "${UBOOT_FIT_DESC}";
-    #address-cells = <1>;
+    #address-cells = <${UBOOT_FIT_ADDRESS_CELLS}>;
 
     images {
         uboot {
-- 
2.17.1


