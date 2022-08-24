Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B984C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 08:28:11 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web10.8630.1661329684598752884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 01:28:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=RWvXOlqZ;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id BED1A5C0116;
	Wed, 24 Aug 2022 04:28:03 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Wed, 24 Aug 2022 04:28:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661329683; x=1661416083; bh=wJUGxAEPFD
	RJa8BxVnlU3gYu9AiGmU2T85haVcWj/Zk=; b=RWvXOlqZmU5pT3HYfti6dM/OZp
	4g4o6x4GTrgYJs4MYLjox0TWuTTnspOT+KDl+8HVjN2TemIw+uHTXGygvww2cS1A
	7j2T0YauTEEN+4pvwXN4ocPGZYlRQB3ZHtTdDyFi5XCzw9u0i5DYcL1HwbRjbqiK
	RZBQQWGRu+cstjvL2392v7YivvE/hdiCqlowZOgGMfhfRYmbu6uFnfxdhYOpyphq
	NwFZzgjCH972VLqQiJ+nT7VF8Advx0HoGZ+wVec/JvXeVQ81umyx+d/dgrAtO9uo
	CKvxgpqBJVpn6pAx1T/lundMW6iPWE1yVXfA4qPtiR5OdJrbcX1KAAMReP7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661329683; x=1661416083; bh=wJUGxAEPFDRJa8BxVnlU3gYu9AiG
	mU2T85haVcWj/Zk=; b=3WS2EOXEjsobAMQDzNBoe42xYdspk0AurWIemuENlPD8
	YneFVZjmMsBGJePjcnEHL0pfTSvMh5aPnpluwM8zj52BEwn2sv071tl+MqlEDZlE
	kHOuq0sEBmeBnSrEszXw7iQkQ3T27nEV2VNcx92Tvos3OzOZ05ZBOQicafAX3qmr
	wbyLq2zWI/Wi2wT+dVNCM02I6dK9KUCXCrFue5tD/4gNd85w4hJcOH1N1NFjeBUA
	tA0ctdJCxBkhWlmu1WgeGTXtsq1zUNqFaPDJCtLtrz/LyETRjyIYHy5BZ/IgAcBz
	H4lfNV/9vFtUcuq4RkqiRt4PlJARTjfN2EnoPmM5WQ==
X-ME-Sender: <xms:E-EFY271BtFXCK297L15-Dm24DKIE2Zoj9ojGVw6t_wf5Biudn03UQ>
    <xme:E-EFY_5v1S2D9BStlpv5RGd3efTQFVdU4hUfzVqgKLDNpIl92tLDp2e-s2N4nKYWB
    QyOmCRjxdmG7gwlJM4>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejuddgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheplefhleejteeuvdeuhfejffeigfduieelgfduueffueethfeg
    geetvdevffffueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:E-EFY1c7B8Bk7cdHW49-cEwOYxIXFQxzlal10PDKSjeTiY5nzZlchA>
    <xmx:E-EFYzLae605I00jBQKCLH3QbDJV35qmu7P1dSkKe-S1HzYjtQHt5g>
    <xmx:E-EFY6KXIOLMZus48On18Id0_3YfljVZHAhwJk9DgnamEq0LE2sxwQ>
    <xmx:E-EFY5lkjNrIsOyq7dalNLN6azY99AEFrk-ImS4Bz7a38pn-pyKJOg>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 87D792340077; Wed, 24 Aug 2022 04:28:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <d0b7534b-bbec-43da-9a02-2fbd9fa453f4@www.fastmail.com>
In-Reply-To: 
 <CANNYZj-LRM_fR3zuRQrR4kkhY_TuF5pGPBDePDaLbEWSJaoQQQ@mail.gmail.com>
References: <20220823235624.2488133-3-andrei@gherzan.com>
 <20220823235624.2488133-6-andrei@gherzan.com>
 <CANNYZj-XzOu-zd1aTn7aQ0DyrsiN8J3mOPuG-4wcJw0DzegRww@mail.gmail.com>
 <c18472e4-db71-491a-8f9c-b82245c47800@www.fastmail.com>
 <CANNYZj-LRM_fR3zuRQrR4kkhY_TuF5pGPBDePDaLbEWSJaoQQQ@mail.gmail.com>
Date: Wed, 24 Aug 2022 09:27:43 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 6/6] shadow: Avoid nss warning/error with musl
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 08:28:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169787

On Wed, 24 Aug 2022, at 09:21, Alexander Kanavin wrote:
> The issue is described by you in the commit message? I think this is
> good enough for upstream submission as is, as long as you edit out the
> yocto specific references.

RIght. I was more interested in how you see this issue per se. At the end of the day, it is not a bug, it is more of a warning/log message while the functionality is in place. What would you expect upstream to do?

Of course, there are a couple of options here. Compile macro for musl, change the log format for that specific message, etc. But it can also be treated as a dynamic check with an associated log message.

Andrei

