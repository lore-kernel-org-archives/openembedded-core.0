Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F85C4332F
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 22:13:45 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.102863.1669587220043139005
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 14:13:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=C6ymze9l;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A049BC0007;
	Sun, 27 Nov 2022 22:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669587217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T+62/aZ8iU6V7QtXXbACHAonpl0Ui0vqPq1y/uPvz70=;
	b=C6ymze9lBVNhHFwyf69sHdpc9/OljsTxpKXCKN9JZwMgZclWkRpUsfSkkeazJoH9UBopyX
	iYtjhIN6Za3n1uYrtmboO/2nD2sFMOBTtJbMifkNNbfzyS73PQ2Hcla4baf8Gvqa/JKiQ9
	rLltI5Y5Ka8+tef2MGNYqW2Ldt4AB7HNwlbB0O7jd6Zo1Clqn6d+fdg8fk8LwT8qA87fFV
	VDzaXme440C3nZsOmphEmtx3e+S8r5PiBH0PYRWMgVJC1D1KQSl8OzdRpFfzK53j2ha6s2
	Z6qgoVtA0vthY5cUwxeaheKPCw6mM+5AE0epu4/Kjq5661T7i99HnsB/PIdkig==
Date: Sun, 27 Nov 2022 23:13:36 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Petr Vorel <pevik@seznam.cz>, openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>,
	Khem Raj <raj.khem@gmail.com>,
	Changhyeok Bae <changhyeok.bae@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/1] iputils: update to 20221126
Message-ID: <Y4PhEOd5RUZ97Bff@mail.local>
References: <20221127151708.473859-1-pevik@seznam.cz>
 <Y4OvnGtP+XQBEjXc@mail.local>
 <CAB1t1Cym1x5-k7yG3QCB+br+J-d0AouFJMBHObywPb7-F-PO7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB1t1Cym1x5-k7yG3QCB+br+J-d0AouFJMBHObywPb7-F-PO7Q@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 22:13:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173887

On 27/11/2022 22:55:31+0100, Petr Vorel wrote:
> On Sun, 27 Nov 2022 at 19:42, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hello,
> >
> > You should at least build test your patches
> 
> OK, I'll do. What always discourages me is that unlike Buildroot
> build, openembedded takes so long.
> 
> What I usually do:
> cd ..; git clone git://git.openembedded.org/bitbake.git; cd -
> . oe-init-build-env
> bitbake iputils
> 
> If there is anything I can speedup a build (e.g. using some of host
> utils to build really just the target) please let me know.

Not really, you'd have to keep your sstate-cache but my guess is that
your builds are infrequent enough that everything will rebuild anyway.

This made me try to understand why you didn't test your patches and I
didn't realize you are maintaining iputils. Thanks for the help!

> 
> >
> > On 27/11/2022 16:17:08+0100, Petr Vorel wrote:
> > > -PACKAGECONFIG ??= "libcap rarpd \
> > > -                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod', '', d)} \
> > > +PACKAGECONFIG ??= "libcap \
> > > +                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '', d)} \
> >
> > This probably doesn't work either
> Not sure what's wrong on this, but maybe build shows that out.

The whole bb.utils.contains call can be removed because it doesn't do
anything once you remove the 'ninfod' argument.

I'll send the patch to our CI with the line removed


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

