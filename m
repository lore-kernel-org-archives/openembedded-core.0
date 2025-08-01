Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CE5C87FD2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 05:24:36 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.80915.1754025872962889555
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 22:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jgyqwmJS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E205438E4;
	Fri,  1 Aug 2025 05:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754025870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bHMmAOypg3iOKnQ3enQJALuBfKIBx7Ps3FyCji2efd4=;
	b=jgyqwmJSI1WWHuXFPVFIVUQ0Nioy6EXNLAf+W3aN25VMGJ+aUZI4/yYVg5S56sikMQ5bRK
	JJCUPyRLP2+edN9cwJCWZIXtjZwoDXCkFTwuUnsLgOctbcCRX1QeW/MWR0MKfmWu8lutEQ
	3eVJBDyqaRIMD6DKxCK+w4AcoZxoZRoWLoZ1GrYM7DuODvDRULaf809rcnCgOopZq0F/Bl
	y+2uVh5uXj323CJgqH1Sh1jgCPgJuA5fNDVEH4rloEcOauDL1vNtAxtLnM91rZZwXZfR0d
	tSQ0Bu6Ig5dFtr9HbKRj2MgysQy5xFjp7bVzhIC7dA2sYMRskTxtbvbglXLhXw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Aug 2025 07:24:26 +0200
Message-Id: <DBQU9YUHOG52.A17EX1I6Y90K@bootlin.com>
Subject: Re: [OE-core] [PATCH] vulkan-validation-layers: fix compile failure
 with DEBUG_BUILD = 1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <hongxu.jia@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <1852AAF23882C10C.14080@lists.openembedded.org>
 <a3408eef-3cf1-4104-9b35-a934e0524892@windriver.com>
In-Reply-To: <a3408eef-3cf1-4104-9b35-a934e0524892@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddvkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffellefgveekfeegheejiedutedukeffkeduvdevvddtgefgffffveefgfdvudenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemugguieemvdegfedtmehfkedujeemkeefvgdtmegujegsrgemkeduledunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeguugeimedvgeeftdemfhekudejmeekfegvtdemugejsggrmeekudeluddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehhohhnghiguhdrjhhirgesvghnghdrfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghor
 hgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 05:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221221

On Fri Aug 1, 2025 at 6:56 AM CEST, hongxu via lists.openembedded.org wrote=
:
> Ping
>
> //Hongxu

Strangely I did not had the original mail. I start to believe my mail
provider is doing some nasty things...

It's in my master-next branch now, thanks.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


