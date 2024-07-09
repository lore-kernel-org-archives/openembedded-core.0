Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FA3C3DA42
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 19:49:49 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.5177.1720554580257798307
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 12:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 469JmaIg004586;
	Tue, 9 Jul 2024 14:48:37 -0500
Received: from [192.168.2.37] ([192.168.2.37])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 469JmZXb032521;
	Tue, 9 Jul 2024 14:48:35 -0500
Message-ID: <0508331a-0f95-4507-9c3e-cb91e2ff0e84@kernel.crashing.org>
Date: Tue, 9 Jul 2024 14:48:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 07/14] kernel-fitimage: fix external dtb check
Content-Language: en-US
To: Adrian Freihofer <adrian.freihofer@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
 <20240704071013.2982700-8-adrian.freihofer@gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20240704071013.2982700-8-adrian.freihofer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 19:49:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201681



On 7/4/24 2:09 AM, Adrian Freihofer wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
> 
> If EXTERNAL_KERNEL_DEVICETREE and dtb_image_sect are empty variables
> dtb_path ends up as "/" which is available on most Unix systems but
> probably not the dtb_path which is needed here. Checking for a file
> makes more sense and also solves the issue with the "/".
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   meta/classes-recipe/kernel-fitimage.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
> index 6e6898e5f6f..664ebc65d7c 100644
> --- a/meta/classes-recipe/kernel-fitimage.bbclass
> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> @@ -429,7 +429,7 @@ fitimage_emit_section_config() {
>   	fi
>   
>   	dtb_path="${EXTERNAL_KERNEL_DEVICETREE}/${dtb_image_sect}"
> -	if [ -e "$dtb_path" ]; then
> +	if [ -f "$dtb_path" ]; then
>   		compat=$(fdtget -t s "$dtb_path" / compatible | sed 's/ /", "/g')
>   		if [ -n "$compat" ]; then
>   			compatible_line="compatible = \"$compat\";"

I can understand avoiding directories with this, but I've definitely seen cases 
where the dtb_path is pointing to a symbolic link.

Would [ -f "$dtb_path" -o -L "$dtb_path" ]; (or similar) solve this?

--Mark

> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201511): https://lists.openembedded.org/g/openembedded-core/message/201511
> Mute This Topic: https://lists.openembedded.org/mt/107033892/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

