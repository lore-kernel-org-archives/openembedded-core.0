Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A97C61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 22:28:12 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.25087.1675463285391186331
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 14:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o5AForum;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E0BD6FF806;
	Fri,  3 Feb 2023 22:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675463283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hMzTE8mh+9fYOUgvfewXa5eva7bNVJ6i8OWZd5cCQHk=;
	b=o5AForum/2gGfdkVYp3F9jkgYw7TfuXrBoE+flIFUnWREuzUxkw/RFG2i33iULnD+gna7Q
	mMVOmF5o0xvk1sfXaJN8m5rYAeZnZ1lcchaIeN9hlPfoSjJd3oosGWQXpSzYzDMh5AlLjR
	1TWfyEcoUWPMangy0Sf79kQdmVhZT/S9VA6DW4sEzrYUY7SA1VBZ9knAVqJ/oQRRX9OGUv
	MPH7LSPt/muyr/Ga34LZfXNUtuWI0DsCggC9WBd4oyQ7fpeJ682nExJ9nYq6axUsgLVEww
	czusJoW9Jw+RRLzgkkQBYxaQL47VkkoWSt5acEO7eMhVZ205G5FXqj98uWym6Q==
Date: Fri, 3 Feb 2023 23:28:02 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] perf: Enable debug/source packaging
Message-ID: <Y92KcoU37Jdr33iq@mail.local>
References: <20230203165203.1145313-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203165203.1145313-1-richard.purdie@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 22:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176754

Hello Richard,

This is causing:
WARNING: perf-1.0-r9 do_package_qa: QA Issue: File /usr/src/debug/perf/1.0-r9/util/expr-flex.h in package perf-src contains reference to TMPDIR

On 03/02/2023 16:52:03+0000, Richard Purdie wrote:
> This was disabled in 2014[1] due to an error message which as far
> as I can tell, no longer occurs.
> 
> Having debug information and source files present will make debugging
> reproducibility issues much easier so remove this line as it appears
> no longer needed.
> 
> [1] OE-Core revision c1b5a262c0201faf2c6bf545d6acb32dfe383ba3
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-kernel/perf/perf.bb | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 1dff39a17e4..e8a9c57a0aa 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -360,6 +360,4 @@ FILES:${PN}-python = " \
>                         "
>  FILES:${PN}-perl = "${libexecdir}/perf-core/scripts/perl"
>  
> -
> -INHIBIT_PACKAGE_DEBUG_SPLIT="1"
>  DEBUG_OPTIMIZATION:append = " -Wno-error=maybe-uninitialized"
> -- 
> 2.37.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176733): https://lists.openembedded.org/g/openembedded-core/message/176733
> Mute This Topic: https://lists.openembedded.org/mt/96726928/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

