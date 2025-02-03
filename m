Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A549C02196
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 17:47:22 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.94582.1738604832234282258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 09:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 513HlBIj022109
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Feb 2025 11:47:11 -0600
Received: from [192.168.2.40] ([192.168.2.40])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 513HlAJi031553
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Feb 2025 11:47:11 -0600
Message-ID: <0a72dd70-c9d4-4cfd-b50e-f0272ee5d91e@kernel.crashing.org>
Date: Mon, 3 Feb 2025 11:47:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] qemuboot.bbclass: Fix QB_DEFAULT_KERNEL
 expansion
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
References: <1820C3B61DFDBF76.15786@lists.openembedded.org>
In-Reply-To: <1820C3B61DFDBF76.15786@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 17:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210726

Note, INITRAMFS_LINK_NAME is set in kernel-artifact-names.bbclass.

An alternative implementation of this could be to:

qemuboot:
   QB_DEFAULT_KERNEL ??= "${KERNEL_IMAGETYPE}"

kernel-artifact-names:
   QB_DEFAULT_KERNEL ?= "${@bb.utils.contains("INITRAMFS_IMAGE_BUNDLE", "1", 
"${KERNEL_IMAGETYPE}-${INITRAMFS_LINK_NAME}.bin", "${KERNEL_IMAGETYPE}", d)}"


I'm not sure that is any better or easier to maintain, but if anyone has strong 
feels, I'm happy to create a V2 patch based on that instead.

--Mark


On 2/3/25 11:44 AM, Mark Hatle wrote:
> QB_DEFAULT_KERNEL was not being expanded unless INITRAMFS_LINK_NAME
> was defined.  This only happens when building a kernel with an
> integrated (bundled) initramfs.
> 
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>   meta/classes-recipe/qemuboot.bbclass | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
> index 0f80c60..ee71a2f 100644
> --- a/meta/classes-recipe/qemuboot.bbclass
> +++ b/meta/classes-recipe/qemuboot.bbclass
> @@ -96,6 +96,9 @@
>   QB_MEM ?= "-m 256"
>   QB_SMP ?= ""
>   QB_SERIAL_OPT ?= "-serial mon:stdio -serial null"
> +# Define INITRAMFS_LINK_NAME to ensure that QB_DEFAULT_KERNEL expands,
> +# even when INITRAMFS_LINK_NAME would not otherwise be defined.
> +INITRAMFS_LINK_NAME ??= ""
>   QB_DEFAULT_KERNEL ?= "${@bb.utils.contains("INITRAMFS_IMAGE_BUNDLE", "1", "${KERNEL_IMAGETYPE}-${INITRAMFS_LINK_NAME}.bin", "${KERNEL_IMAGETYPE}", d)}"
>   QB_DEFAULT_FSTYPE ?= "ext4"
>   QB_RNG ?= "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210725): https://lists.openembedded.org/g/openembedded-core/message/210725
> Mute This Topic: https://lists.openembedded.org/mt/110975972/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

