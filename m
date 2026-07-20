Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5237DC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 12:39:39 +0000 (UTC)
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8030.1784551177836010432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 05:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=gEaX5R7N;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Jairjjbs;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id E83BD1D000BB;
	Mon, 20 Jul 2026 08:39:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 20 Jul 2026 08:39:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1784551176; x=1784637576; bh=yJVIBZbdpd
	3XJVYKtsW7pQ/G5aMKrLGvRXEX85yKYlw=; b=gEaX5R7NzdG48nDkzbIkHVNRgp
	CQCOORRxlMk1ERe0lIBUL8R52a5X9yHwmzGfxhMsFTbA5sxbgfpwL1lyegMQM6Ue
	2z7r6Hp8D9IcnF1Avy4ryEzttkkwc76KOOtyIMOiOpwNr/w2uVmXdsT4cRhANzpj
	rA3D6Pdex/NwpX/UcF1Yxb1IF7da6y2iF76ScM+jtR5ct4s5FRDh7o/Q9pYaYQZl
	89Ak6IIbXzuO4SlV545HZ3U0+KVRAD31vcpckuniOdSOPKJ/R8m0MWn1O/b5udKH
	FOTdwZKakL3XLz1fD73pLEZ6G/Jn48NQyCrwRi0AdTEeIrRFyCkX8edEsSpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784551176; x=1784637576; bh=yJVIBZbdpd3XJVYKtsW7pQ/G5aMKrLGvRXE
	X85yKYlw=; b=JairjjbsB36mScXcb3dfX2NzbBkY6oC5Z5rDiJj4E7ufum+IzP0
	ZRcsGAdrDefNH4yaqQ7mSwNJmdvh9TyYkhMEFn21AYDgJVYIeNCH3UXFDSud280V
	kfZmeIRIEhEcTTz95LMHtp5ggvutT8U1D5KJetbwp9yO/zvqUCAKiYpVP35DwX3G
	2E7bgRT6Pk+8b+8DxJDkiWpykcBloKTYFrish1/WQDX5PDotQ8Z83XltiJCr0yZi
	nc/HmYcBxlkSRGkr0W2/NeeepW8YHxu/WpfIC7avxifHceY6i0ojDbeqV4Huq7CI
	iyBnYRhtL+G0r5eVyzzcvN5lG33/IJ455gQ==
X-ME-Sender: <xms:CBdeardyNG_-OA_LSVJhUL1BlWQQrrxKYfEfCvE64h7LpA0MTwccRw>
    <xme:CBdeaoo565w7aRmdPU0mguFspLm_DAxxXEMgGYpWjfxCFJAz-0cJReP7Shn63d0DN
    nM4VxGTkH6gUxfOz4nmQDgt5S-1MnvByA8a3ye3CUlI5jwp5ZzqMI4>
X-ME-Received: <xmr:CBdeah6EjxESHT974Fjy9phgUS85F0S-wM9kJUh7526NTaxXG1NialjiNKcCubW3ZERtGpS1eI8>
X-ME-Proxy-Cause: dmFkZTGRmZQfm8sAdNJZvMuHsD9z92oj8ts/Mb5jmWe6FM6l00o5OgTYSOXld5hIyxZ+3d
    MdSLBm44hJpPenKFx6IW+yJBKtfyeTcMjefveC+e7smFPR0FYZ8KMcqTBCspJj+LVnvUSU
    O/puiyVfITUCRnLmeO/cxMjJnS+2vIlxN00xET2XKd/bPx8tM9D/H079p965nnJPLRRLTn
    ZEaZ9mpls0mEqaBKja5hAr8mOU4IGIPyrQUsdbqsmXU9q0nSjCGPcVIiiai5sSNtqA5EFj
    VzKlkGsOQaKaT8XNSV74BEEiMpe2r0viQAlWHhi1xdE4YxKZtNUmj9WvlmIJAcYdoQ6qnv
    36mbr7Bn+GN4omtE5dndlNPDONBxsXGLJA1MsZZnThc2SnXjkORm1IFPLedowhA9QvurIg
    EO7NJ0abX6gREhO1x796UJXXcORnm7ZgJRe5U6r2NiPx1XmGi7OSsAcCUJ32nDW6p2aJDv
    WCD23VyaZRN2TIdFtmTZTvTzTiW24OfO40QENG3IcJi+7VfQCpsIkoxnvEnVxAnfB1TZeK
    tZl63v7v1hrqWnX2/pcIrsChD6VeXVbRoZqN53oi/OamvSsIjMh1rWJEHjLoRYTB0Dx54U
    fcEjvVUTg3X08pzel2cf2OP7TBiO/5pdTJ+1Vfych8ILDhcthOpVtgzbdmCA
X-ME-Proxy: <xmx:CBdeamq4QCMKtmfryLgokubcPQFHMCNy7f2cTkexDriaE-xUe2IIgQ>
    <xmx:CBdearg8V4By9_q3sKKmpVcLINh1SaseUzK8_bY2Ag7GLi9Y5bzrjQ>
    <xmx:CBdeaoKr45mAgdk8CZFxFZVYJrzmVHyMFJyRci_qJzpAsY4HOcA1Ng>
    <xmx:CBdeajDcsVdLKwmsxCEsdiizbJXQ6s4iQoaEpj---TZQd7NavUBsXQ>
    <xmx:CBdeakSG-230Dxf8xkqQEn7vjnRbdOjkTfsgpfZAC-eXeQVr_gRlMAMN>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jul 2026 08:39:35 -0400 (EDT)
Message-ID: <8903186c462b63958e33a07a4f042359955168d3.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v1] libarchive: ptest: run tests from tmpfs to
 avoid inode overflow failures
From: Paul Barker <paul@pbarker.dev>
To: Pratik Farkase <pratik.farkase@est.tech>, 
	openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Date: Mon, 20 Jul 2026 13:39:32 +0100
In-Reply-To: <20260720122619.34696-1-pratik.farkase@est.tech>
References: <20260720122619.34696-1-pratik.farkase@est.tech>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-/tis3NbwMJeGKeNBXnDd"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241392


--=-/tis3NbwMJeGKeNBXnDd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-07-20 at 14:26 +0200, Pratik Farkase wrote:
> The bsdcpio_test odc/newc format tests verify archive headers byte-by-byt=
e
> including inode and device numbers. On ext4 root filesystems (particularl=
y
> qemuarm64 and qemuriscv64) inode numbers can exceed the odc 6-octal-digit
> or newc 8-hex-digit field widths, causing intermittent assertion failures
> in test_format_newc and test_option_c.
>=20
> Run all tests from a tmpfs working directory where inode numbers always
> start small, avoiding the overflow condition.
>=20
> [YOCTO #16231] : https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1623=
1

Hi,

Has this issue been reported upstream to libarchive? It would be good to
get the test cases fixed so they can handle whatever inode numbers are
allocated.

>=20
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---
>  .../libarchive/libarchive/run-ptest              | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/libarchive/libarchive/run-ptest b/meta=
/recipes-extended/libarchive/libarchive/run-ptest
> index d6b4c3f934..7f61e1b173 100755
> --- a/meta/recipes-extended/libarchive/libarchive/run-ptest
> +++ b/meta/recipes-extended/libarchive/libarchive/run-ptest
> @@ -1,13 +1,24 @@
>  #!/bin/sh
> =20
> +PTEST_DIR=3D$(cd "$(dirname "$0")" && pwd)
> +
>  # The fuzz tests run 1000 randomised iterations per archive format and a=
re
>  # meant for dedicated fuzzing infrastructure, not routine ptest runs. Th=
ey
>  # regularly time out in the time/memory constrained autobuilder QEMU tar=
gets
>  # (e.g. test_fuzz_iso9660). Skip them via the upstream escape hatch.
>  export SKIP_TEST_FUZZ=3D1
> =20
> +# The bsdcpio odc/newc format tests verify archive headers byte-by-byte
> +# including inode and device numbers. On ext4 root filesystems inode num=
bers
> +# can exceed the odc 6-octal-digit (262143) or newc 8-hex-digit (4294967=
295)
> +# field widths, causing intermittent assertion failures. Run all tests f=
rom
> +# a tmpfs where inode numbers start fresh and small.
> +WORKDIR=3D$(mktemp -d)
> +mount -t tmpfs tmpfs "$WORKDIR"
> +cd "$WORKDIR"
> +
>  for t in libarchive_test bsdtar_test bsdcpio_test bsdcat_test bsdunzip_t=
est; do
> -    ./$t
> +    "$PTEST_DIR"/$t
>      if [ $? -eq 0 ]; then
>          echo "PASS: $t"
>      else
> @@ -15,3 +26,6 @@ for t in libarchive_test bsdtar_test bsdcpio_test bsdca=
t_test bsdunzip_test; do
>      fi
>  done
> =20
> +cd /

It's better to use pushd/popd instead of finishing with `cd /`.

Best regards,

--=20
Paul Barker


--=-/tis3NbwMJeGKeNBXnDd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCal4XBBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bjN6AQDAufDQMXNvrgX3QfOjStQvo1Rtid3Npshv
wRYiCnIwmQD+Oir262SpFluQTtaTJoHMvVA6j1Sod+IAcoQz4f9NmwU=
=FibQ
-----END PGP SIGNATURE-----

--=-/tis3NbwMJeGKeNBXnDd--

