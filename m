Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83A6E668A3
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 10:50:32 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.16244.1732531831052129053
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 02:50:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tFWfl-00042H-A7; Mon, 25 Nov 2024 11:50:29 +0100
Message-ID: <9bed2a3b5cc813ef7e245f231918311f5ed065b6.camel@pengutronix.de>
Subject: Re: [PATCH 3/3] barebox: move version checksum to common .inc
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Date: Mon, 25 Nov 2024 11:50:28 +0100
In-Reply-To: <CANNYZj-gecZZxzQfHNuBgo+3P+u-YZ6qL-TaJ2ZfVq1cgTrh3Q@mail.gmail.com>
References: <20241125102227.1216656-1-ejo@pengutronix.de>
	 <20241125102227.1216656-3-ejo@pengutronix.de>
	 <CANNYZj-gecZZxzQfHNuBgo+3P+u-YZ6qL-TaJ2ZfVq1cgTrh3Q@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 10:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207733

Am Montag, dem 25.11.2024 um 11:39 +0100 schrieb Alexander Kanavin:
> The actual .inc isn't in the commit.

Indeed, this somehow slipped through..
Will fix. Thanks!

Enrico

> Alex
>=20
> On Mon, 25 Nov 2024 at 11:23, Enrico J=C3=B6rns <ejo@pengutronix.de> wrot=
e:
> >=20
> > This makes it more obvious to update barebox and barebox-tools together
> > and should help the AUH to update both.
> >=20
> > Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > ---
> > =C2=A0meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb | 3 ++-
> > =C2=A0meta/recipes-bsp/barebox/barebox_2024.10.0.bb=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 3 ++-
> > =C2=A02 files changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb b/meta=
/recipes-
> > bsp/barebox/barebox-tools_2024.10.0.bb
> > index 386656f7ad..25d6a5c062 100644
> > --- a/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
> > +++ b/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
> > @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df5125d13e000=
b9ca1f0d3364286c4192"
> > =C2=A0DEPENDS =3D "bison-native flex-native libusb1"
> >=20
> > =C2=A0SRC_URI =3D "https://barebox.org/download/barebox-${PV}.tar.bz2"
> > -SRC_URI[sha256sum] =3D "955b20bfa7358732d2c0c09ccfd4c1a69087b7e2c610b1=
6dee7442d71a5af88d"
> > +
> > +require barebox-version.inc
> >=20
> > =C2=A0S =3D "${WORKDIR}/barebox-${PV}"
> > =C2=A0B =3D "${WORKDIR}/build"
> > diff --git a/meta/recipes-bsp/barebox/barebox_2024.10.0.bb b/meta/recip=
es-
> > bsp/barebox/barebox_2024.10.0.bb
> > index c886fcfba3..aa63be4080 100644
> > --- a/meta/recipes-bsp/barebox/barebox_2024.10.0.bb
> > +++ b/meta/recipes-bsp/barebox/barebox_2024.10.0.bb
> > @@ -14,4 +14,5 @@ inherit barebox
> > =C2=A0SRC_URI =3D "https://barebox.org/download/barebox-${PV}.tar.bz2=
=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file=
://0001-lib-lz4-use-lz4-instead-of-lz4c.patch=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> > -SRC_URI[sha256sum] =3D "955b20bfa7358732d2c0c09ccfd4c1a69087b7e2c610b1=
6dee7442d71a5af88d"
> > +
> > +require barebox-version.inc
> > --
> > 2.39.5
> >=20
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

