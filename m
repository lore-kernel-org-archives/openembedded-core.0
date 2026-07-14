Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4950C43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 12:54:32 +0000 (UTC)
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9070.1784033672350462288
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 05:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=Go5CQGQ5;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ZKnIImow;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 64817EC003B;
	Tue, 14 Jul 2026 08:54:31 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 14 Jul 2026 08:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1784033671; x=1784120071; bh=yt82Zdipdu
	ojFfV/ijDLF70r+mPMP/5Sza0k69PyauE=; b=Go5CQGQ56tynPHODQHPfrgoJ16
	W1Nf1zeH9FHxww3QinHnOePbJFV4esJOgcMN8E14aN98bRxJSXFNkZn8i6XMakRg
	hprzaHhuPM77SBgNQgA0isksrLoCxr5gHRoVMn82/KCunmTXRfHD1q3runTJf8YG
	+0FxY4hUR8Tj7uhvaAoSx/iltECyGorxgcPiumevwfoobA0sVbXFMrMUpw7mjqBB
	L0CqAObwYBuPyuDiXF3LRz2py+T2XBr0UavFuWJrOYnL77tNZo/enexRCW01SKZG
	uLQFJyJ/yUDkrQoqOwug32Qayi9l3DivCSwUSeey/pMmICL3B395IOYSkKnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784033671; x=1784120071; bh=yt82ZdipduojFfV/ijDLF70r+mPMP/5Sza0
	k69PyauE=; b=ZKnIImowdR2d8uZBp0XSHKU4b4NgewZ06XJHiEco6fdMtK2htoq
	dGXB7pzbp587EnZBSx5ewMs9zPXYAXye92pg/GQtMev9VuDrz3Z8P7QOI7FziiV4
	FblIgG+uoTx+KPJLJF7zqR8hPOMjGQQJBoSZRWIwqh3AJw+FwCyInSDic700Vnxb
	lnuc/D+R3w2Ui4yEc2+5ppGj24ydeafQ6Pn3GZm7x55HM9oB9XmdiK6P6Zs1c6Rz
	apZbIjHPVrWCZh7iFGTWz+fCSTzSU0g2h3Y1/XLhWwbdvl2O9RZWQqGaDaQuhKT7
	aXkb3+20xjirbBXAa7zl5G81h5JFrQfhB+w==
X-ME-Sender: <xms:hzFWaiCcn9XoClDS8g4qafdMveqv5qgGar4esPc0wEXotmed6X7b6g>
    <xme:hzFWaijZTeHbjoG3wRX3UXX-7Is938-fHKozhtCh3vXb5j0iAptDT-nrxkIPasnIX
    do7suhbinUNkOipm-96RKmy3cnuhrf9cRrECKpk0qMNKxVRachVjhor>
X-ME-Received: <xmr:hzFWajNcaPSPhbSWcLF24ZrfrVP0ucsBvLXGj5s0zBqZwEFs5sVpxcuVCkWNIUsF2NFdVgulsj2l9RrtLwQ8PFSQH9a2fBPjPV6iusI>
X-ME-Proxy-Cause: dmFkZTEtv5v5PibcqoB/39AVdXXwI9zACrEi4hnjn55hmz02YGgesHYeTFtIg4HoE4jDyh
    X8WXFczf8wXuoUODLZ+k+RjcykxPgjqjPndaArwT7Wb8jO5vBnggqN2OLpUir8ezwra8R1
    IjKCqq8756CPOTSLW+IlGJsw8ljTmmgkkMhqHSFcpk8JPwjBSBQanFeCaBQ66DBmHYJ6nb
    Fm8dgE6hKgyWXN8huH42IzJu710F7nlk5O+Vv1qkPNiPT2qTd1nMPXX7rFaSo7kdhHur9s
    jRG/zvQGj07MVXRJWWn3QOfwZ3uq7xPB56q6HNKA5VaU8T1EFLrkfjCrcrbLi0+95Q/AWR
    bb1WTxuoUUwX/BR8SkoEArvgZNeGQcI488hpXG2HSOwAxRdEZQ2uf+2An0iVd0gAuAMY12
    Xs5qkVsqgvn3E3mTmLfByF6/ROPb7i05LdQmRsJDUj0aAUq9X+d76z85jwybzlOqGvv3I4
    yIflAy/lrfmzx2U9Mr/GtyU1QSP6QJPgbEs2mPI8QQ5vnW+QWishAkJgbje3sMaAX/Qi8U
    U8NbXG6Nau/6gUyK69gZ1pI2LCZlsNgDbp0Ivvp7VBtRttWfanTk/GmJYRcpV+y0l7LGWs
    UV7Y4rxHuEakhDRlR4ifeMSApItwfk16sfN4uaS3JTfaSs5FfGVf/N7N3o6w
X-ME-Proxy: <xmx:hzFWar5cIzRlW11SGX_UQFGAxhHQi2E-Dfvt8UzyZoXGVpmp6x7jnw>
    <xmx:hzFWap2uTyVKsqAXXqxKk6-RKzijHuc1tgfn6FL35VmgXXylGCw7DQ>
    <xmx:hzFWakZSIjbN1IlwxIh09kr0jTGdIY8UsU2iN1ckF_8f_eRmprRcTg>
    <xmx:hzFWapCepEoDTQqlAXO0Cd9sGZghsiQ3HIUs3Sbti1vwmY1OYMeQKQ>
    <xmx:hzFWammrzwI7kMWEcGQ86BpWmUFuI1A7YogryiMOpHP0AoSQ-t9ZXTsy>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 08:54:30 -0400 (EDT)
Message-ID: <0d568ca133423aa58db4c63c5e55e4f5e3fa33bf.camel@pbarker.dev>
Subject: Re: [OE-core][scarthgap 06/25] binutils: Add CVE-2025-69646 to
 "CVE:" tag
From: Paul Barker <paul@pbarker.dev>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2026 13:54:27 +0100
In-Reply-To: <a05c20091169759c01e70bf2e31dd7d0164368c9.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
	 <a05c20091169759c01e70bf2e31dd7d0164368c9.1783590688.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-d3MfZf/CcHQ0BhuC1LJi"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240885


--=-d3MfZf/CcHQ0BhuC1LJi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-07-09 at 12:06 +0200, Yoann Congal wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> CVE-2025-69648 was marked as a duplicate of CVE-2025-69646. The
> existing patch already fixes the issue associated with both CVEs.
>=20
> Update the "CVE:" tag to reference both identifiers.
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>

Hi Yoann,

Please drop this, I have replied to the original patch.

Best regards,

--=20
Paul Barker


--=-d3MfZf/CcHQ0BhuC1LJi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCalYxgxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bjV6AQCbBV8BBAf0iolLglCu7Ktqh/BfXEnZOVe7
ydfLNNvoXQD+M+5awSsmh4FRu0TV4zhs/a1Qgyq1QbLK7FkwS7lb5Aw=
=xitN
-----END PGP SIGNATURE-----

--=-d3MfZf/CcHQ0BhuC1LJi--

