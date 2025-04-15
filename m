Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F4FC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 09:12:12 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.15628.1744708324421571229
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 02:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Zil2p0mc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE8A5433F6;
	Tue, 15 Apr 2025 09:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744708322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QGjBI/dlbgW/np3BdeqwBYCU6gA5kkRjbuHl+yHz8yw=;
	b=Zil2p0mcNSOARZvpj8eHcHDxqrHkTBrk6Aw+J+8VECgeoHjq/KghuDfqF96z0wimMHl80I
	+zc7IDMpgv+vSc44rMf8I0NwIO2ObD0k1jE5N47OA15q5WxgBX7BkroRnJathogBV5s/iI
	/OgMwC9iuaSwZOgCRfjuNY55yrllXm2BQ+MbOrCzzxBPy9Kl/mjjhtgrYDubMgLvoSHRYz
	uzRrzFspsuNjn0fKODfikTBpfffKGPBbGCYfZZzzq/XeoqvV+mnDh2rnb1nV9Xa3EgVI6v
	XU9TypHdDY2OSv/ZnCHolF7zhk7/wJiy2YRjPuB9fVKaApTeqZgu1oon9LKLcA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Apr 2025 11:12:01 +0200
Message-Id: <D973HDWJ2POI.2O5MJLJVGCM7Z@bootlin.com>
Subject: Re: [OE-core] [PATCH v6 5/6] oeqa/sdk/meson: improve test to
 validate host/build target assignments
Cc: "Ross Burton" <ross.burton@arm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <tom.hochstein@oss.nxp.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250411172803.3706607-1-tom.hochstein@oss.nxp.com>
 <20250411172803.3706607-5-tom.hochstein@oss.nxp.com>
In-Reply-To: <20250411172803.3706607-5-tom.hochstein@oss.nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeftdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduheeggfetgeehgeejhefhhfegleekhefgleefueektedvkeeitddtveegfeduueenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhomhdrhhhotghhshhtvghin
 hesohhsshdrnhigphdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehrohhsshdrsghurhhtohhnsegrrhhmrdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 09:12:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214834

On Fri Apr 11, 2025 at 7:28 PM CEST, Tom Hochstein via lists.openembedded.o=
rg wrote:
> From: Ross Burton <ross.burton@arm.com>
>
> Use 'meson introspect' to dump JSON describing the build configuration
> and validate that the build and host architectures are correctly set in
> the meson.cross file.
>
> Also instead of calling ninja directly, call the relevant meson commands.
>
> Fixes: [YOCTO #15485]
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
> ---

Hi Tom,

Thanks for the new version, but we still have a failure. Same error I
believe:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/genericarm64/build/meta/lib/oeqa/sdk/ca=
ses/meson.py", line 52, in test_epoxy
    self.assertNotEqual(data["build"]["c"]["exelist"], data["host"]["c"]["e=
xelist"])
KeyError: 'c'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/1384


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


