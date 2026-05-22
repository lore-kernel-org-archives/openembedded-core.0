Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE13CD4F5B
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 10:44:30 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14376.1779446661922233295
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 03:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=Sgy/fgvl;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=ehd+YpLs;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 1C81DEC0109;
	Fri, 22 May 2026 06:44:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 22 May 2026 06:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1779446661; x=1779533061; bh=uqpj1070yl
	bvht2sjj7UE9vNxcTW5Il0dxzGFpqsUmU=; b=Sgy/fgvlBazV4YSSoNOgFp0rOL
	eAJSq8hYhyIdIswc6wH+4V/rjA1kNIZsDOs5687mWHFlpzMDIHL63GtQ7w8wz8Fc
	EoxymVFfRRRl/05zOyOzY4NFmXeFKH1qcqcvhE9niEZ4q1I/ZopmWBJ1Uc3bbB99
	f6MZRTlNlGxHEFpoqah+6iTAxOoz5hWEYeT4uNAKSSzi5VnuZMpQSUzhXEQgAY/r
	Z3j07pdsjaWF2n5FeOBZrRwM6SjLcx8xWfe1CpmbMYYJlkT2z+Tcs0mCJxT2HzHA
	cPYsmrlBulSDEfqlPirrdThL80jfOtvXh3HKs0VhKMc1hVo+jQ8QCsnWo5eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779446661; x=1779533061; bh=uqpj1070ylbvht2sjj7UE9vNxcTW5Il0dxz
	GFpqsUmU=; b=ehd+YpLsdLPT06LS7BqyO5Ua0RI4C526GAopZaY8K3PNABhViqg
	2GtoYnlqqwDV6pLSqw+R3ixvvPDxiM4uwH0kopGuEthglU7L9qON9k3NnMsQ3ijZ
	x+mkDPp0LczUskqsNW474WkEecfKrvF3wqaHFdW3Y5UNzXwwwISHUUpfslZQJqTp
	8qNGiXc5UurHrPztsU9qra2EHVfARh69onBpvpdErKIZeLYF35I21vtwVeWTuFux
	S87OF6fY8VvUWQ7YdkjTRTYJUnES0Qg8jym6ZsQRMKFpsZZYl++CHJP2UQtI5p6A
	siZnTOTZv1WkMvQTZIJeQREHrSAWt/K6dVw==
X-ME-Sender: <xms:hTMQaq7lVDfLAarLXwWRNlWUvrYa88qY-jTmm66R9Ka1w9oqFNLEvg>
    <xme:hTMQaqwFFZFyUXjxgfTK36D4eyt9voEZzqEgUiecoYD0VXnPeVI0Ls843XfWHSMkD
    PyzOVy7Wwfq9uEbP1pKUWF5Pm0Mf1PLeo4f0kyHeMSdQKNydvSYoQ>
X-ME-Received: <xmr:hTMQahyFrq6IkYNcarNu7p9XvZkZ48dX-xNeZ5rr-16ZjKjNxBK9PwADRI4QLxQdphCq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeelleeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epjedufedvhfehvedtudelvdeljeeiheeiveffleehffeftdfguddvveejkeehfffhnecu
    ffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggv
    vhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjh
    grmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhmpdhrtghpthhtohepohhpvghn
    vghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorh
    hgpdhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomhdprhgtphhtthhope
    hvihhntggvpggthhgrnhhgsegrshhpvggvughtvggthhdrtghomh
X-ME-Proxy: <xmx:hTMQaiz_Vq9hBxgpmVJcCgm3U4QS1Li8qfct_yfKu4Dl2bcaDW0hKA>
    <xmx:hTMQarbq8WqQfWGrfZNHuaHZ_ve-cOfoK6diSpvRnkKVPg3vCBaVZw>
    <xmx:hTMQajXNpBnz4Wuom-qNgaUhQOcpJzuZ3ilGdo5XrBf3-eyRKmGhbw>
    <xmx:hTMQaphFnnTlBug5Lq370aMI_BNQNbV7iJLwFNKwXefPlbv3zzAjCg>
    <xmx:hTMQavD7QDBpfGrtgOnSU8C4UAvoYQkb5YLmzZXk710R_VTYcOn2l5s->
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 May 2026 06:44:19 -0400 (EDT)
Message-ID: <db3718e2bde570cd266ebc1363421648fae8018d.camel@pbarker.dev>
Subject: Re: [PATCH v2 2/3] meta-selftest: Add devtool-test-multi-destsuffix
 recipe
From: Paul Barker <paul@pbarker.dev>
To: Jamin Lin <jamin_lin@aspeedtech.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	 <alex.kanavin@gmail.com>
Cc: Troy Lee <troy_lee@aspeedtech.com>, Vince Chang
 <vince_chang@aspeedtech.com>
Date: Fri, 22 May 2026 11:44:17 +0100
In-Reply-To: <20260522075925.2381158-3-jamin_lin@aspeedtech.com>
References: <20260522075925.2381158-1-jamin_lin@aspeedtech.com>
	 <20260522075925.2381158-3-jamin_lin@aspeedtech.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-mhTf2M14UB7N9o0ZaBxd"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 10:44:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237538


--=-mhTf2M14UB7N9o0ZaBxd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-05-22 at 07:59 +0000, Jamin Lin wrote:
> Add a test recipe with six git SRC_URI entries using nested destsuffix
> values. This recipe is used by the devtool selftest
> to verify that devtool modify correctly converts all nested git repos to
> standalone clones.
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  .../devtool-test-multi-destsuffix_git.bb      | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-multi=
-destsuffix_git.bb
>=20
> diff --git a/meta-selftest/recipes-test/devtool/devtool-test-multi-destsu=
ffix_git.bb b/meta-selftest/recipes-test/devtool/devtool-test-multi-destsuf=
fix_git.bb
> new file mode 100644
> index 0000000000..0702b13f3a
> --- /dev/null
> +++ b/meta-selftest/recipes-test/devtool/devtool-test-multi-destsuffix_gi=
t.bb
> @@ -0,0 +1,29 @@
> +SUMMARY =3D "Test recipe for multiple git SRC_URI entries with nested de=
stsuffix values"
> +LICENSE =3D "CLOSED"
> +
> +# Six git entries all nested inside S (${UNPACKDIR}). This exercises the
> +# devtool code path that must convert every nested git repo to a standal=
one
> +# clone: the initial fetch uses a shared clone whose alternates point in=
to
> +# downloads/git2/; git repack copies those objects locally so the worksp=
ace
> +# survives 'bitbake -c cleanall'.
> +SRC_URI =3D "git://git.yoctoproject.org/dbus-wait;nobranch=3D1;protocol=
=3Dhttps;name=3Dlevel1_a;destsuffix=3Dlevel1_a \
> +    git://git.yoctoproject.org/dbus-wait;nobranch=3D1;protocol=3Dhttps;n=
ame=3Dlevel1_b;destsuffix=3Dlevel1_b \
> +    git://git.yoctoproject.org/dbus-wait;nobranch=3D1;protocol=3Dhttps;n=
ame=3Dlevel2_a;destsuffix=3Dlevel1/level2_a \
> +    git://git.yoctoproject.org/dbus-wait;nobranch=3D1;protocol=3Dhttps;n=
ame=3Dlevel2_b;destsuffix=3Dlevel1/level2_b \
> +    git://git.yoctoproject.org/dbus-wait;nobranch=3D1;protocol=3Dhttps;n=
ame=3Dlevel3_a;destsuffix=3Dlevel1/level2/level3_a \
> +    git://git.yoctoproject.org/dbus-wait;nobranch=3D1;protocol=3Dhttps;n=
ame=3Dlevel3_b;destsuffix=3Dlevel1/level2/level3_b \
> +"

Thanks for including a test case and recipe!

These do not appear to be "nested" git repositories though, as none is
contained within another. We also don't need all 6 of them. Perhaps just
three is enough, nested like this:

  - destsuffix=3Dlevel1
  - destsuffix=3Dlevel1/level2
  - destsuffix=3Dlevel1/level2/level3

Best regards,

--=20
Paul Barker


--=-mhTf2M14UB7N9o0ZaBxd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCahAzgREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bl5qAQCcoQa3ix9+mMtzKw7nH+hWT5YiHoDFRg/x
XxSrtPeQGAD/UfEceYtlfpXY+Aqbhd6otAd7RrMZ09JMAqIsWfAAJgM=
=dzOd
-----END PGP SIGNATURE-----

--=-mhTf2M14UB7N9o0ZaBxd--

