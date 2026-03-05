Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523D0F3092B
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 09:39:52 +0000 (UTC)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40420.1772703584892936481
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 01:39:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=C2/t92/R;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=dUvoQnQc;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id E38F3EC063E;
	Thu,  5 Mar 2026 04:39:43 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 05 Mar 2026 04:39:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1772703583; x=1772789983; bh=LTSLPiZS+X
	UuUTqD3c754UPorDjEGdmztMkX/+ndpT8=; b=C2/t92/ReY6rbc3I9DYKAYOGK1
	nnJmEajW0JvV2dlPmOHDSyxaqaz6iVwrjK3nWDR0eapWwZh0TI53yp8WH/mGCyTS
	GpKgnw5ksx6+D7XlFBujxLUcW9iuvliO8xJqkvNtu3o4XtHDCJXn7WGTaHK5vhcK
	D8SJd7FNvxcNdeI+MTztXcCdveZwEe9XYhFPA6pVLSwjZxGAb1ZDIUwakcjKyUlc
	5pS4/HFUNqW1DcQnQlWZEbt+8rO/WNbxoMmQxq36q5u9w7sLOZix7zfr1QgAp39A
	dKFZIuesvJyVvHkqv2TU/x0vqtSZbVJQPd6EUNUk8vIhD3fGXBb0GexITZcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772703583; x=1772789983; bh=LTSLPiZS+XUuUTqD3c754UPorDjEGdmztMk
	X/+ndpT8=; b=dUvoQnQcZhgVMYPdhpjuAmKY/DaMUGBZt7fa9oztKVqObpOHQ7+
	g2Nm8MRNSkkoRaKWr6hADrIbUQOy3yCwOmGAmwi4tWYEo2Xqyz9fHyF/iW3+RSCo
	8vEEJabawkVT87BqwlOn37E8iNxsvTB5B/c545lVdh6a7kAA2VuNDHiIfx/6Lit3
	vT/Rh9XdEOOfc/6lCLTjMXEjAR/xIG/PQaOu57/7hZ1mKI3Pn2H54BVfi8ckU4af
	8uSFZG2nbu3q2oc6FsjU9eia9nFmkNZJKDCYNJ8j+yG8XRE20e53d4a2r91aEM7H
	WS2EdtGMwI/Qx2Lv18/GcGwoyufyY60WE1Q==
X-ME-Sender: <xms:X0-pacKG1P1FQBYhSdVPcUDNeryBznGy_SsbpRTczjHejjVgjI3YGA>
    <xme:X0-paTJtlt5uJoSwUsuW0FJBKgbFITSt2jLg3XK9fLw9Wd5dizqXzAdvbuP6R5hyt
    Dhs9d2fZWKaJSZJ-5-ty9dymFKOXA_xdfCHYO96RllBpHlGU-6l02k>
X-ME-Received: <xmr:X0-paRt4KWA6NaRbCYsZUnKZCqvYi-de0eVGTpjBreloDLFszT5VKRCXBh-ZHI-krYejM_73IB_wH1zHVDGAewZvl45ekpvgTEkT4tJOEd7k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieeitdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epudekjeefgfehieekjedtgeegvefgveejiedvieejueefheehtdfhvedvhfekvddunecu
    ffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpuggvsghirghnrdhorhhgpd
    husghunhhtuhdrtghomhdprhgvughhrghtrdgtohhmpdhrvggrughthhgvughotghsrdhi
    ohdpghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthho
    peegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeihohgrnhhnrdgtohhnghgrlh
    esshhmihhlvgdrfhhrpdhrtghpthhtohepphgvthgvrhdrmhgrrhhkohesshhivghmvghn
    shdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsth
    hsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehjihgrhihinhhgrdhs
    ohhnghdrtghnseifihhnughrihhvvghrrdgtohhm
X-ME-Proxy: <xmx:X0-paYRzlC_0MK1Spuovv3edSNAlsO0ZeyMskpmImciVqA0hmPwBFA>
    <xmx:X0-pafP87kT7MdKLmAJBPA4vRh0inaq3P-Fo1dIEjkAAfXm6R9qR9g>
    <xmx:X0-paVZTnkkBbdkls124x18-vrVp-oxVRnyOolyJAfIcYPiy0YJJJQ>
    <xmx:X0-paRzTe4ZGtzOout-hZEtXitjFUGSmsVLJVbIdVNcdwR-yqJHD8w>
    <xmx:X0-paa3DwtcVaDmGVqL-tod1X8nu8y7QxPveKXUtvN6I-ZKxlIS-36Ak>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Mar 2026 04:39:42 -0500 (EST)
Message-ID: <954e724ca535ea207772cc8aaa8ea88ef724945c.camel@pbarker.dev>
Subject: Re: [OE-core][whinlatter 04/11] python3-urllib3: patch
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, Jiaying Song
	 <jiaying.song.cn@windriver.com>
Date: Thu, 05 Mar 2026 09:39:38 +0000
In-Reply-To: <DGU3HPLPGFES.23M3LOS6Y7S4H@smile.fr>
References: <cover.1767772757.git.yoann.congal@smile.fr>
	 <34083b26ca1e5a52c627e41a1adbeaacf79dfa6d.1767772757.git.yoann.congal@smile.fr>
	 <c19daed92270797942ebbb4b51c6f6b03fec16b3.camel@pbarker.dev>
	 <AS1PR10MB5697BF5D70C1BCB02E7F1129FD84A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <5549493a25264654b39a48522691b15feece176c.camel@pbarker.dev>
	 <04c34334-5342-4711-bcdf-177da37b6fdc@smile.fr>
	 <6164cc2da28a6a9e637b47bde280254af4ed6384.camel@pbarker.dev>
	 <CAMSfU+4xvshEKX3ze=w10+iwFsNm7sr8Mz5svaRQ_tuZ2Z-1xA@mail.gmail.com>
	 <AS1PR10MB5697D5349A3C15D8B6E731EFFD7CA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <DGU3HPLPGFES.23M3LOS6Y7S4H@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-panGdAFeCn5LKAit7Bsw"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 09:39:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232475


--=-panGdAFeCn5LKAit7Bsw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-03-04 at 16:15 +0100, Yoann Congal via
lists.openembedded.org wrote:
> On Wed Mar 4, 2026 at 12:10 PM CET, Peter Marko wrote:
> > Hello Yoann, Paul,
> >=20
> > What shall we do with this patch?
> > Drop or take?
> >=20
> > I also think that it=E2=80=99s intrusive, however having this fixed on =
older Yocto release and not fixed in newer is weird.
> > https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=
=3Dd9f52c5f86bcc4716e384fe5c01c03d386d60446
>=20
> Hello,
>=20
> For context, here an update on status in other distros:
> Debian did not fix it:=20
> https://security-tracker.debian.org/tracker/CVE-2025-66471
>=20
> Ubuntu has not fixed for most releases:
> https://ubuntu.com/security/CVE-2025-66471
>=20
> Redhat did take the patch:
> https://access.redhat.com/errata/RHSA-2026:1254
>=20
> So the situation in other distros has not changed much.
>=20
> I looked closer at the patch:
> * There is indeed an API change:
>     ContentDecoder.decompress(..., max_length: int =3D -1)
>     BaseHTTPResponse._decode(..., max_length: int | None =3D None)
>   But this has a default value so existing code will use that and
>   preserve current behavior (uncompress without limit).
>   That could be a problem for users that subclassed those but, a
>   decompress() without max_length would have the CVE so better fix it
>   and _decode() is not intended to be subclassed (as private?)
> * The upgraded dependency to brotli >=3D 1.2.0:
>   * is optional
>   * existing brotli 1.1.0 (in meta-openembedded/scarthgap) will still
>     work but generate a valid warning (the 1.1.0 version of brotli can't
>     support fixes for this CVE)
> * For what it's worth (not much), this patch was in released scarthgap
>   5.0.15 for 1.5 months and yet we had no user reports.
>=20
> I don't see how you could fix this CVE without changing the API you have
> to limit the size of the decompressed data, but you also have to pass
> the maximum size to the underlying decompressor somehow...
>=20
> Interestingly, urllib3 has paid support available:
> https://urllib3.readthedocs.io/en/latest/index.html#for-enterprise
> Maybe an interested party can ask through that for a smaller fix?
>=20
> In conclusion, I'm leaning toward taking the patch : while it is
> definitely intrusive, some care was taken in it to ensure
> compatibility and the breakages are inherent to the CVE.
>=20
> Paul, would you agree?

Agreed - this has stewed for a while in our scarthgap branch and in
RHEL. I don't see any urgent follow up fixes from RHEL (see [1]). So, I
think it's ok to take.

[1]: https://gitlab.com/redhat/centos-stream/rpms/python-urllib3/-/commits/=
c8s?ref_type=3Dheads

Best regards,

--=20
Paul Barker


--=-panGdAFeCn5LKAit7Bsw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaalPWhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bqEFAP97RH7UhPW/g9mcVVcsjbRbBpS+GCyGAC0B
zSRkdkGmiQEAyxfZVlXlV4MeLdFhls0Qf5UvfjzhmGTffIQofYuOYgg=
=8nZ3
-----END PGP SIGNATURE-----

--=-panGdAFeCn5LKAit7Bsw--

