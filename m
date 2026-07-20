Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C96BC44529
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 19:35:12 +0000 (UTC)
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5780.1784576108134205225
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 12:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=l98XWyai;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=NmVHuuIi;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 31BC5140012D;
	Mon, 20 Jul 2026 15:35:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 20 Jul 2026 15:35:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1784576107; x=1784662507; bh=w8A0tBlrrc
	lqkyAnURoi9SLbnyQFIOtgsEmNNPdXaEc=; b=l98XWyaiPsBmoZxCvrJmOffvi0
	5wlbPeoFezzK1PgnvltuUPGfnU9JVchyJzZzi4IDlR1RSgIaB+Fq2zmLSUsfZFcm
	1JbnqPbdy+fTXyfe6lHZsHfgHBA3RQzJebGKPD/j8etouj2SsMaP1d9FM4RIfYey
	LCjCsnOtOQVfPKZH9WMJABaeA6uUTb3hnee30coLF39Gmai1cSpV5piX11Dl5W/C
	pj8BP/jtgGJpfeXwfyWTrtubRyGmkv7o6GM3mz/UFiGld+gdy6F6AJeueILryIIG
	NOpWLSZnpIvJ/XPQnDqHhI4Nvd9hHZsY4dsVMuJCV2fV0fubJjj+t21OK7zA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784576107; x=1784662507; bh=w8A0tBlrrclqkyAnURoi9SLbnyQFIOtgsEm
	NNPdXaEc=; b=NmVHuuIiVX8MIMLd5kwzhNreJMrjKVO0CexJfFljmS4UHHMoxZ5
	H30XaaP8uHo9gKM1Zl3khh1sTHKuKpNnZ7JZSO52zamqAbgLRqjFsfmVdwSbFhWL
	gOR25ZKo0dXq21G+vOxzHoEcmYBN3OFExDYzx0S84R3liV1hymFi7Q5XJuALxVPH
	rvs1c7UGEIGl624QINMPPKU3LHBgTbrgU3H3LtzNuj4O9Imj2U2ZqZFUQvWQHSqZ
	nROSx1JJKY21MkJFBFlCy47qRPzC/RuajYBkf22z+/IHrp3sQiEwkaviCL54tJnA
	wBiOFS0QMfCzDMQ1fuB3f8Pwah07baedeIg==
X-ME-Sender: <xms:anheai0nPg7r21xaMoktztWINkRt7lpcKPPoznj3T0EA0UyxC28_Cg>
    <xme:anheasgT97wdPzQmFSAA5phgb3LQMGPb-hxjlUeBRnYBcbK91DG8f01jcUEItcysh
    -EOgedRm31pI1a94hZWBkTTDL69cwIh7PeQhrXJpO52fyizUxHo>
X-ME-Received: <xmr:anheaoQk11EPI-gOeSwjJj2EjLcmzdlBZK9vxBnzyelw_cUzY8K0oNCiX9k-t0rvIuWCRSwxMGqK9PktFWLFcVCWU1UfJ8lSkdUNEamAzY37>
X-ME-Proxy-Cause: dmFkZTF3pJFKRuTbNOSjmipxKMbIcFs9vHlyxF8nLXkqJ1NdSgf4pLOlOtYyT6CaOwH8l2
    TxIOydW+GxrbOgjQK9ebz0T/YuASZcJTfOSGqDghdDDy+14oGIv2bUfL7Zg3D3dnHaaRux
    HNvgteYpeMEYRyJFwAnkj3aP1ggErDBCyB28x5AY6wGHDqIm7H/hViFxrmZ6PKdiQRHFuo
    yzN/uVuV9ZTy/4mzGMYpnb7Q/JzabbvRJUljIbdhOVJzajWCfOp12XjgbBIf55ISXFUL56
    lo3h+nZY4VARL3XKGGikOrcIBiCk2N1SS/bwcf6iIe8UWczvGDOLkh05ZcogharxiiyCqa
    01GMs7yMXyB0XLZedxGSsdQyrU/cF4kqm+w7EKnTWfEMAVJTDVv7Nwz4tlpRA2bGAClw5S
    TrFXmVr8w32nDy7PNLAN9VEouJPrqDI5o9ku83y1AOq5RecAL8lX4GtF2nFHSofBxpJc86
    BbZzoKDPIKJS2k+8s98nrHZxkzz5iWqgwMkhUivO8FxJc+MxO2UEmEybCErKT0XVsGVFuI
    SoNm9ncBWEeGnA/UZB6L5DmKd8kvHw3XVf+fBo2ADc3Vbtb1sI7FqElrYzkIv8qS709b/o
    QLD85aPm0mOoFfA0XcT5H+RTEmkw9m5YHg0iWRma6h5nozi9E0jzHX3um05w
X-ME-Proxy: <xmx:anheatin4y0JuLchJNsOamv5JXraina-fI2PlgZLie-3dYML50fU_w>
    <xmx:anheao4CPIip5-qz-BhUnWWS_53dN62u-he6zTx6qWF9Bpo-Jg3fhw>
    <xmx:anheaqArUnWLeceKzAtfL4_NLmDwmVhAHW_4UG_bbwpB8d-wPFGqiA>
    <xmx:anheavZcgSx76G02fhAJVz3kW45z29lJCnFW7AXOCr8zveQBkyxGoQ>
    <xmx:a3heavoAk8pdOiDu3S0K_k5uDQY-L3N7_dQvfw-GWIkWuPt_WRHqlu_K>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jul 2026 15:35:06 -0400 (EDT)
Message-ID: <0f5438b03d5e23426b3d8f061c1978e97cb13ed1.camel@pbarker.dev>
Subject: Re: [OE-core][scarthgap 13/33] dropbear: Disable DSS correctly
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Date: Mon, 20 Jul 2026 20:35:04 +0100
In-Reply-To: <56f5e0e276a5f39e5ae7fb9e61a4ef64aa51bd7e.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
	 <56f5e0e276a5f39e5ae7fb9e61a4ef64aa51bd7e.1784567958.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-3+ilFdhyptGfqSP9g66p"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 19:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241487


--=-3+ilFdhyptGfqSP9g66p
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-07-20 at 19:22 +0200, Yoann Congal via
lists.openembedded.org wrote:
> From: Mike Crowe <mac@mcrowe.com>
>=20
> Take upstream patch that stops sysoptions.h unconditionally turning
> DROPBEAR_DSS back on even when it has been disabled (which is the
> default).
>=20
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>

Hi Mike, Yoann,

It looks like we've been building dropbear with DSS support enabled for
the life of the scarthgap release until now, due to a bug in the
assignment of DROPBEAR_DSS. Fixing this now will forcibly disable DSS
support for all users, which is not something we should do on a stable
branch.

Best regards,

--=20
Paul Barker


--=-3+ilFdhyptGfqSP9g66p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCal54aBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bp2kAP4zPasi54eXCN/QYcuOTLCbyGZbTg/9ODUr
N2cXiVTjtAEAobXh8woDkJBwFvJvyucVwzvVJ8NbPBTsyUvdQJFN7wc=
=3+rg
-----END PGP SIGNATURE-----

--=-3+ilFdhyptGfqSP9g66p--

