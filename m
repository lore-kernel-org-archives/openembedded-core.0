Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A5DEEB575
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 09:26:21 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.44054.1726133176071681477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 02:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1sog5e-0002BG-2f; Thu, 12 Sep 2024 11:26:14 +0200
Message-ID: <3c89939081b8134d95e30088c9f2af92dcee4ea3.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH v5 1/7] barebox: add initial support
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Date: Thu, 12 Sep 2024 11:26:13 +0200
In-Reply-To: <CANNYZj_jvG9_5fgNJshHhKsWFOYvuM0BzXTBC6L-97y_bUAmaQ@mail.gmail.com>
References: <20240910184143.2820792-1-ejo@pengutronix.de>
	 <20240910184143.2820792-2-ejo@pengutronix.de>
	 <CANNYZj92yih_U+qQ=Ow8sOV6BZ2vWZFXmwajzT6e=bHe=ej6gQ@mail.gmail.com>
	 <2ff3be0dce3a39f59ba7d0dc2dc78fc43a54bcee.camel@pengutronix.de>
	 <CANNYZj-0LGjTFq8+wfQbjzn=NPnf60abWHLzMq=Aw+XUhsQc0g@mail.gmail.com>
	 <f08eca9e902f391e26312b7cdbdb98be85f50661.camel@pengutronix.de>
	 <CANNYZj_jvG9_5fgNJshHhKsWFOYvuM0BzXTBC6L-97y_bUAmaQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 09:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204429

Am Mittwoch, dem 11.09.2024 um 16:20 +0200 schrieb Alexander Kanavin:
> On Wed, 11 Sept 2024 at 14:27, Enrico J=C3=B6rns <ejo@pengutronix.de> wro=
te:
>=20
> > But a commonly used one in the context of bootloaders I guess:
> >=20
> > https://github.com/search?q=3D%22require+recipes-bsp%2Fu-boot%2Fu-boot.=
inc%22&type=3Dcode
>=20
> Sadly yes. The reason I don't like it is that changing anything in
> u-boot.inc in oe-core may break multiple BSP layers, and angry people
> will come shouting at the person who made the change, even though that
> file is actually private to the original recipe.
>=20
> > What are the better options here?
> > Inheriting the .bb? Making a .bbclass?
>=20
> Making a .bbclass, putting stuff like COMPATIBLE_MACHINE into a
> .bbappend, or a hard recipe fork that doesn't attempt to reuse the
> .inc from another layer.

For me, a bbclass sounds most appropriate here.
For a bootloader recipe it is more likely that you will need custom SRC_URI=
, COMPATIBLE_MACHINE, etc
than with other conventional recipes. And the need to have a hard copy of t=
he recipe everywhere will
somehow make the oe-core mainlining absurd.

v6 incoming.

Thanks for your input!
Enrico

> Alex
>=20

--=20
Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Enrico J=C3=B6rns=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
Embedded Linux Consulting & Support=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| https://www.pengutronix.de/ |
Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| Phone: +49-5121-206917-180=C2=A0=C2=A0|
31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Fax:=C2=A0=C2=
=A0=C2=A0+49-5121-206917-9=C2=A0=C2=A0=C2=A0=C2=A0|

