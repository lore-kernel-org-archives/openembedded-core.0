Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48703C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 08:38:24 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.79674.1723192695376593953
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Aug 2024 01:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1scL8X-0007zK-Di; Fri, 09 Aug 2024 10:38:13 +0200
Message-ID: <df46d05a2a3f117b0f2d2b863946012dfecf8e3d.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH] archiver.bbclass: fix
 BB_GENERATE_MIRROR_TARBALLS checking
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "yocto@pengutronix.de" <yocto@pengutronix.de>
Date: Fri, 09 Aug 2024 10:38:10 +0200
In-Reply-To: <DB5PR02MB102134D57C3C7A57E7D625679EFB92@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240808110409.4077831-1-ejo@pengutronix.de>
	 <DB5PR02MB102134D57C3C7A57E7D625679EFB92@DB5PR02MB10213.eurprd02.prod.outlook.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 08:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203159

Am Donnerstag, dem 08.08.2024 um 12:16 +0000 schrieb Peter Kjellerstedt:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org=C2=A0<openembedded-core@=
lists.openembedded.org> On
> > Behalf Of Enrico J=C3=B6rns
> > Sent: den 8 augusti 2024 13:04
> > To: openembedded-core@lists.openembedded.org
> > Cc: yocto@pengutronix.de
> > Subject: [OE-core] [PATCH] archiver.bbclass: fix BB_GENERATE_MIRROR_TAR=
BALLS checking
> >=20
> > The variable 'have_mirror_tarballs' is used as a boolean while it is
> > actually the result of 'd.getVar('BB_GENERATE_MIRROR_TARBALLS')' and
> > thus a string.
> >=20
> > Fix this by converting it into a boolean before using it.
> >=20
> > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > ---
> > =C2=A0meta/classes/archiver.bbclass | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbcl=
ass
> > index 9d286224d6..9c8b0daf31 100644
> > --- a/meta/classes/archiver.bbclass
> > +++ b/meta/classes/archiver.bbclass
> > @@ -339,7 +339,7 @@ python do_ar_mirror() {
> > =C2=A0=C2=A0=C2=A0=C2=A0 dl_dir =3D d.getVar('DL_DIR')
> > =C2=A0=C2=A0=C2=A0=C2=A0 mirror_exclusions =3D (d.getVar('ARCHIVER_MIRR=
OR_EXCLUDE') or '').split()
> > =C2=A0=C2=A0=C2=A0=C2=A0 mirror_mode =3D d.getVarFlag('ARCHIVER_MODE', =
'mirror')
> > -=C2=A0=C2=A0=C2=A0 have_mirror_tarballs =3D d.getVar('BB_GENERATE_MIRR=
OR_TARBALLS')
> > +=C2=A0=C2=A0=C2=A0 have_mirror_tarballs =3D d.getVar('BB_GENERATE_MIRR=
OR_TARBALLS') =3D=3D "1"
>=20
> May I suggest:
>=20
> =C2=A0=C2=A0=C2=A0 have_mirror_tarballs =3D oe.types.boolean(d.getVar('BB=
_GENERATE_MIRROR_TARBALLS'))
>=20
> instead?

Oh, did not know this helper exists. Thank you for the hint!
Will send a v2.

Regards, Enrico

> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 if mirror_mode =3D=3D 'combined':
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 destdir =3D d.getVar('=
ARCHIVER_COMBINED_MIRRORDIR')
> > --
> > 2.39.2
>=20
> //Peter
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

