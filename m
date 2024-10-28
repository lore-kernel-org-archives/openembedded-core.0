Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453C4D13588
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 10:40:00 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.48783.1730111999163811630
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 03:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5NAC-0004n0-SV; Mon, 28 Oct 2024 11:39:57 +0100
Message-ID: <6649f86317aa3a1eafdb3d98c7f814b6e4807d94.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/9] busybox: disable defconfig options from simpler
 fragments
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Andrej Valek <andrej.v@skyrain.eu>, Richard Purdie
	 <richard.purdie@linuxfoundation.org>
Cc: yocto@pengutronix.de, openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2024 11:39:55 +0100
In-Reply-To: <824ea7ce-b5d0-4da3-8e3d-5445373e1e9a@skyrain.eu>
References: <20241028082913.418505-1-ejo@pengutronix.de>
	 <20241028082913.418505-3-ejo@pengutronix.de>
	 <824ea7ce-b5d0-4da3-8e3d-5445373e1e9a@skyrain.eu>
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
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 10:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206441

Hej Andrej,

Am Montag, dem 28.10.2024 um 10:06 +0100 schrieb Andrej Valek:
> =C2=A0Hello Enrico,
> =C2=A0
> =C2=A0I tried to follow (and applied) your patch, but it looks little bit=
 inconsistent to me. In the
> first round you enabled SHAx_HWACCEL, which is broken on some architectur=
es. That's the reason,
> why is disabled by default. Ok, so first apply looks like this:

let me rephrase my commit message.

The SHAx_HWACCEL is broken on some architectures, right.
However, when you take the defconfig, without the fragments, it will curren=
tly be enabled.
Regardless of what's in my patch.

Why? Because CONFIG_SHA1_HWACCEL in Busybox' kconfig is 'default y', has no=
 dependency on other
options and is not listed in the 'defconfig' file so far.

Thus, my first patch should not change the current situation.

> =C2=A0=C2=A0# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
> =C2=A0=C2=A0CONFIG_PASSWORD_MINLEN=3D6
> =C2=A0=C2=A0CONFIG_MD5_SMALL=3D1
> =C2=A0+CONFIG_SHA1_SMALL=3D3
> =C2=A0+CONFIG_SHA1_HWACCEL=3Dy
> =C2=A0+CONFIG_SHA256_HWACCEL=3Dy
> =C2=A0=C2=A0CONFIG_SHA3_SMALL=3D1
> =C2=A0=C2=A0CONFIG_FEATURE_NON_POSIX_CP=3Dy
> =C2=A0=C2=A0# CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
> =C2=A0@@ -884,6 +887,7 @@ CONFIG_FEATURE_HWIB=3Dy
> =C2=A0
> =C2=A0Then I applied next patch:
> =C2=A0
> =C2=A0=C2=A0# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
> =C2=A0=C2=A0CONFIG_PASSWORD_MINLEN=3D6
> =C2=A0=C2=A0CONFIG_MD5_SMALL=3D1
> =C2=A0+CONFIG_SHA1_SMALL=3D3
> =C2=A0+CONFIG_SHA1_HWACCEL=3Dy
> =C2=A0+CONFIG_SHA256_HWACCEL=3Dy
> =C2=A0=C2=A0CONFIG_SHA3_SMALL=3D1
> =C2=A0=C2=A0CONFIG_FEATURE_NON_POSIX_CP=3Dy
> =C2=A0=C2=A0# CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
> =C2=A0@@ -278,8 +281,8 @@ CONFIG_FEATURE_LS_USERNAME=3Dy
> =C2=A0=C2=A0CONFIG_FEATURE_LS_COLOR=3Dy
> =C2=A0=C2=A0# CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
> =C2=A0=C2=A0CONFIG_MD5SUM=3Dy
> =C2=A0-CONFIG_SHA1SUM=3Dy
> =C2=A0-CONFIG_SHA256SUM=3Dy
> =C2=A0+# CONFIG_SHA1SUM is not set
> =C2=A0+# CONFIG_SHA256SUM is not set
> =C2=A0=C2=A0# CONFIG_SHA512SUM is not set
> =C2=A0=C2=A0# CONFIG_SHA3SUM is not set
> =C2=A0=C2=A0
> =C2=A0@@ -383,8 +386,8 @@ CONFIG_DEFAULT_SETFONT_DIR=3D""
> =C2=A0
> =C2=A0and you disabled CONFIG_SHA1SUM, but keep enabled the acceleration?=
 Is there any special reason
> for that?

There is one, because its the inverse of what the fragments apply, which is=
:

  $ cat ./meta/recipes-core/busybox/busybox/sha1sum.cfg                    =
                       =20
  CONFIG_SHA1SUM=3Dy
  CONFIG_SHA1_SMALL=3D3
  # CONFIG_SHA1_HWACCEL is not set

  $ cat ./meta/recipes-core/busybox/busybox/sha256sum.cfg=20
  CONFIG_SHA256SUM=3Dy
  # CONFIG_SHA256_HWACCEL is not set

I'm pretty sure not having touched the fragments.

The CONFIG_SHA1_HWACCEL options could have been changed in the defconfig, t=
oo.
But this is nothing that I've brought in. It's a result of
https://github.com/openembedded/openembedded-core/commit/21753f16a364e32050=
cf8d79bfa7e0f89be52ce7

Thus I'd assume my changes are consistent. Am I wrong?

> =C2=A0Anyway, there was one commit in the usptream which was touching the=
 acceleration. So I have to
> try it on the broken machine and see if it's still broken or not.

If you refer to oe-core upstream, yes there have been changes.
This is why I needed to rebase and rework my branch.
Or are there other changes I am not aware of, yet?

>=20
> > On Fri, 2024-10-25 at 19:26 +0200, Andrej wrote:
> > =C2=A0
> > > Ok, I was thinking that it was done by intention, but it happened 14y
> > > ago=C2=A0
> > > https://github.com/openembedded/openembedded-core/commit/615a98ed9a02
> > > 1da245513790c064761a0a5a67e9 . So I guess not.=C2=A0
> =C2=A0
> > I am not sure if I fully understand what you are referring to here.
> > Could you provide some details about what happened there?
> > OE didn't have those fragments 14y ago I guess.
> =C2=A0So the idea behind is that you're going to remove the fragments and=
 keep just a one defconfig.
> But according to your commits you kept the fragments there, even if you p=
ut some values into
> defconfig.

Still not sure. I had no intention of removing the fragments.
And I'm unsure how this relates to the referenced commit.
My intention was to actually make them useful again, which is quite the opp=
osite I guess.


Regards, Enrico

> =C2=A0Regards,
> =C2=A0Andrej
>=20
> =C2=A0
> On 28.10.2024 09:29, Enrico J=C3=B6rns wrote:
> =C2=A0
> > This disables options from the defconfig file that are enabled by
> > explicit config fragments.
> >=20
> > Having them enabled in the defconfig renders the fragments useless and
> > takes away the ability to disable options with
> >=20
> > =C2=A0=C2=A0SRC_URI:remove =3D "<fragment>.cfg".
> >=20
> > The respective options were all deactivated once but got accidentally
> > enabled in 4335cd24 ("busybox: refresh the defconfig from 1.33.0").
> >=20
> > This commit disables the features for:
> >=20
> > - sha1sum.cfg
> > - sha256sum.cfg
> > - resize.cfg
> > - pgrep.cfg
> > - rev.cfg
> >=20
> > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > ---
> > =C2=A0meta/recipes-core/busybox/busybox/defconfig | 12 ++++++------
> > =C2=A01 file changed, 6 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes=
-
> > core/busybox/busybox/defconfig
> > index 6c5a8764ce..0ec65c65af 100644
> > --- a/meta/recipes-core/busybox/busybox/defconfig
> > +++ b/meta/recipes-core/busybox/busybox/defconfig
> > @@ -281,8 +281,8 @@ CONFIG_FEATURE_LS_USERNAME=3Dy
> > =C2=A0CONFIG_FEATURE_LS_COLOR=3Dy
> > =C2=A0# CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
> > =C2=A0CONFIG_MD5SUM=3Dy
> > -CONFIG_SHA1SUM=3Dy
> > -CONFIG_SHA256SUM=3Dy
> > +# CONFIG_SHA1SUM is not set
> > +# CONFIG_SHA256SUM is not set
> > =C2=A0# CONFIG_SHA512SUM is not set
> > =C2=A0# CONFIG_SHA3SUM is not set
> > =C2=A0
> > @@ -386,8 +386,8 @@ CONFIG_DEFAULT_SETFONT_DIR=3D""
> > =C2=A0CONFIG_LOADKMAP=3Dy
> > =C2=A0CONFIG_OPENVT=3Dy
> > =C2=A0CONFIG_RESET=3Dy
> > -CONFIG_RESIZE=3Dy
> > -CONFIG_FEATURE_RESIZE_PRINT=3Dy
> > +# CONFIG_RESIZE is not set
> > +# CONFIG_FEATURE_RESIZE_PRINT is not set
> > =C2=A0CONFIG_SETCONSOLE=3Dy
> > =C2=A0# CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
> > =C2=A0# CONFIG_SETKEYCODES is not set
> > @@ -689,7 +689,7 @@ CONFIG_RDATE=3Dy
> > =C2=A0# CONFIG_RDEV is not set
> > =C2=A0# CONFIG_READPROFILE is not set
> > =C2=A0CONFIG_RENICE=3Dy
> > -CONFIG_REV=3Dy
> > +# CONFIG_REV is not set
> > =C2=A0# CONFIG_RTCWAKE is not set
> > =C2=A0# CONFIG_SCRIPT is not set
> > =C2=A0# CONFIG_SCRIPTREPLAY is not set
> > @@ -1070,7 +1070,7 @@ CONFIG_KILLALL=3Dy
> > =C2=A0# CONFIG_LSOF is not set
> > =C2=A0# CONFIG_MPSTAT is not set
> > =C2=A0# CONFIG_NMETER is not set
> > -CONFIG_PGREP=3Dy
> > +# CONFIG_PGREP is not set
> > =C2=A0# CONFIG_PKILL is not set
> > =C2=A0CONFIG_PIDOF=3Dy
> > =C2=A0# CONFIG_FEATURE_PIDOF_SINGLE is not set
> =C2=A0
> =C2=A0

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

