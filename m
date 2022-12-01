Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFBAC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 23:05:47 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.60643.1669935939159172602
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 15:05:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ELcKTcpK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1ED1D60008;
	Thu,  1 Dec 2022 23:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669935936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l+Rdoq8bjeYC4RKa8cXMwVONcPQVENEenoAvSrmjuls=;
	b=ELcKTcpKDv4+Hlcn/F6uqjbZ5jcyHBwUcbLF61cmlgXHgnY3lKBDw2PJw/fr0G19CbqpR0
	TRq0hV4+JZNqSUcYJnRQJusCDbEcW28CqKm1572cJXwGIsBt4Oe6dN/oPJwPvo+49VpRd3
	bsw7V4mC43DLdEozdxinep/ZeYj5ZfDFaqKHVi0UOganSJf7YBC1ZKZKd/byOZ85lmaW6t
	SEjJ4j6JqaaEgo8i2lj7VwEceKDSk1TvA/rGRVknIMIqdqdGVkGA6/zYkq+TE/Z2MT32ta
	0zCH8wtn+GbrLoS1vjRZxi3oFnPvSyBWteQkmCHkTfT5nS9Zhbv5h3cWwQQGTA==
Date: Fri, 2 Dec 2022 00:05:35 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 6/6] pseudo: Disable LFS on 32bit arches
Message-ID: <Y4kzP3WMTabOHMYB@mail.local>
References: <20221201190248.175753-1-raj.khem@gmail.com>
 <20221201190248.175753-6-raj.khem@gmail.com>
 <e65f40a225318abefd91c75d51943fc141368082.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e65f40a225318abefd91c75d51943fc141368082.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 23:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174214

On 01/12/2022 19:12:50+0000, Richard Purdie wrote:
> On Thu, 2022-12-01 at 11:02 -0800, Khem Raj wrote:
> > pseudo overrides certain libc functions which are aliases when LFS64 is
> > enabled. In anycase pseudo may not be much used on 32bit systems anyway
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/pseudo/pseudo_git.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > index c34580b4ff..c3f0a987fc 100644
> > --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> > +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > @@ -17,5 +17,7 @@ SRCREV = "c9670c27ff67ab899007ce749254b16091577e55"
> >  S = "${WORKDIR}/git"
> >  PV = "1.9.0+git${SRCPV}"
> >  
> > +TARGET_CPPFLAGS:remove = "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
> > +
> > 
> 
> We need to put some comments in here about what this is doing and why.
> 

Note that this was one of the issues I had with the
-D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64 build. My guess is that we also
have to remove -D_TIME_BITS=64.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

