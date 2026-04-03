Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A08D730B7
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 07:47:31 +0000 (UTC)
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6981.1775202443653510068
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 00:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=GHVdMvqr;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=jnJtTZ5U;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id D49611D001C1;
	Fri,  3 Apr 2026 03:47:22 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 03 Apr 2026 03:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1775202442; x=1775288842; bh=bZ5BlFxYOI
	7oyjyjmGXho+eIWBfvEn3NCfWuGK/MntI=; b=GHVdMvqrXGkM2alS1+JXIeTIYI
	PZPH/vhEh0aGFYSMD29bWXF9YlSV+qkJF+SvHKDcB9wJ1fpsU7FmgT5M1vpIDUxy
	YdbtGWQ9ChbKOtFGtu8MmerBkvRd9Jcdy22t3Dv5I2IlG4r9FnsmFz1SICVRcKqU
	vwpVLMYtYwD7oC5rkLcRFlrQU11oSISRCXRmXVpqyWQ746RBmU3YxlelBONsJPk3
	5fIrbqbdSJOOQvqYKxuz8z5VszDBC0zPW+hPs0MZBtbNFxvIe2jw4wn+ipfOBhQ9
	rhxX83aT/OKOi1xy6DbCU00zcIgLvHl0PLQJjWol6q1funojoAT0jj5gAgVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775202442; x=1775288842; bh=bZ5BlFxYOI7oyjyjmGXho+eIWBfvEn3NCfW
	uGK/MntI=; b=jnJtTZ5Ux78a9XK7X6HNgguGw+jW4hE5BSZ7hEjsv7a5hehfovv
	GOQ2loa375m9+nhevTDySjP422gIe8FcjONOj757hDdKL5nUZsaCq09KZUiEpoG+
	0YctrYAd9S4k7m+32y4isDj36t+QF9tf1SQoGWitxFaB1zqWIZ5cRxT46dsThbSv
	ILHCpB+ikXe3oL4wA0A9Ps5X1A9ydSNjuK5HkVg9X4Dq5H5j23QAGU3wmYq2w42e
	CmxtRQMqTCnYO/gfI/5eYV4C9sMecyYKtGxlct6OSHFZqac6ulWTrzbN6HwjO2FU
	BLxVwJ/t0xE/ecypih/t5PmB++z+Ac12G8w==
X-ME-Sender: <xms:inDPaUnbBuAx6FyrI6RcYeDRcOU7z5jXVy9RHya9_dxhXXGGKNlSPg>
    <xme:inDPaa20aWSmtA_vqymrN9JSeLfUnlso24x9KIlj1q3iOVuzCcAk-jPUde4MnWJTS
    zzzMSSMQowj6f7f4wtjWu5-oXoSFZp1w41hqbdCAuRjXnGOmInxpRPN>
X-ME-Received: <xmr:inDPaXppu7zogVBNLz1kEXYUZJcWqywKAxQdCJAspGSbzG52fRQA1vIufU6b-1O_qdyOxNvVV3oDWepNTWIg4aTpOTtykTf4RB0C5XI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceurghr
    khgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnhephe
    evgfegveekvddtgfevheekuefgtedvgeejvdekkeffhfduveevleekgefhvefhnecuffho
    mhgrihhnpehurghpihdqghhrohhuphdrohhrghdpfihkshdrihhnpdihohgtthhophhroh
    hjvggtthdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepgedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepphgrvhgvlheslhhovggslhdrtgiipdhr
    tghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvg
    hmsggvugguvggurdhorhhgpdhrtghpthhtohepmhhitghhvghllhgvrdhlihhnthholedu
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhikhhkohdrrhgrphgvlhhisehlihhnrg
    hrohdrohhrgh
X-ME-Proxy: <xmx:inDPafeSJ57eZi3ajKdkLidzECS-yKF3TaAH37lEhMrpKSY17QDV2w>
    <xmx:inDPaeqy2D-9MoSE3GwQHAszOrH-4QYJ1C0-tcoJzI72xWJE9GdsCA>
    <xmx:inDPaYG3UAqfXY90iu5so-oa4aBI6yrCaedk65CV0Gs5WLvOghHnog>
    <xmx:inDPaWsbE3qhW-u3SeO_jSMAvnwjrigrJLryq7xOxa9k8AomW33P6g>
    <xmx:inDPaRD7XvDLzZLaXORNRCm9T5zdY0wfyGyMUnvwG7Rpb4KtUjUuG0EF>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Apr 2026 03:47:21 -0400 (EDT)
Message-ID: <96d932f72af422a6509ac9e6e92a979b75f2f5e7.camel@pbarker.dev>
Subject: Re: [OE-core] [RFC PATCH] uki.bbclass: add multi-profile UKI support
From: Paul Barker <paul@pbarker.dev>
To: Pavel =?ISO-8859-1?Q?L=F6bl?= <pavel@loebl.cz>, 
	openembedded-core@lists.openembedded.org
Cc: Michelle Lin <michelle.linto91@gmail.com>, Mikko Rapeli
	 <mikko.rapeli@linaro.org>
Date: Fri, 03 Apr 2026 08:47:17 +0100
In-Reply-To: <20260402202616.3177283-1-pavel@loebl.cz>
References: <20260402202616.3177283-1-pavel@loebl.cz>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-AYUk6osDFWCo3W8eTPd1"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 07:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234560


--=-AYUk6osDFWCo3W8eTPd1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-04-02 at 22:25 +0200, Pavel L=C3=B6bl wrote:
> Allow generating multi-profile UKI [1]. This is quite usefull for
> dual slot A/B deploymets with secureboot active.
>=20
> Currently only .cmdline sections are supported. But can be easily
> extended with others.
>=20
> [1] https://uapi-group.org/specifications/specs/unified_kernel_image/#mul=
ti-profile-ukis
>=20
> Signed-off-by: Pavel L=C3=B6bl <pavel@loebl.cz>
> ---
>  meta/classes-recipe/uki.bbclass | 48 +++++++++++++++++++++++++++++----
>  1 file changed, 43 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bb=
class
> index d16f3c95561e..c2d21304c793 100644
> --- a/meta/classes-recipe/uki.bbclass
> +++ b/meta/classes-recipe/uki.bbclass
> @@ -59,6 +59,17 @@
>  #   - see efi-uki-bootdisk.wks.in how to create ESP partition which host=
s systemd-boot,
>  #     config file(s) for systemd-boot and the UKI binaries.
>  #
> +#   - to generate multi-profile UKI (currently only supports .cmdline se=
ction)
> +#
> +#     UKI_PROFILE[0] =3D "TITLE=3DRecovery boot"
> +#     UKI_PROFILE_CMDLINE[0] =3D "rootwait recovery"
> +#
> +#     UKI_PROFILE[1] =3D "TITLE=3DBoot from slot A"
> +#     UKI_PROFILE_CMDLINE[1] =3D "rootwait root=3DLABEL=3Droot_a"
> +#
> +#     UKI_PROFILE[2] =3D "TITLE=3DBoot from slot B"
> +#     UKI_PROFILE_CMDLINE[2] =3D "rootwait root=3DLABEL=3Droot_b"
> +#

Hi Pavel, thanks for the RFC.

To make things easier to debug and to follow existing conventions, I'd
suggest:

    UKI_PROFILES =3D "slot_a slot_b recovery"

    UKI_PROFILES[recovery] =3D "TITLE=3DRecovery boot"
    UKI_PROFILE_CMDLINE[recovery] =3D "rootwait recovery"

    UKI_PROFILES[slot_a] =3D "TITLE=3DBoot from slot A"
    UKI_PROFILE_CMDLINE[slot_a] =3D "rootwait root=3DLABEL=3Droot_a"

    UKI_PROFILES[slot_b] =3D "TITLE=3DBoot from slot B"
    UKI_PROFILE_CMDLINE[slot_b] =3D "rootwait root=3DLABEL=3Droot_b"

See the uboot-config class [1] for an example of this pattern.

[1]: https://docs.yoctoproject.org/ref-manual/classes.html#uboot-config

If typical usage will always have `TITLE=3D...` for each UKI profile, you
could also use a UKI_PROFILE_TITLE[profile] variable to make things
clearer.

Best regards,

--=20
Paul Barker


--=-AYUk6osDFWCo3W8eTPd1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCac9whhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0boXfAP0YIfxoELuKOMdNa7kIMS1TyuRqZVnTa92u
JE6Tu3XlQAEA0ZYe/m1r0+PGFtyPOmlVNPcBC5r5BlBXEmlYQgUz3gw=
=PHWr
-----END PGP SIGNATURE-----

--=-AYUk6osDFWCo3W8eTPd1--

