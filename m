Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3364ACA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 18:48:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.59976.1756752519942867779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 11:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UReOL26H;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 07AF84E40C56
	for <openembedded-core@lists.openembedded.org>; Mon,  1 Sep 2025 18:48:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B5203605FC;
	Mon,  1 Sep 2025 18:48:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF6A51C22DA8B;
	Mon,  1 Sep 2025 20:48:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756752517; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tZq4do/rOk+ePYeBz8u8A3ZPgWlYGPX+ivtP/VOilvY=;
	b=UReOL26HDyJ/uPfDvlICw8GO6UnFElM2npkpnGU1KO5tB3WzgCQxHzDTOB2+Q6Q10JPu+q
	bziWmtmXlPiiM/Rgr8uhfzNN/gVZLn6vKk8F2I0t4aGPJsjfcAcQvIl75kkroCfN4VaGMV
	wTJdCw3PUzEHUHpCQtlxEtU84/Q45eLxRlAEAry/FhjyorerKDeF+BJbpq+6zk/EIN47wI
	Hd6cVOjDH/6wRiqn38JUjSfEa1tJtZ32GxB/7CQZ+pfZNhNnajfqyUDvMIoW/0t0ZP0KOl
	Okj9SmwHBv8VJruInle3kAFIJ/UXR1MiG7DXfl2DRJw8YZz5FpffyYLyQWHHTQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Sep 2025 20:48:34 +0200
Message-Id: <DCHOSJU35V3K.1QWJ7TP4WZL48@bootlin.com>
Subject: Re: [OE-core] [PATCH] pulseaudio: Add audio group explicitly
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dpmin7@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250901080753.897087-1-dp.min@lge.com>
In-Reply-To: <20250901080753.897087-1-dp.min@lge.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 18:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222677

On Mon Sep 1, 2025 at 10:07 AM CEST, Kyungjik Min via lists.openembedded.or=
g wrote:
> From: Kyungjik Min <dpmin7@gmail.com>
>
> Since pulseaudio-server requires the audio group, we explicitly add it.
>
> When use useradd-staticids or do not use the default group in
> base-passwd, an error will occur because the audio group is not defined.
>
> NOTE: pulseaudio: Performing useradd with [--root
> TOPDIR/tmp/work/cortexa72-poky-linux/pulseaudio/17.0/recipe-sysroot
> --home-dir /var/run/pulse --gid 998 --groups audio,pulse
> --no-create-home --system --shell /bin/false --uid 998 pulse]
> useradd: group 'audio' does not exist
> ERROR: pulseaudio: useradd command did not succeed.
>
> Signed-off-by: Kyungjik Min <dpmin7@gmail.com>
> ---

Hi,

Thanks for your patch.

We get some build errors during the reproducibility test build:

2025-09-01 10:38:39,725 - oe-selftest - INFO -       ERROR: Nothing PROVIDE=
S 'pulseaudio' (but /srv/pokybuild/yocto-worker/reproducible/build/meta/rec=
ipes-graphics/libsdl2/libsdl2_2.32.8.bb, /srv/pokybuild/yocto-worker/reprod=
ucible/build/meta/recipes-multimedia/mpg123/mpg123_1.33.0.bb, /srv/pokybuil=
d/yocto-worker/reproducible/build/meta/recipes-devtools/qemu/qemu_10.0.2.bb=
, /srv/pokybuild/yocto-worker/reproducible/build/meta/recipes-multimedia/gs=
treamer/gstreamer1.0-plugins-good_1.26.5.bb, /srv/pokybuild/yocto-worker/re=
producible/build/meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb DEPEND=
S on or otherwise requires it)
2025-09-01 10:38:39,725 - oe-selftest - INFO -       pulseaudio was skipped=
: Recipe pulseaudio, package pulseaudio-server: system groupname "audio" do=
es not have a static ID defined. Add audio to one of these files: /srv/poky=
build/yocto-worker/reproducible/build/build-st/meta-selftest/files/static-g=
roup

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2397

Can you have a look at the issue please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


