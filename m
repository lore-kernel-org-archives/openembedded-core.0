Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5913AC4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 14:10:45 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.12322.1705587035359557445
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 06:10:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Gdw0GrXs;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UYO0uS33UWE0hg2TOtIrf3uG2OJBfnN7QYdd7F0bTJ8=; b=Gdw0GrXs9rD8H6MrgXRC57ZwaD
	3BjA7Wl4QHX2XnXJvgv5/GJDlRm4bufHVcIbZ31qjPkDlr7aBmc/aZxRRwcQF/IvtbuXmoRL6eteh
	gQ8IORKWY+0Yg1GHIJdLhWR1Up49pFzLp/sO1ZP9m2/Mc+DuXOn5FUOoNWzGD5LsKbiRT0AL5YA91
	zfq3sxzA+/oXLO151tqI7odm4F7liansHArZ/H4NyXnRFGOwxBeQZy7wqbNwEkucu6DIQ2M5H0LZu
	7BfZG4/I98ydllvAS4S0pkp3jxne+435KnuFeRpOnLzEA9FLqIQt0j0CKxeXoUq4BLGYohdV+kqUf
	SEZmj0wA==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:49992 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rQT6G-00Ggoq-1G;
	Thu, 18 Jan 2024 09:10:33 -0500
Date: Thu, 18 Jan 2024 09:10:30 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] want to confirm i'm using "externalsrc" and "bin_package"
 efficiently
In-Reply-To: <CANNYZj9swGJz6kc4ykCAOnw=ACc_4aCn1UODGZSKrhT4Rcpj4g@mail.gmail.com>
Message-ID: <cbd55bb-9148-16b4-4146-b6e8cebb9d3@crashcourse.ca>
References: <dfcf7a4a-81b1-ff26-d14-923bf379025@crashcourse.ca> <CANNYZj9aG5qcpe6PksShW4W69uk7EZ+j7yxHb43tgfDrk8ygFQ@mail.gmail.com> <5610c776-f1d9-3543-9878-56fad23e776a@crashcourse.ca> <CANNYZj9swGJz6kc4ykCAOnw=ACc_4aCn1UODGZSKrhT4Rcpj4g@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 14:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193987

On Thu, 18 Jan 2024, Alexander Kanavin wrote:

> On Thu, 18 Jan 2024 at 15:04, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >   i just tested, and the recipe does *not* rebuild unless i change
> > something in the ("externalsrc") source directory, at which point,
> > yes, it rebuilds. which is exactly what i'm after.
>
> It only doesn't rebuild because you already have a build/tmp directory.
>
> But as no sstate objects are created, if you wipe tmp/ or make a new
> build directory, it will rebuild again even without any changes at
> all. Try that!

  ah, got it. that's still fine since as the content is almost
exclusively binary (pre-built) content, redoing from scratch will take
no time at all. thanks for clarifying that.

rday

