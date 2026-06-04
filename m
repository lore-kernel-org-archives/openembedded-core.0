Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED368CD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 12:04:12 +0000 (UTC)
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9810.1780574646424419042
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 05:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=BXDnQJBd;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=akvUXGVb;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id E3DF51D00185;
	Thu,  4 Jun 2026 08:04:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 04 Jun 2026 08:04:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1780574644; x=1780661044; bh=1J36jzMF/e
	Z0hEn3q5/6OCknqIXqirby1jAZP0uliH8=; b=BXDnQJBdqKF3Esz0YNvGvntN/9
	h4PeS0Jb3bVQeceel04NKYOu0tx58LSCbmAlwPMjSXaQ7dp3HZpZ8ehkZzJXoZDh
	7lOgaMJrmQkdUhkm+OQg2fuw+R3rvhRQvDMGiwqCUsi99KUM45tL6Bvmclcxdij0
	KLeeqUCXo2eoVhT7VeDYvtYss4nqq9IAP6mWbQpbnr2Og1pmOXwVfcyfnIu72AmJ
	GdxVkFzYSETq2zbj2v0fJ4Go760Aw0OJXYOGqSZkKbM+yEhAIKKgtv5MazMZZV+r
	tkdyp9aP4MYHbrYiEA5UBt2QywosOnkK4GOmKCx25pxfoVHvlnldBSfloI5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780574644; x=1780661044; bh=1J36jzMF/eZ0hEn3q5/6OCknqIXqirby1jA
	ZP0uliH8=; b=akvUXGVbllJRvJ0W1nGRBclQNln7zZ3FVz1WubGbQMTD4eRh2Mv
	pW9CHP2ebJez71oHfw24B/1HlkIFKK9SKQLZkgfPPNY46kNRvAs/fy12k1b1hSXh
	IM6tXUxRIsv7OAIbnusSA6fcYDyJ/VUG7SgEjrZfRYJ+upPvcQ+bU8A29wM/ULPh
	zWKqXlfT4OX+krCPuFecMf6ovDtB3rS4uX+tlI23mtqACNiMFWiXasFpIbJW2db2
	VGjfY/4KyL69j/eY7K4Q3t4+35exnq+1wsM0U64SvL2Jc9Y51gQuRlZ5PVZndY5r
	SjEGnDTc1QS5nLrTLWjNpqJTS17yoa/Ud6Q==
X-ME-Sender: <xms:tGkhasvI9YWvzFKrA3jLhTGJjxTiKOX0R3QK7o9EFAp9QBJ822PKvw>
    <xme:tGkhagehX2Sj0Mk-OuhBkg5Q_-5l_K-Ybhn2U08uvwKSy8jjItdnU6lwbCOK8c1bW
    5XDYF4I_ZwG9RIw2B8MMhxI_abwGJIIWzIrgU6uyPJ0IUmJa509LCg>
X-ME-Received: <xmr:tGkhasznwZmt9gQaeE26zI8kgKDo3luVVluxA6FxFzgxfihWcZrj6TAZ4uEK1EAi_Zaw6uL_B2HEjXWZcFN4RN5Aa5tRF8L0gYfkMbELmV-eFXdYNFi5SJbJ4aVDwyVG>
X-ME-Proxy-Cause: dmFkZTEFZ0hoCY+ccOjKN+x6REImvRZyEUL/OY2y6QDTwHJo3DSXe+KQ3qNEXNVRFTNcEl
    /SQmxht+Ccpb7d8wm+J9mW3H2j4qSvdCDmzduH80Xjkcf9V0KMLAopVCyKBP5nG5WORC2U
    +08r7dN7kGDqBIicSryfIxh66itJmdQn+9ZEDxf6eoSCpJRjrP849WYvGBl2tnM00fBMV6
    5HmRFvj2Q9L0sXRYTDpSiOTlr3Dray61t2H7/M3bD+sYwUszmkwNH0eQsdqbQfPbXDhkJU
    VhTgQPQt8XV1+a/FDfCRM9c2zJ1lJTE2JQCH0vEqIQEBkwXKHfp6Q1qzcPWIjVamWBlzNa
    EiGVfKnrzkecgWyolk82vYp4J8HgCienFb3SGtO2fEjjcrDy61p5ixHWERnuVLIfZO/HVM
    MZRufAb4X8bXZNxbykelRYBnZAX77Tyov70sgak4FlqCOb0cy1o2iX3R0WgPR8rU2OAUbR
    h9UrLaLcSvsmznQ39drp6mvNlP4Mxl6Dybz6A71BSfMdD0QZ+vatZC+0Ytk+FDsgUn6Kff
    Q0XqizeDB4tGyWuqz94w76055BylJqJmbq1XZpQUTvmdxnzwRZ488OmcW1N6EvE5ayGnfM
    WLuNEkeSq7vk+v+32xXRHVt6AbmcEe+QB/MJijoHWoVktppDYBcoljY9TsMg
X-ME-Proxy: <xmx:tGkhauEHAR9ZlaEOuC5zxY3DiEmA-hu2FNrUA9LGjNTWLBBKlycvww>
    <xmx:tGkhaoy2MS9tr84ZOFCKG99_Y-M9JcF3YgVjgI6smis1kCfVAFHdwQ>
    <xmx:tGkhanvP0sGUOUgK5WtbKF7SPS-St-MW1jITFTYhaT5TgM-Q8h60cA>
    <xmx:tGkhat3seWTBCA3bMYL-RIBkDogt3OMulLaR9OOt2p9cPuf6mrLyqQ>
    <xmx:tGkhaidVizfc6atFUbYLPaJRh8daOMS57gHZ2AFlHlSeZzMY8xPHodOb>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jun 2026 08:04:03 -0400 (EDT)
Message-ID: <f19df634ee723f14bff147ddc011bf9a91fc5c1f.camel@pbarker.dev>
Subject: Re: [PATCH v5 3/3] oeqa/selftest: add oe-selftest for kernel module
 pre-filter
From: Paul Barker <paul@pbarker.dev>
To: Sam Kent <sam.john.kent@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com, richard.purdie@linuxfoundation.org
Date: Thu, 04 Jun 2026 13:04:00 +0100
In-Reply-To: <20260505182844.1136632-3-sam.john.kent@gmail.com>
References: <20260505170521.1129945-1-sam.john.kent@gmail.com>
	 <20260505182844.1136632-1-sam.john.kent@gmail.com>
	 <20260505182844.1136632-3-sam.john.kent@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-C/XOmZM9la3lFNjjhz77"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 12:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238130


--=-C/XOmZM9la3lFNjjhz77
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-05-05 at 19:28 +0100, Sam Kent wrote:
> Add selftest-ko-filter recipe and a PackageTests.test_kmodule_prefilter
> oe-selftest that builds it to verify process_split_and_strip_files()
> handles .ko.xz/.ko.gz alongside a real .ko without corrupting them.
> Regression test for YOCTO #2348.
>=20
> AI-Generated: Uses Claude Sonnet 4.6
>=20
> Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
> ---
>  .../selftest-ko-filter/files/module.c         |  3 ++
>  .../selftest-ko-filter/selftest-ko-filter.bb  | 29 +++++++++++++++++++
>  meta/lib/oeqa/selftest/cases/package.py       | 22 ++++++++++++++
>  3 files changed, 54 insertions(+)
>  create mode 100644 meta-selftest/recipes-test/selftest-ko-filter/files/m=
odule.c
>  create mode 100644 meta-selftest/recipes-test/selftest-ko-filter/selftes=
t-ko-filter.bb
>=20
> diff --git a/meta-selftest/recipes-test/selftest-ko-filter/files/module.c=
 b/meta-selftest/recipes-test/selftest-ko-filter/files/module.c
> new file mode 100644
> index 0000000..f6d50ba
> --- /dev/null
> +++ b/meta-selftest/recipes-test/selftest-ko-filter/files/module.c
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: MIT */
> +/* Minimal relocatable object used as a .ko stand-in for pre-filter test=
ing. */
> +int selftest_ko_filter_marker =3D 42;
> diff --git a/meta-selftest/recipes-test/selftest-ko-filter/selftest-ko-fi=
lter.bb b/meta-selftest/recipes-test/selftest-ko-filter/selftest-ko-filter.=
bb
> new file mode 100644
> index 0000000..1b8cc73
> --- /dev/null
> +++ b/meta-selftest/recipes-test/selftest-ko-filter/selftest-ko-filter.bb
> @@ -0,0 +1,29 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +SUMMARY =3D "Test fixture for the kernel-module file pre-filter in packa=
ge.py"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
> +
> +SRC_URI =3D "file://module.c"
> +S =3D "${UNPACKDIR}"
> +
> +MODDIR =3D "${libdir}/selftest-ko-filter"
> +
> +do_compile () {
> +    ${CC} ${CFLAGS} -c module.c -o module.ko
> +}
> +
> +do_install () {
> +    install -d ${D}${MODDIR}
> +    install -m 0644 module.ko ${D}${MODDIR}/
> +
> +    # Fake compressed modules =E2=80=94 the pre-filter must not pass the=
se to strip.
> +    # Use octal escapes: dash (the OE recipe shell) does not support \xH=
H in printf.
> +    printf '\375\067\172\130\132\000' > ${D}${MODDIR}/module.ko.xz
> +    printf '\037\213'                 > ${D}${MODDIR}/module.ko.gz

Hi Sam,

Why are you writing bytes via printf here instead of using gzip and xz
to compess module.ko? You don't necessarily need to change this, but
please explain it in the commit message or comment.

> +}
> +
> +FILES:${PN} =3D "${MODDIR}/*"
> diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/self=
test/cases/package.py
> index 38ed717..d33424b 100644
> --- a/meta/lib/oeqa/selftest/cases/package.py
> +++ b/meta/lib/oeqa/selftest/cases/package.py
> @@ -185,6 +185,28 @@ class PackageTests(OESelftestTestCase):
>                  if not gdbtest(qemu, binary):
>                      self.fail('GDB %s failed' % binary)
> =20
> +    def test_kmodule_prefilter(self):
> +        # Regression test for YOCTO #2348: process_split_and_strip_files=
() must
> +        # use f.endswith(".ko") so that compressed modules (.ko.xz, .ko.=
gz) are
> +        # not fed to is_elf() / strip.
> +        bitbake("selftest-ko-filter -c package")
> +
> +        pkgdest =3D get_bb_var('PKGDEST', 'selftest-ko-filter')
> +        libdir  =3D get_bb_var('libdir',  'selftest-ko-filter')
> +        moddir  =3D pkgdest + "/selftest-ko-filter" + libdir + "/selftes=
t-ko-filter"
> +
> +        self.assertTrue(os.path.exists(moddir + "/module.ko"),
> +                        "module.ko missing from PKGDEST")
> +
> +        for fname, magic in [("module.ko.xz", b"\xfd\x37\x7a\x58\x5a\x00=
"),
> +                             ("module.ko.gz", b"\x1f\x8b")]:

I find it very confusing that we have octal escapes in do_install() and
hex escapes here. If we have to use octal escapes due to dash
limitations, let's also use octal escapes here.

> +            path =3D moddir + "/" + fname
> +            self.assertTrue(os.path.exists(path),
> +                            "%s missing from PKGDEST" % fname)
> +            with open(path, "rb") as f:
> +                self.assertEqual(f.read(len(magic)), magic,
> +                                 "%s header corrupted in PKGDEST" % fnam=
e)
> +
>      def test_preserve_ownership(self):
>          features =3D 'IMAGE_INSTALL:append =3D " selftest-chown"\n'
>          self.write_config(features)

Best regards,

--=20
Paul Barker


--=-C/XOmZM9la3lFNjjhz77
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaiFpsBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bo97AQCIIIhJ/XOT/WVcACBJYYWbpuAwqlo5lXT6
qXPtXDDdZwD+KddLabhBgen/oumsWsF7to/Q1ZEY46EgBbaEvoNJuAY=
=CD1O
-----END PGP SIGNATURE-----

--=-C/XOmZM9la3lFNjjhz77--

