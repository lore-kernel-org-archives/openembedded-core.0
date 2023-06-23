Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA78EEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 10:17:04 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.38880.1687515423498210856
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 03:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ma6UUZ2o;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687515421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rOqzW8LLsR8fgDJ2Tq/1D6suArrt+IC/LCsTQ1oFoY4=;
	b=Ma6UUZ2oqIhDp8tnMzPAV/Chu+UaUu32BRSxBEZlSNg+KVtOVO+F5Enr/53N9yv5S8RR/I
	FYwDkjch1Qr08X/ZrDOXANaKWAhq1BYwxqOMWc3ID2D9PahM6ijzZkL4bdaNBRIibvSwh7
	HzXJOYkNCOM2N5BEqYPQDFDG2AXb+EkrkepgQUL2XCQIdIFclT+u5ut9Sthb9F5M7+wbiP
	vN8JQhvD60IEf02fdjSZSLGY56IFMCnZWoZ52a9LevhrZD38DQwn6fYg7XRtpjM65ulI3O
	VrgQXYC99gKrbs2EqQhcjfytcGCyhh6ML29x34gtjmJPzl13VYpaGUlHJw7tPg==
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07C3F1BF204;
	Fri, 23 Jun 2023 10:17:00 +0000 (UTC)
Date: Fri, 23 Jun 2023 12:16:59 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: =?UTF-8?Q?Eil=C3=ADs?= 'pidge' =?UTF-8?Q?N=C3=AD_Fhlannag=C3=A1in?=
 <pidge@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, Tom Hochstein
 <tom.hochstein@nxp.com>
Subject: Re: [OE-core] [PATCH v2 2/3] weston: Upgrade 11.0.1 -> 12.0.1
Message-ID: <20230623121659.75aefd1e@booty>
In-Reply-To: <acca25d2cbd58d50cbaa3962f922990fee700403.1687444823.git.pidge@baylibre.com>
References: <cover.1687444823.git.pidge@baylibre.com>
	<acca25d2cbd58d50cbaa3962f922990fee700403.1687444823.git.pidge@baylibre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 10:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183317

Hello Eil=C3=ADs,

On Thu, 22 Jun 2023 15:42:16 +0100
Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibre.com> wrote:

> Tracking https://gitlab.freedesktop.org/wayland/weston/-/issues/488
> we're keeping -Ddeprecated-launcher-logind but plans should be made to
> remove this/work around.
>=20
> We also need to add xcb-util-cursor from meta-openembedded as this is
> now required for ptest. When this is pulled we can remove from meta-oe.
>=20
> Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibr=
e.com>
> ---
>  .../wayland/{weston_11.0.1.bb =3D> weston_12.0.1.bb}    | 11 ++++++++---
>  .../xorg-lib/xcb-util-cursor_0.1.4.bb                 | 10 ++++++++++

This is triggering failures on no-x11 builds:

stdio: ERROR: Nothing PROVIDES 'xcb-util' (but /home/pokybuild/yocto-worker=
/no-x11/build/meta/recipes-graphics/wayland/weston_12.0.1.bb DEPENDS on or =
otherwise requires it)
stdio: ERROR: Nothing PROVIDES 'xcb-util-cursor' (but /home/pokybuild/yocto=
-worker/no-x11/build/meta/recipes-graphics/wayland/weston_12.0.1.bb DEPENDS=
 on or otherwise requires it)
stdio: ERROR: Nothing RPROVIDES 'weston' (but /home/pokybuild/yocto-worker/=
no-x11/build/meta/recipes-graphics/wayland/weston_12.0.1.bb, /home/pokybuil=
d/yocto-worker/no-x11/build/meta/recipes-graphics/wayland/weston-init.bb, /=
home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/packagegroup=
s/packagegroup-core-weston.bb RDEPENDS on or otherwise requires it)
stdio: ERROR: Nothing RPROVIDES 'weston-init' (but /home/pokybuild/yocto-wo=
rker/no-x11/build/meta/recipes-graphics/wayland/weston_12.0.1.bb, /home/pok=
ybuild/yocto-worker/no-x11/build/meta/recipes-graphics/wayland/weston-init.=
bb, /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/package=
groups/packagegroup-core-weston.bb RDEPENDS on or otherwise requires it)
stdio: ERROR: Nothing RPROVIDES 'weston-dev' (but /home/pokybuild/yocto-wor=
ker/no-x11/build/meta/recipes-graphics/wayland/weston_12.0.1.bb RDEPENDS on=
 or otherwise requires it)
stdio: ERROR: Nothing RPROVIDES 'weston-init-dev' (but /home/pokybuild/yoct=
o-worker/no-x11/build/meta/recipes-graphics/wayland/weston-init.bb RDEPENDS=
 on or otherwise requires it)
stdio: ERROR: Nothing RPROVIDES 'weston-examples' (but /home/pokybuild/yoct=
o-worker/no-x11/build/meta/recipes-graphics/packagegroups/packagegroup-core=
-weston.bb RDEPENDS on or otherwise requires it)

Full logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7354/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7354/step=
s/15/logs/stdio

Patch "weston: Cleanup and fix x11 and xwayland dependencies"
(https://lore.kernel.org/openembedded-core/20230622203913.183451-1-tom.hoch=
stein@nxp.com/T/#u)
was sent a few hours after yours by Tom (in Cc:). Do think it could fix
this error? FYI I'm running a new test build with Tom's patch and
without this series.

Additionally a new recipe in core needs a maintainer, and as such it is
warning:

WARNING: xcb-util-cursor-0.1.4-r0 do_fetch: QA Issue: Recipe xcb-util-curso=
r in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-graphics/xorg-l=
ib/xcb-util-cursor_0.1.4.bb does not have an assigned maintainer. Please ad=
d an entry into meta/conf/distro/include/maintainers.inc. [missing-metadata]

Full log:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5511/step=
s/13/logs/stdio

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

