Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67DEC4332F
	for <webhook@archiver.kernel.org>; Sun,  5 Nov 2023 00:27:08 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.22345.1699144018476135653
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Nov 2023 17:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aqrmhnc/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC3991C0002;
	Sun,  5 Nov 2023 00:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699144016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ImvcA0926H93T5H62WGBr377sgwFm07QrMa0Ku8+PpE=;
	b=aqrmhnc/5ShimRlb+GRhd/1eKOx0AK2nYldYFJxahsD3Bi96b2sKssBNIbOgrg5RzKgJrX
	0J8wzeXAYs1K57ML6Jxrf3+/IYZ7ZTVkEWctL4NMA2D3eAANxCK7McSaIbK7tyTDvD0SHQ
	LESFYAQSWRpu3UpISBauofkp5asQI7D9dJm0pOQfXo/gLtiF5MWwxU5wgE64WpQSw9RkNa
	e0MoFzF18P66LiPslYQPqNl+TEhUMkDGLwxV300COuodWbFEyCL933fXMxMit9EPNexmDq
	lpOUQC66vSYoK/w/Yy/RRWfPYtxBnoWTtrr6d6WXEXBC7UdmuzmLSvz5gDbpUw==
Date: Sun, 5 Nov 2023 01:26:55 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: charles-antoine.couret@mind.be
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/5 v3] image_types: use IMAGE_FILE_MAXSIZE
 variable to create fixed partition size
Message-ID: <202311050026551c348656@mail.local>
References: <20231101231058.86928-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101231058.86928-1-charles-antoine.couret@mind.be>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Nov 2023 00:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190182

Hello,

The tests fail on the ubuntu and debian workers but seemed to pass just
fine on fedora:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5941/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6008/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2369/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6010/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5943/steps/14/logs/stdio

I'm not sure the login timeout is relevant.

Also, can you please fix your git configuration:
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#fixing-your-from-identity

On 02/11/2023 00:10:49+0100, Charles-Antoine Couret via lists.openembedded.org wrote:
> Details are described in the first patch.
> 
> Difference from v2:
> 
> * Added working and failing tests in meta/lib/oeqa/selftest/cases/imagefeatures.py
> * Split commit to send documentation to right mailing list
> 
> Difference from v1:
> 
> * Added documentation for IMAGE_FILE_MAXSIZE variable
> * Added Python function to get the value of this variable from shell functions
> otherwise parsing issue can happen
> * Added an additional task to check the final result which works for all filesystems
> and not only those created with dd command.
> 
> Charles-Antoine Couret (6):
>   image_types: add python function to get the IMAGE_FILE_MAXSIZE:fstype
>     value
>   image_types: use IMAGE_FILE_MAXSIZE variable for ext2/3/4 image types
>   image_types: use IMAGE_FILE_MAXSIZE variable for btrfs image types
>   image_types: use IMAGE_FILE_MAXSIZE variable for f2fs image types
>   image: add check_image_max_size as post function to check file size
>     against IMAGE_FILE_MAXSIZE
>   ref-manual: document IMAGE_FILE_MAXSIZE variable
> 
>  documentation/ref-manual/variables.rst        | 14 +++++
>  meta/classes-recipe/image.bbclass             | 30 +++++++++++
>  meta/classes-recipe/image_types.bbclass       | 43 ++++++++++++---
>  meta/lib/oeqa/selftest/cases/imagefeatures.py | 52 +++++++++++++++++++
>  4 files changed, 131 insertions(+), 8 deletions(-)
> 
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190048): https://lists.openembedded.org/g/openembedded-core/message/190048
> Mute This Topic: https://lists.openembedded.org/mt/102331599/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

