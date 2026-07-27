Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078CCC531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 12:45:41 +0000 (UTC)
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30246.1785156332974422753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 05:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=z7Oe4aY9;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=IKkYMuqy;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 2C3D91D0025E;
	Mon, 27 Jul 2026 08:45:32 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 27 Jul 2026 08:45:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785156332; x=1785242732; bh=jVGmqjkEg7
	4X79+485yy4q/83M8xUvLmJaNEEcOVJ5s=; b=z7Oe4aY9sjJJ/KZ2KzX/hdoAUY
	uJ2hBWPgsKkhaTd4DAmx00ejDjqtAWp5KZKjMNRInaOOaWHgnzpv74wwcU9kzSN7
	p+Lfd44n18oNbDVMgbhQQ8lBjrnVMT49uMCvt6ZCBgJdAtMYhxhy4BUw63gO1nwT
	SCcJCINNeTu9Fbpp0cNJiJ6mWja+BG5G/s64Pf1GcJNCyw1yM+7L00XJj3/EZOZp
	c2GIGpRq/9w435eFo7GnqV54h2QzHstih4ooqAcI7OgfAEDIlR/8uXesOwxWHlz/
	BNwAVXThBWBuGlDg26vUQZwXmxv6iXeiNm/KqQAC6wZ+V6kPxFiXkS+1cBZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785156332; x=1785242732; bh=jVGmqjkEg74X79+485yy4q/83M8xUvLmJaN
	EEcOVJ5s=; b=IKkYMuqyo6MiJ8xsfmK6e8U9PIgYpDTKcHVoMwyn2aaW4e3ae96
	5GDHoL2JT6iln8vjNo1OW+WGd6a0QdgXYUvgv/cYwJKG1dgCCw62CXLTgxVynwDX
	KcrzH8miKqn+u/cfBS5LCnbWE3TDPzxFqTKWwwbdv2VlndgPyxDz4NjJIhETnwjL
	r0xQWnaXhYRt4IqD9TrcF+PZSg2laz5Y3xMScb6NCNdI0umHaRUSZHBQRwFDdVSt
	wLfIyq/orju6gfo7B1pMhZns9gWomFSkgxA0xbuY7nt9VCj00GKXlnOjQ73LhsuC
	hv1MUdiZbOkITT1De+dl+NefAiUFpkawC9Q==
X-ME-Sender: <xms:61JnaoB3zMC42RTmBrDosaIY8BXoACAlh6tMnBI-G6iuGLfwokUwWA>
    <xme:61JnagiB_8yNbHKPYQ10RSeOeJ-Km6-y3Z-itM-89xQY-e3FdlqKtUtJLVbt_2Nqe
    HQwIoFa7DxcP45fQN_9lwo_Fqjmohacvoxt2LGq3oMbtIRFeOhyB98l>
X-ME-Received: <xmr:61JnapMWYO71-2m9VXoJyVUf9Vzi7urHjkB4y4M4Xro69F102waQTV478_gr2mFbWqNeU06iiRm00kKca6TQWsDld8NmTQXbjWI5JoiJJxTA>
X-ME-Proxy-Cause: dmFkZTFqQZMmrGyHtRJNyc2AbbNQDo4pj9XpFYr0JcTwpzs64mxNQmsF5sAnghAyQWJAM6
    re0u+YIzpA2lH54yh52S4MKtsyDRE7786yUwYOX18gk5jZ2Ea9fIlHjynmntoJLIisHkmN
    CHt8RvoFToSuR7EJaFFJe33ir3dxuKaqGlpAxRLtiVWzVxWb34PUsJBqSMc+HSenIyBpjt
    +P8ZTi6/SfNrH+ftkIq0ueNATHQOvpIcRw5R+3J86MSM5iPs0eUXrwdjlT/3WpVNW2TGm5
    RLAMkShxEXXhXQ4PFC4lvmoRkQ0+3wddi5/8qxIS7qsJQveaLVNdqFmPrRSVP8tFUp5yIn
    mG0/YlFvkDoKNxc+LVvpr1WMpDz3+svjerEoc9514QMXCK6R6b/ipiUOfo7Dyab+KQFJGa
    cEz9KPIHi4CnkPgEUtOoOXpHNTbrwfxGOGERY5mm2CjJ+TqTIJSdL6cZHtJXiIVXCjJlDW
    iIk8xNwuGpVgbUnNuNZ6AfDJXF58EzGzmY1GSmuPXNRg2nz3p/xE/57wtNxgqFdJv9dHyh
    t9m9hu8Pud0lDk2WSGDvzYb8uzI+geC6nt8XbZjSfxdIJJkzU7ZODEJdgY1RKVVTzN6VJ+
    Mh+LnZB/BKYSjH2OfHZFl0yXiytDTP2MF0mg7pX4VKV3cgkqvUIQDn7+Vhmw
X-ME-Proxy: <xmx:61Jnap73j0Qz8bqnSzpckxTsx5WomblZGCoa6JHlKLtdzfPl507WhA>
    <xmx:61Jnav3fMr0JYE2Hr4mcX1PgfRUyAvaPTTC-UCCY9TkRz4NP60CF5g>
    <xmx:61JnaiaYusQGJtJnTkgIIik89HBoDsJo-c2In02GBdiltQVwzE08_A>
    <xmx:61JnavCewXpAXhILFqEczyKugToWR2sm7Dz78__XLOf1PWGLTPU5Yg>
    <xmx:7FJnavhXFw2vge4HR5zmFT3srsuZitxhGv2Ioex1qQkix0WNFwJRKeRY>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jul 2026 08:45:30 -0400 (EDT)
Message-ID: <b2fc660395cb8abbd8c037615a30f87eef3dbbcb.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] systemd: add watchdog device
From: Paul Barker <paul@pbarker.dev>
To: Fabian Pflug <f.pflug@pengutronix.de>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2026 13:45:25 +0100
In-Reply-To: <20260727100926.3137215-1-f.pflug@pengutronix.de>
References: <20260727100926.3137215-1-f.pflug@pengutronix.de>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-nc9/MnwhzDa7jeFYdOoi"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 12:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242095


--=-nc9/MnwhzDa7jeFYdOoi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-07-27 at 12:08 +0200, Fabian Pflug wrote:
> Some systems may have multiple watchdogs and want systemd to manage a
> different one. This patch allows to set the WatchdogDevice setting in
> system.conf
>=20
> Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
> ---
>  meta/recipes-core/systemd/systemd_259.5.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-co=
re/systemd/systemd_259.5.bb
> index f3ec0edae7..8cb523a330 100644
> --- a/meta/recipes-core/systemd/systemd_259.5.bb
> +++ b/meta/recipes-core/systemd/systemd_259.5.bb
> @@ -253,6 +253,11 @@ WATCHDOG_TIMEOUT ??=3D "60"
>  # and the watchdog is enabled. (defaults is no hardware watchdog use)
>  WATCHDOG_RUNTIME_SEC ??=3D ""
> =20
> +# If a different device, other then /dev/watchdog0 should be used, set
> +# WATCHDOG_DEVICE_PATH to the full path to the watchdog device.
> +# (Will set the WatchdogDevice=3D option in /etc/systemd/system.conf)
> +WATCHDOG_DEVICE_PATH ??=3D ""
> +
>  do_install() {
>  	meson_do_install
> =20
> @@ -368,6 +373,11 @@ do_install() {
>  			${D}/${sysconfdir}/systemd/system.conf
>  	fi
> =20
> +	if [ -n "${WATCHDOG_DEVICE_PATH}" ]; then
> +		sed -i -e 's|#WatchdogDevice=3D|WatchdogDevice=3D${WATCHDOG_DEVICE_PAT=
H}|' \
> +			${D}/${sysconfdir}/systemd/system.conf
> +	fi
> +
>  	# Actively disable Predictable Network Interface Names
>  	if ! ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false'=
, d)}; then
>  		sed -i 's/^NamePolicy=3D.*/NamePolicy=3D/;s/^AlternativeNamesPolicy=3D=
.*/AlternativeNamesPolicy=3D/' ${D}${nonarch_libdir}/systemd/network/99-def=
ault.link

Hi Fabian,

I'm not sure we need a new variable for this. If I understand correctly
you can install a drop-in file in ${sysconfdir}/systemd/system.conf.d to
set WatchdogDevice. That can easily be done from a bbappend or a new
recipe without needing any changes in OE-core.

Thanks,

--=20
Paul Barker


--=-nc9/MnwhzDa7jeFYdOoi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCamdS5REccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bmAHAQCtz7S6gGdjYvuRL/U4A9nROD0xLHpt0mpB
dG/2bfH/7QEAvfI0lu+A2e7Z/qpnMuf5ImCG+OeeFuCy4A3p7iQY2wk=
=edyy
-----END PGP SIGNATURE-----

--=-nc9/MnwhzDa7jeFYdOoi--

