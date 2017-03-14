Return-Path: <denis@denix.org>
X-Greylist: delayed 358 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 14 Mar 2017 19:43:34 UTC
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA297773F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 19:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8D40E20BA7;
	Tue, 14 Mar 2017 19:37:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id glHJLodYWif0; Tue, 14 Mar 2017 19:37:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6D154209A4;
	Tue, 14 Mar 2017 19:37:35 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id F2C621623B7;
	Tue, 14 Mar 2017 15:37:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 15:37:34 -0400
Message-Id: <1489520254-25665-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] u-boot-fw-utils: reuse the same override HOSTCC patch as u-boot-mkimage
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
X-List-Received-Date: Tue, 14 Mar 2017 19:43:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb
index f56862c..2631499 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb
@@ -1,10 +1,12 @@
 require u-boot-common_${PV}.inc
 
+SRC_URI += "file://default-gcc.patch"
+
 SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
 DEPENDS = "mtd-utils"
 
 INSANE_SKIP_${PN} = "already-stripped"
-EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
+EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" V=1'
 EXTRA_OEMAKE_class-cross = 'ARCH=${TARGET_ARCH} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
 
 inherit uboot-config
-- 
2.7.4


