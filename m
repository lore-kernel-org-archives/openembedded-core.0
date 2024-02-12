Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32D3C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 14:46:19 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.7995.1707749176199372641
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 06:46:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=IEFZtXzm;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bWoB2jrOWc4u6s1TOnyokNbxV8tl20jnK4gFBrm7unc=; b=IEFZtXzmNEkxR2uDfDlnwmc45m
	BU5salZ+8dhoJnyBkd43/1SzAagEKN0/SZOkSxgANCEieg4B0E7PFxg9et8rAvZLEScr+nCRidQQ4
	EDZTta44rDtCjah6WvsNE4YfNNO7ZgREVkinTk4nLhWWugjhw2QNCsmATjDSeuOe77obJgwjLL2wn
	FXFZuikexDNEm7f61HH7fZuxkwwhJ/YpwYuTL6bgNrDFEnWI1megziCkW/RhlQyaDNs/1cMs7n+Mo
	TLEIJ3mmBsC0sd6crM03dcmCDBgb1BO06sEgHkX19VhPGykpqeFrrX3RL1KRRC8IKO2kJEg4GAUso
	wzvg+a6g==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:41490 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rZXZT-00CFZv-04;
	Mon, 12 Feb 2024 09:46:14 -0500
Date: Mon, 12 Feb 2024 09:46:05 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alex Kiernan <alex.kiernan@gmail.com>
cc: Ross Burton <Ross.Burton@arm.com>, 
    OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] more ptest pedantry: why conditionally include
 "run-ptest" in SRC_URI?
In-Reply-To: <CAO5Uq5Qyr7ca2rcVtRs4seSyKid58J3ZGhRHuynm-AFYgM1PXw@mail.gmail.com>
Message-ID: <ac14ca2-ef63-6ee-d01b-c4ed4b65d78@crashcourse.ca>
References: <8d71c0f-9120-85b7-80ce-d985aa557f8@crashcourse.ca> <8C7A9199-D49B-4190-9D96-F060CD858C71@arm.com> <bef4a38f-aa1e-d57b-e23-f3a059ebe313@crashcourse.ca> <CAO5Uq5Qyr7ca2rcVtRs4seSyKid58J3ZGhRHuynm-AFYgM1PXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-35461672-1707749171=:392286"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195338

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-35461672-1707749171=:392286
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 12 Feb 2024, Alex Kiernan wrote:

> On Mon, Feb 12, 2024 at 12:17 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> > On Mon, 12 Feb 2024, Ross Burton wrote:
> >
> > > On 12 Feb 2024, at 06:39, Robert P. J. Day via lists.openembedded.org <rpjday=crashcourse.ca@lists.openembedded.org> wrote:
> > > >  more annoying nitpickery ... here:
> > > >
> > > > https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/xz/xz_5.4.5.bb#n28
> > > >
> > > > it's not clear why someone would go to the trouble of conditionally
> > > > including run-ptest in SRC_URI as i would have thought the only
> > > > benefit would be to avoid the triviality of copying run-ptest into
> > > > WORKDIR, but beyond that, i don't see what the point is, and that's
> > > > the only recipe i've run across that bothers to do that.
> > > >
> > > >  is there something more subtle happening here?
> > >
> > > No good reason, and I’d approve a patch that removed the
> > > conditionals on the grounds of cleaning up the recipe and ensuring
> > > that there’s less conditional paths through the recipe.
> >
> >   it gets even stranger when you have a conditional to apply a test
> > patch, like here:
> >
> > https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb#n21
> >
> >   i am also assuming that it's cleaner to conditionally check for
> > ptest assignment for stuff like SRC_URI and DEPENDS, not with:
> >
> >   ${@bb.utils.contains('DISTRO_FEATURES', 'ptest' ...
> >
> > but with the more intuitive:
> >
> >   ${@bb.utils.contains('PTEST_ENABLED', '1', ...
> >
>
> The PTEST_ENABLED version has the advantage that disabling ptest for a
> single recipe is much easier. I guess you could manipulate
> DISTRO_FEATURES on a per-recipe basis, but that feels awful.

  so you're confirming that the second form is equivalent, and more
intuitive? i just wanted to make sure (again) that there was no
subtlety i was overlooking.

rday
--8323328-35461672-1707749171=:392286--

