Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0582FCCF9F8
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 08:50:35 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9012.1762937433199344372
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 00:50:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hvduhQ1R;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D55E51A1A01;
	Wed, 12 Nov 2025 08:50:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9988A6070B;
	Wed, 12 Nov 2025 08:50:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B68BE10371976;
	Wed, 12 Nov 2025 09:50:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762937431; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Fa1qFZVglY8nqfBphLT/xcSuSApoFohz8xKBHvc3PB4=;
	b=hvduhQ1RWdB34cpVQP+6KOoxjLRFT3bpLN1NzuQZxTy9lLq8PZ9xgPlFvJpparMpOfyoPr
	8VqNJa+1H3EsE884CD/mZBQ3fhvCnelChLgujW0ou9nbAG6WM254z3vPd/E9OXrIkxEbu6
	O3G9zGBw8xIpVGI/oioyW6nr8+BQRkqY9IwkJq7ECVgaVqiwknxk33Q5JXa+YSSQ95zOi9
	1GWAeYFHi1r1ZlQPsfCxMUXcWtqTXpGjKZeZAlRifJ479evN6JaNDr0Q3GwZLTfrwPjYwZ
	eOGLFx6LihUoECt+LT7pXGDAO5dz/UDOMsPem7wCekCDDfnwarq9jVFq7J3KEQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Nov 2025 09:50:30 +0100
Message-Id: <DE6L5UZLO5A0.CU0TVLA2MQNF@bootlin.com>
Subject: Re: [OE-core] [PATCH] weston: Clean up PipeWire backend
 configuration and dependencies
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <veereshkadasani88@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251110162331.6287-1-veereshkadasani88@gmail.com>
In-Reply-To: <20251110162331.6287-1-veereshkadasani88@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 08:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226199

On Mon Nov 10, 2025 at 5:23 PM CET, Veeresh Kadasani via lists.openembedded=
.org wrote:
> - Remove redundant -Dpipewire=3Dfalse from EXTRA_OEMESON.
>   The -Dpipewire flag is already controlled by PACKAGECONFIG[pipewire].
>   If 'pipewire' is not in PACKAGECONFIG, Meson will receive
>   -Dbackend-pipewire=3Dfalse automatically. Setting -Dpipewire=3Dfalse
>   unconditionally in EXTRA_OEMESON is redundant and may cause confusion.
>
> - Add pipewire as a runtime dependency in PACKAGECONFIG[pipewire].
>   This ensures the PipeWire backend is properly enabled and the
>   runtime dependency is present when selected.
>
> Signed-off-by: Veeresh Kadasani <veereshkadasani88@gmail.com>
> ---

Hi Veeresh,

Thanks for your patch.

It look like this is causing some build errors:

ERROR: lib32-weston-14.0.2-r0 do_configure: Execution of '/srv/pokybuild/yo=
cto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-w=
eston/14.0.2/temp/run.do_configure.577747' failed with exit code 1
...
| NOTE: Executing meson -Dtests=3Dfalse -Dsimple-clients=3Dall -Ddemo-clien=
ts=3Dtrue -Drenderer-gl=3Dtrue -Dbackend-headless=3Dfalse -Dimage-jpeg=3Dtr=
ue -Dbackend-drm=3Dtrue -Dcolor-management-lcms=3Dfalse -Dbackend-pipewire=
=3Dfalse -Dbackend-rdp=3Dfalse -Dremoting=3Dfalse -Dscreenshare=3Dtrue -Dsh=
ell-desktop=3Dtrue -Dshell-fullscreen=3Dtrue -Dshell-ivi=3Dtrue -Dshell-kio=
sk=3Dtrue -Dsystemd=3Dfalse -Dbackend-drm-screencast-vaapi=3Dfalse -Dbacken=
d-vnc=3Dfalse -Dbackend-wayland=3Dtrue -Dimage-webp=3Dfalse -Dbackend-x11=
=3Dtrue -Dxwayland=3Dtrue...
...
| Run-time dependency libpipewire-0.3 found: NO (tried pkgconfig and cmake)
|
| ../sources/weston-14.0.2/pipewire/meson.build:12:2: ERROR: Problem encoun=
tered: Pipewire plugin requires libpipewire which was not found. If you rat=
her not build this, set '-Dpipewire=3Dfalse'.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2719
https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/2706
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2551

Can you have a look at this issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


