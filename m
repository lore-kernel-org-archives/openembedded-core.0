Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 4EE076C30B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 20:21:12 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
	by smtprelay.synopsys.com (Postfix) with ESMTP id D83C210C0461;
	Tue, 20 Nov 2018 12:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1542745273; bh=s22xgGFq744/STyF5NqrjQQtvKfxiAv3j1/GKOb1Gd0=;
	h=From:To:Cc:Subject:Date:From;
	b=FVbyIaJJGFphgQsTZPFxUzX514q7b19Dnl+TyNkeFr+VPYDVnPxp/IsTv6/L80E6J
	rBxwDIxfmGMWcBY/ZXCgIablV2mqrI18CX6vfixeSJ8dTnwUKHqH0QvFPz3hgbX0F8
	sR1r9FFVbDxL8bxdjZldoM8Ka4L5boS4BHLFJS07rJqjh2b6HZTywWlSODf3mkN3nH
	tUKU5fdjaYi1iEnxtC4SZFs4Vxcibn0VlfsS4w96Kwu2otcC39W8ezJbXk2LJs2fHq
	Ip+F9FnIGZ56z3OeSsizjhDehliGScmQUPTfmypVX3pIymKvlxHlIOWgqzRa8aoxOx
	0OyjEWby/0vwg==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 7DB34360B;
	Tue, 20 Nov 2018 12:21:09 -0800 (PST)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 23:21:07 +0300
Message-Id: <20181120202107.41029-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	Alexey Brodkin <alexey.brodkin@synopsys.com>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH v4] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Tue, 20 Nov 2018 20:21:12 -0000

This utility is used for creation of images containing
usable in run-time U-Boot environment.

As of today this utility is added per-board like here [1]
for Intel Edison board.

[1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb

Given there're quite some U-Boot tools that we may want to add later
this recipe name switch from "u-boot-mkimage" to generic "u-boot-tools"
still for compatibility we provide "u-boot-mkimage" with help
of PROVIDES as well as proposed "u-boot-mkenvimage".

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Marek Vasut <marex@denx.de>
---

I may "git grep u-boot-mkimage" in more places:
 1. meta/classes/image_types.bbclass:311:CONVERSION_DEPENDS_u-boot = "u-boot-mkimage-native"
 2. meta/classes/kernel-fitimage.bbclass:7:        depends = "%s u-boot-mkimage-native dtc-native" % depends
 3. meta/classes/kernel-uimage.bbclass:6:        depends = "%s u-boot-mkimage-native" % depends
 4. meta/conf/distro/include/distro_alias.inc:357:DISTRO_PN_ALIAS_pn-u-boot-mkimage = "Ubuntu=uboot-mkimage Debian=uboot-mkimage"

But that's not clear for me if it's required to swap "u-boot-mkimage"
to "u-boot-tools" see:
 1. "u-boot-mkimage" is still a valid recipe as we export ot via PROVIDES
    (or I'm mixing package name with recipe name which very well might be
     the case)
 2. I don't fully understand a mening of "DISTRO_PN_ALIAS".
    If that's a name of a package from some big Linux distro or how target
    utility is named in that distro. For example in Debian Sid there's
    a package named "u-boot-tools" which includes "mkimage", "mkenvimage",
    "fw_printenv", "fw_setenv" and many more while in "distro_alias.inc"
    we still have:
    ---------------->8----------------
    DISTRO_PN_ALIAS_pn-u-boot-mkimage = "Ubuntu=uboot-mkimage Debian=uboot-mkimage"
    ---------------->8----------------

Changes v3 -> v4:
 * Updated maintainer info to make Yocto autobuilder happy again

Changes v2 -> v3:
 * Recipe renamed to "u-boot-tools" to better match its contents
   (especially in the future as we add more tools there)
 * Existing "u-boot-mkimage" and newly introduced "u-boot-mkenvimage"
   made avaialble via PROVIDES

Changes v1 -> v2:
 * Got rid of a separate recipe and instead added mkenvimage
   to u-boot mkimage recipe

 meta/conf/distro/include/maintainers.inc                         | 2 +-
 .../{u-boot-mkimage_2018.07.bb => u-boot-tools_2018.07.bb}       | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2018.07.bb => u-boot-tools_2018.07.bb} (83%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0889c1c429..825c24a3f8 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -654,7 +654,7 @@ RECIPE_MAINTAINER_pn-tzcode-native = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-tzdata = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-u-boot = "Marek Vasut <marek.vasut@gmail.com>"
 RECIPE_MAINTAINER_pn-u-boot-fw-utils = "Marek Vasut <marek.vasut@gmail.com>"
-RECIPE_MAINTAINER_pn-u-boot-mkimage = "Marek Vasut <marek.vasut@gmail.com>"
+RECIPE_MAINTAINER_pn-u-boot-tools = "Marek Vasut <marek.vasut@gmail.com>"
 RECIPE_MAINTAINER_pn-udev-extraconf = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-unfs3 = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-unifdef = "Ross Burton <ross.burton@intel.com>"
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2018.07.bb
similarity index 83%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2018.07.bb
index 08bff1d161..140afa8dfe 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2018.07.bb
@@ -1,7 +1,8 @@
 require u-boot-common_${PV}.inc
 
-SUMMARY = "U-Boot bootloader image creation tool"
+SUMMARY = "U-Boot bootloader tools"
 DEPENDS += "openssl"
+PROVIDES = "u-boot-mkimage u-boot-mkenvimage"
 
 EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
@@ -20,8 +21,14 @@ do_compile () {
 
 do_install () {
 	install -d ${D}${bindir}
+
+	# mkimage
 	install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
 	ln -sf uboot-mkimage ${D}${bindir}/mkimage
+
+	# mkenvimage
+	install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
+	ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
 }
 
 RDEPENDS_${PN} += "dtc"
-- 
2.16.2


