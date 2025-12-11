Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF35D41D4C
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 14:35:53 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10611.1765463743866071585
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 06:35:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0Sd9ZCJu;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E00724E41B72;
	Thu, 11 Dec 2025 14:35:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB6B36068C;
	Thu, 11 Dec 2025 14:35:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1FCE103C8C1E;
	Thu, 11 Dec 2025 15:35:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765463741; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XSsyiOJOCOMvDKChd+HV/lu1zw5NdcsCCMmQ2letIeE=;
	b=0Sd9ZCJujI5WOULV9Flay/wX/IlZgxPSnQLPl+PUs4z+odgb1DzBZ3rzKa8kEUW/AQRBAy
	2HFh01Ovt3xjuImwu10KSPS+NmLaIMru23xQBmrGWrj+Xe4EVutVuX7g0ylVIfZW1PX3Kc
	kY+BpN4P8NEQxcbdWY3mNRr1NnoEsqrz6TAVmBc0TBEgksrgC4pP/JGiFhrj8xtgEGqjHc
	2SGzIvVwBW6OSQuv8tiUMpJUUZ3AModJXTsUTSUfi2ffr4PXGfIEG69XomBIkuxDzxHacI
	YRRGD+p9SWHQIpW2dYhJLcqqRj5Hcva1xL2WO7Eke+KLHXb/VDX76obtkgPJTQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 15:35:39 +0100
Message-Id: <DEVGNXKKHGE4.33IGD9YYUULD5@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/8] iputils: just set bindir, not prefix
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251210183308.4022909-1-ross.burton@arm.com>
In-Reply-To: <20251210183308.4022909-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 14:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227537

On Wed Dec 10, 2025 at 7:33 PM CET, Ross Burton via lists.openembedded.org =
wrote:
> We just want to put the binaries into base_bindir and nothing else, so
> set bindir instead of prefix.
>
> This is currently moot as iputils only installs binaries, but this is
> the right thing to do and allows further cleanups.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

We got a configure error on iputils:

oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybu=
ild/yocto-worker/pkgman-non-rpm/build/build/tmp/work/qemux86_64-poky-linux/=
core-image-minimal/1.0/testimage-sdk/environment-setup-x86-64-v3-poky-linux=
 > /dev/null; meson setup --warnlevel 1 /srv/pokybuild/yocto-worker/pkgman-=
non-rpm/build/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/t=
estimage-sdk/iputilsfzhd8meu/build /srv/pokybuild/yocto-worker/pkgman-non-r=
pm/build/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/testim=
age-sdk/iputilsfzhd8meu/iputils-20250605 ;' returned non-zero exit status 1=
.
...
tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/testimage-sdk/iputils=
fzhd8meu/iputils-20250605/meson.build:103:14: ERROR: C shared or static lib=
rary 'cap' not found

https://autobuilder.yoctoproject.org/valkyrie/#/builders/67/builds/2868

Can you have a loot at this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


