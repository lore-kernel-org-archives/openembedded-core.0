Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38630E9B24B
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 10:05:59 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17165.1771927556414212269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 02:05:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=aCzMeRKH;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=LZr3qtKK;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id A3ADCEC0607;
	Tue, 24 Feb 2026 05:05:55 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 24 Feb 2026 05:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1771927555; x=1772013955; bh=mrHyLq5AI7
	153DC651tuu5Xg7VeJ3KTj0kb55znF9nU=; b=aCzMeRKHd6nd2WSkjG+lFsMqLA
	rkVue1NW7LVEtjf9RIE2QTBJmNue4NQLO8NsJYPK/FzNWKD2ZLiq0EmBvqdcEn9R
	oWW3lTL2ESqX/s/4nwNdxfGcmcSrknhtypkuoYsBPz0DF1wENFIj6wNKalbzIrAw
	YHVn+tVQBNSCjsQ7eNgfd1TJ6lEHVzdQnQXU8tbbQRz5xJLHF1HI/AE7JL5pETwW
	kZPGhAwEJZwh+Mzxc1Gn6bwvUAeJOX2WpPB9HW3EC39QT+eGHhuKQ6NLc3C3NzkV
	8+Z+lOjv3ERtXYJXcvvXAEOeVkYsBz13cat/hFDFVP3wfpiXvbYrLFEh2i1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771927555; x=1772013955; bh=mrHyLq5AI7153DC651tuu5Xg7VeJ3KTj0kb
	55znF9nU=; b=LZr3qtKK/libF93b0cARmCL+dM5gLG6MI5HWUZQ0dezsDG5RUGd
	LJ9uOUxJ5VD1akfu+RfzmLMVOTZqPSQ5L0tChIFYnuvpobgI2dxlneqlbtdlJoMk
	NuKeonR2efMTJzf/J0jKJpfE1rMnYt8XP6Jvcew7kMEqt+6sy04mFKATOndPeT8N
	9JX86FHrlx4B+usS5T+198xmhpMSQActfimz6euP0PDXmqc1bE75vVdUq7oP8thh
	sjs8d9XUSzM3R11WpGrGolB47bHMIAaxaOno7fod9JtDEoI0k2XyEPerJc4u0wgF
	iMImGkpS05WiA/JQlYXx2asmdM3QfUBEohg==
X-ME-Sender: <xms:A3idaQ9HB4U43qwkNtbVpjvs5leLi97RT2s0aNNKLJ9pSQE4q3dqpw>
    <xme:A3idaetaWIojFYQh_oXuYdhusdY15yh3eR7ckuKQ77KuxGDZ7c4xOw5NK8WX_BjwX
    TkMMK_JQRIOu_P25C7q_LKPnGcmBo-6nb1zv_1Xre-cVh5bZ76EOp0>
X-ME-Received: <xmr:A3idaTrOOhi-O5u1XZG9i49eQuSA6CmwU7Zxfbupk-EIKkGdaoBGVIIr-wLK8zCZ8rbSsXiv-J_Lug4e7eIh_J9gL0mjAQl2h8mW5PKqc1G6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeelkeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepgeefhfdutefhffevheevkeejhfegffegieektd
    efkedttefhuddvffeuieeiteffnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepthifohgvrhhnvghrsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghm
    sggvugguvggurdhorhhg
X-ME-Proxy: <xmx:A3idabkzpLeI5MzYsDgJJr6PwWyDRaWCb7837MNovbmGp4fvwLfXDA>
    <xmx:A3idaXy5tL3QLUajg546IzsnICt5oCD8Vg_xSipQm3DXF9oI5Scu_Q>
    <xmx:A3idaTlNgEg6ppmsK9lPt_27elnH9B1aY1j3cFQQEw2kMfL-fmppSg>
    <xmx:A3idaQfKIp6zmIvSFzfcwH0TGZku45uxl5yxyZN2SopRIs3wYX99Vg>
    <xmx:A3idaWOSozA-dy5XS_t49VADOZBGGqyeVXXTAqmLL9kYY3w2abB57yRL>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 05:05:54 -0500 (EST)
Message-ID: <989b5482dbb36eeaa61a957ffe1ce5679fb62a55.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v5 03/10] wic: remove
From: Paul Barker <paul@pbarker.dev>
To: twoerner@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 24 Feb 2026 10:05:51 +0000
In-Reply-To: <20260223215008.2062721-4-twoerner@gmail.com>
References: <20260223215008.2062721-1-twoerner@gmail.com>
	 <20260223215008.2062721-4-twoerner@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7Kc+dlbmmAwlzjJRtuzk"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 10:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231759


--=-7Kc+dlbmmAwlzjJRtuzk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-02-23 at 16:50 -0500, Trevor Woerner via
lists.openembedded.org wrote:
> The wic utility will continue to exist under The Yocto Project umbrella,
> but will no longer be integrated into the project as part of oe-core.
> The ultimate goal is to make wic a completely independent tool, hosted
> on PyPI, with its own tests, development roadmap, and releases.
>=20
> Some benefits include:
> - relieving the oe-core maintainers from having to review wic patches
> - allow the tool to be used outside of The Yocto Project
> - provide more flexibility to explore other features, libraries,
>   mechanisms, etc
>=20
> AI-Generated: codex/gpt-5.1-codex-max
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>

The summary line needs improving here. Perhaps 'wic: Move to standalone
repository'. Also include a link to the new wic repo in this commit
message.

Best regards,

--=20
Paul Barker


--=-7Kc+dlbmmAwlzjJRtuzk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaZ13/xEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bk7+AQCgdfqwbOlvogqbmOwj+Q24Tbo2wXJCmzut
6xdL4yWf6gD9G0Qi2S0apNraksQ+paG9iht8kIYl2xXD2Pjtpe01gAA=
=+YmS
-----END PGP SIGNATURE-----

--=-7Kc+dlbmmAwlzjJRtuzk--

