Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay4.synopsys.com [198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id AA7A06C191
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 12:43:44 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
	by smtprelay.synopsys.com (Postfix) with ESMTP id A19B724E0F92;
	Thu, 15 Nov 2018 04:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1542285825; bh=70uEOHouIJkz7cZ7UB3UPVmHyEEp6Jswa+Rj0AVWGnc=;
	h=From:To:Cc:Subject:Date:From;
	b=j6xnmzK54FCoHryMMWK8qiCCJCT0eMrumq7yYY2lYYT874CNq00xQRow0sQAwVE2i
	ZpaD+N/SXs1zQhpoe0DhpIMZFSevIdMRCZ9ZwhJxcI8peLak2FpbkS//0rjRo4VeNy
	oqNxOfTfvzaDugzl+1KgdVKwXKaaTyWXe/+xwU0mkCCTK9e/Am0bU4Ue/lzwXss20j
	KTxBfGp1K4WvkLNoQGBZo0Yb3LV0s2KEWVPPH7H7DTh7Y8Ie6FynuRnxkjeKfrrI2R
	O926UJKvtomWXKUhupUF03vJTa5fYalPyMv4OmepVZOVIvIGpDcHoxcKnqbjdsafH+
	TjEAm/44WaOmQ==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id E5B0F325A;
	Thu, 15 Nov 2018 04:43:41 -0800 (PST)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2018 15:43:39 +0300
Message-Id: <20181115124339.19543-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	Alexey Brodkin <alexey.brodkin@synopsys.com>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH v2] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Thu, 15 Nov 2018 12:43:44 -0000

This utility is used for creation of images containing
usable in run-time U-Boot environment.

Note it is already gets built with "make tools" command
together with "mkimage" so we just need to install "mkenvimage".

As of today this utility is added per-board like here [1]
for Intel Edison board.

[1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Marek Vasut <marex@denx.de>
---

Chnages v1 -> v2:

 * Got rid of a separate recipe and instead added mkenvimage
   to u-boot mkimage recipy

 meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
index 08bff1d161..8a8a1ed449 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
@@ -1,6 +1,6 @@
 require u-boot-common_${PV}.inc
 
-SUMMARY = "U-Boot bootloader image creation tool"
+SUMMARY = "U-Boot bootloader environment & image creation tools"
 DEPENDS += "openssl"
 
 EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
@@ -20,8 +20,14 @@ do_compile () {
 
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


