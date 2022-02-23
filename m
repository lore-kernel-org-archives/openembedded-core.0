Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18724C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 00:27:53 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web08.1447.1645576072348310077
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 16:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=PmFhWCdy;
 spf=pass (domain: aj.id.au, ip: 66.111.4.28, mailfrom: andrew@aj.id.au)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 780EC5C012A;
	Tue, 22 Feb 2022 19:27:51 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Tue, 22 Feb 2022 19:27:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=tOK6f3DWIfZJ+JOh0dPeg4cGiKyjw8hj5556B1
	rkmtA=; b=PmFhWCdy5H9sOWbtgePx6i66Ma4i6/sIKatginSYFDYNzQNW6GUT4i
	+Gbgq48TbFzNrQP3YZa7Aq+/58zxlhango1KEAdbsHao17rIdD5n9DS4W5iw8NqJ
	r07z7QWTzQzkiVs/ORxEHlEnCyCpwRrmAUC7RJIKMvc/1WQPtfImKu9kCKEu/fqS
	AgpoaTj2auvOJF6Ev4pWoz31d1g1blb74rf7rY+owFK6dGt14KjPy34HEsZ/KJ0Q
	FRNcg5+cpKdxKc5Go/jtva33F7vvnOuy5riWalllmPNld8utqNV1r1GvjAtTT+jh
	IM7RANT+Mg1SjFIJ2tn4skKoDcYyKiVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tOK6f3DWIfZJ+JOh0
	dPeg4cGiKyjw8hj5556B1rkmtA=; b=StCn58UEeyLyjs1BhgLFAleske7bt49Uw
	ct71oqjax8ch8vd6wpk3H8GlrL2wuyo5tash6FT93OKaaX+py6ywWFZExjKsS6Gu
	wHNY4ZT9ynEj9fHkLr0uLAZi338uw7KrebMxTaqUtFHRd262uRPcWypVF2DNjWQp
	/X/2p3FQDogFTNfQQJ1isHty3t29sO+NWwrNZ6D93Z++tg342xLBfQyuIVbLPHuZ
	eHLt1Mgf/oHMPMdoFv1niVsNwuGYUNEzv1ICLE2miQ/bMKY5Lh8Lft7NaDB9EJc+
	ywcZzb0o5xzb3sieVJfdiOW1b70YTcHEDI5xrRYDRJPEUPVM2HFxg==
X-ME-Sender: <xms:h38VYtPbsISc1Rg2RNPiP18P5uiyVZ6AmjJ6sO8Mb-YLAkkzxfrNzA>
    <xme:h38VYv9GR00r0xgqIrz7MMk5my1tznhrQk_HJy9vEqnzHFNCxiukdzXS_dxuVPWr-
    mem_tNy8vQhM6orOg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrkeelgddvtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeduffdtvdevkeffgfetffffueevgeejleeghfffjedthedthfelgfekfefh
    feekieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:h38VYsSsln28ePJ49m-YMkSv5MnrvM-nHyg3HX4qY3nU84-fZvnKSg>
    <xmx:h38VYpsT81n08pECbl7dyVFg2ZNa78rrZp_lwUOVXtmE3wxJ6zEu3Q>
    <xmx:h38VYldfRGmODhi8n1icQsjhep_mlxnZGWFzWCnoCK3ssCFaeBHaVA>
    <xmx:h38VYlkeW6Klaf37q2i4naHRvZ3g1xApNXRp0GnsaBOnCmd7popRrA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2C2BC1920081; Tue, 22 Feb 2022 19:27:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <dab378ba-9d56-4577-87da-fe8152d66a68@www.fastmail.com>
In-Reply-To: 
 <d9c4d14acb3e5ce1436d8b0f8992217cd3034511.camel@linuxfoundation.org>
References: <20220222035234.463162-1-andrew@aj.id.au>
 <20220222035234.463162-8-andrew@aj.id.au>
 <CANNYZj_3sRMqa-F_GvR2fCi2vNtafyNOvyHB_WhS99EhpoVK_w@mail.gmail.com>
 <48dc371d839b004db347823b5867f4c338e94443.camel@linuxfoundation.org>
 <41b02f27-15e6-4250-83f9-a595fe26b84c@www.fastmail.com>
 <d9c4d14acb3e5ce1436d8b0f8992217cd3034511.camel@linuxfoundation.org>
Date: Wed, 23 Feb 2022 10:57:13 +1030
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
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 00:27:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162235



On Wed, 23 Feb 2022, at 10:33, Richard Purdie wrote:
> On Wed, 2022-02-23 at 10:19 +1030, Andrew Jeffery wrote:
>> 
>> On Tue, 22 Feb 2022, at 22:58, Richard Purdie wrote:
>> > On Tue, 2022-02-22 at 10:59 +0100, Alexander Kanavin wrote:
>> > > I have to note that YP does not support ppc systems as build hosts;
>> > > can this be kept in a bbappend?
>> > 
>> > It isn't official but there are obviously people using it. I think we should try
>> > and do something in core but there is a question of how we maintain this given
>> > our infrastructure/tests don't cover it :(
>> 
>> That's fair. Is it acceptable that it's tested by proxy in OpenBMC if 
>> we can't work out anything else for YP CI? I don't expect anyone 
>> maintaining the rust support to test ppc64le explicitly if they don't 
>> have access. I'd be happy if the ppc64le checksums were just updated 
>> along with the rest whenever the snapshots are bumped.
>
> The challenge is we have no tooling or support for "bumping" those values. 

Yeah, that's familiar, when I sent the initial patch fixing the URLs I 
hacked some stuff to force the BUILD_ARCH value to ppc64le on my x86-64 
laptop. That's not a scalable approach.

Not having the tooling seems reasonable, as having it does kinda 
suggest you'll try to maintain things you can't test. Even though I'm 
trying to argue for that, again, it's not scalable and I understand the 
push-back :)

> We
> spot issues with the other two build architectures since the autobuilder tests
> them.
>
> There are probably some tricks we could play to handle this. The challenge is
> then that someone needs to take the time to write something to handle this and
> communicate it to the maintainers so they know to use it. We're struggling to do
> all the things like this we'd like to and that leads back to Alex's concern.

I understand.

I have pointed Alex at some resources to access ppc64le systems:

https://lore.kernel.org/openembedded-core/ee6810ac-3c22-45b0-ac49-e35b38e0f69c@www.fastmail.com/

But if that's too much fuss then we can maintain the checksums in a 
bbappend in OpenBMC like has been suggested.

Andrew

