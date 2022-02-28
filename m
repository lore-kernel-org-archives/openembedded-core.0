Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22B6C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 13:57:52 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web09.20096.1646056671056355471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 05:57:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=CwKkPzBG;
 spf=pass (domain: aj.id.au, ip: 66.111.4.27, mailfrom: andrew@aj.id.au)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 35CC85C0384;
	Mon, 28 Feb 2022 08:57:50 -0500 (EST)
Received: from imap49 ([10.202.2.99])
  by compute3.internal (MEProxy); Mon, 28 Feb 2022 08:57:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=JmdJlqVEe/gOXrbB2Sx0H/UH2y5H5CinDxpPJk
	p9K+w=; b=CwKkPzBGvKqly9ovp8rqfgNLULimbgbQw1nAS16FFSasf8eot8DChX
	azFZoY+UXDQSEEShYPaPIs5rr+ZDnCIu2UJ2bngnbaE1Xn6Ne6Cm6YrhbR3hJOhq
	05TZfeYeu7hF2guvQnUtfeZkipv8xULcAqXFNPrcu6Wo28i6zuHavEQ+09zgqPPI
	tBxgLz3OoEzWq/3+GUlbJk4Bu2/DtUrcEabDxppYF8J5bKxnfNgRn0nt2It7XlCI
	YKBmsfcSLgaIXFdWUoq04YF+F8DILc6bUxOguEHSVYWOynvnXhfIDkUziP+nseXN
	+zse6Mq9uEqYJsVoY0371RaBX1iqDbZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JmdJlqVEe/gOXrbB2
	Sx0H/UH2y5H5CinDxpPJkp9K+w=; b=R1Hg84OwhJXhhjdiAslB8473KvkDY38Z7
	dudfFBba6DID2/g/E47KSYbYfMEB63d1eTn7WlRrnoeL2THXGLnIhJqSKqnbepNm
	qcqWF63YBm8F+XS6J3Nj2SRzwcUmelDAEi76/XK+C6gzwYB902cqgxOSImfHo1gc
	g+e1BkcUwMLKbuOxPn7zbGyQ7kPm73wvRO0M+3FDsID0Rocn2Xo5B6zRdzgA8Zmj
	DJOiGZAXmqiDJ2edj1IrEj8/eqZZB591Nkrwpq0cYBsd1sAzU+8Hgk2jgv+7a2qE
	rxD/g/gm4fZmXXGMgEYedoz4DEebwF1E94QTF3yy3rOjYxWTHrHAg==
X-ME-Sender: <xms:3tQcYhsbaNGVAtdteOlVWb9aiQgjHOY-PcbGdxfZ3glLtl-WiRj5UA>
    <xme:3tQcYqfoh2CI36-kzuoMJRTcpHTSYBr4c-W8BKA1Fo3us-8GL_mtFSqCKLLcObOCD
    bNzNzTva0wTpLj3uw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddttddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepffevhfeifeegfefgtedvgfefgfetteetkedukeelgeduhfdufedvueel
    fefhtdeunecuffhomhgrihhnpehgrghthhgvrhdrhhhofienucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:3tQcYkxxOHgmrM8CeUDQjwKAvid_dqsyff_rDND76CosO2D7vzB5iQ>
    <xmx:3tQcYoPxxYTgKA_kr9R84IZcPdYDfsjFGSnGRpoZkv2U2YrEjZN7DA>
    <xmx:3tQcYh9LS9qjQw630EoVf30PlN805obwzfyfvhAtvPCbYcmICvdqVw>
    <xmx:3tQcYmLp66MpcvEGedqerEX-Ip47uZx0TQiEoppcR-PkifNmhJ4uVA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0CC2CF6007E; Mon, 28 Feb 2022 08:57:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <c87de1ba-dfc6-4162-a146-d50f041a6580@www.fastmail.com>
In-Reply-To: 
 <CANNYZj_21ZYm1vz33FbbmVZ5md-GaQEVpvbrtCNkbh5Ck-0snQ@mail.gmail.com>
References: <20220222035234.463162-1-andrew@aj.id.au>
 <20220222035234.463162-7-andrew@aj.id.au>
 <CANNYZj8uEbibb6POcuhc+fEvViJCXb8_yAC28wMyGSgiAJA35Q@mail.gmail.com>
 <e77a8568-cc54-4706-84a6-718657532662@www.fastmail.com>
 <eed550ec-96ac-4dd4-96e2-ce139db13a5b@www.fastmail.com>
 <CANNYZj_21ZYm1vz33FbbmVZ5md-GaQEVpvbrtCNkbh5Ck-0snQ@mail.gmail.com>
Date: Tue, 01 Mar 2022 00:27:29 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH 6/8] rust: Mitigate duplicate sections on
 matching
 architectures
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 13:57:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162455



On Mon, 28 Feb 2022, at 18:51, Alexander Kanavin wrote:
> On Mon, 28 Feb 2022 at 01:13, Andrew Jeffery <andrew@aj.id.au> wrote:
>> Okay, so the root cause of this was I was setting RUST_{HOST,TARGET}_SYS
>> to "powerpc64le-unknown-linux-gnu", which matched RUST_BUILD_SYS. I did
>> that because rustc seems to be quite unhappy when supplied with
>> `--target ppc64le-linux` or `--target powerpc64le-linux'. I'm trying to
>> understand why, but I'm struggling because rustc seems just fine with
>> `--target x86_64-linux` despite none of `ppc64le-linux`,
>> `powerpc64le-linux` nor `x86_64-linux` appearing in the `rustc --print
>> target-list` output that I could gather.
>>
>> How/why does `--target x86_64-linux` work?
>
> I think in the context of oe-core, all targets are custom ones,
> specified by writing out json files and directing rust to use them. So
> you need to do two things:
> 1. --print target-list is useless and irrelevant, as it only prints
> built-in targets, don't try it.

Ack, certainly experienced that :)

> 2. When there's a problem inspect what json files are in the sysroot,
> what they contain, and whether rust is able to find them.
> x86_64-linux.json is made specifically for building native items.

Thanks, this helped a lot. Before sending the previous mail I had poked 
around a bit and found the json support in rust, but hadn't put enough 
of the puzzle pieces together to make the picture clear. With your 
pointer here I've cut away most of the cruft in the series and am 
testing the rework now.

Andrew

