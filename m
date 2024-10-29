Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC0D4D3A69F
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 20:47:34 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.4789.1730234852756392967
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 13:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5t7i-0005yl-8O; Tue, 29 Oct 2024 21:47:30 +0100
Message-ID: <89c6f62a6000f38d58a5bb547c03fa0d18cdc6fa.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH v2 2/9] busybox: disable defconfig options
 from simpler fragments
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Andrej Valek <andrej.v@skyrain.eu>, Richard Purdie
	 <richard.purdie@linuxfoundation.org>
Cc: yocto@pengutronix.de, openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2024 21:47:29 +0100
In-Reply-To: <203632ac-7a95-40db-aaab-54bca3861e52@skyrain.eu>
References: <20241028082913.418505-1-ejo@pengutronix.de>
	 <20241028082913.418505-3-ejo@pengutronix.de>
	 <824ea7ce-b5d0-4da3-8e3d-5445373e1e9a@skyrain.eu>
	 <6649f86317aa3a1eafdb3d98c7f814b6e4807d94.camel@pengutronix.de>
	 <203632ac-7a95-40db-aaab-54bca3861e52@skyrain.eu>
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
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 20:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206533

Hi Andrej,

thanks for your review!

Am Dienstag, dem 29.10.2024 um 17:32 +0100 schrieb Andrej Valek:
> Hello Enrico,
>=20
> On 28.10.2024 11:39, Enrico J=C3=B6rns wrote:
> > Hej Andrej,
> >=20
> > Am Montag, dem 28.10.2024 um 10:06 +0100 schrieb Andrej Valek:
> > > =C2=A0=C2=A0Hello Enrico,
> > > =C2=A0=20
> > > =C2=A0=C2=A0I tried to follow (and applied) your patch, but it looks =
little bit inconsistent to me. In
> > > the
> > > first round you enabled SHAx_HWACCEL, which is broken on some archite=
ctures. That's the
> > > reason,
> > > why is disabled by default. Ok, so first apply looks like this:
> > let me rephrase my commit message.
> >=20
> > The SHAx_HWACCEL is broken on some architectures, right.
> > However, when you take the defconfig, without the fragments, it will cu=
rrently be enabled.
> > Regardless of what's in my patch.
> >=20
> > Why? Because CONFIG_SHA1_HWACCEL in Busybox' kconfig is 'default y', ha=
s no dependency on other
> > options and is not listed in the 'defconfig' file so far.
> >=20
> > Thus, my first patch should not change the current situation.
> Ok, I see the point. So basically you can drop the sha1sum.cfg and=20
> sha256sum.cfg and merge it to defconfing. The result will be, that the=
=20
> acceleration is disabled.

Just to get it right: Do we talk about the HWACCEL only or about enabling S=
HA1SUM and SHA256SUM
unconditionally and fully removing the fragments?

Personally, I'd be fine with this since the algorithm are quite essential a=
nyway.

If that's the only thing to change, I'd start making a v3 for it.

> >=20
> > > =C2=A0=C2=A0Anyway, there was one commit in the usptream which was to=
uching the acceleration. So I have
> > > to
> > > try it on the broken machine and see if it's still broken or not.
> > If you refer to oe-core upstream, yes there have been changes.
> > This is why I needed to rebase and rework my branch.
> > Or are there other changes I am not aware of, yet?
> Not sure if you caught the point. I mean, that I will take a look on the=
=20
> upstream fixes for acceleration and then we can enable it by default.

Ok, so you referred to *busybox* upstream, not oe-core. Got it.

I've found https://git.busybox.net/busybox/commit/?id=3Dbf57f732a5b6842f6fa=
3e0f90385f039e5d6a92c
Is this the fix you referred to?

> > > > [...]
> > > =C2=A0=20
> So if the result is, that the configuration hasn't been changed at the=
=20
> end, I'm fine with the changes you did ;).

Sounds good!

Regards, Enrico

> Regards,
> Andrej
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

