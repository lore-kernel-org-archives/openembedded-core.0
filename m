Return-Path: <radek.dostal@streamunlimited.com>
X-Greylist: delayed 386 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Nov 2015 16:13:24 UTC
Received: from bsmtp5.bon.at (bsmtp5.bon.at [195.3.86.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6979660125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 16:13:24 +0000 (UTC)
Received: from bsmtp4.bon.at (unknown [192.168.181.106])
	by bsmtp5.bon.at (Postfix) with ESMTPS id 3nrXtD3YR1z5w5H
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 17:07:00 +0100 (CET)
Received: from rdostal-desktop.sue.net (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp4.bon.at (Postfix) with ESMTPSA id 3nrXt94pGxz5tlh;
	Wed,  4 Nov 2015 17:06:57 +0100 (CET)
From: Radek Dostal <radek.dostal@streamunlimited.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Nov 2015 17:06:41 +0100
Message-Id: <1446653201-6456-1-git-send-email-radek.dostal@streamunlimited.com>
X-Mailer: git-send-email 1.9.1
Cc: Radek Dostal <radek.dostal@streamunlimited.com>
Subject: [PATCH] u-boot.inc: properly specify CC for EXTRA_OEMAKE
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
X-List-Received-Date: Wed, 04 Nov 2015 16:13:25 -0000

${TOOLCHAIN_OPTIONS} does not contain some important flags such as
"-march=armv7-a -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8". It only
specifies sysroot as mentioned in commit 923eb657 "u-boot.inc: update
linker arguments to pass --sysroot arg"

Fixes bug: u-boot 2014.04 build breaks with error:
"fatal error: gnu/stubs-soft.h: No such file or directory"
when building with hard float compiler as compiler does not receive
flag "-mfloat-abi=hard"

Before this patch only gcc compiler could be used due to CC explicitly
being set to gcc.

Signed-off-by: Radek Dostal <radek.dostal@streamunlimited.com>
Acked-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index e66ffd1..be22e0c 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -14,7 +14,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit uboot-config deploy
 
-EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
+EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" V=1'
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
 
 PACKAGECONFIG ??= "openssl"
-- 
1.9.1


