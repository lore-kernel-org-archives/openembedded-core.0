Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3675.1586725641724314051
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2020 14:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 10E7940C11;
	Sun, 12 Apr 2020 21:07:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fnk8O9LqYbc9; Sun, 12 Apr 2020 21:07:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 78D22409E7;
	Sun, 12 Apr 2020 21:07:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E3A761724AE; Sun, 12 Apr 2020 17:07:15 -0400 (EDT)
Date: Sun, 12 Apr 2020 17:07:15 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Otavio Salvador <otavio.salvador@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Stefano Babic <sbabic@denx.de>, Tom Rini <trini@konsulko.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [OE-core] [PATCH v3] u-boot: Restore valid default environment for running system
Message-ID: <20200412210715.GE1578@denix.org>
References: <20200402001431.435999-1-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <20200402001431.435999-1-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 01, 2020 at 09:14:31PM -0300, Otavio Salvador wrote:
> One significant change from previous OE-Core releases was the move from
> u-boot-fw-utils to libubootenv which offers a generic and not machine
> specific alternative. However, it is not fully functional as currently
> we don't provide the default environment nor the required configuration
> file to be used by it.
> 
> This change address this and include on the default u-boot.inc the
> needed code to generate, install and deploy the default environment.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> This change is late in the cycle but it is critical in my opinion.
> 
> The lack of default environment as well as the configuration for the
> tool is a regression from the previous release and this mitigates it.
> 
> Changes in v3:
> - Remove rrecommends in libubootenv
> - Add ${MACHINE} to the files following other binaries
> - Change commit log
> 
> Changes in v2:
> - Fix wrong path on do_install
> - Change virtual/bootloader-env to u-boot-default-env (RP)
> - Add Tom Rini and Stefano Babic to Cc
> 
>  meta/recipes-bsp/u-boot/u-boot.inc | 62 +++++++++++++++++++++++++-----
>  1 file changed, 53 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index d4ab9c3222e..dc4f7884b82 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -134,6 +134,11 @@ do_compile () {
>                              cp ${B}/${config}/${binary} ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
>                          fi
>                      done
> +
> +                    # Generate the uboot-initial-env
> +                    oe_runmake -C ${S} O=${B}/${config} u-boot-initial-env
> +                    cp ${B}/${config}/u-boot-initial-env ${B}/${config}/u-boot-initial-env-${type}
> +
>                      unset k
>                  fi
>              done
> @@ -142,6 +147,9 @@ do_compile () {
>          unset  i
>      else
>          oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
> +
> +        # Generate the uboot-initial-env
> +        oe_runmake -C ${S} O=${B} u-boot-initial-env

So, why is this enabled unconditionally? Should this be in UBOOT_MAKE_TARGET?

I use this .inc file for building different u-boot pieces by different recipes 
(main u-boot, SPL, etc., etc.) controlling the build with UBOOT_MAKE_TARGET 
below. Now each of those generate u-boot-initial-env and they clash in deploy.


> This change is late in the cycle but it is critical in my opinion.
> 
> The lack of default environment as well as the configuration for the
> tool is a regression from the previous release and this mitigates it.

Well, I would rather live w/o env rather than unable to build u-boot at all...


>      fi
>  
>  }
> @@ -155,19 +163,28 @@ do_install () {
>                  j=$(expr $j + 1);
>                  if [ $j -eq $i ]
>                  then
> -                    install -d ${D}/boot
> -                    install -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> +                    install -D -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
>                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
>                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
> +
> +                    # Install the uboot-initial-env
> +                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
> +                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${type}
> +                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${type}
> +                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env
>                  fi
>              done
>              unset  j
>          done
>          unset  i
>      else
> -        install -d ${D}/boot
> -        install -m 644 ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> +        install -D -m 644 ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
>          ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> +
> +        # Install the uboot-initial-env
> +        install -D -m 644 ${B}/u-boot-initial-env ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${PV}-${PR}
> +        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}
> +        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env
>      fi
>  
>      if [ -n "${UBOOT_ELF}" ]
> @@ -236,7 +253,16 @@ do_install () {
>  
>  }
>  
> -FILES_${PN} = "/boot ${sysconfdir} ${datadir}"
> +PACKAGE_BEFORE_PN += "${PN}-env"
> +
> +RPROVIDES_${PN}-env += "u-boot-default-env"
> +FILES_${PN}-env = " \
> +    ${sysconfdir}/u-boot-initial-env* \
> +    ${sysconfdir}/fw_env.config \
> +"
> +
> +FILES_${PN} = "/boot ${datadir}"
> +RDEPENDS_${PN} += "${PN}-env"
>  
>  do_deploy () {
>      if [ -n "${UBOOT_CONFIG}" ]
> @@ -247,25 +273,43 @@ do_deploy () {
>                  j=$(expr $j + 1);
>                  if [ $j -eq $i ]
>                  then
> -                    install -d ${DEPLOYDIR}
> -                    install -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> +                    install -D -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
>                      cd ${DEPLOYDIR}
>                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
>                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
>                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}-${type}
>                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
> +
> +                    # Deploy the uboot-initial-env
> +                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
> +                    cd ${DEPLOYDIR}
> +                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} u-boot-initial-env-${MACHINE}-${type}
> +                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} u-boot-initial-env-${type}
>                  fi
>              done
>              unset  j
>          done
>          unset  i
>      else
> -        install -d ${DEPLOYDIR}
> -        install -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
> +        install -D -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
> +
>          cd ${DEPLOYDIR}
>          rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
>          ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
>          ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
> +
> +        # Deploy the uboot-initial-env
> +        install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR}
> +        cd ${DEPLOYDIR}
> +        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} u-boot-initial-env-${MACHINE}
> +        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} u-boot-initial-env
> +    fi
> +
> +    if [ -e ${WORKDIR}/fw_env.config ] ; then
> +        install -D -m 644 ${WORKDIR}/fw_env.config ${DEPLOYDIR}/fw_env.config-${MACHINE}-${PV}-${PR}
> +        cd ${DEPLOYDIR}
> +        ln -sf fw_env.config-${MACHINE}-${PV}-${PR} fw_env.config-${MACHINE}
> +        ln -sf fw_env.config-${MACHINE}-${PV}-${PR} fw_env.config
>      fi
>  
>      if [ -n "${UBOOT_ELF}" ]
> -- 
> 2.26.0
> 

> 

