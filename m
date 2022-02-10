Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A181C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 21:32:48 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.2175.1644528766601957649
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 13:32:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=WpoIxl1g;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8C3F281A03;
	Thu, 10 Feb 2022 22:32:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1644528763;
	bh=9VdAqfpb1EkzW8DHwVb4fO69iYQSVoHr7jWIsa0wlRY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WpoIxl1g7Ko6DG7Hulm+Z/nhRd3h2pX3dxX1ajPtne0nah71s5lolRse/x5W3Kfel
	 eiiuazB5LwmAzjiiWrgS2Tbils2YyE2bBMhFyzri5GaBOq4RN43xOxlOhcPGopl71k
	 aMPiv+8IYAnt82K20H3+/cHj7Ok5MkZYF3WIiksmzCl4WH4wkazD+3vW3d5+O8WP++
	 mWWQxnXmZqbrK19VLNRXO8Je6dN4RL/V0Wj2zQmqqot1/RTTtZ5X3t3L0UHrKFIWCf
	 b0VwVCNW5+Qtdsr1V9T6PuSMPewIhlOMQ7RsiR7VkNOx21DT6h2x79Lm1FrVrNYj/b
	 jjd1OLZQBBEcg==
Message-ID: <39ab0caa-f65f-267f-d8af-343e099cd7b9@denx.de>
Date: Thu, 10 Feb 2022 22:32:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] kernel-fitimage: Add missing dependency for UBOOT_ENV
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20220129005737.86270-1-marex@denx.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220129005737.86270-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 21:32:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161630

On 1/29/22 01:57, Marek Vasut wrote:
> For $UBOOT_ENV file to appear in sysroot, virtual/bootloader
> must populate sysroot first. Add the missing dependency.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes/kernel-fitimage.bbclass | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 1e3bc21f1f..507e0a2213 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -36,6 +36,10 @@ python __anonymous () {
>           if image:
>               d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
>   
> +        ubootenv = d.getVar('UBOOT_ENV')
> +        if ubootenv:
> +            d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/bootloader:do_populate_sysroot')
> +
>           #check if there are any dtb providers
>           providerdtb = d.getVar("PREFERRED_PROVIDER_virtual/dtb")
>           if providerdtb:

I think "bump" is in order by now.

Can you please pick this one ?

