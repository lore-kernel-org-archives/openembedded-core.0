Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60CDD59D99
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 11:31:44 +0000 (UTC)
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46515.1765798296636137263
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 03:31:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=io73lZO3;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=Ju4XNpit;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F0F787A0057;
	Mon, 15 Dec 2025 06:31:35 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 15 Dec 2025 06:31:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1765798295; x=1765884695; bh=KTff3ZTtgn
	2TE3VEzzpEPkfNf6hbBREgjH7d49c2kKo=; b=io73lZO3H9v1foPrfd6mqh6M8X
	pzsJN9xLF+oJAxEafx0CqROT9inAuXnIcegFNt8LKDmaiuzOyPJ2CS9PaLcAAKwK
	Qs/MEXvbjZkpXZXyZhcGAp9RK96xlRnfF1Pd2E17BaTwb2qWr5jWE6EjjnltDITX
	1OH5VKYZlBDEyjegzSfWfte5IbG0KcXWM05gN9bWOZLiwLHvMUmvPFcGHf9JNMme
	wZVMe3inXFpKnn92GGoqqfWYKwE8W2EoZk4r/14ygnTYbYgh/QSLtxBo2pauJVtg
	k/DrXb3MZOvCS/cqAE72UpjvJCQIGHYPO3IIKKrtXnaKLfOj0ssotuRTEujA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765798295; x=1765884695; bh=KTff3ZTtgn2TE3VEzzpEPkfNf6hbBREgjH7
	d49c2kKo=; b=Ju4XNpitx981hKyKPiZMWZY4xQfeAUnK2JTTgSTDXNoJjgFN6Dk
	p/ysbEKQaMBg/zwf6ObWBwyB/BZsBdTMjSCCdmdIYlCL+7cR8ct6PGw1h2qWWCzC
	i4YOOWQzEMOF6+YWRMWSTeMwDM1oUNrPk7nzEsrtLFJE5uHoKM7evXMY7srF3sqw
	37fyEnPQ/Lt8hzy35jnZyW7Ary/ysx5zfuKOMKHKUSZrBKutC0XDZQ5NzUC0+KGH
	Vihu/RL0e+wPmj6LTxzINEJxxUDOwx2+J87Mb+EWxWRo3Djuvxel/tPEWKyECxOg
	JmXhrS43ptsAzK5jjtD/J++O6u9GInMfplA==
X-ME-Sender: <xms:l_E_aTjgSKVuQgHUCPG9SyYSaFF3QDafwvYe788s9VeQ_n3C-udfvg>
    <xme:l_E_aWBnrfU_rFcFJ-LD7eK2gA4bL4FebALaDyVW4Y-_ZwpGQumEni6GkcCLgSzGy
    8Q-3V0a5JldvutXMS5h6SUHqMeis3YNcCzez-Q8je42SVCsEvR5ozw>
X-ME-Received: <xmr:l_E_aQs6fiZYf043hdquwdk16eNju2I_G8FcFn9tch9X5Xhx-MPNjXfTjZ1ugQQ_Lu53MIGBP49uKF8kOK5scwrHj_KlHp5WeQBKqj0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefieeilecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfgggsehgtderredtre
    ejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdgu
    vghvqeenucggtffrrghtthgvrhhnpefgleefjeetgffghedvleekleejueffgfetueekvd
    ejheehhedtffejgfehfeehveenucffohhmrghinhepohhpvghnvghmsggvugguvggurdho
    rhhgpdefuddrsggspdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgs
    pghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhgrjhdrkh
    hhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgt
    ohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:l_E_abbh4v8nP3idO_FrjatPGW6ZFhOkZSvDetpyCBexNyng3p1m4w>
    <xmx:l_E_aTUc8pvdQks4_-CPkHM0e1UWPrK9A7FJo2MGIVJb8p5lypPOXA>
    <xmx:l_E_af6L4X8_5MAx7ku4TWj2WBSh12AhisU56N_DvgUBrjZaQH_tbg>
    <xmx:l_E_aeiBi0Ss93PAen-HbcX8Sy-rRtecOkXrMVjh5LOVtKZV8uNPNg>
    <xmx:l_E_aay47j625KBcCX7usCWGSnu9B9AjPDZvC3UAz65pGoRdb_Lo0gv2>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Dec 2025 06:31:34 -0500 (EST)
Message-ID: <741b70037a7d648b9191cccb0cb73768bb80acad.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] kexec-tools: Add riscv64 support
From: Paul Barker <paul@pbarker.dev>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 15 Dec 2025 11:31:27 +0000
In-Reply-To: <20251213095528.1027888-1-raj.khem@gmail.com>
References: <20251213095528.1027888-1-raj.khem@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-CD6yQKAJZ5WiJvIQsNSp"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 11:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227728


--=-CD6yQKAJZ5WiJvIQsNSp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2025-12-13 at 01:55 -0800, Khem Raj via lists.openembedded.org
wrote:
> These patches are used in several distros and are part of kexec-tools
> riscv-collab fork. Unfortunately upstreaming for this fork is slow
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../kexec-tools/riscv64-hotplug-support.patch |   25 +
>  .../kexec/kexec-tools/riscv64-support.patch   | 1469 +++++++++++++++++
>  .../kexec/kexec-tools_2.0.31.bb               |    4 +-
>  3 files changed, 1497 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-kernel/kexec/kexec-tools/riscv64-hotplug=
-support.patch
>  create mode 100644 meta/recipes-kernel/kexec/kexec-tools/riscv64-support=
.patch

Hi Khem,

RISC-V support does appear to be part of kexec-tools 2.0.32 [1], how do
these patches relate to what has been merged upstream?

Perhaps we can upgrade to 2.0.32 and apply any remaining diff on top of
that.

[1]: https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/tree=
/kexec/arch/riscv?h=3Dv2.0.32

Thanks,

--=20
Paul Barker


--=-CD6yQKAJZ5WiJvIQsNSp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaT/xjxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bsppAP9NfJVBu/dO5bJe2EuD/T0HJbIL/yHmt9GE
MCv6IBU5DQD+LDo4ssex4KB171vaAIeZrFb27+sHRinYIWZHIuY7PAo=
=7yR6
-----END PGP SIGNATURE-----

--=-CD6yQKAJZ5WiJvIQsNSp--

