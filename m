Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1977.1585678035552119990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 11:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E1A7C40C32;
	Tue, 31 Mar 2020 18:07:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dpWAEAWO7NKY; Tue, 31 Mar 2020 18:07:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9C94A40C21;
	Tue, 31 Mar 2020 18:07:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 020C81718F1; Tue, 31 Mar 2020 14:07:09 -0400 (EDT)
Date: Tue, 31 Mar 2020 14:07:09 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Otavio Salvador <otavio.salvador@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Tom Rini <trini@konsulko.com>, Stefano Babic <sbabic@denx.de>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [OE-core] [PATCH] u-boot: Add UBOOT_LOCALVERSION_AUTO support
Message-ID: <20200331180709.GM1578@denix.org>
References: <20200331174641.1094071-1-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <20200331174641.1094071-1-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2020 at 02:46:41PM -0300, Otavio Salvador wrote:
> Add the Git revision used for the build. It is very useful especially when
> using custom or vendor U-Boot forks so we can map a binary to a specific
> source revision. Valid values are "0" or "1".

Well, UBOOT_LOCALVERSION was originally added specifically for this purpose - 
to be able to append git hash.


> This is based on a class which has been in use in `meta-freescale` BSP
> for years and has been very useful especially for custom U-Boot releases
> as it allow we to know the exact Git revision used for the binary.

And in meta-ti BSP we've used for many years:
UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}')}"

And get_git_revision() just calls "git rev-parse HEAD"

So, it seems a bit redundant to add another variable for this...

-- 
Denys


> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>  meta/recipes-bsp/u-boot/u-boot.inc | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index b13db224732..39d35500e11 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -24,6 +24,11 @@ PACKAGECONFIG[openssl] = ",,openssl-native"
>  # file already exists it will not be overwritten.
>  UBOOT_LOCALVERSION ?= ""
>  
> +# Add the Git revision used for the build. It is very useful especially when
> +# using custom or vendor U-Boot forks so we can map a binary to a specific
> +# source revision. Valid values are "0" or "1".
> +UBOOT_LOCALVERSION_AUTO ?= "0"
> +
>  # Some versions of u-boot use .bin and others use .img.  By default use .bin
>  # but enable individual recipes to change this value.
>  UBOOT_SUFFIX ??= "bin"
> @@ -84,6 +89,19 @@ do_configure () {
>              oe_runmake -C ${S} O=${B} oldconfig
>          fi
>          merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
> +
> +        if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
> +            if [ "${UBOOT_LOCALVERSION_AUTO}" = "1" ]; then
> +                # Add GIT revision to the local version
> +                head=`cd ${S} ; git rev-parse --verify --short HEAD 2> /dev/null`
> +                printf "%s%s%s" "${UBOOT_LOCALVERSION}" +g $head > ${S}/.scmversion
> +                printf "%s%s%s" "${UBOOT_LOCALVERSION}" +g $head > ${B}/.scmversion
> +            else
> +                printf "%s" "${UBOOT_LOCALVERSION}" > ${S}/.scmversion
> +                printf "%s" "${UBOOT_LOCALVERSION}" > ${B}/.scmversion
> +            fi
> +        fi
> +
>          cml1_do_configure
>      else
>          DEVTOOL_DISABLE_MENUCONFIG=true
> @@ -99,12 +117,6 @@ do_compile () {
>  	unset CFLAGS
>  	unset CPPFLAGS
>  
> -	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
> -	then
> -		echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
> -		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
> -	fi
> -
>      if [ -n "${UBOOT_CONFIG}" ]
>      then
>          unset i j k
> -- 
> 2.26.0
> 

> 

