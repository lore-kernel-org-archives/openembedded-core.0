Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 450726FF76
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 18:20:14 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3tCLMf3vM0z3hj2R;
	Mon,  7 Nov 2016 19:20:14 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3tCLMf3dB8zvkvK;
	Mon,  7 Nov 2016 19:20:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id BmUNmaPqnNpo; Mon,  7 Nov 2016 19:20:13 +0100 (CET)
X-Auth-Info: Tg6bheSt0037Uu9jeTw7n48sOuiwzfvYJ1BKv+LPuIo=
Received: from chi.lan (unknown [195.140.253.167])
	by mail.mnet-online.de (Postfix) with ESMTPA;
	Mon,  7 Nov 2016 19:20:12 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2016 19:20:06 +0100
Message-Id: <20161107182006.4207-1-marex@denx.de>
X-Mailer: git-send-email 2.9.3
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] u-boot: mkimage: Fix build of u-boot-mkimage
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
X-List-Received-Date: Mon, 07 Nov 2016 18:20:16 -0000

The build failed on qemux86-64 because it couldn't execute
tools/bin2header on a host due to it being compiled with target
toolchain. Drop the incorrect EXTRA_OEMAKE, U-Boot Kbuild/Kconfig
respects the flags from OE. Moreover, since U-Boot buildsystem
already strips the tools, add INSANE_SKIP = "already-stripped" .

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
index 5025961..8adc1e6 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
@@ -3,10 +3,19 @@ require u-boot-common_${PV}.inc
 SUMMARY = "U-Boot bootloader image creation tool"
 DEPENDS = "openssl"
 
-EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" STRIP=true V=1'
+EXTRA_OEMAKE = 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
+EXTRA_OEMAKE_append_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" STRIP=true V=1'
+EXTRA_OEMAKE_append_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
+EXTRA_OEMAKE_append_class-nativesdk = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 
 do_compile () {
 	oe_runmake sandbox_defconfig
+
+	# Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
+	# generating it requires bin2header tool, which for target build
+	# is built with target tools and thus cannot be executed on host.
+	sed -i "s/CONFIG_CMD_LICENSE.*/# CONFIG_CMD_LICENSE is not set/" .config
+
 	oe_runmake cross_tools NO_SDL=1
 }
 
-- 
2.9.3


