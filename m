Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F14E9E2FF
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:33:17 +0000 (UTC)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16719.1770807130295699675
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 02:52:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@paulbarker.me.uk header.s=fm2 header.b=kbrJ5syI;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=QIkjC2ST;
 spf=pass (domain: paulbarker.me.uk, ip: 202.12.124.153, mailfrom: paul@paulbarker.me.uk)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DBC677A014A;
	Wed, 11 Feb 2026 05:47:36 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 11 Feb 2026 05:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	paulbarker.me.uk; h=cc:content-type:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1770806856; x=
	1770893256; bh=VdXFhOUFqGOLPAQGCChgYPfYZnFwuCS1TXzFyLsqyo0=; b=k
	brJ5syIQtjKXrIqzm2uRRB/drYQROQJ1jd6eRvmdBLqIbT/RJn7f0KrFNDe2U9Da
	SD5QRu+z4Zge0alpScixzScwoYm1uSRdfzGaY+lthuTZ/2qIO/wIMt0Fd6cZtIUG
	pwWEIPoJiIpeXY2Fwnlr0JYvXSGbtx3UGOdCATEkLCBEbav7DGC1+FpDgkNsUcF5
	E65ivethn7KT06XKleghB7W9A4ghGBah6Qda8dA9YZ4mszDk4Fe5FsEHQiOWIReZ
	9GEaBbErtm5miUsuXpda0RS3s3lxECUEVQ33UiH7vVJGSSfbj0vdPLNE2Q0RBV5W
	1r7s3YbWalBAJGEVSGezQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770806856; x=1770893256; bh=VdXFhOUFqGOLPAQGCChgYPfYZnFwuCS1TXz
	FyLsqyo0=; b=QIkjC2STxCTISfkwW31kKV7o+aXvKOvHg1a48ArIXx23jQ/jgfN
	Y+e4XOUUu5I4lQ+QdYQoYZ/mTLrphMJuCNjgQtX3VIr7yybcK1XpIm3aZrzSV5Km
	Nn4GGfgXrNHmc/MBh5jAflFA1WxCVkucIuicYXV6H5Jn/any+uSLOagnFvIBvXWQ
	1kbVUeNVdi0ZFgT0UrAcXdB4xrapljG+cEQ8FipC7oi/IvgPBjupeX2ZFJkbCfFI
	NokZOlkJEd5tF23udCR6D/Y/2JOHMDcOTZnyxebCt7lJzCXXHshAv/eYD97eMpMB
	d1hzuxwYSGMyZdoIsZ5HQfIg4kzUwBgSwHQ==
X-ME-Sender: <xms:SF6MaamVJl1Zl3XSEPrcPaze6Cw1Wy5UVRw442KyA9w3vnDvr1Qg9w>
    <xme:SF6MaX0uQ7IaOnt2_CtZKGF4WNiVvlIttk-5pGJee_Da2aBwJfrO21qpsknsJgVsB
    B54L_sJEhn-LWOgScxqsVACI1Hl8YllCy4c7RHbKB25DparbBen8MKD>
X-ME-Received: <xmr:SF6MaWQP5Lf3a5T8HIQxClnQgXDd5NIi7tfziMr2EIrYN7DAszazfM5B-SNEm_lU_qp28yOPVaEWu-mxe0f-aPRobixG6PB0Uqi6KY2EwoAa>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtddvfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgruhhlsggrrhhk
    vghrrdhmvgdruhhkqeenucggtffrrghtthgvrhhnpefhteeiuedvveffueetgfeiuddvff
    ekgfehueefueetvdevtdejfedvveduffejjeenucffohhmrghinhepohhpvghnvghmsggv
    ugguvggurdhorhhgpdhgihhthhhusgdrtghomhdptghhrghnghgvlhhoghdrmhgunecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehp
    rghulhgsrghrkhgvrhdrmhgvrdhukhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepfigrnhhgmhihsehfuhhjihhtshhurdgtohhmpdhrtghp
    thhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsg
    gvugguvggurdhorhhg
X-ME-Proxy: <xmx:SF6MaZuu-EHnjEU5SUzGKpkRIBpQDeMgYplqXWU8V-vchKGNYAu8JA>
    <xmx:SF6MabYXbM4ZYWj_yZznakosWzxxIVIYuu5YU7xSbc9csTgiMBGeRw>
    <xmx:SF6MaeuHs06lDN_paU69ps1DcQPi-YFAoU2szZ2Z7S2joMzMyXA97A>
    <xmx:SF6MadGzxsC4qJfRmbDtuGiFkku3zXDbviFTXKya0pwYcV_Jfh7J4Q>
    <xmx:SF6MaRP72m6Jt8GkBo1AEQtft5OqeafZvnjDKy2SPrmW8RdpAQHBInN2>
Feedback-ID: i9eb1465b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Feb 2026 05:47:35 -0500 (EST)
Message-ID: <00926e57ad08803e172e4f5706505e403041cb3b.camel@paulbarker.me.uk>
Subject: Re: [OE-core] [PATCH v2] python3-poetry-core: upgrade 2.2.1 -> 2.3.0
From: Paul Barker <paul@paulbarker.me.uk>
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Wed, 11 Feb 2026 10:47:32 +0000
In-Reply-To: <20260201234916.1208-1-wangmy@fujitsu.com>
References: <20260201234916.1208-1-wangmy@fujitsu.com>
Autocrypt: addr=paul@paulbarker.me.uk; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-mqo1K8Id7LgyLPwmDHa5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 12:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230984

--=-mqo1K8Id7LgyLPwmDHa5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-02-02 at 07:49 +0800, wangmy via lists.openembedded.org
wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> License-Update: file format changed from "ASCII text" to
>                 "ASCII text, with CRLF line terminators"

Hi,

Thanks for respinning the patch.

The license file format change was actually the other way round, and we
should say which license was changed. So, perhaps this should be:

    License-Update: In vendored lark library, line endings in the
        license file were changed from CRLF to LF.

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

Please undo the formatting change here to reduce the size of the diff.
The only line that should change in LIC_FILES_CHKSUM is the lark license
checksum.

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

I see that you've also sent a follow-up patch to update to poetry-core
v2.3.1, feel free to merge that in to this patch when you send v3.

Best regards,

--=20
Paul Barker


--=-mqo1K8Id7LgyLPwmDHa5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIwEABYKADQWIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaYxeRRYccGF1bEBwYXVs
YmFya2VyLm1lLnVrAAoJEKtjVOyduvRuDIQBAPqTy4Ji6ExbSgeWCVtHdGRB02tP
RDoAc+Cs5yeaktZxAQD8MhQzFGOQZghMQuL7r6iULYmVnrEP0IuahHWlriwKDA==
=OBZE
-----END PGP SIGNATURE-----

--=-mqo1K8Id7LgyLPwmDHa5--

