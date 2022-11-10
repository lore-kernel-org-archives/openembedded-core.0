Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A06C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 20:32:50 +0000 (UTC)
Received: from mail-61-r20.ipv4.per01.ds.network (mail-61-r20.ipv4.per01.ds.network [27.123.24.217])
 by mx.groups.io with SMTP id smtpd.web09.855.1668112369097680038
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 12:32:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default header.b=Ja7K2a5P;
 spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 27.123.24.217, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network [122.201.124.108])
	by halon-out02.au.ds.network (Halon) with ESMTPS
	id e7143176-6138-11ed-8290-f8bc1204ff90;
	Fri, 11 Nov 2022 04:47:34 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KStDkIKRGv7FuJU0TDhoI3SmBtyN3i2+O0CN4s8bFJA=; b=Ja7K2a5PYO1E5ospoW40jdJXIC
	UfMz0CQ4t0o4x8rzopEEjSycQ9qek9MdRhgqGqds3gLFpLdoxvrmdiKCO1qgZUdxFaiEzxGtxVP4t
	aN90Z4Pz7vhAzyAQyWcHeLVo1fhl6JHWo7LHAq8rm276g91mER03UUVg7DAkeIJscXBEDot7EZiP9
	AbtsF/AFdhizRL92l99hNyrgh1hRo5iAMUcj+TuM6jKV/XVfq+ro2y3eWbqJsptFhfsm8Ojy4I+7G
	3TcvYZhZqhbLRj83++cr98atYGBfDQAkWNgO7Y9qYxbWibB8SrLfcsrnEaEFDTkaMKkBxgZMu5ze+
	Dh7WaXpQ==;
Received: from [151.210.143.155] (port=56182 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1otEE8-00049a-UT;
	Fri, 11 Nov 2022 09:32:44 +1300
From: Paul Eggleton <bluelightning@bluelightning.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.microsoft.com>, openembedded-core@lists.openembedded.org, Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [RFC] [PATCH] Allow fitimage + initramfs rebuild to be accelerated
Date: Fri, 11 Nov 2022 09:32:44 +1300
Message-ID: <3386323.QJadu78ljV@linc>
In-Reply-To: <7a3e2fb0a5f0e71581fa4c2da529454bd2eb27ad.camel@linuxfoundation.org>
References: <1667435031-7224-1-git-send-email-paul.eggleton@linux.microsoft.com> <7a3e2fb0a5f0e71581fa4c2da529454bd2eb27ad.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp-fp06.syd02.ds.network
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bluelightning.org
X-Get-Message-Sender-Via: cp-fp06.syd02.ds.network: authenticated_id: paul@softec.co.nz
X-Authenticated-Sender: cp-fp06.syd02.ds.network: paul@softec.co.nz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 20:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173104

Hi Richard

On Thursday, 10 November 2022 11:14:24 NZDT Richard Purdie wrote:
> We have tried really hard to avoid putting all of the kernel build
> output into sstate. The main reason for that was that recompiling the
> kernel from source took around the same amount of time as compressing
> it and moving it around in sstate, it was huge.
> 
> If we're going to start putting all the kernel bits into sstate, we
> would probably rethink kernel-devsrc and a few other pieces too. I'm
> not sure we should do that but they're all connected. Perhaps we do
> give in and do that but I doubt people will like the build times or
> sstate size increases :(.

Right, and I had avoided putting too much into sstate with this patch - 
basically just vmlinux and the contents of arch/${ARCH}/boot (via the perhaps 
a bit broadly named KERNEL_OUTPUT_DIR) - possibly even that could be trimmed a 
bit. For our case building the kernel takes a significant time because (long 
story short) there are actually two kernels building (debug and regular 
flavours) and there are a number of items that depend upon them -> they also 
get rebuilt if we don't untangle this a little bit.

I'm now wondering if part of the solution here would be to move some of the fit 
image + initramfs assembly to the initramfs image context. That would mean 
that do_deploy would need to save away everything necessary to do that, but 
that shouldn't be a huge amount of data.

> I'd also observe that we don't have good tests for a lot of these
> different use cases. The code has slowly been turning into an if/else
> labyrinth and it is very unclear which usecases are being used by
> people. We have seen a rise in test cases and I have pushed for them
> where I can but the situation isn't great and is a big worry whenever
> we make changes in here.

I'm all for adding additional tests, certainly, and I'm happy to at least some 
of that work. I'd need to get a better understanding of some of the other use 
cases though.

> Adding in yet further if/else paths with magic variables to control
> them isn't filling me with confidence.

I understand that. I was hoping to figure out a way to avoid adding significant 
extra complexity.
 
> The recent work Sean Anderson did on fitimage with u-boot looked like a
> promising de-cluttering of some of the maze.

Indeed.

Paul



