Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C1DC77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 09:52:36 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.4521.1686131547644035038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 02:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pFnGBMr7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686131545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NnWkNoDJ0sehOEuvY0dv1T44jW9fAaMWCPnKCh58j3E=;
	b=pFnGBMr7vBrf31+JCefmSxG9s+WErLt3o86YRxEBLZhpqiPs8GQ4SmeV33JR68A2ojNlMm
	F1wJeDsU7vRuZ2AIPPDrIzg0PqmljSFcX5fYDb/5mZdlHtx0PcuNgkdAQq4dyL+vnUR1io
	pOeqr3/1eViTU18P7KO6EE8a4m7L0AAF0DWXCkLI/Rw36KCvFr1GbMVdMipo77+c5GVfsP
	USeMUtETJMGqC9hAMWDK8qXlr+1pbPUuHSXoAd2+lzRVvRoMT8uQD6tSBgwkfP8zqQWYaT
	5PUGWgArMLHAcACVnTVPlEeYs7KUz+A7jKGhCWrSBl8ovDSOJirpf+SUqIjx9Q==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C051FE0009;
	Wed,  7 Jun 2023 09:52:24 +0000 (UTC)
Date: Wed, 7 Jun 2023 11:52:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: charles-antoine.couret@mind.be
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/3] image_types: use IMAGE_FILE_MAXSIZE
 variable to create fixed partition size
Message-ID: <20230607095224e1009509@mail.local>
References: <20230604123755.2541295-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230604123755.2541295-1-charles-antoine.couret@mind.be>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 09:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182469

Hello,

On 04/06/2023 14:37:52+0200, Charles-Antoine Couret via lists.openembedded.org wrote:
> In case of fixed partitionning where the rootfs partition can't exceed an
> amount of bytes, there is currently no automatic and no generic way to have
> this requirement met in any case.
> 
> Until now, ROOTFS_SIZE value got from directory_size() does not takes into account
> the size of required metadata for the filesystem itself (and does not work well
> for other block size than 4k BTW).
> Obviously it's a difficult task which depends on rootfs size and filesystem type.
> 
> The workaround was to set IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
> to add the required extra margins. But when the final rootfs is closed to the
> maximum size, it's difficult to adjust them correctly  And if you remove
> or add new recipes in your image, you've to recompute these margins to have enough
> space for these metadata when the rootfs is small, and to not have too big final
> file when the rootfs is big.
> 
> It's cumbersome and error prone to just have a build failure when the final output
> can't be flashed into the partition.
> 
> The solution is to follow how it's implemented in buildroot by having a
> specific variable, here IMAGE_FILE_MAXSIZE, to create the final sparse file
> and trying to fill it with the content of rootfs. If there is enough space,
> margins are well compressed and does not consume space in the filesystem.
> If there is no enough space, an error is triggered to warm the developer before
> trying to use it in the device.
> 
> If IMAGE_FILE_MAXSIZE is not set, the idea is to keep the previous behaviour
> for compatibility reason and to met other requirements.

It would be great if you could add test cases that ensure that the
generated images are indeed fitting the size.

> 
> Charles-Antoine Couret (3):
>   image_types: use IMAGE_FILE_MAXSIZE variable for ext2/3/4 image types
>   image_types: use IMAGE_FILE_MAXSIZE variable for btrfs image types
>   image_types: use IMAGE_FILE_MAXSIZE variable for f2fs image types
> 
>  meta/classes-recipe/image_types.bbclass | 34 +++++++++++++++++++------
>  1 file changed, 26 insertions(+), 8 deletions(-)
> 
> -- 
> 2.40.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182359): https://lists.openembedded.org/g/openembedded-core/message/182359
> Mute This Topic: https://lists.openembedded.org/mt/99320002/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

