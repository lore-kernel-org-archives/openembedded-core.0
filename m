Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706C7E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 20:22:53 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.47296.1733516567833586059
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 12:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dGWuwq46;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B6KMhJP2409642
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Dec 2024 14:22:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733516563;
	bh=KdZ3LWwbVj4AvFcNu932o+PsUE8V5GFElgkBQu7SCoE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dGWuwq46thFIf1C+vsdUZKi2EOsSM/mEFd8sk6PsUzgc8Hb3qA0cmTcfg7WeQQac2
	 uwfQRgTvRh7N+wUBQVWbrv1xNYGc9YijlhsqOfltbiNsk6hZgRMRpvKwyZDa3z9WL6
	 v3njthmwEIXhlpKH5B0zZVX1MrhOLmIc1BRQAquo=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B6KMhlK061863
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Dec 2024 14:22:43 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Dec 2024 14:22:43 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Dec 2024 14:22:43 -0600
Received: from [10.249.33.166] ([10.249.33.166])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B6KMhke007433;
	Fri, 6 Dec 2024 14:22:43 -0600
Message-ID: <5706b5e4-876e-477e-87fa-2ef98e1c69e6@ti.com>
Date: Fri, 6 Dec 2024 14:22:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] uboot-sign: fix U-Boot binary with public key
To: <majortomtosourcecontrol@gmail.com>,
        <openembedded-core@lists.openembedded.org>
CC: <sean.anderson@seco.com>, <alexandre.belloni@bootlin.com>,
        <al.kochet@gmail.com>
References: <c881ce7a-be09-4190-b209-e4de5b55ff4e@gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <c881ce7a-be09-4190-b209-e4de5b55ff4e@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 20:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208440



On 11/22/2024 9:00 AM, Clayton Casciato via lists.openembedded.org wrote:
> Fixes [YOCTO #15649]
> 
> The U-Boot binary in the "deploy" directory is missing the public key
> when the removed logic branch is used.
> 
> The simple concatenation of the binary and DTB with public key works as
> expected on a BeagleBone Black.
> 
> Given:
> MACHINE = beaglebone-yocto
> UBOOT_SIGN_KEYNAME = "dev"
> 
> Post-patch (poky/build/tmp/deploy/images/beaglebone-yocto):
> $ hexdump -e "16 \"%_p\" \"\\n\"" u-boot-beaglebone-yocto.dtb \
> | tr -d '\n' | grep -o 'key-dev'
> key-dev
> 
> $ hexdump -e "16 \"%_p\" \"\\n\"" u-boot.img \
> | tr -d '\n' | grep -o 'key-dev'
> key-dev
> 
> Non-Poky BeagleBone Black testing (Scarthgap):
> U-Boot 2024.01 [...]
> [...]
> Using 'conf-ti_omap_am335x-boneblack.dtb' configuration
> Verifying Hash Integrity ... sha256,rsa4096:dev+ OK
> Trying 'kernel-1' kernel subimage
> [...]
> 
> Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
> ---
> Sponsor: 21SoftWare LLC
> 
>   meta/classes-recipe/uboot-sign.bbclass | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
> index a17be745ce..7ee73b872a 100644
> --- a/meta/classes-recipe/uboot-sign.bbclass
> +++ b/meta/classes-recipe/uboot-sign.bbclass
> @@ -122,13 +122,7 @@ concat_dtb() {
>   	# If we're not using a signed u-boot fit, concatenate SPL w/o DTB & U-Boot DTB
>   	# with public key (otherwise U-Boot will be packaged by uboot_fitimage_assemble)
>   	if [ "${SPL_SIGN_ENABLE}" != "1" ] ; then
> -		if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
> -			[ -e "${UBOOT_DTB_BINARY}" ]; then
> -			oe_runmake EXT_DTB="${UBOOT_DTB_SIGNED}" ${UBOOT_MAKE_TARGET}
> -			if [ -n "${binary}" ]; then
> -				cp ${binary} ${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
> -			fi
> -		elif [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; then
> +		if [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; then
>   			if [ -n "${binary}" ]; then
>   				cat ${UBOOT_NODTB_BINARY} ${UBOOT_DTB_SIGNED} | tee ${binary} > \
>   					${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}


I have been chasing down all week trying to figure out why our master 
builds all stopped booting properly.  I would have responded to this 
patch sooner, but I also got bit by the BB_DANGLINGAPPENDS_WARNONLY that 
tanked our nightly builds around the same time this patch was accepted 
and the Thanskgiving holiday so that I wasn't even looking at the fact 
that our builds were tanked until Monday.

Removing the entire first if clause just to get to the second might fix 
the bug you were looking for, but our code was relying on that first if 
block to work correctly.

The issue is that UBOOT_SUFFIX is saying to create an .img file, but 
removing the first if clause just installs the .bin file under the 
suffix .img which is just wrong.

I think this patch needs to be reverted and a second attempt at fixing 
the bug needs to be made.



> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207623): https://lists.openembedded.org/g/openembedded-core/message/207623
> Mute This Topic: https://lists.openembedded.org/mt/109723518/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

