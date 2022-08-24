Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7C4C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 08:49:51 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web10.8741.1661330988643701181
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 01:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=ll7SoLa5;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 79BBF5C0152;
	Wed, 24 Aug 2022 04:49:47 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Wed, 24 Aug 2022 04:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661330987; x=1661417387; bh=+AvoU280S1
	6+SvLLGl3YuxtZGvAy4vKDPr/Osqc+AXY=; b=ll7SoLa528S1gqLyZpBFf5LNmG
	anEG5DS1XKbd/UrdNpqABMxB8QYPiiQSJL4q8cossKfYopt8z7pO3ODcEkM0aBQy
	atePQ9LAoLkSSduzdyELRtqaQeDL65P9nLzmr6kbvrlvncmeAApyTSXRDRAumYiK
	IavpWRGqdziQi680pnonplpEwEZyCBUSr/2clrx1CoUf/R7rc/8XgqNkdcOt/xqP
	4vFpXEBrIw35/2UalU4wpfEhls2uJfJro6V6X4GstivVwMHBc67hQMb9fOM02BJY
	lkJ7wjCLigs99jXpzV4nHNOT66fwHaMaMdpzXvGko/O3TbnDa3oGlTvBMYzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661330987; x=1661417387; bh=+AvoU280S16+SvLLGl3YuxtZGvAy
	4vKDPr/Osqc+AXY=; b=akzx4UzDe12KsxdiT8nI/LssLvKJwMEbVEB2x8bUQl6o
	zJEAsz3bDShad71AXZ+zXkyfE2d1ASkImHnXAjCMDN505Gaa+mc0uyjGC8Ly9tP9
	LJKIUG3K5ykoH/IEQ6L/LiO1oKIGPnBifYWrE25XpD5swaUHzzimtVwhAR7KEySH
	y/12KMeRss2jmQSzq+4GRsuGauaRsc6dGR4kdMn8lcHKqSDcNpHAcaOVeUJK2VgN
	j3CojQozDSTWCCa/TCEwok1O7IE4rELjwUVTmu9xOXhUNFI8T0dRC8JjdglZNCuV
	q4EvxJZgLpgdKHS8XMr0T/dbgVwt1jQ0iVoHRuOMuQ==
X-ME-Sender: <xms:K-YFYzyb_4uWea8x0nZzS6uuALBsmCHuvpCfiENQ2cjrVDFeGHtCvQ>
    <xme:K-YFY7Qck6xkbnpT8JSvckyWgYznHq-g-AMVTddk9LUN2BWSP0ZyhceFScTP0-WkF
    epy_ko5sJG4iRQRXNM>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejuddgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheptdehvedvuedtkeeifeehhedtveehtdejjedvhffgfeefhfef
    feefledtteekieetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghr
    iigrnhdrtghomh
X-ME-Proxy: <xmx:K-YFY9VIvSvdCi2c-9YJE835VRozs8j-EVjRX6xQBlDauTn6g4ydzQ>
    <xmx:K-YFY9jMRs6jbHtAPUozXB2yDSjB1xpL8uLaRgoxXkX4K2hEkXYAlw>
    <xmx:K-YFY1AMk9PXhC2BX89jJpzaXmbZ1sTnGOv_J3HTIrNMzAYHt72VJQ>
    <xmx:K-YFYw-ykv8qX02B47fdngpGR-obUnVv41_v6GsWe7q2X1vYOGIY4w>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4921E2340077; Wed, 24 Aug 2022 04:49:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <d90ffe02-9459-414b-9c9c-758bfdf6355a@www.fastmail.com>
In-Reply-To: 
 <CANNYZj8+qFQzobfqrow-LmbJ+Q8e249dTpz-xa1Rx4JN8OvSiA@mail.gmail.com>
References: <20220823235624.2488133-3-andrei@gherzan.com>
 <20220823235624.2488133-6-andrei@gherzan.com>
 <CANNYZj-XzOu-zd1aTn7aQ0DyrsiN8J3mOPuG-4wcJw0DzegRww@mail.gmail.com>
 <c18472e4-db71-491a-8f9c-b82245c47800@www.fastmail.com>
 <CANNYZj-LRM_fR3zuRQrR4kkhY_TuF5pGPBDePDaLbEWSJaoQQQ@mail.gmail.com>
 <d0b7534b-bbec-43da-9a02-2fbd9fa453f4@www.fastmail.com>
 <CANNYZj8+qFQzobfqrow-LmbJ+Q8e249dTpz-xa1Rx4JN8OvSiA@mail.gmail.com>
Date: Wed, 24 Aug 2022 09:49:27 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 6/6] shadow: Avoid nss warning/error with musl
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 08:49:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169794

On Wed, 24 Aug 2022, at 09:30, Alexander Kanavin wrote:
> I trust the upstream will figure this out. My goal is to avoid adding
> more patches that are declared unsuitable for upstream, and so have to
> be rebased until the end of time by (usually) me.

OK. I have created an upstream issue: https://github.com/shadow-maint/shadow/issues/557.

Andrei

