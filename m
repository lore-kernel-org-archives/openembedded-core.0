Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16ABCCAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 14:04:58 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.9886.1759413893390855308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 07:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ia3WcTvY;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 73AFE4E40E09
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Oct 2025 14:04:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 499166062C;
	Thu,  2 Oct 2025 14:04:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E72A3102F199F;
	Thu,  2 Oct 2025 16:04:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759413890; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=f+vJGjNnC2pHkkKMpFAMHiALB6Wz2848381enkiTsOA=;
	b=ia3WcTvYXRcxqZ0Xd838Ds70MO5AN10cllpiaA1roAtrrs+ZNTGrvyw00SC2iBzWNyLs0x
	kyQtpzs35/lh0BzsCUpTXQPSjy7EzxBIvBXf9OJp1LhkQogST6fSXVoJZSnqlWDFDZOdvV
	wVpuzFL8/WGVm0aYda2mUGKjF6pmDQYtry0VIKotveIAKL9ef9LFvQFbWmcF/Z2ohcURaW
	iXRsuYAgATg5bkETHaIE79PMd7uYpZhe1JLXtXxqwVHbXUt37hWnLv9RqDUSJs1C+bhwOx
	T95pXCzAZApwx/vC4YCePtivuegyTo+pihfddJ4egosl3L1nSmcU5u+NRYQyPw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 16:04:47 +0200
Message-Id: <DD7W65Q8DO16.FT6E3EYXCZOT@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] binutils-cross-canadian: Add missing perl
 mpodules to RDEPENDS
Cc: <Sundeep.Kokkonda@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250930123901.949798-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20250930123901.949798-1-Harish.Sadineni@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 14:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224360

On Tue Sep 30, 2025 at 2:39 PM CEST, Harish via lists.openembedded.org Sadi=
neni wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> In sdk while running "x86_64-poky-linux-gp-display-html --help" gives
> following error:
> $sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux->
> ./x86_64-poky-linux-gp-display-html --help
> Can't locate bigint.pm in @INC (you may need to install the bigint module
>
> By adding the following perl modules to RDEPENDS fixes the above errors:
>   nativesdk-perl-module-bignum
>   nativesdk-perl-module-bigint
>   nativesdk-perl-module-math-bigint
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---

Hi Harish,

Thanks for your patches.

I'm seeing some strange things on the autobuilder with this series. I
had a first build without errors, on another build I got:

ERROR: nativesdk-binutils-2.45-r0 do_package_qa: QA Issue: nativesdk-gprofn=
g rdepends on nativesdk-perl-module-bigint, but it isn't a build dependency=
, missing one of nativesdk-perl in DEPENDS or PACKAGECONFIG? [build-deps]
ERROR: nativesdk-binutils-2.45-r0 do_package_qa: QA Issue: nativesdk-gprofn=
g rdepends on nativesdk-perl-module-bignum, but it isn't a build dependency=
, missing one of nativesdk-perl in DEPENDS or PACKAGECONFIG? [build-deps]
ERROR: nativesdk-binutils-2.45-r0 do_package_qa: QA Issue: nativesdk-gprofn=
g rdepends on nativesdk-perl-module-math-bigint, but it isn't a build depen=
dency, missing one of nativesdk-perl in DEPENDS or PACKAGECONFIG? [build-de=
ps]

https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/2495

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


