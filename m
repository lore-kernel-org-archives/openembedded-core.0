Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id B2DCF60110
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 04:00:48 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 1115410C0839;
	Wed, 14 Nov 2018 20:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1542254449; bh=cTt7NdE/o2JgxlxOgJBtQiwpZ3QEvE8EID+jVUXGzy0=;
	h=From:To:Cc:Subject:Date:From;
	b=RytBHSV2NyMNiVs9oUF4DH723EZzkPg1VCSzFyqh4n7U1VPYMqBTKWqMEN8pAMdEO
	bJi1+bj3iPp/RbOEkPG6TCDMuQhXmS3z8JCPER7nEg8ixVAdy9qDVlLVK8Zf+jmCoG
	/Yf6cSUY7AXp1fTicNJ4mNajXRNZgZJY+5i1RUUFORxGwHoOTBo0KT5MtTMvbGbzv2
	R7mZY1xNN+R8ebIHKJWkfE4ztg00BT4ssS877b+7yJTT90ij+aJGstwG3IrD8oBQeD
	P8Fs4cmT2BHC2Xl6klJTUk1o64wo2wFgb1ivi6cE1joEdAMCO7UGZjhGvaGlHcSzRr
	iYSbD8MiWmHTw==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 57A833906;
	Wed, 14 Nov 2018 20:00:46 -0800 (PST)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2018 07:00:43 +0300
Message-Id: <20181115040043.9326-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	Alexey Brodkin <alexey.brodkin@synopsys.com>,
	linux-snps-arc@lists.infradead.org,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Subject: [PATCH] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Thu, 15 Nov 2018 04:00:48 -0000

This utility is used for creation of images containing
usable in run-time U-Boot environment.

As of today this utility is added per-board like here [1]
for Intel Edison board, here [2] for Altera's SoCFPGA and
I may guess there're others so instead of adding another one for
ARC why don't we package it for each and everyone.

[1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
[2] https://github.com/kraj/meta-altera/blob/master/recipes-bsp/u-boot/u-boot-mkenvimage_v2016.11.bb

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Marek Vasut <marex@denx.de>
---
 .../u-boot/u-boot-mkenvimage_2018.07.bb            | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkenvimage_2018.07.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkenvimage_2018.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkenvimage_2018.07.bb
new file mode 100644
index 0000000000..4770f3db08
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-mkenvimage_2018.07.bb
@@ -0,0 +1,27 @@
+require u-boot-common_${PV}.inc
+
+SUMMARY = "U-Boot bootloader environment image creation tool"
+DEPENDS += "openssl"
+
+EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
+EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
+EXTRA_OEMAKE_class-nativesdk = 'CROSS_COMPILE="${HOST_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
+
+do_compile () {
+	oe_runmake sandbox_defconfig
+
+	# Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
+	# generating it requires bin2header tool, which for target build
+	# is built with target tools and thus cannot be executed on host.
+	sed -i "s/CONFIG_CMD_LICENSE=.*/# CONFIG_CMD_LICENSE is not set/" .config
+
+	oe_runmake cross_tools NO_SDL=1
+}
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
+	ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.16.2


