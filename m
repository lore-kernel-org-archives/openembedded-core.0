Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E3EA06D782
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 02:45:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Nov 2013 18:45:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,749,1378882800"; d="scan'208";a="439609471"
Received: from unknown (HELO [10.255.15.72]) ([10.255.15.72])
	by orsmga002.jf.intel.com with ESMTP; 21 Nov 2013 18:45:00 -0800
Message-ID: <1385088300.3614.25.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: jackie.huang@windriver.com
Date: Thu, 21 Nov 2013 18:45:00 -0800
In-Reply-To: <726632570b9d8a6bfcd88c5a411a6387f6869f91.1384854113.git.jackie.huang@windriver.com>
References: <cover.1384854113.git.jackie.huang@windriver.com>
	<726632570b9d8a6bfcd88c5a411a6387f6869f91.1384854113.git.jackie.huang@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] grub-efi: change to generate EFI image in target package
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
X-List-Received-Date: Fri, 22 Nov 2013 02:45:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-11-20 at 09:40 +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> It's not a good idea to generate the target EFI image in
> a native packge,

This was admittedly a hack when I wrote it...

>  it would be a problem when build a 64bit
> target on 32bit host.

I build 32b on a 64b host regularly, why is it a problem the other way
around?

There is infrastructure in place to specify the target architecture for
the grub efi binary and the modules. The 32b compiler should be able to
do -m64 just as the 64b compiler can do -m32.

>  In fact, all we need from grub-efi-native
> is the grub-mkimage binary, so change the solution to:
>  * grub-efi-native only install grub-mkimage

Seems reasonable.

>  * grub-efi compiles target modules, generates EFI image
>    with grub-mkimage and deploy, but install nothing.

Also makes sense.

Have you tested the 4 possible combinations?

host	target
32	32
64	32
32	64
64	64



> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

With verification of testing scope and the the minor comments below, I'm
OK with this approach. It's better than the native hack, but I'm not
sure it addresses an actual failure - but that's OK.

> ---
>  meta/classes/grub-efi.bbclass                      |  4 +-
>  .../{grub-efi-native_2.00.bb => grub-efi_2.00.bb}  | 43 ++++++++++++----------
>  2 files changed, 26 insertions(+), 21 deletions(-)
>  rename meta/recipes-bsp/grub/{grub-efi-native_2.00.bb => grub-efi_2.00.bb} (77%)
> 
> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
> index 2f00901..71bd00f 100644
> --- a/meta/classes/grub-efi.bbclass
> +++ b/meta/classes/grub-efi.bbclass
> @@ -15,8 +15,8 @@
>  # ${GRUB_OPTS} - additional options to add to the config, ';' delimited # (optional)
>  # ${GRUB_TIMEOUT} - timeout before executing the deault label (optional)
>  
> -do_bootimg[depends] += "grub-efi-${TRANSLATED_TARGET_ARCH}-native:do_deploy"
> -do_bootdirectdisk[depends] += "grub-efi-${TRANSLATED_TARGET_ARCH}-native:do_deploy"
> +do_bootimg[depends] += "grub-efi:do_deploy"
> +do_bootdirectdisk[depends] += "grub-efi:do_deploy"
>  
>  GRUB_SERIAL ?= "console=ttyS0,115200"
>  GRUBCFG = "${S}/grub.cfg"
> diff --git a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
> similarity index 77%
> rename from meta/recipes-bsp/grub/grub-efi-native_2.00.bb
> rename to meta/recipes-bsp/grub/grub-efi_2.00.bb
> index 04973b5..2fe688c 100644
> --- a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
> @@ -14,14 +14,10 @@ LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  
>  # FIXME: We should be able to optionally drop freetype as a dependency
> -DEPENDS = "autogen-native"
> -RDEPENDS_${PN} = "diffutils freetype"
> +DEPENDS = "autogen-native flex-native bison-native"
> +DEPENDS_class-target = "grub-efi-native"

So no target DEPENDS are created, correct?

>  PR = "r2"
>  
> -# Native packages do not normally rebuild when the target changes.
> -# Ensure this is built once per HOST-TARGET pair.
> -PN := "grub-efi-${TRANSLATED_TARGET_ARCH}-native"
> -
>  SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>             file://cfg \
>             file://grub-2.00-fpmath-sse-387-fix.patch \
> @@ -39,12 +35,10 @@ COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
>  
>  S = "${WORKDIR}/grub-${PV}"
>  
> -# Determine the target arch for the grub modules before the native class
> -# clobbers TARGET_ARCH.
> -ORIG_TARGET_ARCH := "${TARGET_ARCH}"
> +# Determine the target arch for the grub modules
>  python __anonymous () {
>      import re
> -    target = d.getVar('ORIG_TARGET_ARCH', True)
> +    target = d.getVar('TARGET_ARCH', True)
>      if target == "x86_64":
>          grubtarget = 'x86_64'
>          grubimage = "bootx64.efi"
> @@ -59,26 +53,37 @@ python __anonymous () {
>  
>  inherit autotools
>  inherit gettext
> -inherit native
>  inherit deploy
>  
>  EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
> -                --target=${GRUB_TARGET} --enable-efiemu=no --program-prefix='' \
> +                --enable-efiemu=no --program-prefix='' \
>                  --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
>  
> -do_mkimage() {
> +do_install_class-target() {
> +	:
> +}
> +
> +do_install_class-native() {
> +	install -d ${D}${bindir}
> +	install -m 755 grub-mkimage ${D}${bindir}
> +}
> +
> +do_deploy() {
>  	# Search for the grub.cfg on the local boot media by using the
>  	# built in cfg file provided via this recipe
> -	./grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
> +	grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
>  	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
>  	               boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search
> +	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
>  }
> -addtask mkimage after do_compile before do_install
>  
> -do_deploy() {
> -	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
> +do_deploy_class-native() {
> +	:
>  }
> +
>  addtask deploy after do_install before do_build
>  
> -do_install[noexec] = "1"
> -do_populate_sysroot[noexec] = "1"
> +FILES_${PN}-dbg += "${libdir}/${BPN}/${GRUB_TARGET}-efi/.debug"

Technically this is an independent functional change...

> +
> +BBCLASSEXTEND = "native"
> +ALLOW_EMPTY_${PN} = "1"

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



