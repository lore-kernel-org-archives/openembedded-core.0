Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116BDC54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 06:56:20 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.23729.1748242578513151925
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 May 2025 23:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Eh8bUBx4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4189A43A5C;
	Mon, 26 May 2025 06:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748242576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NRMA4soRY+YAffaOYcDAQfSjj9b7uXWbSdJ5/eVytMA=;
	b=Eh8bUBx4l/Iqbgkd5yJtwhuAviKuncGsqvulsbGFLQcYhZXg2hTMxkLIwo0Bqv2k05wXct
	NQ+BXxmAHr4XlWnU+B9Bqi2ZxdS4udIhcZMqIssJ/6lGz8OMkwwEfFy7k0AzXh0mjeO65B
	aA98vrLe9phzgDkPTNHoA8OUQEkX1dK28HGSqGk2okDnhFQPFN4xpkv5QhLwnSGMwONZSG
	IhyV2YrOoxQcD9BHNq0dzlfqZxYcNokUBG9KDCYZ4EfQh9XIaDLGiMvkTHt7fl53Kl25nZ
	ISu9YvifGqzsFHCo7yRRA8R5wecbfPDlcoyicG6Nw3DMobnx+G/5zGZYQETbqA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 08:56:18 +0200
Message-Id: <DA5W9T9T2WQZ.15C1LD6ULNDP4@bootlin.com>
Subject: Re: [OE-core] [PATCH] kernel-fitimage: Cope with
 FIT_CONF_DEFAULT_DTB being empty
Cc: <openembedded-core@lists.openembedded.org>, "Jack Mitchell"
 <jack@embed.me.uk>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Mike Crowe" <mac@mcrowe.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250523122045.3097055-1-mac@mcrowe.com>
 <DA5CTNMVP3RK.LB01EWGV6S6C@bootlin.com> <aDNlRimrPXkm-2MS@mcrowe.com>
In-Reply-To: <aDNlRimrPXkm-2MS@mcrowe.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduieekieculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjedtueejhfffieetgedtkeduteetkeejteegiedvueffheethfekudeileffkeeknecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemtgdtsggvmegslegrkeemvgehledvmeeirgeffhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemrgeiieemfedukedtmegttdgsvgemsgelrgekmegvheelvdemiegrfehfpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepmhgrtgesmhgtrhhofigvrdgtohhmpdhrtghpthhto
 hepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepjhgrtghksegvmhgsvggurdhmvgdruhhk
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 06:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217254

On Sun May 25, 2025 at 8:45 PM CEST, Mike Crowe wrote:
> On Sunday 25 May 2025 at 17:41:51 +0200, Mathieu Dubois-Briand wrote:
>> On Fri May 23, 2025 at 2:20 PM CEST, Mike Crowe via lists.openembedded.o=
rg wrote:
>> > From: Mike Crowe <mac@mcrowe.com>
>> >
>> > Quote both sides of the comparison of ${FIT_CONF_DEFAULT_DTB} and $DTB
>> > consistently to avoid parse errors if either side is empty.
>> >
>> > Signed-off-by: Mike Crowe <mac@mcrowe.com>
>> > Reviewed-by: Jack Mitchell <jack@embed.me.uk>
>> > ---
>>=20
>> Hi Mike,
>>=20
>> Thanks for your patch.
>>=20
>> Just a note: this patch is conflicting with the "FIT image improvements"
>> series:
>> https://lists.openembedded.org/g/openembedded-core/message/217192
>>=20
>> As this series is most likely going to be merged soon, can you rewrite
>> your patch on top of it?
>
> Hi Mathieu,
>
> I spotted that not long after I posted my patch. I replied, but somehow I
> only managed to send that reply to Adrian Freihofer, the author of the
> conflicting patch. Anyway, here's what I said:
>
>> It looks like Adrian Freihofer's
>> "[PATCH v5 14/17] kernel-fitimage: re-write its code in Python"
>> in <20250523094152.727177-15-adrian.freihofer@siemens.com> removes this =
code
>> and replaces it with Python which won't suffer from the problem. That's
>> much better than my fix above.
>
> So my patch can be ignored.
>
> Thanks and sorry for the hassle.
>
> Mike.

No problem, thanks for the update!

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


