Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238DBC44501
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 16:24:49 +0000 (UTC)
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.121.1783959887458444614
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 09:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=GNj5Uvw/;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=dqo4xI2X;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 43703EC01EE;
	Mon, 13 Jul 2026 12:24:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 13 Jul 2026 12:24:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1783959886; x=1784046286; bh=hMb3d+eBJP
	BU30ZpK7a14z9p6E9am8l1BRd46Ijg3Es=; b=GNj5Uvw/CBZYUMjuKgsWJAdi1Z
	fZhFFOKTfoy5P68rJUkFD21I5/kFf9+Mb4ut0GPjMltdCgOPluy5ANcVC/iDWPe8
	kjboeB4+QM2yjhvGtbAgBvX7KcNQonfUAW5haDh2yRsE/mo42npiLvOZ5qyPUmEL
	JYftXadZqiBefxmB9VgdNsio7zBaIXte29WKj5y3aYEnUKNGBVou/Z6j3ETr+l5m
	adUusHTLBeZLfoPGQQjVb4UlW6QP2hxX9NMk6uAgj74ngB+sYKFS7P7Nw4cqru9W
	L9zvnzMKs7TiWoH839OLXat9nz3l5lQsyMrySwq2Fzoh/kjhWA3Eb55Ltb8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783959886; x=1784046286; bh=hMb3d+eBJPBU30ZpK7a14z9p6E9am8l1BRd
	46Ijg3Es=; b=dqo4xI2Xmftdbh3sleuFvgXFcR28PM+m5O+zYD0lnpo7wmsektw
	1zP3CJmjD2tAsQkztNBVVpFlA2zeIMbWXvfcCXKJnmBnRn+2QO56p6Js20h4Z1nv
	9uXHzoAK67Lk6GbV6ulefPPmYrhNfyLOqsd9f37VzLm4is5SVJvOKiZJq1I5XyAk
	ugiMQoJDNyS5vohiXCZ1jiZP0aFhCsrxPI5/MxQoVSAYIx5uA2RO0f0qJeTQYIdR
	tXVHSGX1V+TUZuiVClO/ZwDOJKu5emynZhbAfiluZyUWJALbbfkERi20b36YV5ol
	c5cjl0g4+2Q8tE3lcjzWDG6c6y8pA3cDWQA==
X-ME-Sender: <xms:ThFVakZM9iy0nypRHVjarUSRoA6xwokeU7a_PM3XKAWXsrKjfcPfFQ>
    <xme:ThFValb9gEqXOnK7SI5ZftxA3S6g-jLmYVTB7RdSIjiMjIyKwd4XllMuFOSwPjlYB
    FS1Faj6PfeunWIQLWW1ITPPhR59bcdoq48zQaBT_7XrOMmxa7NvWxk>
X-ME-Received: <xmr:ThFVaskXGPCixTKpr7PCGRz0NFHU0iQHdmVsic3jOs3rM9UJJLTfe27f3Nd9MNsm9FCgWUxShAK_LgNmoQ7QH1ocqPnbp8vUtv5FClgEUMoE>
X-ME-Proxy-Cause: dmFkZTF1dzU9VJ8NY1ujRCeVwb8mtFqyRlUp3lfns+VZV5Vijpyka0G+ao77RqDT3sMDkP
    sFbcZnPodeD9BxeifXyUcup3vtA1AO6/cQXL/XIaRQApauLwAqLHK82YMZqI57wWfEEVy8
    FoOqN7fIP8ci7176wOOugrfx23oilrcZLQ3dm7200LSsM8vfo1tx7SA6NUQrikwtoP8tdv
    UDOTm/OC+3T/U5u90Rb4jhZVnRPr0fy7wN2/p+gg4j8pjTcuol4KzJPwReluKOaq/qUbUM
    /NZtE8XNHg1ZyrSJaOmzoMgQ3ikkyPQBzJSFELjz0jx1hBHh0pg+WhdQY0f1vVRkc6pgDX
    3bkJeCY0wCw9+9DxseyOnPdoAxdEymKO/71qcgYl2X9GRl9ftLMQVOOOvkbw4fZfTf3fNS
    RTrS55gAzcCiVkkA9gBTVlOlJyxkOPLnCi0fLeEnqFmaomw2pugKRa//h0EdxZcRy9OSs4
    /bZtjrriScjQguoPsWQyQu5/HFp6VVXYMmzgiZyJYSptxKnlGTuPQt3vkRdGbjjA4aHCJC
    tlHouIyefyBlZec4lE7LnuGPqSxVY4NXKWp9g5BX8f3AWaMI9SR8NqItTHMlqdO33FRZHZ
    iCLTmrOW9XUCJYPgb+9X/DQINY5xX8eqdc14vQPUgv4LiaVJOsNqwQnYwExw
X-ME-Proxy: <xmx:ThFVapz_xkLxgwfOrJHl0C6XnO-HZS9rKJCf_6_HwwXPW9Ll9dMgDg>
    <xmx:ThFVaiN79w2s2Ea2l5az8BkFYeZHmJVEkLeArKsakFFYC8-bYPuIeQ>
    <xmx:ThFValTL3MazW_l7Mtd3J_3dJSctm8jcM7QuPCm9lfxlFRMEM_fnSg>
    <xmx:ThFVaoa9tC8CMIcpAB5TvPI7M2sQzbZASvPirNa6hunEi31cswvheQ>
    <xmx:ThFVakcK8ii05GnfFlsKY2uDHksZDYFVblMTbv1n_VqlBDuorHwvVGyj>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jul 2026 12:24:45 -0400 (EDT)
Message-ID: <56fd0d75fa3ab81dd52b4e792284e029d2d92f51.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH 2/4] python3-ply: set CVE_PRODUCT and
 CVE_STATUS for CVE-2025-56005 as disputed
From: Paul Barker <paul@pbarker.dev>
To: mark.yang@lge.com, openembedded-core@lists.openembedded.org
Date: Mon, 13 Jul 2026 17:24:39 +0100
In-Reply-To: <20260710074415.3341616-2-mark.yang@lge.com>
References: <20260710074415.3341616-1-mark.yang@lge.com>
	 <20260710074415.3341616-2-mark.yang@lge.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-4YTdv3ug0moZ+SoxyzxQ"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 16:24:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240845


--=-4YTdv3ug0moZ+SoxyzxQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-07-10 at 16:43 +0900, mark.yang via lists.openembedded.org
wrote:
> From: "mark.yang" <mark.yang@lge.com>
>=20
> For python3-ply, the CVE_PRODUCT should be set to ply, not python:ply.
> NVD registers ply as dabeaz:ply, so the default python:ply vendor prefix =
never matches and no CVEs are reported.
>=20
> CVE-2025-56005 is disputed.
> See https://nvd.nist.gov/vuln/detail/CVE-2025-56005
>=20
> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---
>  meta/recipes-devtools/python/python3-ply_3.11.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/reci=
pes-devtools/python/python3-ply_3.11.bb
> index 2c5fa3f215..ce45bbc1bd 100644
> --- a/meta/recipes-devtools/python/python3-ply_3.11.bb
> +++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
> @@ -14,4 +14,8 @@ RDEPENDS:${PN}:class-target +=3D "\
>      python3-shell \
>  "
> =20
> +CVE_PRODUCT =3D "ply"
> +# https://nvd.nist.gov/vuln/detail/CVE-2025-56005 Disputed
> +CVE_STATUS[CVE-2025-56005] =3D "disputed: PoC fails to demonstrate code =
execution; picklefile is a developer-controlled parser-table cache paramete=
r"
> +

Hi,

The NVD entry [1] says:

  A third-party states that this vulnerability should be rejected
  because the proof of concept does not demonstrate arbitrary code
  execution and fails to complete successfully.

Following the links in the NVD entry I see what I assume is the argument
to dispute this [2] and an argument to dispute the dispute [3]. It's not
very convincing to me. I think we need a more clear reason why we want
to ignore this CVE.

[1]: https://nvd.nist.gov/vuln/detail/CVE-2025-56005
[2]: https://github.com/tom025/ply_exploit_rejection
[3]: https://www.openwall.com/lists/oss-security/2026/01/29/1

Best regards,

--=20
Paul Barker


--=-4YTdv3ug0moZ+SoxyzxQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCalURRxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0btSkAP0XTVBXS847N9CJf0L8SFQAhaJq4WS70QWC
xHgLvJQNJwEAp/4Hl2TjEqbe410lu4Hq75l+v7t86BBEsiBf2YH4WAQ=
=RDI8
-----END PGP SIGNATURE-----

--=-4YTdv3ug0moZ+SoxyzxQ--

