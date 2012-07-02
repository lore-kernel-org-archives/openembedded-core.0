Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Paul.Gortmaker@windriver.com>) id 1SlX7B-0003ET-KP
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 05:15:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q6234p18026212
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Jul 2012 20:04:51 -0700 (PDT)
Received: from yow-pgortmak-d1 (128.224.146.65) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sun, 1 Jul 2012 20:04:51 -0700
Received: from paul by yow-pgortmak-d1 with local (Exim 4.74)	(envelope-from
	<paul.gortmaker@windriver.com>)	id 1SlWwQ-0001zP-24; Sun, 01 Jul 2012
	23:04:46 -0400
Date: Sun, 1 Jul 2012 23:04:46 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120702030445.GA7328@windriver.com>
References: <1340994915-14947-1-git-send-email-paul.gortmaker@windriver.com>
	<1340994915-14947-2-git-send-email-paul.gortmaker@windriver.com>
	<4FF0C930.4000104@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4FF0C930.4000104@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 02 Jul 2012 03:15:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [OE-core] [PATCH 1/3] u-boot: Don't make the -Os removal part of globa=
l settings.] On 01/07/2012 (Sun 15:03) Saul Wold wrote:

> On 06/29/2012 11:35 AM, Paul Gortmaker wrote:
> >We don't want to force everyone to be stripping the -Os
> >flags from their u-boot builds.  Remove it, since it pertains
> >to an old toolchain issue that is no longer relevant, and it
> >breaks the powerpc mpc8315.
> >
> >Signed-off-by: Paul Gortmaker<paul.gortmaker@windriver.com>
> >---
> >  meta/recipes-bsp/u-boot/u-boot.inc |    3 ---
> >  1 file changed, 3 deletions(-)
> >
> >diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boo=
t/u-boot.inc
> >index a13eddc..0ed5fd9 100644
> >--- a/meta/recipes-bsp/u-boot/u-boot.inc
> >+++ b/meta/recipes-bsp/u-boot/u-boot.inc
> >@@ -7,9 +7,6 @@ inherit deploy
> >
> >  PARALLEL_MAKE=3D""
> >
> >-# GCC 4.5.1 builds unusable binaries using -Os, remove it from OPTFLAGS
> >-EXTRA_OEMAKE =3D "CROSS_COMPILE=3D${TARGET_PREFIX} OPTFLAGS=3D'-O2'"
> >-
> >  python () {
> >  	if not d.getVar("UBOOT_MACHINE", True):
> >  		PN =3D d.getVar("PN", True)
>=20
> Not sure what else changed, but I think you removed the
> TARGET_PREFIX or something else broke, but building with the
> Autobuilder, the following errors occur.

Yes, it is because an older version of the patches which I did several
months ago moved the above line to be recipe/version specific (since
I didn't know which older versions of u-boot were relying on the O2).

But the feedback from back then just said scrap the O2.  So I ended
up with TARGET_PREFIX in the new recipe and not in the old ones.
Let me resend v2 with TARGET_PREFIX remaining in the shared inc file,
and after testing the omap3_beagle that failed for you.

Sorry about that.
Paul.
--

>=20
> >ERROR: Function failed: do_compile (see /srv/home/pokybuild/yocto-autobu=
ilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-g=
nueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/te=
mp/log.do_compile.15139 for further information)
> >ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuild=
er/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnue=
abi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/temp/=
log.do_compile.15139
> >Log data follows:
> >| DEBUG: Executing shell function do_compile
> >| NOTE: make -e MAKEFLAGS=3D omap3_beagle_config
> >| awk '(NF && $1 !~ /^#/) { print $1 ": " $1 "_config; $(MAKE)" }' board=
s.cfg > .boards.depend
> >| Configuring for omap3_beagle board...
> >| NOTE: make -e MAKEFLAGS=3D all
> >| Generating include/autoconf.mk
> >| Generating include/autoconf.mk.dep
> >| arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a -fno-tree-vectorize     -=
mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 --sys=
root=3D/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/sysroots/beagleboard -DDO_DEPS_ONLY \
> >| 	-g  -Os   -fno-common -ffixed-r8 -msoft-float   -D__KERNEL__ -DCONFIG=
_SYS_TEXT_BASE=3D0x80008000 -I/srv/home/pokybuild/yocto-autobuilder/yocto-s=
lave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot=
-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -fn=
o-builtin -ffreestanding -nostdinc -isystem /srv/home/pokybuild/yocto-autob=
uilder/yocto-slave/nightly-arm/build/build/tmp/sysroots/x86_64-linux/usr/li=
b/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/inclu=
de -pipe  -DCONFIG_ARM -D__ARM__ -marm  -mabi=3Daapcs-linux -mno-thumb-inte=
rwork -march=3Darmv5 -Wall -Wstrict-prototypes -fno-stack-protector   \
> >| 	-o lib/asm-offsets.s lib/asm-offsets.c -c -S
> >| Generating include/generated/generic-asm-offsets.h
> >| tools/scripts/make-asm-offsets lib/asm-offsets.s include/generated/gen=
eric-asm-offsets.h
> >| for dir in tools examples/standalone examples/api arch/arm/cpu/armv7 /=
srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tm=
p/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348=
b153d5c148369229d24af361a-r1/git/arch/arm/cpu/armv7/ ; do \
> >| 		make -C $dir _depend ; done
> >| make[1]: arm-linux-gcc: Command not found
> >| make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yoc=
to-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-=
boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools'
> >| make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yoct=
o-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-b=
oot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools'
> >| make[1]: arm-linux-gcc: Command not found
> >| make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yoc=
to-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-=
boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools'
> >| make[1]: Nothing to be done for `_depend'.
> >| make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yoct=
o-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-b=
oot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools'
> >| make[1]: arm-linux-gcc: Command not found
> >| make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yoc=
to-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-=
boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/example=
s/standalone'
> >| /bin/sh: arm-linux-gcc: command not found
> >| dirname: missing operand
> >| Try `dirname --help' for more information.
> >| /bin/sh: line 2: arm-linux-gcc: command not found
> >| /bin/sh: line 2: arm-linux-gcc: command not found
> >| make[1]: *** No rule to make target `.depend', needed by `_depend'.  S=
top.
> >| make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yoct=
o-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-b=
oot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/examples=
/standalone'
> >| make[1]: arm-linux-gcc: Command not found
> >| make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yoc=
to-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-=
boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/example=
s/api'
> >| /bin/sh: arm-linux-gcc: command not found
> >| dirname: missing operand
> >| Try `dirname --help' for more information.
> >| make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yoct=
o-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-b=
oot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/examples=
/api'
> >| make[1]: arm-linux-gcc: Command not found
> >| make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yoc=
to-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-=
boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/example=
s/api'
> >| /bin/sh: arm-linux-gcc: command not found
> >| dirname: missing operand
> >| Try `dirname --help' for more information.
> >| make[1]: Nothing to be done for `_depend'.
> >| make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yoct=
o-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-b=
oot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/examples=
/api'
> >| make[1]: arm-linux-gcc: Command not found
> >| make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yoc=
to-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-=
boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/arch/ar=
m/cpu/armv7'
> >| /bin/sh: line 2: arm-linux-gcc: command not found
> >| /bin/sh: line 2: arm-linux-gcc: command not found
> >| /bin/sh: line 2: arm-linux-gcc: command not found
> >| make[1]: *** No rule to make target `.depend', needed by `_depend'.  S=
top.
> >| make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yoct=
o-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-b=
oot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/arch/arm=
/cpu/armv7'
> >| make[1]: arm-linux-gcc: Command not found
> >| make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yoc=
to-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-=
boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/arch/ar=
m/cpu/armv7'
> >| make[1]: Nothing to be done for `_depend'.
> >| make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yoct=
o-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-b=
oot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/arch/arm=
/cpu/armv7'
> >| make -C tools all
> >| make[1]: arm-linux-gcc: Command not found
> >| make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yoc=
to-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-=
boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools'
> >| gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /=
srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tm=
p/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348=
b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yoc=
to-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-pok=
y-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af3=
61a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-=
slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boo=
t-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I=
 /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/=
tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d3=
48b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-!
> boot-v2011
> .06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_=
SYS_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -pedantic -=
c -o crc32.o /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/=
build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b=
1af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/crc32.c
> >| gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /=
srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tm=
p/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348=
b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yoc=
to-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-pok=
y-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af3=
61a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-=
slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boo=
t-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I=
 /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/=
tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d3=
48b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-!
> boot-v2011
> .06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_=
SYS_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -c -o env_e=
mbedded.o /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/bui=
ld/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af=
6f532e0d348b153d5c148369229d24af361a-r1/git/common/env_embedded.c
> >| gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv=
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/w=
ork/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b15=
3d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a=
-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-sla=
ve/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v=
2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /s=
rv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp=
/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b=
153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-aut=
obuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linu=
x-gnueabi/u-boo!
> t-v2011.06
> +git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS=
_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -pedantic   -o=
 envcrc.o envcrc.c -c
> >| gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /=
srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tm=
p/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348=
b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yoc=
to-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-pok=
y-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af3=
61a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-=
slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boo=
t-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I=
 /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/=
tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d3=
48b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-!
> boot-v2011
> .06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_=
SYS_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -pedantic -=
c -o sha1.o /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/b=
uild/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1=
af6f532e0d348b153d5c148369229d24af361a-r1/git/lib/sha1.c
> >| gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv=
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/w=
ork/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b15=
3d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a=
-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-sla=
ve/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v=
2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /s=
rv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp=
/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b=
153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-aut=
obuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linu=
x-gnueabi/u-boo!
> t-v2011.06
> +git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS=
_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -pedantic  -o =
envcrc crc32.o env_embedded.o envcrc.o sha1.o
> >| gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv=
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/w=
ork/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b15=
3d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a=
-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-sla=
ve/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v=
2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /s=
rv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp=
/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b=
153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-aut=
obuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linu=
x-gnueabi/u-boo!
> t-v2011.06
> +git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS=
_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -pedantic   -o=
 img2srec.o img2srec.c -c
> >| gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv=
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/w=
ork/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b15=
3d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a=
-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-sla=
ve/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v=
2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /s=
rv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp=
/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b=
153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-aut=
obuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linu=
x-gnueabi/u-boo!
> t-v2011.06
> +git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS=
_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -pedantic  -o =
img2srec img2srec.o
> >| strip img2srec
> >| gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv=
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/w=
ork/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b15=
3d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a=
-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-sla=
ve/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v=
2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /s=
rv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp=
/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b=
153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-aut=
obuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linu=
x-gnueabi/u-boo!
> t-v2011.06
> +git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS=
_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES   -o default_i=
mage.o default_image.c -c
> >| gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv=
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/w=
ork/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b15=
3d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a=
-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-sla=
ve/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v=
2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /s=
rv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp=
/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b=
153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-aut=
obuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linu=
x-gnueabi/u-boo!
> t-v2011.06
> +git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS=
_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES   -o fit_image=
=2Eo fit_image.c -c
> >| gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /=
srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tm=
p/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348=
b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yoc=
to-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-pok=
y-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af3=
61a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-=
slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boo=
t-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I=
 /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/=
tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d3=
48b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-!
> boot-v2011
> .06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_=
SYS_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -c -o image=
=2Eo /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/bu=
ild/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532=
e0d348b153d5c148369229d24af361a-r1/git/common/image.c
> >| gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv=
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/w=
ork/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b15=
3d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a=
-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-sla=
ve/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v=
2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /s=
rv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp=
/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b=
153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-aut=
obuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linu=
x-gnueabi/u-boo!
> t-v2011.06
> +git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS=
_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES   -o imximage.=
o imximage.c -c
> >| gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv=
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/w=
ork/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b15=
3d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a=
-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-sla=
ve/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v=
2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /s=
rv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp=
/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b=
153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-aut=
obuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linu=
x-gnueabi/u-boo!
> t-v2011.06
> +git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS=
_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES   -o kwbimage.=
o kwbimage.c -c
> >| gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /=
srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tm=
p/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348=
b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yoc=
to-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-pok=
y-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af3=
61a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-=
slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boo=
t-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I=
 /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/=
tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d3=
48b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-!
> boot-v2011
> .06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_=
SYS_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -pedantic -=
c -o md5.o /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/bu=
ild/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1a=
f6f532e0d348b153d5c148369229d24af361a-r1/git/lib/md5.c
> >| gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv=
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/w=
ork/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b15=
3d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a=
-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-sla=
ve/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v=
2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /s=
rv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp=
/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b=
153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-aut=
obuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linu=
x-gnueabi/u-boo!
> t-v2011.06
> +git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS=
_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES   -o mkimage.o=
 mkimage.c -c
> >| gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv=
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/w=
ork/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b15=
3d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a=
-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-sla=
ve/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v=
2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /s=
rv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp=
/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b=
153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-aut=
obuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linu=
x-gnueabi/u-boo!
> t-v2011.06
> +git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS=
_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES   -o os_suppor=
t.o os_support.c -c
> >| gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /=
srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tm=
p/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348=
b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yoc=
to-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-pok=
y-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af3=
61a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-=
slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boo=
t-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I=
 /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/=
tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d3=
48b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-!
> boot-v2011
> .06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_=
SYS_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -c -o fdt.o=
 /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/=
tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d3=
48b153d5c148369229d24af361a-r1/git/lib/libfdt/fdt.c
> >| gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /=
srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tm=
p/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348=
b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yoc=
to-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-pok=
y-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af3=
61a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-=
slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boo=
t-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I=
 /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/=
tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d3=
48b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-!
> boot-v2011
> .06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_=
SYS_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -c -o fdt_r=
o.o /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/bui=
ld/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e=
0d348b153d5c148369229d24af361a-r1/git/lib/libfdt/fdt_ro.c
> >| gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /=
srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tm=
p/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348=
b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yoc=
to-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-pok=
y-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af3=
61a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-=
slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boo=
t-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I=
 /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/=
tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d3=
48b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-!
> boot-v2011
> .06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_=
SYS_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -c -o fdt_r=
w.o /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/bui=
ld/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e=
0d348b153d5c148369229d24af361a-r1/git/lib/libfdt/fdt_rw.c
> >| gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /=
srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tm=
p/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348=
b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yoc=
to-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-pok=
y-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af3=
61a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-=
slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boo=
t-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I=
 /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/=
tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d3=
48b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-!
> boot-v2011
> .06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_=
SYS_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -c -o fdt_s=
trerror.o /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/bui=
ld/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af=
6f532e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt/fdt_strerror.c
> >| gcc -g -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /=
srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tm=
p/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348=
b153d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yoc=
to-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-pok=
y-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af3=
61a-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-=
slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boo=
t-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I=
 /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/=
tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d3=
48b153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-!
> boot-v2011
> .06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_=
SYS_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -c -o fdt_w=
ip.o /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/bu=
ild/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532=
e0d348b153d5c148369229d24af361a-r1/git/lib/libfdt/fdt_wip.c
> >| gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -idirafter /srv=
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/w=
ork/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b15=
3d5c148369229d24af361a-r1/git/include -idirafter /srv/home/pokybuild/yocto-=
autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a=
-r1/git/include2 -idirafter /srv/home/pokybuild/yocto-autobuilder/yocto-sla=
ve/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v=
2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/include -I /s=
rv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp=
/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b=
153d5c148369229d24af361a-r1/git/lib/libfdt -I /srv/home/pokybuild/yocto-aut=
obuilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linu=
x-gnueabi/u-boo!
> t-v2011.06
> +git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools -DCONFIG_SYS=
_TEXT_BASE=3D0x80008000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -pedantic  -o =
mkimage crc32.o default_image.o fit_image.o image.o imximage.o kwbimage.o m=
d5.o mkimage.o os_support.o sha1.o fdt.o fdt_ro.o fdt_rw.o fdt_strerror.o f=
dt_wip.o
> >| strip mkimage
> >| make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yoct=
o-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-b=
oot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/tools'
> >| make -C examples/standalone all
> >| make[1]: arm-linux-gcc: Command not found
> >| make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yoc=
to-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-=
boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/example=
s/standalone'
> >| /bin/sh: arm-linux-gcc: command not found
> >| dirname: missing operand
> >| Try `dirname --help' for more information.
> >| arm-linux-gcc  -g  -Os   -fno-common -ffixed-r8 -msoft-float   -D__KER=
NEL__ -DCONFIG_SYS_TEXT_BASE=3D0x80008000 -I/srv/home/pokybuild/yocto-autob=
uilder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-=
gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/g=
it/include -fno-builtin -ffreestanding -nostdinc -isystem  -pipe  -DCONFIG_=
ARM -D__ARM__         -march=3Darmv5 -Wall -Wstrict-prototypes     -o hello=
_world.o hello_world.c -c
> >| make[1]: arm-linux-gcc: Command not found
> >| make[1]: *** [hello_world.o] Error 127
> >| make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yoct=
o-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux-gnueabi/u-b=
oot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/git/examples=
/standalone'
> >| make: *** [examples/standalone] Error 2
> >| ERROR: oe_runmake failed
> >| ERROR: Function failed: do_compile (see /srv/home/pokybuild/yocto-auto=
builder/yocto-slave/nightly-arm/build/build/tmp/work/beagleboard-poky-linux=
-gnueabi/u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af361a-r1/=
temp/log.do_compile.15139 for further information)
> >NOTE: package u-boot-v2011.06+git14+b1af6f532e0d348b153d5c148369229d24af=
361a-r1: task do_compile: Failed
> >ERROR: Task 77 (/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightl=
y-arm/build/meta/recipes-bsp/u-boot/u-boot_2011.06.bb, do_compile) failed w=
ith exit code '1'
>=20
>=20
> Can you verify if your change or the other one causes this issue.
>=20
> Thanks
> 	Sau!


