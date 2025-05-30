Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E543C5B549
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 07:33:34 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.1470.1748590413534654472
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 00:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IKMZaSu6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 168AF43A67;
	Fri, 30 May 2025 07:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748590411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMHBeQ5sOdnTQhH24tY1UDIH+vVlwfSGYb98/5PZP+A=;
	b=IKMZaSu6N98YPYmVhOle4WYMIVbWG48PUDSzR0J+QMvoqTYyO3VCnWS5uOndUcEXILfaXn
	bDpybsBrCqt+VINzQia+ahvgucxEpbJsdAay/r6O2RbxIJAbfjBq2bxzXARM75Hw+siSpd
	58WDXqN+HeyvuWZkkmlI1ciOg/E1U3RAWyzwCHJpDDuG5l2o3P1rlT4L77N1Sx7vVOWyZs
	E9H8kmqcHCTqrWmS3r+Oky4ql8u/g6rLhIxioDnrNzvcivgoKeLZtFfRBY2UEQykLFwhBU
	7y7Xso3HvA7YvT1LJje00IWUUW01z7EayHSSQZRVdJsNf83XUj1ZwkYyM5bp8Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 09:33:30 +0200
Message-Id: <DA9BKH4FCTKE.2X2J3NKJ26T4R@bootlin.com>
Subject: Re: [OE-core] [PATCH] clang: multilib-header fix for
 llvm/Config/llvm-config.h and clang/Config/config.h
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <liuyd.fnst@fujitsu.com>, "Khem Raj" <raj.khem@gmail.com>,
 "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250521031413.1566-1-liuyd.fnst@fujitsu.com>
 <CANNYZj9kMw3iqYi-tpWY19TbCTKjNHO2HDc=dXpu26efHDGbRQ@mail.gmail.com>
 <OSRPR01MB11597AA06EC57367CB529CBD19B98A@OSRPR01MB11597.jpnprd01.prod.outlook.com> <08f939dc-0880-4a2f-80af-6e8d512bf8b9@gmail.com> <OSRPR01MB1159756B512144F28ECCE295C9B61A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
In-Reply-To: <OSRPR01MB1159756B512144F28ECCE295C9B61A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvkeegvdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjedtueejhfffieetgedtkeduteetkeejteegiedvueffheethfekudeileffkeeknecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheplhhiuhihugdrfhhnshhtsehfuhhjihhtshhur
 dgtohhmpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217486

On Fri May 30, 2025 at 4:58 AM CEST, Yiding Liu (Fujitsu) via lists.openemb=
edded.org wrote:
>
> Hi Raj
>
> I noticed this patch still hasn't been tested by the master-next branch. =
Should we consider testing it now?
> Or is there anything else I can do?
>
>
> Yiding
>

Sorry, I ignored it at first as Alexander had some questions, and then
missed the end of the discussion.

I'm adding it to the queue.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


