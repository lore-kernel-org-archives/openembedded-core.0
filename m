Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45288CCFA1A
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 10:05:45 +0000 (UTC)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10058.1762941935744240762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 02:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=Sc9h2NXO;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=VTqDFrSA;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 98DCBEC01B0;
	Wed, 12 Nov 2025 05:05:34 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 12 Nov 2025 05:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1762941934; x=1763028334; bh=cwklGDNi5s
	ChcJKhDGjLKPK+wZ/tOJvuBsYL8k5S9vI=; b=Sc9h2NXO5znsJv5pCnyIask+df
	CnYJJ/Llt5TZyZfVPFTCGicb8Ogy31G584ccsRNI1JFTeh/4rWFbfX2DidiNud9C
	5ecYl4YIpLkxROzgcgZt862kqbJtpoikBh6P6HT6MWKU13+oKKW5E12xOBRy4zq5
	Xqih8yYHKJQck6GJjBf0eOIRMF144UME10jS72RVH0i+GOOnUKPqT54EnfUwdXJi
	q041floH33SZt6sw5rnBNJhdXkqFMUzQtslkxJsBGmTIog4IpHZG7nOEkBwwp3tk
	RAVcUaWge8mSuMNnoY4Ae3M0Pw0js8NAq2Jo3CrdaK3gIC4+6KA8avVsQfvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1762941934; x=1763028334; bh=cwklGDNi5sChcJKhDGjLKPK+wZ/tOJvuBsY
	L8k5S9vI=; b=VTqDFrSA14UroClM3ypUx9wss66wlFs3Phm74yMsb5k5Cp3Ylq9
	xhSLBQsO9dTRpLOkOHGVFeUhECWsOpu4aYdYrsj3V0qFqDNABkw7/kzUvx0PJ+DL
	dM1DtZtdTDdfwnkNRWvtO8qvWR2hXaatMn0iEqfVcVKIe4Ya2wdMtHfuJOF7CW+k
	zB9OmrkrZMWW4gEGLUeQq7EMrbB34HpkNijFJkOKJX69YgwBiWUB9zQ9rwHYFZXL
	b2o8YgfFf/TOkFYSKVJTEH6rYCW/vBiSlnOmr8WxdThxfjwIH2mT/JhmxpqygUa5
	PQkVgLw4r/INOeMNiLu6s+OVTIgcmiOFZ3g==
X-ME-Sender: <xms:7lsUaQGDD2IctJKCnFVFh1Cq4XqTsoIkD8vjQPAHqg-FdNBSQwkzJg>
    <xme:7lsUaUz7z6HDOs7_FTtrM5Yfaw7KfmgtWc4lyUjlkJUXz8Ea_0nxsRR8CWXDQt0rU
    uMke-sza6vvMl2hGYrghEiBNxDTa-gc_O_WA9zTC_KK7nRsPiJufPQ>
X-ME-Received: <xmr:7lsUadpaT9tpRhsOcOpeLr6luLmBTOUfISZJRGf1n1mE7XD-rotFr9Vu90UbH-5dxKTrOAJJWv6sPxgMMP8WrATwZ9F_bA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdefjeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epfeffvdefgeevkeduhfetueehhfeikedvieeufeevieffueektdeluddtgfegveehnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlse
    hpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehvuhguuhhprgesqhhtihdrqhhurghltghomhhmrdgtohhmpdhrtg
    hpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    ohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvg
    gurdhorhhgpdhrtghpthhtoheprghnuhhjrdhmihhtthgrlhesohhsshdrqhhurghltgho
    mhhmrdgtohhm
X-ME-Proxy: <xmx:7lsUaWhxjpRuXhgzgGsitY0OCEKtFSIaNY9EcTcdwmn2F2d5kQLWvQ>
    <xmx:7lsUaShMfJkyLjH8Bt3Eg0SH0VsSf9MiwHh72Gox83b-cA6D0VJXMQ>
    <xmx:7lsUaUiH2XDuX2PvYSPFFwkH5KnZJLKDKHN7lgUdg_3ydopn9t3X1A>
    <xmx:7lsUaaIGn9cn0UvKdnWRY1qqrOZOzTWUp5sv-W_-Ev7W6J8kfcLJsg>
    <xmx:7lsUaamiIzFkX9uFUAs4bjVswmbcBjKGQ4vs9ZOIaBddnTjO9SpYTsvL>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Nov 2025 05:05:33 -0500 (EST)
Message-ID: <4954c44a9174bb069bf207c08ed1a9adf1530761.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] findutils: /var is populated by base-files,
 so no need to repack empty dir
From: Paul Barker <paul@pbarker.dev>
To: Vishwas Udupa <vudupa@qti.qualcomm.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "anuj.mittal@oss.qualcomm.com"
	 <anuj.mittal@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:05:27 +0000
In-Reply-To: <PH0PR02MB8796E101519849F416D02891F1CCA@PH0PR02MB8796.namprd02.prod.outlook.com>
References: <20251111052244.3228403-1-vudupa@qti.qualcomm.com>
	 <CANNYZj_9kLM2ZAYAqY5RJupTfsZty8LbD0ys6mShWeAOMKkEoQ@mail.gmail.com>
	 <PH0PR02MB8796E101519849F416D02891F1CCA@PH0PR02MB8796.namprd02.prod.outlook.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Vrr/aqRO8M3bH5+6MP4e"
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 10:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226202


--=-Vrr/aqRO8M3bH5+6MP4e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vishwas,

On Wed, 2025-11-12 at 08:22 +0000, Vishwas Udupa wrote:
> Hi,
>=20
> There is no error seen, but this helps to align towards stateless
> system expectations or when updates are done via meta-updater.

This explanation needs to be included in the commit message.

> > +do_install:append() {
> > +       rm -rf ${D}${localstatedir}
> > +}

If the directory is empty, please use `rmdir` instead of `rm -rf` so
that we don't accidentally delete wanted files in the future.

Thanks,

--=20
Paul Barker

--=-Vrr/aqRO8M3bH5+6MP4e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaRRb5xEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bvzbAQCMvJyjca/WU/6HiT4ASNl8JjwjcHJnzNv0
CGQcgxET9gD/VWC579qtW4QzWF4+VRsF0fnxF+omKAdfmueeXg9guQ4=
=z5uc
-----END PGP SIGNATURE-----

--=-Vrr/aqRO8M3bH5+6MP4e--

