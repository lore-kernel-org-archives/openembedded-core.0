Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF919C2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 21:38:24 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.14284.1700516299548205291
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 13:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aZo0/mEc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC0AC2000A;
	Mon, 20 Nov 2023 21:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700516297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R+fR0VyhW4UXvK9W/wICLBodLmd4I+wDUQ86pba91W4=;
	b=aZo0/mEcHty0QkIrbaCXkV+g8UcQ7cuIp51JWSSUXviBF+RZkJ0PL3fX5/P8ucUJIjPQgi
	2l5YrqOVxOVlKsaIFcUpPMnaLmMKhl8hydcezSliwLsZTrSNu5manrGJmWVP7N/b2Xvor8
	Ylfdmo/9I1UPyhc3ls9lR7LBphuEpl2xtgTFozYalzUxzWopfwyogaiPnYVF31dUIUn5BW
	x3EWc58kBbm3cXvUP3myAUFQQ2NCeXIpENewHk/NZrfVM/01rqvDvjZCyV0ip6twrRPc5V
	YLo+oMGtWImceudlJPObXykKhQmYyZQI0gqi2XUqbacx4ThNdTLzdp+YvK6o+Q==
Date: Mon, 20 Nov 2023 22:38:16 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf: Log events by default using
 BB_DEFAULT_EVENTLOG
Message-ID: <202311202138167b527027@mail.local>
References: <20231116165250.2863415-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116165250.2863415-1-richard.purdie@linuxfoundation.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 21:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190936

For some reason, this is the cause of:
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6065/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6062/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6013/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6078/steps/14/logs/stdio


On 16/11/2023 16:52:49+0000, Richard Purdie wrote:
> By setting this, event data from during the build is saved out. This can
> be used for analytic including toaster to allow builds to be examined
> later. This will use some disk space but it is worth it for the ability
> to look into what happened during the build. Users can set the value to
> something else in local.conf to override if they wish.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/bitbake.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 67ff7690463..12292714d2f 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -934,6 +934,7 @@ BB_DEFAULT_UMASK ??= "022"
>  
>  # Complete output from bitbake
>  BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
> +BB_DEFAULT_EVENTLOG ?= "${LOG_DIR}/eventlog/${DATETIME}.json"
>  
>  # Setup our default hash policy
>  BB_SIGNATURE_HANDLER ?= "OEBasicHash"
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190806): https://lists.openembedded.org/g/openembedded-core/message/190806
> Mute This Topic: https://lists.openembedded.org/mt/102630313/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

