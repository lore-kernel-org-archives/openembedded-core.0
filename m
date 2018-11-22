Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id 8E85760401
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 08:28:37 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id C25C424E0E29;
	Thu, 22 Nov 2018 00:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1542875319; bh=2Z0q8Z9JZKIyED42E7OKrrFpZYyZzOpWqvkhEyKW+DU=;
	h=From:To:Cc:Subject:Date:From;
	b=bntU7DXK0puDNFRu1taSlFihGL82dO9F1iqNlfX02Vy5s7p9019cQHZiGmEx06o8C
	QIqRoODXHLYiTUeiCEj4fPgX6l2Gsg5qfqRIlerD3KkiRt2whAe0sk3uLYrv9WHLDv
	fC9OP7FlF8dlcT7Ai3rxBJGERwL571Ov9x2ZErWhHOkzjzE4712K0IRaePamSCayyQ
	V6Knz+folVPTvS0Du/48hFcqaBnxYUA5GukTEPbPI5jRIGp2BTs85ndimmJZUdRKWu
	mSnQiZH8tgizzscM01VmEIaAv9kS7H/UHau44xdZtxrg7obCmg2K5okYB52lHta+dq
	wUqOJt7Iey1vg==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id F10B95156;
	Thu, 22 Nov 2018 00:28:35 -0800 (PST)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 11:28:07 +0300
Message-Id: <20181122082807.39508-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	Alexey Brodkin <alexey.brodkin@synopsys.com>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH v6] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Thu, 22 Nov 2018 08:28:38 -0000

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

Changes v5 -> v6:
 * Really enable separate  pakaging of mkimage and mkenvimage

Changes v4 -> v5:
 * Added backward compatibility with "u-boot-mkimage" recipe
 * Improved handling of nativesdk
 * Update all references from "u-boot-mkimage" to "u-boot-tools"

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


 meta/classes/image_types.bbclass                   |  2 +-
 meta/classes/kernel-fitimage.bbclass               |  2 +-
 meta/classes/kernel-uimage.bbclass                 |  2 +-
 meta/conf/distro/include/distro_alias.inc          |  2 +-
 meta/conf/distro/include/maintainers.inc           |  2 +-
 ...-mkimage_2018.07.bb => u-boot-tools_2018.07.bb} | 26 ++++++++++++++++++++--
 6 files changed, 29 insertions(+), 7 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2018.07.bb => u-boot-tools_2018.07.bb} (56%)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 05e5b0a2e0..5c406481ef 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -308,7 +308,7 @@ CONVERSION_DEPENDS_lzo = "lzop-native"
 CONVERSION_DEPENDS_zip = "zip-native"
 CONVERSION_DEPENDS_sum = "mtd-utils-native"
 CONVERSION_DEPENDS_bmap = "bmap-tools-native"
-CONVERSION_DEPENDS_u-boot = "u-boot-mkimage-native"
+CONVERSION_DEPENDS_u-boot = "u-boot-tools-native"
 CONVERSION_DEPENDS_vmdk = "qemu-native"
 CONVERSION_DEPENDS_vdi = "qemu-native"
 CONVERSION_DEPENDS_qcow2 = "qemu-native"
diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 4c4fd99ff4..328bef4069 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -4,7 +4,7 @@ python __anonymous () {
     kerneltypes = d.getVar('KERNEL_IMAGETYPES') or ""
     if 'fitImage' in kerneltypes.split():
         depends = d.getVar("DEPENDS")
-        depends = "%s u-boot-mkimage-native dtc-native" % depends
+        depends = "%s u-boot-tools-native dtc-native" % depends
         d.setVar("DEPENDS", depends)
 
         uarch = d.getVar("UBOOT_ARCH")
diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index c2de6bb40d..cedb4fa070 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -3,7 +3,7 @@ inherit kernel-uboot
 python __anonymous () {
     if "uImage" in d.getVar('KERNEL_IMAGETYPES'):
         depends = d.getVar("DEPENDS")
-        depends = "%s u-boot-mkimage-native" % depends
+        depends = "%s u-boot-tools-native" % depends
         d.setVar("DEPENDS", depends)
 
         # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 7502542e89..f23db1e8a4 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -354,7 +354,7 @@ DISTRO_PN_ALIAS_pn-tremor = "OSPDT upstream=http://www.xiph.org/vorbis/"
 DISTRO_PN_ALIAS_pn-ttf-bitstream-vera = "Debian=ttf-bitstream-vera Ubuntu=ttf-bitstream-vera"
 DISTRO_PN_ALIAS_pn-tzcode = "OSPDT"
 DISTRO_PN_ALIAS_pn-u-boot-fw-utils = "Ubuntu=u-boot-tools Debian=u-boot-tools"
-DISTRO_PN_ALIAS_pn-u-boot-mkimage = "Ubuntu=uboot-mkimage Debian=uboot-mkimage"
+DISTRO_PN_ALIAS_pn-u-boot-tools = "Ubuntu=u-boot-tools Debian=uboot-tools"
 DISTRO_PN_ALIAS_pn-udev = "Mandriva=udev Fedora=udev"
 DISTRO_PN_ALIAS_pn-udev-extraconf = "OE-Core"
 DISTRO_PN_ALIAS_pn-unfs3 = "Debian=unfs3 Fedora=unfs3"
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
similarity index 56%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2018.07.bb
index 08bff1d161..b53a727244 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2018.07.bb
@@ -1,8 +1,18 @@
 require u-boot-common_${PV}.inc
 
-SUMMARY = "U-Boot bootloader image creation tool"
+SUMMARY = "U-Boot bootloader tools"
 DEPENDS += "openssl"
 
+PROVIDES = "${MLPREFIX}u-boot-mkimage ${MLPREFIX}u-boot-mkenvimage"
+PROVIDES_class-native = "u-boot-mkimage-native u-boot-mkenvimage-native"
+
+PACKAGES += "${PN}-mkimage ${PN}-mkenvimage"
+
+# Required for backward compatibility with "u-boot-mkimage-xxx.bb"
+RPROVIDES_${PN}-mkimage = "u-boot-mkimage"
+RREPLACES_${PN}-mkimage = "u-boot-mkimage"
+RCONFLICTS_${PN}-mkimage = "u-boot-mkimage"
+
 EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 EXTRA_OEMAKE_class-nativesdk = 'CROSS_COMPILE="${HOST_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
@@ -20,10 +30,22 @@ do_compile () {
 
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
 
-RDEPENDS_${PN} += "dtc"
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN} = ""
+FILES_${PN}-mkimage = "${bindir}/uboot-mkimage ${bindir}/mkimage"
+FILES_${PN}-mkenvimage = "${bindir}/uboot-mkenvimage ${bindir}/mkenvimage"
+
+RDEPENDS_${PN}-mkimage += "dtc"
+RDEPENDS_${PN} += "${PN}-mkimage ${PN}-mkenvimage"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.16.2


