Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QbNMA-0001iU-Hb
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 03:44:51 +0200
Received: by pvf24 with SMTP id 24so3404724pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 18:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=O2PwnTHvBKpAfQponWUV4j/0+Ej1sCG8gmi8OEmWM/8=;
	b=kW+QZfuVETFbdYDXrXcZGudIlJY0KjcJywsBSeDplK9l4iq9guR2p/ZKqG1ZIcVFrY
	dM5IaGrdFIeB/jsvpXb2D9RYkQ1FfqTLkzg8651rkFQHI3xnH72OowbYghwdj3TbYfBC
	sAiTzRFfgoLPfROpUtQi0dss9MXd15/p2iGBc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=PnbtuaoPohVIEtaeX50G7v54csJMFcUJz2IUmoKZN9rWKEx2lC1w3Z9fNGL7xJgCPS
	v5rDPd8YH34sK6fumLV3uKqtd9xZHvvDF5P5LTUjdwmhpts+24ewKI8rTGAPCgVQBWdm
	ZAC956lFpMtxlgS/zrdQi7stcoBdcVPg5adbU=
Received: by 10.68.31.166 with SMTP id b6mr3281451pbi.198.1309225268717;
	Mon, 27 Jun 2011 18:41:08 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o2sm4725057pbj.17.2011.06.27.18.41.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 18:41:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2011 18:40:49 -0700
Message-Id: <1309225253-25795-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1309225253-25795-1-git-send-email-raj.khem@gmail.com>
References: <1309225253-25795-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 1/5] uclibc: Remove redundant machine/arch configs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jun 2011 01:44:51 -0000

Big endian counterparts are not needed since
we already add the proper endianness to final
.config as seen in uclibc-config.inc

The difference between arm and armv5te configs
were also superficial since all it did was select
arm926t which made sure that right mtune and march
flags were passed to gcc when building uclibc
We already do that via passing them in
UCLIBC_EXTRA_CFLAGS.

Similarly for other architectures the features
are really taken care of in config mangler and
machine config fragments are no longer needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc/uclibc-git/arm/uClibc.machine           |   70 ------------------
 .../uclibc/uclibc-git/armeb/uClibc.machine         |   53 --------------
 .../uclibc/uclibc-git/armv5te/uClibc.machine       |   77 --------------------
 .../uclibc/uclibc-git/armv5teb/uClibc.machine      |   74 -------------------
 .../uclibc/uclibc-git/i386/uClibc.machine          |   59 ---------------
 .../uclibc/uclibc-git/i486/uClibc.machine          |   62 ----------------
 .../uclibc/uclibc-git/i586/uClibc.machine          |   62 ----------------
 .../uclibc/uclibc-git/i686/uClibc.machine          |   59 ---------------
 .../uclibc/uclibc-git/mips/uClibc.machine          |   63 ----------------
 .../uclibc/uclibc-git/mips64/uClibc.machine        |   63 ----------------
 .../uclibc/uclibc-git/mipsel/uClibc.machine        |   63 ----------------
 .../uclibc/uclibc-git/powerpc/uClibc.machine       |   46 ------------
 .../uclibc/uclibc-git/sh4/uClibc.machine           |   48 ------------
 .../uclibc/uclibc-git/x86_64/uClibc.machine        |   41 -----------
 14 files changed, 0 insertions(+), 840 deletions(-)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/arm/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/armeb/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/armv5te/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/armv5teb/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/i386/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/i486/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/i586/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/i686/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/mips/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/mips64/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/mipsel/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/powerpc/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/sh4/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/x86_64/uClibc.machine

diff --git a/meta/recipes-core/uclibc/uclibc-git/arm/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/arm/uClibc.machine
deleted file mode 100644
index 92ee868..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/arm/uClibc.machine
+++ /dev/null
@@ -1,70 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Mon May 14 10:23:14 2007
-#
-# TARGET_alpha is not set
-TARGET_arm=y
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="arm"
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_ARM_OABI is not set
-CONFIG_ARM_EABI=y
-# COMPILE_IN_THUMB_MODE is not set
-USE_BX=y
-CONFIG_GENERIC_ARM=y
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-# CONFIG_ARM920T is not set
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-# CONFIG_ARM_XSCALE is not set
-# CONFIG_ARM_IWMMXT is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-ARCH_LITTLE_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN is not set
-ARCH_WANTS_LITTLE_ENDIAN=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-# UCLIBC_HAS_FPU is not set
-UCLIBC_HAS_SOFT_FLOAT=y
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/armeb/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/armeb/uClibc.machine
deleted file mode 100644
index 7a6ad8b..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/armeb/uClibc.machine
+++ /dev/null
@@ -1,53 +0,0 @@
-#
-# Automatically generated make config: don't edit
-#
-# TARGET_alpha is not set
-TARGET_arm=y
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="arm"
-ARCH_SUPPORTS_BIG_ENDIAN=y
-ARCH_SUPPORTS_LITTLE_ENDIAN=y
-FORCE_OPTIONS_FOR_ARCH=y
-CONFIG_GENERIC_ARM=y
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM720T is not set
-# CONFIG_ARM920T is not set
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-# CONFIG_ARM_XSCALE is not set
-# ARCH_LITTLE_ENDIAN is not set
-ARCH_BIG_ENDIAN=y
-# ARCH_HAS_NO_MMU is not set
-ARCH_HAS_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-DO_C99_MATH=y
-# UCLIBC_HAS_FENV is not set
-KERNEL_HEADERS="<path/to/kernel/headers>" 
-HAVE_DOT_CONFIG=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/armv5te/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/armv5te/uClibc.machine
deleted file mode 100644
index 2242dc9..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/armv5te/uClibc.machine
+++ /dev/null
@@ -1,77 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Version: 0.9.32-git
-# Mon Jul 19 01:34:29 2010
-#
-# TARGET_alpha is not set
-TARGET_arm=y
-# TARGET_avr32 is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-# TARGET_xtensa is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="arm"
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_ARM_OABI is not set
-CONFIG_ARM_EABI=y
-# COMPILE_IN_THUMB_MODE is not set
-USE_BX=y
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-# CONFIG_ARM920T is not set
-# CONFIG_ARM922T is not set
-CONFIG_ARM926T=y
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_CORTEX_M3 is not set
-# CONFIG_ARM_CORTEX_M1 is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-# CONFIG_ARM_XSCALE is not set
-# CONFIG_ARM_IWMMXT is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-ARCH_LITTLE_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN is not set
-ARCH_WANTS_LITTLE_ENDIAN=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-# UCLIBC_HAS_FPU is not set
-UCLIBC_HAS_SOFT_FLOAT=y
-DO_C99_MATH=y
-# DO_XSI_MATH is not set
-# UCLIBC_HAS_FENV is not set
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/armv5teb/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/armv5teb/uClibc.machine
deleted file mode 100644
index 6b07dd5..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/armv5teb/uClibc.machine
+++ /dev/null
@@ -1,74 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Sat May 12 22:07:03 2007
-#
-# TARGET_alpha is not set
-TARGET_arm=y
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="arm"
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_ARM_OABI is not set
-CONFIG_ARM_EABI=y
-# COMPILE_IN_THUMB_MODE is not set
-USE_BX=y
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-# CONFIG_ARM920T is not set
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-CONFIG_ARM_XSCALE=y
-# CONFIG_ARM_CORTEX_M3 is not set
-# CONFIG_ARM_CORTEX_M1 is not set
-# CONFIG_ARM_IWMMXT is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-ARCH_BIG_ENDIAN=y
-ARCH_WANTS_BIG_ENDIAN=y
-# ARCH_WANTS_LITTLE_ENDIAN is not set
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-# UCLIBC_HAS_FPU is not set
-UCLIBC_HAS_SOFT_FLOAT=y
-DO_C99_MATH=y
-# DO_XSI_MATH is not set
-# UCLIBC_HAS_FENV is not set
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/i386/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/i386/uClibc.machine
deleted file mode 100644
index 3909ccc..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/i386/uClibc.machine
+++ /dev/null
@@ -1,59 +0,0 @@
-#
-# Automatically generated make config: don't edit
-#
-# TARGET_alpha is not set
-# TARGET_arm is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-TARGET_i386=y
-# TARGET_i960 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="i386"
-# ARCH_SUPPORTS_BIG_ENDIAN is not set
-ARCH_SUPPORTS_LITTLE_ENDIAN=y
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_GENERIC_386 is not set
-# CONFIG_386 is not set
-# CONFIG_486 is not set
-# CONFIG_586 is not set
-# CONFIG_586MMX is not set
-# CONFIG_686 is not set
-# CONFIG_PENTIUMII is not set
-# CONFIG_PENTIUMIII is not set
-CONFIG_PENTIUM4=y
-# CONFIG_K6 is not set
-# CONFIG_K7 is not set
-# CONFIG_ELAN is not set
-# CONFIG_CRUSOE is not set
-# CONFIG_WINCHIPC6 is not set
-# CONFIG_WINCHIP2 is not set
-# CONFIG_CYRIXIII is not set
-# CONFIG_NEHEMIAH is not set
-ARCH_LITTLE_ENDIAN=y
-# ARCH_BIG_ENDIAN is not set
-# ARCH_HAS_NO_MMU is not set
-ARCH_HAS_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-DO_C99_MATH=y
-# UCLIBC_HAS_FENV is not set
-KERNEL_HEADERS="<path/to/kernel/headers>"
-HAVE_DOT_CONFIG=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/i486/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/i486/uClibc.machine
deleted file mode 100644
index 776e00d..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/i486/uClibc.machine
+++ /dev/null
@@ -1,62 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Fri Dec 22 23:09:11 2006
-#
-# TARGET_alpha is not set
-# TARGET_arm is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-TARGET_i386=y
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="i386"
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_GENERIC_386 is not set
-# CONFIG_386 is not set
-CONFIG_486=y
-# CONFIG_586 is not set
-# CONFIG_586MMX is not set
-# CONFIG_686 is not set
-# CONFIG_PENTIUMII is not set
-# CONFIG_PENTIUMIII is not set
-# CONFIG_PENTIUM4 is not set
-# CONFIG_K6 is not set
-# CONFIG_K7 is not set
-# CONFIG_ELAN is not set
-# CONFIG_CRUSOE is not set
-# CONFIG_WINCHIPC6 is not set
-# CONFIG_WINCHIP2 is not set
-# CONFIG_CYRIXIII is not set
-# CONFIG_NEHEMIAH is not set
-ARCH_LITTLE_ENDIAN=y
-
-#
-# Using Little Endian
-#
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-DO_C99_MATH=y
-KERNEL_HEADERS="<path/to/kernel/headers>" 
-HAVE_DOT_CONFIG=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/i586/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/i586/uClibc.machine
deleted file mode 100644
index 2e98e5c..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/i586/uClibc.machine
+++ /dev/null
@@ -1,62 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Sat Feb 24 08:24:11 2007
-#
-# TARGET_alpha is not set
-# TARGET_arm is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-TARGET_i386=y
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="i386"
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_GENERIC_386 is not set
-# CONFIG_386 is not set
-# CONFIG_486 is not set
-# CONFIG_586 is not set
-# CONFIG_586MMX is not set
-# CONFIG_686 is not set
-# CONFIG_PENTIUMII is not set
-CONFIG_PENTIUMIII=y
-# CONFIG_PENTIUM4 is not set
-# CONFIG_K6 is not set
-# CONFIG_K7 is not set
-# CONFIG_ELAN is not set
-# CONFIG_CRUSOE is not set
-# CONFIG_WINCHIPC6 is not set
-# CONFIG_WINCHIP2 is not set
-# CONFIG_CYRIXIII is not set
-# CONFIG_NEHEMIAH is not set
-ARCH_LITTLE_ENDIAN=y
-
-#
-# Using Little Endian
-#
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-DO_C99_MATH=y
-KERNEL_HEADERS="<path/to/kernel/headers>" 
-HAVE_DOT_CONFIG=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/i686/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/i686/uClibc.machine
deleted file mode 100644
index 3909ccc..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/i686/uClibc.machine
+++ /dev/null
@@ -1,59 +0,0 @@
-#
-# Automatically generated make config: don't edit
-#
-# TARGET_alpha is not set
-# TARGET_arm is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-TARGET_i386=y
-# TARGET_i960 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="i386"
-# ARCH_SUPPORTS_BIG_ENDIAN is not set
-ARCH_SUPPORTS_LITTLE_ENDIAN=y
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_GENERIC_386 is not set
-# CONFIG_386 is not set
-# CONFIG_486 is not set
-# CONFIG_586 is not set
-# CONFIG_586MMX is not set
-# CONFIG_686 is not set
-# CONFIG_PENTIUMII is not set
-# CONFIG_PENTIUMIII is not set
-CONFIG_PENTIUM4=y
-# CONFIG_K6 is not set
-# CONFIG_K7 is not set
-# CONFIG_ELAN is not set
-# CONFIG_CRUSOE is not set
-# CONFIG_WINCHIPC6 is not set
-# CONFIG_WINCHIP2 is not set
-# CONFIG_CYRIXIII is not set
-# CONFIG_NEHEMIAH is not set
-ARCH_LITTLE_ENDIAN=y
-# ARCH_BIG_ENDIAN is not set
-# ARCH_HAS_NO_MMU is not set
-ARCH_HAS_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-DO_C99_MATH=y
-# UCLIBC_HAS_FENV is not set
-KERNEL_HEADERS="<path/to/kernel/headers>"
-HAVE_DOT_CONFIG=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/mips/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/mips/uClibc.machine
deleted file mode 100644
index 1cf1add..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/mips/uClibc.machine
+++ /dev/null
@@ -1,63 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Wed Jul  9 13:37:36 2008
-#
-# TARGET_alpha is not set
-# TARGET_arm is not set
-# TARGET_avr32 is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-TARGET_mips=y
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-# TARGET_xtensa is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="mips"
-FORCE_OPTIONS_FOR_ARCH=y
-ARCH_CFLAGS="-mno-split-addresses"
-CONFIG_MIPS_O32_ABI=y
-# CONFIG_MIPS_N32_ABI is not set
-# CONFIG_MIPS_N64_ABI is not set
-# CONFIG_MIPS_ISA_1 is not set
-# CONFIG_MIPS_ISA_2 is not set
-# CONFIG_MIPS_ISA_3 is not set
-# CONFIG_MIPS_ISA_4 is not set
-CONFIG_MIPS_ISA_MIPS32=y
-# CONFIG_MIPS_ISA_MIPS64 is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-# ARCH_BIG_ENDIAN is not set
-ARCH_WANTS_BIG_ENDIAN=y
-# ARCH_WANTS_LITTLE_ENDIAN=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-# DO_C99_MATH is not set
-# UCLIBC_HAS_FENV is not set
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/mips64/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/mips64/uClibc.machine
deleted file mode 100644
index a68c7af..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/mips64/uClibc.machine
+++ /dev/null
@@ -1,63 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Wed Jul  9 13:37:36 2008
-#
-# TARGET_alpha is not set
-# TARGET_arm is not set
-# TARGET_avr32 is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-TARGET_mips=y
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-# TARGET_xtensa is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="mips"
-FORCE_OPTIONS_FOR_ARCH=y
-ARCH_CFLAGS="-mno-split-addresses"
-# CONFIG_MIPS_O32_ABI is not set
-# CONFIG_MIPS_N32_ABI is not set
-CONFIG_MIPS_N64_ABI=y
-# CONFIG_MIPS_ISA_1 is not set
-# CONFIG_MIPS_ISA_2 is not set
-# CONFIG_MIPS_ISA_3 is not set
-# CONFIG_MIPS_ISA_4 is not set
-# CONFIG_MIPS_ISA_MIPS32 is not set
-CONFIG_MIPS_ISA_MIPS64=y
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-# ARCH_BIG_ENDIAN is not set
-ARCH_WANTS_BIG_ENDIAN=y
-# ARCH_WANTS_LITTLE_ENDIAN=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-# DO_C99_MATH is not set
-# UCLIBC_HAS_FENV is not set
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/mipsel/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/mipsel/uClibc.machine
deleted file mode 100644
index e148451..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/mipsel/uClibc.machine
+++ /dev/null
@@ -1,63 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Wed Jul  9 13:37:36 2008
-#
-# TARGET_alpha is not set
-# TARGET_arm is not set
-# TARGET_avr32 is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-TARGET_mips=y
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-# TARGET_xtensa is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="mips"
-FORCE_OPTIONS_FOR_ARCH=y
-ARCH_CFLAGS="-mno-split-addresses"
-CONFIG_MIPS_O32_ABI=y
-# CONFIG_MIPS_N32_ABI is not set
-# CONFIG_MIPS_N64_ABI is not set
-# CONFIG_MIPS_ISA_1 is not set
-# CONFIG_MIPS_ISA_2 is not set
-# CONFIG_MIPS_ISA_3 is not set
-# CONFIG_MIPS_ISA_4 is not set
-CONFIG_MIPS_ISA_MIPS32=y
-# CONFIG_MIPS_ISA_MIPS64 is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-# ARCH_BIG_ENDIAN is not set
-# ARCH_WANTS_BIG_ENDIAN is not set
-ARCH_WANTS_LITTLE_ENDIAN=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-# DO_C99_MATH is not set
-# UCLIBC_HAS_FENV is not set
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/powerpc/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/powerpc/uClibc.machine
deleted file mode 100644
index d49bf6a..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/powerpc/uClibc.machine
+++ /dev/null
@@ -1,46 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Tue Feb  6 19:17:06 2007
-#
-# TARGET_alpha is not set
-# TARGET_arm is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-TARGET_powerpc=y
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="powerpc"
-FORCE_OPTIONS_FOR_ARCH=y
-ARCH_BIG_ENDIAN=y
-
-#
-# Using Big Endian
-#
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-DO_C99_MATH=y
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/sh4/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/sh4/uClibc.machine
deleted file mode 100644
index 65f1c4c..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/sh4/uClibc.machine
+++ /dev/null
@@ -1,48 +0,0 @@
-#
-# Automatically generated make config: don't edit
-#
-# TARGET_alpha is not set
-# TARGET_arm is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-TARGET_sh=y
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="sh"
-ARCH_SUPPORTS_BIG_ENDIAN=y
-ARCH_SUPPORTS_LITTLE_ENDIAN=y
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_SH2A is not set
-# CONFIG_SH2 is not set
-# CONFIG_SH3 is not set
-CONFIG_SH4=y
-ARCH_LITTLE_ENDIAN=y
-# ARCH_BIG_ENDIAN is not set
-ARCH_WANTS_LITTLE_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN is not set
-# ARCH_HAS_NO_MMU is not set
-ARCH_HAS_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-DO_C99_MATH=y
-# UCLIBC_HAS_FENV is not set
-KERNEL_HEADERS="<path/to/kernel/headers>"
-HAVE_DOT_CONFIG=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/x86_64/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/x86_64/uClibc.machine
deleted file mode 100644
index 94c008d..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/x86_64/uClibc.machine
+++ /dev/null
@@ -1,41 +0,0 @@
-#
-# Automatically generated make config: don't edit
-#
-# TARGET_alpha is not set
-# TARGET_arm is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-TARGET_x86_64=y
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="x86_64"
-# ARCH_SUPPORTS_BIG_ENDIAN is not set
-ARCH_SUPPORTS_LITTLE_ENDIAN=y
-FORCE_OPTIONS_FOR_ARCH=y
-ARCH_LITTLE_ENDIAN=y
-# ARCH_BIG_ENDIAN is not set
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-DO_C99_MATH=y
-KERNEL_HEADERS="<path/to/kernel/headers>"
-HAVE_DOT_CONFIG=y
-- 
1.7.4.1



