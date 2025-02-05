Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C09C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 11:32:17 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.9932.1738755128322539100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 03:32:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=gwHOsxv+;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=tFXxoEUU3scN35R1e7VbXIH/g2vtCL2LZrMlaigDPe8=; b=gwHOsxv+ZBuCM2uuhCSAsx0VBb
	dXyG31FTJBCL0nTbe9jFEA3kHD4oLSTDXFQ+axzmeR4TSMcILC1eCb4XgRktcbdm8MYBtJ5NONgG5
	vcKdVTgTcJ2gH5FaCBaOpHYLpfLQ8LLABC8pr887gMySJ+5jCCfDkUopjgn6dIvPiEh1bgrVQMizw
	xngBoi/KTYmZnnDleF3np7qDtFCLbjAOqn2DatzILK1oRM4KZwCowr2OSOKPkWQCenhymHT6565IH
	/0K8zCOgxEMzupUQ1LGpq1WEhc5dLXtd0l9BIA7N6Gz9DpLmo0Je3q83j17xGuoUIVC5iAxGlqrdj
	cL2kGHYQ==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <sean@geanix.com>)
	id 1tfddW-000Cnv-0Q;
	Wed, 05 Feb 2025 12:32:06 +0100
Received: from [2a06:4004:10df:0:d94d:d40a:4a21:7bb9] (helo=Seans-MBP.snzone.dk)
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sean@geanix.com>)
	id 1tfddV-000Oq0-2f;
	Wed, 05 Feb 2025 12:32:05 +0100
Date: Wed, 5 Feb 2025 12:32:05 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: esben@geanix.com, 
	"Richard Purdie via lists.openembedded.org" <richard.purdie=linuxfoundation.org@lists.openembedded.org>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] image/populate_sdk: Support usrmerge for
 nativesdk in SDK builds
Message-ID: <b2vv7mqkahxdgqfv2jemg4hij2b5gqo47rkrwqr7ji5ojiejzf@k6eofnxr36ex>
References: <C02E5327-1001-4CA9-BA15-E063F862C4AA@arm.com>
 <3ot3xt22h6idimbs4xrb4cnojyxeswugitvortqlinqdffb76o@tebg2u26fzin>
 <ygnmol4i3p5iixvkrzw6spgljha7vnx6zjljajqr4q2j6r5mvo@eud25kakycyq>
 <38dd9094715c7221474248449177f995a443eea6.camel@linuxfoundation.org>
 <87frksg5i5.fsf@geanix.com>
 <f7ca0ce2a482d4b52d55f026bea16ff8475e0b2a.camel@linuxfoundation.org>
 <87bjvgg1jr.fsf@geanix.com>
 <4e7e8eea32f307dd28e5bec216a1b149e42ba5f3.camel@linuxfoundation.org>
 <877c64fzvf.fsf@geanix.com>
 <378a05664499bf7d4dd91a05fdbf02cbf48bc0d7.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <378a05664499bf7d4dd91a05fdbf02cbf48bc0d7.camel@linuxfoundation.org>
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27540/Wed Feb  5 10:42:02 2025)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 11:32:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210844

On Wed, Feb 05, 2025 at 11:10:37AM +0100, Richard Purdie wrote:
[...]
> 
> There are other ways to solve this problem. 
> 
> Sean said you need libudev in nativesdk and I'd imagine there are other
> ways to manage to build that without changing the whole SDK layout.
> Sure, that is probably a path of least resistance but my point is that
> I don't think it is the right one.
> 

Yes, I'll manage :/

As I have seen on the mailinglist, I was not the only one with this problem.

My professional pride does take a hit when I see an issue and not being
able to fix it.
I think it would be a nicer to abort the sdk build, if one sets usrmerge for
nativesdk, than having the sdk fail at install time.

/Sean

