Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351B1F531FA
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 07:36:52 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13591.1776152204034766345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 00:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=griNEfDe;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=XFVerqvU;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 230E07A012D;
	Tue, 14 Apr 2026 03:36:43 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 14 Apr 2026 03:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776152202; x=1776238602; bh=Nk+EXcUsav
	MWPe2OVgj6B9vfFcVB0x76yVG8vF8mZ3g=; b=griNEfDes9FqILz9qtJslgN3c6
	u96mdkRD03t3rgKAGPsVHCAEmDtdcg9pqbmApHRZI1aGjG0JVm4/rm8t6j3Cb9Z1
	PWl2FBbGe1BQ7Gr7ctriiBstFI9U+G1I0R06Db4F1JoI2paOZWdM2H0GpPDPuCPe
	8YY5y3p5llnFwn+L8tFMoDUilH+wehRwwwukAKWBUxx2CE8agxKbD7zpWcdLLust
	8ggnjuGIQVAWJA97whRCsT0UdgTg9ZKgpARzspybKMqf/kW2srpUGD47oQrJmZOm
	ckkKg3fKu0oHT4sTpkzBoWpBcIn8DWOA+1D/gT6kUUXdWSJNbat7FsEshtaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776152202; x=1776238602; bh=Nk+EXcUsavMWPe2OVgj6B9vfFcVB0x76yVG
	8vF8mZ3g=; b=XFVerqvU21Jk/6VPvZfcszPKaSPGlbZ24Tz8KKzdabg5f7o2WeP
	ILSvZcdC8ABWSyiFEr0K1ZflAn7rMfNne8QEJ3qQEZxXSUgQLp59AVERUDKAaqt0
	L9Yrtmjx6Oj72RRKE+FhPQDmSyvvx5jg8yF567MPYL/+s8jPbCAgT6WEbqPX84qj
	bqaCDo9dYsysDCM6xdUk14Ep2TRSUn5DdFOWK2ZbCm6C5/nney48CSx3eGut9vl0
	1EKzd4kC4Cn6q1MvJnLarrz0PnZEg9mXzT4HU0y5Gc+7XKTFuMdLWkxBKZL8bgkG
	I+zLS9qfdGK8i4fU8Euy8NgOUVRekEucX9Q==
X-ME-Sender: <xms:iu7daZGGS311VwuO8EDy2z3RtDkK3WMUiXfILfyK9kPTdKvk0_mmVw>
    <xme:iu7daVyJjLHerthpORfdomrbrKXu245Pmt49vgn5K_rQS-CpjtiD8BLsRxW3hcYhO
    e4JlH4QP6Prf4k3R5hf1SCQUHmV4Uq3ayvOrzkRjgrlM33yW51p3Ao>
X-ME-Received: <xmr:iu7daYgsjXlCpORmoQhr5h43YniShvrgP02in2psP9xJUKhCjMX5fNjQt6HL9KPz96dFG6sMHf5J64TCO6s4pIW5Ldl4vlSZ-udbzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegtdehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkuffhvfevffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    fhkefhuefgleefleduleelhfektedvffeitddtueeukefhieduiedvfeeuhedutdenucff
    ohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghv
    pdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfrh
    grrdhstghhnhihuggvrhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgs
    vgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprh
    gtphhtthhopehfrhgrnhiirdhstghhnhihuggvrhesthhorhgruggvgidrtghomh
X-ME-Proxy: <xmx:iu7daYypSH06W1Jnl84GVHGEKqc1lB1b_WGaWv9oe1A6N9hNTkOa7g>
    <xmx:iu7daTJ0tb9QrigNnWp1XchgVQzipLpGXhSLqdJCXqyYoHfJoo4nlg>
    <xmx:iu7daXTmUCtxo89EPTrqmMIOUxm6nXPBZd309e43DB6Wnrph8xjaTw>
    <xmx:iu7daTphQZnpPjU6EnIPvpyoeaSW7XNER5o1PGwKEBXbQcdYZnwxsw>
    <xmx:iu7daTR6sC83oDrxLfmL5CpPcxm-CFeaSIzweIElyGFDV_7SwvtM9ZHm>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Apr 2026 03:36:42 -0400 (EDT)
Message-ID: <4200cb9070f15e74f779cb7f752b450977871ec2.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v1] gnutls: Add p11-kit for native builds
From: Paul Barker <paul@pbarker.dev>
To: fra.schnyder@gmail.com, openembedded-core@lists.openembedded.org
Cc: Franz Schnyder <franz.schnyder@toradex.com>
Date: Tue, 14 Apr 2026 08:36:35 +0100
In-Reply-To: <20260408130553.819420-1-fra.schnyder@gmail.com>
References: <20260408130553.819420-1-fra.schnyder@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Bb7hPG3BWQ87aKB9mCdZ"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 07:36:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235144


--=-Bb7hPG3BWQ87aKB9mCdZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-04-08 at 15:05 +0200, Franz Schnyder via
lists.openembedded.org wrote:
> From: Franz Schnyder <franz.schnyder@toradex.com>
>=20
> U-Boot mkeficapsule host tool now uses pkcs11 related gnutls symbols.
> If gnutls-native is built without p11-kit support, linking
> mkeficapsule will fail.
>=20
> Enable p11-kit for gnutls-native.
>=20
> Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>

Hi Franz,

We've decided not to take the U-Boot 2026.04 upgrade for our 6.0 wrynose
LTS release. Is this change still needed for U-Boot 2026.01?

Best regards,

--=20
Paul Barker


--=-Bb7hPG3BWQ87aKB9mCdZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCad3ugxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bv42AQDoV0M8GSG0+dqw7EKoM+LH865DIl6b8UWi
yWUZ1XkOygEA+HrZur1k8OmOXpOGGxVaI70ySkth6jlYtyY3NcZdVAw=
=oe+K
-----END PGP SIGNATURE-----

--=-Bb7hPG3BWQ87aKB9mCdZ--

