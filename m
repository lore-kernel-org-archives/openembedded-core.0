Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3576C05052
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 09:56:51 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.7675.1692352601412783196
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 02:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LymArDA1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B4721C0006;
	Fri, 18 Aug 2023 09:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692352599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=in2mWg2cf5KpAYXpWeoSdwzAPH/zdPL+cgrY5ywEH2I=;
	b=LymArDA19t7IvBhXKmIPu42K/5rAoV83ot3SEw5Xs7vP0Tczk/q0qMBdQuP7o7alluhOn7
	CSvEg4ofEDgjFawc3t+stwJKXg96JFzXjQkPvuMF/99LamuaKzmnq8P1YX3WgXVxx3Lpjd
	ezwN6ZUhTG0Jl77ogV+2y/QX/LFrj5g1PZ0d2UfaSJrdZUshkHaKK51ak86vw/h3c4Sw+N
	lXs+nCOqEf22+N3sf0ikltlfCqFB2DJ/5G9KDcbsDkRRnxplusWahkZTAffKchf6c9/bh2
	IkgWHsh1aJT3kYlDqV3ttc/ae2ebUR43/aqqRiNfvmYOUgt9Z90pZNTFRWtsuw==
Date: Fri, 18 Aug 2023 11:56:38 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: aplanas@suse.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] bitbake.conf: add bunzip2 in HOSTTOOLS
Message-ID: <2023081809563803d02330@mail.local>
References: <20230818093056.10499-1-aplanas@suse.com>
 <2e707be5-5139-4e2c-a967-ff258d69eaec@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e707be5-5139-4e2c-a967-ff258d69eaec@app.fastmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 09:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186355

Hi Pavel,

On 18/08/2023 11:39:12+0200, Pavel Zhukov wrote:
> Hi Alberto,
> Looks like the regression has been  introduced in  previous update. This patch https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=eb3ec7469fff857c819332371ad1d586f43c79c3 (which was reverted by https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=3aba44a75dd565b192f7328f2a0150a313de3cc1 )  solved the issue without bringing bunzip to every system
> 

I guess you should submit the oe-core patch again and maybe it would be
a good idea to get it upstream.

> -- 
> Pavel
> 
> On Fri, Aug 18, 2023, at 11:30, Alberto Planas via lists.openembedded.org wrote:
> > From: Alberto Planas <aplanas@suse.com>
> > 
> > rpm2cpio.sh can make calls to bunzip2 to uncompress the RPM payload that
> > conform the cpio file.
> > 
> > bzip2 is already part of HOSTTOOLS, as a link to the system installed
> > bzip2.
> > 
> > This patch add bunzip2 in HOSTOOLS list as a non-optional binary, so is
> > available to rpm2cpio.sh when it is required.
> > 
> > The currect rpm2cpio.sh has other calls to gunzip (present in HOSTOOLS),
> > xzcat (missing), unlzma (missing) and unzstd (present in HOSTTOOLS since
> > bff58d337890e804d33d7decbaa46065a4d3bba4)
> > 
> > Adding the missing ones will not add any new host dependency as xz-utils
> > is already listed as a requirement.
> > 
> > Signed-off-by: Alberto Planas <aplanas@suse.com>
> > ---
> > meta/conf/bitbake.conf | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 599bbc4ba8..b19f265b3d 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -516,7 +516,7 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
> >  
> > # Tools needed to run builds with OE-Core
> > HOSTTOOLS += " \
> > -    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
> > +    [ ar as awk basename bash bunzip2 bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
> >      cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
> >      fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
> >      head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir mkfifo mknod \
> > -- 
> > 2.41.0
> > 
> > 
> > 
> > 
> > 
> > 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186354): https://lists.openembedded.org/g/openembedded-core/message/186354
> Mute This Topic: https://lists.openembedded.org/mt/100817328/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

