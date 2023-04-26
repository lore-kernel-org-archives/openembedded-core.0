Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D294C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 21:01:08 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.4495.1682542859143620495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 14:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HEupWMVf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 28A3BFF808;
	Wed, 26 Apr 2023 21:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682542857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qji+wR7eQLphhmgpQI+fA0DCqUrThp+VvKQKKl7BCLI=;
	b=HEupWMVfwIxIgpsFY8mCdvUpQHlEBgCxTwsKt60QMicDoZwSNmswZB8b4TvNB+ppj8NmV3
	EAeueWlREslkCnrTBlOwF7swXOeaOzm98bk3mAyFRyoOkQgfQ/sNrfhzcO1jjTnc3hYFPf
	QlvR59tXCw5az3RUYRzTEMCSdS0CohE62KfUffOMwGDDrlILkZ8QZmGZUyEKUWK5xIwqGb
	3X9ex2UD9yfWNSrt/V/IJCG1x29axrE+ImAiTNBxxh0jN+lTgJoW2Qm7cXCRuKgqjQqrN2
	qF3qTAWFNPA5HZUOz/5aDxgQf3ZvEa9Ldb7qH/UNbUXwhCIi64hSQBSHCcD04g==
Date: Wed, 26 Apr 2023 23:00:54 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Enrico =?UTF-8?Q?J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, Richard
 Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
 <alex.kanavin@gmail.com>, alexandre.belloni@bootlin.com
Subject: Re: [OE-core] [PATCH v3 1/9] barebox: add initial support
Message-ID: <20230426230054.18414ca5@booty>
In-Reply-To: <20230425184720.456896-2-ejo@pengutronix.de>
References: <20230425184720.456896-1-ejo@pengutronix.de>
	<20230425184720.456896-2-ejo@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 21:01:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180456

Hello Enrico,

On Tue, 25 Apr 2023 20:47:12 +0200
Enrico J=C3=B6rns <ejo@pengutronix.de> wrote:

> From: Marco Felsch <m.felsch@pengutronix.de>
>=20
> This adds the support for the barebox bootloader to oe-core. The recipe
> is based on the recipe found in meta-ptx [1] with a few minor adaptions.
>=20
> This basic support includes the bootloader and the target tools to
> interact with the bootloader. The host tools support is not part of
> this commit. This will be added later on as separate recipe.
>=20
> [1] https://github.com/pengutronix/meta-ptx/tree/master/recipes-bsp/bareb=
ox
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
> ---
>  meta/conf/distro/include/maintainers.inc      |   1 +
>  meta/recipes-bsp/barebox/barebox.inc          | 144 ++++++++++++++++++
>  meta/recipes-bsp/barebox/barebox_2023.04.0.bb |   3 +
>  3 files changed, 148 insertions(+)
>  create mode 100644 meta/recipes-bsp/barebox/barebox.inc
>  create mode 100644 meta/recipes-bsp/barebox/barebox_2023.04.0.bb
>=20
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 682ec2cfdf..86d5519489 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -54,6 +54,7 @@ RECIPE_MAINTAINER:pn-automake =3D "Robert Yang <liezhi.=
yang@windriver.com>"
>  RECIPE_MAINTAINER:pn-avahi =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-babeltrace =3D "Alexander Kanavin <alex.kanavin@gma=
il.com>"
>  RECIPE_MAINTAINER:pn-babeltrace2 =3D "Alexander Kanavin <alex.kanavin@gm=
ail.com>"
> +RECIPE_MAINTAINER:pn-barebox =3D "Enrico J=C3=B6rns <yocto@pengutronix.d=
e>"

There's been another build failure, but I must say it looks nonsense to
me -- perhaps others can shed some light on it:

AssertionError:=20
Unable to find recipes for the following entries in maintainers.inc:
barebox

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1321/ste=
ps/14/logs/stdio

Some lines later on the same log file, there is a QEMU error in
test_boot_barebox:

2023-04-26 16:37:04,021 - oe-selftest - INFO - barebox.BareboxTest.test_boo=
t_barebox (subunit.RemotedTestCase)
2023-04-26 16:37:04,022 - oe-selftest - INFO -  ... ERROR
2023-04-26 16:37:04,023 - oe-selftest - INFO - 1: 1/47 367/530 (24221.61s) =
(0 failed) (barebox.BareboxTest.test_boot_barebox)
2023-04-26 16:37:04,023 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeq=
a/utils/commands.py", line 372, in runqemu
    qemu.start(params=3Dqemuparams, ssh=3Dssh, runqemuparams=3Drunqemuparam=
s, launch_cmd=3Dlaunch_cmd, discard_writes=3Ddiscard_writes)
  File "/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeq=
a/targetcontrol.py", line 183, in start
    raise RuntimeError("%s - FAILED to start qemu - check the task log and =
the boot log" % self.pn)
RuntimeError: core-image-minimal - FAILED to start qemu - check the task lo=
g and the boot log
During handling of the above exception, another exception occurred:
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeq=
a/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeq=
a/selftest/cases/barebox.py", line 36, in test_boot_barebox
    with runqemu('core-image-minimal', ssh=3DFalse, runqemuparams=3D'nograp=
hic',
  File "/usr/lib/python3.8/contextlib.py", line 113, in __enter__
    return next(self.gen)
  File "/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeq=
a/utils/commands.py", line 378, in runqemu
    raise Exception(msg)
Exception: core-image-minimal - FAILED to start qemu - check the task log a=
nd the boot log

Sadly the work directory for that build has already gone. :-/

Best regards,
Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

