Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id A46D865D4F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 13:39:18 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id z6so1327616yhz.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 05:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Iv7A9ZNixyLVmSLwVXgVu39zDs6U6zWxH8VFX9FkB3k=;
	b=kSozTvCIUBbX7vIb2T0/W5VC6eWfLKRM8FNjZngd06jYV6fJTnYHlT3Y+p6w55ht1G
	+F8i6BVLelX7AC3M/D7QFlQquUg/D9u20hPB1QfbfLJmFOlAHGWc9yFq+8+Gloi22dYP
	SqLsblg5bnM55dFUzRPfkGzJgbko+NIMDFmwrKJaqqUS1FoxSrGiaJD5DHNH1WpO9PZE
	lkIoXEwlLSTgkRFSltruBRUzKeWq07yZvX2vNqRZQgKdVzmqbyG2p2bPAO3ljGhdxTdq
	4U/4h7e1aB7gsY7FUOS/N6+6K4ayJ/fff3P0S4CHIADBH72Sxs+iCKVBMGZEyi99N7/6
	sgIw==
MIME-Version: 1.0
X-Received: by 10.236.164.232 with SMTP id c68mr618760yhl.102.1416490759102;
	Thu, 20 Nov 2014 05:39:19 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Thu, 20 Nov 2014 05:39:19 -0800 (PST)
In-Reply-To: <1416477996-13841-1-git-send-email-B40290@freescale.com>
References: <1416477996-13841-1-git-send-email-B40290@freescale.com>
Date: Thu, 20 Nov 2014 11:39:19 -0200
X-Google-Sender-Auth: Eyt50-SkHkKVSsQr4KxPBxtNwLw
Message-ID: <CAP9ODKrqNDd4eWZDTwuH=4XvC=+wfq2gCE1enRTWKD6ge48Rpg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chunrong Guo <B40290@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] u-boot.inc : add compile multiple u-boot feature
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
X-List-Received-Date: Thu, 20 Nov 2014 13:39:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 20, 2014 at 8:06 AM, Chunrong Guo <B40290@freescale.com> wrote:
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 42 ++++++++++++++------------------------
>  1 file changed, 15 insertions(+), 27 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index c695b73..f420061 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -24,6 +24,7 @@ UBOOT_LOCALVERSION ?= ""
>  # Some versions of u-boot use .bin and others use .img.  By default use .bin
>  # but enable individual recipes to change this value.
>  UBOOT_SUFFIX ??= "bin"
> +UBOOT_DEF_IMAGE ?= ""
>  UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
>  UBOOT_BINARY ?= "u-boot.${UBOOT_SUFFIX}"
>  UBOOT_SYMLINK ?= "u-boot-${MACHINE}.${UBOOT_SUFFIX}"
> @@ -33,9 +34,6 @@ UBOOT_MAKE_TARGET ?= "all"
>  # should be packaged along with the u-boot binary as well as placed in the
>  # deploy directory.  For those versions they can set the following variables
>  # to allow packaging the SPL.
> -SPL_BINARY ?= ""
> -SPL_IMAGE ?= "${SPL_BINARY}-${MACHINE}-${PV}-${PR}"
> -SPL_SYMLINK ?= "${SPL_BINARY}-${MACHINE}"
>
>  # Additional environment variables or a script can be installed alongside
>  # u-boot to be used automatically on boot.  This file, typically 'uEnv.txt'
> @@ -63,25 +61,25 @@ do_compile () {
>                 echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
>         fi
>
> -       oe_runmake ${UBOOT_MACHINE}
> -       oe_runmake ${UBOOT_MAKE_TARGET}
> +
> +    for type in ${UBOOT_MACHINE}; do
> +           oe_runmake O=${type} ${type}
> +           oe_runmake O=${type} ${UBOOT_MAKE_TARGET}
> +        cp  ${S}/${type}/${UBOOT_BINARY}  ${S}/${type}/u-boot-${type}.bin
> +    done

You are mixing indenting levels here; please fix.

>  }
>
>  do_install () {
> -    install -d ${D}/boot
> -    install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> -    ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
>
> +    for type in ${UBOOT_MACHINE}; do
> +        install -d ${D}/boot
> +        install ${S}/${type}/u-boot-${type}.bin ${D}/boot/u-boot-${type}.bin
> +    done
>      if [ -e ${WORKDIR}/fw_env.config ] ; then
>          install -d ${D}${sysconfdir}
>          install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
>      fi
>
> -    if [ "x${SPL_BINARY}" != "x" ]
> -    then
> -        install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
> -        ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
> -    fi

You seem to have broken the SPL support here.

>      if [ "x${UBOOT_ENV}" != "x" ]
>      then
> @@ -93,21 +91,11 @@ do_install () {
>  FILES_${PN} = "/boot ${sysconfdir}"
>
>  do_deploy () {
> -    install -d ${DEPLOYDIR}
> -    install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
>
> -    cd ${DEPLOYDIR}
> -    rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
> -    ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
> -    ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
> -
> -    if [ "x${SPL_BINARY}" != "x" ]
> -    then
> -        install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
> -        rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}
> -        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
> -        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
> -    fi
> +    for type in ${UBOOT_MACHINE}; do
> +        install -d ${DEPLOYDIR}
> +        install ${S}/${type}/u-boot-${type}.bin ${DEPLOYDIR}/u-boot-${type}.bin
> +    done
>
>      if [ "x${UBOOT_ENV}" != "x" ]
>      then
> --
> 1.9.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

