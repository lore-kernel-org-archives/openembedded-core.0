Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id EB6E378493
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 15:13:00 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 41Qj4Y73R5z1qtG3;
	Wed, 11 Jul 2018 17:03:25 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 41Qj4Y6Wbcz1qr9H;
	Wed, 11 Jul 2018 17:03:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id O-uVyXq1eai9; Wed, 11 Jul 2018 17:03:24 +0200 (CEST)
X-Auth-Info: XxdqQ3MzXAsufvg/FzLWx0JOGvxUUK81hJDC3VzT1AY=
Received: from kurokawa.lan (ip-86-49-107-50.net.upcbroadband.cz
	[86.49.107.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 11 Jul 2018 17:03:24 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2018 17:03:06 +0200
Message-Id: <20180711150308.30275-2-marex@denx.de>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180711150308.30275-1-marex@denx.de>
References: <20180711150308.30275-1-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/4] u-boot: Add missing dependency on flex and bison native
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
X-List-Received-Date: Wed, 11 Jul 2018 15:13:01 -0000

The U-Boot build, in particular the Kconfig, depends on bison and
flex native. Add the missing dependencies.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/u-boot/u-boot-common_2018.05.inc  | 1 +
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.05.bb | 2 +-
 meta/recipes-bsp/u-boot/u-boot-mkimage_2018.05.bb  | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2018.05.inc b/meta/recipes-bsp/u-boot/u-boot-common_2018.05.inc
index 61566f5856..deec6e4890 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2018.05.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2018.05.inc
@@ -1,5 +1,6 @@
 HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
 SECTION = "bootloaders"
+DEPENDS += "flex-native bison-native"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.05.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.05.bb
index 02887a138a..52c13e75d8 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.05.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.05.bb
@@ -1,7 +1,7 @@
 require u-boot-common_${PV}.inc
 
 SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
-DEPENDS = "mtd-utils"
+DEPENDS += "mtd-utils"
 
 INSANE_SKIP_${PN} = "already-stripped"
 EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" V=1'
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.05.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.05.bb
index 1c008be96e..08bff1d161 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.05.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.05.bb
@@ -1,7 +1,7 @@
 require u-boot-common_${PV}.inc
 
 SUMMARY = "U-Boot bootloader image creation tool"
-DEPENDS = "openssl"
+DEPENDS += "openssl"
 
 EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
-- 
2.16.2


