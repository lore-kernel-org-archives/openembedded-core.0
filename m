Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9670CC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 07:49:01 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4065.1784533733321431309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 00:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=QQhdaviQ;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=JzVElgAh;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id D13C7EC017D;
	Mon, 20 Jul 2026 03:48:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 20 Jul 2026 03:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1784533731; x=1784620131; bh=6OlAM+x363
	10MyAIOD1VUZ7TmQvhvQ4IVNRB+0C9Au0=; b=QQhdaviQrrVzZgfsVOjd5R3utq
	OjlV2oocX52dP5Li3EJMRIKBD7nIL4Wftj47RzgWeGUy5tmdK2Vt+mg7nXkFNno9
	ZGlxq+3d48jv/O1+riRTGUxpLUki4x/ZO0+SpGd8d8Ttiuw5vL24ghCgeYLvywAi
	pr+AkNuYoTsGvieT6L/j1f17T4/t1TYAB9JN9i0rYap/IRzfVNxrJDQjR/DRPyGu
	LrX0glYkLLmMvUVzLFe+OmVWvFi3lvJaDI0qvNqitQQxG59ip/1ksAZ6jwI/LTud
	HXeQhNUxZy/ch6KvjjVpr6kDMv7a/2NLFHshfZ8KPzGk/Thq1Nw9q9GbVv8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784533731; x=1784620131; bh=6OlAM+x36310MyAIOD1VUZ7TmQvhvQ4IVNR
	B+0C9Au0=; b=JzVElgAhcjC5OWLAJKqfxf2VHsVT+QqEOtFC75ywKwPLG3b7X2T
	KpXH/kmYeP91HxVXSvt2LGIP4HzHbgNV+u2NiqYqR2izW+2PYpSfUVQ4w346/xsp
	lEy7rmMJvs+qYJebFvnZp3pG25gWIZpUA0oqZ3I6TI6DkziNC0JSf8xcvCl3I+tW
	RZGlCPv/TuBtPj/zQv0L/Ygzou2zupoAbs3BNjCnmAy7+XDAQs3iDHIpIactZJZN
	bQaYP2rPBdeEJcmyyMfYBwLEaMjKW6i9cBKDMtLARw1LzeT/Uy+9mWvdaO9S3iUN
	etbCkf7WdedI5XWPvvxp75eWhvCUS1bOzyA==
X-ME-Sender: <xms:49Jdaq41f_Wbu_ZMUay-mmhysT58IRvh7NZCPKtw3vxP2DB9ZlKHMQ>
    <xme:49JdarUmnuMf8RkX5-HvlPTS07tEM0KQwThMxgXcqENf8UXP1dXVm2McPEGSzd6iI
    1XVuj8X1z6pyqn68gXC4OQUk7RCQtJlZItF0n8ukneEv5o7XIHfMkM>
X-ME-Received: <xmr:49Jdam0hd9rXayb54RPYogCzkSodhYjGD_Iqbmh3bIA09GY3IWlpf4dR3M9AF2oeVxw6tktusZKHQuz8V8frJITH3vqjL8QrwW4tFCaNYqqZ>
X-ME-Proxy-Cause: dmFkZTFawN2q0q00YaFY1R0qF7hiQ09DFlx5t32BL/8GU0jGtpxvkI+cegS4NvldWRgaWq
    ZrR7eKCDPI7JW1QtmsocsQdwyQvdUaZOCvWmm7vBjEz+zILG9hZ1ivIWpyL78iz12S3sAG
    +wWQdWRtM9pLN7OOnqN33IQbgDEfk6PSmJcCVTCII52KnE+MFh8LOObI29IMtaUTfjl7KO
    GYfh3AEsLMPEfUnU/YMKq1GxRf/lq/w+ABjegGvE21qmE2dePIn9vleDYuYW68p2ceaCK2
    wP0IF/g4Smv+xDRDqFbSRnYfzBnwRRBJCMEZd7giV8yy5qYRd3NGxkyDiTrOanOsISHIMt
    G/49FfFzxw1QDWLr67yTbEuizrPWhULJAJKlSIwpC4tsLsRDNmjr44LyBB2GZn/YRe9La5
    fCJUmdruiseXWPXdH0pNmg7zaweUSYuKiab8vEGj4ScoS+qbbozSX3Mcbdzm2AQm4qH8mU
    zACvYGI7/rm4ERUKklFVR3uUyU54r+Fw/NbU56FboBm5oBg2h+3LuYAXDxwjieqNhgfOiI
    YWEnXr/kBBQAVuP66ksUGrgWKq3wZC9+f0nWTOlqS4nvRtnTFf+ui7U/8MH+0GIk3cWjNN
    uWbCNhpJuazUf3rwGn4PlmiUARwXGAjRkoQAukRdJzrrjGgmFcGUWKU4axdQ
X-ME-Proxy: <xmx:49Jdag2tB0y638G3DALPeicCcv6V2IaZ12O_Of4yrf8FHlWOBqlyPg>
    <xmx:49Jdah_YG31Tlle4FRu1juwMzPHWqLRUf_C-3Lwb5B4c6gjmf3bN1Q>
    <xmx:49Jdal1gLHKfPjZ10iY9RoHCSuvSsGYjoRKXTq-CG1RSyotIV5gedg>
    <xmx:49Jdam-fB2WwjA57a2zaoNXBAEDF1taQLylVQikvKl2UqtX98OrZow>
    <xmx:49Jdam3XCj6UWO_2abHBSd-YFiKmEFu3FiTSTht7kzGHS7E7EbzKbI-z>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jul 2026 03:48:51 -0400 (EDT)
Message-ID: <342a1c637da6f078150b43045fdd48c5ae7a7a98.camel@pbarker.dev>
Subject: Re: [OE-core][wrynose 10/17] u-boot: re-enable RISC-V compressed
 (c) ISA extension
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Cc: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
Date: Mon, 20 Jul 2026 08:48:48 +0100
In-Reply-To: <c643e2d8af772182167a4ee2a65d5bcdc469934f.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
	 <c643e2d8af772182167a4ee2a65d5bcdc469934f.1784364567.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-H5VwZkbPK0R1+ZKvtsNc"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 07:49:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241333


--=-H5VwZkbPK0R1+ZKvtsNc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-07-18 at 10:52 +0200, Yoann Congal via
lists.openembedded.org wrote:
> From: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
>=20
> SRC_URI_RISCV clears every RISC-V ISA extension via
> u-boot-riscv-isa_clear.cfg, then conditionally re-adds a fragment per
> TUNE_FEATURES bit: a, f, d, b/zbb, zicbom. There is no line for c, even
> though u-boot-riscv-isa_c.cfg (CONFIG_RISCV_ISA_C=3Dy) already ships in
> the recipe. So for any tune with c in TUNE_FEATURES (e.g. the default
> rv64gc/rv32gc tunes), compressed instructions stay disabled after the
> clear fragment runs, and .config ends up with:
>=20
>   # CONFIG_RISCV_ISA_C is not set
>=20
> Building without RVC noticeably inflates .text: on qemuriscv64
> (tune-riscv64, rv64gc), the resulting u-boot binary is 1312625 bytes of
> .text without the fix vs 1082853 bytes with CONFIG_RISCV_ISA_C=3Dy
> correctly set, 229772 bytes (17.5%) smaller. On size-constrained
> RISC-V SPL targets this .text growth can make the SPL .bss VMA overlap
> the .text VMA and fail the link.
>=20
> Add the missing "c" mapping line, mirroring the existing per-extension
> entries (a, f, d, b/zbb, zicbom) already present in SRC_URI_RISCV.
>=20
> Tested on oe-core master, MACHINE=3Dqemuriscv64, via the
> oe-nodistro-master bitbake-setup config:
>=20
>   bitbake -c cleansstate u-boot && bitbake u-boot
>   grep CONFIG_RISCV_ISA_C .../u-boot/2026.04/build/.config
>   # before: "# CONFIG_RISCV_ISA_C is not set"
>   # after:  "CONFIG_RISCV_ISA_C=3Dy"
>=20
> do_package_qa passes both before and after; only the ISA config and
> resulting .text size change.
>=20
> Fixes: cd9e7304481b ("u-boot: Overhaul UBOOT_CONFIG flow")

Should this have been de890297b392 ("u-boot: Dynamic RISC-V ISA
configuration")?

Best regards,

--=20
Paul Barker


--=-H5VwZkbPK0R1+ZKvtsNc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCal3S4BEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bmHzAP48/i4/8NmHlDh25yHIlLSe6/g3AOIODn1o
AtBSI9aGmAD+NIxqeLPIwY2ke1p+RNaYdy6gz906hpNLRGnmUblYFQA=
=qTa7
-----END PGP SIGNATURE-----

--=-H5VwZkbPK0R1+ZKvtsNc--

