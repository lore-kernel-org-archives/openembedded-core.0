Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C649F8D76F
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 19:11:46 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23335.1776366696100919172
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 12:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=W7qOXOHN;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=FyFbNTPR;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 3E90AEC008F;
	Thu, 16 Apr 2026 15:11:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 16 Apr 2026 15:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776366695; x=1776453095; bh=j1zKIPf6f3
	bHOYpaGPLMu5+rA2jrOb6AzXKqCff0Ixk=; b=W7qOXOHNn822unrMNDyZXJi83W
	QvxN15xXfZVUwHUmWQ0TGvdoe91XzWOIi8+OPPJ5MNoS3XZX8ajgK9fBLoCwZT3e
	hp/CJzPgqGq31ADsoHduHAjcxQPlZvdv9OJ2w618yAaZw/l3b2TaRt99xY/fOQjn
	EYHqSKNyyD3xHviBd3Y9lKjaFWZhzlaHDK7wPtNxno2qCMtiodeuqFHOKxs9Pdu+
	m0+Jn7Cj47vPBNQBH1le9Zbfjyk3VYOOq+xMmddUDQAgObJtSZerPtbzk8OeiJ9o
	ZhQ2nGyGqaMqWCoOAiFP6BHy9yhyX7B3hTOzwzcUjApCIUojgAlo/l31JzfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776366695; x=1776453095; bh=j1zKIPf6f3bHOYpaGPLMu5+rA2jrOb6AzXK
	qCff0Ixk=; b=FyFbNTPRWIklgJEJiXwag0IY4cdVsm6eBat7Q9AQNc0K3RlUY20
	BxY0sGSesA7+g8OWRSq/o8hIYsD/5hxXGQz/tVCSbEo0nnU0taCBbk+ri5MFeAlN
	n1+JIZi15ct47VSn6vm+az1FSeLMAPudSeFQ0mSUKfhvY/6tZhpEkCt0ZCq5nFHd
	QCWwFWEDcKPbrh2uqyETJHDEoktzm8N/bOSjTM+JjalhAN3CjSV1QrfZ4V/5cEgA
	wYYcIU7/pOnDO4T8XN/JpWQOH+Du20KrsYTUeu1UCIM5QDWFYpzCxiUCozOb/6dF
	sUbNahgJq3/2kykYPaDGL3OQjlOs8DJDuPQ==
X-ME-Sender: <xms:ZjThabhF4xMCbVcAKYAQC1WWTUVgIJzU0g2TLTOlSLXXKLj5qYYCsA>
    <xme:ZjThaeCem1a1lm1-xnUniOFSK6InVQfhcplckT3qRhxbrT-TU4X5E4-ve6jQBUTEI
    0eL0KoGUnI5CSLu3Xp17ihlZFeQFsipfhWLBMeETL6gPcXsY-fbmA>
X-ME-Received: <xmr:ZjThaYvbyJsXqz9vPCkiZcmmArTIOq6U0qULT3ETq6EpM7rGXJLwJ-0Ujdl1B5kMm-L59vmQRGpncW4esLJpmRpH-HrIhRchcXPwnWZ9ijAB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegjeekudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecufghrlhcuvffnffculddquddtmdenucfjughrpefkuffhvf
    ffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehp
    rghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnhephfejvdeiieelie
    ehheegheejudetffehhfejhfejjedtueetudelgfduhfeugfejnecuffhomhgrihhnpeho
    phgvnhgvmhgsvgguuggvugdrohhrghdpnhhishhtrdhgohhvnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdgu
    vghvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hhrghiqhhinhhgrdgsrghiseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtohepohhp
    vghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurd
    horhhg
X-ME-Proxy: <xmx:ZjThaTalwt8vf-wuoXyV-2y6Q3zTEshIMgX5eHpEv18ypyNRovHK8w>
    <xmx:ZjThabVZ3TFXVWq6lfSHmhkw-pGr8AnAYJs8Dze5oE6rnTKTWO_g3w>
    <xmx:ZjThaX67S2CaoqsgFVLG8qBY-oXghGh3X_jg7gOSXB6rEgvWV3skpA>
    <xmx:ZjThaWi7bgK9KiHW7PxoYLSX-79-lYGoCK76EsNFxrqnU9za5OMq2A>
    <xmx:ZzThaTCxA1pNXMQRolAEXHrG2fZ9V0PV-_IgFvK9BzwqQWd_t4DZ-2Mn>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Apr 2026 15:11:34 -0400 (EDT)
Message-ID: <f993a1ea7bc959eec48d2c6b97c9ba77012c0edd.camel@pbarker.dev>
Subject: Re: [oe-core][PATCH] libxml-parser-perl: patch CVE-2006-10003
From: Paul Barker <paul@pbarker.dev>
To: haiqing.bai@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 16 Apr 2026 20:11:26 +0100
In-Reply-To: <20260415065104.4102961-1-haiqing.bai@windriver.com>
References: <20260415065104.4102961-1-haiqing.bai@windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-YZ+/c7rsa2N4dLrn+L8e"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 19:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235417


--=-YZ+/c7rsa2N4dLrn+L8e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-04-15 at 06:51 +0000, haiqing.bai via
lists.openembedded.org wrote:
> From: Haiqing Bai <haiqing.bai@windriver.com>
>=20
> XML::Parser versions through 2.47 for Perl has an off-by-one
> heap buffer overflow in st_serial_stack. In the case
> (stackptr =3D=3D stacksize - 1), the stack will NOT be expanded.
> Then the new value will be written at location (++stackptr),
> which equals stacksize and therefore falls just outside the
> allocated buffer. The bug can be observed when parsing an
> XML file with very deep element nesting.
>=20
> References:
>     https://nvd.nist.gov/vuln/detail/CVE-2006-10003
>=20
> Signed-off-by: Haiqing Bai <haiqing.bai@windriver.com>

We had some questions about this on the patch review call, given the
CVE was assigned with a year of 2006! I was also a little confused
reading about a fix already being present in XML::Parser v2.45, but that
is for CVE-2006-10002 whereas this is CVE-2006-10003 (one digit higher).

So, all seems to be in order and we should take this patch.

Best regards,

--=20
Paul Barker


--=-YZ+/c7rsa2N4dLrn+L8e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaeE0XhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bgloAQDROMcCHbhY9FJ8PkLKJHUhMpxY5oKtaz4f
rTT/Zwg4kAD/S/C8KpGXuy9FEp4ja/hKwq/rFwX0icTNexd0BJEjCAE=
=EZzT
-----END PGP SIGNATURE-----

--=-YZ+/c7rsa2N4dLrn+L8e--

