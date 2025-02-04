Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A63C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:59:28 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.116476.1738677557996131745
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 05:59:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=OSARDaYE;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=FDqammZvjUz0g2xrPG8Ut95xv5fN3TcmIEZfW4dowic=; b=OSARDa
	YEb5ig4XHnl7UddsEsI0UT9uOen4IdPCRKUtSFz+9EqWlO6qibCfU5rHJxruBav+DZkyoovLgtZdX
	YMdNBqzf/BQGPttn8wPNa2pLSp7BELa2BCxgpmZexp5f+qA5p/cSnWWdQQckYBN07FfCVq0VpK7X4
	kLMjMjuN58xV3x0WOm+irHQ6FyqWsRpT16mHdv7mCt8rCguPQBRvlwXUBFCyA2ng27KwLNE6FvbBG
	bs1jYpfuexuQ6AUCm5dX1m68472QRDgwkClZljCMPkifZ83DR6Xcv50yb/gntja4tF4Xak+7cNqil
	N6L71YsJHSCwceaCaHdFb/oOcB6g==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <sean@geanix.com>)
	id 1tfJSO-000Dz2-19;
	Tue, 04 Feb 2025 14:59:16 +0100
Received: from [2a06:4004:10df:0:ccc1:2e72:c6e3:a6af] (helo=Seans-MacBook-Pro.local)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sean@geanix.com>)
	id 1tfJSO-000IN3-0N;
	Tue, 04 Feb 2025 14:59:16 +0100
Date: Tue, 4 Feb 2025 14:59:15 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] image/populate_sdk: Support usrmerge for
 nativesdk in SDK builds
Message-ID: <ygnmol4i3p5iixvkrzw6spgljha7vnx6zjljajqr4q2j6r5mvo@eud25kakycyq>
References: <20250117130851.4055166-1-sean@geanix.com>
 <C02E5327-1001-4CA9-BA15-E063F862C4AA@arm.com>
 <3ot3xt22h6idimbs4xrb4cnojyxeswugitvortqlinqdffb76o@tebg2u26fzin>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3ot3xt22h6idimbs4xrb4cnojyxeswugitvortqlinqdffb76o@tebg2u26fzin>
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27539/Tue Feb  4 10:37:52 2025)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 13:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210800

Hi Ross,

On Wed, Jan 22, 2025 at 03:04:35PM +0100, Sean Nyekjaer wrote:
> On Wed, Jan 22, 2025 at 01:41:11PM +0100, Ross Burton wrote:
> > Hi Sean,
> > 
> > On 17 Jan 2025, at 13:08, Sean Nyekjaer via lists.openembedded.org <sean=geanix.com@lists.openembedded.org> wrote:
> > > Some recipes(systemd) requires usrmerge. Create the required
> > > symlinks for `/bin`, `/lib` and `/sbin`, when installing nativesdk
> > > packages.
> > > Enable the symlink creation by setting the `usrmerge` flag in
> > > DISTRO_FEATURES_NATIVESDK.
> > 
> > This implies that there is some layout dependency between the target and the sdk environment. There really shouldn't be, what broke to cause you to send this?
> 
> Hi Ross,
> 
> In order to build and test our rust programs, we need libudev which systemd is providing.
> We are running our tests with nativesdk.
> 
> Systemd is requires usrmerge.
> 
> Hope that explains :)
> 
> /Sean

Forgot to ask you yesterday at the OE Workshop.

Is anything holding this back?

/Sean

