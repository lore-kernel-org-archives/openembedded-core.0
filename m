Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2C0CF6AB9
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 09:52:11 +0000 (UTC)
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3287.1767865925913927514
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 01:52:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=Dl6ctepR;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=q4UqDuwf;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.149, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 12F531D00024;
	Thu,  8 Jan 2026 04:52:05 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 08 Jan 2026 04:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1767865924; x=1767952324; bh=P2IsftTC53
	tAXt+AtUs1+Yy9F1z51n6NFPNWQD5zp9Q=; b=Dl6ctepRcbqtn2O3kLgTeaJ4D2
	f2dskJtqhtyWTe39wr39WoY4FmBhIP+9M0l72Uqin36WAtE2vM86eTF8G0QGJJCo
	RmogjKSukqnYXEN5uM/MtETrtRPKoi4MuDb3NA+3BIAseeP4Xp7Omz1niEZ5l4L+
	4Qt23uTp5IKTxGrVTC3f3nsNg/82iNAG6o01QGpaZWYTART0uOJVM3YaVRHC1xxx
	+gElCS3MmgnVauRXzvUkMl5zhQjEQYF1BKd+hGolKrQP7mwNad0Foo/i0hKl1UFM
	T8ZMaFsCq6qkq63BHjVpWgqOK7PufAXhGThGvrdge3wlJF+3zxTA+eFNrQKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767865924; x=1767952324; bh=P2IsftTC53tAXt+AtUs1+Yy9F1z51n6NFPN
	WQD5zp9Q=; b=q4UqDuwfX+OcUdFESyN35Rr+b8zvylimrdEdRwVwyIOEixGWlgS
	6UjByzP2fXxbEYFJrmFFs5CEbaCw2atstiodTe9J/DsDFJiqEI+XRtaUQinSERgK
	Q30nVHHJ3mo5MBIuHlamzrbHktJw5K7SnFUPgIqkVGNQ0PBSKc3L5r4EeY4/0YXK
	1e84E/6OLPDbpbewV/uAHboDrDtex5moSIS3p3bO29fjc6tPwEb8XeuIQAwzSVih
	qRasz5ZRK5Di97OCNtZZwY8ARCfk0eSprxsVHXwdtN6GIrnMbYWoVWNl0aOolHHP
	7j3igrQI6vE1iwL78ihBc092LzWd/ie1A4g==
X-ME-Sender: <xms:RH5faUfeitX_H2f0kck7bHg7lpis0JQV1wzCxhfef-fU-k9cBv7lbg>
    <xme:RH5fadplGt37vAUyqYoLj61Z71cut7sJdLV3qxJF8VDvOLTbz-dZDW9ZFZpjYeOv3
    tD9CKFSPB7lt8A2gIMBOZJDWbl4xBgGRzr8doWqsMWGR5W0j_1l0vk>
X-ME-Received: <xmr:RH5faS5CNQE8MtzSCv4UsfGW_lwoXgrEVwuf2-cvQkrk-_qy8FRBe9M4u3J7hgxsGIEgkJzyDrobinyfiDl1AQgi--xeqSBflQgqZkMRZvU6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdehieefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfevffgjfhgtfgggsehgtderre
    dtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghr
    rdguvghvqeenucggtffrrghtthgvrhhnpefhkefhuefgleefleduleelhfektedvffeitd
    dtueeukefhieduiedvfeeuhedutdenucffohhmrghinhepohhpvghnvghmsggvugguvggu
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeefpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtg
    homhdprhgtphhtthhopehlihhuhigurdhfnhhsthesfhhujhhithhsuhdrtghomhdprhgt
    phhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmh
    gsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:RH5faToFVSzk2WKoMOvLKLgj6Sv3JavT8DN3Uk9OFAAJofvDECl3TQ>
    <xmx:RH5faUjRvsqFtSFW7sG6Vh5NoQB9N4PYIVGYSL9zS2Z81Z7P_2zoeQ>
    <xmx:RH5fadJMNyzJx39c7cy01hX35p1iThA-f5aQidpEbWFOX69GzIoMsA>
    <xmx:RH5faUBr-92PZci1fcO3UqfeI3eA5hQyIe3w3vdFc8gCtxVjGVJgQg>
    <xmx:RH5faVkTQ0rz1dWXn0RnTgoLH9pC9buA19h0BW5DJBzZ9NkwJjAi9lm6>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 04:52:03 -0500 (EST)
Message-ID: <1485ed48426d8d8c9995bab35925fab65591b176.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v2] python3-roman-numerals-py: upgrade 3.1.0 ->
 4.1.0
From: Paul Barker <paul@pbarker.dev>
To: alex.kanavin@gmail.com
Cc: liuyd.fnst@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Thu, 08 Jan 2026 09:52:00 +0000
In-Reply-To: <CANNYZj-=U+tTgqr58uDuj=vmC57Uj8d4WGvz7n5=8uYyOoUCVQ@mail.gmail.com>
References: <20260108014101.1974-1-liuyd.fnst@fujitsu.com>
	 <63ef01a65fa6fb80985291625e7dba560faa53e7.camel@pbarker.dev>
	 <CANNYZj-=U+tTgqr58uDuj=vmC57Uj8d4WGvz7n5=8uYyOoUCVQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-s+90DnoSoedvK9gyOGhs"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 09:52:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229052


--=-s+90DnoSoedvK9gyOGhs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-01-08 at 10:49 +0100, Alexander Kanavin via
lists.openembedded.org wrote:
> On Thu, 8 Jan 2026 at 10:46, Paul Barker via lists.openembedded.org
> <paul=3Dpbarker.dev@lists.openembedded.org> wrote:
> > As a side note, when we upgrade a recipe across multiple upstream
> > versions we should include the changelog entries in our commit message
> > for each version we skip across, especially if there's a major version
> > bump in there as it's often because of some backwards incompatibility.
>=20
> I'd clarify this a bit: either there's a complete changelog for each
> in-between version, or no changelog at all. It can be tedious to
> produce them, especially if there's a lot of recipes updates in a
> patchset, and it's not a strict requirement.

You're right, it can be tedious. We need to be careful in cases like
this where an upgrade from v3.1 to v4.1 skips over a v4.0 major version
with significant things in the release notes.

Best regards,

--=20
Paul Barker


--=-s+90DnoSoedvK9gyOGhs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaV9+QBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bvtKAQCJzgkYRzLJRhHE14BVbARmyrW9SD4sADFb
3TOnxOT/CQEA4GszH8uLhQKOO0ilVrZupeVkL9nGz7X7EfDC1Jfj4wI=
=sgt2
-----END PGP SIGNATURE-----

--=-s+90DnoSoedvK9gyOGhs--

