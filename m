Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E95C44516
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:16:50 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13240.1784294204232113218
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 06:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=xlV5w/ZW;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=GRz7HS0g;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 14E19EC0189;
	Fri, 17 Jul 2026 09:16:43 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 17 Jul 2026 09:16:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1784294203; x=1784380603; bh=tg68Yr9Uew
	gMpxkbaKI3HSsa7g09JzfxtE2FHDl3SA8=; b=xlV5w/ZWTs3frIMHHBeTvQEfHy
	DjGkU0d1Izg1pIR4YBvHtEQfEKOVrtTGzom4D3XfScQ+SIE4KEhORtibjtOfeH63
	QOVH6cZSQJE/m7bVtZNOmFEmEZiKd/emsL4gK/qensm10GGU20AkP2sgzk1+1n8d
	UD+KCr+Oq2/dJu8vAZuhLdZf0IyCgSBQlBMS1cX43H2+tC6TcM9lwoQJ8Px3JKY2
	iDHe4gpTeKr6NXBrQgqqvrzafjanR+RSbq5Q7jD3Lc/dBeH1clC/wLxjMWMg5SJx
	Q7oKw0cEB8DwogIVZlnEa5m61vZ4ScCDDh82mjeRFVTCdQfLRlx03FEzQmpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784294203; x=1784380603; bh=tg68Yr9UewgMpxkbaKI3HSsa7g09JzfxtE2
	FHDl3SA8=; b=GRz7HS0g0W4r4h8xkOY4ZsE+82dc7D2dHD+70A1OdEIE9nPuIv5
	seWbKh33DrzVcWrEpNKtGCURdq/iNQGLGPVl+T4DFTOq5f8uUrX06yW8BXdCj4SJ
	vFyBI8AoLkgoMKSImOumDELIlV3xiV8CwBYp1vABhhBlsKIi2oAepE8T/i631U79
	cAFNoM6yhpnMbTJVaZy9avxPbFUDAKCWiSzgxsl+Y1/3Ufy3pys8yQ4Sw1M1prrF
	zVYlkwjzvCqmopm3TmyvCgmQLOQUTcQWvU/R4LTxrYngz0tqi+384Gw7g3kaHikd
	FpUT+WVO+NP7l+j63r2SEjwU0bmS0dvLXww==
X-ME-Sender: <xms:OitaauAgJ3HdNH1-ArBlfIt6UKtdKcduha49jPR9IcQr8bbzyB5OfQ>
    <xme:Oitaavj_4EYKXYj4X0-uVtO7kEmnHb-b5DM-jGR4nUnoKMmAdQDQGKb2Oi5BjLZ72
    HokiX716gCPZoGc7ktRbeLxFDm6QxmnLsZpI_XRcH8Ql06Ok23-WA>
X-ME-Received: <xmr:OitaamnaT8qOMICNsbPkqi93qtY1hlv0DkeX2NV3U2IqtiXecmKynlITrqjq_NVrwr7QtLmfRtZXsggfT5wJxJ5NkTy_A3PLxnzBew>
X-ME-Proxy-Cause: dmFkZTF3ytUqYi2y2qd+ZrrLHCai48zri4lTP+qwXLBYNuJC0afrkw3xzxkE4UvxGXyT5a
    gNCVh+c4vqYG/WPqFBa+g/00eYC8JyXYXwGrZssOt/7wUoJ7QBTHKwpTqikysu47xTDQ6A
    4iUGxaO3hDhwq8s7OijL3djjT5BoQDbRWJOzuIWg3q6cnb3pLTql/cMZzj6mNfegWyghd/
    SpbajLLgrx5HnjZ4sJIER4vs0vdmQEXD0Vi4Unc/0//bFfoeBywFmn1cc6DY1lS/sO2BTs
    rXWhWgYp31E15CELowSV2PjaDQucPoh0zWy9X7F8GBqliMF9TWpM4aqMBJ5/xD7sHJY1kP
    8Xa3uTOm5BlPYfMB55zSkiBD4zna8dP6uCVJkemjP3XGqaAw9ms2k9MKI5l/Ax7Fc4am85
    FM3W7GkhzE0hyAm4yGTgkVzuV3WlNllxuT+N5oxPBjlB3vZRRBNwIwEnSAf9A43o2zLdaJ
    joeclnGGngb8VqsezBNBmaiux3FsLjp5chXpKxzm3kBNIE1N1BHTmgbQYhXvMLqzpOxVrY
    9duKzMFKNlmzLkO6VF/YHFmCe270rvcVRRgqLaC6o0wwMRUMdNfbymIoL5h9B6LuFO/yHm
    rh4OujYchUZgzEQcJteQwlQSGVGPC2m/FCDqFQHyqhlZhmoegTyxj0FpeJqg
X-ME-Proxy: <xmx:OitaarpiJiJoZznD3zt6mDtWocfURqPDEsANZH8_6MfKSngZu-5CWQ>
    <xmx:OitaavFaxANWvbe7nLmVhilwNSlbIkn6fG-c5cxxmMBJWNVQ9i8Hcg>
    <xmx:OitaanyMESdEIhxW0KiUsA-oZs9ATqxlLnw_rN7evdjz1PmPmW5GLQ>
    <xmx:OitaakpM6_jEJbnVMF2DXF5IQad3rE_F9hcq5MKcFZFo9LrrhBMNOQ>
    <xmx:Oytaavl-tvir_GuVFR-qLcA-6PEr3nS4gNH-2rPduf87Yl8dPqC-r8uV>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jul 2026 09:16:40 -0400 (EDT)
Message-ID: <1bc50918d31fe65ea85af0d0b2d4387a653cf82a.camel@pbarker.dev>
Subject: Re: [OE-core][wrynose][PATCH] util-linux: upgrade 2.41.3 -> 2.41.5
From: Paul Barker <paul@pbarker.dev>
To: Siva Kumar Balasubramanian <sivakumar.bs@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Yoann Congal
	 <yoann.congal@smile.fr>, Chen Qi <Qi.Chen@windriver.com>
Date: Fri, 17 Jul 2026 14:16:08 +0100
In-Reply-To: <CACFV95JRe_vTQ3Vi8KKzvmbTvPp+aNewpDKXKb+xo6AkNCMG7w@mail.gmail.com>
References: <20260625090231.2575081-1-sivakumar.bs@gmail.com>
	 <20260706115516.19878-1-sivakumar.bs@gmail.com>
	 <cca6b5d5382e36e325a075861daf8bede882bcac.camel@pbarker.dev>
	 <CACFV95JRe_vTQ3Vi8KKzvmbTvPp+aNewpDKXKb+xo6AkNCMG7w@mail.gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-rnHXNWYHAMnAgFaTU1/P"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241181


--=-rnHXNWYHAMnAgFaTU1/P
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-07-15 at 17:20 +0530, Siva Kumar Balasubramanian wrote:
> Hi Paul,
>=20
> The pam_lastlog2 libpam linking fix (YOCTO #16320) is included
> natively in 2.41.5.

Hi Siva,

Your commit message said "Drop two backports that are now part of the
release". The "pam_lastlog2 libpam linking fix" was not backported on
the wrynose branch though, so the commit message is wrong. Please send a
v2 with a corrected commit message.

Best regards,

--=20
Paul Barker


--=-rnHXNWYHAMnAgFaTU1/P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCalorGBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bqjfAP9UBRIRt229CcGfFxZa+6v/VPWvtcbEEcGN
2CeI2Yxj0wEA9/TdhOdCws1/o7LsmbKxeKXXzUpUm0RPFt9Iihbt5g8=
=rpla
-----END PGP SIGNATURE-----

--=-rnHXNWYHAMnAgFaTU1/P--

