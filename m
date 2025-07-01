Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A34C83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 14:45:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.12643.1751381103231305830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 07:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NmXmqeIL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D20143860;
	Tue,  1 Jul 2025 14:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751381101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XOFqICXMSpv0sQx+LgsQqH5bg6rZtPiB/DV+Dxq2Svk=;
	b=NmXmqeILGXiww5H8av22l9ffk4TzKLQzu4e8YTuiGnujlcTv6yT3dAKqJ8vJRfqqvrpTGg
	7jm5rOKUgeTCXxlCLIy2/c6AFm/14xms1PtwO/wdlm10zq/qAWkQWh9ZaDuBTfG57Pb6Is
	r4m+PUN80oZLOUWw9hh4zea7vACIzmvUQEHSXUMQQb/4o+dp7Y4er83XDG0+M56guW+R0w
	Dt37smcyLXt7+pPMC4dlVlagA7aETEe3DjSqXigR5g1U150gQs3VT5hEg5VujCl52tkSYF
	H4bZOIMB9MsTtt/YFwm4P6Iuq8d5ZCI191o1FcReAu4S6NIWijdpUS7ZaTlnHw==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] opensbi: bump to 1.7
Date: Tue,  1 Jul 2025 16:42:50 +0200
Message-ID: <20250701144250.231485-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepthhhohhmrghsrdhpvghrrhhothessghoohhtlhhinhdrtghomhenucggtffrrghtthgvrhhnpedvueethfejueevleetiefffedvgeejtddtiedvieffieetjeekhfdvvdevkeetueenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppeekvddrieeirddvheegrdegjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekvddrieeirddvheegrdegjedphhgvlhhopeigphhsudefqdduudeihehgjedpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghrrhhothessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 14:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219584

From: Thomas Perrot <thomas.perrot@bootlin.com>

This release has:
- New parameter in top-level Makefile for reproducible builds
- Added MIPS P8700 platform support
- Allow arbitrary path in LLVM parameter of top-level Makefile
- Improved SBI v3.0 extensions to match frozen specification
-  Emulate AMO instructions when Zaamo is not available
- Stop the harts waiting for HSM start from supervisor software
- Improved generic platform overrides to use common fdt_driver helpers
- Improved SBI MPXY framework to use per-domain data
- Added support for control transfer records (CTR) ISA extension
- Use LR and SC when Zaamo ISA extension is not available
- Added PXA UART support
- Added support for double-trap ISA extensions
- Optimized hartid and scratch lookup
- Added unit tests for bitwise operations
- Added unit tests for SBI ecall functionality
- Constify various FDT driver definitions
- Added MPXY RPMI mailbox driver for System MSI service group
- Improved RPMI drivers to match frozen specifications
- Initialize miscellaneous early drivers in one pass
- Use fdt_driver helpers for irqchip driver framework
- Allow adding SSE events dynamically at boot-time
- Simple singly linked list implementation

Overall, this release adds more ISA extensions and does many device driver
improvements.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 ...lag-for-reprodubility-compiler-flags.patch | 49 -------------------
 .../{opensbi_1.6.bb => opensbi_1.7.bb}        |  6 +--
 2 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-bsp/opensbi/opensbi/0001-Makefile-Add-flag-for-reprodubility-compiler-flags.patch
 rename meta/recipes-bsp/opensbi/{opensbi_1.6.bb => opensbi_1.7.bb} (93%)

diff --git a/meta/recipes-bsp/opensbi/opensbi/0001-Makefile-Add-flag-for-reprodubility-compiler-flags.patch b/meta/recipes-bsp/opensbi/opensbi/0001-Makefile-Add-flag-for-reprodubility-compiler-flags.patch
deleted file mode 100644
index e650476f50ff..000000000000
--- a/meta/recipes-bsp/opensbi/opensbi/0001-Makefile-Add-flag-for-reprodubility-compiler-flags.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From f4c440219f42d74bd3d6688132ea876f3f51e601 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 14 May 2025 19:50:24 -0700
-Subject: [PATCH] Makefile: Add flag for reprodubility compiler flags
-
-Provides mechanism to remove absolute paths from binaries using
--ffile-prefix-map
-
-It will help distros (e.g. yocto based ones ) which want to ship
-the .elf files but need to scrub absolute paths in objects
-
-Upstream-Status: Submitted [https://lists.infradead.org/pipermail/opensbi/2025-May/008458.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index e90836c7..22d4ecff 100644
---- a/Makefile
-+++ b/Makefile
-@@ -174,6 +174,11 @@ else
- USE_LD_FLAG	=	-fuse-ld=bfd
- endif
- 
-+REPRODUCIBLE ?= n
-+ifeq ($(REPRODUCIBLE),y)
-+REPRODUCIBLE_FLAGS		+=	-ffile-prefix-map=$(src_dir)=
-+endif
-+
- # Check whether the linker supports creating PIEs
- OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
- 
-@@ -362,6 +367,7 @@ GENFLAGS	+=	$(firmware-genflags-y)
- 
- CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -ffunction-sections -fdata-sections
- CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
-+CFLAGS		+=	$(REPRODUCIBLE_FLAGS)
- # Optionally supported flags
- ifeq ($(CC_SUPPORT_VECTOR),y)
- CFLAGS		+=	-DOPENSBI_CC_SUPPORT_VECTOR
-@@ -387,6 +393,7 @@ CPPFLAGS	+=	$(firmware-cppflags-y)
- ASFLAGS		=	-g -Wall -nostdlib
- ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
- ASFLAGS		+=	-fPIE
-+ASFLAGS		+=	$(REPRODUCIBLE_FLAGS)
- # Optionally supported flags
- ifeq ($(CC_SUPPORT_SAVE_RESTORE),y)
- ASFLAGS		+=	-mno-save-restore
diff --git a/meta/recipes-bsp/opensbi/opensbi_1.6.bb b/meta/recipes-bsp/opensbi/opensbi_1.7.bb
similarity index 93%
rename from meta/recipes-bsp/opensbi/opensbi_1.6.bb
rename to meta/recipes-bsp/opensbi/opensbi_1.7.bb
index 308ac43ac85d..a460062e9398 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.6.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.7.bb
@@ -8,10 +8,8 @@ require opensbi-payloads.inc
 
 inherit deploy
 
-SRCREV = "bd613dd92113f683052acfb23d9dc8ba60029e0a"
-SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https \
-           file://0001-Makefile-Add-flag-for-reprodubility-compiler-flags.patch \
-"
+SRCREV = "a32a91069119e7a5aa31e6bc51d5e00860be3d80"
+SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https"
 
 TARGET_DBGSRC_DIR = "/share/opensbi/*/generic/firmware/"
 
-- 
2.50.0


