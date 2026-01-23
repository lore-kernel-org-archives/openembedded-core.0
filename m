Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62025D74EC5
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 13:06:18 +0000 (UTC)
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67034.1769173570266225766
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 05:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=KtgdLKfi;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=xWN/AiN7;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 7F7531D000BC;
	Fri, 23 Jan 2026 08:06:09 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 23 Jan 2026 08:06:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1769173569; x=1769259969; bh=WBOPCgafNs
	ivrsRrTANTY684pL29AqNctj4DiDwFPtY=; b=KtgdLKfiaeB5+H++44/2BLO9WR
	k5CWTV1MEj2Q4iUwGp8xA/QVJjMBwbjQIG9XXAUyBlMJb58CzIus5zgs5KdCnsuW
	O9aWGobydEgl+o8RuaV0p/wSlNQHBKmW1QVXns+0QZWWsxruUx9GJSKxG92jkwMe
	JisBYWsUg0QbuAXMOohzQo2zNMoaREZjN6Pl1pyGJ7wXdDYWcsdlqYVK5jntTR7d
	9UhPFiCvyHL2SiWfnAa2Cxw820If+x0N4HFh+zUJ1xmlF2vo9UtZn8pFk8jQxfBW
	XFLWUXFEG17CE2JHMxveQD7c2jpYD3zLYKYvA9i6/xPCzVyDVv2TPoPkJO4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1769173569; x=1769259969; bh=WBOPCgafNsivrsRrTANTY684pL29AqNctj4
	DiDwFPtY=; b=xWN/AiN7NrDFPAGm009zF2svg8J9rc02rhiOGxbrc2cNXSNWxlW
	iRE4JXFN0izvk82RDou2ldG7HiOoaapCucGV04LqSaLBTJ0Ak/uDNIal2WprGO3/
	y6sIHUx8Frm2RmOEqcS1kKjzzMvjGLWXwyAOwjILWjoqeFpjlZUTBGZIJ6cRBK4o
	IOIUjym1/cDmfzIWj/LAlG1ocjxMiEaTFNR1nEOtF03g2IlrV76ISro/YpoGuak4
	7sY+gW1BuI3oSL8ldrhJOtCqp7BNDOAqE+Mqpff+Uyj9ZXyzm8pIxFTR+ylRQZNi
	z9iBCTZjsAFY8ipYBdNuXO4K3gRAmMuvwRg==
X-ME-Sender: <xms:QXJzaaPuLcHnWHgy4xIzimddylxBj_iaqdCSExTI9rNBve0SDhhiqg>
    <xme:QXJzae-szLVj26kfDZ5_Gcxxd3xligPJRQO4cbCw7Ou1c_lLw5wDA42WVMuVfEOyX
    UOvNnjq0CwjYsjZmHoOps_ZvcKIeyu5O7AmteXD33XG3DIcBjBP5yU>
X-ME-Received: <xmr:QXJzae5RIS5iqsrnGoLYKhXEdffK5xbN8KMyDGdtT2-FQUz4AKHnLwIDrb351NK_c8BnKadKKS-eRht7u8hXRBJyMNHUtQI22t3t_B4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeludduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepudfhveeiuddvtefgveduffeiudejgfeihedute
    evgfdvveeigfetheeftddvuefhnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdpghhithhhuhgsrdgtohhmpdhurghpihdqghhrohhuphdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghr
    khgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepqhhirdgthhgvnhesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopeho
    phgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvug
    drohhrgh
X-ME-Proxy: <xmx:QXJzaV3_DacCoOmIa9mPPeAin41bRgflB9PAoroHMnsvgGVMJlItIg>
    <xmx:QXJzaVDG5a1K4YnF-i-xZiDQPmJIjsEkU7qGg4MRs-wWojzYn2x48g>
    <xmx:QXJzaX07WUq2Fo_HR49kBkzfJ46Pqa3ctZma3EIyOoHDk7rW0Ge0DA>
    <xmx:QXJzaftUQezAi2MSig6aPBCCeK6S-2lfLngAVtOFFi58A5-ZMr51KA>
    <xmx:QXJzafvt8k9J4VQXdO0ytkMEHefTVmlGNNbiXzmVUzYvcJ1M_uTp4DBq>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jan 2026 08:06:08 -0500 (EST)
Message-ID: <12dbcfbdc5d0cc4831e08c35abc8f1fe1456557a.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH 2/2] systemd: add shell-profile-dropins
 PACKAGECONFIG
From: Paul Barker <paul@pbarker.dev>
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Date: Fri, 23 Jan 2026 13:06:05 +0000
In-Reply-To: <20260115021918.1926514-2-Qi.Chen@windriver.com>
References: <20260115021918.1926514-1-Qi.Chen@windriver.com>
	 <20260115021918.1926514-2-Qi.Chen@windriver.com>
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
	protocol="application/pgp-signature"; boundary="=-nLe5bSS/Q/4M1KcIr0UK"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 13:06:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229887


--=-nLe5bSS/Q/4M1KcIr0UK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-01-15 at 10:19 +0800, Chen Qi via lists.openembedded.org
wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> New version of systemd introduces dropins in /etc/profile.d. This
> is usually OK for most cases. But in case of using minicom to connect
> to the machine, there will be unnecessary output every time you type
> a command.
>=20
> This is because the /etc/profile.d/80-systemd-osc-context.sh[1] is settin=
g
> PS0 with OSC 3008 standard[2]. If a terminal (e.g., minicom) cannot
> deal with this OSC 3008 standard, it will just output the whole contents.
> This is quite annoying.
>=20
> So add a new PACKAGECONFIG, shell-profile-dropins, to allow users a choic=
e
> to disable such behavior.
>=20
> [1] https://github.com/systemd/systemd/commit/dadbb34919abd3fefeb5b8ccc97=
94da9398a2503
> [2] https://uapi-group.org/specifications/specs/osc_context/
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

Qi,

There may be other files in profile.d as well as
80-systemd-osc-context.sh. In systemd 258.x, I also see
70-systemd-shell-extra.sh. I don't think we should offer the option of
disabling install of all systemd profile.d files in order to fix
incompatibility with just one of them.

There have been changes to 80-systemd-osc-context.sh in systemd 259. We
could try backporting 705e2ef19418 ("profile/osc-context: move and
extend check for TERM=3Ddumb") if we're not ready to update to 259 yet and
see if that resolves the issue. We may also need dd20ba74e3b4
("profile/systemd-osc-context: fix overriding of PROMPT_COMMAND") and
97ad10c9aab1 ("profile: skip setting PS0 when PROMPT_COMMAND=3D is
cleared"), I'm not sure.

Best regards,

--=20
Paul Barker


--=-nLe5bSS/Q/4M1KcIr0UK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaXNyPREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bpN8AQCBE2T7gASP4j0J3G3tREoSHE5Uqfz2mQ6J
Mgsp/T9SZgD+P8wT+Pl1gL2MOtRs38xgeV3N+BqIIERCgRUuDvYQ3wg=
=TRau
-----END PGP SIGNATURE-----

--=-nLe5bSS/Q/4M1KcIr0UK--

