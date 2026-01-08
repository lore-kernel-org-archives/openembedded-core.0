Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA82D1D484
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 17:35:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12240.1767893694327149251
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 09:34:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vWcX/Vb5;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4F8C51A26FE
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 17:34:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2599D6072B;
	Thu,  8 Jan 2026 17:34:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93758103C8262;
	Thu,  8 Jan 2026 18:34:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767893691; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ph169km2YpP6qFS91ee293Is0TIFX3FclWYJ6HJG/nc=;
	b=vWcX/Vb55aaAiWDHBIuwPhxa6PAAxUMT1mbpl6/o7KnHpDj+cIIU4ov/Jp0eh5tXuNkjU6
	wsPgz929gpTCO0rbCUK+6wQHqcK8+sLP7WXW+8CU3mSlsE21v5pfdbLE9ZA481w4ipFcLS
	ncJ3muinFUHvlOtUwuK3j389RvroD2lo4Tcy0PE9Pp8YLY1kK3tMKYYj2Sz7pBcUZGC/ca
	HSTa63A/bMS3qUyHJcOfNOFI2U6GK/1VQcF98d47MgMPJqpMh6Qw2lSzK8Cvalf7wkjd5O
	Eyg3SUe53/iZVMwmm1g5jwlkCVX9NDNuyNxhg1O2SSDlWRZmcd6+WgcZsy0tHA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 18:34:49 +0100
Message-Id: <DFJE0D4G1RBY.4Z1YAOBA4UYP@bootlin.com>
Subject: Re: [OE-core] [PATCH V2] qemurunner: Improve qmp module detection
 PKG_CONFIG_SYSROOT_DIR for qmp module path
Cc: <openembedded-core@lists.openembedded.org>, "Alex Kanavin"
 <alex.kanavin@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Tom Geelen" <t.f.g.geelen@gmail.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260107202553.2965393-3-t.f.g.geelen@gmail.com>
 <DFJ6AGZNL99N.VPY6DN6VPCWK@bootlin.com>
 <CAJo0Az4cUtFnVH9H+LKqP39Fnxe5-AECCi=swWz98wjm5dJLGQ@mail.gmail.com>
In-Reply-To: <CAJo0Az4cUtFnVH9H+LKqP39Fnxe5-AECCi=swWz98wjm5dJLGQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 17:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229085

On Thu Jan 8, 2026 at 3:52 PM CET, Tom Geelen wrote:
> Hi Mattieu,
>
> Certainly. Question from my side. What is the exact setup that is used on
> the autobuilder? Or the build commands for that matter.
> I would like to reproduce this particular setup locally as well.
>
> Regards,
>
> Tom
>

Sure!

This is a toolchain test, so the command used by the autobuilder is:
oe-selftest -a -t machine -t toolchain-system -j 15

You have a lot of tests failing, so you might want to just run one
specific test. This can be done with something like:
oe-selftest -r gcc.GccCrossSelfTestSystemEmulated.test_cross_gcc

In terms of configuration, you can have a look at the config step of the
build:
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4870597/raw_inlin=
e

But basically, you can probably try something like:
SDKMACHINE =3D "x86_64"
PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
INHERIT +=3D 'image-buildinfo'
IMAGE_BUILDINFO_VARS:append =3D ' IMAGE_BASENAME IMAGE_NAME'
IMAGE_INSTALL:append =3D ' ssh-pregen-hostkeys'
SANITY_TESTED_DISTROS =3D ''
EXTRA_IMAGE_FEATURES ?=3D 'allow-empty-password empty-root-password allow-r=
oot-login'
OE_FRAGMENTS +=3D 'machine/qemux86 distro/poky'

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


