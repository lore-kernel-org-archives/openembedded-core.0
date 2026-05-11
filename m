Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC56CCD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:42:39 +0000 (UTC)
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47512.1778496158073208367
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 03:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=ZPUOr+Zc;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=bqPwg3o8;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 3A59E1D000B2;
	Mon, 11 May 2026 06:42:37 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 11 May 2026 06:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1778496157; x=1778582557; bh=v9flFG5V6e
	ZdR5E344sC2hKkREVR30BcGANJelsUhDM=; b=ZPUOr+ZcbM4/lpSITUOiQF4jiD
	w0X0UvJsaPv3CrTO1QKAPcL/zDSiW96rTkjsgqSGGaceb+yDHMueR9r4XDETAr5l
	EswZeATsWPnMsdqMUVGW+iFigPduEsIXvTAoqkhy8zigQjju6wftXyzbSZTDvzRp
	G4kLzwsahf31vYZQu0J4uIqyLqoZBclsUmQ0fB6omJBYLe42QCEFFgSm4I6wxyXz
	we2ye65mnnaFcaBgXwUicKBLOhGMpyVrIse9tGP7fnZFTXYmr88sBAqk3jFIAdmk
	ppyatdlYBzKbNAphx8hS/itrYDxhffu8r/9pX5BpCtYV5nb3olhCDTBawGAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778496157; x=1778582557; bh=v9flFG5V6eZdR5E344sC2hKkREVR30BcGAN
	JelsUhDM=; b=bqPwg3o8JJf0qM8vBRnkMFvnnxpsFnY1Ndyxh518np4GYAJSbB5
	6m1oO42XpmPKHHANseXm6JmHwKFRCJE0VlowDRRj7mXPa8yKOduiJCyR8YhjvW+j
	yq0+TMGuRZrxEFv1RZxVaPWeNSNq1kp4K09ipoKBHedxFrYUanBCzjuQb9Yc2f61
	nRdCxi0MdgL5sD4a4cxfeYZiDtubTw3y3B4Qx2uL609dOXgf+zZrKRt9spXWKhLq
	fqfIe8Te1zkcqF0wlD/cCZnl8QsVk+wZ3pTG+YOnRkz/kIMSxBgMt+f1vlXemnZD
	Vt9lReDU1Bkujn2inBjU0HQO0DpToiZUvKw==
X-ME-Sender: <xms:nLIBag7TRG22JD9fmO9g_AeTxZ7rmucZpHag5oFDBq-RFXsVfhzbxw>
    <xme:nLIBaoxXASzbjOHSstQAq2yZ3k37ubURoqK4XSXCas5HmwUOv64w8fvnnybudQvpH
    N6_2KKSUNr8bVbPtFWYLHbJ8yoYX2_pz5098HG1tpFNfxSW3-IBDjBL>
X-ME-Received: <xmr:nLIBanyhXLEQ74eIbSm8galBUILj5uR-dpxx_ye7T_jWHVpPZrKAeevQXnlAvt9ee6RJ_3WFCfp147GwC9lyqExywb4kuJQNX9T53tI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudekjedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epudffkefgfefgleeuhffhveekjeevudetuddvieefueeileeihefhgeetgefgudfgnecu
    ffhomhgrihhnpehvihhmrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdr
    uggvvhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epjhhorghomhgrrhgtohhsrdgtohhsthgrsegsohhothhlihhnrdgtohhmpdhrtghpthht
    ohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvug
    guvggurdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohho
    thhlihhnrdgtohhmpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrh
    hrhidruggvpdhrtghpthhtohepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnuges
    sghoohhtlhhinhdrtghomh
X-ME-Proxy: <xmx:nLIBagxUd6lcNkwPpMtUD3DKROvrPfZtuVtl-CWxhnlxq5XPoZRQtw>
    <xmx:nLIBahZOd3UUupeR1euatgAFv4zDuqOvJWs0l1P49AkoOJZ1YRq3Dg>
    <xmx:nLIBahVdOEh4mKp9LtkiUJMEwVdnQu1VHE8vRfyl5If_hN_7UfNTkQ>
    <xmx:nLIBavjHNb8lo1DHfJPGkgt3HLekDqhr0W9MYg5MSJ9XvA3X4TGuvQ>
    <xmx:nbIBapj-cdWZvue2MQrgzJAdKvTg28GfmKp7SHabSh3s1fCQoG7pOQS_>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 May 2026 06:42:36 -0400 (EDT)
Message-ID: <8c8b009ce6c0d95d5243f3e4f0c1c6c1eb07c989.camel@pbarker.dev>
Subject: Re: [PATCH 2/4] vim-xxd: introduce new recipe for xxd
From: Paul Barker <paul@pbarker.dev>
To: =?ISO-8859-1?Q?Jo=E3o?= Marcos Costa <joaomarcos.costa@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, quentin.schulz@cherry.de, 
	mathieu.dubois-briand@bootlin.com
Date: Mon, 11 May 2026 11:42:32 +0100
In-Reply-To: <20260508214020.2488025-3-joaomarcos.costa@bootlin.com>
References: <20260508214020.2488025-1-joaomarcos.costa@bootlin.com>
	 <20260508214020.2488025-3-joaomarcos.costa@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-VjjiDq9BqFpAgxNHqSFZ"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 10:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236805


--=-VjjiDq9BqFpAgxNHqSFZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-05-08 at 23:40 +0200, Jo=C3=A3o Marcos Costa wrote:
> This new recipe's main purpose is to handle xxd in the simplest way
> possible, stripping it from any needless tasks and/or dependencies that
> come from the fact it was originally provided by the same recipe as Vim.
>=20
> Not only this recipe is faster to build, but it still provides the very
> same program for both build-time and run-time, so there should be no
> migration needed by the recipes depend on xxd.
>=20
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>  meta/conf/distro/include/maintainers.inc |  1 +
>  meta/recipes-support/vim/vim-xxd_9.2.bb  | 29 ++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta/recipes-support/vim/vim-xxd_9.2.bb
>=20
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index f98305e930..7d45bfaf65 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -871,6 +871,7 @@ RECIPE_MAINTAINER:pn-vala =3D "Unassigned <unassigned=
@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-valgrind =3D "Mingli Yu <mingli.yu@windriver.com>"
>  RECIPE_MAINTAINER:pn-vim =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-vim-tiny =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
> +RECIPE_MAINTAINER:pn-vim-xxd =3D "Jo=C3=A3o Marcos Costa <joaomarcos.cos=
ta@bootlin.com>"
>  RECIPE_MAINTAINER:pn-virglrenderer =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
>  RECIPE_MAINTAINER:pn-volatile-binds =3D "Chen Qi <Qi.Chen@windriver.com>=
"
>  RECIPE_MAINTAINER:pn-vte =3D "Unassigned <unassigned@yoctoproject.org>"
> diff --git a/meta/recipes-support/vim/vim-xxd_9.2.bb b/meta/recipes-suppo=
rt/vim/vim-xxd_9.2.bb
> new file mode 100644
> index 0000000000..d876efec4e
> --- /dev/null
> +++ b/meta/recipes-support/vim/vim-xxd_9.2.bb
> @@ -0,0 +1,29 @@
> +SUMMARY =3D "Hex dump and reverse utility from the Vim source tree"
> +DESCRIPTION =3D "xxd is a small utility usually distributed with Vim tha=
t creates hex dumps from binary data and can also convert hex dumps back to=
 their original form."
> +SECTION =3D "console/utils"
> +HOMEPAGE =3D "https://www.vim.org/"
> +BUGTRACKER =3D "https://github.com/vim/vim/issues"
> +
> +require vim-sources.inc
> +
> +inherit update-alternatives
> +
> +PROVIDES +=3D "xxd"
> +
> +do_compile() {
> +    cd  ${S}/src/xxd;
> +    oe_runmake xxd
> +}
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 src/xxd/xxd ${D}${bindir}
> +}
> +
> +RPROVIDES:${PN} +=3D "xxd"
> +
> +ALTERNATIVE:${PN} =3D "xxd"
> +ALTERNATIVE_TARGET[xxd] =3D "${bindir}/xxd"
> +ALTERNATIVE_LINK_NAME[xxd] =3D "${bindir}/xxd"
> +
> +BBCLASSEXTEND =3D "native nativesdk"

I don't think separating out vim-xxd while keeping vim in OE-core is a
significant improvement. There's also the potential to miss CVEs unless
we set CVE_PRODUCT to "vim" in vim-xxd, and that will just result in
duplication of reports.

This also doesn't reduce the amount of time people will spend
backporting CVE patches to the LTS branch, and time our LTS maintainer
will need to spend reviewing them. So I'd still rather eject vim from
OE-core if we can.

Best regards,

--=20
Paul Barker


--=-VjjiDq9BqFpAgxNHqSFZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCagGymBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0botsAQCtKsv1XP6jLIbUgL9ZKNcpxnVG7hxmpNSa
XPU53fnJUQEAmAjow+YRjQdPjcVnf2/1TgIA16Lb19BC3VnSyaQWkwE=
=iPLx
-----END PGP SIGNATURE-----

--=-VjjiDq9BqFpAgxNHqSFZ--

