Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B01FE77179
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 23:31:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.51069.1733527856247417344
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 15:30:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 53AFD40CAF;
	Fri,  6 Dec 2024 23:30:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WwmNLQb3XrYM; Fri,  6 Dec 2024 23:30:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2DC2D40C56;
	Fri,  6 Dec 2024 23:30:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 454B816410A; Fri,  6 Dec 2024 18:30:52 -0500 (EST)
Date: Fri, 6 Dec 2024 18:30:52 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: majortomtosourcecontrol@gmail.com
Cc: steve@sakoman.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [BACKPORT] uboot-sign: fix U-Boot binary with public
 key
Message-ID: <20241206233052.GD23825@denix.org>
References: <6c59a659-d47e-48d5-81af-a729b8533f62@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c59a659-d47e-48d5-81af-a729b8533f62@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 23:31:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208443

Clayton,

This is not the way to request backports. Please just read the list for past 
submissions and it will be clear how those should be made.


Steve,

Please do NOT backport this change to stable releases, as it seems incorrect 
and causes issues downstream and should probably get reverted from master. 

Thanks.



On Tue, Nov 26, 2024 at 08:17:34AM -0700, Clayton Casciato via lists.openembedded.org wrote:
> Hi, Steve!
> 
> I would like to backport this from master to Styhead and Scarthgap.
> 
> Thank you!
> 
> Clayton Casciato
> 
> --
> 
> commit 0d14e99aa18ee38293df63d585fafc270a4538be
> Author: Clayton Casciato <majortomtosourcecontrol@gmail.com>
> Date:   Fri Nov 22 08:00:00 2024 -0700
> 
>     uboot-sign: fix U-Boot binary with public key
>     
>     Fixes [YOCTO #15649]
>     
>     The U-Boot binary in the "deploy" directory is missing the public key
>     when the removed logic branch is used.
>     
>     The simple concatenation of the binary and DTB with public key works as
>     expected on a BeagleBone Black.
>     
>     Given:
>     MACHINE = beaglebone-yocto
>     UBOOT_SIGN_KEYNAME = "dev"
>     
>     Post-patch (poky/build/tmp/deploy/images/beaglebone-yocto):
>     $ hexdump -e "16 \"%_p\" \"\\n\"" u-boot-beaglebone-yocto.dtb \
>     | tr -d '\n' | grep -o 'key-dev'
>     key-dev
>     
>     $ hexdump -e "16 \"%_p\" \"\\n\"" u-boot.img \
>     | tr -d '\n' | grep -o 'key-dev'
>     key-dev
>     
>     Non-Poky BeagleBone Black testing (Scarthgap):
>     U-Boot 2024.01 [...]
>     [...]
>     Using 'conf-ti_omap_am335x-boneblack.dtb' configuration
>     Verifying Hash Integrity ... sha256,rsa4096:dev+ OK
>     Trying 'kernel-1' kernel subimage
>     [...]
>     
>     Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
> index a17be745ce..7ee73b872a 100644
> --- a/meta/classes-recipe/uboot-sign.bbclass
> +++ b/meta/classes-recipe/uboot-sign.bbclass
> @@ -122,13 +122,7 @@ concat_dtb() {
>  	# If we're not using a signed u-boot fit, concatenate SPL w/o DTB & U-Boot DTB
>  	# with public key (otherwise U-Boot will be packaged by uboot_fitimage_assemble)
>  	if [ "${SPL_SIGN_ENABLE}" != "1" ] ; then
> -		if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
> -			[ -e "${UBOOT_DTB_BINARY}" ]; then
> -			oe_runmake EXT_DTB="${UBOOT_DTB_SIGNED}" ${UBOOT_MAKE_TARGET}
> -			if [ -n "${binary}" ]; then
> -				cp ${binary} ${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
> -			fi
> -		elif [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; then
> +		if [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; then
>  			if [ -n "${binary}" ]; then
>  				cat ${UBOOT_NODTB_BINARY} ${UBOOT_DTB_SIGNED} | tee ${binary} > \
>  					${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
> 

