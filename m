Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SlSPg-0003Yk-0D
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 00:14:41 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Jul 2012 15:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="162874730"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 01 Jul 2012 15:03:28 -0700
Message-ID: <4FF0C930.4000104@linux.intel.com>
Date: Sun, 01 Jul 2012 15:03:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340994915-14947-1-git-send-email-paul.gortmaker@windriver.com>
	<1340994915-14947-2-git-send-email-paul.gortmaker@windriver.com>
In-Reply-To: <1340994915-14947-2-git-send-email-paul.gortmaker@windriver.com>
Subject: Re: [PATCH 1/3] u-boot: Don't make the -Os removal part of global settings.
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
X-List-Received-Date: Sun, 01 Jul 2012 22:14:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/29/2012 11:35 AM, Paul Gortmaker wrote:
> We don't want to force everyone to be stripping the -Os
> flags from their u-boot builds.  Remove it, since it pertains
> to an old toolchain issue that is no longer relevant, and it
> breaks the powerpc mpc8315.
>
> Signed-off-by: Paul Gortmaker<paul.gortmaker@windriver.com>
> ---
>   meta/recipes-bsp/u-boot/u-boot.inc |    3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index a13eddc..0ed5fd9 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -7,9 +7,6 @@ inherit deploy
>
>   PARALLEL_MAKE=""
>
> -# GCC 4.5.1 builds unusable binaries using -Os, remove it from OPTFLAGS
> -EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} OPTFLAGS='-O2'"
> -
>   python () {
>   	if not d.getVar("UBOOT_MACHINE", True):
>   		PN = d.getVar("PN", True)

Not sure what else changed, but I think you removed the TARGET_PREFIX or 
something else broke, but building with the Autobuilder, the following 
errors occur.

> ERROR: Function failed: do_compile (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/temp/log.do_compile.15139 for further information)
> ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/temp/log.do_compile.15139
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -e MAKEFLAGS= omap3_beagle_config
> | awk '(NF && $1 !~ /^#/) { print $1 ": " $1 "_config; $(MAKE)" }' boards.cfg > .boards.depend
> | Configuring for omap3_beagle board...
> | NOTE: make -e MAKEFLAGS= all
> | Generating include/autoconf.mk
> | Generating include/autoconf.mk.dep
> | arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/sysroots/beagleboard -DDO_DEPS_ONLY \
> | 	-g  -Os   -fno-common -ffixed-r8 -msoft-float   -D__KERNEL__ -DCONFIG_SYS_TEXT_BASE=0x80008000 -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -fno-builtin -ffreestanding -nostdinc -isystem /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/sysroots/x86_64-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/include -pipe  -DCONFIG_ARM -D__ARM__ -marm  -mabi=aapcs-linux -mno-thumb-interwork -march=armv5 -Wall -Wstrict-prototypes -fno-stack-protector   \
> | 	-o lib/asm-offsets.s lib/asm-offsets.c -c -S
> | Generating include/generated/generic-asm-offsets.h
> | tools/scripts/make-asm-offsets lib/asm-offsets.s include/generated/generic-asm-offsets.h
> | for dir in tools examples/standalone examples/api arch/arm/cpu/armv7 /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/arch/arm/cpu/armv7/ ; do \
> | 		make -C $dir _depend ; done
> | make[1]: arm-linux-gcc: Command not found
> | make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools'
> | make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools'
> | make[1]: arm-linux-gcc: Command not found
> | make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools'
> | make[1]: Nothing to be done for `_depend'.
> | make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools'
> | make[1]: arm-linux-gcc: Command not found
> | make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/examples/standalone'
> | /bin/sh: arm-linux-gcc: command not found
> | dirname: missing operand
> | Try `dirname --help' for more information.
> | /bin/sh: line 2: arm-linux-gcc: command not found
> | /bin/sh: line 2: arm-linux-gcc: command not found
> | make[1]: *** No rule to make target `.depend', needed by `_depend'.  Stop.
> | make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/examples/standalone'
> | make[1]: arm-linux-gcc: Command not found
> | make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/examples/api'
> | /bin/sh: arm-linux-gcc: command not found
> | dirname: missing operand
> | Try `dirname --help' for more information.
> | make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/examples/api'
> | make[1]: arm-linux-gcc: Command not found
> | make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/examples/api'
> | /bin/sh: arm-linux-gcc: command not found
> | dirname: missing operand
> | Try `dirname --help' for more information.
> | make[1]: Nothing to be done for `_depend'.
> | make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/examples/api'
> | make[1]: arm-linux-gcc: Command not found
> | make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/arch/arm/cpu/armv7'
> | /bin/sh: line 2: arm-linux-gcc: command not found
> | /bin/sh: line 2: arm-linux-gcc: command not found
> | /bin/sh: line 2: arm-linux-gcc: command not found
> | make[1]: *** No rule to make target `.depend', needed by `_depend'.  Stop.
> | make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/arch/arm/cpu/armv7'
> | make[1]: arm-linux-gcc: Command not found
> | make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/arch/arm/cpu/armv7'
> | make[1]: Nothing to be done for `_depend'.
> | make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/arch/arm/cpu/armv7'
> | make -C tools all
> | make[1]: arm-linux-gcc: Command not found
> | make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools'
> | gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011
.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -pedantic -c -o crc32.o /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/crc32.c
> | gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011
.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -c -o env_embedded.o /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/common/env_embedded.c
> | gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06
+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -pedantic   -o envcrc.o envcrc.c -c
> | gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011
.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -pedantic -c -o sha1.o /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/sha1.c
> | gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06
+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -pedantic  -o envcrc crc32.o env_embedded.o envcrc.o sha1.o
> | gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06
+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -pedantic   -o img2srec.o img2srec.c -c
> | gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06
+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -pedantic  -o img2srec img2srec.o
> | strip img2srec
> | gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06
+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES   -o default_image.o default_image.c -c
> | gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06
+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES   -o fit_image.o fit_image.c -c
> | gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011
.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -c -o image.o /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/common/image.c
> | gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06
+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES   -o imximage.o imximage.c -c
> | gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06
+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES   -o kwbimage.o kwbimage.c -c
> | gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011
.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -pedantic -c -o md5.o /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/md5.c
> | gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06
+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES   -o mkimage.o mkimage.c -c
> | gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06
+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES   -o os_support.o os_support.c -c
> | gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011
.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -c -o fdt.o /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt/fdt.c
> | gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011
.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -c -o fdt_ro.o /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt/fdt_ro.c
> | gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011
.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -c -o fdt_rw.o /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt/fdt_rw.c
> | gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011
.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -c -o fdt_strerror.o /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt/fdt_strerror.c
> | gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011
.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -c -o fdt_wip.o /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt/fdt_wip.c
> | gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06
+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS_TEXT_BASE=0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -pedantic  -o mkimage crc32.o default_image.o fit_image.o image.o imximage.o kwbimage.o md5.o mkimage.o os_support.o sha1.o fdt.o fdt_ro.o fdt_rw.o fdt_strerror.o fdt_wip.o
> | strip mkimage
> | make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools'
> | make -C examples/standalone all
> | make[1]: arm-linux-gcc: Command not found
> | make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/examples/standalone'
> | /bin/sh: arm-linux-gcc: command not found
> | dirname: missing operand
> | Try `dirname --help' for more information.
> | arm-linux-gcc  -g  -Os   -fno-common -ffixed-r8 -msoft-float   -D__KERNEL__ -DCONFIG_SYS_TEXT_BASE=0x80008000 -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -fno-builtin -ffreestanding -nostdinc -isystem  -pipe  -DCONFIG_ARM -D__ARM__         -march=armv5 -Wall -Wstrict-prototypes     -o hello_world.o hello_world.c -c
> | make[1]: arm-linux-gcc: Command not found
> | make[1]: *** [hello_world.o] Error 127
> | make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/examples/standalone'
> | make: *** [examples/standalone] Error 2
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/temp/log.do_compile.15139 for further information)
> NOTE: package u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1: task do_compile: Failed
> ERROR: Task 77 (/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/meta/recipes-bsp/u-boot/u-boot_2011.06.bb, do_compile) failed with exit code '1'


Can you verify if your change or the other one causes this issue.

Thanks
	Sau!


