Return-Path: <sbabic@denx.de>
X-Greylist: delayed 450 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 26 Jul 2019 16:17:24 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id B39DD7F1C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 16:17:24 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 45wDYv2jxNz1rD8r;
	Fri, 26 Jul 2019 18:09:55 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 45wDYv2JQQz1qqkH;
	Fri, 26 Jul 2019 18:09:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 4ENw_zUC0RTK; Fri, 26 Jul 2019 18:09:54 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Fri, 26 Jul 2019 18:09:54 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id ADA574540459;
	Fri, 26 Jul 2019 18:09:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new,
	port 10024)
	with ESMTP id 2wBdJvAeEAVZ; Fri, 26 Jul 2019 18:09:50 +0200 (CEST)
Received: from [192.168.178.89] (stefano-MacBookPro.fritz.box [192.168.178.89])
	by babic.homelinux.org (Postfix) with ESMTPS id 827E945401DD;
	Fri, 26 Jul 2019 18:09:50 +0200 (CEST)
To: Lukasz Majewski <lukma@denx.de>, akuster808 <akuster808@gmail.com>
References: <20190726074039.26753-1-lukma@denx.de>
From: Stefano Babic <sbabic@denx.de>
Message-ID: <2d08f0f5-dda0-d21b-6b7b-d28d9ca728dd@denx.de>
Date: Fri, 26 Jul 2019 18:09:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726074039.26753-1-lukma@denx.de>
Cc: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] u-boot: Generate default U-Boot environment images
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
X-List-Received-Date: Fri, 26 Jul 2019 16:17:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Lukasz,

On 26/07/19 09:40, Lukasz Majewski wrote:
> This change provides tasks to generate default U-Boot environment images
> from built U-Boot (via. get_default_envs.sh script).
> 
> Those images then can be used to generate wic images (with e.g. eMMC layout).
> With such approach the end user doesn't see the "CRC environment" error
> after the first boot.
> 
> Moreover, those are built per MACHINE (as u-boot itself is) so then could
> be used in SWUpdate scenarios with single tar'ed archive with multiple
> MACHINE specific *.swu images.

By working together with SWUpdate, I am just wondering why this is
necessary. I guess that "default" U-Boot environment images means
"initial" environment. The issue I think you see is if there is no
environment in the storage and boards boot with the linked-in
environment. SWUpdate cannot find such as an environment.

For that, there is a target in u-boot: make u-boot-initial-env. This
generates an ASCII file that can be used by SWUpdate if no environment
is stored and U-Boot starts with the linked-in environemnt. It is enough
to put this file into rootfs and to enable SWUpdate (and libubootenv) to
use it. Create specific image to be stored into a .wic seems
overkilling, and it does not help if for some reason the board comes up
without environment in the flash.

Best regards,
Stefano Babic

> 
> The UBOOT_ENVS_SIZE must be defined in machine specific conf file as well
> as it is also possible to adjust (optionally) the *_ENVS_* variables.
> 
> Test:
> Newest master-next for poky repo - SHA1: eb5b0a0b5e53a6e55a09e66489d3f24d0c6232ee
> MACHINE = "beaglebone-yocto" in local.conf
> bitbake virtual/bootloader
> 
> 
> As a result following links are available in deploy directory:
> u-boot-env.img{_r}.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> 
> ---
> Changes for v2:
> 
> - Move the content of deploy_default_envs task to do_deploy
> - Move the content of gen_default_envs task to do_compile
> - Create the u-boot-env.img{r} conditionally, only when UBOOT_ENVS_SIZE is
>   defined
> - Change the commit title to reflect changes done for v2
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 9a754fd09b..7ede2da0eb 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -68,6 +68,13 @@ UBOOT_EXTLINUX_INSTALL_DIR ?= "/boot/extlinux"
>  UBOOT_EXTLINUX_CONF_NAME ?= "extlinux.conf"
>  UBOOT_EXTLINUX_SYMLINK ?= "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"
>  
> +# U-Boot variables necessary for extracting default envs from build U-Boot
> +DEFAULT_UBOOT_ENVS_FILE ?= "u-boot-env"
> +DEFAULT_ENVS ?= "${DEFAULT_UBOOT_ENVS_FILE}.txt"
> +UBOOT_ENVS_DEFAULT ?= "${DEFAULT_UBOOT_ENVS_FILE}-${MACHINE}-${PV}-${PR}.img"
> +# The UBOOT_ENVS_SIZE needs to defined in the <machine>.conf file
> +# UBOOT_ENVS_SIZE = "65536"
> +
>  # returns all the elements from the src uri that are .cfg files
>  def find_cfgs(d):
>      sources=src_patches(d, True)
> @@ -132,6 +139,19 @@ do_compile () {
>          oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
>      fi
>  
> +    # Generate default environment
> +    if [ -n "${UBOOT_ENVS_SIZE}" ]
> +    then
> +        ${B}/source/scripts/get_default_envs.sh ${B} > ${B}/${DEFAULT_ENVS}
> +
> +        # Generate env image
> +        ${B}/tools/mkenvimage -s ${UBOOT_ENVS_SIZE} -o ${B}/${UBOOT_ENVS_DEFAULT} ${B}/${DEFAULT_ENVS}
> +
> +        # Generate redundant env image
> +        ${B}/tools/mkenvimage -r -s ${UBOOT_ENVS_SIZE} -o ${B}/${UBOOT_ENVS_DEFAULT}_r ${B}/${DEFAULT_ENVS}
> +
> +        rm ${B}/${DEFAULT_ENVS}
> +    fi
>  }
>  
>  do_install () {
> @@ -328,6 +348,20 @@ do_deploy () {
>          ln -sf ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}
>          ln -sf ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}
>      fi
> +
> +    if [ -n "${UBOOT_ENVS_SIZE}" ]
> +    then
> +        install -d ${DEPLOYDIR}
> +        install ${B}/${UBOOT_ENVS_DEFAULT} ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}
> +        install ${B}/${UBOOT_ENVS_DEFAULT}_r ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}_r
> +
> +        cd ${DEPLOYDIR}
> +        ln -sf ${UBOOT_ENVS_DEFAULT} ${DEFAULT_UBOOT_ENVS_FILE}.img
> +        ln -sf ${UBOOT_ENVS_DEFAULT}_r ${DEFAULT_UBOOT_ENVS_FILE}.img_r
> +
> +        rm ${B}/${UBOOT_ENVS_DEFAULT}
> +        rm ${B}/${UBOOT_ENVS_DEFAULT}_r
> +    fi
>  }
>  
>  addtask deploy before do_build after do_compile
> 

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

