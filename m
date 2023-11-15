Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51825C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 11:24:59 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.10879.1700047493206777811
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 03:24:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=rrniOMS4;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ez5QurvoglmXJb+/ExuGJsBZiiT/A60a9TLX1dNezio=; b=rrniOMS4Qgsqd5eInPMKQb2Tm0
	vpNROwuwewnlrpvBjCE8aracq+VtyBTc3RG7KQIUKsqBp/v+AZWaIjC9g+nEWAAaCWGv5hsq9jl95
	Qo+OiJlEMqW4SGznsVRNwBG4hfiHOsKrqvRSKQ4vFBdhHagidGn7v0w2I/HQqS0pre8tVZH2c0oQp
	/BXVL3KvDGAMKP1mRlW86zj53wlw1rSNVFLCAhXgEzfotS6upg/Usv9s7pAxSMFGBltJ4LngTLkRi
	PYlOfG8zz+1eAQlaJPeCRHGFSyxW0jUluUBCIfM/KMiAZcIR+3rsCEWBpcg4sJzKgYlwHEzKJzNJg
	Fc5j8dLQ==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:33924 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1r3E0k-009dwT-2k;
	Wed, 15 Nov 2023 06:24:51 -0500
Date: Wed, 15 Nov 2023 06:24:40 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Ross Burton <Ross.Burton@arm.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] how to INSANE_SKIP duplicate installed files?
In-Reply-To: <0E9B17AD-8CA7-4C05-B2ED-1B976D1FC4DC@arm.com>
Message-ID: <23a040f8-9f1f-2e6e-923c-266fcc427577@crashcourse.ca>
References: <a0951c4-a5cc-15e0-91a8-f51fb5be8ed5@crashcourse.ca> <0E9B17AD-8CA7-4C05-B2ED-1B976D1FC4DC@arm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1215265207-1700047489=:962800"
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
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 11:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190587

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1215265207-1700047489=:962800
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Wed, 15 Nov 2023, Ross Burton wrote:

> On 15 Nov 2023, at 10:13, Robert P. J. Day via lists.openembedded.org <rpjday=crashcourse.ca@lists.openembedded.org> wrote:
> >  i swear, i once did this but now i can't find the solution for
> > allowing two recipes to install duplicate files. of course, the right
> > answer is to fix the recipes but a colleague just wants to get his
> > build to work so what is the quickest way to do the dangerous thing
> > and allow overriding installed files?
>
> Recipes can create the same file, but they can’t be installed at the
> same time.
>
> If two recipes install the same filename and they’re both pulled
> into the sysroot via DEPENDS then that is a fatal error and you
> can’t avoid it.
>
> If two packages install the same filename and they’re both pulled
> into an image then that is a fatal error and you can’t avoid it.

  never mind, just learned this happened on Wind River Linux, not YP,
*but* i swear that, some time back, this was happening to a colleague
and there was some override setting that allowed it. or i'm just
misremembering.

rday
--8323328-1215265207-1700047489=:962800--

