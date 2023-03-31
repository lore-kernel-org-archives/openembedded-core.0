Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04005C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 08:59:57 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.50082.1680253192001465166
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 01:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Qp/W7OFQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 52CF44000A;
	Fri, 31 Mar 2023 08:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680253189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YUrLKSDjDJpcuafU0dR/j4Xhw+aDMBbA+OaqlF9Tljw=;
	b=Qp/W7OFQmeIykx4ymrTRsjjfDc8vHH39BUcItTrfK+JHpzUoh6UBWsBmzsGAP30+cVdmEU
	630C49Kvf5ZiUY97WzTHWEcca0qYd4nwz51Dt3g/q+ceNEY/S9x+b5tfMKCS+5UUgf9bMs
	zEM7hVI3F6kqBf+Xgkr0VcCw4j6v2J8TBeWfdGU/Zf7V4twZTj2JE1ffoGmsbhtrCtyqDX
	8H2yvBtGIGTsURj79yHax9FMwKw2cfoB071GhcYZw3OFvT7/oFKoUClYKUZxSsm5dDQW1k
	CJEU5MbGeA72h8SE7MOf6JOlSmds2oxkwFuWNOVSeOvmHd9UZVCdhdo7PlpSxg==
Date: Fri, 31 Mar 2023 10:59:49 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Geoffrey GIRY <geoffrey.giry@smile.fr>,
	openembedded-core@lists.openembedded.org,
	Yoann CONGAL <yoann.congal@smile.fr>
Subject: Re: [OE-core] [PATCH] Fix cve-check false negative
Message-ID: <20230331085949df4c2e33@mail.local>
References: <20230328102349.57990-1-geoffrey.giry@smile.fr>
 <CAApg2=TD8PtdUxmLT7wOqRG-7O9zEaEKt0n47mRuRX_yvr1T=A@mail.gmail.com>
 <CAGwXbzZN_FXowS4QvFKxEW-a3_voTT3J6HZDjjg1P=ZEASFKkw@mail.gmail.com>
 <CAApg2=TfJT1g3EhEhGRXYXqVdS-0o25c_060ijhcmo73L9WSyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAApg2=TfJT1g3EhEhGRXYXqVdS-0o25c_060ijhcmo73L9WSyQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 08:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179404

Hello Marta,

On 31/03/2023 09:48:27+0200, Marta Rybczynska wrote:
> Hello Geoffrey,
> Would it be possible to run it over the world build of oe-core and possibly
> meta-oe ?
> 

It has already run successfully and is already merged.

> My build farm will be available only next week and I would like to know if
> there are unexpected changes.
> 
> Kind regards,
> Marta
> 
> On Wed, Mar 29, 2023 at 3:31 PM Geoffrey GIRY <geoffrey.giry@smile.fr>
> wrote:
> 
> > Hello Marta,
> >
> > We only tested core-image-minimal and some recipes that use the update
> > and release candidate formats (pX and -rcX)
> >
> > Geoffrey GIRY
> > SMILE ECS - R&D Engineer
> >
> > Le mer. 29 mars 2023 à 06:45, Marta Rybczynska <rybczynska@gmail.com> a
> > écrit :
> > >
> > > On Tue, Mar 28, 2023 at 12:24 PM Geoffrey GIRY <geoffrey.giry@smile.fr>
> > wrote:
> > >>
> > >> Fixes [YOCTO #14127]
> > >>
> > >> NVD DB store version and update in the same value, separated by '_'.
> > >> The proposed patch check if the version from NVD DB contains a "_",
> > >> ie 9.2.0_p1 is convert to 9.2.0p1 before version comparison.
> > >>
> > >
> > > Thank you for the patch. Which layers (and world builds) have you
> > verified it with?
> > > I'm asking because versioning is always a complicated problems with
> > frequent exceptions to all "rules".
> > >
> > > Kind regards,
> > > Marta
> >

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179402): https://lists.openembedded.org/g/openembedded-core/message/179402
> Mute This Topic: https://lists.openembedded.org/mt/97902020/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

