Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id E88BE6013D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 18:03:21 +0000 (UTC)
Received: by lamq1 with SMTP id q1so16043485lam.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 10:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2TYoBNr5GmC1JLJ46aYC2TdWcaCqgBf3SECQcYKkzjA=;
	b=hQBSoJgeZFEOhqSyDeUTJbeXFgBP4Q6k8nGVR6QZrx5Hyyuvh21sMAC0wnVFrUgBeh
	Xr8lKhXrPaZlM1LCcHSrNtBwKAOg7+igKqtzIpkSnRKXZaVRY5deDlMiFKvExAXo9bRe
	nekmYdVaVoWl0JfCjKgxruxeHYjhIWGDpOLa7USNAjVWZc90Pl1UqEOOEL+6l7QKXI3q
	cAJ4G055RKX0PgfY10VHDfE/Y6SnAsB9wOvoA4fVTOqx3CT7kl7lGtBJWzlwNacfIpPZ
	83WRu1gYowpwBsmQiKDQlf531D6NfJhvYYpJ2Echwsv3+COi7cc9Kv/U16lLKv3hsxmL
	liVA==
MIME-Version: 1.0
X-Received: by 10.112.161.229 with SMTP id xv5mr20113lbb.43.1425405801600;
	Tue, 03 Mar 2015 10:03:21 -0800 (PST)
Received: by 10.152.111.200 with HTTP; Tue, 3 Mar 2015 10:03:21 -0800 (PST)
In-Reply-To: <1425397584-5154-5-git-send-email-naresh.bhat@linaro.org>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
	<1425397584-5154-5-git-send-email-naresh.bhat@linaro.org>
Date: Tue, 3 Mar 2015 19:03:21 +0100
Message-ID: <CAC1BbcS_ZWC38KgLUQceEL6hWt2jz0JE8W09Sjku8zCV5QJJng@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Naresh Bhat <naresh.bhat@linaro.org>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core Yocto PATCH 4/4] grub: Update grub git recipe
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
X-List-Received-Date: Tue, 03 Mar 2015 18:03:26 -0000
Content-Type: text/plain; charset=UTF-8

On 3 March 2015 at 16:46, Naresh Bhat <naresh.bhat@linaro.org> wrote:
> Update the grub git recipe with the following actions for native and non-native
> - Base class extend to native
> - do_configure_prepand

s/prepand/prepend/

> - do_install_append
> - do_mkimage native
> - do_deploy
>
> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
> Reviewed-by: Graeme Gregory <graeme.gregory@linaro.org>
> Reviewed-by: Matt Fleming <matt.fleming@intel.com>
> ---
>  meta/recipes-bsp/grub/grub_git.bb |   51 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 45 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
> index 3ab675b..a2abe01 100644
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
> +inherit autotools gettext texinfo deploy
>
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
> @@ -31,24 +32,62 @@ GRUBPLATFORM_arm = "uboot"
>  GRUBPLATFORM_aarch64 = "efi"
>  GRUBPLATFORM ??= "pc"
>
> +CACHED_CONFIGUREVARS += "ac_cv_path_HELP2MAN="
>  EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} --disable-grub-mkfont --program-prefix="" \
>                  --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
>
> +B = "${S}"
> +
> +export ac_cv_path_HELP2MAN=""
> +
>  do_configure_prepend() {
> -    ( cd ${S}
> -      ${S}/autogen.sh )
> +      ./autogen.sh
> +}

I did not follow the recentish B / S changes so i'm curious if the
part(s) above are an improvement?

> +
> +do_install_append_class-native() {
> +        install -d ${D}${bindir}
> +        install -m 755 grub-mkimage ${D}${bindir}

again, cut down on forks, use install -D

>  }
>
> -do_install_append () {
> +do_install_append_class-target() {
> +    # Search for the grub.cfg on the local boot media by using the
> +    # built in cfg file provided via this recipe
> +    grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
> +        -O ${GRUB_TARGET}-${GRUBPLATFORM} -o ./${GRUB_IMAGE} \
> +        boot linux ext2 fat serial part_msdos part_gpt \
> +        normal efi_gop iso9660 search efinet tftp all_video chain \
> +        gfxmenu jpeg gfxterm
> +
>      install -d ${D}${sysconfdir}/grub.d
> -
> +    install -m 0755 ${B}/${GRUB_IMAGE} ${D}${bindir}

install -D, again?

> +}
> +
> +GRUB_TARGET_aarch64 = "arm64"
> +GRUB_IMAGE_aarch64 = "grubaa64.efi"
> +
> +do_mkimage_class-native() {
> +        :
> +}
> +
> +do_deploy() {
> +    install -d ${DEPLOYDIR}
> +    install -m 0755 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}

.. and again.

PS: Sorry, I seem to be in nitpicking mood right now ;)
thanks,

>  }
>
> +do_deploy_class-native() {
> +        :
> +}
> +
> +addtask deploy after do_install before do_build
> +
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
> +BBCLASSEXTEND = "native"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

