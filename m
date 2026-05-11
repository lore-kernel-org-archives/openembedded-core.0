Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAD2CD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:45:19 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47556.1778496315205865635
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 03:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=KT1m6J/g;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=mA0j5MLo;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A19857A00E9;
	Mon, 11 May 2026 06:45:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 11 May 2026 06:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1778496314; x=1778582714; bh=nYhaLBX8P2
	yy0U09CgBpyHYI4WMUG22G36l2B5GO/f8=; b=KT1m6J/g4/bmBu+6Ua1Rru+2k4
	eRqiN3FacS+34E6u198qot40gk8ovw+QyXTehxHTa5/k33oqSw1x/cNSQyKZ9sfz
	/na6x4uyvdnCa3u9f/43bNSxHmI2zZBif28enBc5MStJdJmlZhdhFkazf7ezmbla
	9dZeaMH+hJTUeFYHhyWuizSxv4l5FTGbl1c1Qu8j6wIqBZoGVNlPBOreI2kchCuj
	5KG2valATw321fqprmmnNla9B71rlmiRP+w0MHmrc67dAuCtQNH8H3JydLw5AJaR
	gGjflUL/MJji6KPATzbr0i3rg9SVsJeHBQMRIDas1Nu0ACy9+24yK0DYPoeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778496314; x=1778582714; bh=nYhaLBX8P2yy0U09CgBpyHYI4WMUG22G36l
	2B5GO/f8=; b=mA0j5MLoz41pQsCnO2GxTZ+0hGwKrxuG7dNeNQWzt7XvHQkzkJc
	sx5xzHdNipujli+bkB0uCR02w3HdDqg6ol1E65RELQIBAhPl96Zh9MKywBnrSGQo
	HiSJVsCfSUOGuOSRVfZswUtYcZ8Luli33Uu8kYfm0qzoVLwKNm4q6V8Hrw/Wevs+
	zXHI3esaMMLeNrP1J+pFAdxlyHrbAdweWy/RCMhxhoN6Hp9E9CWQH2Eg0mpPfkN6
	tWiw/OCoCs9x/xwwdDkb2N/jJS7X280g+EQF44MgGcogwqr54dD/3f254lr+hdKi
	llq4yyyq1TGf6S25Yd1FCobP57CK4AiYCHQ==
X-ME-Sender: <xms:OrMBaicpmo_eL4MNEw5kKwWM17r00AEte054NqSV2X3onA2DRAUbQg>
    <xme:OrMBaj8TW1CI9GJWCKC05zcN5f82T5fDB6gDWqJrSYYUJT8RFweuMkGvjYzWtaZLz
    pARP3piqCNVoB8LGlWvo6Ey82LRaxU7t3Z8RNtZsIScGZCb9269PM7e>
X-ME-Received: <xmr:OrMBamlHh9QoBoUoW-9JlsA7IFglRoHHjhDu5zfQ0bBsKudbLkFOSLtq8p5Z_gOjW6cb3B-qOQR1CylbqzDfSAgmcTsZ7i1fVy-ziOI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudekjeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfevffgjfhgtfgggsehgtderre
    dtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghr
    rdguvghvqeenucggtffrrghtthgvrhhnpeefffdvfeegveekudfhteeuhefhieekvdeiue
    efveeiffeukedtledutdfggeevheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpth
    htohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhitghothhimhhosehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslh
    hishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepohhpvghnvghm
    sggvugguvgguqdgrrhgthhhithgvtghtuhhrvgeslhhishhtshdrohhpvghnvghmsggvug
    guvggurdhorhhg
X-ME-Proxy: <xmx:OrMBat8-H_W5Td17fo-mUMassreCsQVWraAOfWKF_vt5pnzqqqWG8w>
    <xmx:OrMBaskoMTabRTadAoKyvhy1tRo3X0E9h5zGMfWYr3XWYMSq1t4KPA>
    <xmx:OrMBai20DYjept-RfI4vGWp9hmjMoQEsg3LaLoNdwaqvJc5Dra9VxA>
    <xmx:OrMBavoyHMv9PDhOuPebmyonr0FUmWVg1ZFo7ZLbcElhlcfmYDU10g>
    <xmx:OrMBapJv1t1HBYGdmqUaSRxjjdfdzES4FQyouC-ejzeGehIwDc9jOniD>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 May 2026 06:45:13 -0400 (EDT)
Message-ID: <51a71e4b0f5eeae36cdc2e7a4700e9d13d774af7.camel@pbarker.dev>
Subject: Re: [Openembedded-architecture] What to do with vim in
 openembedded-core?
From: Paul Barker <paul@pbarker.dev>
To: Tim Orling <ticotimo@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, 
 "openembedded-architecture@lists.openembedded.org"
	 <openembedded-architecture@lists.openembedded.org>
Date: Mon, 11 May 2026 11:45:10 +0100
In-Reply-To: <CANx9H-AbMu_n-0ww2UsV117jT20wjWP_i-HiMq4DHAh4NdYN9Q@mail.gmail.com>
References: <5622df201a632dfc83c5193f029745b3ebd97e44.camel@pbarker.dev>
	 <CANx9H-AbMu_n-0ww2UsV117jT20wjWP_i-HiMq4DHAh4NdYN9Q@mail.gmail.com>
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
 EFCwkIBwIGFQoJCAsCBBYCAwECHgECF4ACGQEWIQSYsqrBAKw/grtdVGd0l1yBt+ZrrAUCaWoNAgU
 JCxiQFgAKCRB0l1yBt+ZrrLhdD/sH+qTaxCDUg47eW329yJWCDZmO+iuYzNSyHMs1x0DHKNIQQ8zN
 pA2S/de4jElQuPHjw/IS8B3VmM62Wuq5vHuxNlFv9IMwrwqi6zhCDui8+nCN/AQGGXousJI/SeZjm
 Y5gS9cqh4vNY+huqEEfdTFXIfTBRkmnvYozSO2uDB3EMuiWgBlw2uLrtmkvPLn/m/GvEouLNox6wv
 tcJcIbL59a0+3jv/m7pnWoZXOkWmKQnfFWikqjuKCISNU0gzBSL4UOj8gtQ2z+vu7ffi29b6SV5IL
 m1yzdbkigEn4HL44lz3N+oHZ3wWsRqqeyGSX5fCfx3tGWg6scZQrpsjT5yq+LiffiXVNpjeJ9KzQw
 0cbAZ/9uhk1sWBroP+/gMhsWjlbFYXVlRvkNKGPI22eZtOEz4jF6OrOONyOoY3i26niJUyIgdBpca
 H0hKUSVQ8VnG7qVTNrQk9BbeoSszqRwViN7lfyVtK9b1TCFuGewOETGn0TPvSzruYCtD3CLm7mjuX
 AMBpIGoRUiCFVmF1hlOgqDyH4F6zRTHhKLpfmNzfQcg+Uo147Q2IHpoh0mJsL4FEZEI8hFyecX1Pq
 7HqnvxGD2OhCof1Z6LDxptX0wbgocnYFNxN5S1owcXZUQOFnzYLlLugrcEjlGCm4Gn7k4SiFERSBj
 UFsQgIhw/7lVVn4o4rQjUGF1bCBCYXJrZXIgPHBhdWxAcGF1bGJhcmtlci5tZS51az6JAlQEEwEIA
 D4CGwEFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSYsqrBAKw/grtdVGd0l1yBt+ZrrAUCaWoNAw
 UJCxiQFgAKCRB0l1yBt+ZrrHy+EADNMt+ewz8H7BUKpEMMhpaA1VxyXO5IqlKXS0gElMgHYXl7L7C
 0/qLfRH96vwVD33zM+f0Vl9aWWkom/k8s42tLyPvX7D5zTrj3r5muJ+d9dXWGwBFXxXlE9YjSP26K
 bYfRusmRHbbEPlLPSnrr9KYS2FGVD6ViRNhhVguflgPv2i18+fNBE3YyByfNCiQgO/SgaSdh172Ql
 tuYE1Chk6FD45tCUv3dI9lO2PlVwrciiVYvIv/jiTDEwZOISOClTE/Ha18pxDJfLhS8QQnLWuBNX6
 HUkLi78fVmVYbcWIkTuSHjfNoGTMaFijMg9Wl6poFrY++Pl0S40681zEIrwZhW5pKoqXoaElt29Yf
 OwVo6BIsSOLEqKiWsdP7PJTaJYU1ovnshBcOmuXMgc13AjQ4AhEGqI1TaEJ/E1jEDDyTQFeWgrfew
 YaWdqpgiDmRMTj/tIGVj9iy7qZQICUUtlfm0QK6w6M7qq0GdO2o+S3uVF6y2AxQo8l9LSHiW9O35I
 juR37zeqv72puYyOteVYJsJaw999HUmhXc/X/J9FQFw8twxPKDLLu+w8MqDo9bhllzR93Zy/OShuG
 yGybcX3DKO2R+AQ90tXLbxKmHLtrnG/zyDPhLv/LGD480v5hEoT+IS0u9wPD2vP5q36a5DtzqXA/7
 t9PCamLoCvZLleg7GY7QbUGF1bCBCYXJrZXIgPHBhdWxAcGJya3IudWs+iQJeBDABCgBIFiEEmLKq
 wQCsP4K7XVRndJdcgbfma6wFAmlqDRwqHSBwYnJrci51ayBkb21haW4gd2lsbCBiZSBhbGxvd2VkI
 HRvIGxhcHNlAAoJEHSXXIG35muspk0P/1G08N6zGSdw2p8+8f/1HhaYEb9KdQHT1JmQfZUrIHIpD2
 ELNb91Z6Pz197d/igGpox1dzYOwE0WolWo44ZHX2yw+p9V+HJAUKRe0SPc1iNLkTzaAZ7oYJ1DnFh
 aaqZi4VtKKabKeorJjcDvl2apMwT0agRuDklU97n++ZUuXIEo1Z9uRqEvXz0iTSY7wPxwfoVOQsgf
 dN1cBLd9OpoOtJRdDJzQUYqjNoQi+5M6KRfBxPLZkmYb4uCGlp1H4AV50eC61j84LBg1ItvU2u+Fx
 X2JB7lHTswubprD2ZsSwp1VziU6pUj3vtslMWKpBGslpLtnaO561dihGyElayMd4VFg7VR/TsglJv
 A10EDs2DMhoYPfRQWvwlr5+jPP6s9H8KSTCGFvQt438rP/gk0lcEZUJK0iE2/yq5gQfaCNI5FLN7C
 q8LVr00oS4doXfmFFxMq6z1rs5SXZorWssjG7v5DILnPxLqYloQK/ebM5Ixbzm0Lq/8vWL7sw7yOH
 JVYCHCApGzKNii6rYyHdi0K8UwvpD++GCWLyvbgP/H3l5FqL63gAN0Rw1CO5r22+SmG7aOmekJH3N
 ChZPI3NMLnKZPJC8ZQZ4S8yb5oA3rqTA2DMODvsrEVlaB2cQ6IWHSa/mvBwA8Ias3771cp4fZS7W7
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-A6sdvRWblRrsb9F9+mP6"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 10:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236806


--=-A6sdvRWblRrsb9F9+mP6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-05-08 at 08:02 -0700, Tim Orling wrote:
> I understand the pain points you mention, as I have tried to help maintai=
n
> vim in oe-core.
>=20
> However, I have a LIFETIME of muscle memory using vim and for me personal=
ly
> forcing me to use nano is a non starter.
> So then I would be constantly needing to pull it in from wherever else it
> gets moved.

My general feeling on editors is "Give me vim or give me death!".

But it is really a pain, especially on stable branches. Perhaps we need
a separate layer for perpetually unstable recipes, which will accept
version bumps instead of CVE backports on stable branches.

Best regards,

--=20
Paul Barker


--=-A6sdvRWblRrsb9F9+mP6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCagGzNhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bn2LAQC4WB9U96vK65BE1gI550WKYT9BF8uTi+Io
dc1LArrqgAD8DYWfhoK7IydKKqHU7HDgtj+Vmqcw4dqiqW+jugEsMgA=
=70BY
-----END PGP SIGNATURE-----

--=-A6sdvRWblRrsb9F9+mP6--

