Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E023E95390
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 12:03:57 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18904.1770206628302698641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 04:03:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Vm5TD5Jd;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Xs5cy9RU;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 79366EC0310;
	Wed,  4 Feb 2026 07:03:47 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 04 Feb 2026 07:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1770206627; x=1770293027; bh=T0Ii8VH3dq
	dVHBX8iEP0GuDY25paXZhBQkNdobIR+a8=; b=Vm5TD5JdcIWznvbQQqgKrX5soz
	0JluhsDPF5mcLomTpsHWxcm4ZNgGzuorhkOSA8iPF73zSy0LiGcfnsRgMp78gjXF
	Ei2FfHNGNGnZS2v3zYp5w9iI0edeqK3dli342uRqJQKEo+65g3JovRxVc3BGheqG
	TRId7SklgtQnzyHUheZ8w44Lv7d9MWCdk5vISFBnDJeUa9oIVhzwPSF7CG3hdioH
	fdIEnowIk39XMIolPT5g+Cc1ahPsshQw1HY28mL2ATORk4US5RepqwEPSaseQrbd
	3l//OIAbCfSD2DHhdCE/8CRn9e/oi4sAH8y3hB9nHNOToG84bqGaX0WWXtag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770206627; x=1770293027; bh=T0Ii8VH3dqdVHBX8iEP0GuDY25paXZhBQkN
	dobIR+a8=; b=Xs5cy9RUcIwwxZ+mctFM3wZ72FBIK34anW/1p22kGBb0MYQFZYJ
	uLbaeo84xbmYwGuXqPvdxUjJ/Sn4WN6ZLOJc1/FB3vIxr0B4qoM/KH5U9dNvHmvK
	8+2YVOOiJRELzK2kGqRq+jCGhm37GYLdeq74mXwciYBXZvwt4DaXYBLjhpkidwfp
	FpPIvbU3Hs2OIBTqcdm+Q4NRqvfoPuUFyTmQmVixkKs9Vpol2gEdLwGLcRKHMXTC
	64yclddqzClETBEPQ0BQEGEqPvlEBPp5fkjhpRfNsPKAcmi8DnUTN71V/5yAZG6l
	/JdsWRlQeEyBlhGETf+h4RpWx2wM9NpkPPQ==
X-ME-Sender: <xms:ozWDabUMOm-hEyL5LG4DywZRIDkA5s7OxgmknBQBtQkYw9uDy8VUvw>
    <xme:ozWDaWLnsWLA93IsLS0YPLQfxF76cUX0UYsF_S2V4uxydKa3AfIm9XtQJyWYGINL_
    0n1m6zSNPDBotsXbsvWNW2X_MC84FgzRsjKbZOp9uCZMxJmvieOmW0>
X-ME-Received: <xmr:ozWDabBlF639Wtp7CzY7KHSuOKS-kbgjzgni1XSHapQeqg8sHy0Vvcpuh5CastRdXdERstZKGP3DL1Ht_4ib_Wf0Jm9dKgvZb67JbuPb-TXz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedvfeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfevffgjfhgtfgggsehgtderre
    dtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghr
    rdguvghvqeenucggtffrrghtthgvrhhnpefhkefhuefgleefleduleelhfektedvffeitd
    dtueeukefhieduiedvfeeuhedutdenucffohhmrghinhepohhpvghnvghmsggvugguvggu
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeelpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehhrghrihhshhdrshgrughinhgvnhhiseifihhnug
    hrihhvvghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvges
    lhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheprhgrnhguhi
    drmhgrtghlvghougesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehsuhhnuggv
    vghprdhkohhkkhhonhgurgesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopegrlh
    hishhtrghirhdrfhhrrghntghishesfigutgdrtghomhdprhgtphhtthhopegsrhhutggv
    rdgrshhhfhhivghlugesghhmrghilhdrtghomhdprhgtphhtthhopeihohgrnhhnrdgtoh
    hnghgrlhesshhmihhlvgdrfhhrpdhrtghpthhtohepvghlmhgvhhguihdrhihouhhnvghs
    sehsmhhilhgvrdhfrhdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinh
    hugihfohhunhgurghtihhonhdrohhrgh
X-ME-Proxy: <xmx:ozWDaWchHyQdotMcklOuTIZM2A7iQgS-WZn9Zo2UTPJI0rVJ9yldAQ>
    <xmx:ozWDaa3yt_dt_Zsll2H9myZTWec20rJxSvDZjXkuayJLdqyNo9iMYw>
    <xmx:ozWDadh3d4wxehsJD0lKeDdCEtzYUD3SzJc3kbzFCIz0K7xNnK8oKg>
    <xmx:ozWDaTkTsbg1Ht870ePi7i8l5kVIjjVpO9XiRRB8fC7YcEVf6-QRVQ>
    <xmx:ozWDaeuNhSI5kJUNhTEneApv8beDzzyVnz4wE5bH4r38uB_HU2Z2qPqk>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Feb 2026 07:03:45 -0500 (EST)
Message-ID: <7d3c95f45c56ce0651c5dcfaea9b13fde9a28d65.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v5 05/15] kernel-yocto: Fix for buildpaths
 errors when rust is enabled for kernel
From: Paul Barker <paul@pbarker.dev>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com, 
	alistair.francis@wdc.com, bruce.ashfield@gmail.com, yoann.congal@smile.fr, 
	elmehdi.younes@smile.fr, richard.purdie@linuxfoundation.org
Date: Wed, 04 Feb 2026 12:03:42 +0000
In-Reply-To: <20260129163910.2612040-6-Harish.Sadineni@windriver.com>
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
	 <20260129163910.2612040-6-Harish.Sadineni@windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-xGkG+GjxCADQ5H19La+v"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 12:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230513


--=-xGkG+GjxCADQ5H19La+v
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-01-29 at 08:39 -0800, Sadineni, Harish via
lists.openembedded.org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> Fixes for buildpaths errors after enabling rust for linux-kernel
>=20
> Co-authored-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>

The commit message here should explain the introduction of KRUSTFLAGS.

> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-reci=
pe/kernel-yocto.bbclass
> index 4323c4c80a..cd5daaf33b 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -4,6 +4,8 @@
>  # SPDX-License-Identifier: MIT
>  #
> =20
> +INHERIT:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kerne=
l', ' rust-common', '', d)}"
> +

We should be able to use inherit_defer here instead of modifying
INHERIT.

>  # remove tasks that modify the source tree in case externalsrc is inheri=
ted
>  SRCTREECOVEREDTASKS +=3D "do_validate_branches do_kernel_configcheck do_=
kernel_checkout do_fetch do_unpack do_patch"
>  PATCH_GIT_USER_EMAIL ?=3D "kernel-yocto@oe"
> @@ -27,6 +29,11 @@ KMETA_AUDIT ?=3D "yes"
>  KMETA_AUDIT_WERROR ?=3D ""
>  KMETA_CONFIG_FEATURES ?=3D ""
> =20
> +RUST_DEBUG_REMAP =3D "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kern=
el', '--remap-path-prefix=3D${WORKDIR}=3D${TARGET_DBGSRC_DIR} \
> +                      --remap-path-prefix=3D${TMPDIR}/work-shared=3D${TA=
RGET_DBGSRC_DIR}', '',d)}"
> +KRUSTFLAGS:append =3D " ${RUST_DEBUG_REMAP}"

Why do we use :append here?

> +EXTRA_OEMAKE:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-=
kernel', ' KRUSTFLAGS=3D"${KRUSTFLAGS}"', '',d)}"
> +
>  # returns local (absolute) path names for all valid patches in the
>  # src_uri
>  def find_patches(d,subdir):

Best regards,

--=20
Paul Barker


--=-xGkG+GjxCADQ5H19La+v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaYM1nhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bokRAP9gWrJdzh4PIoESHp8Zwy7tFCLrndMWYvRG
hEZdNbr1hQEAtdoaatX3vQWFUAlLPcCI5Slaw9WRKuHsXjCWWCQ86Qo=
=odcH
-----END PGP SIGNATURE-----

--=-xGkG+GjxCADQ5H19La+v--

