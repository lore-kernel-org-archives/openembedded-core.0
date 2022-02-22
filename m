Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED00C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 23:49:33 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web08.1046.1645573772849499057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 15:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=ReG9IKre;
 spf=pass (domain: aj.id.au, ip: 64.147.123.19, mailfrom: andrew@aj.id.au)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 7CE5B3201FB7;
	Tue, 22 Feb 2022 18:49:29 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Tue, 22 Feb 2022 18:49:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=ZTg9Wz6yDPS52y3KykH9Z25B4/2D1mZhE4ltNv
	LdYag=; b=ReG9IKretSk6/tE8BRgf+AQRTp5TKghOKuiKiKVuwSHD+lNm4jhjFM
	Lw8WV5b2DhX464RYIkQnVs9VfzS0PhhE9jYrrqSiKtxW8rlJOJ9EFYJJQSGp8UJX
	/7lNAYwTT+JBMPbNilVamMkcbbHhHbLAJVBEearayMB/eMUol/7qYtFviYk0PZPv
	jetCCV3OG/x7YkgdZSkZVPoxUQMOjep33MC8qnx2PmTENErXPvhMdLv72VHnK5he
	xEOW9DVtVZYy26VDjV/rHbT7CLtDeF4nqiDVQWglTkEeUnxlVO6Ghsw856rUyxk8
	SbJk91bdnQQmo01JgGUoTlQ8isTSuvNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ZTg9Wz6yDPS52y3Ky
	kH9Z25B4/2D1mZhE4ltNvLdYag=; b=MO2F5KChfZNYmSB+RBoGiberKNMpEAfTT
	CeVUeWM2c/PRXVviJxdIpzPAtr8tSyoX7fvKORojKPIA3TqNg7Hu9g2OcuUbnSGY
	GFP+0EKCuK4X/JWZh7Zm5QNd7lktW8b1lVZds5keu2C4ZSe0HsW4kW1DwsaQe3VJ
	RJmWISkFMEZblsVE7WTysYzu5eELAddSlYFsfn0F6iI4EQK+tDwulb3DPpvp51eA
	PcD1ogcdv6PfTju8Ae5lElzLrrv3MoN9iL6et+0P7IaqndnvoY6SzqrhdK45Zdq1
	5G7utlDrp0vqog3LrDRqNrJP7Ix3oB243/JgiX5waZmGfYq2izHgw==
X-ME-Sender: <xms:iHYVYnaGJFqXv-KTNHP1rIjhw75Xpvns-uKben1Xn4QemX1tto6EkA>
    <xme:iHYVYmZgGcNFp7eegdhcFeJy7dbXIl249n0vnxt_YDChZvV4BwMRGkp_1_rNFNS8Y
    14f0vyV5TD1rHBlOA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrkeelgddufecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
    veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:iHYVYp8H0icZfNYr4cEdyQebYavnkN_ohJbyo7CbLvv7kUJYyAz_1w>
    <xmx:iHYVYtqEvdRnrBVwJP4Hyi2KtaDmMP-H32sUVv9jYI4ZJl1kzZW_lw>
    <xmx:iHYVYioxSZttRsrrIs4D74qaAC0jhZKiihfaB7expqfLTV7R0HvyKA>
    <xmx:iXYVYpTZFphMi6iRo29G4QQXGXksrZ8Ys3w-xEZSNxZEIdo8uIPvTw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BEE911920081; Tue, 22 Feb 2022 18:49:28 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <41b02f27-15e6-4250-83f9-a595fe26b84c@www.fastmail.com>
In-Reply-To: 
 <48dc371d839b004db347823b5867f4c338e94443.camel@linuxfoundation.org>
References: <20220222035234.463162-1-andrew@aj.id.au>
 <20220222035234.463162-8-andrew@aj.id.au>
 <CANNYZj_3sRMqa-F_GvR2fCi2vNtafyNOvyHB_WhS99EhpoVK_w@mail.gmail.com>
 <48dc371d839b004db347823b5867f4c338e94443.camel@linuxfoundation.org>
Date: Wed, 23 Feb 2022 10:19:08 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH 7/8] rust: Add snapshot checksums for
 powerpc64le
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 23:49:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162232



On Tue, 22 Feb 2022, at 22:58, Richard Purdie wrote:
> On Tue, 2022-02-22 at 10:59 +0100, Alexander Kanavin wrote:
>> I have to note that YP does not support ppc systems as build hosts;
>> can this be kept in a bbappend?
>
> It isn't official but there are obviously people using it. I think we should try
> and do something in core but there is a question of how we maintain this given
> our infrastructure/tests don't cover it :(

That's fair. Is it acceptable that it's tested by proxy in OpenBMC if 
we can't work out anything else for YP CI? I don't expect anyone 
maintaining the rust support to test ppc64le explicitly if they don't 
have access. I'd be happy if the ppc64le checksums were just updated 
along with the rest whenever the snapshots are bumped.

Andrew

