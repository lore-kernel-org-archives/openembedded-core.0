Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D1AE7718E
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 13:16:22 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.21253.1735218972203148377
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Dec 2024 05:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fz4W0pW5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD9D91BF204;
	Thu, 26 Dec 2024 13:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735218969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6opVDl2daASs/LADV7hGPbFM5vkgwY6u+zd8Agt1ytg=;
	b=fz4W0pW5RLEaal6LwuxVliXBv6lVK+bB6A3ef5vkCA0SbT7r/aanJ9ULWuB9vHjAqZDmnA
	dy7lUu7IvjpVeBSRNG1eaqWEem6Z/kCD+wAOH8hLrskZ1osmmCfDDSVuNcSnDKPvLcCx6+
	sBTlwtmT5vtKF6hcKaAsJmzt92+h+MFvytBGC05nkZllHqYcO71doMpypce9VUtug+nIo9
	EXtx2JJXPrDgeRTTkAqYuKP0UynEGQ1zVwN3WQxKHXMSygEHddlJJ6K7SI2iWLPokzlJ8V
	Ffdry3SiOpZMshjMJKj/mGEjfslqhs1lhDtZnr+cixXBfxwNveYouVh24R2LGA==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] opensbi: bump to 1.6
Date: Thu, 26 Dec 2024 14:16:00 +0100
Message-ID: <20241226131600.2895883-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Dec 2024 13:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209092

From: Thomas Perrot <thomas.perrot@bootlin.com>

This release has:
- Support for parsing riscv,isa-extensions DT property
- Setup serial console very early in cold boot path
- Support for multiple heaps and aligned memory allocation
- Support for shadow stacks (Zicfiss) ISA extension
- Support for landing pads (Zicfilp) ISA extension
- Support for per-domain data
- Support for double-trap (Smdbltrp/Ssdbltrp) ISA extensions
- DT-based configurable heap size
- Common fdt_driver and helpers for driver initialization
- Support for SBI PMU raw event v2 (Experimental)
- Simple FDT based mailbox driver framework
- RPMI shared memory transport driver (Experimental)
- RPMI system reset driver (Experimental)
- Simple FDT based system suspend driver framework
- RPMI system suspend driver (Experimental)
- Simple FDT based HSM driver framework
- RPMI HSM driver (Experimental)
- Simple FDT based CPPC driver framework
- RPMI CPPC driver (Experimental)
- SBI Message Proxy (MPXY) extension (Experimental)
- Simple FDT based MPXY driver framework
- Common RPMI client driver for MPXY (Experimental)
- Support for vector misaligned load/store

Overall, this release adds more ISA extensions, drivers, and other improvements.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 .../opensbi/{opensbi_1.5.1.bb => opensbi_1.6.bb}           | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-bsp/opensbi/{opensbi_1.5.1.bb => opensbi_1.6.bb} (91%)

diff --git a/meta/recipes-bsp/opensbi/opensbi_1.5.1.bb b/meta/recipes-bsp/opensbi/opensbi_1.6.bb
similarity index 91%
rename from meta/recipes-bsp/opensbi/opensbi_1.5.1.bb
rename to meta/recipes-bsp/opensbi/opensbi_1.6.bb
index 652b81182b80..3c16656b395e 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.5.1.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.6.bb
@@ -8,11 +8,13 @@ require opensbi-payloads.inc
 
 inherit autotools-brokensep deploy
 
-SRCREV = "43cace6c3671e5172d0df0a8963e552bb04b7b20"
-SRC_URI = "git://github.com/riscv/opensbi.git;branch=release-1.5.x;protocol=https"
+SRCREV = "bd613dd92113f683052acfb23d9dc8ba60029e0a"
+SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
+TARGET_DBGSRC_DIR = "/share/opensbi/*/generic/firmware/"
+
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 RISCV_SBI_FW_TEXT_START ??= "0x80000000"
@@ -45,4 +47,3 @@ FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
 FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_dynamic.*"
 
 COMPATIBLE_HOST = "(riscv64|riscv32).*"
-INHIBIT_PACKAGE_STRIP = "1"
-- 
2.47.1


