Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058B5E7E0CA
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 10:58:48 +0000 (UTC)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45025.1770634720608142784
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 02:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=iCkSZZnS;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=GCMNMwCa;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EA1357A0036;
	Mon,  9 Feb 2026 05:58:39 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 09 Feb 2026 05:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1770634719; x=1770721119; bh=cbskJZJuTu
	YfbbuOjH1LVRAQ5pM0ncrzpj019mdT0kA=; b=iCkSZZnSiOnG0WZTfY8fl6FHwa
	S/jUIBrLx+Qx7Y7jtdJchRhWeuEPxMcjTemb7978JZ0eOaoSpqcwbb66CxiWH82H
	vKCfs73Dqi4vp/OGyL8jOUNdnqJ93T55ltawQaaqki9aNvqmZLZKOTawqGPnqbd7
	QzjAmeCTZbou3q8TURQrwR5rmfCk+h2HZGbXrpuQfHRcUcYOTejFYRvpwwp5u5Ta
	cSh3W3RWDWn3PKZLPC4YEUMozRt7TGFCAjnVFnoU30hps7S8VLqAKRoDOuwddIck
	GCYU9ez+i96ySLGXrnRvSQRtdLa+CQSxs1xalXJ4UekCRTCvUI8KPMXuOLlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770634719; x=1770721119; bh=cbskJZJuTuYfbbuOjH1LVRAQ5pM0ncrzpj0
	19mdT0kA=; b=GCMNMwCaJSWoV+W0fntHOnNalKg3mmZNMlg7+DlZAAwOhQxL/SM
	J8QxsVwkR4xc+U4dwfyyr+bL9Fp8LIQKuxtJvPz3T7FvpUmXqAwcFD8TgHA8zq+y
	2IcvDWJZHjEuhqBbgsyVBG+rWX1at5nhU4Joi+SbVBgetnGFaQSppHed8vwluFyl
	Gn6pNT9GjLby/dX5aSXkSJZSvWVcFsnuGshxMZ1m9ozWZw28W5+XEF0TULPJYUef
	zvw668JlQ9y+WmzzbnC5D0h74bSUrEz7RJxOD7sIHdC+abIq3ZcXQUQigyNvzoft
	62pDa109dWjWjLqvw1R7T//YfZBp1Nkyi9A==
X-ME-Sender: <xms:372Jae4JdLV0hXBRwRNVddQ_shXuB8FrD8XGRG-R6igNGkbntoGVUQ>
    <xme:372Jad6tT-f-UTcvjDH3Id-uGB2Xx2nF-g_yZ2a1VZrfjSDYct-jE9DYGUzDrX9MV
    EHBlzqWmVeKs87Qt0e0UfsOmrxt-rSZkqTcngDkuJQ06ZdiBXLPn5A>
X-ME-Received: <xmr:372JabFxExR9QlhtWr_IbyOxGyeTP2AwiK6ljVQkjqM8-dZIgH5mfI00xV5nqcQDEGGLeI34AZK9KKJhA-_gJB6Cpdb6f5cbs7L5_cC3zdwr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleeiieefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlqdegmdenucfjughrpefkuffhvf
    ffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehp
    rghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnhephfejvdeiieelie
    ehheegheejudetffehhfejhfejjedtueetudelgfduhfeugfejnecuffhomhgrihhnpeho
    phgvnhgvmhgsvgguuggvugdrohhrghdpnhhishhtrdhgohhvnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdgu
    vghvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    ihohgrnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhrpdhrtghpthhtohepohhpvghnvghm
    sggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:372JaWS3cnlUDXVkngL6hAsVqCHzo3hMynZU1YXukZMM0bYLqi7Asg>
    <xmx:372JaUtrkngpFUszhOAtC6jHBRKGAcbwc5YPNpu7StPV7tB1ikCNXw>
    <xmx:372JaVz8eHPmlyPhIOOiFZ6ngHjieiq9lnFxA7DXJm7FF_RvyZS1fQ>
    <xmx:372Jae7NoiXi9K60L3ndHIXb4H3CUtdorD1liH4UIa34940Rd_kBjQ>
    <xmx:372JaXcCJ8d6dWl9458-nMbz-hnfvzEi-27nJnOMJwxDoQH9sog1viRS>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Feb 2026 05:58:38 -0500 (EST)
Message-ID: <18f85f4429057b6d39eb7f9d80d41e63d69e40e7.camel@pbarker.dev>
Subject: Re: [OE-core][scarthgap 21/25] improve_kernel_cve_report: add
 script for postprocesing of kernel CVE data
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Date: Mon, 09 Feb 2026 10:58:35 +0000
In-Reply-To: <1adc13b185d18abd926ceab4fc893374b35f9adf.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
	 <1adc13b185d18abd926ceab4fc893374b35f9adf.1770626074.git.yoann.congal@smile.fr>
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
	protocol="application/pgp-signature"; boundary="=-AOOu+7F/7fzO1jWERKxg"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 10:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230782


--=-AOOu+7F/7fzO1jWERKxg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-02-09 at 10:29 +0100, Yoann Congal via
lists.openembedded.org wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>=20
> Adding postprocessing script to process data from linux CNA that includes=
 more accurate metadata and it is updated directly by the source.
>=20
> Example of enhanced CVE from a report from cve-check:
>=20
> {
>   "id": "CVE-2024-26710",
>   "status": "Ignored",
>   "link": "https://nvd.nist.gov/vuln/detail/CVE-2024-26710",
>   "summary": "In the Linux kernel, the following vulnerability [...]",
>   "scorev2": "0.0",
>   "scorev3": "5.5",
>   "scorev4": "0.0",
>   "modified": "2025-03-17T15:36:11.620",
>   "vector": "LOCAL",
>   "vectorString": "CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H",
>   "detail": "not-applicable-config",
>   "description": "Source code not compiled by config. ['arch/powerpc/incl=
ude/asm/thread_info.h']"
> },
>=20
> And same from a report generated with vex:
> {
>   "id": "CVE-2024-26710",
>   "status": "Ignored",
>   "link": "https://nvd.nist.gov/vuln/detail/CVE-2024-26710",
>   "detail": "not-applicable-config",
>   "description": "Source code not compiled by config. ['arch/powerpc/incl=
ude/asm/thread_info.h']"
> },
>=20
> For unpatched CVEs, provide more context in the description:
> Tested with 6.12.22 kernel
> {
>   "id": "CVE-2025-39728",
>   "status": "Unpatched",
>   "link": "https://nvd.nist.gov/vuln/detail/CVE-2025-39728",
>   "summary": "In the Linux kernel, the following vulnerability has been [=
...],
>   "scorev2": "0.0",
>   "scorev3": "0.0",
>   "scorev4": "0.0",
>   "modified": "2025-04-21T14:23:45.950",
>   "vector": "UNKNOWN",
>   "vectorString": "UNKNOWN",
>   "detail": "version-in-range",
>   "description": "Needs backporting (fixed from 6.12.23)"
> },
>=20
> CC: Peter Marko <peter.marko@siemens.com>
> CC: Marta Rybczynska <rybczynska@gmail.com>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit e60b1759c1aea5b8f5317e46608f0a3e782ecf57)
> Signed-off-by: Suresh H A <suresh.ha@bmwtechworks.in>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>

This looks like a backport of a new feature, if we're making an
exception to allow this to be backported then we should document the
reason why (apologies if this is somewhere on the list and I've missed
it).

If we do take this, we should also consider the other changes made to
this script since it was added to master.

Best regards,

--=20
Paul Barker


--=-AOOu+7F/7fzO1jWERKxg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaYm92xEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bhRJAQDa4yPSd8talAYBnAh5PivDZeuPitpzA0VD
fEbYjy2PlQEAsZ7xq+18q1//hPsSy30oN2N0t+Ab9dg7bVl0WE1PEQs=
=eRAD
-----END PGP SIGNATURE-----

--=-AOOu+7F/7fzO1jWERKxg--

