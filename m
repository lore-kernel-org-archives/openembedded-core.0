Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1330C433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 01:46:13 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web12.5793.1645235163138369636
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 17:46:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=wq5eA9CQ;
 spf=pass (domain: aj.id.au, ip: 66.111.4.28, mailfrom: andrew@aj.id.au)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 46F525C0359;
	Fri, 18 Feb 2022 20:46:02 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Fri, 18 Feb 2022 20:46:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=0NuQhMc8czZG5sz2hdlSWcyMR7fchutPvNOgia
	9wNmI=; b=wq5eA9CQ7BvkgFjlCNLYUdVJny5mTpHt6oQIJfi8aRAbH/d0Rgd1rt
	XioDLQyoSH0kgf+w3VrKSj4U4QwQhnGvU9pWnusiVczuVLD4MQogBieMCtBBWIjm
	kJGcsNuPie5XxwTtt/xqJMyHFD/NovGGDvQicv5H8FdXafkPMasu/aG/kp5Fmr9X
	Nmlpynnj3FT3VMnV1niDQzfXfA7oVP9urlXFlZz20MeeYP4AMdKvAIzoCnwm1ooR
	w3bTir8l8XcD6h+xh8HT+K/uG4e/uaq/Yw7kzDIDLAS9HWNXDY3S39+KJaBFwLu8
	kROXqrZj5VBoZ37GfFqMEzBFrnogPsDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0NuQhMc8czZG5sz2h
	dlSWcyMR7fchutPvNOgia9wNmI=; b=F0tWbJIUxoXgSULfQSulrQKgvMr915EnJ
	ZmGJgvv6tZbkJwJJRZnr+4Uo0PBjD90IMKVYPWoB+ZZaIHagiru8/cYSF79MurPs
	lEeO9jlfQp3zWf1GbN51SMQPADBXORfwD2bj6c26w5/+TjxusGW7qtkjYgqmxGPY
	TqJzb3vAmtu63p4u3q5Ov2A8cs0Kfurr5p/7RsbGDwCYH0kBHq1S+2d5j9BL8rer
	W+55nDVv44KOvPFqzAgMl77/FLkyvmKjjXpoQQfizKKdJhOc58Fa0FLOqOs+2e6U
	xlOTE3V/kKNmpmKJxDG7Yo137y9lVLH6ee4B9SqWy0gEmC6lHZ9Xw==
X-ME-Sender: <xms:2UsQYsLfeRYjHaN7-IeQxRn1y1sBHujx_8Grq4vf8hVdSYpxkHIpKw>
    <xme:2UsQYsKtutt6P3WIQVnTlKkLHD3fO8Xy0WZBdA0bKQx9G--xSXdrR0hFGpWTkfWhF
    HulIdzPen5_HfIG9Q>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrkedugdeflecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
    veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:2ksQYsuf0KhDSsQFcMNHn4eNhNdXqzut10iFewugqexU4HCwQ3Vt4g>
    <xmx:2ksQYpbXa-4Itz5V6PJRW4b8bcuWjfj4QC4WTBGBNb6Jbw2f_hMGRw>
    <xmx:2ksQYjZTJ3Y-aQ3psKtL8I9Qhi9tpzkf3UO8Z38477aAGhBQcN9pTA>
    <xmx:2ksQYt0Wyk-mpc8zp9USCJltRWjx8oMjpv-06uIm5s04K6TP1UIWUw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E6E511920081; Fri, 18 Feb 2022 20:46:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <7fbbfde9-ec68-4797-bf9f-6f034d46c88f@www.fastmail.com>
In-Reply-To: 
 <CAMKF1sojxzU4g7hy3RPgnY99X70KnVnnVLqKFuVeD6rTp8WvxA@mail.gmail.com>
References: <20220218054315.169005-1-andrew@aj.id.au>
 <CAMKF1sojxzU4g7hy3RPgnY99X70KnVnnVLqKFuVeD6rTp8WvxA@mail.gmail.com>
Date: Sat, 19 Feb 2022 12:15:41 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: 
 "Patches and discussions about the oe-core layer"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] rust: Introduce RS_BUILD_ARCH to handle ppc64le
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 01:46:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161957



On Fri, 18 Feb 2022, at 16:43, Khem Raj wrote:
> On Thu, Feb 17, 2022 at 9:43 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> On modern Power systems `uname -m` reports 'ppc64le'. However, Rust's
>> toolchain names the architecture 'powerpc64le'.
>>
>> Introduce RS_BUILD_ARCH to provide an indirection to fix this mismatch.
>>
>> I've tested each of the generated URIs for Power using the output from
>> `bitbake -e rust-native` and could successfully fetch the artifacts.
>>
> thanks
> can you also check if arch_to_rust_target_arch() in
> meta/recipes-devtools/rust/rust-common.inc
> is computing it right for ppc64le case ?

Yep, I'll poke at that.

Andrew

