Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCDFC71159
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 20:20:56 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.1612.1750105254884188570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 13:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55GKKrOY023502;
	Mon, 16 Jun 2025 15:20:53 -0500
Received: from [192.168.2.13] ([192.168.2.13])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 55GKKq9m019471;
	Mon, 16 Jun 2025 15:20:52 -0500
Message-ID: <07dd28a5-b214-4d95-8d27-276044768324@kernel.crashing.org>
Date: Mon, 16 Jun 2025 15:20:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 8/8] qemu.inc: handle GLVND-related providers
Content-Language: en-US
To: dmitry.baryshkov@oss.qualcomm.com,
        openembedded-core@lists.openembedded.org
References: <20250616161037.1518306-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250616161037.1518306-8-dmitry.baryshkov@oss.qualcomm.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20250616161037.1518306-8-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 20:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218846



On 6/16/25 11:10 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> If GLVND is enabled, then libglvnd is providing all OpenGL / ES
> libraries. Tune qemu.inc to select a correct package in
> this case.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   meta/conf/machine/include/qemu.inc | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
> index d7392d476238..4fa18812dbc3 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -1,9 +1,9 @@
>   PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
> -PREFERRED_PROVIDER_virtual/egl ?= "mesa"
> -PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
> -PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
> +PREFERRED_PROVIDER_virtual/egl ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
> +PREFERRED_PROVIDER_virtual/libgl ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
> +PREFERRED_PROVIDER_virtual/libgles1 ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
> +PREFERRED_PROVIDER_virtual/libgles2 ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
> +PREFERRED_PROVIDER_virtual/libgles3 ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"

The above is interesting.  The defaults for these are already specified in the 
distro/include/default-provders.inc.  This should be where this kind of change 
goes (or in a specific distro or other conf file if the defaults are overwritten.)

Setting these in qemu seems like a duplicate and really looks like the wrong 
thing to duplicate unless there is a specific machine reason to override the 
default provider for the system.

Unless this doesn't work, I'd simply remove the entries from qemu.inc.

(you already dropped the other duplicates in the qemu files, which is definitely 
the right thing to do.)

--Mark

>   XSERVER ?= "xserver-xorg \
>               ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218842): https://lists.openembedded.org/g/openembedded-core/message/218842
> Mute This Topic: https://lists.openembedded.org/mt/113673610/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

