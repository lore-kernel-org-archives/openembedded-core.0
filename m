Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617C9CA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 09:25:59 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.7924.1755249951217510532
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 02:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BGuvaza2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 079D443208;
	Fri, 15 Aug 2025 09:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755249949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6aoDJ70G1DOBoTSYENFdO4aZweq6bH4zb/FFutLQaZ8=;
	b=BGuvaza2XYnjzwFBKGBnuaeb1Cs170ebKjwvOEU1txhkiFDeAIX9RtxAsYrq28rKyvrG+c
	mQLZi50BZykjwHNbf8/b+g6j1MMw2WWIlXbGpzqA1lP7oJHf5CbA0TQDX+y6tKwHovyzfa
	dvv7zbsT5khnlxqt4aXqvXj5SKeplxHvn3nB5xu9v+121LBJwre381pCc3plL5SEIU2xFT
	MLbVuEWUNMIJgdljI8T7Cy2wVgOy/XT00kvtJqIQSIPJK7DAj6XXiTSH7Q4hOhSD63cql3
	oVl5ML5h8lmL5q12q4Lxx8QF2eiruwzDhF9Q4ezswwN5E9iaBpZp97OFisAwGA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 Aug 2025 11:25:48 +0200
Message-Id: <DC2W6ED7YCUS.1V4VLCIHMFF17@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <tony.rex@ericsson.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe parsing race
 issue
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250814172348.3882586-1-tony.rex@ericsson.com>
In-Reply-To: <20250814172348.3882586-1-tony.rex@ericsson.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeefiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtgfeuvdfghfegtdehvdegvefhkeegheeikeelfeefffetheeitdduudeludduleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemkeefhegvmeegheegieemiegusgekmegrheekjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemrgeiieemfedukedtmeekfeehvgemgeehgeeimeeiuggskeemrgehkeejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthhonhihrdhrvgigsegvrhhitghsshhonhdrtghomhdprhgtphhtthhopehophgvnhgvm
 hgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 09:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221877

On Thu Aug 14, 2025 at 7:23 PM CEST, Tony Rex via lists.openembedded.org wr=
ote:
> It seems that the race condition happens when doing do_fetch on really sm=
all repos
> and it can be difficult to reproduce so below the other case with floatin=
g tag/branch
> that is easier to verify.
>
> To verify the floating tag/branch issue have s simple recipe hello_1.0.bb=
 and set the SRC_URI to
> SRC_URI =3D "git://<repository>;protocol=3Dhttps;user=3D${USER};branch=3D=
master;tag=3Dv1.0"
>
> run command bitbake hello everything builds.
> =20
> Apply the patch
>
> run command bitbake hello
> ERROR: hello-1.0-r1 do_fetch: Bitbake Fetcher Error: FetchError("Recipe u=
ses a floating tag/branch 'v1.0' for repo '<repository>' without a fixed SR=
CREV yet doesn't call bb.fetch2.get_srcrev() (use SRCPV in PV for OE).", No=
ne)
> ERROR: Logfile of failure stored in: hello/1.0/temp/log.do_fetch.3289932
> ERROR: Task (hello/hello_1.0.bb:do_fetch) failed with exit code '1'
>
> Tony Rex (1):
>   base.bbclass: Fix the recipe parsing race issue
>
>  meta/classes-global/base.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi Tony,

Thanks for your patch.

It looks like this is breaking some builds with the following error:

oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybu=
ild/yocto-worker/qemux86-64/build/build/tmp/work/qemux86_64-poky-linux/core=
-image-sato/1.0/testsdkext/environment-setup-core2-64-poky-linux > /dev/nul=
l; devtool add kernel-module-hello-world https://git.yoctoproject.org/git/k=
ernel-module-hello-world;' returned non-zero exit status 1.
...
ERROR: Bitbake Fetcher Error: FetchError("Recipe uses a floating tag/branch=
 'master' for repo 'git.yoctoproject.org/git/kernel-module-hello-world' wit=
hout a fixed SRCREV yet doesn't call bb.fetch2.get_srcrev() (use SRCPV in P=
V for OE).", None)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/2284
https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/2199
https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/2247

Can you have a look at this error please?

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


