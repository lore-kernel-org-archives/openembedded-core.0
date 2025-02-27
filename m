Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1544DC021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 11:23:49 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.8472.1740655424246176166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 03:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tnbzS-0004Kx-NB; Thu, 27 Feb 2025 12:23:42 +0100
Message-ID: <3601ee15eb248f29bf38f28f467cf058d425b7f2.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH] barebox.bbclass: use consistent make flags
 for menuconfig
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Ulrich =?ISO-8859-1?Q?=D6lmann?=
	 <u.oelmann@pengutronix.de>
Date: Thu, 27 Feb 2025 12:23:42 +0100
In-Reply-To: <ce6258c66b0a7c5eeeb8cbcc6a38b5d39a8b3bd5.camel@linuxfoundation.org>
References: <20250227092821.2766396-1-ejo@pengutronix.de>
	 <ce6258c66b0a7c5eeeb8cbcc6a38b5d39a8b3bd5.camel@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 11:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211989

Am Donnerstag, dem 27.02.2025 um 11:17 +0000 schrieb Richard Purdie:
> On Thu, 2025-02-27 at 10:28 +0100, Enrico J=C3=B6rns via lists.openembedd=
ed.org wrote:
> > This change is done similar to the change in the kernel.bbclass of
> > commit 8c616bc0 ("kernel: Use consistent make flags for menuconfig").
> >=20
> > This was discovered since the new CONFIG_GCC_VERSION kconfig symbol
> > reflected the host GCC version instead of the target ones after running
> > do_menuconfig.
> >=20
> > Reported-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > ---
> > =C2=A0meta/classes-recipe/barebox.bbclass | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/=
barebox.bbclass
> > index 200ba08326..baba0a2965 100644
> > --- a/meta/classes-recipe/barebox.bbclass
> > +++ b/meta/classes-recipe/barebox.bbclass
> > @@ -53,6 +53,7 @@ EXTRA_OEMAKE =3D " \
> > =C2=A0=C2=A0=C2=A0=C2=A0 PKG_CONFIG=3Dpkg-config-native \
> > =C2=A0=C2=A0=C2=A0=C2=A0 CROSS_PKG_CONFIG=3Dpkg-config \
> > =C2=A0"
> > +KCONFIG_CONFIG_COMMAND:append =3D " ${EXTRA_OEMAKE}"
> > =C2=A0
>=20
> Can we use +=3D here rather than append?

TBH I've copied the line from the kernel.bbclass.
I guess this is because of

  KCONFIG_CONFIG_COMMAND ??=3D "menuconfig"

in the cml1.bbclass.

If I'd replace the weak default there, it should work.

Or would it make sense to just set EXTRA_OEMAKE in cml1.bbclass by default?=
 Like

  KCONFIG_CONFIG_COMMAND ??=3D "menuconfig ${EXTRA_OEMAKE}"


Regards, Enrico

> Cheers,
>=20
> Richard
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

