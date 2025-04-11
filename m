Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070BBC369A9
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 10:14:10 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.22386.1744366439776072903
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 03:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=epkZaR8c;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5ACD9432FA;
	Fri, 11 Apr 2025 10:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744366437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7XPfj6zk8/SxX3/ICJx6P/XnLDBqnpVw0CeK9PFh5nc=;
	b=epkZaR8c5j4hvsoo0T8VTwKdtE2wgZ+bqpMDemDmaySOgUJjqMKrubjwiSssx+/wPJLj72
	Cxkx/91tqg12xznDD1K+m6dEZhOD6GmMykPM2+n3uJShZzx91CXxSulzqKp5NgBqVe/ai+
	JnU17G9KtGlgDH4xKSpIG9ITC4sIq0hMou0z/5f+D+zrliyzT98lvFM+F8DE1ltEGxXh5i
	JfTcN9N5Kuie5B9UPT8rkctcxwOu425PV9mWV+4/ZgICk19tKcz9ZEHBS4hkY5jJTFgi7B
	3vPDwBTCXUE530VrpSdnQrZjiUMeqaia6parvOuDviTEBrMfRkauAjIo71uQCg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 12:13:56 +0200
Message-Id: <D93QAMBHTAR4.1CIOF4WMRTVEQ@bootlin.com>
Subject: Re: [OE-core] [PATCH v5 4/5] oeqa/sdk/meson: improve test to
 validate host/build target assignments
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <tom.hochstein@oss.nxp.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250407211806.1782316-1-tom.hochstein@oss.nxp.com>
 <20250407211806.1782316-4-tom.hochstein@oss.nxp.com>
 <D91AQNC6UKX5.394WLWGGFWT4O@bootlin.com>
 <183460753CA35884.31078@lists.openembedded.org>
 <1834F816ACB44615.7383@lists.openembedded.org>
 <1834FEA34534143E.27206@lists.openembedded.org>
 <cdae0d74-ade9-4b2b-a0ab-45788cd8044f@oss.nxp.com>
 <18353B5DF2EF4BC1.27206@lists.openembedded.org>
In-Reply-To: <18353B5DF2EF4BC1.27206@lists.openembedded.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthhomhdrhhhotghhshhtvghinhesohhsshdrnhigphdrtghomhdprhgtphhtthhop
 ehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 10:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214727

On Fri Apr 11, 2025 at 12:01 PM CEST, Mathieu Dubois-Briand via lists.opene=
mbedded.org wrote:
> Hi,
>
> Ok, I managed to reproduce the error withe the following process:
>
> git clone git://web.git.yoctoproject.org/poky-ci-archive -b autobuilder.y=
octoproject.org/valkyrie/a-full-1363
> cd poky-ci-archive=20
> . oe-init-build-env
>
> Adding following in my local.conf:
> IMAGE_CLASSES +=3D "testimage"
> MACHINE =3D "qemux86"
> DISTRO =3D "poky"
> SDKMACHINE =3D "i686"
> PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
> INHERIT +=3D 'image-buildinfo'
>
> bitbake core-image-sato -c populate_sdk
> bitbake core-image-sato -c testsdk
>
> And I got this error:
>
> Traceback (most recent call last):
>   File "/home/mdubois-briand/swat/oe-sefltest/poky-contrib/meta/lib/oeqa/=
sdk/cases/meson.py", line 47, in test_epoxy
>     self.assertNotEqual(data["build"]["c"]["exelist"], data["host"]["c"][=
"exelist"])
>                         ~~~~~~~~~~~~~^^^^^
> KeyError: 'c'
>
> Best regards,
> Mathieu

Also reproduced with core-image-minimal, if you don't want to loose time
building core-image-sato.


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


