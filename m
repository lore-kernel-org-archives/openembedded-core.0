Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2330AC8302D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 16:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.45482.1751301151840329992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 09:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by localhost.localdomain (8.18.1/8.18.1/Debian-2) with ESMTP id 55UGWTQj078835;
	Mon, 30 Jun 2025 11:32:30 -0500
Received: from [192.168.2.98] ([192.168.2.98])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 55UGWSr1026504;
	Mon, 30 Jun 2025 11:32:29 -0500
Message-ID: <5f3c3690-ae0f-4faf-8e6b-4e0c7b2d8eb6@kernel.crashing.org>
Date: Mon, 30 Jun 2025 11:32:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] libucontext: use hard/soft float
Content-Language: en-US
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
References: <20250630144814.255656-1-jdmason@kudzu.us>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20250630144814.255656-1-jdmason@kudzu.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 16:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219530



On 6/30/25 9:48 AM, Jon Mason wrote:
> From: Jon Mason <jon.mason@arm.com>
> 
> When building for qemuarm-secureboot in meta-arn with musl and clang,
> the following compile error is seen:
> - | ../sources/libucontext-1.3.2/arch/arm/swapcontext.S:23:11: error: unknown token in expression
> - |  ldr r4, =#0x56465001
> - |           ^
> 
> This is happening because 1.3 added ifdefs for assembly code for both
> hard and soft float, and bcause neither is being defined, it is taking
> this path with the issue.
> 
> Since we can tell if soft or hard float is being used via the TARGET_FPU
> variable, use that and set the relevant makefile flag.
> 
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>   meta/recipes-core/musl/libucontext_1.3.2.bb | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-core/musl/libucontext_1.3.2.bb b/meta/recipes-core/musl/libucontext_1.3.2.bb
> index 2362cba5c8a2..92001bbe7bb5 100644
> --- a/meta/recipes-core/musl/libucontext_1.3.2.bb
> +++ b/meta/recipes-core/musl/libucontext_1.3.2.bb
> @@ -48,3 +48,6 @@ def map_kernel_arch(a, d):
>   
>   EXTRA_OEMESON = "-Dcpu=${@map_kernel_arch(d.getVar('TARGET_ARCH'), d)}"
>   inherit meson
> +
> +TARGET_CPPFLAGS:arm += "${@bb.utils.contains('TARGET_FPU', 'hard', '-DFORCE_HARD_FLOAT', '', d)}"
> +TARGET_CPPFLAGS:arm += "${@bb.utils.contains('TARGET_FPU', 'soft', '-DFORCE_SOFT_FLOAT', '', d)}"

The above doesn't += to TARGET_CPPFLAGS, it _replaces_ TARGET_CPPFLAGS.

This is probably not what you want.

What I've done in the past is:

ARM_TARGET_CPPFLAGS = ""
ARM_TARGET_CPPFLAGS:append:arm = "${@bb.utils.contains('TARGET_FPU', 'hard', '- 
DFORCE_HARD_FLOAT', '', d)}"
ARM_TARGET_CPPFLAGS:append:arm = "${@bb.utils.contains('TARGET_FPU', 'soft', ' 
-DFORCE_SOFT_FLOAT', '', d)}"

TARGET_CPPFLAGS .= "${ARM_TARGET_CPPFLAGS}"

> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219524): https://lists.openembedded.org/g/openembedded-core/message/219524
> Mute This Topic: https://lists.openembedded.org/mt/113909237/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

