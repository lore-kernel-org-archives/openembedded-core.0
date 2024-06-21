Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2798C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 19:41:12 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.82588.1718998868868430296
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 12:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RHJj7dsZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 914DEE0002;
	Fri, 21 Jun 2024 19:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718998867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/muhHLRrdkzmfJm9p9SDj9eOmYMmjiMfpsFseTeytfs=;
	b=RHJj7dsZNEh8RFwxYXyX+Q4HOvvx0OX6J0mVf9jSz2jZ7p0Wde1csg82QGv17HOEakZncz
	U7wNF+AarLWjFobjYUFdNBDd4EhUlQlYBP5yfN6+G7m3skizUY2fhl+tQiOjboGHBVwT0t
	L2u4Ygbv6Xgzc7s+N3Z83ffSQtf7BXx5oh4zUxlGQBNDvl12UDgdN93bTk0kQRvTjUx1dM
	8fCrHA13pStPVr2jSL0dszFYa+FdlDuPtICMzO3C8qvFePSqvabbY3HXQl9o/RtFL6dByV
	7HHi5I3zs1TTBfOU/RT4HG9cL+ha7GyOIQbw9XFOqC3bU1OEfFS1cDdtwWd7bw==
Date: Fri, 21 Jun 2024 21:41:06 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <Ross.Burton@arm.com>,
	Alejandro Hernandez Samaniego <alejandro@enedino.org>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4] tclibc-picolibc: Adds a new TCLIBC variant
 to build with picolibc as C library
Message-ID: <20240621194106c034589f@mail.local>
References: <20240618181226.2693197-1-alejandro@enedino.org>
 <202406192003378ecde446@mail.local>
 <040A68B5-AF86-4553-B98C-8CF2F1BBA509@arm.com>
 <17DAC434B1B38A4A.28936@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17DAC434B1B38A4A.28936@lists.openembedded.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 19:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201033

On 20/06/2024 18:45:35+0200, Alexandre Belloni via lists.openembedded.org wrote:
> On 20/06/2024 16:10:41+0000, Ross Burton wrote:
> > 
> > 
> > > On 19 Jun 2024, at 21:03, Alexandre Belloni via lists.openembedded.org <alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
> > > 
> > > Hello,
> > > 
> > > This causes selftest failures:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6833/steps/14/logs/stdio
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6877/steps/15/logs/stdio
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6902/steps/14/logs/stdio
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6888/steps/14/logs/stdio
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3495/steps/15/logs/stdio
> > 
> > Those look a lot like they’re Josh’s SPDX changes not this.  Can we pick these back into your master-next branch Alex?
> 
> I can but I never had Josh's changes in my branch so unless this
> assumption is that the sstate is poisoned, I'm pretty sure it s caused
> by this patch.
> 
> This was the only change between
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7058
> and https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7056

So, tested v4 of Josh's patches, then I dropped them again, I included
this patch and I got the same failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6882/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6838/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6907/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6893/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3503/steps/15/logs/stdio



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

