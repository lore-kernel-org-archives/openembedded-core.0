Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11F9C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 19:20:06 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.33603.1660764003705657345
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 12:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Wutfe06m;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 587CC1C0003;
	Wed, 17 Aug 2022 19:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1660764001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UIdWP5qpFK0XBHvku4v1u2xdM6MSUVm24gQdg5C8BZk=;
	b=Wutfe06mooFqrB4Vvx6og7eVhmbf0FbF9PZEPZ4b6/MAD8y6vNuvNnmeYzC3HcJKw1VeL7
	VB1qK2+KJOWhCupa3il6Ym8D1Brsmxrzkobn14W4SirqgI2oNZMs1Ib567tmzvTMxOxTwL
	l8vAQ0MfX1ddaYNo5UqjPxeHHb8yMHPZJo5WN5G3SW4DInbdwLv3/wxcclE4+9NiZIms4c
	d3Qo0oe2wyZO7lUgqBiNo9Mc6gOgaLjwf3rjowwMc4D68xosuCl7eH8fvD+aLepMTNNOIF
	NkPyMenUzLLYPIfS5Dv3Fa5cRxPSTvLOkYU1ZbWor65BJWWk09B/+KyH9F1STw==
Date: Wed, 17 Aug 2022 21:20:01 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Julien STEPHAN <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] vulkan-samples: enable network during do_unpack
Message-ID: <Yv0/YY0usjwo1LMZ@mail.local>
References: <20220817190124.2126652-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817190124.2126652-1-jstephan@baylibre.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 19:20:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169502

On 17/08/2022 21:01:24+0200, Julien STEPHAN wrote:
> vulkan-samples uses git submodules and one of the submodules uses lfs
> objects. During the unpack step, the lfs objects are retrieved leading to
> a network failure.
> 
> The correct fix is to fetch lfs objects during the fetch step, but let's
> workaround this issue for now
> 

How can you ensure you are not relying on third parties to sotre the
code you need to build your images then?

> Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
> ---
>  meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> index 41cb4a437d..b45ee22a69 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> @@ -11,6 +11,11 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;prot
>             file://0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patch \
>             "
>  
> +# Workaround for network access issue during the do_unpack step
> +# this needs to be fixed in the recipes buildsystem to move
> +# this such that it can be accomplished during do_fetch task
> +do_unpack[network] = "1"
> +
>  UPSTREAM_CHECK_COMMITS = "1"
>  SRCREV = "ee6c1522af8ba9b56f8416c2eedafb440f681085"
>  
> -- 
> 2.37.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169500): https://lists.openembedded.org/g/openembedded-core/message/169500
> Mute This Topic: https://lists.openembedded.org/mt/93089137/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

