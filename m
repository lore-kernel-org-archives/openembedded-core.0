Return-Path: <sledz@dresearch-fe.de>
X-Greylist: delayed 392 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 04 Jul 2017 15:39:20 UTC
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de [217.92.177.116])
	by mail.openembedded.org (Postfix) with ESMTP id EA90F7780E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 15:39:20 +0000 (UTC)
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.46])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 02A2AE00CD;
	Tue,  4 Jul 2017 17:32:49 +0200 (CEST)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id D7E3B615B; Tue,  4 Jul 2017 17:32:49 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Jul 2017 17:32:29 +0200
Message-Id: <20170704153229.6628-1-sledz@dresearch-fe.de>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <CAJTo0LZ85U2djZGW4rzK7uumBkutYb91yXY40irYyAVvCKOBRQ@mail.gmail.com>
References: <CAJTo0LZ85U2djZGW4rzK7uumBkutYb91yXY40irYyAVvCKOBRQ@mail.gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [pyro][PATCH] u-boot-mkimage: fix nativesdk build
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
X-List-Received-Date: Tue, 04 Jul 2017 15:39:21 -0000

From: Max Krummenacher <max.oss.09@gmail.com>

If building for nativesdk the wrong rss sysroot is used leading the
following error message.

| ERROR: oe_runmake failed
| In file included from tools/imximage.c:13:0:
| include/image.h:1024:27: fatal error: openssl/evp.h: No such file or directory
|  # include  <openssl/evp.h>

Tools needed on the build host (script/basic/fixdep) and code compiled
for the SDK machine are both built with the build host's compiler,
leading to additinal errors.

Adding CROSS_COMPILE="${HOST_PREFIX}" and using the cross-compiler for
the SDK_ARCH fixes the build error.
The resulting binary in the SDK is working.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
index 1aa95e7c86..de999e7cd5 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
@@ -7,7 +7,7 @@ DEPENDS = "openssl"
 
 EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
-EXTRA_OEMAKE_class-nativesdk = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
+EXTRA_OEMAKE_class-nativesdk = 'CROSS_COMPILE="${HOST_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 
 do_compile () {
 	oe_runmake sandbox_defconfig
-- 
2.13.2


