Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD16C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 11:35:14 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.9421.1707824110165031620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 03:35:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=MQz1AEET;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MfDc2kLQL+W9jcSuWf00pbmQjaa/Fn3N9ha2iJ9xo2Q=; b=MQz1AEET49Y7iGoAG+TKtmEOrI
	j3cSPmxMv+kAituliWavOIF2q/QwDi/RFugZn1ZHCcsFzsMnK7cFOGef2olbLbQkA2wRU+Ns/9uJ1
	BupvlFqNed5DcCawYsjEm2oO2aNZu3suDS3f3MOtsST5p89n4ZkSpsaMEK24n3G2sVEjwVYymDbp9
	vdXyc83YNscw2q0jJUdYGIFG/GK9Y5gde6bQQ1K9WTnMDrfhrKQBn+fd/tCOThswzrjhQj+7rn0pQ
	tcsX+CHq1nn1YFBKNVR92pp+uSPlnHSL4nZDay2Gx87xR5vQY6+nKF+s7toGetSzJnpQRtW3E6VTl
	Qbn9KIiw==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:41544 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rZr42-00EW8L-2V;
	Tue, 13 Feb 2024 06:35:06 -0500
Date: Tue, 13 Feb 2024 06:35:02 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Ross Burton <Ross.Burton@arm.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] more ptest pedantry: why conditionally include
 "run-ptest" in SRC_URI?
In-Reply-To: <8C7A9199-D49B-4190-9D96-F060CD858C71@arm.com>
Message-ID: <6c701a47-f76-e3d0-3ea8-1b44ec7617c0@crashcourse.ca>
References: <8d71c0f-9120-85b7-80ce-d985aa557f8@crashcourse.ca> <8C7A9199-D49B-4190-9D96-F060CD858C71@arm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-491389369-1707824104=:409599"
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
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 11:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195390

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-491389369-1707824104=:409599
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Mon, 12 Feb 2024, Ross Burton wrote:

> On 12 Feb 2024, at 06:39, Robert P. J. Day via lists.openembedded.org <rpjday=crashcourse.ca@lists.openembedded.org> wrote:
> >  more annoying nitpickery ... here:
> >
> > https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/xz/xz_5.4.5.bb#n28
> >
> > it's not clear why someone would go to the trouble of conditionally
> > including run-ptest in SRC_URI as i would have thought the only
> > benefit would be to avoid the triviality of copying run-ptest into
> > WORKDIR, but beyond that, i don't see what the point is, and that's
> > the only recipe i've run across that bothers to do that.
> >
> >  is there something more subtle happening here?
>
> No good reason, and I’d approve a patch that removed the
> conditionals on the grounds of cleaning up the recipe and ensuring
> that there’s less conditional paths through the recipe.

  additional note in that, if a recipe inherits ptext, then it's silly
to conditionally include "run-ptest" in SRC_URI. but it's trickier if
something else in SRC_URI is included conditionally:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/flex/flex_2.6.4.bb#n18

without knowing what that patch does, it seems like you kind of have
to leave it as conditional. maybe other examples are more obvious.

rday
--8323328-491389369-1707824104=:409599--

