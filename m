Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20F4F94CBE
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 11:53:48 +0000 (UTC)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80674.1776858827239260711
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 04:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=L9Wfck2/;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=kovYqxzx;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3AD417A017A;
	Wed, 22 Apr 2026 07:53:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 22 Apr 2026 07:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776858826; x=1776945226; bh=87sA2vyes5
	A8qmHjBYMZPXnfsaNwtrc/dqo/jp/OAIw=; b=L9Wfck2//a2YVG8JV/8syyGmMm
	TzdgM8Jhfj7/j7oUJsRSbWFg7h85CUQN/2Y71dhTRIEJ4v8xi51HgVT5StgLet/w
	eFHnj5tpDTH0cYCLARtjJcKUeD3b6y7tA0Vqgd4fLirxOnrcQEwXhTCFRwPousI9
	3XYoP5t3/u7BHt2nXmmN1f2BpVSK6SC5KyExHCCkHdi2Vsmu4kzVHv4kdE2tPybb
	OfwPnPwd3pR1SAybbrdsiw9Tl04BkLrvAuv7KT7L1DLaJzvllNErmWQpeB0DjgC4
	0ZDfAEAg5goEvVsYigx29BBw+zn3nh5pHWqT8TTu+7SedvUZqXsYu7Fjo8qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776858826; x=1776945226; bh=87sA2vyes5A8qmHjBYMZPXnfsaNwtrc/dqo
	/jp/OAIw=; b=kovYqxzxiqF2EnnTdZrcYwhJtHOiahTfpCVaM+cBmA/7SuTiQZm
	W7FjsU+Rt26X/X/sWFe9A3Yo4FVhxORml/QxOsVfmQJPgizn/0qjpfLb3jePjGKf
	QIFwi5W7n9uIKLQFuidLwCWCMl+zoOSQ5h+eSLYvhETnYS+Y2tz7W52SnusLs6Lt
	lzCjpSjz7yEmkaalAjfB3Om/Evz6VF8w7NBmipLWvvXd4dk7Iuu85Ri1+LINoBlq
	EFMfYMvawzOJtOE8e/6a/AIF0omNDcAM4zRrycxbJ/m79T5R1RL830GVZajHgERe
	YNAuLn1+L2qwtyVhfeM1tjpynd03ah1h4fA==
X-ME-Sender: <xms:ybboaQqq88z9uLRnNHAZegs83V8Rtm0FajnNhtYoWr_e0Ci2fswHmA>
    <xme:ybboadhI6bavUId7uwlUyP00Wk0LW0PWMTOtfROtMpd8cLBgy4v42_mWD7OGW_H0E
    KY0_rGYt8ozDrz-Gzb210GWF-RKEdgent18EzFvGWr9uOUQkdY4jQ>
X-ME-Received: <xmr:ybboadim-JK_my2zeVUGYJr4loEjPp2G9wXRP6tZAIN_OB9t7GjNrTxeZ6179D97xKQdnssUr5iHyu2j1gi9GHPtRGIEmVpb4eEbx5pvbeFK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeigedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkuffhvfevffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    fhkefhuefgleefleduleelhfektedvffeitddtueeukefhieduiedvfeeuhedutdenucff
    ohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghv
    pdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfvg
    hsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopeifrghnghhmhiesfhhujhhi
    thhsuhdrtghomhdprhgtphhtthhopehmrghthhhivghurdguuhgsohhishdqsghrihgrnh
    gusegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgv
    sehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepohhpvghnvghmsg
    gvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:ybboaThEhp4fm71Wh0phkavIinZcnEy1dMfgX2qzBez-IU45GFa07g>
    <xmx:ybboadIYK8kw4w8r1AqxeJhfHXM_95wldKXy6HaN13AR-z_y6xIn9g>
    <xmx:ybboaSGXOmEhIMFT1UhJGU9NABUnjOjFUj4QwKnnwsr_xylei-RwrA>
    <xmx:ybboaRRHX1CVjLSnOUPkvf127w9bu2FKKCMeCLCmH_qiSRSM_xObTQ>
    <xmx:yrboaW_AUOmAhxeV-bdX_qFtIIMkNqhqZZjm1lFDtjn6FVE6d00bTqNm>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Apr 2026 07:53:44 -0400 (EDT)
Message-ID: <faddc25bf9184723e1e48df48b8bb85617132095.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v2] u-boot: upgrade 2026.01 -> 2026.04
From: Paul Barker <paul@pbarker.dev>
To: festevam@gmail.com, wangmy@fujitsu.com, Mathieu Dubois-Briand
	 <mathieu.dubois-briand@bootlin.com>, Richard Purdie
	 <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 22 Apr 2026 12:53:41 +0100
In-Reply-To: <CAOMZO5CmWHY2NTa-CLpJMPMpAw6ntuGgXAx5Pb1RY5Eke5SZmA@mail.gmail.com>
References: <20260422103626.817-1-wangmy@fujitsu.com>
	 <20260422103626.817-3-wangmy@fujitsu.com>
	 <CAOMZO5CmWHY2NTa-CLpJMPMpAw6ntuGgXAx5Pb1RY5Eke5SZmA@mail.gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-2TSJkjWGQPEjMO9su4lH"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 11:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235719


--=-2TSJkjWGQPEjMO9su4lH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-04-22 at 08:07 -0300, Fabio Estevam via
lists.openembedded.org wrote:
> On Wed, Apr 22, 2026 at 7:36=E2=80=AFAM wangmy via lists.openembedded.org
> <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> >=20
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >=20
> > CVE-2026-33243.patch
> > removed since it's included 2026.04
> >=20
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>=20
> I submitted the U-Boot upgrade on April 8th:
>=20
> https://lists.openembedded.org/g/openembedded-core/message/234837
>=20
> Not sure why it was not applied yet.

Hi Fabio,

We are currently in feature freeze for the upcoming 6.0 release. We will
resume applying upgrades after 6.0.

Best regards,

--=20
Paul Barker


--=-2TSJkjWGQPEjMO9su4lH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaei2xREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bh/jAP9ru+B4w1DIx8+VtbNCPlKGvN85AsFc3e0r
ZGwIL2NU5AEArLuBfKYkrm6huYvHe1WsnZ4MysiWz+NG9NaQwqjl6wY=
=dx0w
-----END PGP SIGNATURE-----

--=-2TSJkjWGQPEjMO9su4lH--

