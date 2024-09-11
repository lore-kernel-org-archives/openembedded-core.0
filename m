Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DDAEE4992
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 11:16:53 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.19274.1726053406201451007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 04:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1soLL2-00072Q-5z; Wed, 11 Sep 2024 13:16:44 +0200
Message-ID: <2ff3be0dce3a39f59ba7d0dc2dc78fc43a54bcee.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH v5 1/7] barebox: add initial support
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Date: Wed, 11 Sep 2024 13:16:43 +0200
In-Reply-To: <CANNYZj92yih_U+qQ=Ow8sOV6BZ2vWZFXmwajzT6e=bHe=ej6gQ@mail.gmail.com>
References: <20240910184143.2820792-1-ejo@pengutronix.de>
	 <20240910184143.2820792-2-ejo@pengutronix.de>
	 <CANNYZj92yih_U+qQ=Ow8sOV6BZ2vWZFXmwajzT6e=bHe=ej6gQ@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 11:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204380

Am Mittwoch, dem 11.09.2024 um 12:15 +0200 schrieb Alexander Kanavin:
> On Tue, 10 Sept 2024 at 20:42, Enrico J=C3=B6rns via lists.openembedded.o=
rg
> <ejo=3Dpengutronix.de@lists.openembedded.org> wrote:
>=20
> > --- /dev/null
> > +++ b/meta/recipes-bsp/barebox/barebox_2024.08.0.bb
> > @@ -0,0 +1,3 @@
> > +require barebox.inc
> > +
> > +SRC_URI[sha256sum] =3D "b08a762da8d63dd18b4f2d9f5d0a8da001b6e608d1b3ef=
f6dcebc6a2e575d535"
>=20
> The checksum should be in barebox-common.inc, so it's not repeated in
> barebox-tools.

I kept it in the version-specific .bb file since this is the only informati=
on that would necessarily
change when bumping the PV.

> Is there a reason to set S and B explicitly? They look like defaults to m=
e.

S is the default actually (${BPN}-${PV}). I can omit that.
B defaults to S in bitbake.conf and is only changed by build tool-specific =
classes.

> Also, is there a need to keep barebox.inc separate? Why not merge that
> into barebox.bb?

Personally, I find it easier to diff recipes when they don't move with ever=
y version bump.
Splitting .inc and .bb up is one way to achieve this.

I see a notable number of recipes having a .inc that is required by only a =
single .bb.
Is there any generic rule when to (not) use a .inc file?

For barebox specifically, it makes the creation of recipes for a custom bar=
ebox easier since one can
decide to either .bbappend the existing recipe or just create a new .bb and=
 only require the .inc.

Regards, Enrico

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

