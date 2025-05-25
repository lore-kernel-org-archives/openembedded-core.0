Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F47C54E90
	for <webhook@archiver.kernel.org>; Sun, 25 May 2025 15:41:45 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.11436.1748187695158725644
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 May 2025 08:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c78g6h+7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BEE61FCEF;
	Sun, 25 May 2025 15:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748187692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I1JjiGwFOKNpaA/Y2AWR29duTjsYYIprV9KWFEcyu5M=;
	b=c78g6h+7t+zZfY2b0J0E6rQNU6wVVZEFNqjy/seKlp3HcV8lgyIQN6wCeSZwRUIL/IoVSj
	OZMQUtkNTUGks6u2r4TFhCxipGB/Fsn8WScxleKClMzZDsrZNoflwOPcetzG4ZQkG4VA9f
	I0OEO0xhTU2cHDoJV73ef6s3KVuo2i1oog0pgUo+b9UQS4wWdrQScbQxBEB2y30+NmeDJq
	+3WhrTI+/9l/Va35Zs9Ne9h6tbiCPOL5lU/cvkz0/tw6TqXa8vOHcfTo3G+WPX487goH7b
	QNyGQqFL2nhgEphMw1exxXARx5egjT2DtG0ZHm5YbrTvtXRA/Ql+MlY88bLu0Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 May 2025 17:41:29 +0200
Message-Id: <DA5CTDEBC874.1EIJ5IZLFGK1Q@bootlin.com>
Subject: Re: [OE-core] [PATCH] kernel-fitImage: allow overwrite the
 configuration dtb label
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Oliver.Rohe@wago.com>, "Freihofer, Adrian"
 <adrian.freihofer@siemens.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <DB4PR08MB8102C882795C5B8725105A0F9E93A@DB4PR08MB8102.eurprd08.prod.outlook.com> <f5080c649ce5d0f214dfdbb69a25449923b2948b.camel@siemens.com> <DB4PR08MB81021F9904E04AC45A79E58C9E9FA@DB4PR08MB8102.eurprd08.prod.outlook.com>
In-Reply-To: <DB4PR08MB81021F9904E04AC45A79E58C9E9FA@DB4PR08MB8102.eurprd08.prod.outlook.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddugeelleculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvvddtleeikeetkedvuefgheeugffhleejgeduvdelheeileevhfeghfehueekgeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhurhhluggvfhgvnhhsvgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemvdejsgdvmegtrgehmeehkegrtdemtgdukegtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemvdejsgdvmegtrgehmeehkegrtdemtgdukegtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepqfhlihhvvghrrdfto
 hhhvgesfigrghhordgtohhmpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 15:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217247

On Tue May 20, 2025 at 10:51 AM CEST, Oliver ROHE via lists.openembedded.or=
g wrote:
> Hi Adrian,
>
> +AD4- There is also a patch-set pending which does a complete rewrite of =
this
> +AD4- code in Python:
> +AD4- https://urldefense.com/v3/+AF8AXw-https://lists.openembedded.org/g/
> +AD4- openembedded-core/message/216836+AF8AXwA7ACEAIQ-B6Ltl4Q+ACE-
> +AD4- sx1j+AF8-QU1O83+AF8-wMeOlorBivh3C9HD06dwOTkdj+AF8-Mvw5g0JkiLC3BEVzu=
C8rMFPlyIDdqYv5r1ln2lPqCb7AhxUktc8So-+ACQ- +ADw-https://urldefense.com/v3/+=
AF8AXw-https://lists.openembedded.org/g/openembedded-core/message/216836+AF=
8AXwA7ACEAIQ-B6Ltl4Q+ACE-sx1j+AF8-QU1O83+AF8-wMeOlorBivh3C9HD06dwOTkdj+AF8-=
Mvw5g0JkiLC3BEVzuC8rMFPlyIDdqYv5r1ln2lPqCb7AhxUktc8So-+ACQAPg-. I
> +AD4- guess your change will potentially be simpler if it will would done=
 in
> +AD4- Python later on. What do you think?
>
> Cool, looks very promising. Especially that the fitimage now builds from =
the image recipe.
> I will check and try it out once I have a spare minute.
>

Hi Oliver,

Just a quick update: Adrian series on "FIT image improvements" is most
likely going to be merged soon: can you rewrite your patch on top of it?

Thanks!

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


