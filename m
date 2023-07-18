Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BB2EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 21:05:36 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.7327.1689714329205478558
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 14:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jlaaczQ0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D137420007;
	Tue, 18 Jul 2023 21:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689714327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q/wkgECsWrcqYUjXb3tYXUd0rKcQARulsOGt0cIfX1g=;
	b=jlaaczQ0JrQKJ1JPk2AdpPQy5PJPCvX2Nmp/6Tj91Bxrtm85FGVyy/4gKkAcPUdFREEqBe
	mCeX9If34i0Nh57KN1FqAxoequMC1Tg6KCf7w6PAC7n1PYRFIYAKn5BqRFTu+HsG7dYCKH
	gqzo3ghueQNN/82gazFNd+xnAXJgcw4vnFURwY4z/ja8bonv48HDdzEAkvr8lqHhFvVWWH
	z7yQ/wgDRsxT9jcAmXHEBtIXmg0Uc2DScLFeg81HW+XG0wTUpSS4ZLp+UOsHvnPSQ1QB0d
	tD9SdYfOMo0nHavaE4775f2sMo8XkW2GWv5mXTeSBWnndTHHFwQwqOu72UiK5w==
Date: Tue, 18 Jul 2023 23:05:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Piotr =?utf-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>
Cc: Alex Stewart <alex.stewart@ni.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: ODP: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr
 distro native features support
Message-ID: <202307182105150310803d@mail.local>
References: <20230712190428.379909-1-p.lobacz@welotec.com>
 <0cce368f-36b7-672e-df83-94b4914a1344@ni.com>
 <VI1PR04MB5373A7CF0029527D7AA884689134A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <20230716213857fea03b3e@mail.local>
 <17728F63D7D8F798.22245@lists.openembedded.org>
 <177297AC200D092D.22245@lists.openembedded.org>
 <VI1PR04MB53737C43B2CDDBFB197010359138A@VI1PR04MB5373.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR04MB53737C43B2CDDBFB197010359138A@VI1PR04MB5373.eurprd04.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 21:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184559

On 18/07/2023 08:05:12+0000, Piotr Łobacz wrote:
> Alexander, this message:
> 
> > Alex,
> > from what I'm seeing the issue touches opkg-build command:
> >
> > opkg-build -Z xz -a "--memlimit=5% --threads=8" "" "" nativesdk-xcb-proto-dbg /home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/deploy-ipks/i686-nativesdk' returned non-zero exit status 1.
> >
> > which causes you an error. This may happen with bad tar hosttools command. Can you please post me which version is on yocto autobuilder?
> 
> > BR
> > Piotr
> 
> was meant for you, sorry for the confusion. Can you please verify/check what version of `tar` is being used on the autobuilder? This is really important for me, if we're going to move forward with it, because I have suspicions that it may not support posix or it may not be patched with --acls and --xattrs attributes https://www.mail-archive.com/bug-tar@gnu.org/msg06198.html
> 

This fails at least on:

fedora38-ty-4: tar (GNU tar) 1.34, has --acls and --xattrs
stream8-ty-1: tar (GNU tar) 1.30, has --acls and --xattrs
rocky9-ty-1: tar (GNU tar) 1.34, has --acls and --xattrs
debian12-ty-1: tar (GNU tar) 1.34, has --acls and --xattrs
ubuntu2204-ty-3: tar (GNU tar) 1.34, has --acls and --xattrs
ubuntu2004-arm-1: tar (GNU tar) 1.30, has --acls and --xattrs
opensuse154-ty-3: tar (GNU tar) 1.34, has --acls and --xattrs
alma9-ty-1: tar (GNU tar) 1.34, has --acls and --xattrs
ubuntu2210-ty-1: tar (GNU tar) 1.34, has --acls and --xattrs
ubuntu2004-ty-1: tar (GNU tar) 1.30, has --acls and --xattrs

Really, the question is more on which host this is working.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

