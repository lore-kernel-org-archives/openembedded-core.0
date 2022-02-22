Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D6CC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 23:41:42 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web12.975.1645573300983978592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 15:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=gPMY8+z2;
 spf=pass (domain: aj.id.au, ip: 64.147.123.19, mailfrom: andrew@aj.id.au)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 860603200F72;
	Tue, 22 Feb 2022 18:41:39 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Tue, 22 Feb 2022 18:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=/4kdOAAE2RyPdYvMclmBmKPR43Uc6OHFvyLNXN
	Ih7F0=; b=gPMY8+z2N3byqav3i7jggytLBTDk5lTIX4+taTTUCiE4KXNghlyFr3
	e2SWIMvAdJOIeM7ZW9x9xaqAOiOl4dvWmXZvqgXKdvjTVTj/gAXr72rDMIsV15TX
	bJdBgnV0nPh9FB0ofwNd1VeI0O1wa3zCoBY5TbEThPY8MNSaju+ZN59jmG04zEoz
	/SmXtDcM7eDgllkgYdaXaOLzf14rFBzkUvDA5t1DAFhRnBa1gdoS78K3Ohlo0rXJ
	Np7NW5qGsBRQ0tH9uUnuSHZhQV8/+dI+Wu3fa2zQ/Mo3sblEO5wtanQYXgoyzApy
	uDMTwNNgyBhh9qTy7L/i+ne1WxzAejBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/4kdOAAE2RyPdYvMc
	lmBmKPR43Uc6OHFvyLNXNIh7F0=; b=bvk+uTs8rO6x1nVXU8jJSeYF4fg2/gxZG
	l5x6f8XUxkuePRmGBasXjTbzSU94tjOSvJQY0KKwZT43MrwfucWI5VK7ywGMwV3A
	F/a6PUhAxTsVjYgZuQSXzeZ4TjEPPXpnV1iGSDCjQFuehPpij1U1F4jgzoCf0Fuy
	ZdPTiclX+WkwxIVPXAC4jJIozRx/mFZql7rUVggQHZoZDikT0EA/hHKwGuq/gAEL
	mQmtlHm7pL2sWdWI09yTyZFtTpPW0fEBDJyK1qLdzfgve0HOrSpG+weHDs+Do8y7
	d4KAfO+KEsC/Sr3BGLXzt8ksdbQQOO9pTdllS1jEp44AAJSVYPM3g==
X-ME-Sender: <xms:snQVYqh3H9m3W9FhFJwSJ0Wfg8i3ENV0Hr_YOk9pUySsLB-PyJ7U8g>
    <xme:snQVYrD-vP7HlkfsY7osjvChps0hl3IgL7QCUoxh4SWnH_rad3xqzIMN2E_JJ58l9
    nmCysA4dCctp6Q73g>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrkeelgdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
    veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:snQVYiHp6qRAaT8rXvylyTPqKMO4glrteBKoTggJ3NCtUJ8ZlRWGWA>
    <xmx:snQVYjRVyBJ_NtQQKm7rDZjwOvfR8R4yPzxwF8M3hZgS7q1LF64PIw>
    <xmx:snQVYnzDDNxxVQCy-zeMO5dokxX_DDl1xENCXsd4hbrTvAIqn7e_7A>
    <xmx:s3QVYgpTmZCXCgnUMij8YKPDET_wB-6y3b0e2vxu7SHZRu1lebT4fA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C06021920081; Tue, 22 Feb 2022 18:41:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <f009723e-2b61-4df1-a098-8be73152b5d1@www.fastmail.com>
In-Reply-To: 
 <CAMKF1sp6c40ZRaBkkpAo+wdmcRd57TKZEk8xADpJCt8SPmmdEg@mail.gmail.com>
References: <20220222035234.463162-1-andrew@aj.id.au>
 <20220222035234.463162-8-andrew@aj.id.au>
 <CANNYZj_3sRMqa-F_GvR2fCi2vNtafyNOvyHB_WhS99EhpoVK_w@mail.gmail.com>
 <48dc371d839b004db347823b5867f4c338e94443.camel@linuxfoundation.org>
 <CANNYZj_G4Y0=sO7j7VaPeLc8gF6EFGwnuHTKcXhouTKmzODoog@mail.gmail.com>
 <CAMKF1sp6c40ZRaBkkpAo+wdmcRd57TKZEk8xADpJCt8SPmmdEg@mail.gmail.com>
Date: Wed, 23 Feb 2022 10:11:18 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Khem Raj" <raj.khem@gmail.com>,
 "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH 7/8] rust: Add snapshot checksums for
 powerpc64le
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 23:41:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162230



On Wed, 23 Feb 2022, at 05:04, Khem Raj wrote:
> On Tue, Feb 22, 2022 at 6:24 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
>>
>> On Tue, 22 Feb 2022 at 13:28, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > On Tue, 2022-02-22 at 10:59 +0100, Alexander Kanavin wrote:
>> > > I have to note that YP does not support ppc systems as build hosts;
>> > > can this be kept in a bbappend?
>> >
>> > It isn't official but there are obviously people using it. I think we should try
>> > and do something in core but there is a question of how we maintain this given
>> > our infrastructure/tests don't cover it :(
>>
>> Worse yet, there is no way to test this locally either.  If the ppc64
>> binary tarball checksums are added to the core rust recipe, presumably
>> I'd be expected to update them together with x86 and arm64 binary
>> checksums on version updates, but I'd have to do this completely
>> blindly with no testing of any kind :(
>
> as long as it does not impede main testing I would think thats ok and
> we can expect the OE community
> members like Andrew to test this and report issues or better fix them

Well, hopefully I've shown I'm at least willing to try fix things :D

And yeah, my preference would be that the ppc64le checksums are just 
bumped along with the rest, but without any explicit testing beyond 
that. I understand that I'm not the maintainer here so will go along 
with whatever approach is chosen, but keeping them here feels like 
we're at least solving the problem in a consistent spot.

As mentioned in the cover letter we found this issue via the ppc64le CI 
machines used in OpenBMC. OpenBMC tries to integrate upstream YP 
changes every fortnight or so. That's obviously not as ideal as ppc64le 
resources dedicated to YP, but I think this provides enough feedback 
that things won't completely rot.

If a bump does cause issues I'll try to resolve them as soon as possible.

Andrew

