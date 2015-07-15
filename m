Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2F1F365CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 02:44:04 +0000 (UTC)
Received: by qgy5 with SMTP id 5so12726139qgy.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 19:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=VPX/2r3SNJs5wcBt1sdSoZwiW99p+8HJTSI+7uYgb/Y=;
	b=G6jzkKS1lUWXR47R+UxdmexjIYua410BO5Se3byO8tRWpSOkHXMnnJdu3sHg1m5Ufq
	d0bz4Q4TiHtxYqPoK0sGygh9MT22FRxIusxi7+9AaWz4+ruCbo+E7T03LaOHPkfTWlyC
	3VNes0l/N+lji8YPVFKaPkDAu2b/iwuiqMNGj2eie0sLfHTu+lYd0piHJhro7OADF7/A
	coHbx677xeOrcorV8h0qC8TSHTBmhbRQp3093WJ0Er8FhGDEWQTObdTtu3Eco4iOw1qy
	2wGdtmiF+O6xUZDwV9sKucddfaOt08Snw3gUb30VBsqcEmxrYJ5WXD28Y1KlUFHdc6sQ
	zBJQ==
X-Received: by 10.55.54.65 with SMTP id d62mr3768890qka.59.1436928244477;
	Tue, 14 Jul 2015 19:44:04 -0700 (PDT)
Received: from localhost ([179.105.243.19]) by smtp.gmail.com with ESMTPSA id
	197sm1558587qhq.23.2015.07.14.19.44.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jul 2015 19:44:03 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 14 Jul 2015 23:43:56 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jul 2015 23:43:53 -0300
Message-Id: <1436928233-11337-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.4.5
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] u-boot: Upgrade to 2015.07 release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jul 2015 02:44:05 -0000

This upgrades the U-Boot and its related recipes for the 2015.07
release.

The following recipes has been upgraded:

 - u-boot
 - u-boot-mkimage
 - u-boot-fw-utils

The patches which were applied on top of the 2015.01 release are
dropped as those are not needed in this release.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../0001-tools-env-fix-build-error.patch           |  36 ----
 ...utils_2015.01.bb => u-boot-fw-utils_2015.07.bb} |  11 +-
 meta/recipes-bsp/u-boot/u-boot-mkimage/gcc5.patch  |  91 ----------
 ...kimage_2015.01.bb => u-boot-mkimage_2015.07.bb} |  12 +-
 meta/recipes-bsp/u-boot/u-boot.inc                 |   2 +-
 ...5xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch | 190 ---------------------
 meta/recipes-bsp/u-boot/u-boot_2015.01.bb          |  11 --
 meta/recipes-bsp/u-boot/u-boot_2015.07.bb          |  10 ++
 8 files changed, 21 insertions(+), 342 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2015.01.bb => u-boot-fw-utils_2015.07.bb} (79%)
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage/gcc5.patch
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2015.01.bb => u-boot-mkimage_2015.07.bb} (65%)
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot/0001-u-boot-mpc85xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2015.01.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2015.07.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch b/meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch
deleted file mode 100644
index 381b505..0000000
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ee2d75513452aa6d5306fd380104adc8a2f6d8f2 Mon Sep 17 00:00:00 2001
-From: Masahiro Yamada <yamada.m@jp.panasonic.com>
-Date: Wed, 3 Dec 2014 10:22:50 +0900
-Subject: [PATCH] tools: env: fix build error
-
-Since CONFIG_SYS_ARCH, CONFIG_SYS_CPU, ... were moved to Kconfig,
-tools/env/fw_printenv fails to build if CONFIG_ENV_VARS_UBOOT_CONFIG
-is defined.
-(I do not think this is the right way to fix the problem, but
-for now I do not have enough time to take a close look.)
-
-Upstream-Status: Submitted [http://patchwork.ozlabs.org/patch/417192/]
-
-Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
-Reported-by: Denys Dmytriyenko <denys@ti.com>
----
- tools/env/fw_env.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/tools/env/fw_env.c b/tools/env/fw_env.c
-index 1173eea..698fe51 100644
---- a/tools/env/fw_env.c
-+++ b/tools/env/fw_env.c
-@@ -8,6 +8,9 @@
-  * SPDX-License-Identifier:	GPL-2.0+
-  */
- 
-+/* FIXME: Do not include this */
-+#include <linux/kconfig.h>
-+
- #include <errno.h>
- #include <env_flags.h>
- #include <fcntl.h>
--- 
-2.2.0
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.07.bb
similarity index 79%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.07.bb
index b310b0d..0df7a05 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.07.bb
@@ -1,18 +1,17 @@
 SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=0507cd7da8e7ad6d6701926ec9b84c95"
 SECTION = "bootloader"
 DEPENDS = "mtd-utils"
 
-# This revision corresponds to the tag "v2015.01"
+# This revision corresponds to the tag "v2015.07"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "92fa7f53f1f3f03296f8ffb14bdf1baefab83368"
+SRCREV = "33711bdd4a4dce942fb5ae85a68899a8357bdd94"
 
-PV = "v2015.01+git${SRCPV}"
+PV = "v2015.07+git${SRCPV}"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
-           file://0001-tools-env-fix-build-error.patch"
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage/gcc5.patch b/meta/recipes-bsp/u-boot/u-boot-mkimage/gcc5.patch
deleted file mode 100644
index 12db94c..0000000
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage/gcc5.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-Upstream-Status: Backport
-
-From 478b02f1a7043b673565075ea5016376f3293b23 Mon Sep 17 00:00:00 2001
-From: Hans de Goede <hdegoede@redhat.com>
-Date: Sat, 7 Feb 2015 22:52:40 +0100
-Subject: [PATCH] Add linux/compiler-gcc5.h to fix builds with gcc5
-
-Add linux/compiler-gcc5/h from the kernel sources at:
-
-commit 5631b8fba640a4ab2f8a954f63a603fa34eda96b
-Author: Steven Noonan <steven@uplinklabs.net>
-Date:   Sat Oct 25 15:09:42 2014 -0700
-
-    compiler/gcc4+: Remove inaccurate comment about 'asm goto' miscompiles
-
-Signed-off-by: Hans de Goede <hdegoede@redhat.com>
----
- include/linux/compiler-gcc5.h |   65 +++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 65 insertions(+)
- create mode 100644 include/linux/compiler-gcc5.h
-
-Index: git/include/linux/compiler-gcc5.h
-===================================================================
---- /dev/null
-+++ git/include/linux/compiler-gcc5.h
-@@ -0,0 +1,65 @@
-+#ifndef __LINUX_COMPILER_H
-+#error "Please don't include <linux/compiler-gcc5.h> directly, include <linux/compiler.h> instead."
-+#endif
-+
-+#define __used				__attribute__((__used__))
-+#define __must_check			__attribute__((warn_unused_result))
-+#define __compiler_offsetof(a, b)	__builtin_offsetof(a, b)
-+
-+/* Mark functions as cold. gcc will assume any path leading to a call
-+   to them will be unlikely.  This means a lot of manual unlikely()s
-+   are unnecessary now for any paths leading to the usual suspects
-+   like BUG(), printk(), panic() etc. [but let's keep them for now for
-+   older compilers]
-+
-+   Early snapshots of gcc 4.3 don't support this and we can't detect this
-+   in the preprocessor, but we can live with this because they're unreleased.
-+   Maketime probing would be overkill here.
-+
-+   gcc also has a __attribute__((__hot__)) to move hot functions into
-+   a special section, but I don't see any sense in this right now in
-+   the kernel context */
-+#define __cold			__attribute__((__cold__))
-+
-+#define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
-+
-+#ifndef __CHECKER__
-+# define __compiletime_warning(message) __attribute__((warning(message)))
-+# define __compiletime_error(message) __attribute__((error(message)))
-+#endif /* __CHECKER__ */
-+
-+/*
-+ * Mark a position in code as unreachable.  This can be used to
-+ * suppress control flow warnings after asm blocks that transfer
-+ * control elsewhere.
-+ *
-+ * Early snapshots of gcc 4.5 don't support this and we can't detect
-+ * this in the preprocessor, but we can live with this because they're
-+ * unreleased.  Really, we need to have autoconf for the kernel.
-+ */
-+#define unreachable() __builtin_unreachable()
-+
-+/* Mark a function definition as prohibited from being cloned. */
-+#define __noclone	__attribute__((__noclone__))
-+
-+/*
-+ * Tell the optimizer that something else uses this function or variable.
-+ */
-+#define __visible __attribute__((externally_visible))
-+
-+/*
-+ * GCC 'asm goto' miscompiles certain code sequences:
-+ *
-+ *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
-+ *
-+ * Work it around via a compiler barrier quirk suggested by Jakub Jelinek.
-+ *
-+ * (asm goto is automatically volatile - the naming reflects this.)
-+ */
-+#define asm_volatile_goto(x...)	do { asm goto(x); asm (""); } while (0)
-+
-+#ifdef CONFIG_ARCH_USE_BUILTIN_BSWAP
-+#define __HAVE_BUILTIN_BSWAP32__
-+#define __HAVE_BUILTIN_BSWAP64__
-+#define __HAVE_BUILTIN_BSWAP16__
-+#endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.07.bb
similarity index 65%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2015.07.bb
index 7735288..ba29bbb 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.07.bb
@@ -1,20 +1,18 @@
 SUMMARY = "U-Boot bootloader image creation tool"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=0507cd7da8e7ad6d6701926ec9b84c95"
 SECTION = "bootloader"
 
 DEPENDS = "openssl"
 
-# This revision corresponds to the tag "v2015.01"
+# This revision corresponds to the tag "v2015.07"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "92fa7f53f1f3f03296f8ffb14bdf1baefab83368"
+SRCREV = "33711bdd4a4dce942fb5ae85a68899a8357bdd94"
 
-PV = "v2015.01+git${SRCPV}"
+PV = "v2015.07+git${SRCPV}"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
-           file://gcc5.patch \
-	   "
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 88e239d..c76f87f 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -4,7 +4,7 @@ SECTION = "bootloaders"
 PROVIDES = "virtual/bootloader"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=0507cd7da8e7ad6d6701926ec9b84c95"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot/0001-u-boot-mpc85xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch b/meta/recipes-bsp/u-boot/u-boot/0001-u-boot-mpc85xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch
deleted file mode 100644
index faf2985..0000000
--- a/meta/recipes-bsp/u-boot/u-boot/0001-u-boot-mpc85xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch
+++ /dev/null
@@ -1,190 +0,0 @@
-From 9ba002f1b1afc7af84a352f4ecab32a30d7ba353 Mon Sep 17 00:00:00 2001
-From: Zhenhua Luo <zhenhua.luo@freescale.com>
-Date: Mon, 9 Feb 2015 18:33:56 +0800
-Subject: [PATCH] powerpc/cpu/*/u-boot*.lds: remove _GLOBAL_OFFSET_TABLE_
- definition
-
-In binutils-2.25, the _GLOBAL_OFFSET_TABLE_ symbols defined by PROVIDE in
-u-boot.lds overrides the linker built-in symbols
-(https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=b893397a4b1316610f49819344817715e4305de9),
-so the linker is treating _GLOBAL_OFFSET_TABLE_ as a definition into the .reloc section.
-
-To align with the change of binutils-2.25, the _GLOBAL_OFFSET_TABLE_ symbol
-should not be defined in sections, and the symbols in linker generated .got
-section should be used(https://sourceware.org/ml/binutils/2008-09/msg00122.html).
-
-Fixed the following build errors with binutils-2.25:
-| powerpc-poky-linux-gnuspe-ld.bfd: _GLOBAL_OFFSET_TABLE_ not defined in linker created .got
-
-Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
-
-Upstream-Status: Pending
-
-Index: git/arch/powerpc/cpu/mpc85xx/u-boot-nand.lds
-===================================================================
---- git.orig/arch/powerpc/cpu/mpc85xx/u-boot-nand.lds
-+++ git/arch/powerpc/cpu/mpc85xx/u-boot-nand.lds
-@@ -44,7 +44,6 @@ SECTIONS
-     _GOT2_TABLE_ = .;
-     KEEP(*(.got2))
-     KEEP(*(.got))
--    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
-     _FIXUP_TABLE_ = .;
-     KEEP(*(.fixup))
-   }
-Index: git/arch/powerpc/cpu/mpc85xx/u-boot-nand_spl.lds
-===================================================================
---- git.orig/arch/powerpc/cpu/mpc85xx/u-boot-nand_spl.lds
-+++ git/arch/powerpc/cpu/mpc85xx/u-boot-nand_spl.lds
-@@ -22,7 +22,6 @@ SECTIONS
- 		_GOT2_TABLE_ = .;
- 		KEEP(*(.got2))
- 		KEEP(*(.got))
--		PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
- 		_FIXUP_TABLE_ = .;
- 		KEEP(*(.fixup))
- 	}
-Index: git/arch/powerpc/cpu/mpc85xx/u-boot-spl.lds
-===================================================================
---- git.orig/arch/powerpc/cpu/mpc85xx/u-boot-spl.lds
-+++ git/arch/powerpc/cpu/mpc85xx/u-boot-spl.lds
-@@ -29,7 +29,6 @@ SECTIONS
- 		_GOT2_TABLE_ = .;
- 		KEEP(*(.got2))
- 		KEEP(*(.got))
--		PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
- 		_FIXUP_TABLE_ = .;
- 		KEEP(*(.fixup))
- 	}
-Index: git/arch/powerpc/cpu/mpc85xx/u-boot.lds
-===================================================================
---- git.orig/arch/powerpc/cpu/mpc85xx/u-boot.lds
-+++ git/arch/powerpc/cpu/mpc85xx/u-boot.lds
-@@ -50,7 +50,6 @@ SECTIONS
-     _GOT2_TABLE_ = .;
-     KEEP(*(.got2))
-     KEEP(*(.got))
--    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
-     _FIXUP_TABLE_ = .;
-     KEEP(*(.fixup))
-   }
-Index: git/arch/powerpc/cpu/mpc8260/u-boot.lds
-===================================================================
---- git.orig/arch/powerpc/cpu/mpc8260/u-boot.lds
-+++ git/arch/powerpc/cpu/mpc8260/u-boot.lds
-@@ -27,7 +27,6 @@ SECTIONS
-     _GOT2_TABLE_ = .;
-     KEEP(*(.got2))
-     KEEP(*(.got))
--    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
-     _FIXUP_TABLE_ = .;
-     KEEP(*(.fixup))
-   }
-Index: git/arch/powerpc/cpu/74xx_7xx/u-boot.lds
-===================================================================
---- git.orig/arch/powerpc/cpu/74xx_7xx/u-boot.lds
-+++ git/arch/powerpc/cpu/74xx_7xx/u-boot.lds
-@@ -30,7 +30,6 @@ SECTIONS
-     _GOT2_TABLE_ = .;
-     KEEP(*(.got2))
-     KEEP(*(.got))
--    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
-     _FIXUP_TABLE_ = .;
-     KEEP(*(.fixup))
-   }
-Index: git/arch/powerpc/cpu/mpc512x/u-boot.lds
-===================================================================
---- git.orig/arch/powerpc/cpu/mpc512x/u-boot.lds
-+++ git/arch/powerpc/cpu/mpc512x/u-boot.lds
-@@ -24,7 +24,6 @@ SECTIONS
-     _GOT2_TABLE_ = .;
-     KEEP(*(.got2))
-     KEEP(*(.got))
--    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
-     _FIXUP_TABLE_ = .;
-     KEEP(*(.fixup))
-     *(.fixup)
-Index: git/arch/powerpc/cpu/mpc5xx/u-boot.lds
-===================================================================
---- git.orig/arch/powerpc/cpu/mpc5xx/u-boot.lds
-+++ git/arch/powerpc/cpu/mpc5xx/u-boot.lds
-@@ -33,7 +33,6 @@ SECTIONS
-     _GOT2_TABLE_ = .;
-     KEEP(*(.got2))
-     KEEP(*(.got))
--    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
-     _FIXUP_TABLE_ = .;
-     KEEP(*(.fixup))
-   }
-Index: git/arch/powerpc/cpu/mpc5xxx/u-boot.lds
-===================================================================
---- git.orig/arch/powerpc/cpu/mpc5xxx/u-boot.lds
-+++ git/arch/powerpc/cpu/mpc5xxx/u-boot.lds
-@@ -28,7 +28,6 @@ SECTIONS
-     _GOT2_TABLE_ = .;
-     KEEP(*(.got2))
-     KEEP(*(.got))
--    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
-     _FIXUP_TABLE_ = .;
-     KEEP(*(.fixup))
-   }
-Index: git/arch/powerpc/cpu/mpc83xx/u-boot-spl.lds
-===================================================================
---- git.orig/arch/powerpc/cpu/mpc83xx/u-boot-spl.lds
-+++ git/arch/powerpc/cpu/mpc83xx/u-boot-spl.lds
-@@ -24,7 +24,6 @@ SECTIONS
- 		_GOT2_TABLE_ = .;
- 		KEEP(*(.got2))
- 		KEEP(*(.got))
--		PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
- 	}
- 	__got2_entries = ((_GLOBAL_OFFSET_TABLE_ - _GOT2_TABLE_) >> 2) - 1;
- 
-Index: git/arch/powerpc/cpu/mpc83xx/u-boot.lds
-===================================================================
---- git.orig/arch/powerpc/cpu/mpc83xx/u-boot.lds
-+++ git/arch/powerpc/cpu/mpc83xx/u-boot.lds
-@@ -26,7 +26,6 @@ SECTIONS
-     _GOT2_TABLE_ = .;
-     KEEP(*(.got2))
-     KEEP(*(.got))
--    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
-     _FIXUP_TABLE_ = .;
-     KEEP(*(.fixup))
-   }
-Index: git/arch/powerpc/cpu/mpc86xx/u-boot.lds
-===================================================================
---- git.orig/arch/powerpc/cpu/mpc86xx/u-boot.lds
-+++ git/arch/powerpc/cpu/mpc86xx/u-boot.lds
-@@ -32,7 +32,6 @@ SECTIONS
-     _GOT2_TABLE_ = .;
-     KEEP(*(.got2))
-     KEEP(*(.got))
--    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
-     _FIXUP_TABLE_ = .;
-     KEEP(*(.fixup))
-   }
-Index: git/arch/powerpc/cpu/mpc8xx/u-boot.lds
-===================================================================
---- git.orig/arch/powerpc/cpu/mpc8xx/u-boot.lds
-+++ git/arch/powerpc/cpu/mpc8xx/u-boot.lds
-@@ -34,7 +34,6 @@ SECTIONS
-     _GOT2_TABLE_ = .;
-     KEEP(*(.got2))
-     KEEP(*(.got))
--    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
-     _FIXUP_TABLE_ = .;
-     KEEP(*(.fixup))
-   }
-Index: git/arch/powerpc/cpu/ppc4xx/u-boot.lds
-===================================================================
---- git.orig/arch/powerpc/cpu/ppc4xx/u-boot.lds
-+++ git/arch/powerpc/cpu/ppc4xx/u-boot.lds
-@@ -46,7 +46,6 @@ SECTIONS
-     _GOT2_TABLE_ = .;
-     KEEP(*(.got2))
-     KEEP(*(.got))
--    PROVIDE(_GLOBAL_OFFSET_TABLE_ = . + 4);
-     _FIXUP_TABLE_ = .;
-     KEEP(*(.fixup))
-   }
diff --git a/meta/recipes-bsp/u-boot/u-boot_2015.01.bb b/meta/recipes-bsp/u-boot/u-boot_2015.01.bb
deleted file mode 100644
index 70a1e54..0000000
--- a/meta/recipes-bsp/u-boot/u-boot_2015.01.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require u-boot.inc
-
-DEPENDS += "dtc-native"
-
-SRC_URI += "file://0001-u-boot-mpc85xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch"
-
-# This revision corresponds to the tag "v2015.01"
-# We use the revision in order to avoid having to fetch it from the repo during parse
-SRCREV = "92fa7f53f1f3f03296f8ffb14bdf1baefab83368"
-
-PV = "v2015.01+git${SRCPV}"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2015.07.bb b/meta/recipes-bsp/u-boot/u-boot_2015.07.bb
new file mode 100644
index 0000000..9eb8f96
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot_2015.07.bb
@@ -0,0 +1,10 @@
+require u-boot.inc
+
+DEPENDS += "dtc-native"
+
+# This revision corresponds to the tag "v2015.07"
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "33711bdd4a4dce942fb5ae85a68899a8357bdd94"
+
+PV = "v2015.07+git${SRCPV}"
-- 
2.4.5


