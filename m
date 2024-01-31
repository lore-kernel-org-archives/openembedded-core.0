Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1A6C47DB3
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 16:45:09 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.472.1706719507591690804
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 08:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eRnRuSwS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6905B1BF209;
	Wed, 31 Jan 2024 16:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706719505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L5vlvCOIyokFl9aKUkc6ik1lsujnhcMNETUCsxt+Skw=;
	b=eRnRuSwSuPpVJULQsTWjSZoCe0Swz9p5Om8MpcWXHGyX6KB1BAnI4/CMjui7LNKboXTzAk
	3C16lQYwmKLyngH55PY2z9CPBZ/YD2xGlz0DlHWW1IZ2X9quSlL5EJK9eYMtGlUqsNZ24K
	LXjoqYl03qMwMmmRCuqtueopbFOkZyY9hMmK4+k8HOePOBxN9yFfGB+2rhFZEupm4C+ZV5
	BpAburlzMhxYLZJGuvfz7T2I4YpSO24Ls586yRy8xK6zmvL1cAKx6iihZ5yGRDJsbgj1Je
	ruIWQEpvt/xyBIemZgraFF3Lqkp5eYAKkMERuyfaHcqSIUc2g/XJ0dJd2QIhsA==
Date: Wed, 31 Jan 2024 17:45:05 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] core-image-ptest: Increase disk size to 1.5G
 for strace ptest image
Message-ID: <2024013116450562b504c7@mail.local>
References: <20240130203219.4155783-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240130203219.4155783-1-raj.khem@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 16:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194528

On 30/01/2024 12:32:19-0800, Khem Raj wrote:
> Autobuilder sees and intermittent failure on strace tests and it occurs
> quite often therefore bump the size of image as the space requirement is
> more now with parallel execution enabled.
> 

Note that I've resisted doing this because I'm still not sure this is
what is happening, I've added a patch to clean up a bit more after each
test which should have been enough. From my testing, I can't reproduce
locally and I don't see some much space being used in the image itself.

> [YOCTO #15370]

Isn't it 15220 ? :)

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/images/core-image-ptest.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
> index b6f5c2fd604..f2d0ae94b89 100644
> --- a/meta/recipes-core/images/core-image-ptest.bb
> +++ b/meta/recipes-core/images/core-image-ptest.bb
> @@ -21,7 +21,7 @@ BBCLASSEXTEND = "${@' '.join(['mcextend:'+x for x in d.getVar('PTESTS').split()]
>  IMAGE_OVERHEAD_FACTOR = "1.0"
>  IMAGE_ROOTFS_EXTRA_SPACE = "324288"
>  IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-mdadm = "1524288"
> -IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace = "1024288"
> +IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace = "1524288"
>  IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
>  
>  # tar-ptest in particular needs more space
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194504): https://lists.openembedded.org/g/openembedded-core/message/194504
> Mute This Topic: https://lists.openembedded.org/mt/104062115/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

