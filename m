Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T12BS-0005j0-Uh
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 23:28:23 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 23CF130426
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 17:16:24 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 14:15:06 -0700
Message-Id: <ad78441045183277a7e77341f4af6d9d65a4a3c8.1344892361.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1344892361.git.scott.a.garman@intel.com>
References: <cover.1344892361.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1344892361.git.scott.a.garman@intel.com>
References: <cover.1344892361.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 23CF130426.8BED2
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 25/32] u-boot.inc: update linker arguments to pass --sysroot arg
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
X-List-Received-Date: Mon, 13 Aug 2012 21:28:23 -0000

From: Matthew McClintock <msm@freescale.com>

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
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/u-boot/u-boot.inc        |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2011.03.bb |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2011.06.bb |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 0445c34..e627e97 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -8,7 +8,7 @@ inherit deploy
 PARALLEL_MAKE=""
 
 # GCC 4.5.1 builds unusable binaries using -Os, remove it from OPTFLAGS
-EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} OPTFLAGS='-O2'"
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} OPTFLAGS='-O2' CC='${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}'"
 
 python () {
 	if not d.getVar("UBOOT_MACHINE", True):
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
index e99bc2c..5d79e1a 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
@@ -17,7 +17,7 @@ FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
 SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
 
 PV = "v2011.03+git${SRCPV}"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
index 680401f..43f2c06 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
@@ -17,7 +17,7 @@ FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
 SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
 
 PV = "v2011.06+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
-- 
1.7.9.5



