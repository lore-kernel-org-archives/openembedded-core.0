Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9765FC27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 16:53:27 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.62310.1718643202059292039
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 09:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iqp7kkht;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FD6840004;
	Mon, 17 Jun 2024 16:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718643200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=le4uzO/nAdgLxrHWuG8lTWrSsF3RCxxEL5uqbWfPw3k=;
	b=iqp7kkhteP93In/WVbMbza/B+7+JbE4B8eNSMcIlNJhmZVwHzjdSK4R8BJldrmdCbM+pq6
	dsla9AangvX9Z78bMkUG5PiQdTv+CMXbAo7olfT7EOgzA7fklY3rAUAMwcft3lhSxEvSNr
	7yCNrCvaTM87I3gngVXN6psKbmEub/2XuS4EzsgpxoykGBSHNYR89x7xLIe/kLZQWVFKM8
	Ef/V6HDKAFmulwABkxnCjhxr7k59u6/b3VVwDepdy8TG6ExvAwYNCxQMAPt4RzenZGXGWs
	Z5dQwMPD9COnZYGK6q1BetA+f7O+1+JcmmJ/f67nXPAkG6DBNVFxb5h5CP5Grg==
Date: Mon, 17 Jun 2024 18:53:18 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Yash.Shinde@windriver.com, Sundeep.Kokkonda@windriver.com,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Naveen.Gowda@windriver.com
Subject: Re: [PATCH v2 2/3] rust: Upgrade 1.75.0->1.76.0
Message-ID: <20240617165318e86f75b3@mail.local>
References: <20240615160415.3457966-1-Yash.Shinde@windriver.com>
 <20240615160415.3457966-2-Yash.Shinde@windriver.com>
 <CANNYZj9QqARrVNXVxrQ8bJv676mGsMrn58TisxcXTYcs5LRTXA@mail.gmail.com>
 <708c2d0b-d578-46c6-a19d-c169f5a5750b@windriver.com>
 <20240617141428f7352c56@mail.local>
 <6eadb21d-b6b4-4f8e-8307-0ccb18ff487d@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6eadb21d-b6b4-4f8e-8307-0ccb18ff487d@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 16:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200850

On 17/06/2024 11:59:25-0400, Randy MacLeod wrote:
> On 2024-06-17 10:14 a.m., Alexandre Belloni wrote:
> > On 17/06/2024 09:31:19-0400, Randy MacLeod wrote:
> > > On 2024-06-17 5:43 a.m., Alexander Kanavin wrote:
> > > > I have to ask, why 1.75.0->1.76.0? Can we go straight to $latest,
> > > > which is 1.79.0 as of now? It's a significant additional effort to do
> > > > incremental updates, and we've fallen so behind that it's perhaps
> > > > better to try to catch up fully.
> > > > 
> > > > Alex
> > > Yash and Sundeep have updated and tested 1.76, 1.77, 1.78, 1.79 locally
> > > and have not seen any problems. As you know, the situation is
> > > often different when things are tested on the YP autobuilder. The idea
> > > is to test each update so that if there's a reproducability problem or
> > > some other AB specific problem, we have a smaller delta to investigate.
> > > 
> > > That said, if Alexandre wants the full series up updates in one
> > > series and sees that 1.79 works, we can try that.
> > > 
> > > If there are problems with 1.79 Alex could then test each update
> > > individually in master-next.
> > > 
> > > Alexandre, what do you want to do?
> > I can take a series of incremental patches and I'll bisect if there are
> > any issues.
> > 
> > 
> Super.
> 
> I stand corrected in that we only have up to 1.78 locally.
> 
> 
> Also, Richard does NOT want to update master until we've resolved the
> 1.75 reproducability problem so that we can easily backport that to
> scarthgap
> and so that there's some additional pressure to get that bug resolved.
> 
> 
> Alexandre,
> Do you want to test the 1.75 to 1.78 series in master-next ONLY so that we
> see if
> there are additional reproducability problems?

Yes, I'll base that directly on top of master to ensure there are no
other patches causing issues.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

