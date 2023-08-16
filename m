Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2A4C07E8F
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 18:51:40 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.168821.1692211896585898390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 11:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QiSs9ZXl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B44E420007;
	Wed, 16 Aug 2023 18:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692211894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1LxZW0kfGZWGSXE+S4iY6k4nxpw6LLWTLqPjAK94RuU=;
	b=QiSs9ZXl5JM5MHFBCxTzwZt2LKiqlxWJbaLNWrgjxdcWFbUb0k3olA7X3UcKjrg4bVr2GY
	/CCxwcy7+XxJyRIC4hUdlL1HUmnSnyAHOGgXuEQOUblvY4KsBhmN6KpzuttyEnlW1Zr4mt
	Ss2ZioUEYxTDkBUnDpoL6tQulFsztHgVZRgGhy+FH3Ce7DjezzJs4nmisHm1dyf9hBc5q1
	SGz9mn89n/4bSbdL3O7ZmWjehZfBDFQnDCQoW5bZMTK9ntivGDvWOK5jn06RwkQ6rA11h9
	caY8oO196yLwCVfbGa38zu80WIXJ8rFBL3z5dlaFHHMzrRLXomXgm+gszJ8vJw==
Date: Wed, 16 Aug 2023 20:51:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Angelo.Ribeiro@criticaltechworks.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] ccache.bbclass: Add allowed list for native
 recipes
Message-ID: <20230816185132c67a8c75@mail.local>
References: <20230816140936.2511-1-Angelo.Ribeiro@criticaltechworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816140936.2511-1-Angelo.Ribeiro@criticaltechworks.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 18:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186139

Hello,

On 16/08/2023 15:09:36+0100, Angelo Ribeiro via lists.openembedded.org wrote:
> From: Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
> 
> Native recipes are not able to use ccache currently, due to a circular
> dependency between ccache-native and cmake-native.
> This affects also other native recipes, but not all, imposing a
> limitation in build time optimizations.
> 
> The introduction of CCACHE_NATIVE_ALLOWED allows the user to specify which
> native recipes should use ccache, keeping it disable by default for all
> native recipes.
> 

You must also submit documentation for this new variable.

> Signed-off-by: Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
> ---
>  meta/classes/ccache.bbclass | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
> index 34becb69d1..262db6672c 100644
> --- a/meta/classes/ccache.bbclass
> +++ b/meta/classes/ccache.bbclass
> @@ -28,6 +28,11 @@
>  # be shared between different builds.
>  CCACHE_TOP_DIR ?= "${TMPDIR}/ccache"
> 
> +# ccache-native and cmake-native have a circular dependency
> +# that affects other native recipes, but not all.
> +# Allows to use ccache in specified native recipes.
> +CCACHE_NATIVE_RECIPES_ALLOWED ?= ""
> +
>  # ccahe removes CCACHE_BASEDIR from file path, so that hashes will be the same
>  # in different builds.
>  export CCACHE_BASEDIR ?= "${TMPDIR}"
> @@ -54,9 +59,9 @@ python() {
>      Enable ccache for the recipe
>      """
>      pn = d.getVar('PN')
> -    # quilt-native doesn't need ccache since no c files
> -    if not (bb.data.inherits_class("native", d) or
> -            bb.utils.to_boolean(d.getVar('CCACHE_DISABLE'))):
> +    if (pn in d.getVar('CCACHE_NATIVE_RECIPES_ALLOWED') or
> +        not (bb.data.inherits_class("native", d) or
> +        bb.utils.to_boolean(d.getVar('CCACHE_DISABLE')))):
>          d.appendVar('DEPENDS', ' ccache-native')
>          d.setVar('CCACHE', 'ccache ')
>  }
> --
> 2.34.1
> 
> The information in this communication may contain confidential or legally privileged information. It is intended solely for the use of the individual or entity it addresses and others authorized to receive it. If you are not an intended recipient, you are hereby notified that any disclosure, copying, distribution or action in reliance on the contents of this information is strictly prohibited and may be unlawful. If you have received this communication by error, please notify us immediately by responding to this e-mail and then delete it from your system. Critical TechWorks is not liable for the proper and complete transmission of the information in this communication nor for any delay in its receipt
> 
> This e-mail is environmentally friendly, just like Critical TechWorks, which lives in a paper-free atmosphere. Therefore, please consider the environment before printing it!

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186132): https://lists.openembedded.org/g/openembedded-core/message/186132
> Mute This Topic: https://lists.openembedded.org/mt/100780019/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

