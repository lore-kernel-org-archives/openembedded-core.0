Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RU4pV-0003UF-7h
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Nov 2011 00:05:14 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Nov 2011 14:57:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,573,1315206000"; d="scan'208";a="89236019"
Received: from unknown (HELO envy.home) ([10.255.15.250])
	by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2011 14:57:25 -0800
Message-ID: <4ED01D59.8020301@linux.intel.com>
Date: Fri, 25 Nov 2011 14:57:29 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322120651.git.dvhart@linux.intel.com>
	<d5ab9354f38a3cdecfedaf734ffb48aa969a8541.1322120651.git.dvhart@linux.intel.com>
In-Reply-To: <d5ab9354f38a3cdecfedaf734ffb48aa969a8541.1322120651.git.dvhart@linux.intel.com>
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
X-List-Received-Date: Fri, 25 Nov 2011 23:05:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 11/24/2011 12:05 AM, Darren Hart wrote:
> Add a recipe to build the GRUB efi images. This recipe is written as
> a native recipe as the resulting GRUB utils are required to assemble
> the final image. Rather than build a native and a target recipe (and
> increase build times), this recipe builds the utils for the host and
> passes an appropriate --target argument to the GRUB configure script
> to build the modules for the target arch. The only output of this
> recipe is an EFI image in the deploy directory.

The grub-help list came through with an alternative approach:

"./configure CC=powerpc-linux-gcc  --host=ppc-linux-gnu --target=i386
--with-platform=pc TARGET_CC=i386-linux-gcc"

This would allow for building on a host of arch ppc for a target of arch
i386.

Would it be preferable then to build this as a target package and
manipuate the configure flags to use the BUILD_CC ? I presume a similar
PN rename would be desirable to account for the HOST component of the
build as I used here for the TARGET on the -native version?

--
Darren

> 
> Care is taken to ensure changing targets will force a rebuild of this
> native recipe by including the target arch in the PN.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> ---
>  meta/recipes-bsp/grub/grub-efi-native_1.99.bb |   74 +++++++++++++++++++++++++
>  1 files changed, 74 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-bsp/grub/grub-efi-native_1.99.bb
> 
> diff --git a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
> new file mode 100644
> index 0000000..3c52ec9
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
> @@ -0,0 +1,74 @@
> +SUMMARY = "GRUB2 is the next-generation GRand Unified Bootloader"
> +
> +DESCRIPTION = "GRUB2 is the next generaion of a GPLed bootloader \
> +intended to unify bootloading across x86 operating systems. In \
> +addition to loading the Linux kernel, it implements the Multiboot \
> +standard, which allows for flexible loading of multiple boot images. \
> +This recipe builds an EFI binary for the target. It does not install \
> +or package anything, it only deploys a target-arch GRUB EFI image."
> +
> +HOMEPAGE = "http://www.gnu.org/software/grub/"
> +SECTION = "bootloaders"
> +PRIORITY = "optional"
> +
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +# FIXME: We should be able to optionally drop freetype as a dependency
> +DEPENDS = "help2man-native"
> +RDEPENDS_${PN} = "diffutils freetype"
> +PR = "r1"
> +
> +# Native packages do not normally rebuild when the target changes.
> +# Ensure this is built once per HOST-TARGET pair.
> +PN := "grub-efi-${TRANSLATED_TARGET_ARCH}-native"
> +
> +SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "ca9f2a2d571b57fc5c53212d1d22e2b5"
> +SRC_URI[sha256sum] = "b91f420f2c51f6155e088e34ff99bea09cc1fb89585cf7c0179644e57abd28ff"
> +
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
> +
> +S = "${WORKDIR}/grub-${PV}"
> +
> +# Determine the target arch for the grub modules before the native class
> +# clobbers TARGET_ARCH.
> +ORIG_TARGET_ARCH := ${TARGET_ARCH}
> +python __anonymous () {
> +    import re
> +    target = d.getVar('ORIG_TARGET_ARCH', True)
> +    if target == "x86_64":
> +        grubtarget = 'x86_64'
> +        grubimage = "bootx64.efi"
> +    elif re.match('i.86', target):
> +        grubtarget = 'i386'
> +        grubimage = "bootia32.efi"
> +    else:
> +        raise bb.parse.SkipPackage("grub-efi is incompatible with target %s" % target)
> +    d.setVar("GRUB_TARGET", grubtarget)
> +    d.setVar("GRUB_IMAGE", grubimage)
> +}
> +
> +inherit autotools
> +inherit gettext
> +inherit native
> +inherit deploy
> +
> +EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
> +                --target=${GRUB_TARGET} --enable-efiemu=no --program-prefix=''"
> +
> +do_mkimage() {
> +	./grub-mkimage -p / -d ./grub-core/ \
> +		       -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
> +	               boot linux fat serial part_msdos normal
> +}
> +addtask mkimage after do_compile before do_install
> +
> +do_deploy() {
> +	install -m 644 ${S}/${GRUB_IMAGE} ${DEPLOYDIR}
> +}
> +addtask deploy after do_install before do_build
> +
> +do_install[noexec] = "1"
> +do_populate_sysroot[noexec] = "1"

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


