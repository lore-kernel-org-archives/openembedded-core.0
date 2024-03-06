Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C93C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 20:58:25 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.7063.1709758701325739724
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 12:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: a.fatoum@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1rhyLD-0004jS-Qf; Wed, 06 Mar 2024 21:58:19 +0100
Message-ID: <af455b1f-10ee-4f91-93cb-ee796fe67fe3@pengutronix.de>
Date: Wed, 6 Mar 2024 21:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v2] kernel-fitImage: only include valid
 compatible line
Content-Language: en-US
To: christian.taedcke-oss@weidmueller.com,
 openembedded-core@lists.openembedded.org
Cc: denis.osterland@diehl.com,
 Christian Taedcke <christian.taedcke@weidmueller.com>
References: <20240305093628.1094525-1-christian.taedcke-oss@weidmueller.com>
 <20240306164214.445656-1-christian.taedcke-oss@weidmueller.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20240306164214.445656-1-christian.taedcke-oss@weidmueller.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 20:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196756

On 06.03.24 17:42, christian.taedcke-oss@weidmueller.com wrote:
> From: Christian Taedcke <christian.taedcke@weidmueller.com>
> 
> Without this commit the configuration node includes the compatible
> line 'compatible = [00];' if EXTERNAL_KERNEL_DEVICETREE is not
> defined, i.e. if PREFERRED_PROVIDER_virtual/dtb is not used.
> This prevents u-boot from using this configuration and it prints the
> message "Could not find configuration node".
> 
> An additional check also ensures that the written compatible line
> never contains an empty compatible.
> 
> The functionality to add the compatible line was added in commit
> f4c82fb6da89 ("kernel-fitImage: add machine compatible to config
> section").
> 
> Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Thanks,
Ahmad

> ---
>  meta/classes-recipe/kernel-fitimage.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
> index 7e30a5d47e..4b74ddc201 100644
> --- a/meta/classes-recipe/kernel-fitimage.bbclass
> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> @@ -421,6 +421,7 @@ fitimage_emit_section_config() {
>  	bootscr_line=""
>  	setup_line=""
>  	default_line=""
> +	compatible_line=""
>  
>  	dtb_image_sect=$(symlink_points_below $dtb_image "${EXTERNAL_KERNEL_DEVICETREE}")
>  	if [ -z "$dtb_image_sect" ]; then
> @@ -428,7 +429,12 @@ fitimage_emit_section_config() {
>  	fi
>  
>  	dtb_path="${EXTERNAL_KERNEL_DEVICETREE}/${dtb_image_sect}"
> -	compatible_line="compatible = \"$(fdtget "$dtb_path" / compatible | sed 's/ /", "/g')\";"
> +	if [ -e "$dtb_path" ]; then
> +		compat=$(fdtget -t s "$dtb_path" / compatible | sed 's/ /", "/g')
> +		if [ -n "$compat" ]; then
> +			compatible_line="compatible = \"$compat\";"
> +		fi
> +	fi
>  
>  	dtb_image=$(echo $dtb_image | tr '/' '_')
>  	dtb_image_sect=$(echo "${dtb_image_sect}" | tr '/' '_')

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


