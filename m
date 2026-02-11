Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A18EB2700
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 10:20:26 +0000 (UTC)
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16237.1770805220038987865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 02:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=t8+qr9PR;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=gQpY8NpU;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 215FB7A01EE;
	Wed, 11 Feb 2026 05:20:19 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Wed, 11 Feb 2026 05:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1770805218; x=1770891618; bh=MfHkpRyPES
	r5Pyke4FHt8zJ4QawCZqez/FeJsuOOS40=; b=t8+qr9PRy2g/3iMxOA7wwd7njL
	N+79zaTVW3XoQ9Zh3m7oxXkgQZlmvQFUwZhykDKIdwa4PIZRJui8kKYH2V33MnKb
	2O0MKmDENB617eWDVTHV6Sp2k7EWfvmAKGkQaKKWl/hmG9nydxPPUMMUHD7SnyBt
	EUJuDd3qCmOv/4jPOB8v+yThBFeGU4DmE/Y2zfXhKidP4KaOt9f/uWSGbre1I6Zj
	meTuQIC0e5r+J/ObgKqCNvUPcqt7Kt713vQb+KQj6eMsknSsqA63uhM8erhP1jSg
	UokbTrOyrWy4gDQzccT5H8a9f39ft6pOtSiwliWDE8uABcr1dQ2H/kAH3CDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770805218; x=1770891618; bh=MfHkpRyPESr5Pyke4FHt8zJ4QawCZqez/Fe
	JsuOOS40=; b=gQpY8NpUAenB5KjP5wn+zZqec/vZqsvr0tl1UJtjoklaHpaHbUS
	+VNGpKIFjZ0qZ8n6E0AXFnU8sci1SIktZ/sIgvaX0ExhR1p/uZ7h7/dvZZkMKU2Q
	Xhxdlz0Je9uyVOkK7wZijmPqdSyXnjyLg21x9VTHbmhq08fsZXsJd0irUUH72ymP
	Si4kerROhfnDOIcC/HNpT7OdQKNteNJAhIkHV4ssNc8zDok4Avf/DpyIwiGjiigW
	mq7RVjllGpmqpECTp+t7P2LPSn0WjALj8clSjmOzT6F18PcnJux8HCOBOMI6cJvJ
	aBGDUvvCALTgddwlKoBzDGs+8Aem+au6UbQ==
X-ME-Sender: <xms:4VeMaQLBDTOola62CGDy8sYVK3JO33EoKQ-ohv309DBMLjVyLYagFg>
    <xme:4VeMaXnx7HMczciLuUQzOPBma5BA-LR6x7FQUVoR4HOiIteag19n7FDku_O-QRwVs
    V8cpf5LM8pB4D4NRJ5uJbbwXlKJ_A2p0gPFkHPrx_SRR4DoQAg6CGo>
X-ME-Received: <xmr:4VeMaeGO3_qyRJ-LopFgFAw1FtAxxMh88ANQDyQDky15bMOH3ULNX3Pp3Ml9DO7KFxQsL8gjmSxttJ0n5XU1Nz4hWhFQuCbDYHfChK1a1qpz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtddvvdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epudejvdduueduteetudevudeuieehgffgveeitdeltedujeeihfffiefgfeeuledunecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpd
    hgihhthhhusgdrtghomhdpohhpvghnvghmsggvugguvggurdhorhhgpdekkedrsggspdeg
    vddrsggspddvuddrsggspdehfedrsggspdehgedrsggsnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghv
    pdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeihoh
    grnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhrpdhrtghpthhtoheprhhitghhrghrugdr
    phhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepoh
    hpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggu
    rdhorhhg
X-ME-Proxy: <xmx:4VeMaXF_xGn1WYpSTIDuSiJx2WTeLfmdq4kVfgooZtl0BcVGtUlJyw>
    <xmx:4VeMabNEt3fnQmKciGVNF0fStoItWY62vsEeo3SxpBVHhLgNnGQjfA>
    <xmx:4VeMaWGTVjqm3OKWBKdI4P344N55Un8pD05uTahgGHf2n6yTywOn9A>
    <xmx:4VeMaSPwhAhXuS5T59aCf2SXqzZHFFa6J-BXoJvdtFYLngFS5W_uww>
    <xmx:4leMadOFOQHIODIwPWYhkG47grXPn8anrJixmTuV1iP4udnGpGdZjbFR>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Feb 2026 05:20:17 -0500 (EST)
Message-ID: <22007348fa436360893a4d3dad8d98eb09807e32.camel@pbarker.dev>
Subject: Re: [OE-core][whinlatter 00/22] Pull request (cover letter only)
From: Paul Barker <paul@pbarker.dev>
To: Yoann Congal <yoann.congal@smile.fr>, Richard Purdie
	 <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 11 Feb 2026 10:20:13 +0000
In-Reply-To: <DGADCG1T404K.22590D22LM044@smile.fr>
References: <cover.1770630733.git.yoann.congal@smile.fr>
	 <DGADCG1T404K.22590D22LM044@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Y5y7Lnx5ey5wWRQw7/Qj"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 10:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230976


--=-Y5y7Lnx5ey5wWRQw7/Qj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-02-09 at 11:45 +0100, Yoann Congal wrote:
> On Mon Feb 9, 2026 at 10:58 AM CET, Yoann Congal wrote:
> > Those are the patches from the last patch review:
> > https://lore.kernel.org/openembedded-core/cover.1770109549.git.yoann.co=
ngal@smile.fr/T/#t
> > (with added cherry-pick info, where appropriate)
> >=20
> > Passed a-full on autobuilder:
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3181
> As Paul wrote on IRC, I forgot to mention that the meta-intel build
> failed. But, IMHO it should not prevent the merge:
> * meta-intel build also fail on master currently: See the latest nightly:
>   https://autobuilder.yoctoproject.org/valkyrie/#/builders/41/builds/2992
>   =3D> This new failure is not related to this series
> * I notified the maintainer (Yogesh Tyagi, CC'd) last week, he is
>   working on reproducing & fixing it.

Hi Richard, Yoann,

The build issue in meta-intel has been reported upstream:
  https://github.com/intel/media-driver/issues/1984

I agree we can merge this since it's clear that none of the patches in
this series caused the issue.

The following changes since commit fa31089d48cac2aa11279e932a77f4dbdc02c02d=
:

  libarchive: upgrade 3.8.4 -> 3.8.5 (2026-01-26 08:44:38 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib pbarker/whinlatter

for you to fetch changes up to 000a044d285d93ded3280f27360165c943bb5d7e:

  inetutils: patch CVE-2026-24061 (2026-02-10 21:15:17 +0000)

----------------------------------------------------------------
Hugo SIMELIERE (1):
      libtasn1: Fix CVE-2025-13151

Jiaying Song (1):
      grub: fix CVE-2025-54770 CVE-2025-61661 CVE-2025-61662 CVE-2025-61663=
 CVE-2025-61664

Ken Kurematsu (1):
      libtheora: set CVE_PRODUCT

Khai Dang (1):
      docbook-xml-dtd4: fix the fetching failure

Mark Hatle (1):
      dpkg: Fix ADMINDIR

Mathieu Dubois-Briand (2):
      oeqa/gitarchive: Fix git push URL parameter
      oeqa/gitarchive: Push tag before copying log files

Peter Marko (13):
      go: upgrade 1.25.5 -> 1.25.6
      zlib: ignore CVE-2026-22184
      python3-urllib3: patch CVE-2026-21441
      glibc: stable 2.42 branch updates
      dropbear: patch CVE-2025-14282
      libpng: upgrade 1.6.53 -> 1.6.54
      glib-2.0: patch CVE-2026-0988
      libxml2: patch CVE-2026-0989
      libxml2: patch CVE-2026-0990
      libxml2: patch CVE-2026-0992
      libxml2: add follow-up patch for CVE-2026-0992
      expat: upgrade 2.7.3 -> 2.7.4
      inetutils: patch CVE-2026-24061

Richard Purdie (2):
      scripts/oe-git-archive: Ensure new push parameter is specified
      pseudo: Update to 1.9.3 release

 meta/lib/oe/package_manager/deb/__init__.py        |   4 +
 meta/lib/oeqa/selftest/cases/gitarchivetests.py    |   4 +-
 meta/lib/oeqa/utils/gitarchive.py                  |   8 +-
 meta/recipes-bsp/grub/files/CVE-2025-54770.patch   |  41 +++
 meta/recipes-bsp/grub/files/CVE-2025-61661.patch   |  40 +++
 meta/recipes-bsp/grub/files/CVE-2025-61662.patch   |  72 +++++
 .../grub/files/CVE-2025-61663_61664.patch          |  64 ++++
 meta/recipes-bsp/grub/grub2.inc                    |   4 +
 .../inetutils/inetutils/CVE-2026-24061-01.patch    |  38 +++
 .../inetutils/inetutils/CVE-2026-24061-02.patch    |  82 +++++
 .../inetutils/inetutils_2.6.bb                     |   2 +
 .../dropbear/dropbear/CVE-2025-14282-01.patch      | 280 +++++++++++++++++
 .../dropbear/dropbear/CVE-2025-14282-02.patch      |  97 ++++++
 .../dropbear/dropbear/CVE-2025-14282-03.patch      | 282 +++++++++++++++++
 .../dropbear/dropbear/CVE-2025-14282-04.patch      |  72 +++++
 .../dropbear/dropbear/CVE-2025-14282-05.patch      |  46 +++
 meta/recipes-core/dropbear/dropbear_2025.88.bb     |   5 +
 .../expat/{expat_2.7.3.bb =3D> expat_2.7.4.bb}       |   2 +-
 .../glib-2.0/files/CVE-2026-0988.patch             |  58 ++++
 meta/recipes-core/glib-2.0/glib.inc                |   1 +
 meta/recipes-core/glibc/glibc-version.inc          |   2 +-
 meta/recipes-core/glibc/glibc_2.42.bb              |   2 +-
 .../libxml/libxml2/CVE-2026-0989.patch             | 309 +++++++++++++++++=
++
 .../libxml/libxml2/CVE-2026-0990.patch             |  76 +++++
 .../libxml/libxml2/CVE-2026-0992-01.patch          |  49 +++
 .../libxml/libxml2/CVE-2026-0992-02.patch          | 336 +++++++++++++++++=
++++
 .../libxml/libxml2/CVE-2026-0992-03.patch          |  33 ++
 meta/recipes-core/libxml/libxml2_2.14.6.bb         |   5 +
 meta/recipes-core/zlib/zlib_1.3.1.bb               |   2 +
 .../docbook-xml/docbook-xml-dtd4_4.5.bb            |  10 +-
 ...tions-dirs.c-set_rootfs-was-not-checking-.patch |  46 +++
 meta/recipes-devtools/dpkg/dpkg_1.22.21.bb         |   1 +
 .../go/{go-1.25.5.inc =3D> go-1.25.6.inc}            |   2 +-
 ...native_1.25.5.bb =3D> go-binary-native_1.25.6.bb} |   6 +-
 ...adian_1.25.5.bb =3D> go-cross-canadian_1.25.6.bb} |   0
 .../go/{go-cross_1.25.5.bb =3D> go-cross_1.25.6.bb}  |   0
 ...go-crosssdk_1.25.5.bb =3D> go-crosssdk_1.25.6.bb} |   0
 .../{go-runtime_1.25.5.bb =3D> go-runtime_1.25.6.bb} |   0
 ...-content-based-hash-generation-less-pedan.patch |   8 +-
 ...n-using-cgo-on-386-call-C-sigaction-funct.patch |   4 +-
 ...06-cmd-go-make-GOROOT-precious-by-default.patch |   2 +-
 .../go/{go_1.25.5.bb =3D> go_1.25.6.bb}              |   0
 meta/recipes-devtools/pseudo/pseudo_git.bb         |   4 +-
 .../python/python3-urllib3/CVE-2026-21441.patch    | 111 +++++++
 .../python/python3-urllib3_2.5.0.bb                |   1 +
 .../libpng/{libpng_1.6.53.bb =3D> libpng_1.6.54.bb}  |   4 +-
 .../libtheora/libtheora_1.2.0.bb                   |   2 +
 .../gnutls/libtasn1/CVE-2025-13151.patch           |  30 ++
 meta/recipes-support/gnutls/libtasn1_4.20.0.bb     |   1 +
 scripts/lib/resulttool/store.py                    |   9 +-
 scripts/oe-git-archive                             |   2 +-
 51 files changed, 2228 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54770.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61661.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61662.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61663_61664.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-=
24061-01.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-=
24061-02.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-01.p=
atch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-02.p=
atch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-03.p=
atch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-04.p=
atch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-05.p=
atch
 rename meta/recipes-core/expat/{expat_2.7.3.bb =3D> expat_2.7.4.bb} (92%)
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-01.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-03.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-d=
irs.c-set_rootfs-was-not-checking-.patch
 rename meta/recipes-devtools/go/{go-1.25.5.inc =3D> go-1.25.6.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.5.bb =3D> go-binary=
-native_1.25.6.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.5.bb =3D> go-cross=
-canadian_1.25.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.5.bb =3D> go-cross_1.25.6.b=
b} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.5.bb =3D> go-crosssdk_1.=
25.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.5.bb =3D> go-runtime_1.25=
.6.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.5.bb =3D> go_1.25.6.bb} (100%)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-2=
1441.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.53.bb =3D> libpng_1.6.54=
.bb} (94%)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.pat=
ch

Best regards,

--=20
Paul Barker


--=-Y5y7Lnx5ey5wWRQw7/Qj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaYxX3REccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bhreAQDwLixB/IKlVvK1fWxHaCr5iaQKRls885Kr
KeH5KZPfJgD5AcT5RraIsAoGoPgoETdUDoW52abmUDuM7NG4p6OqcAw=
=AQHM
-----END PGP SIGNATURE-----

--=-Y5y7Lnx5ey5wWRQw7/Qj--

