Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.17904.1590343874209263187
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2020 11:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9223740BEF;
	Sun, 24 May 2020 18:11:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wwfozw6k5ByQ; Sun, 24 May 2020 18:11:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4A93B40A35;
	Sun, 24 May 2020 18:11:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B1F7F173205; Sun, 24 May 2020 14:11:08 -0400 (EDT)
Date: Sun, 24 May 2020 14:11:08 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ming Liu <liu.ming50@gmail.com>
Cc: openembedded-core@lists.openembedded.org, stefan.agner@toradex.com,
	max.krummenacher@toradex.com, Ming Liu <ming.liu@toradex.com>
Subject: Re: [OE-core] [PATCH] u-boot: change ${PN} to u-boot when install/deploy u-boot-init-env
Message-ID: <20200524181108.GE17660@denix.org>
References: <20200524161751.22577-1-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200524161751.22577-1-liu.ming50@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 24, 2020 at 06:17:51PM +0200, Ming Liu wrote:
> From: Ming Liu <ming.liu@toradex.com>
> 
> It's really inconvenient to have ${PN} as part of the name of
> u-boot-init-env, for instance, in BSP layers, it could be u-boot-fslc,
> u-boot-qoriq, u-boot-toradex, and so on.
> 
> Considerring there is only one virtual/bootloader for a build, we could
> replace ${PN} with u-boot to not have to distinguish different names
> when accessing it.

Have you tried git log?
Have you heard of multi-stage bootloaders and chain-loading?
Assumption that there's a single u-boot per platform built is long since 
outdated - please don't break other's use cases for a tiny bit of convenience.

A better approach here would be:
1. make it completely optional to build/install/deploy this u-boot-initial-env
2. make it fully configurable with vars like UBOOT_BINARY, SPL_BINARY, 
UBOOT_ELF. UBOOT_ENV, etc.

-- 
Denys


> Signed-off-by: Ming Liu <ming.liu@toradex.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 80f828df52..188e5295cf 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -156,10 +156,10 @@ do_install () {
>                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
>  
>                      # Install the uboot-initial-env
> -                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR}
> -                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${type}
> -                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env-${type}
> -                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env
> +                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
> +                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${type}
> +                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${type}
> +                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env
>                  fi
>              done
>              unset  j
> @@ -170,9 +170,9 @@ do_install () {
>          ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
>  
>          # Install the uboot-initial-env
> -        install -D -m 644 ${B}/u-boot-initial-env ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}-${PV}-${PR}
> -        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env-${MACHINE}
> -        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env
> +        install -D -m 644 ${B}/u-boot-initial-env ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${PV}-${PR}
> +        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}
> +        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env
>      fi
>  
>      if [ -n "${UBOOT_ELF}" ]
> @@ -245,7 +245,7 @@ PACKAGE_BEFORE_PN += "${PN}-env"
>  
>  RPROVIDES_${PN}-env += "u-boot-default-env"
>  FILES_${PN}-env = " \
> -    ${sysconfdir}/${PN}-initial-env* \
> +    ${sysconfdir}/u-boot-initial-env* \
>      ${sysconfdir}/fw_env.config \
>  "
>  
> @@ -269,10 +269,10 @@ do_deploy () {
>                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
>  
>                      # Deploy the uboot-initial-env
> -                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR}
> +                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
>                      cd ${DEPLOYDIR}
> -                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${PN}-initial-env-${MACHINE}-${type}
> -                    ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${PN}-initial-env-${type}
> +                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} u-boot-initial-env-${MACHINE}-${type}
> +                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} u-boot-initial-env-${type}
>                  fi
>              done
>              unset  j
> @@ -287,10 +287,10 @@ do_deploy () {
>          ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
>  
>          # Deploy the uboot-initial-env
> -        install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR}
> +        install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR}
>          cd ${DEPLOYDIR}
> -        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${PN}-initial-env-${MACHINE}
> -        ln -sf ${PN}-initial-env-${MACHINE}-${PV}-${PR} ${PN}-initial-env
> +        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} u-boot-initial-env-${MACHINE}
> +        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} u-boot-initial-env
>      fi
>  
>      if [ -e ${WORKDIR}/fw_env.config ] ; then
> -- 
> 2.26.2
> 

> 

