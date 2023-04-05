Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11768C7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 14:22:39 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.131312.1680704551845145167
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 07:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VnxdqHYe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F04831BF203;
	Wed,  5 Apr 2023 14:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680704549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iwSAnr0z0ceRuPsoe1UrTTlBNnuEKtaFUmNUA9i8LZQ=;
	b=VnxdqHYet9sP4isZFc6UXDBPtQuGOfVA5IcN/NllQjYwQgtZX54YwhMfXLmjcZj13TNqUh
	mfmKU89KlXf4Wapt6iIwsloC8xs99k4RC7cWIuxfTeSLbISv+6hVh57EWyABM713k2p0Hh
	jyafu1RFmmialHCyo/9ds5k1GzyaSMbG6Qeu4xBkjSyvLBP2wc8bWZ9H2MNMV0dSqcau2e
	ofBWv0MBbNC9IgBCylsasAyPBAobjMR7XCTAAADV3q1+61Dk29a3734BW7jODeTfogCH6A
	3UuTRKag6OAfj6kCjGFuKnNKYVyD1fCIEOK4qI72Qct6OFmZTZdqqvvk5rfwlQ==
Date: Wed, 5 Apr 2023 16:22:28 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arslan Ahmad <arslan_ahmad@mentor.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kernel-fitimage: Fix the default dtb config
 check
Message-ID: <202304051422288e84bbf3@mail.local>
References: <20230331061705.435976-1-arslan_ahmad@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331061705.435976-1-arslan_ahmad@mentor.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 14:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179736

Hello,

On 31/03/2023 11:17:04+0500, Arslan Ahmad wrote:
> From: Arslan Ahmad <arslan_ahmad@mentor.com>
> 
> The current check for default dtb image checks if the file exists and is
> not empty but appends a slash to the path due to which the file is never
> found. It also doesn't replace slash in filename with _ as done when
> populating the DTB variable. A better way to check the existence of the
> device tree would be from the list of DTBs since this is used during
> compilation.
> 
> Signed-off-by: Arslan Ahmad <arslan_ahmad@mentor.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 30 +++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)

This doesn't apply on master, can you rebase?


> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 27e17db951..c75d4e071f 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -345,6 +345,7 @@ EOF
>  # $5 ... u-boot script ID
>  # $6 ... config ID
>  # $7 ... default flag
> +# $8 ... default DTB image name
>  fitimage_emit_section_config() {
>  
>  	conf_csum="${FIT_HASH_ALG}"
> @@ -361,6 +362,7 @@ fitimage_emit_section_config() {
>  	bootscr_id="$5"
>  	config_id="$6"
>  	default_flag="$7"
> +	default_dtb_image="$8"
>  
>  	# Test if we have any DTBs at all
>  	sep=""
> @@ -372,7 +374,6 @@ fitimage_emit_section_config() {
>  	bootscr_line=""
>  	setup_line=""
>  	default_line=""
> -	default_dtb_image="${FIT_CONF_DEFAULT_DTB}"
>  
>  	# conf node name is selected based on dtb ID if it is present,
>  	# otherwise its selected based on kernel ID
> @@ -418,11 +419,7 @@ fitimage_emit_section_config() {
>  		        # Select default node as user specified dtb when
>  		        # multiple dtb exists.
>  		        if [ -n "$default_dtb_image" ]; then
> -			        if [ -s "${EXTERNAL_KERNEL_DEVICETREE}/$default_dtb_image" ]; then
> -			                default_line="default = \"${FIT_CONF_PREFIX}$default_dtb_image\";"
> -			        else
> -			                bbwarn "Couldn't find a valid user specified dtb in ${EXTERNAL_KERNEL_DEVICETREE}/$default_dtb_image"
> -			        fi
> +			        default_line="default = \"${FIT_CONF_PREFIX}$default_dtb_image\";"
>  		        else
>  			        default_line="default = \"${FIT_CONF_PREFIX}$dtb_image\";"
>  		        fi
> @@ -504,6 +501,7 @@ fitimage_assemble() {
>  	ramdiskcount=$3
>  	setupcount=""
>  	bootscr_id=""
> +	default_dtb_image=""
>  	rm -f $1 arch/${ARCH}/boot/$2
>  
>  	if [ -n "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}" = "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
> @@ -542,6 +540,11 @@ fitimage_assemble() {
>  				DTB_PATH="arch/${ARCH}/boot/$DTB"
>  			fi
>  
> +			# Set the default dtb image if it exists in the devicetree.
> +			if [ ${FIT_CONF_DEFAULT_DTB} = $DTB ];then
> +				default_dtb_image=$(echo "$DTB" | tr '/' '_')
> +			fi
> +
>  			DTB=$(echo "$DTB" | tr '/' '_')
>  
>  			# Skip DTB if we've picked it up previously
> @@ -556,6 +559,11 @@ fitimage_assemble() {
>  		dtbcount=1
>  		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -printf '%P\n' | sort) \
>  		$(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' -printf '%P\n' | sort); do
> +			# Set the default dtb image if it exists in the devicetree.
> +			if [ ${FIT_CONF_DEFAULT_DTB} = $DTB ];then
> +				default_dtb_image=$(echo "$DTB" | tr '/' '_')
> +			fi
> +
>  			DTB=$(echo "$DTB" | tr '/' '_')
>  
>  			# Skip DTB/DTBO if we've picked it up previously
> @@ -566,6 +574,10 @@ fitimage_assemble() {
>  		done
>  	fi
>  
> +	if [ -n "${FIT_CONF_DEFAULT_DTB}" ] && [ -z $default_dtb_image ]; then 
> +		bbwarn "${FIT_CONF_DEFAULT_DTB} is not available in the list of device trees."
> +	fi
> +
>  	#
>  	# Step 3: Prepare a u-boot script section
>  	#
> @@ -638,15 +650,15 @@ fitimage_assemble() {
>  		for DTB in ${DTBS}; do
>  			dtb_ext=${DTB##*.}
>  			if [ "$dtb_ext" = "dtbo" ]; then
> -				fitimage_emit_section_config $1 "" "$DTB" "" "$bootscr_id" "" "`expr $i = $dtbcount`"
> +				fitimage_emit_section_config $1 "" "$DTB" "" "$bootscr_id" "" "`expr $i = $dtbcount`" "$default_dtb_image"
>  			else
> -				fitimage_emit_section_config $1 $kernelcount "$DTB" "$ramdiskcount" "$bootscr_id" "$setupcount" "`expr $i = $dtbcount`"
> +				fitimage_emit_section_config $1 $kernelcount "$DTB" "$ramdiskcount" "$bootscr_id" "$setupcount" "`expr $i = $dtbcount`" "$default_dtb_image"
>  			fi
>  			i=`expr $i + 1`
>  		done
>  	else
>  		defaultconfigcount=1
> -		fitimage_emit_section_config $1 $kernelcount "" "$ramdiskcount" "$bootscr_id"  "$setupcount" $defaultconfigcount
> +		fitimage_emit_section_config $1 $kernelcount "" "$ramdiskcount" "$bootscr_id"  "$setupcount" $defaultconfigcount "$default_dtb_image"
>  	fi
>  
>  	fitimage_emit_section_maint $1 sectend
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179400): https://lists.openembedded.org/g/openembedded-core/message/179400
> Mute This Topic: https://lists.openembedded.org/mt/97968048/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

