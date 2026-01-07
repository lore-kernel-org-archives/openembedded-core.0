Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4496ACEFCE3
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 12:16:35 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4414.1767788193779248725
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 04:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=kXgiapFi;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=yhIn9BpL;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id CEB4DEC0121;
	Wed,  7 Jan 2026 07:16:32 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 07 Jan 2026 07:16:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1767788192; x=1767874592; bh=b339vZpPZm
	S+d9Nc7w5IJtIS1UpiMg0PEG4bzQTBhHs=; b=kXgiapFiKOv9UD2dTYUAW02vHB
	dBnbTQTl0qbA5Tpr1gjXu5ex+EYFEewHDG0aEHahc14h+lB7GusDUD/eXU1//OMe
	kO83HZ9bwYv7DXw2EO52R6FwgWy2hEh3Y0n0hAezlmmOCTu4/WwTLkoa17oXYf6p
	fsgoJJxAAdCp31oG59zNasluAgw41Upto9AFnAWBjUJuP+QlqwXVNWmn5v+eRXZA
	udQmlwTi4SiNROxrtwan/hmn5uP1FpumajhO9MYY61LDGbWbkY53hntZo+FRs1FA
	VWccC08b+GsZKcVGCEp4M+6YDZz81HiLnnRtyyni1rTd6sza9xWhDvGlRRHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767788192; x=1767874592; bh=b339vZpPZmS+d9Nc7w5IJtIS1UpiMg0PEG4
	bzQTBhHs=; b=yhIn9BpL3k0UaIud0DmVDNThzMW/aRYsAHzEe2cg2ZSaox+uMWM
	vMur30/hqWpq/P3h0+kAHxsf/eIcTTvbIQyYeNKqiylk4B/9O2uEKDmH6vrCoekw
	jngMN4bGEc20NMF35QM0ysr3fcfHXUyFX8t93ksQ0FYJBfFGDowoW/DaCGCwM1Ds
	gBfGkSYzKV1ejKe3iXgPxhZJcxfmcjjRmdEKWR3gFmwoYf+YTsTqnpdRfVpBRoNu
	CALxnCkrsuGRq+D/xqxyzsTb/HWQZOLoXCTpxw49lF8tXOYhttA1aeu7jv/npFOw
	fIAiPFj6btfEHvY/S/e+PiQujnnwJxZPlLA==
X-ME-Sender: <xms:n05eaX-WLe0CkhaVJ-tn2nXiW4vSGKyhpTva0K5vzaRF-8TYjD1BdQ>
    <xme:n05eabIlhYJ-TSMGNl336dzxxoifAjohur3JZj7TaOJTX4FrmwD_OVxk65FWUQgDI
    gfrDjEh3dJSGTpqqrXxevSUVunJKJ6vGGtk9PRhKikRhoE6Rp993TQ>
X-ME-Received: <xmr:n05eaSYBJYNkpriLNDlnxGX9B7yk-HdgSbIlfnBYuT_ijj7Rn07MAWzdJ7OfkVeIgxRDn8R7RnCHD76or-oXjrEs6rlnD-zZYjqf2fk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeftdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    ephfefuefhhfejffevfffhudeltdehgfeuveekgfetheekhfejiefgfeekgefgtdetnecu
    ffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtg
    htrdhorhhgpdejledrsggspdektddrsggspdduvddrsggspddugedrsggspdduhedrsggs
    pddvfedrsggspddvgedrsggspdehtddrsggspdehuddrsggspddutddrsggsnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggr
    rhhkvghrrdguvghvpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgv
    mhgsvgguuggvugdrohhrghdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslh
    hinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeihohgrnhhnrdgtohhn
    ghgrlhesshhmihhlvgdrfhhr
X-ME-Proxy: <xmx:n05eadIknAHKOKA12vlfeAsEwq13OOKNa8Wnxn1rGS1FzIPqk03fow>
    <xmx:n05eaQDViXAiywT0QB5vXs9pCRJ6eXKb1erxc4uXM6Wbme3ZEGsN4Q>
    <xmx:n05eaSoynyYZ1l7tuHJgBA2rGmmoPNv4tR-Oa787LfWypU0_yArZ-g>
    <xmx:n05eabghZZEMb8UKcT4DM74VZiE3P7HL7Dbysty5p7Dl0MhSYTgmDg>
    <xmx:oE5eaaS8kGc10iJAQqQSGmyWQ5iAApeliAfYABnpIkZkgnh6hIP-SUlQ>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jan 2026 07:16:31 -0500 (EST)
Message-ID: <6810e05e5f0288aeed2046d8bf2e9e460fdeea43.camel@pbarker.dev>
Subject: Re: [OE-core][whinlatter 00/29] Pull request (cover letter only)
From: Paul Barker <paul@pbarker.dev>
To: openembedded-core@lists.openembedded.org, Richard Purdie
	 <richard.purdie@linuxfoundation.org>
Cc: yoann.congal@smile.fr
Date: Wed, 07 Jan 2026 12:16:27 +0000
In-Reply-To: <CAMSfU+7eCcVO-LLf8OarXgjTFShHojqYpoPuYnRUYAU30R8hTg@mail.gmail.com>
References: <cover.1767710585.git.yoann.congal@smile.fr>
	 <CAMSfU+7eCcVO-LLf8OarXgjTFShHojqYpoPuYnRUYAU30R8hTg@mail.gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-C+z8jpLifY/ZNWhd+3WD"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 12:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228994


--=-C+z8jpLifY/ZNWhd+3WD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-01-07 at 11:20 +0100, Yoann Congal via
lists.openembedded.org wrote:
> Le mar. 6 janv. 2026 =C3=A0 15:58, Yoann Congal <yoann.congal@smile.fr> a=
 =C3=A9crit :
>=20
> > Passed a-full on autobuilder(*):
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2997
>=20
>=20
> As Paul noticed, this build points to the tip whinlatter-nut and not the
> tip of this pull request (my mistake).
>=20
> The correct build for this pull request is
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2960
>=20
>=20
> > (*): The builds/tests parts passed, only the "Send QA Email" step
> > failed. This is a known bug on AB side :
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15696.
> >=20
> NB: This build (2960) is also touched by this bug (15696) but the
> tests/builds parts are fine.

Hi Richard,

I've reviewed these changes and the a-full build results and all looks
good.


The following changes since commit 9964fa3da2fa1e7243fba1a826e59f7bb1813706=
:

  populate_sdk_ext: keep SDK_TARGETS so SPDX/SBOM tasks remain in locked si=
gs (2025-12-18 13:11:45 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib pbarker/whinlatter

for you to fetch changes up to 5c6e573ab4f6125df3381c8ae75d74d00df20588:

  cups: upgrade from 2.4.14 to 2.4.15 (2026-01-07 11:58:31 +0000)

----------------------------------------------------------------
Ankur Tyagi (4):
      gnutls: patch CVE-2025-9820
      sqlite3: patch CVE-2025-3277
      sqlite3: patch CVE-2025-6965
      libxmlb: upgrade 0.3.23 -> 0.3.24

Chen Qi (1):
      cups: upgrade from 2.4.14 to 2.4.15

Deepesh Varatharajan (2):
      llvm/clang: Upgrade to 21.1.6 release
      llvm/clang: Upgrade to 21.1.7 release

Dmitry Baryshkov (1):
      mesa: upgrade 25.2.5 -> 25.2.8

Gyorgy Sarvari (1):
      enchant2: upgrade 2.8.12 -> 2.8.14

J=C3=B6rg Sommer (1):
      glib-2.0: Upgrade 2.86.0 -> 2.86.1

Peter Marko (1):
      libarchive: upgrade 3.8.2 -> 3.8.3

Robert Yang (2):
      e2fsprogs: misc/create_inode.c: Fix for file larger than 2GB
      ccache: 4.12.1 -> 4.12.2

Wang Mingyu (13):
      ell: upgrade 0.79 -> 0.80
      gst-devtools: upgrade 1.26.5 -> 1.26.7
      gst-examples: upgrade 1.26.5 -> 1.26.7
      gstreamer1.0-libav: upgrade 1.26.5 -> 1.26.7
      gstreamer1.0-plugins-bad: upgrade 1.26.5 -> 1.26.7
      gstreamer1.0-plugins-base: upgrade 1.26.5 -> 1.26.7
      gstreamer1.0-plugins-good: upgrade 1.26.5 -> 1.26.7
      gstreamer1.0-plugins-ugly: upgrade 1.26.5 -> 1.26.7
      gstreamer1.0-python: upgrade 1.26.5 -> 1.26.7
      gstreamer1.0-rtsp-server: upgrade 1.26.5 -> 1.26.7
      gstreamer1.0: upgrade 1.26.5 -> 1.26.7
      gstreamer1.0-vaapi: upgrade 1.26.5 -> 1.26.7
      ccache: upgrade 4.12 -> 4.12.1

Yash Shinde (2):
      binutils: fix CVE-2025-11839
      binutils: fix CVE-2025-11840

Zhang Peng (1):
      libpng: upgrade 1.6.50 -> 1.6.51

 meta/conf/distro/include/maintainers.inc           |   4 +-
 meta/recipes-core/ell/{ell_0.79.bb =3D> ell_0.80.bb} |   2 +-
 ...nitial_2.86.0.bb =3D> glib-2.0-initial_2.86.1.bb} |   0
 .../{glib-2.0_2.86.0.bb =3D> glib-2.0_2.86.1.bb}     |   0
 meta/recipes-core/glib-2.0/glib.inc                |   2 +-
 meta/recipes-devtools/binutils/binutils-2.45.inc   |   2 +
 .../binutils/binutils/0019-CVE-2025-11839.patch    |  32 +++
 .../binutils/binutils/0020-CVE-2025-11840.patch    |  37 ++++
 .../ccache/{ccache_4.12.bb =3D> ccache_4.12.2.bb}    |   2 +-
 meta/recipes-devtools/clang/common-clang.inc       |   2 +-
 meta/recipes-devtools/clang/common.inc             |   2 +-
 ...eate_inode.c-Fix-for-file-larger-than-2GB.patch |  40 ++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb |   1 +
 .../cups/{cups_2.4.14.bb =3D> cups_2.4.15.bb}        |   2 +-
 .../{libarchive_3.8.2.bb =3D> libarchive_3.8.3.bb}   |   2 +-
 .../{libxmlb_0.3.23.bb =3D> libxmlb_0.3.24.bb}       |   2 +-
 meta/recipes-graphics/mesa/mesa.inc                |   4 +-
 ...t-devtools_1.26.5.bb =3D> gst-devtools_1.26.7.bb} |   2 +-
 ...t-examples_1.26.5.bb =3D> gst-examples_1.26.7.bb} |   2 +-
 ...ibav_1.26.5.bb =3D> gstreamer1.0-libav_1.26.7.bb} |   2 +-
 ....26.5.bb =3D> gstreamer1.0-plugins-bad_1.26.7.bb} |   2 +-
 ...26.5.bb =3D> gstreamer1.0-plugins-base_1.26.7.bb} |   2 +-
 ...26.5.bb =3D> gstreamer1.0-plugins-good_1.26.7.bb} |   2 +-
 ...26.5.bb =3D> gstreamer1.0-plugins-ugly_1.26.7.bb} |   2 +-
 ...hon_1.26.5.bb =3D> gstreamer1.0-python_1.26.7.bb} |   2 +-
 ....26.5.bb =3D> gstreamer1.0-rtsp-server_1.26.7.bb} |   2 +-
 ...aapi_1.26.5.bb =3D> gstreamer1.0-vaapi_1.26.7.bb} |   2 +-
 ...treamer1.0_1.26.5.bb =3D> gstreamer1.0_1.26.7.bb} |   2 +-
 .../libpng/{libpng_1.6.50.bb =3D> libpng_1.6.51.bb}  |   2 +-
 .../{enchant2_2.8.12.bb =3D> enchant2_2.8.14.bb}     |   2 +-
 .../gnutls/gnutls/CVE-2025-9820.patch              | 233 +++++++++++++++++=
++++
 meta/recipes-support/gnutls/gnutls_3.8.10.bb       |   1 +
 .../sqlite/files/CVE-2025-3277.patch               |  29 +++
 .../sqlite/files/CVE-2025-6965.patch               | 117 +++++++++++
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb      |   5 +-
 35 files changed, 521 insertions(+), 26 deletions(-)
 rename meta/recipes-core/ell/{ell_0.79.bb =3D> ell_0.80.bb} (88%)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.86.0.bb =3D> glib-2.=
0-initial_2.86.1.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.86.0.bb =3D> glib-2.0_2.86.1=
.bb} (100%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2025-1=
1839.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2025-1=
1840.patch
 rename meta/recipes-devtools/ccache/{ccache_4.12.bb =3D> ccache_4.12.2.bb}=
 (93%)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-cre=
ate_inode.c-Fix-for-file-larger-than-2GB.patch
 rename meta/recipes-extended/cups/{cups_2.4.14.bb =3D> cups_2.4.15.bb} (51=
%)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.2.bb =3D> libarchi=
ve_3.8.3.bb} (96%)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.23.bb =3D> libxmlb_0.3.24.b=
b} (93%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.5.bb =3D> gst-=
devtools_1.26.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.5.bb =3D> gst-=
examples_1.26.7.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.5.bb =3D=
> gstreamer1.0-libav_1.26.7.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.5.=
bb =3D> gstreamer1.0-plugins-bad_1.26.7.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.5=
.bb =3D> gstreamer1.0-plugins-base_1.26.7.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.5=
.bb =3D> gstreamer1.0-plugins-good_1.26.7.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.5=
.bb =3D> gstreamer1.0-plugins-ugly_1.26.7.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.5.bb =
=3D> gstreamer1.0-python_1.26.7.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.5.=
bb =3D> gstreamer1.0-rtsp-server_1.26.7.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.26.5.bb =3D=
> gstreamer1.0-vaapi_1.26.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.5.bb =3D> gstr=
eamer1.0_1.26.7.bb} (97%)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.50.bb =3D> libpng_1.6.51=
.bb} (97%)
 rename meta/recipes-support/enchant/{enchant2_2.8.12.bb =3D> enchant2_2.8.=
14.bb} (91%)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-3277.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-6965.patch

Best regards,

--=20
Paul Barker


--=-C+z8jpLifY/ZNWhd+3WD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaV5OmxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0brc+APsH7fMnMswi/iyYK/YuGganvYxGIJL0LjzT
AfPKxqbyHwEAueVi4L40EidBUADUtfu0ix2svVWGnyrNImsZVajupgQ=
=0IYY
-----END PGP SIGNATURE-----

--=-C+z8jpLifY/ZNWhd+3WD--

