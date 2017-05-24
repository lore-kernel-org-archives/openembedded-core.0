Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 6692C780A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 20:44:59 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3wY4CG407gz1qtHR;
	Wed, 24 May 2017 22:44:58 +0200 (CEST)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3wY4CG3660z3hmt6;
	Wed, 24 May 2017 22:44:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id R5vysrm4bob0; Wed, 24 May 2017 22:44:56 +0200 (CEST)
X-Auth-Info: VJ2Ef0EmwJJoGbV3vwQI/ZfStd1Eo0p+FYmMfDtiMWc=
Received: from chi.lan (unknown [195.140.253.167])
	by mail.mnet-online.de (Postfix) with ESMTPA;
	Wed, 24 May 2017 22:44:56 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 May 2017 22:44:41 +0200
Message-Id: <20170524204441.2565-1-marex@denx.de>
X-Mailer: git-send-email 2.11.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] u-boot: Update to 2017.05 release
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
X-List-Received-Date: Wed, 24 May 2017 20:45:01 -0000

Upgrade U-Boot to the latest version.

Since the latest version has the default gcc patch in it, drop it.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Denys Dmytriyenko <denis@denix.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/u-boot/files/default-gcc.patch    | 39 ----------------------
 ...ommon_2017.01.inc => u-boot-common_2017.05.inc} |  2 +-
 ...utils_2017.01.bb => u-boot-fw-utils_2017.05.bb} |  2 --
 ...kimage_2017.01.bb => u-boot-mkimage_2017.05.bb} |  2 --
 .../{u-boot_2017.01.bb => u-boot_2017.05.bb}       |  0
 5 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/default-gcc.patch
 rename meta/recipes-bsp/u-boot/{u-boot-common_2017.01.inc => u-boot-common_2017.05.inc} (86%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.01.bb => u-boot-fw-utils_2017.05.bb} (96%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.01.bb => u-boot-mkimage_2017.05.bb} (96%)
 rename meta/recipes-bsp/u-boot/{u-boot_2017.01.bb => u-boot_2017.05.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/files/default-gcc.patch b/meta/recipes-bsp/u-boot/files/default-gcc.patch
deleted file mode 100644
index 04184df8b3..0000000000
--- a/meta/recipes-bsp/u-boot/files/default-gcc.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-OE needs to be able to change the default compiler. If we pass in HOSTCC
-through the make command, it overwrites not only this setting but also the 
-setting in tools/Makefile wrapped in ifneq ($(CROSS_BUILD_TOOLS),) which 
-breaks the build.
-
-We therefore use override to ensure the value of HOSTCC is overwritten when
-needed.
-
-RP: Updated the patch to the version being submitted to upstream u-boot
-
-Upstream-Status: Submitted [emailed to Masahiro Yamada for discussion]
-RP 2017/3/11
-
-Index: git/tools/Makefile
-===================================================================
---- git.orig/tools/Makefile
-+++ git/tools/Makefile
-@@ -262,7 +262,7 @@ $(LICENSE_H): $(obj)/bin2header $(srctre
- subdir- += env
- 
- ifneq ($(CROSS_BUILD_TOOLS),)
--HOSTCC = $(CC)
-+override HOSTCC = $(CC)
- 
- quiet_cmd_crosstools_strip = STRIP   $^
-       cmd_crosstools_strip = $(STRIP) $^; touch $@
-Index: git/tools/env/Makefile
-===================================================================
---- git.orig/tools/env/Makefile
-+++ git/tools/env/Makefile
-@@ -8,7 +8,7 @@
- # fw_printenv is supposed to run on the target system, which means it should be
- # built with cross tools. Although it may look weird, we only replace "HOSTCC"
- # with "CC" here for the maximum code reuse of scripts/Makefile.host.
--HOSTCC = $(CC)
-+override HOSTCC = $(CC)
- 
- # Compile for a hosted environment on the target
- HOST_EXTRACFLAGS  = $(patsubst -I%,-idirafter%, $(filter -I%, $(UBOOTINCLUDE))) \
diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
similarity index 86%
rename from meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
rename to meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
index df24c853dd..3719aee52d 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
@@ -7,7 +7,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "a705ebc81b7f91bbd0ef7c634284208342901149"
+SRCREV = "64c4ffa9fa223f7ae8640f9c8f3044bfa0e3bfda"
 
 SRC_URI = "git://git.denx.de/u-boot.git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
similarity index 96%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
index 26314990b9..c2e8f0fb84 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
@@ -1,7 +1,5 @@
 require u-boot-common_${PV}.inc
 
-SRC_URI += "file://default-gcc.patch"
-
 SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
 DEPENDS = "mtd-utils"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.05.bb
similarity index 96%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.05.bb
index 1aa95e7c86..50e2acb9ea 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.05.bb
@@ -1,7 +1,5 @@
 require u-boot-common_${PV}.inc
 
-SRC_URI += "file://default-gcc.patch"
-
 SUMMARY = "U-Boot bootloader image creation tool"
 DEPENDS = "openssl"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot_2017.05.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2017.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2017.05.bb
-- 
2.11.0


