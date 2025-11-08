Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2372CCFA18
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 09:58:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2778.1762595919805003413
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Nov 2025 01:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=eR1LdU+e;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B51F31A194C
	for <openembedded-core@lists.openembedded.org>; Sat,  8 Nov 2025 09:58:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8BD0D60710;
	Sat,  8 Nov 2025 09:58:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18A5111852E96;
	Sat,  8 Nov 2025 10:58:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762595917; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nfuPI808i2Fa5WoQSyX+SpFPeBpXpmVGI9v7UJaytjs=;
	b=eR1LdU+eZz53lEOGK+yTXLa9CNRKltRAfLkIutrbnr0aI6N2rBzcP77gWM0fJpXcAq8nXg
	LOgF9emGWOPbjfhCL67bl3eeD7Flrsjj0BY+MaoFfgYh0/phbawkrzQWW1zPJnSB2o1iTy
	eRY144pQBJhrnXdQ9rv+OII7KQSxNIAVdz5dUD5YHvM2W4B5y41EIyETBWWIP+/GOv1ehy
	HBaxnKhavzbgG3CaJMwysGNTiDzLpIT4EHG5Ce2Hyh0cA4FqASBZKUgbIUzqXmWoKwpKDU
	z5oFdYuIrKYEMAMo6hu8D3JwZ7ZQW0zQPPazgECwst76VQ2xMWGlVh0rStkjmA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 08 Nov 2025 10:58:34 +0100
Message-Id: <DE383SPRNZ42.34EHODBRDREFW@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] target-sdk-provides-dummy: provide
 packagegroup-core-boot
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251107152730.1774081-1-ross.burton@arm.com>
 <20251107152730.1774081-2-ross.burton@arm.com>
In-Reply-To: <20251107152730.1774081-2-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Nov 2025 09:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226075

On Fri Nov 7, 2025 at 4:27 PM CET, Ross Burton via lists.openembedded.org w=
rote:
> Add packagegroup-core-boot to the provides of the dummy package that is
> installed into the target sysroot of SDKs, because packages that are
> part of the core boot process are not needed in SDKs.
>
> Specifically, this means we don't install the init system into the
> target sysroot:
>

Hi Ross,

I believe this is breaking builds with deb packages:

ERROR: core-image-minimal-1.0-r0 do_populate_sdk: Unable to install package=
s. Command '/srv/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/work=
/qemux86_64-poky-linux/core-image-minimal/1.0/recipe-sysroot-native/usr/bin=
/apt-get  install --allow-downgrades --allow-remove-essential --allow-chang=
e-held-packages --allow-unauthenticated --no-remove  libstd-rs packagegroup=
-core-boot packagegroup-core-standalone-sdk-target packagegroup-go-sdk-targ=
et run-postinsts target-sdk-provides-dummy' returned 100:
...
The following packages have unmet dependencies:
 target-sdk-provides-dummy : Conflicts: packagegroup-core-boot
E: Unable to correct problems, you have held broken packages.
E: The following information from --solver 3.0 may provide additional conte=
xt:
   Unable to satisfy dependencies. Reached two conflicting decisions:
   1. target-sdk-provides-dummy:amd64 is not selected for install because:
      1. packagegroup-core-boot:amd64=3D1.0-r0 is selected for install
      2. target-sdk-provides-dummy:amd64 Conflicts packagegroup-core-boot
   2. target-sdk-provides-dummy:amd64=3D1.0-r0 is selected for install

https://autobuilder.yoctoproject.org/valkyrie/#/builders/67/builds/2718

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


