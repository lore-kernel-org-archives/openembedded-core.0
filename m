Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A1ECAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 14:22:53 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.18257.1758637364009536285
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 07:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JKgIPZxp;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58NEMhT11468825
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 09:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758637363;
	bh=d7IrZX7latv8mOa3lGavZvkwMAWC+TkMOAeNuZNlWEI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=JKgIPZxp53HjXrpk0Lk2lDFjoPreaCcv9Qef6bTpFTMP5ABLeUHrgtWUh5NP9hq6+
	 suJ7TyJlsnPntTo00wS+Kus+fXVP+oqfoJqUL7f4UA4o84qNPWEZ7+7QUHlhvHYPag
	 ++Rqbdl2utnkInas54QzRFZU/JRGp5acpDYEu4L8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58NEMhDk2032356
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 09:22:43 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 09:22:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 09:22:43 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58NEMhus171004
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 09:22:43 -0500
Message-ID: <3f8dedc8-1398-49a9-a8cc-95d7489b53c6@ti.com>
Date: Tue, 23 Sep 2025 09:22:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] u-boot: Add specifying make options as part the
 config looping
To: <openembedded-core@lists.openembedded.org>
References: <20250923142106.20096-1-reatmon@ti.com>
 <1867EF4716E8ED43.18262@lists.openembedded.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1867EF4716E8ED43.18262@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 14:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223882


Ignore this patch...  I accidentally sent it (not sure how).  I'm not 
ready to send it yet.  Still need to do some more testing internally.

Feel free to comment as an RFC in the meantime if you would like.



On 9/23/2025 9:21 AM, Ryan Eatmon via lists.openembedded.org wrote:
> There is a need to generate alternative versions of the uboot files
> using the existing config looping system, but we need to add additional
> settings to the make call rather simply specifying a different config.
> Specifically we have two use cases:
> 
> 1) We want to sign the same uboot files with two different keys where
>     the key will be passed on the make call.
> 2) We want to include the alternative defconfigs from a different
>     repository and need to add the path to this new location on the make
>     command line.
> 
> This introduces a fourth value for the UBOOT_CONFIG settings:
> 
>    config,images,binary,make_opts
> 
> The values are placed into a new generated variable
> UBOOT_CONFIG_MAKE_OPTS which is a '?' separated list since space can be
> present if you need to specify multiple options.  This is handled by
> changing IFS in the shell code when looping over the variable.
> 
> Additionally, add in a new variable UBOOT_MAKE_OPTS which is added to
> the make calls in the various do_compile functions that do the actual
> compiling.
> 
> Upstream-Status: Pending
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta/classes-recipe/uboot-config.bbclass     | 15 +++++++++++++--
>   meta/recipes-bsp/u-boot/u-boot-configure.inc | 18 +++++++++++++++---
>   meta/recipes-bsp/u-boot/u-boot.inc           | 16 ++++++++++++++--
>   3 files changed, 42 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
> index bc20913f73..eb82dd3583 100644
> --- a/meta/classes-recipe/uboot-config.bbclass
> +++ b/meta/classes-recipe/uboot-config.bbclass
> @@ -35,6 +35,7 @@ UBOOT_BINARYNAME ?= "${@os.path.splitext(d.getVar("UBOOT_BINARY"))[0]}"
>   UBOOT_IMAGE ?= "${UBOOT_BINARYNAME}-${MACHINE}-${UBOOT_VERSION}.${UBOOT_SUFFIX}"
>   UBOOT_SYMLINK ?= "${UBOOT_BINARYNAME}-${MACHINE}.${UBOOT_SUFFIX}"
>   UBOOT_MAKE_TARGET ?= "all"
> +UBOOT_MAKE_OPTS ?= ""
>   
>   # Output the ELF generated. Some platforms can use the ELF file and directly
>   # load it (JTAG booting, QEMU) additionally the ELF can be used for debugging
> @@ -103,6 +104,7 @@ python () {
>       ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
>       ubootbinary = d.getVar('UBOOT_BINARY')
>       ubootbinaries = d.getVar('UBOOT_BINARIES')
> +    ubootconfigmakeopts = d.getVar('UBOOT_CONFIG_MAKE_OPTS')
>       # The "doc" varflag is special, we don't want to see it here
>       ubootconfigflags.pop('doc', None)
>       ubootconfig = (d.getVar('UBOOT_CONFIG') or "").split()
> @@ -120,6 +122,9 @@ python () {
>       if ubootconfigflags and ubootbinaries:
>           raise bb.parse.SkipRecipe("You cannot use UBOOT_BINARIES as it is internal to uboot_config.bbclass.")
>   
> +    if ubootconfigflags and ubootconfigmakeopts:
> +        raise bb.parse.SkipRecipe("You cannot use UBOOT_CONFIG_MAKE_OPTS as it is internal to uboot_config.bbclass.")
> +
>       if len(ubootconfig) > 0:
>           for config in ubootconfig:
>               found = False
> @@ -127,8 +132,8 @@ python () {
>                   if config == f:
>                       found = True
>                       items = v.split(',')
> -                    if items[0] and len(items) > 3:
> -                        raise bb.parse.SkipRecipe('Only config,images,binary can be specified!')
> +                    if items[0] and len(items) > 4:
> +                        raise bb.parse.SkipRecipe('Only config,images,binary,make_opts can be specified!')
>                       d.appendVar('UBOOT_MACHINE', ' ' + items[0])
>                       # IMAGE_FSTYPES appending
>                       if len(items) > 1 and items[1]:
> @@ -140,6 +145,12 @@ python () {
>                       else:
>                           bb.debug(1, "Appending '%s' to UBOOT_BINARIES." % ubootbinary)
>                           d.appendVar('UBOOT_BINARIES', ' ' + ubootbinary)
> +                    if len(items) > 3 and items[3]:
> +                        bb.debug(1, "Appending '%s' to UBOOT_CONFIG_MAKE_OPTS." % items[3])
> +                        d.appendVar('UBOOT_CONFIG_MAKE_OPTS', items[3] + " ? ")
> +                    else:
> +                        bb.debug(1, "Appending '%s' to UBOOT_CONFIG_MAKE_OPTS." % "")
> +                        d.appendVar('UBOOT_CONFIG_MAKE_OPTS', " ? ")
>                       break
>   
>               if not found:
> diff --git a/meta/recipes-bsp/u-boot/u-boot-configure.inc b/meta/recipes-bsp/u-boot/u-boot-configure.inc
> index a15511f8b2..bada506b66 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-configure.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-configure.inc
> @@ -33,7 +33,19 @@ uboot_configure_config () {
>       config=$1
>       type=$2
>   
> -    oe_runmake -C ${S} O=${B}/${config} ${config}
> +    unset k
> +    IFS="?"
> +    uboot_config_make_opts="${UBOOT_CONFIG_MAKE_OPTS}"
> +    for config_make_opts in $uboot_config_make_opts; do
> +        k=$(expr $k + 1);
> +        if [ $k -eq $i ]; then
> +            break
> +        fi
> +    done
> +    unset IFS
> +    unset k
> +
> +    oe_runmake -C ${S} O=${B}/${config} ${config_make_opts} ${UBOOT_MAKE_OPTS} ${config}
>       if [ -n "${@' '.join(find_cfgs(d))}" ]; then
>           merge_config.sh -m -O ${B}/${config} ${B}/${config}/.config ${@" ".join(find_cfgs(d))}
>           oe_runmake -C ${S} O=${B}/${config} oldconfig
> @@ -42,9 +54,9 @@ uboot_configure_config () {
>   
>   uboot_configure () {
>       if [ -n "${UBOOT_MACHINE}" ]; then
> -        oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
> +        oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_OPTS} ${UBOOT_MACHINE}
>       else
> -        oe_runmake -C ${S} O=${B} oldconfig
> +        oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_OPTS} oldconfig
>       fi
>       merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
>       cml1_do_configure
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index b7242de5de..e0a69e740e 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -75,7 +75,19 @@ uboot_compile_config () {
>       config=$2
>       type=$3
>   
> -    oe_runmake -C ${S} O=${B}/${config} ${UBOOT_MAKE_TARGET}
> +    unset k
> +    IFS="?"
> +    uboot_config_make_opts="${UBOOT_CONFIG_MAKE_OPTS}"
> +    for config_make_opts in $uboot_config_make_opts; do
> +        k=$(expr $k + 1);
> +        if [ $k -eq $i ]; then
> +            break
> +        fi
> +    done
> +    unset IFS
> +    unset k
> +
> +    oe_runmake -C ${S} O=${B}/${config} ${config_make_opts} ${UBOOT_MAKE_OPTS} ${UBOOT_MAKE_TARGET}
>   
>       unset k
>       for binary in ${UBOOT_BINARIES}; do
> @@ -102,7 +114,7 @@ uboot_compile_config_copy_binary () {
>   }
>   
>   uboot_compile () {
> -    oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
> +    oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_OPTS} ${UBOOT_MAKE_TARGET}
>   
>       # Generate the uboot-initial-env
>       if [ -n "${UBOOT_INITIAL_ENV}" ]; then
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223880): https://lists.openembedded.org/g/openembedded-core/message/223880
> Mute This Topic: https://lists.openembedded.org/mt/115394716/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

