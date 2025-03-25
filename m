Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AE2C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 07:53:28 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.60424.1742889207537985005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 00:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nvc2PbSa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49CF3442AF;
	Tue, 25 Mar 2025 07:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742889205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=clEfBm/gmcLBKnS0OsXBOB5e79GZacVMEyDkXbNjwDc=;
	b=nvc2PbSaHprA4wZJ/RfO8J4HAaGcRVhbh0dFOPlyzL4OdKI7zI6v4KpE3kjeF0JBHNtOTn
	Mp52sJvWixCVxDMfBoa1gVkfS3si+3i7goQUWOeGKfBxpI7Ytl28gTXVk+Qd8UrxC+l/Bf
	DRZzHoOXxUblh6T1OJxIR6RYLxpnWxDMtbB5f45280/Hnds3Aqb/VAb9NfbA9MXv75I7fY
	OQUWZ7UTVjbHPqtrVNcN+gjJ+LiYn01v3MtiXvprswKrsz3dy4M++UacjS+iHqrFL33sc1
	d4vvvvPV28ionQQEwqogsNiJfzPiHqH0/xc7jbN87k/AWtK7t/rtIwDrEnrDBA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Mar 2025 08:53:24 +0100
Message-Id: <D8P6NR9WNLW8.2A85J29IONJA7@bootlin.com>
Subject: Re: [OE-core] [PATCH] binutils: Fix CVE-2025-1148
Cc: <Sundeep.Kokkonda@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250319093535.3368863-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20250319093535.3368863-1-Harish.Sadineni@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdfhgedtudffieefieetudehveehhfejuddvfeffveevgefhkeeugedvudevueelnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpshhouhhrtggvfigrrhgvrdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepjfgrrhhishhhrdfurgguihhnvghnihesf
 ihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopefuuhhnuggvvghprdfmohhkkhhonhgurgesfihinhgurhhivhgvrhdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 07:53:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213591

On Wed Mar 19, 2025 at 10:35 AM CET, Harish via lists.openembedded.org Sadi=
neni wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> A few place dealing with ld script handling made some attempt to free
> memory, but this was generally ignored and would be quite a lot of
> work to implement.  Instead, use the stat_obstack rather than
> mallocing in many more cases.
>
> Backport a patch from upstream to fix CVE-2025-1148
> Upstream-Status: Backport [https://sourceware.org/cgit/binutils-gdb/commi=
t/?id=3Dd4115c2c8d447e297ae353892de89192c1996211]
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---

Hi,

Thanks for your patch.

I've seen it is already discussed, but as an additional note, current
version seems to generate some build error on the autobuilder:

ERROR: gdb-16.2-r0 do_package_qa: QA Issue: The /usr/share/info/dir file is=
 not meant to be shipped in a particular package. [infodir]

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/1170

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


