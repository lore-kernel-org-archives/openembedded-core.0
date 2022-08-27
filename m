Return-Path: <edwin@etorok.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF57ECAAD1
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:45:24 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.51805.1661625918528184799
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@etorok.net header.s=gm1 header.b=imTAG8MT;
 spf=pass (domain: etorok.net, ip: 217.70.183.194, mailfrom: edwin@etorok.net)
Received: (Authenticated sender: edwin@etorok.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 12DD440008;
	Sat, 27 Aug 2022 18:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etorok.net; s=gm1;
	t=1661625916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AF7sF12IfAgSmGMt89g7hRZT6qr+Xtq/GVqnn8u7uaU=;
	b=imTAG8MTfto5zw+ZpnqmqSXtUkgqaiBiMGF4J0/EhBIlx5SSG2l3TbTnBoqL8HbiAz+9M2
	kWhU9pkks4SUj5xNFdB24ofy8vwRxDXNpl5oMFmOtv59oBuxbkUirx/5aAEFBqR1tmb4OQ
	F5oES5HLSfpV7wUJGtDfa/zCbt2tPZzyrVwcObV8uU3sQxGLUu8r5WL/Mu2Ndl4nU2TkBR
	ZqiXN8XgPPUSrclGDqpafWsyRBBSBFgN0lKamThV9U9+wZlRhBZTgTM6SfNTCGgxfFWD5m
	cT7FXDoft1mC9UiasHxhGJFNh205lBNeVue6LfuXXVC0wXor8a8wDO69UbR91g==
Message-ID: <e40af25a1dedc9780f107df17cfb81320235653e.camel@etorok.net>
Subject: Re: [OE-core] [PATCH] xz: do not OOM with 3x builds, lower memlimit
From: Edwin =?ISO-8859-1?Q?T=F6r=F6k?= <edwin@etorok.net>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Sat, 27 Aug 2022 19:45:14 +0100
In-Reply-To: 
 <CANNYZj8GigGudbwsES8zvfKGUs9sr+wHTRZMP2uut45JtDgOcQ@mail.gmail.com>
References: <2ed08c8656181cf2b4495978e28e70c5274fb7e7.camel@etorok.net>
	 <CANNYZj8GigGudbwsES8zvfKGUs9sr+wHTRZMP2uut45JtDgOcQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:45:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169966

On Sat, 2022-08-27 at 20:23 +0200, Alexander Kanavin wrote:
> I'm not sure this is right as a global change. This fixes situations
> where 3 xz instances run on your specific setup, what about 4? Or 5?
> Or n instances for all n in N?

Thanks for the quick reply.

I'd like to make the defaults safe for everyone, perhaps a simple fix
would be to set XZ_MEMLIMIT to just below 100/BB_NUMBER_THREADS by
default?

>=20
> I think you need to limit the amount of threads rather to match
> available RAM, and do it via site.conf and not bitbake.conf. ?=3D

I don't think it is currently possible to limit the number of 'xz'
processes though.
(Note that they are 3 distinct 'xz' processes, so setting XZ_THREADS
has no effect, which controls only the number of threads that a single
'xz' process would use).

The closest would be BB_NUMBER_THREADS, but that controls a lot of
other things too (parallel package fetch perhaps)?

> assignment is used in bitbake.conf exactly for that purpose.

Currently the openembedded defaults don't work: the build always OOMs,
at least on this particular target (or one with a large enough rootfs).

The defaults should be conservative enough so they work on all systems
(i.e. memlimit * number of xz processes < 100%), the user can then
further tweak the memlimit vs number of processes (note *not* threads)
tradeoff in their local conf file as you suggest.

Best regards,
--Edwin

>=20
> Alex
>=20
> On Sat, 27 Aug 2022 at 20:15, Edwin T=C3=B6r=C3=B6k via lists.openembedde=
d.org
> <edwin=3Detorok.net@lists.openembedded.org> wrote:
> >=20
> > By default a build such as [1] might run 3 'xz' in parallel:
> > ```
> > Currently=C2=A0 3 running tasks (11878 of 11883)=C2=A0 99%
> > > #################################################################
> > > #####
> > #### |
> > 0: demo-coreip-xfce4-1.0-r0 do_image_ext4 - 3m17s (pid 2088739)
> > 1: demo-coreip-xfce4-1.0-r0 do_image_tar - 3m16s (pid 2088743)
> > 2: demo-coreip-xfce4-1.0-r0 do_image_wic - 3m16s (pid 2088745)
> > ```
> >=20
> > However the default memory usage limit of `xz` is 50% each, so this
> > will
> > attempt to use 150% memory, and it gets OOM killed by systemd-oomd
> > on
> > Fedora 36.
> > ```
> > Aug 27 18:38:57 fedora systemd-oomd[3150]: Killed
> > /user.slice/user-1000.slice/user@1000.service/app.slice/app-
> > org.gnome.Terminal.slice/vte-spawn-2d92eb7b-b005-41b4-a786-
> > fc8c0d360ce3.scope due to memory used (66890584064) / total
> > (67332812800) and swap used (7744446464) / total (8589930496) being
> > more than 90.00%
> > ```
> >=20
> > Even with systemd-oomd turned off it'd eventually start swapping
> > heavily
> > on a system with 64GiB of physical memory and 8GiB of swap.
> >=20
> > Reduce memory limit on xz so that we can run 3 in parallel without
> > driving the host close to or OOM. 25% seems to work on this
> > particular
> > build and allows it to complete successfully.
> >=20
> > [1] https://github.com/sifive/freedom-u-sdk/tree/2022.06.00
> >=20
> > Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin@etorok.net>
> > ---
> > =C2=A0meta/conf/bitbake.conf | 3 ++-
> > =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 2a3cf6f8aa..48ba52c12c 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -857,7 +857,8 @@ BB_NUMBER_THREADS ?=3D "${@oe.utils.cpu_count()}"
> > =C2=A0PARALLEL_MAKE ?=3D "-j ${@oe.utils.cpu_count()}"
> >=20
> > =C2=A0# Default parallelism and resource usage for xz
> > -XZ_MEMLIMIT ?=3D "50%"
> > +# A build might run 3 'xz' in parallel, so don't exhaust memory
> > +XZ_MEMLIMIT ?=3D "25%"
> > =C2=A0XZ_THREADS ?=3D "${@oe.utils.cpu_count(at_least=3D2)}"
> > =C2=A0XZ_THREADS[vardepvalue] =3D "1"
> > =C2=A0XZ_DEFAULTS ?=3D "--memlimit=3D${XZ_MEMLIMIT} --threads=3D${XZ_TH=
READS}"
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169939):
> > https://lists.openembedded.org/g/openembedded-core/message/169939
> > Mute This Topic: https://lists.openembedded.org/mt/93294351/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20


