Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E21BF89248
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 10:00:45 +0000 (UTC)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20553.1776765643200370806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 03:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=DUNjEKId;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=fqKd6MF3;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 35918140001B;
	Tue, 21 Apr 2026 06:00:42 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 21 Apr 2026 06:00:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776765642; x=1776852042; bh=xhsZZF4kvX
	NUcnu0Kkt1MiZpj3cyRo1TV6e2Hvb3uuA=; b=DUNjEKId70ZF8Gq9pHP/6ByYO8
	NDn42Y7twVFnSjQYxBumX8ftwfw0a+dW/f0Vl7QyhR4PB2NBhr5msVQwaZeCWQVo
	QZtkNISWwPEzISbANzKusoes7EKWck5RUgmrBP6e7ZFTloc0x+XOi1pBdCQVlEwS
	FPOQfVoj7oGbEGNr7+iofi25kjPrgaQMUEUF4w0578j9/vmeTSSYusmTCDVNzjlg
	L/NCO77Ukckw9TPE57BQa8QX3zaSh3pymYL1nM4RS1v+05C5+SMP5KJM4ocvapXY
	pqsWqY/vv8kG4vT6KD+aA0YcgXwYUtCMkd1xMtxciDaUPp4WpLJKz+VXRbVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776765642; x=1776852042; bh=xhsZZF4kvXNUcnu0Kkt1MiZpj3cyRo1TV6e
	2Hvb3uuA=; b=fqKd6MF3d2g8KzQsRUR1B8O+YpwWp8kpiXgF9hcTRHz0YO9+vjX
	6VoJqyhyD/wNnagS4fq2sjQJ31gxJfDsPqPBG7ZJSgQhu/xKt87WTqDwwDpu3FMP
	U5P1/Fyx0koVomEAxkDRY8eg0lRgPjnOYMkYH401YS176L4wM/ECZK8xTO+BnrMU
	unogBi57OO6CH318UkpqHUDIfRsfFZkBm3Cp4W5n+9VPUrEYYRIPRSrCZrULfdQC
	3/rMfxcOgJ7/SMNn8h9+Yt0Ub4Z3R9vWR0ATuE3wWx7cOqpucacBlVJU1G/uoEGJ
	ijP3QQpe3Ds7M8X7huGRbfxwHvYl7MksuLQ==
X-ME-Sender: <xms:yUrnaZhagRnV4o9tC29WuzkPrm4IgVOjzSsvNVrNDFX0yRUyC3thEw>
    <xme:yUrnaUDCK0D1SDy7SSbjitmnhypc0lLhcrRW_mUIheb2wuYh5rOQ5t5tc5JGH1GQF
    4y2TdtOw7CGf5ksCRccJmm32tMabWpQOvOJovmxjJzXQ1npOavlLg>
X-ME-Received: <xmr:yUrnaWsrcGpV6yu0lnvgMdhFilaoGArQ7EEqKgFx_kRvA4pmmZOdcBCtr5GZpL11xsvRnXzTPMcbPTbPijX7xEkiaYdcrNb07ioQz27G3owm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiuddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkuffhvfffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceurghr
    khgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnhephe
    fgueduvdduiedtleehveffvdfggeejkefgvefhgffhveejtdehleeiveejhfehnecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdhoph
    gvnhgvmhgsvgguuggvugdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpth
    htohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephihorghnnhdrtghonhhg
    rghlsehsmhhilhgvrdhfrhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorh
    gvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:yUrnaZbnQhFi11jyJq3vHw3dNHrWmJ9Y7QCkYSMQGU8RjlMj2DcArw>
    <xmx:yUrnaZXcm_FF_giEeTvIwGLmA7OHHKwJSDjwqVXb9t2urf2zrs1z1w>
    <xmx:yUrnad60fhTqFI7o84fSEDoM494fP1ZofSk8wNWv4dxQCa8UHak9-g>
    <xmx:yUrnaUgpr6y_QkeZcgP6pXlC7iz__tH2-LP3ZvfwQekPe_m4E2DN2w>
    <xmx:ykrnaeFGeqljaHbrAEAEXvhl8uohNi7g4v9FK4XeJh1-MT4dW00sg7Cy>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Apr 2026 06:00:41 -0400 (EDT)
Message-ID: <41c86ccd2bfb42dce32b3ef4d31183698450e232.camel@pbarker.dev>
Subject: Re: [OE-core][whinlatter 00/52] Pull request (cover letter only)
From: Paul Barker <paul@pbarker.dev>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2026 11:00:38 +0100
In-Reply-To: <cover.1776702292.git.yoann.congal@smile.fr>
References: <cover.1776702292.git.yoann.congal@smile.fr>
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
	protocol="application/pgp-signature"; boundary="=-LKn5GWaEFdz/132c4WLa"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 10:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235658


--=-LKn5GWaEFdz/132c4WLa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-04-20 at 18:26 +0200, Yoann Congal wrote:
> Those are the patches from the last patch review:
> https://lore.kernel.org/openembedded-core/DHVA7OKM4Z5B.8F1XG493U352@smile=
.fr/T/#t
> with added python3: Fix test under ptest-runner 2.5.1
>   https://lore.kernel.org/openembedded-core/20260417075943.1398549-1-yoan=
n.congal@smile.fr/T/#u
>=20
> Passed a-full on autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3678
> * qemuarm64-ptest failed with #16150 - AB-INT: oe-selftest-armhost: Faile=
d to start QEMU (hangs with drm)
>   https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/350=
3
>   * ... but was sucessfully retried as:
>     https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/3=
505
>=20
> The following changes since commit e8a3acb03d4c466cd08e358953df15746cb5aa=
ca:
>=20
>   vim: Fix CVE-2026-26269 (2026-04-02 00:08:06 +0200)
>=20
> are available in the Git repository at:
>=20
>   https://git.openembedded.org/openembedded-core-contrib stable/whinlatte=
r-next
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
whinlatter-next
>=20
> for you to fetch changes up to 4fbdd0fc15fe23f469454a063d1c966876a71426:
>=20
>   python3: Fix test under ptest-runner 2.5.1 (2026-04-17 01:43:10 +0200)

Merged, thanks!

--=20
Paul Barker


--=-LKn5GWaEFdz/132c4WLa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaedKxhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bkCgAQCZUd/LFWqxxjSUujkIGmvS8fioWz2lwCa8
AGiYxOXfhQEAxrPpvnY+JiG4PM9GZRvgkNLiFYUJ4YrEsL3eF5hBBws=
=itQX
-----END PGP SIGNATURE-----

--=-LKn5GWaEFdz/132c4WLa--

