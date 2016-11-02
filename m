Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id F0CD871B8A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 12:07:39 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t86L416Z3z3hkd6;
	Wed,  2 Nov 2016 13:07:40 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t86L40mr3zvm7M;
	Wed,  2 Nov 2016 13:07:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id XQl7BSN_e1SI; Wed,  2 Nov 2016 13:07:34 +0100 (CET)
X-Auth-Info: L2yOgSO8k/WN+ldGYvLdDCjUKhad30J6VdtK/i3gBks=
Received: from chi.lan (unknown [195.140.253.167])
	by mail.mnet-online.de (Postfix) with ESMTPA;
	Wed,  2 Nov 2016 13:07:34 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2016 13:07:24 +0100
Message-Id: <20161102120724.30063-1-marex@denx.de>
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
X-List-Received-Date: Wed, 02 Nov 2016 12:07:40 -0000

The build failed on qemux86-64 because it couldn't execute
tools/bin2header on a host due to it being compiled with target
toolchain. Drop the incorrect EXTRA_OEMAKE and just use the one
from u-boot-common*.inc . Moreover, since U-Boot buildsystem
already strips the tools, add INSANE_SKIP = "already-stripped" .

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
index 5025961..76b303e 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
@@ -3,8 +3,6 @@ require u-boot-common_${PV}.inc
 SUMMARY = "U-Boot bootloader image creation tool"
 DEPENDS = "openssl"
 
-EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" STRIP=true V=1'
-
 do_compile () {
 	oe_runmake sandbox_defconfig
 	oe_runmake cross_tools NO_SDL=1
@@ -17,3 +15,4 @@ do_install () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+INSANE_SKIP_${PN} = "already-stripped"
-- 
2.9.3


