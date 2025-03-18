Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14984C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 13:13:05 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.11392.1742303581801404115
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 06:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OUniZVrQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CEF743291;
	Tue, 18 Mar 2025 13:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742303579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgNB34+kKvw3yjg027AfXrjf+BpC+tzPA3s96r3Lq6Y=;
	b=OUniZVrQbtc/4xkyFl3S5Il+ULSvLLQcHBmqadYdla6K0ZFLjp6gS+KssqEBNFsDHMYfb0
	0OcF94FYC1zcWDBCJOg/r+hguuIkysC5KLjdmMd6RMHh9e4WxgY4NLkrWdMIFtI/r9iZGE
	8vg5WRcXTcusZOkxUeDBnHSCWJ+WkVj5ohzSLwA6G8XY3G6veT5uuYJebrawKQP37M62FK
	OiuilNNGfgBCDxpdPS1+P8BLW+J9T02JXxISYgz3aaENfNj3jY0ezNruEIaVDUCIoZb6Yn
	fobBa7LyxlydJpeHk5df5BXMAcWvo39RhFswSqzWA+BXUn5FT/UWQS7yiqo4+g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Mar 2025 14:12:59 +0100
Message-Id: <D8JF2MJGLSWW.AS5SZX5T0EB@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 22/24] time: Fix build with GCC 15
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250318043846.2422141-1-raj.khem@gmail.com>
 <20250318043846.2422141-22-raj.khem@gmail.com>
In-Reply-To: <20250318043846.2422141-22-raj.khem@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffvuffhofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeettdejvdefudegueejjeehkeejueetudejvddvgeelgeegkeeigeduvdejtdfggeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghms
 ggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 13:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213210

On Tue Mar 18, 2025 at 5:38 AM CET, Khem Raj via lists.openembedded.org wro=
te:
> Initialize interrupt_signal and quit_signal with correct type
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

Thanks for your patch.

It looks like this is breaking the build, maybe just for musl:

ERROR: time-1.9-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/mu=
sl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/time/1.9/temp/run.=
do_compile.3718025' failed with exit code 1
...
| ../time-1.9/src/time.c:731:3: error: unknown type name '__sighandler_t'; =
did you mean 'sighandler_t'?

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/1215

Can you have a look at this build failure please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


