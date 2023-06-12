Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F58C7EE2F
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 16:17:34 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.64306.1686586651652516298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 09:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B3Cu6uep;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686586649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jmqjffgDPBesCKHDNMVlyB5W9HMv5glDZE4OscLaPmA=;
	b=B3Cu6uepiAA0uRYXhGaxdvHrASzqIw4/2pNSvlB4ea4qVj3NVHSn4IPanrOTEJPCltEug6
	w7iiwnspS8BM/dwy/7SsrubDHj2MgQFzs65kCQ72/+dR7R0wvpNBXTaNjAmGnX0Q9RcQp9
	mX3nJbbKHewHxMqli1siu9EBjw1ojZPQcYpvoO9XVHOn3mv2Fm7X7rwBIMlQf54cB2DKwB
	G3pu8SN1B0HgIP4CrWVkP3G8h4jKhG6X3lriYyR5e4l0ZSsNHyTHhJO7jWfcdNCiESNuFR
	3aOsd/ZtpgMsDF3gMs9shIHb5zejhDqD9LPnE86MumzJn2uUGV4FDSrXOeOkkQ==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FE06C0009;
	Mon, 12 Jun 2023 16:17:29 +0000 (UTC)
Date: Mon, 12 Jun 2023 18:17:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] image-artifact-names: include
 ${IMAGE_NAME_SUFFIX} directly in both ${IMAGE_NAME} and ${IMAGE_LINK_NAME}
Message-ID: <20230612161729256e0cc6@mail.local>
References: <20230525102218.1613298-1-Martin.Jansa@gmail.com>
 <20230526180939464ac2f2@mail.local>
 <1762E887A919FB5A.6918@lists.openembedded.org>
 <CA+chaQdAaZ9mc_jfvL+5VJkGoybs0FrhVuTpGS9dRu2hxikCmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+chaQdAaZ9mc_jfvL+5VJkGoybs0FrhVuTpGS9dRu2hxikCmQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 16:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182679

Hello,

On 12/06/2023 17:35:30+0200, Martin Jansa wrote:
> On Sat, May 27, 2023 at 7:21 AM Martin Jansa via lists.openembedded.org
> <Martin.Jansa=gmail.com@lists.openembedded.org> wrote:
> 
> > On Fri, May 26, 2023 at 8:09 PM Alexandre Belloni <
> > alexandre.belloni@bootlin.com> wrote:
> >
> >> Hello,
> >>
> >> The series causes oe-selftest failures:
> >>
> >>
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5254/steps/14/logs/stdio
> >>
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1468/steps/14/logs/stdio
> >>
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5225/steps/14/logs/stdio
> >>
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5175/steps/14/logs/stdio
> >>
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5217/steps/14/logs/stdio
> >
> >
> > Hi,
> >
> > I was able to reproduce it locally and it's caused by newer test (which
> > wasn't merged yet last time I've run selftest with these changes):
> >
> > https://git.openembedded.org/openembedded-core/commit/?id=06af6795cf6f079362303bddb39a14459e228e72
> > which hardcodes the expected image name, I'll send fix for this shortly.
> >
> 
> Hi, I see that the selftest fix was already merged to master and this
> change was in abelloni/master-next-success for a while, but now it's
> dropped (and it's not in master nor master-next).
> 
> Should I resend the series again or what's the process now?

It would be great if you could rebase your series. I dropped your patch
because it conflicted. I had on my TODO list to solve those conflicts
but if you do, it makes my life easier ;)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

