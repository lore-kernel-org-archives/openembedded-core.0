Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.10383.1608300458637175232
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 06:07:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: kory.maincent@bootlin.com)
X-Originating-IP: 78.113.208.212
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net [78.113.208.212])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id CFD156000B;
	Fri, 18 Dec 2020 14:07:35 +0000 (UTC)
Date: Fri, 18 Dec 2020 15:07:34 +0100
From: "Kory Maincent" <kory.maincent@bootlin.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] ltp: fix rpc build error
Message-ID: <20201218150734.5763d3bf@kmaincent-XPS-13-7390>
In-Reply-To: <8a74e57385a4497c9e65bb3d433207df@XBOX03.axis.com>
References: <20201217140756.30688-1-kory.maincent@bootlin.com>
	<ce781b6c4aa644f3ba1f322396065bcb@XBOX03.axis.com>
	<20201218095214.267d7c2a@kmaincent-XPS-13-7390>
	<8a74e57385a4497c9e65bb3d433207df@XBOX03.axis.com>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Dec 2020 12:06:06 +0000
Peter Kjellerstedt <peter.kjellerstedt@axis.com> wrote:

> > I did not notice but it brings an error and I sent a V3 with it.
> > Your review returns this error:
> > bb.data_smart.ExpansionError: Failure expanding variable incdir,
> > expression was ${incdir} which triggered exception Exception: variable
> > incdir references itself! =20
>=20
> Duh, of course. That is because there is no incdir variable, so=20
> "${incdir}" will expand to "\${incdir}". The real variable is called=20
> includedir.=20
>=20
> This of course brings the question whether ltp expects incdir or=20
> includedir, and if it is the latter, then your changes so far have not=20
> made any difference when it comes to includedir, which means they=20
> shouldn't be needed.

Your right it needs only ${libdir}.
In fact, the issue was the recipe could not find tirpc pkgconfig.
I have chosen to export libdir because
PKG_CONFIG_DIR=3D${STAGING_DIR_HOST}${libdir}/pkgconfig
But maybe it is better to add the path to PKG_CONFIG_PATH?

Regards,

K=C3=B6ry
