Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8E2FD377B
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 17:44:34 +0000 (UTC)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51285.1772041469508158632
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 09:44:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=MfqVlOhs;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=vCDKtWSs;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id A47561D00137;
	Wed, 25 Feb 2026 12:44:28 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 25 Feb 2026 12:44:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1772041468; x=1772127868; bh=2zkh3fl/suJqGuNxKfHBmnKBJ8xgH4na
	JWqBrTyOqnI=; b=MfqVlOhs2lw96o2yeC/j37M0dfFnxlaZPqr9tjIVNvESw3I2
	W+sbC1sCKGLP0M8NQulbkSWPQt/TCyvlcuPhXp1dRvbsDf4f04jDN2Esyr8tzPYU
	DESiKpwFgvQmQRSkM4aexbzhdXZQI24qXyE4az+IDrtwePa1Yy53Ff8/StiLGzOF
	JBYuRtphOSjYa0T/uYfVNDqRTPrDxqAKkV8+AS1U7bisPYFR5faO+9clMmMTAqIN
	Zb+vVndjCk6XOM1Owtj13pmRSmBFawcl34nT6BjrrYbDe+K5cN5t2wpelWgwwbK2
	QkTlIOz9WJnRAsdaZyZzd3DMl6N8sAobfuFHog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772041468; x=
	1772127868; bh=2zkh3fl/suJqGuNxKfHBmnKBJ8xgH4naJWqBrTyOqnI=; b=v
	CDKtWSsMN/DJYPHYN0dP8xu/ahwZ9kKjpBOIwGslV7DMGBM/6hOq8obeQW9vQEgE
	rjlcCEE88tSQLSRGCEGgCK/1ZPMBxKJwCTJL0GDi4QhaMEU+UH/nbTl12IgzOGsr
	4cVYBrR8oHGw+gOlB+TYr0GrckvH1dgZfXRLMWqVPKI0GrUeLWb9GYoO6m8pMdC0
	arvEwGeiZf5P3t+zd2FX+tmp1D6g9BI9TGOz+XhFcPH7chrWbUMAE5JeWSLRX2Hy
	UaNvG3KIyPdKoElMy2G2wW0dHEZ3h9cvQGfbnwx0TZmi/o6FXTZb4JZymkwj12NZ
	amn1NaT/KE/YrnAKp2DfA==
X-ME-Sender: <xms:-zSfaTHsL5vZTjU_4550ZxUF8nvyLGJqmmGtfMaKjegj07XK8-mgIg>
    <xme:-zSfaYEakkUnJd2VUR3M5ck52IOb82SLEjzoqAKASoGLTFNI8rkRKw-2w3Nd31UN7
    ZHEuzff_jrt0yMGyVoE08qzOWndt2Dovb8iEA3XlM5KmcmQRVRG5A>
X-ME-Received: <xmr:-zSfaYOqUpoWyxoLruMtyDf4bJpJMk_wlf-cRJws4zvs7h8U9cmnUnQUM6EZQstL2dzUqj65dpdIzHDwvNUMCfCnLuRx9_B12R8IyMVrRn0q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeefjeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvffgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegrrhhk
    vghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpefgud
    etgfelgeehffffleejhfdvueetueelhefhgeeludehveevvdffgedtleeuvdenucffohhm
    rghinhepuggvsghirghnrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphht
    thhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeihohgrnhhnrdgtohhngh
    grlhesshhmihhlvgdrfhhrpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhr
    vgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepohhpvg
    hnvghmsggvugguvgguqdgrrhgthhhithgvtghtuhhrvgeslhhishhtshdrohhpvghnvghm
    sggvugguvggurdhorhhg
X-ME-Proxy: <xmx:-zSfafHMuc_ygexb9vWoiPL3aGtj4ePDPd5CvhqHFMrCpH4Ex_jajQ>
    <xmx:-zSfaXPSO7pCn81Vs4chu9mtu3tNtBsf5IbMZlYWWQTvsID35g9pkg>
    <xmx:-zSfaY-tvimmSQ4bR7iLPH213j2df6qbJKLIYMCxYa2kdPzHg07vpw>
    <xmx:-zSfabRt3IUiefJGh1CPB7Jev5UnbXWfU_TO6830JMavGPdMUNHSMg>
    <xmx:_DSfaS-EcFbzcfmdPiXd5EaBgCYKkrfdMVgfPdY9y6MEyP-fQGtxI8u->
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Feb 2026 12:44:26 -0500 (EST)
Message-ID: <1e6175f982bbd141fcc156113aa6e798a3120bdc.camel@pbarker.dev>
Subject: Recipes which should always be upgraded on stable branches
From: Paul Barker <paul@pbarker.dev>
To: Yoann Congal <yoann.congal@smile.fr>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, 
 "openembedded-architecture@lists.openembedded.org"
	 <openembedded-architecture@lists.openembedded.org>
Date: Wed, 25 Feb 2026 17:44:23 +0000
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
	protocol="application/pgp-signature"; boundary="=-lDfBpTDT0gCF4AKZN992"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 17:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231972


--=-lDfBpTDT0gCF4AKZN992
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I've been briefly discussing stable branch update policy with Yoann.
There's a few recipes in openembedded-core which I would like to propose
that we always update to the latest version on LTS and stable branches.
These are recipes typically providing data that is expected to change
over time, with little or no code.

You could say ca-certificates is already covered by the fact that
security fixes are acceptable for example, but a clearer policy would be
better.

Any policy change will go to the TSC for approval, the goal here is to
get some review and input so that a concrete proposal can be put
forward.

The recipes that come to my mind are:

- ca-certificates: To allow access to HTTPS resources we need to keep
  these up-to-date.

    - Keeping this up-to-date is common practice in other distros.

- tzdata: To stay up to date with timezone or daylight savings changes.

    - Debian takes upgrades to this on stable branches
      (see https://tracker.debian.org/pkg/tzdata).

- mobile-broadband-provider-info: To stay up to date with provider
  changes.

    - The README file for this project says "The Package contains only
      informational files so it's safe for distributions to grab updates
      even during feature freeze and maintenance stages."

What opinions do other folks have?

Are there any other recipes we should include in this list?

Best regards,

--=20
Paul Barker


--=-lDfBpTDT0gCF4AKZN992
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaZ809xEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bt1wAQCI31zqjXxMG2GAVpmO2xQR5I5KUyjkBzeC
ppLnjsQzFQD+MuZp44MsiH0HMQH1SfT2D/htFrX6MJJ7pVbMN5JoGgU=
=PFYN
-----END PGP SIGNATURE-----

--=-lDfBpTDT0gCF4AKZN992--

