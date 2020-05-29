Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.649.1590782951597771756
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 13:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C812540C14;
	Fri, 29 May 2020 20:09:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VzDZTKzC_eaS; Fri, 29 May 2020 20:09:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 60EA040AB5;
	Fri, 29 May 2020 20:09:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 765881731FF; Fri, 29 May 2020 16:09:02 -0400 (EDT)
Date: Fri, 29 May 2020 16:09:02 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ming Liu <liu.ming50@gmail.com>
Cc: openembedded-core@lists.openembedded.org, stefan.agner@toradex.com,
	max.krummenacher@toradex.com, denys@ti.com,
	Ming Liu <ming.liu@toradex.com>
Subject: Re: [OE-core] [PATCH V3 1/3] u-boot: support merging .cfg files for UBOOT_CONFIG
Message-ID: <20200529200902.GS17660@denix.org>
References: <20200528124129.15100-1-liu.ming50@gmail.com>
 <20200528124129.15100-2-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200528124129.15100-2-liu.ming50@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Is this change really required for UBOOT_INITIAL_ENV? I think you are merging 
several patch series together?


On Thu, May 28, 2020 at 02:41:27PM +0200, Ming Liu wrote:
> From: Ming Liu <ming.liu@toradex.com>
> 
> U-boot recipe supports .cfg files in SRC_URI, but they would be merged
> to .config during do_configure only when UBOOT_MACHINE is set, we
> should also support merging .cfg files for UBOOT_CONFIG.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> Signed-off-by: Ming Liu <ming.liu@toradex.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 80f828df52..8cfd25020c 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -77,7 +77,23 @@ def find_cfgs(d):
>      return sources_list
>  
>  do_configure () {
> -    if [ -z "${UBOOT_CONFIG}" ]; then
> +    if [ -n "${UBOOT_CONFIG}" ]; then
> +        unset i j
> +        for config in ${UBOOT_MACHINE}; do
> +            i=$(expr $i + 1);
> +            for type in ${UBOOT_CONFIG}; do
> +                j=$(expr $j + 1);
> +                if [ $j -eq $i ]; then
> +                    oe_runmake -C ${S} O=${B}/${config} ${config}
> +                    merge_config.sh -m -O ${B}/${config} ${B}/${config}/.config ${@" ".join(find_cfgs(d))}
> +                    oe_runmake -C ${S} O=${B}/${config} oldconfig
> +                fi
> +            done
> +            unset j
> +        done
> +        unset i
> +        DEVTOOL_DISABLE_MENUCONFIG=true
> +    else
>          if [ -n "${UBOOT_MACHINE}" ]; then
>              oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
>          else
> @@ -85,8 +101,6 @@ do_configure () {
>          fi
>          merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
>          cml1_do_configure
> -    else
> -        DEVTOOL_DISABLE_MENUCONFIG=true
>      fi
>  }
>  
> @@ -114,7 +128,6 @@ do_compile () {
>                  j=$(expr $j + 1);
>                  if [ $j -eq $i ]
>                  then
> -                    oe_runmake -C ${S} O=${B}/${config} ${config}
>                      oe_runmake -C ${S} O=${B}/${config} ${UBOOT_MAKE_TARGET}
>                      for binary in ${UBOOT_BINARIES}; do
>                          k=$(expr $k + 1);
> -- 
> 2.26.2
> 

> 

