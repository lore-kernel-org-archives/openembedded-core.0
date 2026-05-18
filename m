Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B83CD4F4A
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 17:52:49 +0000 (UTC)
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3248.1779126763925891323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 10:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=hvmRZAlh;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=WFq1233R;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id E691A1D00066;
	Mon, 18 May 2026 13:52:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 18 May 2026 13:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1779126762; x=1779213162; bh=rEAkmD1QwO
	W/GkOnD9IcDvWm6Yr97c2yGvAYG0oLXWM=; b=hvmRZAlhcj2MCseepSwbp132Xn
	9MXHRLYVO7jKeqCx0iEbq90zPrIenamNX8f5r+8YxzsS6aYr3MtOHozCKaO62W9M
	aIu2mgmidjQe2U+iEbfiyCjS/J396iQlT3PhocYWYqBV4PlibjTKHQQ8M2KL6IlO
	baHei/eL4DA8dVYfl9Mzw+fsoTNlKz7wi7MwdeAzMs0PQ5u+40q3y51f1ftEZFi6
	V+Ub74hb8rSxaJx9hx1atOd5/M0b87VyK+IxEtdk1xzwP+7L3vHBjLntnJGiAZQm
	P+l22vBLAvHyPoibRzu0do3IlYoeOnEXzCB5TLw2tMJ9RFRvuaMHuDU4HTPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779126762; x=1779213162; bh=rEAkmD1QwOW/GkOnD9IcDvWm6Yr97c2yGvA
	YG0oLXWM=; b=WFq1233RHxvJjWPa2+worhSXseSnPBMR8q/7VD8vHYE3Sd7Adiu
	TOtps2KrdSUjMOly6KwcJA0DqAyxbJueC4XUsHeWvU/AbIHaIjg+4Q1UCb8AnWKw
	S09WBtfOzfR8gsgKWqbxwBfZnay/FeUYG0OVrMp2k2yLTRFCdU5VeEEtEFrDGlwk
	MyDIqcTFhXNRjQCBX7c+qo7BOg8wdUx+NRqDCssWKJTGH6MbXyDFp0MpCH/uQP4L
	TxqYXGcQW3jmzXLwhr0DWBEiaQcBL/UXD9J9fMGdKUEeuFiSg/kZtToaqzi21Eth
	3E6JRTiFVA4XqSJx8Mtt4leWr4JZmmob/xA==
X-ME-Sender: <xms:6lELaq66O41lYN91RmnoAPstSpJi72KWskUoAHGsDEZXJEN-dHrthQ>
    <xme:6lELap5vIqH_4hVAUA2XL9KZ3AQLWhEstjNNRcLg0Qu-9D1Y4YV7IX_esNqohmYEy
    PI-VasCTKwe2TRhg_DThreCmUDaQVIwRLN4Sswe3saz095cuix_rWs>
X-ME-Received: <xmr:6lELanFw4qkT8oL9bg2Yfjau6ENzYWtMN4kiPSPF9xdQk4fkTQc2k-ftDhwEtGnUs9BKERI0Fvd_Cjh7BW_cAV0UMYLUyXKvwRT-pumWMp3M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeelhedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepvdethfdtgfevteetieeuvdehieegkeehgedvge
    etvddttdeufffgleeffeekgfdunecuffhomhgrihhnpeduledrsggsnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvg
    hrrdguvghvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehlihgviihhihdrhigrnhhgseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtoh
    epohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvuggu
    vggurdhorhhg
X-ME-Proxy: <xmx:6lELaiSvdZRTSKQteQ-6q2s5g9ezMF8ZZU0lOMO_Fc1IqcRuVxI1Ow>
    <xmx:6lELagtobIiMXM9GwIwQXOSRoG_5DnOewmwoAttPj_Pv9J_jJYcBUw>
    <xmx:6lELahwaXo3wrY__g1BJhGXk3NTzfQDBW9VOc3Af0rDzQbyIXb5-Mw>
    <xmx:6lELaq746vFt5OHwl_EkDH7qmASiTm28nBX2BSBOpMMwQjBlBRB01Q>
    <xmx:6lELauahXNAVCFowDZUSosEG1K8I0zhQHU3kyADMYf86HVi9BYwLVJYH>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 May 2026 13:52:41 -0400 (EDT)
Message-ID: <cf357f4b53fc07fdc62cf8def7f75395b490feec.camel@pbarker.dev>
Subject: Re: [PATCH v2 2/2] strace: upgrade 6.19 -> 7.0
From: Paul Barker <paul@pbarker.dev>
To: liezhi.yang@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2026 18:52:38 +0100
In-Reply-To: <19dc384322b778c446534c54666b60f0eb721827.1778659781.git.liezhi.yang@windriver.com>
References: <cover.1778659781.git.liezhi.yang@windriver.com>
	 <19dc384322b778c446534c54666b60f0eb721827.1778659781.git.liezhi.yang@windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-wZBKXMlSSE6QRRDxU+eS"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 17:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237255


--=-wZBKXMlSSE6QRRDxU+eS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-05-13 at 01:14 -0700, liezhi.yang@windriver.com wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  ...gnore-pwritev-pwrite64-tests-on-musl.patch | 62 +++++++++++++++++++
>  ...toconf-macro-to-detect-largefile-sup.patch |  4 +-
>  ...kport-ax_prog_cc_for_build.m4-macros.patch |  2 +-
>  ...001-strace-fix-reproducibilty-issues.patch |  2 +-
>  ...002-tests-Replace-off64_t-with-off_t.patch |  2 +-
>  .../strace/strace/Makefile-ptest.patch        |  6 +-
>  .../strace/strace/ptest-spacesave.patch       |  2 +-
>  .../strace/strace/skip-bpf.patch              | 25 +++++---
>  .../strace/strace/skip-load.patch             |  2 +-
>  .../strace/strace/update-gawk-paths.patch     |  2 +-
>  .../strace/{strace_6.19.bb =3D> strace_7.0.bb}  |  3 +-
>  11 files changed, 91 insertions(+), 21 deletions(-)
>  create mode 100644 meta/recipes-devtools/strace/files/0001-Ignore-pwrite=
v-pwrite64-tests-on-musl.patch
>  rename meta/recipes-devtools/strace/{strace_6.19.bb =3D> strace_7.0.bb} =
(96%)
>=20
> diff --git a/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrit=
e64-tests-on-musl.patch b/meta/recipes-devtools/strace/files/0001-Ignore-pw=
ritev-pwrite64-tests-on-musl.patch
> new file mode 100644
> index 0000000000..d19533854c
> --- /dev/null
> +++ b/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tes=
ts-on-musl.patch

It looks like this file has been copied from the directory
meta/recipes-devtools/strace/strace, perhaps by the AUH misbehaving.

Also, a few of the patch refreshes look unnecessary to me as they only
change the From line.

> diff --git a/meta/recipes-devtools/strace/strace_6.19.bb b/meta/recipes-d=
evtools/strace/strace_7.0.bb
> similarity index 96%
> rename from meta/recipes-devtools/strace/strace_6.19.bb
> rename to meta/recipes-devtools/strace/strace_7.0.bb
> index 7b8d4851fb..1150cfda61 100644
> --- a/meta/recipes-devtools/strace/strace_6.19.bb
> +++ b/meta/recipes-devtools/strace/strace_7.0.bb
> @@ -20,10 +20,9 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/strace=
-${PV}.tar.xz \
>  SRC_URI:append:libc-musl =3D "\
>             file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
>             "
> -SRC_URI[sha256sum] =3D "e076c851eec0972486ec842164fdc54547f9d17abd3d1449=
de8b120f5d299143"
> +SRC_URI[sha256sum] =3D "6c92419be3f2ec560b31728a4652217c59864c8642ba7b1b=
3771b1b013ad074b"
> =20
>  # remove at next version upgrade or when output changes
> -PR =3D "r1"
>  HASHEQUIV_HASH_VERSION .=3D ".1"

Please send a v3 with the comment and both assignments dropped.

Best regards,

--=20
Paul Barker


--=-wZBKXMlSSE6QRRDxU+eS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCagtR5hEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bq92AQCXTXPi+uNLCVLe9csbgXsvq+Aj/7OXgobA
NtD6Do3yogD+N287uaxvO6R+N3saEvABXMGQoD80G/zdRD1qFMkhcwY=
=5EC3
-----END PGP SIGNATURE-----

--=-wZBKXMlSSE6QRRDxU+eS--

