Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D27C44512
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 05:41:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41634.1784698882212617988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 22:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tKUw8Phw;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E97E84E40EC2;
	Wed, 22 Jul 2026 05:41:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A003D60388;
	Wed, 22 Jul 2026 05:41:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E300F11BD1C3E;
	Wed, 22 Jul 2026 07:41:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784698878; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=41NGS0+PzSYvFH3elbqvFx2hjQfjidfw+U8iOxzQt58=;
	b=tKUw8PhwrPWgG9R1I+aebfsL5LmoOPwnCqUYsPR6qgRElymkFh6lEs/ljCDZJgPH4/ypGB
	ocg5tPrsDHahwupaM9ZW4zzXGWZ7vBJAQ/0U1wAhto6j2qApr9mFGjUX4PW/xfTya6Ig6u
	wvCrFge12d9O/adP8SDFMffPQHz+6dBGI7D3jHpUXzRDPFbsCOuS7q/+OrNUMfQhlczRPS
	qzcqF7bJCiQxa+SxY6yTnODYNfFKUyo9elfvs4bHvTLN8MoQhy1XZ0iNzRbJHidByVfTn8
	oLeRPZoKefIsnoJRN1hyU4WFBVqQlv/XaBPPtHklmA1cHq0ezcVoztwsgmobcw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 07:41:15 +0200
Message-Id: <DK4UY8M71S6S.4ER6FHTQXGJD@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] systemd: no need to use qemu for hwdb
 update
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260721161511.2946619-1-ross.burton@arm.com>
 <20260721161511.2946619-3-ross.burton@arm.com>
In-Reply-To: <20260721161511.2946619-3-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241584

On Tue Jul 21, 2026 at 6:15 PM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> Now that systemd-tools-native gives us a native systemd-hwdb, and the
> database format is known to be hardware-agnostic, we can simply run
> systemd-hwdb directly instead of running it inside qemu-user if we're
> using systemd instead of eudev.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

Thanks for your patch.

It looks like we have postinstall failures:
ERROR: core-image-full-cmdline-1.0-r0 do_rootfs: The postinstall intercept =
hook 'update_udev_hwdb' failed, details in /srv/pokybuild/yocto-worker/gene=
ricarm64-alt/build/build/tmp/work/genericarm64-poky-linux/core-image-full-c=
mdline/1.0/temp/log.do_rootfs

I don't see more logs so far, but it does seem to happen on most build
configurations.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/4148
https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/4165
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/4190
...

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


