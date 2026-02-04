Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4512CE95391
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 12:05:47 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18934.1770206741367569912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 04:05:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Dg9RH9Qw;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=b9xxEzaO;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id AB43BEC0090;
	Wed,  4 Feb 2026 07:05:40 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 04 Feb 2026 07:05:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1770206740; x=1770293140; bh=BZPizlvPxD
	RoTt3XI312OEgTHKDOJ19/1SVponTp/JI=; b=Dg9RH9QwDAWJxsbgAd7tP/Khjy
	uGsJwCTqWhwbIc4o+x59xPqzaCMNuMqP2AHUrcBrUz+5C1aVoYOouDfcIXOxT+Vo
	L6E2SKUZAEwaXF/TY63MgMkEc297ATUWwSPUV8Pk6KCseS2wvF0O44UOivPKlYjg
	8bNypkWtrEULYxwU5dFDdNtW6AkZwQtfgYzgjy2USayheIGZCaEBEEEVKmvNcUYC
	L6I9tP/PWpxzvI+WUAiSkRIR12F5PIbvxOfhKOfVlPVje38njqdvJrdxNWKpVpt4
	j4lZRjyf30XVs2rYJXdGKMB27gu/4/vMMKptmdOVrKjD695GYxYgwkjj3ytw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770206740; x=1770293140; bh=BZPizlvPxDRoTt3XI312OEgTHKDOJ19/1SV
	ponTp/JI=; b=b9xxEzaOpOiYe2DPdySKqQYZT5g7+ettGJ90XnCHenVvznq/naY
	gYiqQ82OFWwSLnYHD8y+Lcz5D+IMFLOFry/ut1pwRt6lRHj5l6tIz8DSAtROyvt/
	jH4yqbBLgx5IO6lOFVCcurBkNSKjnAgRvRPIM/SV9S1B1cREzHmEtrssIsTXfi55
	ILiAzqqzY27WHDoW4U0r3NuPRMMG+PiG89YvTJzEWRKIhVD3eyM7V2EfqgAhv81w
	QTK4/VvstKOZCEp1lDvNruqD1WJjzRwYm0zJ7HXyXpZykYXIN9uLnzcVfmnCEO0D
	LDZWoQq4G1OXBxlKCHkfl1juoLJBiizic+Q==
X-ME-Sender: <xms:FDaDaSiZqigBAI6SS2bY5ly2yPdJvZKrGYNBc0lZT33slnGaMa5m8w>
    <xme:FDaDaVkG0albqPzB0pMxgiZlREtWy5JJU1rfw8K5XxWl02vi3M8_MC7I_1YaI-uC4
    wIsWHYiJZcv51njahiSlBmM1nLzz3sVMlXm4eAdS1evRD4wAffrdUQ>
X-ME-Received: <xmr:FDaDadt-3aj8WkC2EJVGQ4QSPTuqls8buQ3wN3WBf9t7WUYZZJ8jbaNi1YrZYbGgt0xuS_8LFm6Bh-Ineme-x8ZDViHFK7nNIi7HDbO42VYS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedvfeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfevffgjfhgtfgggsehgtderre
    dtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghr
    rdguvghvqeenucggtffrrghtthgvrhhnpefhkefhuefgleefleduleelhfektedvffeitd
    dtueeukefhieduiedvfeeuhedutdenucffohhmrghinhepohhpvghnvghmsggvugguvggu
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeelpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehhrghrihhshhdrshgrughinhgvnhhiseifihhnug
    hrihhvvghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvges
    lhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheprhgrnhguhi
    drmhgrtghlvghougesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehsuhhnuggv
    vghprdhkohhkkhhonhgurgesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopegrlh
    hishhtrghirhdrfhhrrghntghishesfigutgdrtghomhdprhgtphhtthhopegsrhhutggv
    rdgrshhhfhhivghlugesghhmrghilhdrtghomhdprhgtphhtthhopeihohgrnhhnrdgtoh
    hnghgrlhesshhmihhlvgdrfhhrpdhrtghpthhtohepvghlmhgvhhguihdrhihouhhnvghs
    sehsmhhilhgvrdhfrhdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinh
    hugihfohhunhgurghtihhonhdrohhrgh
X-ME-Proxy: <xmx:FDaDabZ6uM-Xdgzbk77hKsZYHm5ZTEqDHq96jn5uNtObE4rTg6k8WA>
    <xmx:FDaDaVDzE6Vi-LkUhKswBytA6XMW-mHG3EXRfacKiAt0iJ8dJJabOg>
    <xmx:FDaDaT8vevVKJ-o28IyaLmmtcuziH0hcDoZwLfjUQIsu_l51_Fc4sA>
    <xmx:FDaDaRS0k0TJXsLaWxHQWpaVxk21U9S1XDxa50UXWfEfquUWDT6-yg>
    <xmx:FDaDaZGFxV2CRtO2XjKscVU1dMsVhW1ebTsIPh3q6MUE9PcSNfdiAkjq>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Feb 2026 07:05:38 -0500 (EST)
Message-ID: <8a9cf281b36ede03135fb042e260d22785ed4f38.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v5 07/15] kernel-yocto.bbclass: Disable ccache
 when rust-kernel is enabled
From: Paul Barker <paul@pbarker.dev>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com, 
	alistair.francis@wdc.com, bruce.ashfield@gmail.com, yoann.congal@smile.fr, 
	elmehdi.younes@smile.fr, richard.purdie@linuxfoundation.org
Date: Wed, 04 Feb 2026 12:05:36 +0000
In-Reply-To: <20260129163910.2612040-8-Harish.Sadineni@windriver.com>
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
	 <20260129163910.2612040-8-Harish.Sadineni@windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-6FN1hyngtOGFlGFoChzF"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 12:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230514


--=-6FN1hyngtOGFlGFoChzF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-01-29 at 08:39 -0800, Sadineni, Harish via
lists.openembedded.org wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
>=20
> Currently, a ccache enabled build fails with:
>   |   HOSTRUSTC scripts/generate_rust_target
>   |   HOSTCC  scripts/kallsyms
>   |   HOSTCC  scripts/sorttable
>   |   HOSTCC  scripts/asn1_compiler
>   |   TOUCH   include/generated/gcc-plugins.h
>   |   DESCEND objtool
>   | error: multiple input filenames provided (first two filenames are gcc=
 and
> .../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target=
.rs)
>=20
> when using ccache, value of "HOSTCC=3Dcache gcc" when this value is passi=
ng
> to rustc, It is thinking gcc is a input file. when ccache is not used "HO=
STCC=3Dgcc" is passed.
>=20
> Disable ccache for kernel build if rust-kernel is enabled to workaround
> this.
>=20
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>

This patch is good, but we should try to get the issue resolved upstream
if we can so that ccache can be used.

Has this been reported upstream yet? Could you also open a bug in our
bugzilla to track this?

Best regards,

--=20
Paul Barker


--=-6FN1hyngtOGFlGFoChzF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaYM2EBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bq3eAPwLo6OyLPnJxmgBVJf5N8QCakryAsIwUTMF
Xgfxv9u1xAEAglmXxvS49tqRG0eZ7d+cWIsniXADKJvZ1H+JTCY/hgk=
=tJni
-----END PGP SIGNATURE-----

--=-6FN1hyngtOGFlGFoChzF--

