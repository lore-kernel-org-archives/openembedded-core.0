Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A16EB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 09:34:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.7485.1687426467976471693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 02:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Gk7sem8Q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687426466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ja6Z2tejpGTgSCIABN9rUMOUITvmBqTj6JAIxIoyUh0=;
	b=Gk7sem8QJ1GFLGjE7YI78gCFnhG7i+ONJebJt+2RKCFXc9cdSwL0Sl3VvVzlR+DrTQ1ZO5
	qh1Mmr/ESq6WFO525TiU5gmObeCZqJILSGMpwJi+D5J3nUxBVJc3eTtkdUbgkp8ud46lfh
	0W4KtLVWtB3GgsloF/M5Fso+4phoQ9kaN7rnRYosbkK9PVxzkG9YfrG5SXOAPNaVVxgoXR
	QAZSU8gdaRog6h4eP6KWTQIKDSCXY5QJA5caFsvY3ziWxRP9HQ3IUa+SvKE34dbuSfnUUT
	R8tz7OTvngUbFksCM9kLHKU05OLXLQRTzQjBJvEPCKAZWSKZGmMgpf3B0syPTQ==
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFA98E0008;
	Thu, 22 Jun 2023 09:34:25 +0000 (UTC)
Date: Thu, 22 Jun 2023 11:34:24 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Jose Quaresma" <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Jose Quaresma
 <jose.quaresma@foundries.io>, Ola x Nilsson <Ola.x.Nilsson@axis.com>, Peter
 Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [OE-core] [PATCH V3 1/3] kernel-module-split: make autoload and
 probeconf distribution specific
Message-ID: <20230622113424.2c9a5e4d@booty>
In-Reply-To: <CANPvuRnZX+pVFy0gR_3Xf2P81As+2-yEKyu=112VJr5g47e4_g@mail.gmail.com>
References: <20230620221942.2801107-1-jose.quaresma@foundries.io>
	<20230621222232.6575ab6b@booty>
	<CANPvuRnZX+pVFy0gR_3Xf2P81As+2-yEKyu=112VJr5g47e4_g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 09:34:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183232

Hi Jose,

On Thu, 22 Jun 2023 00:18:03 +0100
"Jose Quaresma" <quaresma.jose@gmail.com> wrote:

> Hi Luca,
>=20
> Luca Ceresoli <luca.ceresoli@bootlin.com> escreveu no dia quarta,
> 21/06/2023 =C3=A0(s) 21:22:
>=20
> > Hi Jose,
> >
> > On Tue, 20 Jun 2023 22:19:42 +0000
> > "Jose Quaresma" <quaresma.jose@gmail.com> wrote:
> > =20
> > > Also take the oportunity to only add configuration files to FILES
> > > and CONFFILES when they exist and are used.
> > >
> > > The modules-load.d [1] - Configure kernel modules to load at boot
> > > should install their configuration files in /usr/lib/modules-load.d.
> > >
> > > The modprobe.d [2] - Configuration directory for modprobe
> > > should install their configuration files in /lib/modprobe.d
> > >
> > > [1] https://www.freedesktop.org/software/systemd/man/modules-load.d.h=
tml
> > > [2] https://www.man7.org/linux/man-pages//man5/modprobe.d.5.html
> > >
> > > [YOCTO #12212] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12=
212
> > >
> > > CC: Ola x Nilsson <Ola.x.Nilsson@axis.com>
> > > CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io> =20
> >
> > We're having this error on the autobuilders:
> >
> > ERROR: linux-yocto-6.1.33+gitAUTOINC+db25e51e20_947f660bde-r0 do_packag=
e:
> > QA Issue: linux-yocto: Files/directories were installed but not shipped=
 in
> > any package:
> >   /etc
> >
> > May it be caused by this series?
> > =20
>=20
> I have another mistake on the patch that doesn't work without systemd.
> My fault, on my tests it's been working well because I use the systemd.
> I will send a V4 and helpfully is the last one.
>=20
> Sorry and thanks for testing.

No problem!

In case it helps your debugging, here is a different kind of error that
happened in the same AB run:

ERROR: lttng-modules-2.13.9-r0 do_package: Error executing a python functio=
n in exec_func_python() autogenerated:
...
Exception: FileNotFoundError: [Errno 2] No such file or directory: '/home/p=
okybuild/yocto-worker/beaglebone-alt/build/build/tmp/work/beaglebone_yocto-=
poky-linux-gnueabi/lttng-modules/2.13.9-r0/package/usr/lib/modprobe.d'

https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/6304/ste=
ps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/6236/ste=
ps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/6233/ste=
ps/12/logs/stdio

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

