Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62243CD5BB0
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 11:12:40 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14783.1779448358010238521
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 04:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=x64UsoiZ;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=b2NSX9Yy;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 37DBFEC00B1;
	Fri, 22 May 2026 07:12:37 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Fri, 22 May 2026 07:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1779448357; x=1779534757; bh=0y7uOrHDZl
	4+NMt5fHS6815qI6/kYey1ZZhw2ts6tzE=; b=x64UsoiZq/jSrdcslmwbfEW/B2
	H5+s2UMirgKhiBwOJWydQNwcyyK+puow7yNLYvpYmsSwQ3njVrBbzVYMrB/0ma3+
	lz5Np+3RVhksEPV4e06oshkBRfcoNmY3R8wtCvr1GNSEnZCPtAFWb9rWMHWE3uZ3
	RTEUjjWrRVf86HGugmHnoX+mnw66xB54B5pqLUAKb4OUNq+dabsHyU3Nw8v0THG3
	e+Z6/mnL3ZQL0s9EE7zY3AosUoqqGjZ0v9IHE8iYAy93kzWOzTULV0gRM3xZ+y95
	bpXWyxBl2Nm+zKzQRj3GgvXhQmX7keReKLtHoTfeJUy3Q4ujWbOShRUaS60g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779448357; x=1779534757; bh=0y7uOrHDZl4+NMt5fHS6815qI6/kYey1ZZh
	w2ts6tzE=; b=b2NSX9YyI5xRzygi7Z06DbJSAi3RVmAF9oDsDNiyu9RdugaNI6c
	F86EVKWk4teYciEb1RZwIResmMOCGfXfYak659stmt30Annm90LRV6UWcg9MYhsu
	DKsg+foM8vhF+Iiy4UzGYsBKjBfNdNV/NPpMSRrdnKCJxp8y5yatxfX9qmZAgcTL
	3e0uBvTZ0hkGfjySJ+JWeYRZtgSeRPh0zsdMVtLio6IPzeJNn/0hHuECbto6jQRT
	3g0TO+dvaNR1e4YCtLNXcTZtqWuqyG9N6Q7i1c4PuycSYUA5RncXTfQ8C90DKjVf
	JyYEHL7MNk38fFbwYLcK+bahPauhYf1iPDA==
X-ME-Sender: <xms:JDoQal0v32NgbA-1Zk_bcUIIS3mVSpPztFRJk4xnN78zqweHKdwvnQ>
    <xme:JDoQavz5wVGB5lOqJzgsJyCO51WS_uce0ZeVKPyC4-Rv_ZLgKCVQxKILFd0aK57zy
    ce7GEPsMC1BPXjRMv2qwlg9F8uTbhan_vZOui93nK_xapDvPGCH-oK6>
X-ME-Received: <xmr:JDoQavsyQ1uowoA8o0cYXUKZo_S5eLov4HRtPT8Mi6Z4Mjx7iK6LJogErnBeVrDB-Jrb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduhedttddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfevffgjfhgtfgggsehgtderre
    dtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghr
    rdguvghvqeenucggtffrrghtthgvrhhnpeejieevffelgeffiefhfeekleejfedtudeule
    dvvdeguddthffhfeetveeukeffveenucffohhmrghinhepohhpvghnvghmsggvugguvggu
    rdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghp
    thhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhorghomhgrrhgtoh
    hsrdgtohhsthgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggv
    ugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtg
    hpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhr
    tghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopegrlh
    gvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehrihgthhgrrhgu
    rdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrgh
X-ME-Proxy: <xmx:JDoQapymu8gRotfx3X-DQcQK-s3TLgnEP1zGX_VrYw_-PNeTZkGlOg>
    <xmx:JDoQaqDn21W46ZoTKfcG3Vo4fTeI2s9YHF5o1jpTftok36XZB2kCyg>
    <xmx:JDoQavd9a_dl8LYzyp-zE8u6fYWUHqLMQHMQ-OmtoepP0q7c_wo5JQ>
    <xmx:JDoQaskCrUs_wj9PwbBLtL5b-zkTgzWjyS8cHLQ4A0QgCpbJqdrQEA>
    <xmx:JToQaqz4gxDn15M_sUjcWmcu1u08KHyzAiwqhHTSYS60cz_E2g8ba6JW>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 May 2026 07:12:35 -0400 (EDT)
Message-ID: <b8c28ff7820c44ca506daa0cb44ceb110c1bbea1.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v2 0/5] Split vim and xxd in different recipes
From: Paul Barker <paul@pbarker.dev>
To: joaomarcos.costa@bootlin.com, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, Ross.Burton@arm.com,
 alex.kanavin@gmail.com,  richard.purdie@linuxfoundation.org
Date: Fri, 22 May 2026 12:12:32 +0100
In-Reply-To: <20260521125828.718050-1-joaomarcos.costa@bootlin.com>
References: <20260521125828.718050-1-joaomarcos.costa@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-s7Vwb0dXt759rzjkocgp"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 11:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237542


--=-s7Vwb0dXt759rzjkocgp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-05-21 at 14:58 +0200, Joao Marcos Costa via
lists.openembedded.org wrote:
> Hello,
>=20
> Honestly, my main motivation to send this series comes from a time when
> I was building u-boot (meta-freescale) and I saw vim-native in Bitbake's
> tasks. It blew my mind that a bootloader somehow dependend on a text
> editor (yes, only to be built, not to be executed, I know), and the whole
> text editor was being built to provide nothing more than xxd.
>=20
> Just to be clear, what bothers me is NOT u-boot depending on xxd. It is
> actually configuring and compiling Vim (considering the overhead this
> represents) only to use a single tiny piece of it.
>=20
> As for the tests I performed:
>=20
> - machine: qemuriscv64
> - toolchains: clang and gcc
> - classes (xxd, vim-xxd): target, native, nativesdk
> - classes (vim): target, native, nativesdk
> - archiving: the resulting tarball includes only xxd's sources, as expect=
ed
>=20
> Some benchmarks as well, from a previous mail:
>=20
> vim-native-9.2.0340-r0: do_configure
> Elapsed time: 6.81 seconds
>=20
> vim-native-9.2.0340-r0: do_compile
> Elapsed time: 4.43 seconds
>=20
> vim-xxd-native-9.2.0340-r0: do_configure
> Elapsed time: 0.03 seconds
>=20
> vim-xxd-native-9.2.0340-r0: do_compile
> Elapsed time: 0.23 seconds
>=20
> (this data comes from tmp/buildstats)

I appreciate the effort here, but I don't think the ~10 seconds saved
during the build justifies the extra complexity in the recipes.

The only dependency on xxd in OE-core is from the dosfsutils ptest. Have
we tried running those tests using busybox xxd? If that lacks support
for one or two arguments we need it to handle, have we considered
submitting patches to busybox to support these?

Alternatively, we could look at tinyxxd [1]. This is based on xxd from
vim with a few improvements, as a standalone repo.

[1]: https://github.com/xyproto/tinyxxd

Either of those two options would isolate xxd from vim completely,
unblocking removal of vim from OE-core.

Best regards,

--=20
Paul Barker


--=-s7Vwb0dXt759rzjkocgp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCahA6IBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bkySAPoDgGlBcSXbnORP8TiGNplIUeI+4iOdkG5Y
Eb/C1y843AD+Oy+Yd35y4HfX0L6WQUTjmh3wfrN4kY10d4Mowh0tiAQ=
=8Cl1
-----END PGP SIGNATURE-----

--=-s7Vwb0dXt759rzjkocgp--

