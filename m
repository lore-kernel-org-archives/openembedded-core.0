Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D23CD4F5E
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:37:48 +0000 (UTC)
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33431.1779359862964701344
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=PY8vA2ig;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Lu+aM0jk;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id DD6991D000AE;
	Thu, 21 May 2026 06:37:41 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 21 May 2026 06:37:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1779359861; x=1779446261; bh=AxYWL+Z/Qq
	xrzPUVB0qqf1kMBraCdBdLtE/IfO9c4YI=; b=PY8vA2igOcCka0q8RogMNJ8ILk
	wrtc9c1vxwieMMT6RgVl1uK/MtaL7jXkdgxv0p8nJ1rRYv3VYKMfyZT20O0BA2kY
	97oFRyMDSY7T+xXmJxKgi0UxmRNZx1ygprmvzsRRW6/Pg+k4z4AR1jP9LTKxb9LU
	PYwO4DWVMC+JR1jgBQ/LZvbx1qXxQAs8NlJ4uAVnC3cbzMoKkbHD4LJTcyu/F1Ut
	81hxjjChUo5AMfeBRSh6uQguALknFta2/sIKR9dOEMGznpIMZq/j1uiuiFTibE0Q
	lkKduR5xagaQRW8cem2vZ5VLSfGqNdVadhz1t1eO496Fda2+x7497B6Clo/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779359861; x=1779446261; bh=AxYWL+Z/QqxrzPUVB0qqf1kMBraCdBdLtE/
	IfO9c4YI=; b=Lu+aM0jkmYIuaXFrdRyWkjFnKO4x3R6fu9EXjnoJ9kTMd97PEAu
	lqfQo589V6RGhYLvlL3ZtOzAcZMXeAYrK+rVa6HtCaQzJHkHQgbZgBnkZutWLrMM
	xt0Tw1BnqfMAAJVIya3pBffVqBx0YFEmYCbFNO3j7EQKIYIeoYa/Jk3l3UMRsOpu
	lWWTI/XkNx1tIQiLky4zF5Ek8VFSGzcK242RIb7KuIGkS4Y2jjyd1Gdt4hssR39e
	jW59Ih5IiGSLX9Uf8X3wNKICj16BZ+sEWAm8D8kM57OsttS0UdSXiGU7vQ7hLH5T
	sDxTKQRxnUhIOv0/MnLNKHxoWIZPItcPVGg==
X-ME-Sender: <xms:deAOaku6mndC3qVKr61ECfecuGAabYtOQNrCzj2ok5yjOO9P6xYRvA>
    <xme:deAOaod0kxoeL-g3Bjo6T7atUsxq4BBpwQ8z3-Vgyk_WDDRroFUVbgwEHy_K1tKtr
    7GJxJbG4h0GQoUrdiNWn1-WdpBpJfr2O7axX80XQ6qs7ePACTr64WI>
X-ME-Received: <xmr:deAOakz117ehtyU5X_MQ-yNS1TmUQ-iGk8JPw63j5vJ_tTXzg27taQFfzv6XCNoli49_IF-CbZJybTXs6jhdFmpAXo7e99kpQsotj5lwYw4_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeejvdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfevffgjfhgtfgggsehgtderre
    dtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghr
    rdguvghvqeenucggtffrrghtthgvrhhnpeefffdvfeegveekudfhteeuhefhieekvdeiue
    efveeiffeukedtledutdfggeevheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpth
    htohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepqhhirdgthhgvnhesfihi
    nhgurhhivhgvrhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorh
    gvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegrlhgv
    gidrkhgrnhgrvhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehrrghnugihrdhmrg
    gtlhgvohguseifihhnughrihhvvghrrdgtohhm
X-ME-Proxy: <xmx:deAOamHHhTBuHo3y4_aqNhPzMV81b_VbHbpMdA2MH8J-pTr7z-AdOQ>
    <xmx:deAOagxAxHKfF2-JGOhJUbcp_yDSsLtiNwjdu7ofVVgM3tC_b62OvQ>
    <xmx:deAOavtawPDwbr0kE_H2VQwolFDEo76haCITrJO8dLzkH5xYjlkewQ>
    <xmx:deAOal1S82TIvN_zhZ8g06scpHj-ElfRjjN1RTaZxyE687I9m_LXhg>
    <xmx:deAOagvxUhJhePb5X6WBOMcy5RXzZNdP_kz8eYHB4BtpJ5Wx_l3p7UcC>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 May 2026 06:37:40 -0400 (EDT)
Message-ID: <ba68ebe91dd7cdf90461962289abe849463bae55.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH V6 1/7] recipeutils: add optional
 stable_upgrade parameter to get_recipe_upgrade_status
From: Paul Barker <paul@pbarker.dev>
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Date: Thu, 21 May 2026 11:37:37 +0100
In-Reply-To: <20260518055558.3982813-1-Qi.Chen@windriver.com>
References: <20260518055558.3982813-1-Qi.Chen@windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Yt5mJkl5bp0Pou2iyGkD"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237503


--=-Yt5mJkl5bp0Pou2iyGkD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-05-18 at 13:55 +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> We want the ability to do stable version upgrades for recipes.
> To this end, add an optional stable_upgrade parameter to the
> get_recipe_upgrade_status function, which defaults to False and
> when enabled will try to get the latest stable version of the recipe.
>=20
> The UPSTREAM_STABLE_RELEASE_REGEX is respected. If a recipe sets
> it, it will be used as the filter_regex. If it's not set explicitly,
> it means that there's no stable updates or the recipe hasn't been
> checked yet.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

Hi Qi,

We discussed this series on the patch review call. The implementation
here looks good and we're broadly in favour of this approach.

But, before we merge this we need to:
- confirm how this will be used on the stable branch
- agree what criteria we judge upstream stable branches against
- get buy-in from the stable maintainer

As this will alter our policy of how we handle stable recipe updates,
someone needs to send a proposal to the openembedded-architecture list.

If you can send the initial email to the architecture list with how you
see this working, I'm happy to provide feedback and drive the discussion
forwards.

Best regards,

--=20
Paul Barker


--=-Yt5mJkl5bp0Pou2iyGkD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCag7gcREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bsB6AP4jNY0nc6tGh3Z86p4TQt1RgpEW1bZfv4YN
3iwnyMHHIwEA5O1l7VdhLCFPBRRbBOwhbmqieznl5g9ElYJf/rfzAgU=
=pkac
-----END PGP SIGNATURE-----

--=-Yt5mJkl5bp0Pou2iyGkD--

