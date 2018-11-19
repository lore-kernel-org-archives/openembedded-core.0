Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 988B56C0CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 10:04:47 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 5311510C11C6;
	Mon, 19 Nov 2018 02:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1542621888; bh=3l0FP/nYI/BQniCB3rRxFyWn84svITgW0Ja6P9VIdgM=;
	h=From:To:Cc:Subject:Date:From;
	b=Z94MCBHFnQ9oW3N53GHpJ9PEfxdXY/SCaENTCau/JfeMwNpFUwo3Ah7pShryak27I
	P4jbhCYBzr6jOp6tF+iH8Fq0m5Vp7hUOZs1UvZnT753/KvEXUODePH88pZJwmTRD0q
	MlLO3SCnrSyQUu91G5JX33sDpqG0emcBXuA74Vm+zjmPYfXFAYZuV3kotbzAbhMjro
	DHFEfjMRe9lur6ztL4/krVDc/nCbh+sQwUlvamNKfVlH0DxfGShj/d06NMIaAxIvG6
	FxH7cNs5keENFhe2z7TYNGbjkJwvT/LJxVnRU4T3LK78vjuQHv0nDslLBP2e6wozpn
	KOJpcO+FFA6WQ==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 8999E4313;
	Mon, 19 Nov 2018 02:04:45 -0800 (PST)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 13:04:43 +0300
Message-Id: <20181119100443.2882-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	Alexey Brodkin <alexey.brodkin@synopsys.com>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH v3] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Mon, 19 Nov 2018 10:04:47 -0000

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

Changes v2 -> v3:
 * Recipe renamed to "u-boot-tools" to better match its contents
   (especially in the future as we add more tools there)
 * Existing "u-boot-mkimage" and newly introduced "u-boot-mkenvimage"
   made avaialble via PROVIDES

Changes v1 -> v2:
 * Got rid of a separate recipe and instead added mkenvimage
   to u-boot mkimage recipy

 .../{u-boot-mkimage_2018.07.bb => u-boot-tools_2018.07.bb}       | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2018.07.bb => u-boot-tools_2018.07.bb} (83%)

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


