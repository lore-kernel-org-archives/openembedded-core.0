Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SuR0n-0004gT-Mu
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 18:34:06 +0200
Received: from mail43-co1-R.bigfish.com (10.243.78.228) by
	CO1EHSOBE007.bigfish.com (10.243.66.70) with Microsoft SMTP Server id
	14.1.225.23; Thu, 26 Jul 2012 16:22:34 +0000
Received: from mail43-co1 (localhost [127.0.0.1])	by mail43-co1-R.bigfish.com
	(Postfix) with ESMTP id 0EA8BD80118	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 16:22:34 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail43-co1 (localhost.localdomain [127.0.0.1]) by mail43-co1
	(MessageSwitch) id 1343319751866851_17435;
	Thu, 26 Jul 2012 16:22:31 +0000 (UTC)
Received: from CO1EHSMHS021.bigfish.com (unknown [10.243.78.230])	by
	mail43-co1.bigfish.com (Postfix) with ESMTP id D1D2B920044	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 16:22:31 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS021.bigfish.com
	(10.243.66.31) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 26 Jul 2012 16:22:31 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Thu, 26 Jul 2012 11:22:30 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6QGMT2r024225 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 09:22:29 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 11:21:43 -0500
Message-ID: <1343319703-15704-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] u-boot.inc: update linker arguments to pass --sysroot arg
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 16:34:06 -0000
Content-Type: text/plain

If we are building from sstate-cache it's possible to be building
from another folder on another machine, therefore the linker requires
that a proper --sysroot is passed too it so it can find things like
libgcc.a and avoid errors such as:

| arm-poky-linux-gnueabi-gcc  -g  -O2  -fno-common -ffixed-r8 -msoft-float   -D__KERNEL__ -DCONFIG_SYS_TEXT_BASE=0x80008000 -I/local/yocto/upstream/label/ubuntu1204-64b/machine/beagleboard/poky/edison/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git5+b1af6f532e0d348b153d5c148369229d24af361a-r0/git/include -fno-builtin -ffreestanding -nostdinc -isystem /local/yocto/upstream/label/ubuntu1204-64b/machine/beagleboard/poky/edison/tmp/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.3/include -pipe  -DCONFIG_ARM -D__ARM__ -marm  -mabi=aapcs-linux -mno-thumb-interwork -march=armv5 -Wall -Wstrict-prototypes -fno-stack-protector -fno-toplevel-reorder   -o hello_world.o hello_world.c -c
| arm-poky-linux-gnueabi-gcc  -g  -O2  -fno-common -ffixed-r8 -msoft-float   -D__KERNEL__ -DCONFIG_SYS_TEXT_BASE=0x80008000 -I/local/yocto/upstream/label/ubuntu1204-64b/machine/beagleboard/poky/edison/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git5+b1af6f532e0d348b153d5c148369229d24af361a-r0/git/include -fno-builtin -ffreestanding -nostdinc -isystem /local/yocto/upstream/label/ubuntu1204-64b/machine/beagleboard/poky/edison/tmp/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.3/include -pipe  -DCONFIG_ARM -D__ARM__ -marm  -mabi=aapcs-linux -mno-thumb-interwork -march=armv5 -Wall -Wstrict-prototypes -fno-stack-protector -fno-toplevel-reorder   -o stubs.o stubs.c -c
| arm-poky-linux-gnueabi-ld  -r -o libstubs.o  stubs.o
| arm-poky-linux-gnueabi-ld -g -Ttext 0x80300000 \
| 			-o hello_world -e hello_world hello_world.o libstubs.o \
| 			-L. -lgcc
| arm-poky-linux-gnueabi-ld: cannot find -lgcc
| make[1]: *** [hello_world] Error 1

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc           |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2011.03.bb    |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2011.06.bb    |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |    1 +
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index f794a2a..42bdde9 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -5,7 +5,7 @@ PROVIDES = "virtual/bootloader"
 
 inherit deploy
 
-EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
+EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
 
 python () {
 	if not d.getVar("UBOOT_MACHINE", True):
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
index ed38f54..8465395 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
 SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
 
 PV = "v2011.03+git${SRCPV}"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
index da61852..9654795 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
 SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
 
 PV = "v2011.06+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
index 25cc8c9..c4ec50d 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
@@ -20,6 +20,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 SRCREV = "415d386877df49eb051b85ef74fa59a16dc17c7d"
 
 PV = "v2012.04.01+git${SRCPV}"
+PR = "r1"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
-- 
1.7.10




