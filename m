Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4428DCFD623
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 12:32:45 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4674.1767789157764489818
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 04:32:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=Ll7GGf6G;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=gyccr6VE;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id E87A1EC0237;
	Wed,  7 Jan 2026 07:32:36 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 07 Jan 2026 07:32:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1767789156; x=1767875556; bh=0rYMB5utaw
	LeUj9BHyIBTB+Evlpa2gdjalpLRAJJuXI=; b=Ll7GGf6GJDwr7AST8ePkLotaDm
	nz62z46BaeGRJ//USwJJkvf95DgvTvK7IC6xsbFjMM9NvM1DrPcv2FCdlxTSsh/0
	PlBiH418zM2OlZvGY3FesVHbc/poX+F+t445OsGyizBgwYiZRg2UXpMHPAn0Jgg0
	qE2OfVO8A+44DcXUYijXayzfyzhZZpEjoR80wRAYgD8Gg+CYEGeXrSK197x0DnwZ
	fJH0LydgLvMVhHGSfcb9Sv1MlOuqUdRpFKMTurGVHdX58muapQ0PjxBu7P5uK7Wp
	kemZC3wheQJ7tgSs337nVA+6cRaDr/Q1l+nE+9uZyVzlFxtWysYL/qbXIC5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767789156; x=1767875556; bh=0rYMB5utawLeUj9BHyIBTB+Evlpa2gdjalp
	LRAJJuXI=; b=gyccr6VE/MgxXln4w7jKgbLYToMPDkrBTbklN6xHJEzzkboPeeX
	LQQRkf16s+oAfpgya14CD+ItpfcjeXm8BqfB2zIf4A366OjvgdZGaomEcpfJeQ7X
	j/KZfX2oHpWK4jRW69LIGzyK2rE5r7isJlUc4kqWX9m/ha1uqztDydOAeS2mWCvL
	3nBrGy6xMes5EZEBLbnlwQoh1RIcTW5a6lbFNHDfttQgxUz93piTmzoOTixzGBqf
	aHrEWJzqe8q8VbxaPG+2i7yJrW5A/XwR9LhMVnTaGDjMMLYM5Z8AMUXeJaOSmriV
	GwUWNeojKTQRqQFKiT5Yaj/Wag2dQGI/ydw==
X-ME-Sender: <xms:ZFJeacweMd-oUVUW20l3gkC_uWUFNSx6Pl6TvHPQDBidBEfyr6xOlQ>
    <xme:ZFJeaXQl1NgXTJkTHw7HJSPysDguYZx0ggZY8IcZNzea2JBAvLJixy8u6TnvV3sFC
    n_jXKSrt9MywSTMypI9SxmKaHBe1Nac3kUYx4YDOG3fZk2atMVDGQ>
X-ME-Received: <xmr:ZFJeaTU41Hiy4vjyhQeb_pq_CuwSNdk4eKjkdnLz6aNV2lgtYxoN8agIWg3xs67iK3YrDIF5u9wdbri7mp2CJBf6CHqH3g2E3OBry30>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeftdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrh
    hlucfvnfffucdlqdehmdenucfjughrpefkuffhvfffjghftggfggesghdtreertderjeen
    ucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvh
    eqnecuggftrfgrthhtvghrnhepvdetudefffdtfedtgfdvffdvieduveevudefveekudek
    teffffffkeeihefhuefhnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrgh
    dpnhhishhtrdhgohhvpdguvggsihgrnhdrohhrghdprghrtghhlhhinhhugidrohhrghdp
    lhgruhhntghhphgrugdrnhgvthenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthht
    ohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhdrmhgrrhhkoh
    esshhivghmvghnshdrtghomhdprhgtphhtthhopeihohgrnhhnrdgtohhnghgrlhesshhm
    ihhlvgdrfhhrpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhish
    htshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepjhhirgihihhnghdr
    shhonhhgrdgtnhesfihinhgurhhivhgvrhdrtghomh
X-ME-Proxy: <xmx:ZFJeaZaa17zmXEyHgtBCXTy3o1n3mZhq002Csaxh2xj_TWf4InUtYw>
    <xmx:ZFJeaZ3LOGCk0kN7_i1o_ufPJCg1g98x1q7WYVIyIk55EMG1GCmNBQ>
    <xmx:ZFJeabgNcCiaXUwFE16exGHvHy7tu7k_74Zs2vjpgQjxnniBG3VuMA>
    <xmx:ZFJeadY6lKHs8hwAyhUNqzd0TD8vLsOFgBt4jxlj1kxkWeDz4_m32g>
    <xmx:ZFJeaUc9ewrvidKDw_2EhHzormEQMiKD859VksSXGp-AvBPWqXY0WFGZ>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jan 2026 07:32:35 -0500 (EST)
Message-ID: <5549493a25264654b39a48522691b15feece176c.camel@pbarker.dev>
Subject: Re: [OE-core][whinlatter 04/11] python3-urllib3: patch
From: Paul Barker <paul@pbarker.dev>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "yoann.congal@smile.fr"
	 <yoann.congal@smile.fr>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, Jiaying Song
	 <jiaying.song.cn@windriver.com>
Date: Wed, 07 Jan 2026 12:32:31 +0000
In-Reply-To: <AS1PR10MB5697BF5D70C1BCB02E7F1129FD84A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <cover.1767772757.git.yoann.congal@smile.fr>
	 <34083b26ca1e5a52c627e41a1adbeaacf79dfa6d.1767772757.git.yoann.congal@smile.fr>
	 <c19daed92270797942ebbb4b51c6f6b03fec16b3.camel@pbarker.dev>
	 <AS1PR10MB5697BF5D70C1BCB02E7F1129FD84A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-68sBugZ3YL8vJ3EEplXB"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 12:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228997


--=-68sBugZ3YL8vJ3EEplXB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-01-07 at 12:19 +0000, Marko, Peter wrote:
>=20
> > -----Original Message-----
> > From: Paul Barker <paul@pbarker.dev>
> > Sent: Wednesday, January 7, 2026 12:49
> > To: yoann.congal@smile.fr; openembedded-core@lists.openembedded.org;
> > Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Subject: Re: [OE-core][whinlatter 04/11] python3-urllib3: patch
> >=20
> > On Wed, 2026-01-07 at 09:08 +0100, Yoann Congal via
> > lists.openembedded.org wrote:
> > > From: Peter Marko <peter.marko@siemens.com>
> > >=20
> > > Pick patch per [1].
> > >=20
> > > [1] https://nvd.nist.gov/vuln/detail/CVE-2025-66471
> > >=20
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > ---
> > >  .../python3-urllib3/CVE-2025-66471.patch      | 930 ++++++++++++++++=
++
> > >  .../python/python3-urllib3_2.5.0.bb           |   1 +
> > >  2 files changed, 931 insertions(+)
> > >  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-=
2025-
> > 66471.patch
> >=20
> > This seems like a very large patch for a CVE issue. The changelog entry
> > in the patch also says that the API of urllib3.response.ContentDecoder
> > is changed.
> >=20
> > We should look for a narrower fix, and only take this if there is no
> > other option.
>=20
> I originally didn't want to patch this CVE due to this reason (and didn't=
 patch it in kirkstone).
> But since this has landed in scarthgap, I decided for the same in whinlat=
ter for consistency.
> Should we revert it from scartghap?

I don't think we need to rush to a decision.

Have any other distros patched this CVE? I see it's still unpatched in
Debian [1], and Arch Linux is on v2.6.2 already [2]. Ubuntu has taken
the patch [3], we should check if they've modified it or directly taken
the upstream commit.

[1]: https://tracker.debian.org/pkg/python-urllib3
[2]: https://archlinux.org/packages/extra/any/python-urllib3/
[3]: https://launchpad.net/ubuntu/+source/python-urllib3/2.5.0-1ubuntu1

Jiaying Song: Any thoughts on this? You did the backport to scarthgap.

Best regards,

--=20
Paul Barker





--=-68sBugZ3YL8vJ3EEplXB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaV5SXxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bhSiAQCRBFYIZjpyFMxQmt6ttUbLadoSkqeXK35s
8Sp0PYWa9QD/V239J3MDKNVLpMemX5yQiZ63WZYwxp+ziZAQAyhJ3A0=
=vvty
-----END PGP SIGNATURE-----

--=-68sBugZ3YL8vJ3EEplXB--

