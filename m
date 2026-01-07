Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40323CFD64F
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 15:08:26 +0000 (UTC)
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7924.1767798498143391382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 07:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=eoclhKUB;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=tvFgE0dc;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 40218140017E;
	Wed,  7 Jan 2026 10:08:17 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 07 Jan 2026 10:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1767798497; x=1767884897; bh=n0U7okeVqI
	ow+pczg2c3SdMxCHZnlcDBC3C5oFQKQfE=; b=eoclhKUBS8tW/4ogKmg/MlVEZw
	4adCuQ6Ow3WpZEXgxLuTXes7uwMxxttxSP3T0HRg7fIgZiPIn8ddqHUnpmDZrmAN
	imf2uW9Q2L+SeXtVDtzR0Ln5oyw137ENevJJSNTS5chdVcUakKniEx/YHatPHjbq
	ZFGr5pH8C03PZy8qxvjqBhmKANBJr5EY2+m3gFyRKeIJ718P6PApUx0of4rGT19K
	NI4dER2OggxgMMkaUlgl66GT5BoZhVCrc7dXUScJpluiG325+7m8hp6Be6T1bfU7
	i5MNKeGs+NmzCAlgJPgloXR2qLvKWJueWNlQS5z4owLT1Sn53BxqwZH70EqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767798497; x=1767884897; bh=n0U7okeVqIow+pczg2c3SdMxCHZnlcDBC3C
	5oFQKQfE=; b=tvFgE0dcclpbfhsKp6FyqdjLNe/QsELaLIvKZVeW/5DM2xPvftt
	uVvDKZVQcoB00OsCC05wr/UG4+DSuVnyWxIm9Hu892rR74Ad1zgpNp5RqOGJ+4VB
	fpjHer5NM4Sdej67xrVFElxiPct+2zJB21J9S2n8GLxnJje3wOBMrTeqR6LjVJ7X
	3z5Ke5+fXpDlCT7gWIjDQqAnTTvOfS/Qt0VTL6CB7DVpMLP9v9ogVuvBbUaF8NR+
	LugDFUCt0heTzYhcwp+BAoZm2WIlbNiAK6O7tNKP26VaTcgF7VTMP0jEpFoqW6AR
	0LwHOklZZLtHEuWpBkTVVLHqyVBqM8KS1eg==
X-ME-Sender: <xms:4XZead37T6z0XswUc2gkfd9FQFRIWYaIIIWOp-ZHg0DyihYYSpAHfg>
    <xme:4XZeabjC5MHqssuyy6gsG5a0OTgikFPnh3q75VB5fUzuFmsm0Z_WlmOOnHkwiMVKz
    nzDWIEqEQd1xO0-N57_qDqMXYLwqVNCO2E9rdbxSAFVafa6bRVL-w>
X-ME-Received: <xmr:4XZeabRAdlt-WnYZK-RljXURMKzEQJAqgpH4YbEPnnCXfFQ2Uv8aHuxwfGa8ZAs3iC1C3JI9p93yN-zi_o7lOrQkerR0vhRZDdV2r64>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeffeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    etfedvveeiieetieeufedvjeeukefhkeeiteefjeevledujeejvedujeelleejleenucff
    ohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtth
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhr
    tghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhioh
    hnrdhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishht
    shdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:4XZeaUjINdZ27eFADRVSkbI3635knth5rg5AD4ULM3zW8o7WhBYQqw>
    <xmx:4XZeaT5ymAOqmG9X0PagPT3H4GAZpmAypw-caoMGGCVX0VOZ8G3fLg>
    <xmx:4XZeaZDZRZ6HjXR6O_pNntBK7P9JoX4hLw2htkWBv9qFplaEuBfilg>
    <xmx:4XZeaSYMyAPNX4JY1Qkm0OAFLe3K1G7j7NBT-M783MKDL0MKNMEn6A>
    <xmx:4XZeaQUezltwTrq7p5vMjona-c3SnsYYyPvpYGMTsTUSOV2mRPmv7hKf>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jan 2026 10:08:16 -0500 (EST)
Message-ID: <162117d6da11d9a209e93ebe29ef945f6fd19e8b.camel@pbarker.dev>
Subject: Re: [OE-core] New functions added in upcoming glibc 2.43
From: Paul Barker <paul@pbarker.dev>
To: raj.khem@gmail.com, Richard Purdie <richard.purdie@linuxfoundation.org>,
  Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Date: Wed, 07 Jan 2026 15:08:13 +0000
In-Reply-To: <CAMKF1sqse8G+-YQhAZc1ahUiQrfaqqVG70id=xxcqDcHmRmajw@mail.gmail.com>
References: 
	<CAMKF1sqse8G+-YQhAZc1ahUiQrfaqqVG70id=xxcqDcHmRmajw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-JBbEArwh3qpVcY69hCBE"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 15:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229003


--=-JBbEArwh3qpVcY69hCBE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-01-05 at 23:45 -0800, Khem Raj via lists.openembedded.org
wrote:
> New functions in glibc 2.43
>=20
> memset_explicit,  memalignment, mseal, free_sized,
> free_aligned_sized, openat2, umaxabs.

Thanks for the heads up Khem! And thanks for filing the bug:
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16126

As discussed yesterday, we only need to consider openat2() here as the
rest don't interact with the filesystem.

Best regards,

--=20
Paul Barker


--=-JBbEArwh3qpVcY69hCBE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaV523REccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bpsPAQDbt1Ol+8Q+kUNRWU5GbmYe4CIk8wq7W7He
Y687jOq57gD+IfIHBqW3Zng7sAftzqguSamTHmWdU9RG9nOsXzEYMQ4=
=aHe6
-----END PGP SIGNATURE-----

--=-JBbEArwh3qpVcY69hCBE--

