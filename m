Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3A8646013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 16:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2DG5c64017577; Fri, 13 Mar 2015 16:05:38 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hMlP1_-c0fRj; Fri, 13 Mar 2015 16:05:38 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2DG5LKd017555
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 13 Mar 2015 16:05:33 GMT
Message-ID: <1426262721.9114.216.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Naresh Bhat <naresh.bhat@linaro.org>
Date: Fri, 13 Mar 2015 16:05:21 +0000
In-Reply-To: <1426258527-2329-5-git-send-email-naresh.bhat@linaro.org>
References: <1426258527-2329-1-git-send-email-naresh.bhat@linaro.org>
	<1426258527-2329-5-git-send-email-naresh.bhat@linaro.org>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: matt.fleming@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core v1 PATCH 4/5] grub: Update grub git recipe
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
X-List-Received-Date: Fri, 13 Mar 2015 16:05:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-03-13 at 20:25 +0530, Naresh Bhat wrote:
> Update the grub git recipe with the following actions for native and target
> - Base class extend to native
> - do_configure_prepend
> - do_install_append
> - do_mkimage native
> - do_deploy
> 
> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
> ---
>  meta/recipes-bsp/grub/grub_git.bb |   48 +++++++++++++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 7 deletions(-)

This commit message isn't up to the job. You listed some things you
changed but didn't say why these are necessary or how this helps. Some
of the changes in here may be better split up a bit too, there seems to
be a lot going on.

> diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
> index 3ab675b..a5ab649 100644
> --- a/meta/recipes-bsp/grub/grub_git.bb
> +++ b/meta/recipes-bsp/grub/grub_git.bb
> @@ -8,6 +8,7 @@ DEFAULT_PREFERENCE_arm = "1"
>  PV = "2.00+${SRCPV}"
>  SRCREV = "87de66d9d83446ecddb29cfbdf7369102c8e209e"
>  SRC_URI = "git://git.savannah.gnu.org/grub.git \
> +           file://cfg \
>             file://grub-2.00-fpmath-sse-387-fix.patch \
>             file://autogen.sh-exclude-pc.patch \
>             file://grub-2.00-add-oe-kernel.patch \
> @@ -18,7 +19,7 @@ S = "${WORKDIR}/git"
>  
>  COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
>  
> -inherit autotools gettext texinfo
> +inherit autotools-brokensep gettext texinfo deploy

Why do we need brokensep? It appears to work at the moment?

>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
> @@ -31,24 +32,57 @@ GRUBPLATFORM_arm = "uboot"
>  GRUBPLATFORM_aarch64 = "efi"
>  GRUBPLATFORM ??= "pc"
>  
> +CACHED_CONFIGUREVARS += "ac_cv_path_HELP2MAN="
>  EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} --disable-grub-mkfont --program-prefix="" \
>                  --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
>  
> +export ac_cv_path_HELP2MAN=""
> +

You need both an export and a CACHED_CONFIGUREVARS?

>  do_configure_prepend() {
> -    ( cd ${S}
> -      ${S}/autogen.sh )
> +      ./autogen.sh
> +}

This is probably why you now need brokensep. Why change the above?

> +
> +do_install_append_class-native() {
> +        install -m 755 -D grub-mkimage ${D}${bindir}
>  }
>  
> -do_install_append () {
> -    install -d ${D}${sysconfdir}/grub.d
> - 
> +do_install_append_class-target() {
> +    # Search for the grub.cfg on the local boot media by using the
> +    # built in cfg file provided via this recipe
> +    grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
> +        -O ${GRUB_TARGET}-${GRUBPLATFORM} -o ./${GRUB_IMAGE} \
> +        boot linux ext2 fat serial part_msdos part_gpt \
> +        normal efi_gop iso9660 search efinet tftp all_video chain \
> +        gfxmenu jpeg gfxterm
> +
> +    install -m 0755 -D ${B}/${GRUB_IMAGE} ${D}${bindir}
> +}
> +
> +GRUB_TARGET_aarch64 = "arm64"
> +GRUB_IMAGE_aarch64 = "grubaa64.efi"

What about the x86 case?

> +do_mkimage_class-native() {
> +        :
>  }
>  
> +do_deploy() {
> +    install -m 0755 -D ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
> +}
> +
> +do_deploy_class-native() {
> +        :
> +}
> +
> +addtask deploy after do_install before do_build

Why do we need to start deploying grub?

>  # debugedit chokes on bare metal binaries
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  
> -RDEPENDS_${PN} = "diffutils freetype"
> +RDEPENDS_${PN}_class-target = "diffutils freetype"
>  FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
>  
>  INSANE_SKIP_${PN} = "arch"
>  INSANE_SKIP_${PN}-dbg = "arch"
> +
> +DEPENDS_class-target += "grub-native"

Why?

> +BBCLASSEXTEND = "native"

Cheers,

Richard


