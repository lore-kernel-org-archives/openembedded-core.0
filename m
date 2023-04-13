Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2121C77B61
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 11:15:02 +0000 (UTC)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
 by mx.groups.io with SMTP id smtpd.web11.8856.1681380718799539362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 03:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: aspeedtech.com, ip: 211.20.114.71, mailfrom: jamin_lin@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 33D9totb009121
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 17:55:50 +0800 (GMT-8)
	(envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.121) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 13 Apr
 2023 18:11:48 +0800
From: "Jamin Lin" <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] kernel-fitimage: support 64 bits address
Date: Thu, 13 Apr 2023 18:11:41 +0800
Message-ID: <20230413101142.5532-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230413101142.5532-1-jamin_lin@aspeedtech.com>
References: <20230413101142.5532-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.70.121]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 33D9totb009121
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 11:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179972

The default value of address-cells is "1", so the generated "its" file
only supports 32bits address for kernel FIT image.
However, some platforms may want to support 64bits address
of UBOOT_LOADADDRESS and UBOOT_ENTRYPOINT.
Therefore, adds a variable to support both 64bits and 32bits address cells.

By default, the address-cell is "1" which is used for 32bits load address.
If users would like to use 64bits load address, users are able to
set as following for "0x400000000" 64bits load address.
1. FIT_ADDRESS_CELLS = "2"
2. UBOOT_LOADADDRESS= "0x04 0x00000000"

(From OE-Core rev: f79046d082f3a7752e6780b2990470dcd36cbba4)

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index b77747404f..d294f28d17 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -92,6 +92,10 @@ FIT_SUPPORTED_INITRAMFS_FSTYPES ?= "cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst
 # Allow user to select the default DTB for FIT image when multiple dtb's exists.
 FIT_CONF_DEFAULT_DTB ?= ""
 
+# length of address in number of <u32> cells
+# ex: 1 32bits address, 2 64bits address
+FIT_ADDRESS_CELLS ?= "1"
+
 # Keys used to sign individually image nodes.
 # The keys to sign image nodes must be different from those used to sign
 # configuration nodes, otherwise the "required" property, from
@@ -110,7 +114,7 @@ fitimage_emit_fit_header() {
 
 / {
         description = "${FIT_DESC}";
-        #address-cells = <1>;
+        #address-cells = <${FIT_ADDRESS_CELLS}>;
 EOF
 }
 
-- 
2.17.1


