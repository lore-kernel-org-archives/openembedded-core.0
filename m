Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B64C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 08:16:11 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web12.8548.1661328962084950292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 01:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=bCev8iLz;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 6CF545C003D;
	Wed, 24 Aug 2022 04:16:01 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Wed, 24 Aug 2022 04:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661328961; x=1661415361; bh=BdpQaPpCbq
	8RHTC4gKeYyWn9Gg2eSCqIyKnLKQz1WUI=; b=bCev8iLzovA3O3kbMfHeQVS5RP
	jJeH2pA68+s174wpH2zRkuec3EwROQmTmg0KnJYkbK46zN7Xqrwz94HYpsYY8AKq
	Q4wI9VA216+dcefnWH0+8W08mSAM2MjAMOCSjiFZrLHtXvWRM3+RIGatsNp0NryK
	suIN8kvaOz8b8A9peoqKivHkqKEVcB7RmcOpI7HV/ABC85F5xYwcnDO0H7hEZxQq
	TD7Y0AhU30dMgRQRC5ZLus6p5WZ8z+xEKQPdV5li4XOQEd0MYl8ShenGx/mJXKSj
	fyFrIikLQgIWyH8jDtWK1nIFfFPOdklddvi98HHnnvLWvdRZOhYtphkWjtuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661328961; x=1661415361; bh=BdpQaPpCbq8RHTC4gKeYyWn9Gg2e
	SCqIyKnLKQz1WUI=; b=GTtHFCytPEJ35T/gluoKi2mHm9a3u7ZghpLL7YfUpe1C
	gHpEBBffaEbJT68PZONWgKWr5dxFKV4N/YPCvMLBH6SzmqAoIoazB1JEfVzP4LRl
	VcND700kUZroji+0quNJHYAPT9i5W57xAZJxlH1vbx0+NNxf/lns+iL3b/65VFkL
	aJZSSic5gsJekdyvGmjJc1ojpDGZxbTxPcPnRc4et5zYSxxEsPLtWxVIaRasZLoq
	Ia0uvr3sLsvDkBLZFsBOE7YYLnqLssHsWUV7mrSvcYM/0lqH2loTTOnN1c1/hkBA
	4OtfnY1tBT+hlCqrblVGmot90jFLQmf85a5nd2M1Ww==
X-ME-Sender: <xms:Qd4FY77AeVExp0GvOrBTd4vnXyb7ot0VbiKmKYp4FQOw0P2MOBeRrA>
    <xme:Qd4FYw7hH885jaNhcuLW99ma1dBeD7sUPJZgzZt1T5_zGZJjjb1lN1IgoEr_4pWRW
    Kdos9nQKp_kYcR6P8M>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejuddgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheplefhleejteeuvdeuhfejffeigfduieelgfduueffueethfeg
    geetvdevffffueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:Qd4FYye_DWnMOwQHGFfwGvh0Cq8riKsozFd9mM03PY3rCHeLBK8eoA>
    <xmx:Qd4FY8LZbmM2kME36aUiPeswrfb-QvpzcdoiLMhM-YKrJVR0VaDFMQ>
    <xmx:Qd4FY_LH8iTZCse6cSRSRM5JGnWRNRgh8FdwH_UxryzxF-6xYQ5a8A>
    <xmx:Qd4FY6nnrSgRD_DOWTyrfZUnO_bp8NXZb23sGJhO2cAlfFsMqZqTHw>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 29F5D2340077; Wed, 24 Aug 2022 04:16:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <c18472e4-db71-491a-8f9c-b82245c47800@www.fastmail.com>
In-Reply-To: 
 <CANNYZj-XzOu-zd1aTn7aQ0DyrsiN8J3mOPuG-4wcJw0DzegRww@mail.gmail.com>
References: <20220823235624.2488133-3-andrei@gherzan.com>
 <20220823235624.2488133-6-andrei@gherzan.com>
 <CANNYZj-XzOu-zd1aTn7aQ0DyrsiN8J3mOPuG-4wcJw0DzegRww@mail.gmail.com>
Date: Wed, 24 Aug 2022 09:15:39 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 6/6] shadow: Avoid nss warning/error with musl
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 08:16:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169785

On Wed, 24 Aug 2022, at 08:36, Alexander Kanavin wrote:
> I do not think it is inappropriate, as it does highlight an issue
> which we need to inform upstream about. Can you submit it upstream
> anyway please?

Just to be sure we have the same understanding, could you detail the issue you are seeing?

Andrei

