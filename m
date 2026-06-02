Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92322CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 09:41:23 +0000 (UTC)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20909.1780393272973007837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 02:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=rzcnhNRh;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=h+lopYq1;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.149, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 2B262EC01A2;
	Tue,  2 Jun 2026 05:41:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 02 Jun 2026 05:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1780393272; x=1780479672; bh=oaaD4for1+
	WbfMHYCQlprz4tQRYkUZtb5KxE7LWhc6E=; b=rzcnhNRhs/kRfhsINDZEvORV3o
	seG+7teYQ3wlQooMMP3fmzz8ETagDoU0z+Xl8rfYwTUwDbCia8z4NEG/IDyZGIIT
	ibJ8r8ZQOY4l2PBx6sy/JJCZNArwTGXVjQn137AwyZjVfaq8j2Vu0/I5UW+z/4Z5
	h7kTUQRrs5iCaqpsTrlz4HW0Y7BKnAe3gpkst++weRbR790MC1IT1AC1gB7ZpIwb
	cuLYVw/YKoN/EuY61bSmntYAnxXjF43EcSoNFF+wRh32NjLD86qzNF4C9GcgNpJO
	ChYrLTw22mojjXNcILGd6XbW/YaMxaG423GTMlLLeE5pI8rAXKhNw5PDsYEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780393272; x=1780479672; bh=oaaD4for1+WbfMHYCQlprz4tQRYkUZtb5Kx
	E7LWhc6E=; b=h+lopYq1/iDhJU6NW0EsjDkDp/ApegLM/p1HKChx5UN9/X3bF/p
	nHjzeuLubXFWopyGX9FxsWbLdXvOM4mFWhYd63RAhIJFkw8Ey5XKhMY8Ut8Zr3ZU
	ozQIKdRfGbczsn8PtMysvXNBcIfbdUHdAxj0/q5lPUW48gs1XHiQuID9lC7C5cwo
	2y+lDWW5YcIOTGfgDi2MkftYkyPD9uVd85ohPJew20E5rCre36zDYnGtTVFJ52pu
	h9vyZxyVRIZbj0RgDyrSWsUtbQXsQzy3G4L08z6LwENkCq6QWKWgDRvdrvISWi5y
	v6QP/7WbI5mkaiPtVZirgCaom1BoaZ4dVLQ==
X-ME-Sender: <xms:OKUeamPtYqi__5as9tOM01WV-eq99F3rdUIlZZgk2tFEgZFW_zo0mA>
    <xme:OKUeaq-kPR3aNgvBpzVYp_8dUwCtfR7DCkImL5GRNwsr7SvLuIcojyWzp11Z8BrHl
    AO1MLvQMZ3ouf3PSfiFBdXibfAsfu7PlwJKgaPXlBaR23pCPWu00-2M>
X-ME-Received: <xmr:OKUeaq5O0ZwFHXi5SUnHzDptsN70oRmop3TlqwwultnsN2dgYieRWB4Ks87xLJ0Sxh4Rr6sqXY57a7wGJ_udRWezo_Wej0XcZw9oiLbBsBCkZKyiP9SXDZ2LFzgtco31>
X-ME-Proxy-Cause: dmFkZTGH6WVttTMFTjREpf0zJFHzdg0okXqEtCHitfNzW/aZIfsQ7fbZn50fStA25Jrccs
    /PcOZ5b8XUGKCu3wmWw611MawS+NvC2mtO5wYjotoS7NU7MrD+aSSFOSWLXUC5PFI5ROec
    CJpFV8HK4x18lps7yrDAPepwjyMcBXsm5u2lHmRIseUx+umPV9S1T7STf+3I69gsPe4ZqF
    NY8psVlVf96tdGsiszYUZVY/0JchC2hxn06jqaVFFfzOINS30fL0BNzSUE0m17+g8sBuyj
    A7rVFA90ZV3bmCOuvW33S3HlrwnbEDjIJtXgJsOFFdroW/D3nOE8rUP1tUrsjb+T1da1FR
    /nun7fN4tCf2jUmZ9k5sgqJPEL2eA65SJUWqA1x7YTAOFTPh9VPGpn5Yc1pHl/evJ2pqcU
    JR/D+Gbx4/F1r4koRoHuu1KXult7S0611MVqPZDpt3US9VXHlOZhtqUkeMak4N780JsgSi
    Q8yGM9yLei6rEaGFgY5s5ER1h6Jcpi4otB2orVGdYZGWmCYObXq2Uzv9mQlxTmMWJsgKby
    aVvz4IJSQVgqcy6ZlmFclIAIrlTNaBNofFFDnw6xFoGEX4u6nXwCkkdtwC3fVHa9k67LuD
    IUGnfH7oQjaA2TmJqlyGJd8IG++Nnns4Dp6QkPS21mqgL0wiDbTecSiwQRbg
X-ME-Proxy: <xmx:OKUeah0dEWYqEcbwOd60w7LIoIHMZOgOzwEej2FXNhCO0QlFlv9dVQ>
    <xmx:OKUeahDx87vKuqjjy9X1S1U22FAC5MmiV6FcBC0fLQhBthuho4kr4g>
    <xmx:OKUeaj3vyek08r8m0yJDYdSBA5cmrVmGsr2IzaQ8w0MQ-A5KezlgHg>
    <xmx:OKUeartdvEX4K-UsKF_zpQewhdFw-lpSOIdD2-C1iw67udSlh8sIXg>
    <xmx:OKUeas5b6S0HwaKpa3lIoXRAn4xMw6pwmXJDp3wR7HHUPLNvr8YdHRd->
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jun 2026 05:41:11 -0400 (EDT)
Message-ID: <e460fa5e7e009a298c7f82b01a27d5fdb34b60bf.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH 3/8] glib-2.0: Change from Public Domain to
 Gnome GCR Documentation License
From: Paul Barker <paul@pbarker.dev>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 02 Jun 2026 10:41:04 +0100
In-Reply-To: <20260601181251.123019-4-JPEWhacker@gmail.com>
References: <20260601181251.123019-1-JPEWhacker@gmail.com>
	 <20260601181251.123019-4-JPEWhacker@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-QtpU4YHfc2wsn6XmuSpB"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 09:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238025


--=-QtpU4YHfc2wsn6XmuSpB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-06-01 at 12:11 -0600, Joshua Watt via
lists.openembedded.org wrote:
> The file docs/reference/COPYING is an exact match for the text of the
> Gnome GCR Documentation License (SPDX ID GCR-docs), so use that license
> instead of Public Domain. This licenses actually requires that the
> copyright notice be preserved, unlike Public Domain, so its likely that
> using Public Domain is actually an error due to a misreading of the
> license text.
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-core/glib-2.0/glib.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
> index 7fcfd2bf38..dee94ec060 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "https://developer.gnome.org/glib/"
> =20
>  # pcre is under BSD;
>  # docs/reference/COPYING is with a 'public domain'-like license!

Hi Joshua,

We should update the comment here as well.

> -LICENSE =3D "LGPL-2.1-or-later & BSD-3-Clause & PD"
> +LICENSE =3D "LGPL-2.1-or-later & BSD-3-Clause & GCR-docs"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D41890f71f740302b785c27661123b=
ff5 \
>                      file://glib/glib.h;beginline=3D4;endline=3D17;md5=3D=
72f7cc2847407f65d8981ef112e4e630 \
>                      file://LICENSES/LGPL-2.1-or-later.txt;md5=3D41890f71=
f740302b785c27661123bff5 \

Best regards,

--=20
Paul Barker


--=-QtpU4YHfc2wsn6XmuSpB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCah6lMBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0btdTAQDwwNr9v4AU/zMz8xCS3PIDGFmBuuW++mNA
dRSpTxN5lgEA36tIQm6DAY+4HDC8m1AoYbciP8SNU89v0EHRuNTbKwU=
=U38y
-----END PGP SIGNATURE-----

--=-QtpU4YHfc2wsn6XmuSpB--

