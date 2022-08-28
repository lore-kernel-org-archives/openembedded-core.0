Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8D3ECAAA2
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 19:58:51 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web12.62766.1661716724782957257
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 12:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1
 header.b=Zqj/HWcD;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.28, mailfrom: pavel@zhukoff.net)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 22A765C00FE;
	Sun, 28 Aug 2022 15:58:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 28 Aug 2022 15:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1661716724; x=1661803124; bh=Ve
	u4O3OcJXY5LfV1Lp9BaRtDwz1BqBMRuHZGFRmMMLc=; b=Zqj/HWcDRy9t6hphAz
	ZOFRYf9v5HwSxTj3fSvHIdimVZ+ZnoomS2Bd8zYvOmp2BhsjRMmvpsy0lr5wLoCT
	DlFdG33pJumV+jPCehU7uT7nSywBCa4ndhwbKrOL3sSq/Bwn29DjzmjB2+HkH+n/
	2K6BaP6/3eHBFODCF78Qj6MHfX8p4uCo346ELDta9KD1n/zoOUaElUUnpXRiTGwr
	rrbk5gT+eppwz8BjfPRuC5N8+roPPGaLZ6JldvCeY876gYHbRh6yAyhd3iLg24MY
	Ytw8SSuOZBy9u1BOj6EfBuVSbuBRE8In09MEkJCXKmdtBTShvh6moTLmx7w7t24S
	wb9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1661716724; x=1661803124; bh=Veu4O3OcJXY5L
	fV1Lp9BaRtDwz1BqBMRuHZGFRmMMLc=; b=QHYOmrY4/vp4li58YQJ2jUISJs4yJ
	hOtFHUGq0wRGudUo7ZjeNcVI72A6lbtwFhb3p/FZCRt6ZcE0zIuPOU8WUipxGUVr
	d13Rcw1B7fS1JtVCW8xHkT7rkEqo9exhSQxQSwzqUCb3rag/3W/0dCxpL9X92eR4
	Y0FSgRf3TM3bwVRmPD1mf7R9bbe35yHhaLp+uv4lv7AyHKQ+d18SbkmUflne6fZ7
	a+tQd0K7YRKQ48cSxjL3GXVYrRYhdAZhNWeh3GLA6uOWou0dIeLE3J61aq2Nexis
	jZtzsdC3WMJUFAJAiSCruzQ6KyxhMQoyJZoX/KF4EDOPaY4LVRZ5NKnqw==
X-ME-Sender: <xms:88gLY17ev3Qd4IYSIWQ6qdSEE1Un15C9LY95agyiB7h7djoLUkhJwQ>
    <xme:88gLYy4-GOK3F5m1m4EUvSMeKe0m6G9blhfZrC3oNum_jsAzjzgWh5A7dE_9IICdm
    iT3JQxH1Y-02JDrAe0>
X-ME-Received: 
 <xmr:88gLY8cl-Dl8pCVcQ6-XW8_g05uoOtDALAHaRrq67iFe_enBApqI-1E7d8EqbxLtrxzRG2U>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejledgudegjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpehffgfhvfevufffrhgjkfggtgesthdtredttdertdenucfhrhhomheprfgr
    vhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhkohhffhdrnhgvtheqnecuggftrf
    grthhtvghrnhepkedtueegheduueekkeeuveehledvffekueehtdfgtedvteefleelgeek
    geegueegnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhu
    khhofhhfrdhnvght
X-ME-Proxy: <xmx:88gLY-JL8EqvQHYpLFAk-oqXnzWhNqQr7aGMXKQHRdD_F45--H9pKw>
    <xmx:88gLY5IfGfkzb_zCCqXZwoX-ez0Pryu3Br6jcnKE8htYOky8oZN8zw>
    <xmx:88gLY3w5jtk8YsSo5TJd3H_6MIjah1KZgxEc-siC4yUriLiWWW5tKg>
    <xmx:9MgLY3gxHFkYDER_IER4FJllpUb2C4tY6YULY7vKX-LDyDQ3PaI7Yw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 28 Aug 2022 15:58:43 -0400 (EDT)
References: <20220828193845.7141-1-pavel@zhukoff.net>
 <CANNYZj_3EUHMu6LZWRQmuFq0MRxrL_s9cybBR8+D4TVN+xy1fw@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 28.1
From: Pavel Zhukov <pavel@zhukoff.net>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] image.bbclass: Exclude openssh complementary
 packages
Date: Sun, 28 Aug 2022 21:55:53 +0200
Reply-To: pavel@zhukoff.net
In-reply-to: 
 <CANNYZj_3EUHMu6LZWRQmuFq0MRxrL_s9cybBR8+D4TVN+xy1fw@mail.gmail.com>
Message-ID: <87fshg5eey.fsf@gentoo.zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 19:58:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170001


"Alexander Kanavin" <alex.kanavin@gmail.com> writes:

> On Sun, 28 Aug 2022 at 21:39, Pavel Zhukov <pavel@zhukoff.net> wrote:
>
>> +++ b/meta/classes-recipe/image.bbclass
> ...
>> +PACKAGE_EXCLUDE_COMPLEMENTARY:append = "{@ openssh if 'ssh-server-dropbear' in d.getVar('IMAGE_FEATURES')}"
>
> I think core-image.bbclass is a far better location for this?
I tried to choose between this two. Moved back to core-image.

>
> Alex
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169999): https://lists.openembedded.org/g/openembedded-core/message/169999
> Mute This Topic: https://lists.openembedded.org/mt/93313259/6390638
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [pavel@zhukoff.net]
> -=-=-=-=-=-=-=-=-=-=-=-


