Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D81CD185F8
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 13:33:42 +0000 (UTC)
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6393.1767879216453718216
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 05:33:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=G4fbN5iB;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ohPUhane;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id CECF01D000F4;
	Thu,  8 Jan 2026 08:33:35 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 08 Jan 2026 08:33:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1767879215; x=1767965615; bh=ytZGbtkLX+
	7p3IrjjC7DPrFduZhJNM9685/ZvaoyaO8=; b=G4fbN5iBgOKM9d9OHF0vpD5aji
	WLNnTB5YJsZNyUJ+EtaMgQTyB9ktJ8AFZ6hXS4lyCD4NJJfUVL8J0Ive18PKWe2a
	PEov/0pGOdb7EoYU3XVadZdWWAusoYrsQi204GGZOAjn+l+uLs0pfB2EJ5M8356X
	DQXUvCFSy2WIjsqroHjMvd+wbjHOJc8s68pmQO2S/IL6UwejWUv7dNnTnhcdSXO8
	y1Dvaz3HZRiqcAlDZYzYGl4wgqLC8erXa6k308gF02qMkzEb1NdVjTDce30LvIG8
	/BmRrmj/4/xkoDl5sdPHjBukCzBiyH8Gwy2ZepUGnmJJXw4aJMYfwvOpSBiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767879215; x=1767965615; bh=ytZGbtkLX+7p3IrjjC7DPrFduZhJNM9685/
	ZvaoyaO8=; b=ohPUhaneL9JtW13cd0ZDk7tR0jz+/y3VkoCNBcFgERk7dPAq7rx
	wkVt6cSJ961+jbaLC2EooQDbMgBnqAj6NrfLe+QAo8e6peU4Cjc2qwNa5UZNoq5h
	AvOnoC+Ko/i3KPbw3XIvtdL0TdxqHuCHHv584C9lEK2XGv3jgrP/bHUShuNTNcCH
	spO5RYxY5Umczn9aex9qEjYHSdJxchU7Osef8HwqzetX13ovadb3/j0f8Oy5Nd7x
	wM5Dp2FVPrBDvDfemTsSbnmWwNTYGA2XhHKxXgU7tRAT2nZj5UUjJvp47HRLvsYd
	n0eoe/pN49+sa755TrmRJsig5PoF0TfIbBQ==
X-ME-Sender: <xms:L7Jfab4LSFoYRoujrVa88Owy_cPASVFwe1-HpN9CYfR6GQBYvZ_FNA>
    <xme:L7JfaW5T9ZqOr6o7ikIHdRz5DhTtLlsm3UrTaPy1EENvrepmaJdv4ao5xBP2eb36A
    NWAay41HZlSHel8Zzc5zXaz-SyCaba9mF_fbqyKyCqgY63ysth2FA>
X-ME-Received: <xmr:L7JfaQFQGuWPlRCyXd0SSmOTSMwA0fJwYLaGuncArCtwYmM35pk9OafbYnwbVzdW3Pp3230IZAb_1mH4SdX4EjqtgUNbylfJJFfEWsbtEtxd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeitdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepheefffelieelleevudevjeegtdevfeeggfefte
    ekkefhueegffelffejgfdviedtnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdpshgvlhhfthgvshhtrdgtrghsvgdpuggvtghorhgrthhorhdruggrthgrnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehp
    sggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehuvhhvrdhmrghilhesghhmrghilhdrtghomhdprhgtphhtthhopeho
    phgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvug
    drohhrgh
X-ME-Proxy: <xmx:L7JfaXQ_2_bmcJhZo6ta6H12IzhJ2g0DDwXnpiRMNVORHAMTq2Zwiw>
    <xmx:L7JfaRu6EhcEkuFH2QW_OsyYDh5hWk9sGhQe8SK3z2GSHENPalF7gQ>
    <xmx:L7JfaexqqT6-H6UgEB3BwywkToehJGLfXVUrrvgYozWM6Vimy7s_Bg>
    <xmx:L7JfaT5BV_kkpho2SxtXM2UXy2txzhfRuyJvoCcfXUpQIwOebuDTxA>
    <xmx:L7JfafJEkATWZkE_gu-6hjC1v7swYeiKH17JhE0IpsprpqkskghyltUY>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 08:33:34 -0500 (EST)
Message-ID: <1b37649b1cfa12e2c76f94f0589f8694e682e120.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v2 2/4] overlayfs: oe-selftest: Make the test
 more deterministic
From: Paul Barker <paul@pbarker.dev>
To: uvv.mail@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 08 Jan 2026 13:33:29 +0000
In-Reply-To: <20251224141659.2218381-2-uvv.mail@gmail.com>
References: <20251224141659.2218381-1-uvv.mail@gmail.com>
	 <20251224141659.2218381-2-uvv.mail@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=mQINBGC756sBEADXL6cawsZRrDvICz9Y1SG0/lW1me4xpq36obh7a0IGAzp3ywNRb/4MO
 DTqP4+DD0cIFuDY41/N17g0sNlp8z+/k/IIDmNPtYQOTVmAkrkdDU4BP8dD3Cp1PUw6nrbInfujAJ
 NrVM0IVDkwKTbL2Nu1P+xns4MIpF9Kj4XN5celYJ9vEJ2n0Bo0nO5T5vg46dihIaDl+24iNIHSsHq
 YyEdMBfY8kY2RulpaAyFOuaaHdIeDkejVvO5xLSiYLjB5qrRhgH134lJXsuLOsFQ64ybGECuOasnb
 auevsPBAaroQW0pqVb9FneGrWHxMCLlQHJRqQJRdVa6bsUdp6NWra8/0msPawSrFwGQdfJBTA3aXJ
 C2CG1JxEgj6QQjEQA49DSjgzdhInbiIK8Vbp/zedM4aVue7qJnwPMTFQM9lYx63b7wLN4Tu8B9YZ0
 UFdSwMCJuqmYGsYRUYdwM3ArjS0VO6WpU+HBKvzLK5GQfUTSM8KaZ5eA2Uo2ain8SSZb+WptUYKpx
 F9jbtCPbjpZKzGuX4iHFl9eT75TM9iXJNGAjB5xigkADLwVfPoJ5E53S+KdNVuOWHugyLMPNAQHOw
 pw5Rey+0zxyzPd4wphutc93UIU5g/029ngAc7DuKCq12jl7fhkjqFlFtYPIc1k7nd+RSezmH/qRes
 bMErHSX1MBSZQARAQABtB5QYXVsIEJhcmtlciA8cGF1bEBwYmFya2VyLmRldj6JAlcEEwEIAEECGw
 EFCwkIBwIGFQoJCAsCBBYCAwECHgECF4ACGQEWIQSYsqrBAKw/grtdVGd0l1yBt+ZrrAUCaAzHVAU
 JCTdOhgAKCRB0l1yBt+ZrrA51EACS7IYZaliCgQEhq8nnsQotchJtIZbO6nr8tk+6gicX0loJYqsY
 P2/XZ/MaF8kWYSGPIHjiCcB8tEISUFKPAvfCu0Q/X7n62AkSUZOhsQ6T/ajCaXStv/P28kQmGzoCp
 6ljK/zALMWKvWFEbLaZprIWV8AZJxzJWhfSdb+1XnLlmwhBCfjXJeR/TlGWhNTqTO6vyAtZ5OpGgq
 6N9EG60EQd4YWYwliDhCoUYRYR8qpp9JMrsDm/dzwd/A2/3rR0zzCtkha29kHqdVJtsd7bbiVLr8/
 Zpa9Wcd7EG32CC25DUdkarU7f2P+goFVXfddGQRPy7l9uwF4kmtLGeuxWCCS8+4FPadifGvL8UoE9
 62fbxdHTzhjj0Yqs8zDgEwQUxFjpbmTseVx7QdoEe783jWqH4QhCeuo2kSjC4/VIRGDAS0/7Hq3rj
 Iqqg6zGY8YQRvUyoOLn7Ip7WbHkZOUtWPjPbxe2tgeCttZkGrLQCosH0dlC0Hm7KWs+XHFp5d8OVd
 WzIgWUvYkVaDeLHe3b6tM8AXoixS1rSQrnrAs/O/62Nx+k9+XVAy1clY2jdYOstuPvDhcqkT10RPs
 o2qQnH7RGh2DCVu1D10XwDE1CWZ4Op70BO3g/I02ojT6kG4MHh6JX9+tjpjOINQQf+rGiHzj1YZYf
 z0oc2b0NQI//cy/pDbQjUGF1bCBCYXJrZXIgPHBhdWxAcGF1bGJhcmtlci5tZS51az6JAlQEEwEIA
 D4CGwEFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSYsqrBAKw/grtdVGd0l1yBt+ZrrAUCaAzHVg
 UJCTdOhgAKCRB0l1yBt+ZrrBr7D/oCOAaVVHKCuFHHJjnCNuN06o7BRgBUR8IzQxDSc0WIhTSNaa7
 OWPSDanFtDJwOVhe7Ongu8ZF8gsLXg8jb9iS8J2lsm9q4tID3NCQIL0PgjI2/hKKOt1dZs4RGcFXj
 v1nVEwFcvaJE4996tr9UMeZeOtipdlnGoh4Sozs2UvWydnc8SZZ3hCqxbJiorxD7wdrR4As5rqesP
 YwiNqE4KW3jUavf1Sr0U94Umv4l5UPGQQekBxjh1ujsCo05g4IByS3RlDBxCQDvXAMBVHW20PLofD
 aFqNpynQwAdpBS/cvX7tDK2pq+Rd4YK8uuDoHxH18dfCZcGYzSEUJ6y+rbYiJGh01mJFOM0oJP4DO
 9L79mJpURUdZNhI5/GVkCCxwt6HcNt24ertMlHDQkhZ6igP7zBgzODZ1sizODISaBh4M7lyxsBl76
 0dwghNbczt5ytG37mPLWjYaiJMeU7xQtoQo3yZDQvUSMnfFMxWYJO9Hi4P6H2gnMsDrPRnfr68vfP
 rbseTtQM8cpfGnV0FzdFfHSTMJfcFA4BdeCJsn73JHuNEBMjDvUfgjN1a661nEzA5Zd26HQZQ1mQM
 zRkrHto4z7Y86q05esioZ8Vd2Dhm1SMCBY9PNd5QrGpS67uP0wGOK2o3q9eQmxjenFHGAaOuTEZWT
 UpTTTw8SSeLBAHSSQ37QbUGF1bCBCYXJrZXIgPHBhdWxAcGJya3IudWs+iQJTBBMBCAA+AhsBBQsJ
 CAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEmLKqwQCsP4K7XVRndJdcgbfma6wFAmgMx1cFCQk3ToYAC
 gkQdJdcgbfma6xTZw/2PQ+vjkegBRAHxNIMcj0j9QfP45ZE4bmyGrCDb5i8BwoAJccilT8chvVFgB
 AjG40Zx4oFcRKYYe6AkC6/B5U71307/nqPtt0gEy0VmTi0V+28eQPrNiTLa+OL9B5SGki/45N3g5V
 hdqDNdvx/P2k1cg8YsndVE5ASmdPI2l96n7dqd0fW2C/rzrYNUQ+mPyvNgOGcD82YzahLRfb2u/GV
 CWzEc2iplJeeWlUGoYHPCo4ztZDqJghCfgBab0RBJexdTyJl2QFs/osCM3yp02nTEUV/EiKbXcuWu
 4fvJ3xRtopQ49DMQtsTS3xB0vaPgPeBYb6DeJsLpR6be31mvEmhHGPEuVlxXNsXig1JNS0S+U0NhH
 R1fKNc1uwHE2eTFhFKHK+BhyzJGBWU3reEGjm9BygE9G591bz3+UASdqeT7FY7MGq55NqUVHTlW9R
 +L+IYXzlKvtcF8xDaZLo5MGD/2WTjdbMm25cMc+Nj4MpElAKdvjneViv8NIfyBnXcXi4zU89mh377
 2+rcJTO/Hy87NN1G2LEOKr9zFgvm+CLeoGi2Ay8NyrB3q5+ptE3ziYIPJmq84qFw1SUy4Nq+VF4yc
 OqpPZn7Ij1ga5IAOHNRi5MbyRFROYOeaOj7sz7S7roHQwdP3Q1qTwTOv30hlOSe6uz4PTBiEIKBQH
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-2NK5bUW+FrZtiFsMX2z+"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 13:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229069


--=-2NK5bUW+FrZtiFsMX2z+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2025-12-24 at 14:16 +0000, Vyacheslav Yurkov via
lists.openembedded.org wrote:
> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>=20
> The test orignally was written under assumption that poky distro is
> used. When poky-altcft is used for example, then systemd is already set
> in DISTRO_FETURES, which the test did not expect.

The commit title says this is about determinism, but it's actually about
supporting init systems other than systemd in the test case. I also
think "selftest" should come before the component name, so perhaps it
should be:

  selftest: overlayfs: Support non-systemd init systems

>=20
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/overlayfs.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/se=
lftest/cases/overlayfs.py
> index 580fbdcb9c..3e55e97927 100644
> --- a/meta/lib/oeqa/selftest/cases/overlayfs.py
> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
> @@ -5,7 +5,7 @@
>  #
> =20
>  from oeqa.selftest.case import OESelftestTestCase
> -from oeqa.utils.commands import bitbake, runqemu, get_bb_vars
> +from oeqa.utils.commands import bitbake, runqemu, get_bb_vars, get_bb_va=
r
>  from oeqa.core.decorator import OETestTag
>  from oeqa.core.decorator.data import skipIfNotMachine
> =20
> @@ -46,7 +46,8 @@ inherit overlayfs
>          res =3D bitbake('core-image-minimal', ignore_status=3DTrue)
>          line =3D getline(res, "overlayfs-user was skipped: missing requi=
red distro features")
>          self.assertTrue("overlayfs" in res.output, msg=3Dres.output)
> -        self.assertTrue("systemd" in res.output, msg=3Dres.output)
> +        if not "systemd" in get_bb_var('DISTRO_FEATURES'):
> +            self.assertTrue("systemd" in res.output, msg=3Dres.output)

The inverse logic here confused a few people on the patch review call.
Could we add a comment at the same time, something like:

  # If systemd is not enabled, we should see it listed as a missing
  # distro feature

That is just re-stating what the code does, but I think it's worthwhile
here to avoid confusion.

Best regards,

--=20
Paul Barker


--=-2NK5bUW+FrZtiFsMX2z+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaV+yKhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bly2AQCMCGPEL3lVqR/fjKiJi1pg6xjt5IT984V0
6/NhDq3lQgEAnzzgUCFWchA88em+QWaNRKrW3rO1Hu1Oj36WE9HQTQU=
=XKFs
-----END PGP SIGNATURE-----

--=-2NK5bUW+FrZtiFsMX2z+--

