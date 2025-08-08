Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8A4C87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 05:35:56 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web10.14906.1754631348303836284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 22:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aNFVmPQd;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B3F743869;
	Fri,  8 Aug 2025 05:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754631346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QIh0hqzRqtv7w7abakFiEXwx4RKjzYuMhwxJYvVLqUE=;
	b=aNFVmPQdXhnNQxBGflPRw4SNJxayXviTaWCRo1UHQTpGYHfr9UyQJdNMCpC83/DNZ53N7c
	knhPJoBsvHAbD4AVIFopMo+KFXx+jHqIZKz7c5NLwcN2s4peyxcJBS3TN8Miva8WT+Yrlh
	EWcsK4fmUckvk382HP5kKLZnpBVHQ1KdSVp2ZBjcA85O5TJ0h4YOVWxpFrciJu9fSwwQef
	OgoTU8Jz5ZPu5YsoiKZ6zVrbHD0avyi4ADXbycXbGRsVPFLpKF0rqCxl/UIgtXJ5nPghWQ
	CWhYPLGS2TNSOLvyq1nShtgY6JzsdmWIm+qMY1okP97DXJHTtdgum/q8djJcBQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Aug 2025 07:35:45 +0200
Message-Id: <DBWSWGAOQGS5.PE64V5GSV5RH@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd: Disable linker GCS warning on
 aarch64 when using compiler-rt
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250807024618.1819516-1-raj.khem@gmail.com>
 <CAMKF1srWMnzjMtR8efDKMuM8FXRjNBOqj0-wEMa5ue55nyAXRw@mail.gmail.com>
In-Reply-To: <CAMKF1srWMnzjMtR8efDKMuM8FXRjNBOqj0-wEMa5ue55nyAXRw@mail.gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvddvleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeivdelleehtedtteekheehgefhieevheejhffhveeuveettddutddvudekleekveenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemfegrlehfmeehvgdtheemhegskeefmedvgegtvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemrgeiieemfedukedtmeefrgelfhemhegvtdehmeehsgekfeemvdegtggvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgto
 hhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 05:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221589

On Thu Aug 7, 2025 at 11:32 PM CEST, Khem Raj via lists.openembedded.org wr=
ote:
> I have sent a fix which is a backport from llvm upstream to fix compiler-=
rt
>
> https://lore.kernel.org/openembedded-core/20250807212937.2927262-1-raj.kh=
em@gmail.com/T/#u
>
> Please use that patch, this means that this patch is no longer needed. So=
 please
> drop it from staging branches
>

Thanks Khem, I'm dropping this patch and taking the other one.


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


