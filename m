Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21213C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 11:23:20 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web11.71366.1705922596954556571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 03:23:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm3 header.b=ROxcSj1m;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Dm0Zlm4R;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.24, mailfrom: pavel@zhukoff.net)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id CC7BE320046F;
	Mon, 22 Jan 2024 06:23:13 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Mon, 22 Jan 2024 06:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1705922593; x=1706008993; bh=wo8sYzSH3i
	87hSQsBJsSEWQIWe13at14a73A7uGrNUk=; b=ROxcSj1midlHjcFFNR8V9ou6lk
	EHwGzYA1HQOUiV+jHFQIMhYbQG6ThClrWY7VjE/77fzEEfSnZnXaIWbSaGgp1JWe
	APDJDWBB3JnzdYNSQr5dXghsnN0hGO3k/+7oWS0lG8u47F04eDEiLVYoYYSLVm+L
	N1AhgmykF1L1R+eD4NB2r8XyKuB/Gz9bUuNXE96NqDRU0lFi9oSqHuu7/2dsypH+
	HNc3I9LkHY56iW1k911ve6yiAftnYyNKJjd3w5GKsEStlsSmZCArAYpATLZj0qaE
	FkzeO1cpL9DkyQUxclZtHmqG2v8hhzwKz9UGxos+1SlUY/Rvh5k7EosY435w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1705922593; x=1706008993; bh=wo8sYzSH3i87hSQsBJsSEWQIWe13
	at14a73A7uGrNUk=; b=Dm0Zlm4R2VUGVYt3l+swJJyGLJRLH1YJxC3iy3YY1icq
	EkFCOmMPSQj0W7TeRoDQ8rCzPrx3oEGOuXsdDwa92BbMGCwuDlcKgcLj4FsNMJj2
	xIU7mz+LVG16Lha/B+9bXBU31QZiHnR3+9aNw+iRTnRyV6xuZ2xGUikvtWyPwinB
	Jl36hBO4qAaVCex4XoR+2DeoSGqD1KnMmQr2HR7zPMw/LmkpD/hWKY4PR3YRklVP
	ahAnR5VmfRJ4YHLwnV5/NXVQT83687Il9ADaaWSLV1LGHycmjlIFoFy/Zo77Jlug
	0gV8SW2xrKlhd//VUT56X2G72VY2uIfHxDwbT0gUEQ==
X-ME-Sender: <xms:IVCuZW1vYymMlUGucktE4EUeb2-0HHLfopODL39x5h4LvmMILZ6Quw>
    <xme:IVCuZZF75HuL4iPG-DUEE3EHHYLgTFzaTPv4gxk0NrNR2WOGlWZpVxjk3hetqVDVW
    dtb2i4g4wuyD-1iKKk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekiedgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsegrtderreerredtnecuhfhrohhmpedfrfgr
    vhgvlhcukghhuhhkohhvfdcuoehprghvvghlseiihhhukhhofhhfrdhnvghtqeenucggtf
    frrghtthgvrhhnpeethfefieffjedvkeeijeeuiedvteduledvheeuteduhfekudegvedv
    leejudeiheenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrvhgvlhesiihh
    uhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:IVCuZe46WaZ9NH4_8BDEl04CxLp6JEHVUmBR4gL4unCpfgngXbZyBA>
    <xmx:IVCuZX1XO_t5cAmtexttrEWX0xcVz6hmbn_k7kEXgA9SQBj3L-y0OQ>
    <xmx:IVCuZZFSXpIuZXoyiNBJ8RP1Lepy05yhVQFgzoM6W90cGqsCpkQoaQ>
    <xmx:IVCuZcOHzVv5paNvpzGhtaVwumUQMXEJ6uNhyJLojlUyxeL6fLJBzw>
Feedback-ID: ib94946c9:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 01D1CB6008D; Mon, 22 Jan 2024 06:23:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1374-gc37f3abe3d-fm-20240102.001-gc37f3abe
MIME-Version: 1.0
Message-Id: <e39baf9d-ad60-4c98-a5c7-fa68c15a5902@app.fastmail.com>
In-Reply-To: 
 <6b44d037440ecc31572f8656e2098729b2bd3d24.camel@linuxfoundation.org>
References: <20240122085443.637472-2-pavel@zhukoff.net>
 <CANNYZj9a+pvXVcCf9-6qPzVF9gcNccOwqno7ducFYajXFauyfQ@mail.gmail.com>
 <6b44d037440ecc31572f8656e2098729b2bd3d24.camel@linuxfoundation.org>
Date: Mon, 22 Jan 2024 12:22:55 +0100
From: "Pavel Zhukov" <pavel@zhukoff.net>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] mdamd: Switch to git recipe
Content-Type: multipart/alternative;
 boundary=a1fc303d9759492ba30723b673cb2d51
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 11:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194144

--a1fc303d9759492ba30723b673cb2d51
Content-Type: text/plain

Upstream project has got new maintainer last month. I'm contacting him to see what's the plan is. 
They were doing release every 2-3 years before and 4.2 has been released in 2021 (Dec 30th :) ) so not so long time ago.  

-- 
Pavel

On Mon, Jan 22, 2024, at 12:09, Richard Purdie wrote:
> On Mon, 2024-01-22 at 11:17 +0100, Alexander Kanavin wrote:
> > On Mon, 22 Jan 2024 at 09:55, Pavel Zhukov <pavel@zhukoff.net> wrote:
> > > 
> > > mdadm latest official release was long time while development is
> > > ongoing. This caused growing number of downstream patches in the layer.
> > > Switch to git recipe and cleanup patches.
> > 
> > Wait.
> > 
> > Did you engage with upstream to find out if/when they're making a new
> > release? Switching to a random commit in the middle of a development
> > cycle needs to be carefully considered, and preferably, confirmed with
> > upstream. Even if the last release was a long time ago, and
> > maintenance burden with custom patches is growing.
> 
> We did discuss this one a little on the tech call or bug triage. mdadm
> is proving to be a pain, the tests are broken and we have a growing set
> of patches.
> 
> It seems upstream are happy working in git and weren't going to make
> official releases, I'm not sure where I head that though. 
> 
> Whilst I generally prefer releases, moving over to git does seem like
> the right thing to do in this case.
> 
> Cheers,
> 
> Richard
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194143): https://lists.openembedded.org/g/openembedded-core/message/194143
> Mute This Topic: https://lists.openembedded.org/mt/103882790/6390638
> Group Owner: openembedded-core+owner@lists.openembedded.org <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [pavel@zhukoff.net]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

--a1fc303d9759492ba30723b673cb2d51
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>Upstream projec=
t has got new maintainer last month. I'm contacting him to see what's th=
e plan is. <br></div><div>They were doing release every 2-3 years before=
 and 4.2 has been released in 2021 (Dec 30th :) ) so not so long time ag=
o.&nbsp;&nbsp;<br></div><div><br></div><div>--&nbsp;<br></div><div>Pavel=
</div><div><br></div><div>On Mon, Jan 22, 2024, at 12:09, Richard Purdie=
 wrote:<br></div><blockquote type=3D"cite" id=3D"qt" style=3D""><div>On =
Mon, 2024-01-22 at 11:17 +0100, Alexander Kanavin wrote:<br></div><div>&=
gt; On Mon, 22 Jan 2024 at 09:55, Pavel Zhukov &lt;<a href=3D"mailto:pav=
el@zhukoff.net">pavel@zhukoff.net</a>&gt; wrote:<br></div><div>&gt; &gt;=
&nbsp;<br></div><div>&gt; &gt; mdadm latest official release was long ti=
me while development is<br></div><div>&gt; &gt; ongoing. This caused gro=
wing number of downstream patches in the layer.<br></div><div>&gt; &gt; =
Switch to git recipe and cleanup patches.<br></div><div>&gt;&nbsp;<br></=
div><div>&gt; Wait.<br></div><div>&gt;&nbsp;<br></div><div>&gt; Did you =
engage with upstream to find out if/when they're making a new<br></div><=
div>&gt; release? Switching to a random commit in the middle of a develo=
pment<br></div><div>&gt; cycle needs to be carefully considered, and pre=
ferably, confirmed with<br></div><div>&gt; upstream. Even if the last re=
lease was a long time ago, and<br></div><div>&gt; maintenance burden wit=
h custom patches is growing.<br></div><div><br></div><div>We did discuss=
 this one a little on the tech call or bug triage. mdadm<br></div><div>i=
s proving to be a pain, the tests are broken and we have a growing set<b=
r></div><div>of patches.<br></div><div><br></div><div>It seems upstream =
are happy working in git and weren't going to make<br></div><div>officia=
l releases, I'm not sure where I head that though.&nbsp;<br></div><div><=
br></div><div>Whilst I generally prefer releases, moving over to git doe=
s seem like<br></div><div>the right thing to do in this case.<br></div><=
div><br></div><div>Cheers,<br></div><div><br></div><div>Richard<br></div=
><div><br></div><div><br></div><div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-<br></div><div>Links: You receive all messages sent to this gro=
up.<br></div><div>View/Reply Online (#194143):&nbsp;<a href=3D"https://l=
ists.openembedded.org/g/openembedded-core/message/194143">https://lists.=
openembedded.org/g/openembedded-core/message/194143</a><br></div><div>Mu=
te This Topic:&nbsp;<a href=3D"https://lists.openembedded.org/mt/1038827=
90/6390638">https://lists.openembedded.org/mt/103882790/6390638</a><br><=
/div><div>Group Owner:&nbsp;<a href=3D"mailto:openembedded-core%2Bowner@=
lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</=
a><br></div><div>Unsubscribe:&nbsp;<a href=3D"https://lists.openembedded=
.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openemb=
edded-core/unsub</a> [<a href=3D"mailto:pavel@zhukoff.net">pavel@zhukoff=
.net</a>]<br></div><div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br=
></div><div><br></div><div><br></div></blockquote><div><br></div></body>=
</html>
--a1fc303d9759492ba30723b673cb2d51--

