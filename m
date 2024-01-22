Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59903C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 08:42:59 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.69062.1705912973036050560
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 00:42:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NVn/Fcn9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D22E5E000E;
	Mon, 22 Jan 2024 08:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705912971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nHhTpev3fLQy3e5cIwdCK9Q5n6Frh1UBAki8MWeSTuI=;
	b=NVn/Fcn9PBBYqNoOborlgw9fk8jxGfPXN0pFx+E1TDo6yCFiWhgty4sejjOlWrY82hG1Y8
	Sch13pNX2jGic1UWz0UO7n34USCPls9tC7GWcnB8jfADF1RbecefpiSo5I5VyVOAPetg12
	hr0KksVov3bSnoSpOYJFzrf7J+RcdPCbpODwvqwOkeT/anoT/P69Y+LLD7QLCVrxVoNyZv
	kEzSNFJwixQGi4GB9A6tjgaOGqh2Fhhkak+Y6u52S+IhyeM+7ZB4/5VLi+heALoCtk3JvD
	PaC8MvnBcochmKG6nRZCDduec86Uv+y0wPX4nA23JrqHU0TZ15mK5Spc0Gd/4w==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [OE-core][PATCH v3] opensbi: bump to 1.4
Date: Mon, 22 Jan 2024 09:42:47 +0100
Message-ID: <20240122084247.704432-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 08:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194123

From: Thomas Perrot <thomas.perrot@bootlin.com>

This release has:
- Synopsys DesignWare APB GPIO driver
- Zicntr and Zihpm support
- Console print improvements
- Smepmp support
- Simple FDT based syscon regmap driver
- Syscon based reboot and poweroff driver
- Non-contiguous hpm counters
- Smcntrpmf support
- Full sparse hartid support
- IPI improvements
- RFENCE improvements
- Zkr support
- Andes custom PMU support
Overall, this release mainly adds more ISA extensions, drivers and other improvements.

https://github.com/riscv-software-src/opensbi/compare/v1.3.1...v1.4

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use FW_PIC=y and drop revert patch
v3: Skip ldflags QA

 .../opensbi/{opensbi_1.3.bb => opensbi_1.4.bb}            | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-bsp/opensbi/{opensbi_1.3.bb => opensbi_1.4.bb} (89%)

diff --git a/meta/recipes-bsp/opensbi/opensbi_1.3.bb b/meta/recipes-bsp/opensbi/opensbi_1.4.bb
similarity index 89%
rename from meta/recipes-bsp/opensbi/opensbi_1.3.bb
rename to meta/recipes-bsp/opensbi/opensbi_1.4.bb
index f01cae34d1ff..e36ada081428 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.3.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.4.bb
@@ -8,12 +8,12 @@ require opensbi-payloads.inc

 inherit autotools-brokensep deploy

-SRCREV = "057eb10b6d523540012e6947d5c9f63e95244e94"
-SRC_URI = "git://github.com/riscv/opensbi.git;branch=release-1.3.x;protocol=https"
+SRCREV = "a2b255b88918715173942f2c5e1f97ac9e90c877"
+SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https"

 S = "${WORKDIR}/git"

-EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_PIC=n CLANG_TARGET= "
+EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_PIC=y CLANG_TARGET= "
 # If RISCV_SBI_PAYLOAD is set then include it as a payload
 EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_image(d)}"
 EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_fdt(d)}"
@@ -44,4 +44,4 @@ FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_dynamic.*"
 COMPATIBLE_HOST = "(riscv64|riscv32).*"
 INHIBIT_PACKAGE_STRIP = "1"

-SECURITY_CFLAGS = ""
+INSANE_SKIP:${PN} = "ldflags"
--
2.43.0

