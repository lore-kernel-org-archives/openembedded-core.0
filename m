Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF0CBC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 11:05:34 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.41399.1702897529404604177
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 03:05:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lbEz4+Ve;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E2AAC0007;
	Mon, 18 Dec 2023 11:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702897527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8rSAgdSSK6EJU9kZInZ+DaIVsKV/dsS20uDL/lUfbWs=;
	b=lbEz4+VeiledEUHtOgKrTf/miedurppY7VI/4HGQYXyvEVryZ3T+2TgxC3A9pP/OP/e5lS
	nODs5ZZrfbFF0pg8Qo1s/xJ8XffJ9ZfqAS8nE4Ia/1NgKx24pKi8aR011YvrszZsoC4k6Z
	QfYZZ3mP44BGNj+Me9Hxozc/CZ7wbphhOALAYzB5Lo7qczQ8iP1xPWZqmee08B/Tz7leyy
	ySd/FUZc1eOaks7HperB4D286pboiPwvrgx+clI54SERAp/4448E5hcn/BXIArT7Wly5Rh
	sr2NhSEiN06s3EEaMQWDqGhxYYH+JXAAbLjK4ktWItZhLuYzZPVjn4aq1zuVHQ==
Date: Mon, 18 Dec 2023 12:05:26 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	openembedded-core@lists.openembedded.org, ross.burton@arm.com,
	raj.khem@gmail.com
Subject: Re: [OE-core][PATCH] ipk: Switch to using zstd compression
Message-ID: <20231218110526aa418fee@mail.local>
References: <20231215205140.2948964-1-JPEWhacker@gmail.com>
 <7c7052bbd533d3357b9c679736b7c40985a6b227.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c7052bbd533d3357b9c679736b7c40985a6b227.camel@linuxfoundation.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 11:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192630

On 15/12/2023 22:48:51+0000, Richard Purdie wrote:
> On Fri, 2023-12-15 at 13:51 -0700, Joshua Watt wrote:
> > 
> > @@ -337,7 +335,7 @@ CONVERSION_CMD:lz4 = "lz4 -9 -z -l ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.l
> >  CONVERSION_CMD:lzo = "lzop -9 ${IMAGE_NAME}.${type}"
> >  CONVERSION_CMD:zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}.${type}.zip ${IMAGE_NAME}.${type}"
> >  CONVERSION_CMD:7zip = "7za a -mx=${7ZIP_COMPRESSION_LEVEL} -mm=${7ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}.${type}.${7ZIP_EXTENSION} ${IMAGE_NAME}.${type}"
> > -CONVERSION_CMD:zst = "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL} ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.zst"
> > +CONVERSION_CMD:zst = "zstd -f -k -c ${ZSTD_DEFAULTS} ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.zst"
> >  CONVERSION_CMD:sum = "sumtool -i ${IMAGE_NAME}.${type} -o ${IMAGE_NAME}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
> >  CONVERSION_CMD:md5sum = "md5sum ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.md5sum"
> >  CONVERSION_CMD:sha1sum = "sha1sum ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.sha1sum"
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 55166d01784..4b1fe28c85a 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -878,6 +878,10 @@ XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
> >  ZSTD_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
> >  ZSTD_THREADS[vardepvalue] = "1"
> >  
> > +ZSTD_COMPRESSION_LEVEL ?= "-3"
> > +ZSTD_DEFAULTS ?= "--threads=${ZSTD_THREADS} ${ZSTD_COMPRESSION_LEVEL}"
> > +ZSTD_DEFAULTS[vardepsexclude] = "ZSTD_COMPRESSION_LEVEL ZSTD_THREADS"
> > +
> 
> Threads, sure but the compression level does change the output...

Indeed: https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4098/steps/12/logs/stdio

> 
> Cheers,
> 
> Richard

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192550): https://lists.openembedded.org/g/openembedded-core/message/192550
> Mute This Topic: https://lists.openembedded.org/mt/103198693/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

