Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F0CEE49A2
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 12:27:23 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.20419.1726057638509958968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 05:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1soMRI-0002m8-Fb; Wed, 11 Sep 2024 14:27:16 +0200
Message-ID: <f08eca9e902f391e26312b7cdbdb98be85f50661.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH v5 1/7] barebox: add initial support
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Date: Wed, 11 Sep 2024 14:27:16 +0200
In-Reply-To: <CANNYZj-0LGjTFq8+wfQbjzn=NPnf60abWHLzMq=Aw+XUhsQc0g@mail.gmail.com>
References: <20240910184143.2820792-1-ejo@pengutronix.de>
	 <20240910184143.2820792-2-ejo@pengutronix.de>
	 <CANNYZj92yih_U+qQ=Ow8sOV6BZ2vWZFXmwajzT6e=bHe=ej6gQ@mail.gmail.com>
	 <2ff3be0dce3a39f59ba7d0dc2dc78fc43a54bcee.camel@pengutronix.de>
	 <CANNYZj-0LGjTFq8+wfQbjzn=NPnf60abWHLzMq=Aw+XUhsQc0g@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 12:27:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204383

Am Mittwoch, dem 11.09.2024 um 14:10 +0200 schrieb Alexander Kanavin:
> On Wed, 11 Sept 2024 at 13:16, Enrico J=C3=B6rns <ejo@pengutronix.de> wro=
te:
> > I kept it in the version-specific .bb file since this is the only infor=
mation that would
> > necessarily
> > change when bumping the PV.
>=20
> Yes, but barebox and barebox-tools would have to be upgraded in
> lockstep,

Not necessarily, despite it probably makes sense.

> and sharing the checksum between them would ensure it
> actually happens. Also, the resulting diff becomes shorter.

By one line, but yes.

> > > Also, is there a need to keep barebox.inc separate? Why not merge tha=
t
> > > into barebox.bb?
> >=20
> > Personally, I find it easier to diff recipes when they don't move with =
every version bump.
> > Splitting .inc and .bb up is one way to achieve this.
> >=20
> > I see a notable number of recipes having a .inc that is required by onl=
y a single .bb.
> > Is there any generic rule when to (not) use a .inc file?
>=20
> These recipes are a relic from times when oe-core had multiple
> versions of the same things. Over time, we merge the .inc into .bb, so
> there's less of those now.

Ok.

> I prefer having everything in a single .bb, because splitting
> functionality between multiple files hurts readability a lot.
>=20
> Including .inc from a different layer is an anti-pattern, and I'd be
> strongly against doing that.

But a commonly used one in the context of bootloaders I guess:

https://github.com/search?q=3D%22require+recipes-bsp%2Fu-boot%2Fu-boot.inc%=
22&type=3Dcode

What are the better options here?
Inheriting the .bb? Making a .bbclass?


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

