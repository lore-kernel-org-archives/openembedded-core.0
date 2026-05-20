Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2808ECD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 07:37:29 +0000 (UTC)
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6940.1779262641588123171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 00:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=Ab6y57fz;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=K6JGEcD2;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id AEDF21D000B0;
	Wed, 20 May 2026 03:37:20 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 20 May 2026 03:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1779262640; x=1779349040; bh=BZg4w0/cQa
	eREiMt/zG7LyZFAjyncdT3K/+NimYeT0c=; b=Ab6y57fzykKIs4YRyP0ASSDka9
	bw+A3StaQs3gT1Bf0K0HrRhXaTDJxDpbyxMG1IWR0YgIi5AY2elEBGFZfOr+l0oy
	SALflqRXo53d0kcaoOhF7nSrIcpo0g0+KOOfhrg/Jwca3MSE0YtBEvmJ+TOe6kMO
	jVX0jjZDicYv1p0uHf8/bftOEGJRkANMeM0MwffwQH+OogOnbNlZU/JB4UPDRB+o
	6CjhrWvnJIvGf6LFHdQtgfjd5GbyEj1Nt58N/Ty0rdpb8D7OPqypud05wesW7v2G
	ijhBkrWB8zJc21l47+9cV6IZTeW1D4t/Khx8/Rb/S7nhKWOZKece249NsMxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779262640; x=1779349040; bh=BZg4w0/cQaeREiMt/zG7LyZFAjyncdT3K/+
	NimYeT0c=; b=K6JGEcD2dQX97MJi6aoopJbpFJeDW/pXF4IGdICPrraud/yxBOd
	fSF1VhHFTCLSfYciWHW8g/EFAdAC0eHbf8ukxNCeULMwvoJzrBesPMDia//cDHTd
	OZiacHG78qjU77zPcPZRhAep9SyGTbh0O7I1dkgoNZPv3H59CiSddncE9GqEBed5
	D/xxErKaL3Xvj0d9WdZRJHYXEwNVIdZbenlid00ifv+zrgv1+hgSXSQn6kIlEz0S
	zwgE5ElXgHy/w4QZ4WhABXGxFkoQh4z2ZrXWWuQ/ea8HOvJNij38qw7tRjPdl3a9
	LrRKpdeBpbVr+1N4NGMVi4au1Tmypd/+xHA==
X-ME-Sender: <xms:sGQNaoVEEN79c8JSoOkA1--tfz3HA6h_YWdzXlt_QsGm0WJ42ylwmw>
    <xme:sGQNailKrINqoliOkg5VOYByDicpQjrUylepzZyYefLWBkJB6rM5kNLcA75NCDRhP
    LqO33eJU_lU3WQkBzKdmMr6yXz0R-pXMKfxccpGFjpX163wpbVj8dY>
X-ME-Received: <xmr:sGQNaqBfEfv9pip0Cob-3il1YdfBZrVdLofBExFBpHc015O_PRrHL2I9Mr81MDx3C_eoLFNtI7pMxQXKeUK5vSWARWvusYwqSTcRFDo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeegtdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepudegteehueffvddthfelgfeuffejgeehgedtue
    etkeetveetvddtgfekuefhjeetnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphht
    thhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeihohgrnhhnrdgtohhngh
    grlhesshhmihhlvgdrfhhrpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhr
    vgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:sGQNaifAqZG_-NSSRkgSd6IyFZoF3wrvNMgZNwsRQnrxloj1ZwIyrg>
    <xmx:sGQNalJYpGdEkxgvt_C7BcKgQUD9s1Q7oBzLjwHpTAeFepVcE4oGhQ>
    <xmx:sGQNalcyg-1rASDF8Wh5lmQcZNzSURY9KUwsqw3ZHxZ16jZJjJxVFg>
    <xmx:sGQNas1L37WanCg30ZR6DkTHANJnZJoR3vXR3A8535ySRG5x05HAPg>
    <xmx:sGQNaq5zirW6SrFAiZVp4ScRu6M7xBfR_DGx7xuMxjULDSC4BMvLQxdz>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 May 2026 03:37:19 -0400 (EDT)
Message-ID: <e18168d2da604d9645b4116d37ac99a572477cae.camel@pbarker.dev>
Subject: Re: [OE-core][wrynose 11/28] libsdl2: set status for CVE-2026-35444
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Date: Wed, 20 May 2026 08:37:16 +0100
In-Reply-To: <e2ea9d60afddf38e5a8d4a7c4d22e5efd98a5e4e.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
	 <e2ea9d60afddf38e5a8d4a7c4d22e5efd98a5e4e.1779232800.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-iuvLdng5iDdK98hqBPbQ"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 07:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237387


--=-iuvLdng5iDdK98hqBPbQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-05-20 at 01:29 +0200, Yoann Congal via
lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> This CVE is for SDL_IMAGE, not SDL.
>=20
> Mapping in sbom-cve-check tool seems to be wrong at [1].
> It maps both SDL and SDL_IMAGE to the same CPE.
>=20
> [1] https://github.com/bootlin/sbom-cve-check/blob/v1.3.0/src/sbom_cve_ch=
eck/products/products.toml#L1608
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit fef169063e49f516ea96e2243869808ba58550d0)
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>

Hi Yoann,

We should not need to backport this if we take the update to
sbom-cve-check 1.3.1 (earlier in this series) as it fixes the offending
products.toml entries.

https://github.com/bootlin/sbom-cve-check/commit/30a5b3e94bbdd27557d3b8b7b1=
917b9980fc2564

Best regards,

--=20
Paul Barker



--=-iuvLdng5iDdK98hqBPbQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCag1krBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0br2TAP9KOJHoasbEnEoBfMq+cr4ll6sOTBPznYyg
GOqcH2Nl0wD+J6YWnZLn08fvhrwgff1BNM6QLI7/9tcbWD/FfL22LAE=
=pa7m
-----END PGP SIGNATURE-----

--=-iuvLdng5iDdK98hqBPbQ--

