Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2A7C47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 08:08:50 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.49771.1704355727714784762
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 00:08:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=zrIzzAWK;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PWjoUfNgPTUDP9SxmfOkZBfgvMlO/xOx1Ri8KqM34nM=; b=zrIzzAWKO+qiX/uM+d3GcfkV9S
	74OyQsV4IlVbJiwzwT5/gAKHbprEhaRF9VUaRc0pJacb52TFXqTIP4MCBlU7NNFTkW293W7HYl+aF
	eqntXqqPtgRKv2/qQRgZuIu6EsWSds9r+pRBkpofcAXG93CcG0llvnrrokD5SWg7xee5t7gN5vMGb
	fDtwihocHqZoL8SCmjFFiNt9cvdBvoZ2/daMMSJbGnZj2Vvb5s0Eryez187GjGpXuX9Eb+XsOR/+q
	8oq9b/SyqZc+pDZCmHWAahKW1wtve36N2G4B8v/7b3O3pLpeDy6B+D0JEjJgsF272DLYVrt0XuKp9
	cT63zswg==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:41978 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rLImR-0036IA-0I;
	Thu, 04 Jan 2024 03:08:46 -0500
Date: Thu, 4 Jan 2024 03:08:43 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] how to sneak a function into the *middle* of
 "prefuncs"?
In-Reply-To: <d711ae4178f5e1144e34f1f8157ea41c165a3500.camel@linuxfoundation.org>
Message-ID: <f01d46fa-5a7a-692-35b4-193bd8c2abe@crashcourse.ca>
References: <76b8b03d-dcaa-8dd7-6fe8-32c7bc9baf20@crashcourse.ca> <d711ae4178f5e1144e34f1f8157ea41c165a3500.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 08:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193306

On Wed, 3 Jan 2024, Richard Purdie wrote:

> On Wed, 2024-01-03 at 11:21 -0500, Robert P. J. Day wrote:
> >   no, no, hear me out ... colleague has a vendor's YP build system and
> > needs to -- in the middle of a bunch of a task's [prefuncs] -- sneak
> > in a signing step. can't be at the beginning (what to be signed not
> > created yet), and can't be at the end cuz by then it's too late as the
> > artifact has been bundled.
> >
> >   first, as i read it, for a given task, all of the prefuncs are
> > invoked in exact L-to-R order, then the task is run, then all of the
> > postfuncs are done in L-to-R order. then (and only the) does the
> > processing move on to the next task.
> >
> >   given limited freedom to change the vendor's recipes, my first
> > thought was to define an "intermediate" task whose only purpose was to
> > babysit the signing step, make the signing function either a prefunc
> > or postfunc of that task (should not matter which), then redefine the
> > preceding and subsequent tasks to split up all those functions
> > properly so that the signing step sits in the middle where it belongs.
> >
> >   am i overthinking this? and even if the code processes a single
> > task's prefuncs and postfuncs in order, that's not the thing i really
> > want to count on.
> >
> >   thoughts?
>
> append or prepend one of the prefunc functions?

  hmmmm ... i embarrassingly had not thought of that. that might be
the solution, thanks.

rday

