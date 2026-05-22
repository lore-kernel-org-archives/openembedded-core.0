Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E583CD4F5B
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 10:53:50 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14526.1779447227939291441
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 03:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=zaA+cE6Q;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Jw6e34wv;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 29204EC0176;
	Fri, 22 May 2026 06:53:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 22 May 2026 06:53:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1779447227; x=1779533627; bh=ppJXBjLiG5
	JqBf1CMQOw+GDLV1TosVoDYf/nmc0tatw=; b=zaA+cE6QAsf93wMRSIkkx/5YlM
	dLjYPjK3YNImmw4YlGS67HVdEzX2aqxVCRAR3e+r76aj31Xhw4hbRKCfSXezoHxo
	5cZe7363jMCyTKdbxnVpkpoNUEYFjjFJ6MrVPa9/gUQcP2v0jEM9DOQrZM58DCK1
	IxCb1P3LCbs0WgTwDPs4/dL83Wvax/cXwcTQ82YgDMSsEKf8r1TATW5RcVRFCQEf
	8So+gHFf3JFNDs4obR7vWljtrKMLnYip0fdpexkl7mqJtala4iQ8hIKvPDqv01oP
	P+FZ0pUmJWHcWqbpmXGV2MihGEIOwsqdowxHC3IyqgeaVA5z5vGuygQLLX6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779447227; x=1779533627; bh=ppJXBjLiG5JqBf1CMQOw+GDLV1TosVoDYf/
	nmc0tatw=; b=Jw6e34wvWcpheiWke1T2EVL+OTZJ9XWU9BSIJtRa9Nuwao31ndu
	R722HYjRcOpXfWL8SXQcOxZmSzD7msemAPCNjJa+ypAR+x2fiR9/EO53AIpDLB95
	sXjdSmjo9iET2+L1E2h6G5Gum71X8yt/4cOExA+gX7YSmNM5/XVVFdebIzerCPCJ
	wSf4gE8n6VlnNXcfmypWo/7DnRNPliji3SVGGu+oL2wskLZ7jLJtgI6wI6oZ5tPH
	wszyY5MB0SRpiaif7ex3Glp920PgrBg7ZFTkf3T/A169ck2E+UOAv7BV++lfKg4K
	eYlUzmeJXD39B6kTtfRHHJM7q7zM8jNbrsw==
X-ME-Sender: <xms:ujUQaoN_jgRZD98cJtKwcIc3jRins45FJKfaYsL5SGwNGn2o4Qqogg>
    <xme:ujUQamb00c-Mq_g-RKrp6_LQLmgrEGo3z-qN3MRp2cAJ-iqDeokA9osrXNrAximWs
    P1fx0AL3M9CzKMBYzbnL8rzbY7NXPM5FxnNJSIo2dAp1UJKobgjmw>
X-ME-Received: <xmr:ujUQasq7fhRUfqJq4yHDJdftPWfQ_IaBLVcRIiJks_eIm6ZidbhekSaooUaKYoTapWBf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeelleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epfeejudefteegvdfgfefgtdegjeevgfeuhfejhfejgeefheegueeiteejkeethfefnecu
    ffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtg
    htrdhorhhgpdhrvggrughmvgdrmhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhgvkhhsrghnuggr
    rhdrnhhikhholhhitgdtuddtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvg
    hmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
    pdhrtghpthhtoheprghlvghkshgrnhgurghrrdhnihhkohhlihgtseiivghishhsrdgtoh
    hm
X-ME-Proxy: <xmx:ujUQaqb0r8l4YfA6C8qDVV_uAutpijXI8x5GrIKbNGy58wywUh88NQ>
    <xmx:ujUQakTKId0izKRNBOQs_7dvCTZgC11hTk-a4eRsWgEvKenXd_bvAg>
    <xmx:ujUQah64XfwmhRI7zlI52-VjfQV5Z4-DSOwaOOnuBAZlw8x2wfoQsg>
    <xmx:ujUQapxizdRBcKA3-eIhMD52au4KlwqEzkt0GOGnqbtz7ZC2NjrVcw>
    <xmx:uzUQavAFCI5XGrZS3xObxuxhQn8Jd5KH-XNzk-KDr7p0VoDavXKdqYk4>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 May 2026 06:53:46 -0400 (EDT)
Message-ID: <bfdbf0b936f46fe745b3cccdcb4e3f2173e8c8c6.camel@pbarker.dev>
Subject: Re: [OE-core] [scarthgap][PATCH v2] wic: Fix updating fstab for
 nvme0n1
From: Paul Barker <paul@pbarker.dev>
To: aleksandar.nikolic010@gmail.com, openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Date: Fri, 22 May 2026 11:53:43 +0100
In-Reply-To: <20260522045949.184811-1-aleksandar.nikolic22@pm.me>
References: <20260522045949.184811-1-aleksandar.nikolic22@pm.me>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-KVPr+489VqqG13S3hddu"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 10:53:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237541


--=-KVPr+489VqqG13S3hddu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-05-22 at 06:59 +0200, Aleksandar Nikolic via
lists.openembedded.org wrote:
> From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
>=20
> In case wks file references nvme0n1, update_fstab() function creates wron=
g entries
> in /etc/fstab, as it is not adding prefix 'p' before the partition number=
 (at the
> moment this happens only for mmcblk). This leads that entries in /etc/fst=
ab start
> with:
>=20
>     /dev/nvme0n11
>     /dev/nvme0n13
>=20
> instead with:
>=20
>     /dev/nvme0n1p1
>     /dev/nvme0n1p3
>=20
> The patch fixes this as it extends the if condition and adds prefix 'p' f=
or
> both mmcblk and nvme0n1.

This is an interesting case for our backport policy, as wic is no longer
embedded within OE-core on wrynose or master. However, I think this
should be submitted against the standalone wic repository first (see the
readme [1] for contributing instructions) and we should get feedback
from the maintainer.

[1]: https://git.yoctoproject.org/wic/tree/README.md?h=3Dmaster

This should also handle other NVMe devices beyond the first, what about
/dev/nvme1n1? Or an NVMe device with a second namespace /dev/nvme1n2?

Best regards,

--=20
Paul Barker


--=-KVPr+489VqqG13S3hddu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCahA1txEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0biCjAQDpq24/Qc9fAQM+ByDuiQadUTv6IUB52ztX
q3GTtjcVEgD+NaBdzvrEb3rdTx1YDpYs4B6ZvLyIIZrgbZe/xzPwjwY=
=kdgi
-----END PGP SIGNATURE-----

--=-KVPr+489VqqG13S3hddu--

