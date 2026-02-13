Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88688EF48F0
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:51:21 +0000 (UTC)
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67626.1770972676913167595
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:51:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=WMwcGFOH;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=o8AvApA6;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 964B57A01AC;
	Fri, 13 Feb 2026 03:51:15 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 13 Feb 2026 03:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1770972675; x=1771059075; bh=nSQCYv0eCX
	vJKxq5fmIhKJEhsaeg3CUSTqtJYCSIvWk=; b=WMwcGFOHrTZPyL0HNrbW2bdw2n
	1++Rxmv1EUdEXx+Tn24rDsGihn+EUdvo+xvyf7K0pOcq0ZmgemqSD52GjAzJGi6o
	HIcVrHMBtd2Ve+Ri0h2PkONulge3i8oYGQ4HsjIl+nSgu41bK5COEdnsbPs+bTDv
	QMms63n4FwRhDlmt7eVgYjtUNO10EL/CpaSJGRdjEmAe6SUaSuGrdTgaf/LBuzgy
	zXmudHkeW7VGgLpWGp1EgaZr381eZxsEMsbC4g7xZBxZCNzm2h7j0hzzKr+cnIZ1
	ShOo6OXkLg+EVrb40vcf0wlTMCfP+WQWE3i3/N1VAjN/F7lqIdsO9kYWs1nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770972675; x=1771059075; bh=nSQCYv0eCXvJKxq5fmIhKJEhsaeg3CUSTqt
	JYCSIvWk=; b=o8AvApA6si754p0EweiKBCWC5sMzVS0r70nzK44uX1lXwEW8lxp
	a+ze+dRp5y3ZVc64kdm8nQXh7G+5KUWxh73NdzestgALoNBEpwoLUx8fylgW3bpM
	TZPowZExJxFexxV50T3qB/srwkJOub5NsOQXhD0iadHSD4sFDI7Gq3J7PZWy1Z2J
	jSQJaDqmu/YOGykEXPcG1YkGqwPpKzEcF0mNKezrrwcAJaRrmPua7BShgki7Z2MX
	4uzbigYC7admA8e8MngJIo4Gmb+3ak0jpn45+X3DfdvmClQKDOs6QfgJLinb3d8S
	As8anhO5Dz8BeUN6iACTPMYX51VJ6IpOpQw==
X-ME-Sender: <xms:AuaOafAWeoYq5uCpkz37BvwC2GVc889YknTsoa9FZ4ogtfzdYi0MGg>
    <xme:AuaOabgDaxCnsIIsBgPZ7C7F0NqPMFjKjGYGT4h2OduvsZfaOMWgrEYjp08gUo6Oy
    LII2AUkbYsE0BTLoui_Z_RwiEQYLQ11VS1dGqUw-RwrHYs6aXT_4xs>
X-ME-Received: <xmr:AuaOaYPb0FRrt4qW2l4dfzB3dHjDdBu4-u7xsr-ECtaIyPZ7G8WdzP_WdoyW-zL4qls9J6Epy_FeVXcp4iGDRne1Co8d9LK4E4VxGEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdejkedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    ethfevgefhtddugffftdetheejtdetieekveeuudeijeetteeggeeghfehffdvhfenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpoh
    hpvghnvghmsggvugguvggurdhorhhgpdefledrsggspddutddrsggspdduvddrsggspdej
    gedrsggspdegvddrsggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopedv
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeihohgrnhhnrdgtohhnghgrlhessh
    hmihhlvgdrfhhrpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhi
    shhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:A-aOac5xw-AgOX7MtFS-6eVFq_yGGGL2CBLR7olkWkB0UuUq0IlyIg>
    <xmx:A-aOaW0GJcOMs6LS_MZOvy984AkLSFCXWVsuXS_6xEFDmwq0YKpAQg>
    <xmx:A-aOadaVnWo240VYmUfwgT1_1DsAXrCMqj5eGRHJnxA3j3SB78PBvg>
    <xmx:A-aOaeDCk4qRKYnWHsxsUzjCPXpr4-71q5uKno2FcEsDgMbD9wKFIQ>
    <xmx:A-aOaTnUKJRkQdaCur19_iG429tNDb53a9XiGL-noqk483hobRMrMLKB>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Feb 2026 03:51:14 -0500 (EST)
Message-ID: <12b16bd0d560bb287e7c5102747d29b5326fc420.camel@pbarker.dev>
Subject: Re: [OE-core][scarthgap 00/27] Pull request (cover letter only)
From: Paul Barker <paul@pbarker.dev>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 13 Feb 2026 08:51:10 +0000
In-Reply-To: <cover.1770901572.git.yoann.congal@smile.fr>
References: <cover.1770901572.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-+wCvIrm+ZBPJQgaNnicw"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231104


--=-+wCvIrm+ZBPJQgaNnicw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-02-12 at 14:27 +0100, Yoann Congal wrote:
> Those are the patches from the last patch review:
> https://lore.kernel.org/openembedded-core/cover.1770626074.git.yoann.cong=
al@smile.fr/T/#t
> with the following modification:
> * zlib: ignore CVE-2026-22184 was changed to a cherry-pick from master
>   and needed commits backported:
>   * zlib: cleanup CVE_STATUS[CVE-2023-45853]
>   * zlib: Add CVE_PRODUCT to exclude false positives
>=20
> Passed a-full on autobuilder (with AB-INT):
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3195
> * The build qemuarm-oecore failed:
>   https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/3140
>   This was caused by bug #16143 =E2=80=93 AB-INT: do_image_wic: tar comma=
nd return exit status 2
> * The build qemuarm-oecore was succesfully retried:
>   https://autobuilder.yoctoproject.org/valkyrie/?#/builders/40/builds/314=
3

Hi Richard, Yoann,

We have an understanding of #16143 now, and this issue happening is not
a regression caused by any of the patches here, so I think this is good
to merge.

The following changes since commit d50e4680ed6f930582d907b37c9ed545a89f5c27=
:

  build-appliance-image: Update to scarthgap head revision (2026-01-26 09:5=
0:47 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib pbarker/scarthgap

for you to fetch changes up to e86e50b8c5b16065dcb35ebf4b00eff59c5da78c:

  libtheora: set CVE_PRODUCT (2026-02-12 23:44:37 +0000)

----------------------------------------------------------------
Adarsh Jagadish Kamini (1):
      python-urllib3: Backport fix for CVE-2026-21441

Amaury Couderc (1):
      curl: patch CVE-2025-14524

Ankur Tyagi (2):
      ffmpeg: upgrade 6.1.3 -> 6.1.4
      ffmpeg: ignore CVE-2025-25469

Benjamin Robin (Schneider Electric) (1):
      meta/classes: fix missing vardeps for CVE status variables

Daniel Turull (1):
      improve_kernel_cve_report: add script for postprocesing of kernel CVE=
 data

Fred Bacon (1):
      lighttpd: Fix trailing slash on files in mod_dirlisting

Het Patel (1):
      zlib: Add CVE_PRODUCT to exclude false positives

Hitendra Prajapati (1):
      curl: fix CVE-2025-10148

Hugo SIMELIERE (1):
      libtasn1: Fix CVE-2025-13151

Ken Kurematsu (1):
      libtheora: set CVE_PRODUCT

Khai Dang (1):
      docbook-xml-dtd4: fix the fetching failure

Peter Marko (12):
      expat: patch CVE-2026-24515
      expat: patch CVE-2026-25210
      glib-2.0: patch CVE-2026-0988
      libpng: patch CVE-2026-22695
      libpng: patch CVE-2026-22801
      libxml2: patch CVE-2026-0989
      libxml2: patch CVE-2026-0990
      libxml2: patch CVE-2026-0992
      libxml2: add follow-up patch for CVE-2026-0992
      python3: patch CVE-2025-13837
      zlib: ignore CVE-2026-22184
      glibc: stable 2.39 branch updates

Richard Purdie (1):
      pseudo: Update to 1.9.3 release

Vijay Anusuri (1):
      inetutils: Fix CVE-2026-24061

Yoann Congal (1):
      zlib: cleanup CVE_STATUS[CVE-2023-45853]

 meta/classes/create-spdx-2.2.bbclass               |   1 +
 meta/classes/create-spdx-3.0.bbclass               |   2 +
 meta/classes/cve-check.bbclass                     |   1 +
 meta/classes/vex.bbclass                           |   1 +
 .../inetutils/inetutils/CVE-2026-24061-1.patch     |  41 ++
 .../inetutils/inetutils/CVE-2026-24061-2.patch     |  85 ++++
 .../inetutils/inetutils_2.5.bb                     |   2 +
 .../expat/expat/CVE-2026-24515-01.patch            |  43 ++
 .../expat/expat/CVE-2026-24515-02.patch            | 117 ++++++
 .../expat/expat/CVE-2026-25210-01.patch            |  27 ++
 .../expat/expat/CVE-2026-25210-02.patch            |  38 ++
 .../expat/expat/CVE-2026-25210-03.patch            |  28 ++
 meta/recipes-core/expat/expat_2.6.4.bb             |   5 +
 .../glib-2.0/glib-2.0/CVE-2026-0988.patch          |  58 +++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb      |   1 +
 meta/recipes-core/glibc/glibc-version.inc          |   2 +-
 meta/recipes-core/glibc/glibc_2.39.bb              |   2 +-
 .../libxml/libxml2/CVE-2026-0989.patch             | 309 ++++++++++++++
 .../libxml/libxml2/CVE-2026-0990.patch             |  76 ++++
 .../libxml/libxml2/CVE-2026-0992-01.patch          |  49 +++
 .../libxml/libxml2/CVE-2026-0992-02.patch          | 323 ++++++++++++++
 .../libxml/libxml2/CVE-2026-0992-03.patch          |  33 ++
 meta/recipes-core/libxml/libxml2_2.12.10.bb        |   5 +
 meta/recipes-core/zlib/zlib_1.3.1.bb               |   6 +-
 .../docbook-xml/docbook-xml-dtd4_4.5.bb            |  10 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb         |   4 +-
 .../python/python3-urllib3/CVE-2026-21441.patch    | 105 +++++
 .../python/python3-urllib3_2.2.2.bb                |   1 +
 .../python/python3/CVE-2025-13837.patch            | 162 +++++++
 meta/recipes-devtools/python/python3_3.12.12.bb    |   1 +
 .../lighttpd/lighttpd/0001-mod_dirlisting.patch    |  48 +++
 meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb  |   1 +
 .../ffmpeg/ffmpeg/CVE-2024-35365.patch             |  62 ---
 .../ffmpeg/ffmpeg/CVE-2024-36618.patch             |  36 --
 .../ffmpeg/ffmpeg/CVE-2025-1594.patch              | 105 -----
 .../ffmpeg/{ffmpeg_6.1.3.bb =3D> ffmpeg_6.1.4.bb}    |   7 +-
 .../libpng/files/CVE-2026-22695.patch              |  77 ++++
 .../libpng/files/CVE-2026-22801.patch              | 173 ++++++++
 meta/recipes-multimedia/libpng/libpng_1.6.42.bb    |   2 +
 .../libtheora/libtheora_1.1.1.bb                   |   2 +
 .../recipes-support/curl/curl/CVE-2025-10148.patch |  57 +++
 .../recipes-support/curl/curl/CVE-2025-14524.patch |  44 ++
 meta/recipes-support/curl/curl_8.7.1.bb            |   2 +
 .../gnutls/libtasn1/CVE-2025-13151.patch           |  30 ++
 meta/recipes-support/gnutls/libtasn1_4.20.0.bb     |   1 +
 scripts/contrib/improve_kernel_cve_report.py       | 467 +++++++++++++++++=
++++
 46 files changed, 2434 insertions(+), 218 deletions(-)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-=
24061-1.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-=
24061-2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-01.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-03.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-2=
1441.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13837.pat=
ch
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlis=
ting.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.pa=
tch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.pa=
tch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.pat=
ch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_6.1.3.bb =3D> ffmpeg_6.1.4.b=
b} (98%)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-22695.pat=
ch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-22801.pat=
ch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-10148.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.pat=
ch
 create mode 100755 scripts/contrib/improve_kernel_cve_report.py

Best regards,

--=20
Paul Barker


--=-+wCvIrm+ZBPJQgaNnicw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaY7l/hEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0blk+AQDwgksRJUQ6Uur7hq0uMt/3kJIiOokqPqx1
38gPTDn6tgD9FWoVgp+P63wCHQuHK4vccgLI0ZNVHbPsbJTNQayIyww=
=GUhk
-----END PGP SIGNATURE-----

--=-+wCvIrm+ZBPJQgaNnicw--

