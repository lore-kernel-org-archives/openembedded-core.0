Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009FBC30653
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 11:36:45 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.17338.1719833795664433651
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 04:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HZv63sbV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C26CA4000D;
	Mon,  1 Jul 2024 11:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719833793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OsbwqPx6ZGAxHU8l6aaVYXXjrxvRjJDO6Ff1k6QPIao=;
	b=HZv63sbV1SyZDCiLLMpgpFboA5bGO08ALjPPDexUbbDhZdMp1j4HjsVo5gdHqmrzomLAFz
	uhv9rSU3uDjHsKgeZ2Ys4BStDTeDw16cWWB3AgeDnw6MmEOjpcwFVlUblZMX6pnpGz2G3G
	Ngfx3UANYBP7XuJ1Dt/nYO8KwwQNxbld97U3zMmu/rjcW4tv9g3tPOGZJdyXI9SXRaWNFq
	psbIYNrbEIqqNqrC+itOK6D4Pbpi664FdOVSG0fhbdkDAsKCOPiTWyrvWoERAeH3ropElR
	AdxGTvcbYoHCe0tTYR9G91t1yTH9lWunGaLK4JXh4qhFisM6mRmNyXwkyKZEBA==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] opensbi: bump to 1.5
Date: Mon,  1 Jul 2024 13:36:25 +0200
Message-ID: <20240701113625.2379263-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 11:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201302

From: Thomas Perrot <thomas.perrot@bootlin.com>

This release has:
- SBI debug triggers (DBTR) extension (Experimental)
- Support to specify coldboot harts in DT
- Relocatable FW_JUMP_ADDR and FW_JUMP_FDT_ADDR
- Smcsrind and Smcdeleg extensions support
- SBIUnit testing framework
- Initial domain context management support
- Platform specific load/store emulation callbacks
-  New trap context
- Improved sbi_trap_error() to dump state in a nested trap
- SBI supervisor software events (SSE) extension (Experimental)
- Simplified wait_for_coldboot() implementation
- Early wakeup of non-coldboot HART in the coldboot path
- Sophgo CV18XX/SG200X series support
- APLIC delegation DT property fix
- Svade and Svadu extensions support
- SBI firmware features (FWFT) extension (Experimental)

Overall, this release mainly adds more ISA extensions, SBI
extensions and other improvements.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-bsp/opensbi/{opensbi_1.4.bb => opensbi_1.5.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/opensbi/{opensbi_1.4.bb => opensbi_1.5.bb} (91%)

diff --git a/meta/recipes-bsp/opensbi/opensbi_1.4.bb b/meta/recipes-bsp/opensbi/opensbi_1.5.bb
similarity index 91%
rename from meta/recipes-bsp/opensbi/opensbi_1.4.bb
rename to meta/recipes-bsp/opensbi/opensbi_1.5.bb
index cf37a411766b..6b31d15a051b 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.4.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.5.bb
@@ -8,14 +8,15 @@ require opensbi-payloads.inc
 
 inherit autotools-brokensep deploy
 
-SRCREV = "a2b255b88918715173942f2c5e1f97ac9e90c877"
+SRCREV = "455de672dd7c2aa1992df54dfb08dc11abbc1b1a"
 SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_PIC=y CLANG_TARGET= "
+RISCV_SBI_FW_TEXT_START ??= "0x80000000"
+EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_TEXT_START=${RISCV_SBI_FW_TEXT_START}"
 # If RISCV_SBI_PAYLOAD is set then include it as a payload
 EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_image(d)}"
 EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_fdt(d)}"
-- 
2.45.2


