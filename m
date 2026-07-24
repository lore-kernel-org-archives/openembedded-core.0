Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BBCC53200
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 14:14:16 +0000 (UTC)
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20149.1784902454934236113
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 07:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=A8iZ1t/C;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=UsEyqu0p;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 339231D0048F;
	Fri, 24 Jul 2026 10:14:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 24 Jul 2026 10:14:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1784902454; x=1784988854; bh=PqS1CeROYd
	1Ey7uuTf1edP/rOLmVO+mahgHc2zm63KQ=; b=A8iZ1t/CCckw5QmMceiNa+Sr3k
	dxpBdu3Og6tcTWRAyPGM56jqppFgHQUA2mRrpPvLIkbPv8l79TRU5UZgpWGeOx04
	eLDhUyWhqFGs88tN2+x51cD2VgjqL3JbRh36X5ZJjTjkNyfrptw5phoA3OCcgPtS
	gAsWTCIC76Qqg8upDGq6HAMrkTUM8v1HGoVcOZQP5A6ObPG3QELBfpPVGsHI3EhM
	hQLLSKrTG9qBzjk1eCxbUKJ3L3M/GiB+bz4+xT79Cq6Kn4+j84qdxDkIHiBvlntI
	+vVczBN5GtG43G0gmT0bavDv/eYIfTcjw+9a7Z4Ia2T3WUjwo2CqTPjHyODg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784902454; x=1784988854; bh=PqS1CeROYd1Ey7uuTf1edP/rOLmVO+mahgH
	c2zm63KQ=; b=UsEyqu0pMAPlx2kaaAvNT27a+GXLUxN5CCghaQ2U+UsiYBXpDEd
	GmWSebiBU3HrPVzGikCE08wvXCNL/Aw31bC2RPE4Q1mGbRAwp4+BfHNlvJ1rlenu
	Gm8EdGxppbin7WPiqFKhJjnRaJQ5zaSR2FmZV17oEQfcRQhv8HpsaXuR7Y2ZgQLm
	TcnOtzIs6c/YgV2NQQOT/Da1ZeERqzqUOFN3CAkdOx2k5mLjrn3M6oCE6yNzDWsK
	W0BT2/feA2jtKMN7zzSe8LIHSUznSTQmjeYJ3HfjQFJBIQe7e7qbW6A0lu33PGz3
	V3u3xE5ZfbIWBRTnabHsQGdDfekKVgfLPYA==
X-ME-Sender: <xms:NXNjajoqFjQEVqDYxtU8zFZQmrB34GFspU5X1mSvMHcwpy7ndeCRZQ>
    <xme:NXNjalEOqgIKgMMzpSej5OpSq_-5-Q38qjSrOHCycEeSlJJb4EUFUxM6WuzpTMV45
    NMQ5LxVTYyKYxr3A52kf2KpTepHlFzzN6RuqAcymBvhz9rqFKTbiCI>
X-ME-Received: <xmr:NXNjatnmbpDINAjkG8seKh-drdXJ58RBhFDh6pm80rkRmxkLQTaYTXeDUzyD7684Ne2UKjki4dKzhq38BPaeOqqaw6KcTFh-kcVUVS5HvSsG>
X-ME-Proxy-Cause: dmFkZTGzYjHEz5d01QRnlIgNm0ZWnJZMSUxMIaomnteluyL04dzPLpR4gPGSQVx6ktweqm
    SOJ3KisYbnBWPwFhynKCqtVDcSyYw976eEu6iXXIwbBORuvde02zKi+gADe23NLW6WCbxK
    jG1bxIQoZIOv3O1MEprMS+vxng7z3ifv6eGPYw3OrzDZcc1uaaTQmTqjdeQoLZhNscMPRz
    rbOKDo78Q1PaxR9F2lNSQL9EVBlFzR/Hp+Tuhwn+hkjh7qlQxvyI7zdgGV8umB083ga/SQ
    iklKLOlxcTYXImi6EsL5gD84r5+UTSuhLoXJlmLSEBKc7WJpdMcTakFDCmLhvTeQJ9B5bv
    TMCLc55UGssCxw2cdIWnJBITFIWZzpZY4sOmZ56IQBYUTqYiIN8A+IyL51l1mFKaHa+Gt4
    QDUoHqttifz0KtDA7/r2kzmKggKcMtUQVEOTXhryUu+u7+GVa8N5W+KtHTFLlbDg6t9ujR
    2PMZkouYt2sTIOBYIBFDzjVN1IWVyz0wAOoOSNi016FYcBlCPh7GlyAUR+ertKIhax3kAk
    U0bE521BCt146tpoDmpOPhjvScjto+Wj4+ScisAPGbCty7ENvNDkQWhlJcsh17JEi5Gynb
    T0TFJdhBLl/v1bJBcz3GqEoLrFEn/dtjvySDfMful1H81Kqv5IfROFv+WVKQ
X-ME-Proxy: <xmx:NXNjagnEdQmlaepYnc6JT2ecgwhTKsPNO-x-0tPkhLdhrtjCwux-WA>
    <xmx:NXNjamsJ8sV_JuMcJ_r3czw-TGeXE5WRa88f-bbdG14uuJwhfx2ZLw>
    <xmx:NXNjarmluT8MCBG3avUgZwAQ1UujaHSITgbIaDPQUG_V3q7X09rIbw>
    <xmx:NXNjapvPTo-dT4xPlyTXOuTWI36Wde3R0mqgoV8eU7s4yH_E2gewAg>
    <xmx:NnNjaj10wY4YVH3OrxJRtG7h6xpCTSjhjYMUp1W_ptHCc-EwhbjBRRrr>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jul 2026 10:14:12 -0400 (EDT)
Message-ID: <151438b76ffe19c6ee5e28c446bfa29c3dde896b.camel@pbarker.dev>
Subject: Re: [PATCH v2 2/4] packagegroups: add
 nativesdk-packagegroup-sdk-host-rust
From: Paul Barker <paul@pbarker.dev>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Fri, 24 Jul 2026 15:13:45 +0100
In-Reply-To: <20260717130109.2187282-2-Harish.Sadineni@windriver.com>
References: <20260717130109.2187282-1-Harish.Sadineni@windriver.com>
	 <20260717130109.2187282-2-Harish.Sadineni@windriver.com>
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
	protocol="application/pgp-signature"; boundary="=-5Hb7QbJ1h6gKB2eknJA3"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 14:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241936


--=-5Hb7QbJ1h6gKB2eknJA3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-07-17 at 06:01 -0700, Harish.Sadineni@windriver.com wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> Add a new nativesdk packagegroup providing the dependencies needed to
> build external/out-of-tree rust modules in sdk.
>=20
> Set PACKAGE_ARCH to TUNE_PKGARCH instead of the packagegroup
> default of "all", since nativesdk-libclang is dynamically
> renamed per build (e.g. nativesdk-libclang22.1), which is
> incompatible with an allarch packagegroup.
>=20
> Add this to TOOLCHAIN_HOST_TASK to include it in the SDK.
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  .../nativesdk-packagegroup-sdk-host-rust.bb      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta/recipes-core/packagegroups/nativesdk-packagegrou=
p-sdk-host-rust.bb
>=20
> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-h=
ost-rust.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-ho=
st-rust.bb
> new file mode 100644
> index 0000000000..b10d420acd
> --- /dev/null
> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-rus=
t.bb
> @@ -0,0 +1,16 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +SUMMARY =3D "Dependent packages for building external rust modules"
> +
> +PACKAGE_ARCH =3D "${TUNE_PKGARCH}"
> +
> +inherit packagegroup
> +inherit_defer nativesdk
> +
> +RDEPENDS:${PN} =3D "\
> +    nativesdk-rust-src-lib \
> +    nativesdk-bindgen-cli \
> +    nativesdk-libclang \
> +"

Hi Harish,

We've merged this patch but did have a follow-up question: should this
packagegroup include dependencies on nativesdk-rustc and
nativesdk-rust-tools-rustfmt? If so, please send a new patch to add
them.

Best regards,

--=20
Paul Barker


--=-5Hb7QbJ1h6gKB2eknJA3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCamNzGREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bq0SAQDZ0Z+J25I015eD3nRuxFI84qiOsyoDc7Gn
9Ekug4l/ZQD+JaxYD6h3rg+JS/UJFeKMm4ofBbQ3FXlySScnoa1QjwI=
=hDZM
-----END PGP SIGNATURE-----

--=-5Hb7QbJ1h6gKB2eknJA3--

