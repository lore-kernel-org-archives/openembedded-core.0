Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F07FC47422
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 09:47:09 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.6104.1705484826208690293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 01:47:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OlgPn1pq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 530421BF213;
	Wed, 17 Jan 2024 09:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705484824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XaD0pP/Ko6d/jHEzQIy9zCMySuzo2zXL2OAbGZa3A4c=;
	b=OlgPn1pqxRTqP0AN/QPN87u0K71A51bhnckLxz60GnPVGOpY3a21quNW5maS+lLoBIwJ1e
	5U7boh/diQXbw8ZHMUQ3zA41kqm41QwvLosp3UQ3Qr6/H9+lp9UGqC0wewOL7YpZpFmqCq
	CZS/6Y2OjcayTGdWpXYxWUhXb7pBUTzBP+fq3toipBIAjWGGZiZwwTTUg39bWti29N/fbe
	ZJ/zyKXCGJmjDTKhIg7C3aikpxq1P1oSIgFKURBpk5KMGbCaw9d1T7VCaG2BmhhK4iDg6g
	rZsEaXtStx7kodSPcRuUIYnDjQKa+CddN30mwmyd5GP4WP9qGA1JTaLqOrgvYQ==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] opensbi: bump to 1.4
Date: Wed, 17 Jan 2024 10:47:01 +0100
Message-ID: <20240117094701.25763-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 09:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193904

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
---
 ...re-Remove-handling-of-R_RISCV_-32-64.patch | 88 +++++++++++++++++++
 .../{opensbi_1.3.bb => opensbi_1.4.bb}        |  8 +-
 2 files changed, 92 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-bsp/opensbi/opensbi/0001-Revert-firmware-Remove-handling-of-R_RISCV_-32-64.patch
 rename meta/recipes-bsp/opensbi/{opensbi_1.3.bb => opensbi_1.4.bb} (90%)

diff --git a/meta/recipes-bsp/opensbi/opensbi/0001-Revert-firmware-Remove-handling-of-R_RISCV_-32-64.patch b/meta/recipes-bsp/opensbi/opensbi/0001-Revert-firmware-Remove-handling-of-R_RISCV_-32-64.patch
new file mode 100644
index 000000000000..d14e0b73a9bc
--- /dev/null
+++ b/meta/recipes-bsp/opensbi/opensbi/0001-Revert-firmware-Remove-handling-of-R_RISCV_-32-64.patch
@@ -0,0 +1,88 @@
+From bfe480929bcc966e1fdf5afdde8d4c22adba7f6f Mon Sep 17 00:00:00 2001
+From: Thomas Perrot <thomas.perrot@bootlin.com>
+Date: Tue, 16 Jan 2024 15:16:58 +0100
+Subject: [PATCH] Revert "firmware: Remove handling of R_RISCV_{32,64}"
+
+This reverts commit 2a6d72534d44c39e1de0614970a0dad97b1c41ba.
+
+Upstream-Status: Inappropriate [oe specific]
+Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
+---
+ firmware/fw_base.S      | 22 ++++++++++++++++++++++
+ firmware/fw_base.ldS    |  6 ++++++
+ include/sbi/riscv_elf.h |  8 ++++++++
+ 3 files changed, 36 insertions(+)
+
+diff --git a/firmware/fw_base.S b/firmware/fw_base.S
+index f7763f4d9e56..60efad39b231 100644
+--- a/firmware/fw_base.S
++++ b/firmware/fw_base.S
+@@ -88,8 +88,30 @@ _try_lottery:
+ 	add	t5, t5, t2
+ 	add	t3, t3, t2
+ 	REG_S	t5, 0(t3)		/* store runtime address to the GOT entry */
++	j	5f
+
+ 3:
++	lla	t4, __dyn_sym_start
++
++4:
++	srli	t6, t5, SYM_INDEX	/* t6 <--- sym table index */
++	andi	t5, t5, 0xFF		/* t5 <--- relocation type */
++	li	t3, RELOC_TYPE
++	bne	t5, t3, 5f
++
++	/* address R_RISCV_64 or R_RISCV_32 cases*/
++	REG_L	t3, 0(t0)
++	li	t5, SYM_SIZE
++	mul	t6, t6, t5
++	add	s5, t4, t6
++	REG_L	t6, (REGBYTES * 2)(t0)	/* t0 <-- addend */
++	REG_L	t5, REGBYTES(s5)
++	add	t5, t5, t6
++	add	t5, t5, t2		/* t5 <-- location to fix up in RAM */
++	add	t3, t3, t2		/* t3 <-- location to fix up in RAM */
++	REG_S	t5, 0(t3)		/* store runtime address to the variable */
++
++5:
+ 	addi	t0, t0, (REGBYTES * 3)
+ 	blt	t0, t1, 2b
+ 	j	_relocate_done
+diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
+index c15ccdbf6612..88b8dfd9cb56 100644
+--- a/firmware/fw_base.ldS
++++ b/firmware/fw_base.ldS
+@@ -40,6 +40,12 @@
+
+ 	. = ALIGN(0x1000); /* Ensure next section is page aligned */
+
++	.dynsym : {
++		PROVIDE(__dyn_sym_start = .);
++		*(.dynsym)
++		PROVIDE(__dyn_sym_end = .);
++	}
++
+ 	.rela.dyn : {
+ 		PROVIDE(__rel_dyn_start = .);
+ 		*(.rela*)
+diff --git a/include/sbi/riscv_elf.h b/include/sbi/riscv_elf.h
+index ed361e346155..3b62c38b4a2d 100644
+--- a/include/sbi/riscv_elf.h
++++ b/include/sbi/riscv_elf.h
+@@ -1,6 +1,14 @@
+ #ifndef __RISCV_ELF_H__
+ #define __RISCV_ELF_H__
+
++#include <sbi/riscv_asm.h>
++
++#define R_RISCV_32		1
++#define R_RISCV_64		2
+ #define R_RISCV_RELATIVE	3
+
++#define RELOC_TYPE		__REG_SEL(R_RISCV_64, R_RISCV_32)
++#define SYM_INDEX		__REG_SEL(0x20,	0x8)
++#define SYM_SIZE		__REG_SEL(0x18,0x10)
++
+ #endif
+--
+2.43.0
diff --git a/meta/recipes-bsp/opensbi/opensbi_1.3.bb b/meta/recipes-bsp/opensbi/opensbi_1.4.bb
similarity index 90%
rename from meta/recipes-bsp/opensbi/opensbi_1.3.bb
rename to meta/recipes-bsp/opensbi/opensbi_1.4.bb
index f01cae34d1ff..6cb1a2680f2a 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.3.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.4.bb
@@ -8,8 +8,10 @@ require opensbi-payloads.inc
 
 inherit autotools-brokensep deploy
 
-SRCREV = "057eb10b6d523540012e6947d5c9f63e95244e94"
-SRC_URI = "git://github.com/riscv/opensbi.git;branch=release-1.3.x;protocol=https"
+SRCREV = "a2b255b88918715173942f2c5e1f97ac9e90c877"
+SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https \
+	   file://0001-Revert-firmware-Remove-handling-of-R_RISCV_-32-64.patch \
+	  "
 
 S = "${WORKDIR}/git"
 
@@ -43,5 +45,3 @@ FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_dynamic.*"
 
 COMPATIBLE_HOST = "(riscv64|riscv32).*"
 INHIBIT_PACKAGE_STRIP = "1"
-
-SECURITY_CFLAGS = ""
-- 
2.43.0


