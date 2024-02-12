Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42623C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 06:36:57 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.1390.1707719813917813400
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Feb 2024 22:36:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Jd9dF82G;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vI2fU7X5ATkMM1RHkcBHqk0z3sF5ksmQNq1Y2H+d8Hk=; b=Jd9dF82GRcBzWTfZaAQhuTcgvQ
	14sMRVWflYzVv49kWZHpJdIHPUm5zqt5rbMxqkRLZXkiMufLVmoPtNSfjkjWGoXeLXu6UjWYba4M9
	A68dQ95lG+ZwHuA/ZjUMVqzzCIDJaEcDgAscTM9YBHRC0drycizyTiGYP6Tz3eA10uK8UtM5M5ti8
	/nz2MP5r1ZdeipE6hgn2AXEmgTas2YI8STsxZw/9nJ5GukW87UFD3WzZ9tv4O1teuTxpMdGrw08ev
	GIVEOuHcyBtwMuPVWKl4lZFxKuOirNL8FF/dPScGeL40qWMUsX9YAzqE7sSB5hyqfpfT3MJboroGQ
	VvD4nQig==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:41458 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rZPvr-00BUKC-2u;
	Mon, 12 Feb 2024 01:36:52 -0500
Date: Mon, 12 Feb 2024 01:36:36 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: =?ISO-8859-15?Q?Simone_Wei=DF?= <simone.weiss@posteo.net>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] why does cpio recipe RDEPENDS on ptest-runner?
In-Reply-To: <cc8af6643d90dee131a5d1ac8d1907d926570092.camel@posteo.net>
Message-ID: <25604922-5dc-7cfa-5d98-b302af365aa@crashcourse.ca>
References: <4deb850-6761-e375-ab3d-b1f8c2cc23@crashcourse.ca> <cc8af6643d90dee131a5d1ac8d1907d926570092.camel@posteo.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-837080350-1707719808=:379269"
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
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 06:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195298

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-837080350-1707719808=:379269
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sun, 11 Feb 2024, Simone Weiß wrote:

> On Sun, 2024-02-11 at 06:52 -0500, Robert P. J. Day wrote:
> >
> >   in the midst of writing a ptest tutorial for some colleagues and
> > wanted to embellish it with live examples, and noticed this in the
> > cpio bitbake recipe:
> >
> > https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/cpio/cpio_2.15.bb#n69
> >
> > this is the first recipe i've seen that actually *needs* ptest-runner
> > as a runtime dependency. why is that? i always thought ptest-runner
> > was entirely optional even when using ptests.
> >
> > rday

> Hi, this is a special case. cpio ptest runs not under the root user but
> under the ptest-user.
>
> This user gets created in the ptest-runner recipe
>  grep -i useradd ptest-runner_2.4.2.bb
> inherit useradd
> USERADD_PACKAGES = "${PN}"
> USERADD_PARAM:${PN} = "--system --no-create-home --home / --user-group
> ptest"
>
> Hope that helps,
> Simone

  very much, thanks. i *suspected* it had something to do with the
ptest user thing, i just wasn't sure.

rday
--8323328-837080350-1707719808=:379269--

