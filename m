Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727B5D61014
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 12:51:57 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13805.1769691111523612726
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 04:51:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Rr3H1OWk;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=EaTgQHPq;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 90496EC00B5;
	Thu, 29 Jan 2026 07:51:50 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 29 Jan 2026 07:51:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1769691110; x=1769777510; bh=IQOs295b6a
	MswnykMawv0ATPFf8jgWuomA4NQF5+zXU=; b=Rr3H1OWkemtrZdrzhRkQHFEPv/
	dcbok5DXyKv0pp9cVSXbebJBaCsLkcYbHxl5nPkYZN1Kly5TggSKLdp7IszuHLLs
	wFl+v5b6tyWbjz0/9es72ZO5TZsaJwY6y/sp5cSblVVjqN4oH5CuGA6DT82++EO0
	oenRS34sulJTcnsP8SWd8DfrzfQ0HGK17ExD64GAM0xBTWag+lNNh7TuRDAtFZDk
	lVpNo8qzY1OoGwKxNFbHP3trgmYddn1Gcupx0Lo2Z43uwwONv1CXrOFu+JAi7kRU
	6uL6E8Lw6sBuOIzR3kPSlIgATySRYeJJ1AGHIFslKQz4/fC0kQtxOmtD/aoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1769691110; x=1769777510; bh=IQOs295b6aMswnykMawv0ATPFf8jgWuomA4
	NQF5+zXU=; b=EaTgQHPqhyDRYpyDvSU9b4gikmdUe+IZpYPifuAwrzaFK+u0tWN
	Qvr33+L8lkd3PE4xeVodNc0n2g7e80R1WQpV/JTcs9K2vLO6fPcU+kfcwNmPpiEd
	VD6ZthADD2BkEexPYP7eVJw6BIMBNzB1YdNS98GJ/DQHwmK/8e4ZgUt4B3EFdi/x
	0K0uLBw7Hpqm34TwlwjNZnQFWDlo8wMyDEewATrNc2ayT3ic8FM+4i85Rj2Yl/MT
	lPEQAbCO4LCQSN4Zalg9zDS8FISq3MwgjPufd3aD1pjuQ09JNjwlWzodMOpf5z+p
	kZWJt0wu6gkt+3gePIIU2ycfoMDdF/XbwCA==
X-ME-Sender: <xms:5ld7aYhmE1I3Qgm0f6_SzoK4xbsc4Gu2AfGzqTwu580UgkXYqFhk_A>
    <xme:5ld7aXB3VK6NeENbFZbOTG1dr0lxSevJz5m_RV2AQvb3ohCPQNBItv3b3CPVEGzKx
    iO7Kbsqz-yJRDRGB-1I3HPHlDLQqjKJ2xmLMMqVlYszfSaTVk1yX0VX>
X-ME-Received: <xmr:5ld7adtwzozA1lmPh4LmPEorYk7BevoohAzQECNzWzvsRME3mJ6LQli8789MJl2BVud4IA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieeivdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepffejveetiedvveetgefhiedtudekleeivdekte
    fgueffhedtudelkeegieehuedunecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdpghhithhhuhgsrdgtohhmpdgthhgrnhhgvghlohhgrdhmugenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgv
    rhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepfigrnhhgmhihsehfuhhjihhtshhurdgtohhmpdhrtghpthhtohepohhpvghnvghm
    sggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:5ld7aUYYCYkt_ms6JuNByfC5Z7s0QQMHgi1YRPw1TJcpWmq-774-yw>
    <xmx:5ld7aYW3_IJoteRFk79n33INH8OFisvHg4wB2zv_0ZyIPY5lbQgKPQ>
    <xmx:5ld7aQ6Nr_ThcWmATMskDQX-HoRR3iax6yeQANjp4Jz9itYrkQ4yNA>
    <xmx:5ld7abhV9u-FDtadMejgXpU52_qYpWu-bxN_muScB8JSKLyUZRrwRw>
    <xmx:5ld7aQpkvikP4QpHzDyQxzXIN7GGL0gspdczRy7-LthtpJ_jof7IM21Q>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Jan 2026 07:51:49 -0500 (EST)
Message-ID: <1167e5bb7d182ff6834c9e6a06a6cc3acb19d530.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH 10/17] python3-poetry-core: upgrade 2.2.1 ->
 2.3.0
From: Paul Barker <paul@pbarker.dev>
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Thu, 29 Jan 2026 12:51:47 +0000
In-Reply-To: <20260126123517.1020-10-wangmy@fujitsu.com>
References: <20260126123517.1020-1-wangmy@fujitsu.com>
	 <20260126123517.1020-10-wangmy@fujitsu.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-BEPkjxr3PLDcTrzp1QD5"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 12:51:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230135


--=-BEPkjxr3PLDcTrzp1QD5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-01-26 at 20:35 +0800, wangmy via lists.openembedded.org
wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> License-Update: drop support for Python 3.9

I think we need to explain the license change more clearly here. The
lark LICENSE file was re-written to replace '\r\n' with '\n' newlines.

>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/python3-poetry-core_2.2.1.bb       | 41 -------------------
>  .../python/python3-poetry-core_2.3.0.bb       | 40 ++++++++++++++++++
>  2 files changed, 40 insertions(+), 41 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3-poetry-core_2.2.=
1.bb
>  create mode 100644 meta/recipes-devtools/python/python3-poetry-core_2.3.=
0.bb
>=20
> diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.2.1.bb b/=
meta/recipes-devtools/python/python3-poetry-core_2.2.1.bb
> deleted file mode 100644
> index 45af8768e9..0000000000
> --- a/meta/recipes-devtools/python/python3-poetry-core_2.2.1.bb
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -SUMMARY =3D "Poetry PEP 517 Build Backend"
> -DESCRIPTION =3D "Poetry PEP 517 Build Backend"
> -HOMEPAGE =3D "https://github.com/python-poetry/poetry-core"
> -BUGTRACKER =3D "https://github.com/python-poetry/poetry-core"
> -CHANGELOG =3D "https://github.com/python-poetry/poetry-core/blob/master/=
CHANGELOG.md"
> -
> -LICENSE =3D "Apache-2.0 & BSD-2-Clause & BSD-3-Clause & MIT"
> -LIC_FILES_CHKSUM =3D "\
> -    file://LICENSE;md5=3D78c39cfd009863ae44237a7ab1f9cedc \
> -    file://src/poetry/core/_vendor/fastjsonschema/LICENSE;md5=3D18950e83=
62b69c0c617b42b8bd8e7532 \
> -    file://src/poetry/core/_vendor/lark/LICENSE;md5=3Dfcfbf1e2ecc0f37acb=
b5871aa0267500 \
> -    file://src/poetry/core/_vendor/packaging/LICENSE;md5=3Dfaadaedca9251=
a90b205c9167578ce91 \
> -    file://src/poetry/core/_vendor/packaging/LICENSE.APACHE;md5=3D2ee411=
12a44fe7014dce33e26468ba93 \
> -    file://src/poetry/core/_vendor/packaging/LICENSE.BSD;md5=3D7bef9bf4a=
8e4263634d0597e7ba100b8 \
> -    file://src/poetry/core/_vendor/tomli/LICENSE;md5=3Daaaaf0879d17df011=
0d1aa8c8c9f46f5 \
> -"
> -
> -SRC_URI[sha256sum] =3D "97e50d8593c8729d3f49364b428583e044087ee3def1e010=
c6496db76bd65ac5"
> -
> -inherit python_poetry_core pypi
> -
> -PYPI_PACKAGE =3D "poetry_core"
> -UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> -
> -RDEPENDS:${PN}:append:class-target =3D "\
> -    python3-compression \
> -    python3-core \
> -    python3-crypt \
> -    python3-io \
> -    python3-json \
> -    python3-logging \
> -    python3-netclient \
> -    python3-pprint \
> -    python3-shell \
> -"
> -
> -RDEPENDS:${PN} +=3D "\
> -    python3-pip \
> -"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb b/=
meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb
> new file mode 100644
> index 0000000000..ce783d49df
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-poetry-core_2.3.0.bb
> @@ -0,0 +1,40 @@
> +SUMMARY =3D "Poetry PEP 517 Build Backend"
> +DESCRIPTION =3D "Poetry PEP 517 Build Backend"
> +HOMEPAGE =3D "https://github.com/python-poetry/poetry-core"
> +BUGTRACKER =3D "https://github.com/python-poetry/poetry-core"
> +CHANGELOG =3D "https://github.com/python-poetry/poetry-core/blob/master/=
CHANGELOG.md"
> +
> +LICENSE =3D "Apache-2.0 & BSD-2-Clause & BSD-3-Clause & MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D78c39cfd009863ae44237a7ab1f9c=
edc \
> +                    file://src/poetry/core/_vendor/fastjsonschema/LICENS=
E;md5=3D18950e8362b69c0c617b42b8bd8e7532 \
> +                    file://src/poetry/core/_vendor/lark/LICENSE;md5=3Dba=
5edf8d60cf416b5588b1e6f152fcef \
> +                    file://src/poetry/core/_vendor/packaging/LICENSE;md5=
=3Dfaadaedca9251a90b205c9167578ce91 \
> +                    file://src/poetry/core/_vendor/packaging/LICENSE.APA=
CHE;md5=3D2ee41112a44fe7014dce33e26468ba93 \
> +                    file://src/poetry/core/_vendor/packaging/LICENSE.BSD=
;md5=3D7bef9bf4a8e4263634d0597e7ba100b8 \
> +                    file://src/poetry/core/_vendor/tomli/LICENSE;md5=3Da=
aaaf0879d17df0110d1aa8c8c9f46f5 \
> +                    "

Since the commit message needs rewriting, could you undo the indentation
change here so that the diff is smaller?

> +
> +SRC_URI[sha256sum] =3D "f6da8f021fe380d8c9716085f4dcc5d26a5120a2452e0771=
96333892af5de307"
> +
> +inherit python_poetry_core pypi
> +
> +PYPI_PACKAGE =3D "poetry_core"
> +UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> +
> +RDEPENDS:${PN}:append:class-target =3D "\
> +    python3-compression \
> +    python3-core \
> +    python3-crypt \
> +    python3-io \
> +    python3-json \
> +    python3-logging \
> +    python3-netclient \
> +    python3-pprint \
> +    python3-shell \
> +"
> +
> +RDEPENDS:${PN} +=3D "\
> +    python3-pip \
> +"
> +
> +BBCLASSEXTEND =3D "native nativesdk"

Best regards,

--=20
Paul Barker


--=-BEPkjxr3PLDcTrzp1QD5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaXtX4xEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bqDiAQCaTCO7jdyQMNQl8+Ljf9sVu7oZNqJXe0te
F5JxSO7zQQEA2JRFjAbU3Pm+b34YqbZTiUjDeDMebcSuuPHaH8wT7AE=
=nU6E
-----END PGP SIGNATURE-----

--=-BEPkjxr3PLDcTrzp1QD5--

