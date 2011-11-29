Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RVIlP-000579-IZ
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 09:10:04 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Nov 2011 00:03:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,590,1315206000"; d="scan'208";a="42016957"
Received: from unknown (HELO envy.home) ([10.255.12.98])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Nov 2011 00:03:23 -0800
Message-ID: <4ED491CF.4020807@linux.intel.com>
Date: Tue, 29 Nov 2011 00:03:27 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322120651.git.dvhart@linux.intel.com>
	<d5ab9354f38a3cdecfedaf734ffb48aa969a8541.1322120651.git.dvhart@linux.intel.com>
	<4ED01D59.8020301@linux.intel.com>
In-Reply-To: <4ED01D59.8020301@linux.intel.com>
X-Enigmail-Version: 1.3.3
Cc: Josef Ahmad <josef.ahmad@intel.com>, Koen Kooi <koen@dominion.thruhere.net>,
	Chris Larson <clarson@kergoth.com>
Subject: Re: [RFC PATCH 1/5] grub-efi-native: New recipe to build GRUB EFI images
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
X-List-Received-Date: Tue, 29 Nov 2011 08:10:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/25/2011 02:57 PM, Darren Hart wrote:
> 
> 
> On 11/24/2011 12:05 AM, Darren Hart wrote:
>> Add a recipe to build the GRUB efi images. This recipe is written as
>> a native recipe as the resulting GRUB utils are required to assemble
>> the final image. Rather than build a native and a target recipe (and
>> increase build times), this recipe builds the utils for the host and
>> passes an appropriate --target argument to the GRUB configure script
>> to build the modules for the target arch. The only output of this
>> recipe is an EFI image in the deploy directory.
> 
> The grub-help list came through with an alternative approach:
> 
> "./configure CC=powerpc-linux-gcc  --host=ppc-linux-gnu --target=i386
> --with-platform=pc TARGET_CC=i386-linux-gcc"
> 
> This would allow for building on a host of arch ppc for a target of arch
> i386.
> 
> Would it be preferable then to build this as a target package and
> manipuate the configure flags to use the BUILD_CC ? I presume a similar
> PN rename would be desirable to account for the HOST component of the
> build as I used here for the TARGET on the -native version?

I have been working on trying to get this working as a target recipe. I've
resolved a number of issues, but something is still biting me and I haven't been
able to sort out what. I would really appreciate a few more sets of eyes on
this.

I have pushed my dvhart/efi/dev branch to poky-contrib for reference:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/?h=dvhart/efi/dev

When building this recipe, the mkimage task fails with the grub-mkimage command
segfaulting. I can build with the same ./configure command and using the Yocto
1.1 x86_64-i586 toolchain for the TARGET_CC and the mkimage succeeds. The
configure command is:

./configure --build=x86_64-linux --host=x86_64-linux --target=i586-poky-linux --prefix=/usr --exec_prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --libexecdir=/usr/libexec --datadir=/usr/share --sysconfdir=/etc --sharedstatedir=/com --localstatedir=/var --libdir=/usr/lib --includedir=/usr/include --oldincludedir=/usr/include --infodir=/usr/share/info --mandir=/usr/share/man --disable-silent-rules --with-libtool-sysroot=/build/poky/n450/tmp/sysroots/n450 CC=gcc TARGET_CC=i586-poky-linux-gcc --with-platform=efi --enable-efiemu=no --disable-grub-mkfont --program-prefix='' --enable-nls 

The make output from building manually vs. within bitbake is nearly identical
with a couple minor path changes for the cross toolchain. The bitbake make also
prints more errors, including the following for the grub-mkimage target (which
is the one that segfaults).

gcc -DHAVE_CONFIG_H -I.  -Wall -W -I./include -DGRUB_UTIL=1 -DGRUB_LIBDIR=\"/usr/lib/grub\" -DLOCALEDIR=\"/usr/share/locale\"  -DGRUB_MACHINE_EFI=1 -DGRUB_MACHINE=I386_EFI -DGRUB_FILE=\"util/grub-mkimage.c\" -I. -I. -I. -I. -I./include -I./include -I./grub-core/gnulib -I./grub-core/gnulib -DGRUB_PKGLIBROOTDIR=\"/usr/lib/''grub\"    -Wno-undef -Wno-sign-compare -Wno-unused -Wno-unused-parameter   -MT util/grub_mkimage-grub-mkimage.o -MD -MP -MF util/.deps-util/grub_mkimage-grub-mkimage.Tpo -c -o util/grub_mkimage-grub-mkimage.o `test -f 'util/grub-mkimage.c' || echo './'`util/grub-mkimage.c
util/grub-mkimage.c: In function 'generate_image':
util/grub-mkimage.c:665:11: warning: passing argument 2 of 'load_image32' from incompatible pointer type [enabled by default]
util/grub-mkimagexx.c:601:1: note: expected 'grub_size_t *' but argument is of type 'size_t *'
util/grub-mkimage.c:665:11: warning: passing argument 3 of 'load_image32' from incompatible pointer type [enabled by default]
util/grub-mkimagexx.c:601:1: note: expected 'grub_size_t *' but argument is of type 'size_t *'
util/grub-mkimage.c:669:11: warning: passing argument 2 of 'load_image64' from incompatible pointer type [enabled by default]
util/grub-mkimagexx.c:601:1: note: expected 'grub_size_t *' but argument is of type 'size_t *'
util/grub-mkimage.c:669:11: warning: passing argument 3 of 'load_image64' from incompatible pointer type [enabled by default]
util/grub-mkimagexx.c:601:1: note: expected 'grub_size_t *' but argument is of type 'size_t *'

The recipe follows for your reference and for inline comments. Any thoughts on
why this might be failing? Is there are better way to go about trying to build
this as a target recipe?

grub-efi_1.99.bb
----------------
SUMMARY = "GRUB2 is the next-generation GRand Unified Bootloader"

DESCRIPTION = "GRUB2 is the next generaion of a GPLed bootloader \
intended to unify bootloading across x86 operating systems. In \
addition to loading the Linux kernel, it implements the Multiboot \
standard, which allows for flexible loading of multiple boot images. \
This recipe builds an EFI binary for the target. It does not install \
or package anything, it only deploys a target-arch GRUB EFI image."

HOMEPAGE = "http://www.gnu.org/software/grub/"
SECTION = "bootloaders"
PRIORITY = "optional"

LICENSE = "GPLv3"
LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"

# FIXME: We should be able to optionally drop freetype as a dependency
DEPENDS = "help2man-native"
RDEPENDS_${PN} = "diffutils freetype"
PR = "r1"

# FIXME: make this use build arch too?
# Native packages do not normally rebuild when the target changes.
# Ensure this is built once per HOST-TARGET pair.
PN := "grub-efi"

SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz"

SRC_URI[md5sum] = "ca9f2a2d571b57fc5c53212d1d22e2b5"
SRC_URI[sha256sum] = "b91f420f2c51f6155e088e34ff99bea09cc1fb89585cf7c0179644e57abd28ff"

COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'

S = "${WORKDIR}/grub-${PV}"

inherit autotools
inherit gettext
inherit deploy
#inherit cross

# Translate machine arches to grub arch values
python __anonymous () {
    import re
    target = d.getVar("TARGET_ARCH", True)
    if target == "x86_64":
        grubtarget = "x86_64"
        grubimage = "bootx64.efi"
    elif re.match("i.86", target):
        grubtarget = "i386"
        grubimage = "bootia32.efi"
    else:
        raise bb.parse.SkipPackage("grub-efi is incompatible with target %s" % target)
    d.setVar("GRUB_TARGET", grubtarget)
    d.setVar("GRUB_IMAGE", grubimage)

    host = d.getVar("BUILD_ARCH", True)
    if re.match("x86_64", host):
        hostarch = "x86_64"
    elif re.match("i.86", host):
        hostarch = "i386"
    else:
        # This should have been caught by COMPATIBLE_HOST above
        bb.error("grub-efi is incompatible with host %s" % host)
    d.setVar("GRUB_HOST", host)


}

# Build utils for the host and modules and images for the target:
# ./configure CC=powerpc-linux-gcc  --host=ppc-linux-gnu --target=i386 \
# --with-platform=efi TARGET_CC=i386-linux-gcc
#EXTRA_OECONF = "CC=${BUILD_PREFIX}gcc --host=${GRUB_HOST} RANLIB=${BUILD_RANLIB} \
#                TARGET_CC=${TARGET_PREFIX}gcc --target=${GRUB_TARGET} \
#                --with-platform=efi --enable-efiemu=no \
#		--disable-grub-mkfont --program-prefix=''"

#HOST_ARCH = "${BUILD_ARCH}"
#HOST_VENDOR = "${BUILD_VENDOR}"
#HOST_OS = "${BUILD_OS}"
#HOST_PREFIX = "${BUILD_PREFIX}"
#HOST_CC_ARCH = "${BUILD_CC_ARCH}"
#HOST_LD_ARCH = "${BUILD_LD_ARCH}"
#HOST_AS_ARCH = "${BUILD_AS_ARCH}"
SELECTED_OPTIMIZATION=""
FULL_OPTIMIZATION=""
CPP="${BUILD_PREFIX}gcc -E"
HOST_SYS="${BUILD_SYS}"
RANLIB="${BUILD_PREFIX}ranlib"
#LDFLAGS=""
ASNEEDED=""
TARGET_LINK_HASH_STYLE=""
TARGET_LDFLAGS=""
EXTRA_OECONF = "CC=${BUILD_PREFIX}gcc \
                TARGET_CC=${TARGET_PREFIX}gcc \
                --with-platform=efi --enable-efiemu=no \
		--disable-grub-mkfont --program-prefix=''"

do_mkimage() {
	./grub-mkimage -p / -d ./grub-core/ \
		       -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
	               boot linux fat serial part_msdos normal
}
do_compile(){
#	export CFLAGS="-Os"
#	export TARGET_CFLAGS="-Os"
#	export CC="${BUILD_PREFIX}gcc"
	bbnote "CC=${CC}"
	bbnote "CFLAGS=${CFLAGS}"
	bbnote "TARGET_CFLAGS=${TARGET_CFLAGS}"
	bbnote "RANLIB=${RANLIB}"
	bbnote "gcc=$(which gcc)"
	oe_runmake
}
addtask mkimage after do_compile before do_install

do_deploy() {
	install -m 644 ${S}/${GRUB_IMAGE} ${DEPLOYDIR}
}
addtask deploy after do_install before do_build

do_install[noexec] = "1"
do_populate_sysroot[noexec] = "1"

--
Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


