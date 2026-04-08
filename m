Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD9110FC454
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 21:52:07 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.118074.1775685124980349476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 14:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Ovg7hDRG;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UOAQDWbat9exMe92n5ZJKMnmwhlu2EmT2O1pPOOzrVU=; b=Ovg7hDRGBWgQ8gPcRZbljniKJK
	iPqLRI2Yc+/+/NePCxsjh7ZHSpqxOHGQE8gdFDrxbdlmcpPGi+4Cr5cqk2qMmamIN4iGIcNqHvAK9
	nsAxTEmpGkk6QvCpf4gHDRmjqoFVT7bBxvOy/vXfdd0e3u419qdYSdjrbc8JmRGBTI6zN1vfQ4CMt
	VaY8iPxoCHqBiyshHbYWkfRJnKCN02zLk/B3iC6fYQr19C5qXwFWNxKPl31yOcTi9wtvxPM6u8y9y
	BqiZLydJcfat/kCzVqCgnOGT/3uJgET7vtXF84eFSqFhXFB8q4DfFPne4TzQu/pSGQUEEEODRBxoM
	RZDAey1A==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:52420 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wAaoa-00000003Psu-3zXd;
	Wed, 08 Apr 2026 17:52:03 -0400
Date: Wed, 8 Apr 2026 17:53:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] why would ASSUME_PROVIDED recipes be built anyway?
In-Reply-To: <1acc463784821951790b0a3cf3ee23a6b02aaa68.camel@linuxfoundation.org>
Message-ID: <c8876982-82da-0f03-b9ef-2796fbcab38b@crashcourse.ca>
References: <daa91ca5-ef8c-bb83-7079-3d03ace27a8a@crashcourse.ca> <1acc463784821951790b0a3cf3ee23a6b02aaa68.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1704243728-1775685205=:3660222"
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 21:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234867

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1704243728-1775685205=:3660222
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 8 Apr 2026, Richard Purdie wrote:

> On Wed, 2026-04-08 at 06:33 -0700, Robert P. J. Day via lists.openembedded.org wrote:
> >
> >   puzzled by something i just noticed ... the documentation for
> > "ASSUME_PROVIDED":"
> >
> > https://docs.yoctoproject.org/ref-manual/variables.html#term-ASSUME_PROVIDED
> >
> > clearly suggests that these represent recipes that would not be built
> > as they are already on the host, the example given there is
> > "git-native".
> >
> >   however, in a walnascar-based build i just built, native recipes
> > that were listed in ASSUME_PROVIDED were built anyway, even though
> > they are clearly on my Debian 13 host, "git-native" among them. in
> > fact, a number of recipes i checked appear to all have been built from
> > scratch, despite being listed in ASSUME_PROVIDED.
> >
> >   as a test, if i then tried to "cleanall" such a recipe, i got the
> > perfectly reasonable:
> >
> >
> > $ bitbake -c cleanall git-native
> > ... snip ...
> > WARNING: Explicit target "git-native" is in ASSUME_PROVIDED, ignoring
> >
> >
> > is there some reason that something listed in ASSUME_PROVIDED will be
> > fetched and built anyway? is it a version thing?
>
> Some of the recipes have a PROVIDES for XXX-replacement-native and you
> can build/depend on that.

  sounds like something that should be in the docs, just to avoid my
level of confusion. :-)

rday
--8323329-1704243728-1775685205=:3660222--

