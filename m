Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3292F34C4F
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 12:36:50 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.270643.1776083800432942544
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 05:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=QPScXCGT;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=PEsDIRAZ;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 980C31400082;
	Mon, 13 Apr 2026 08:36:39 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 13 Apr 2026 08:36:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1776083799; x=1776170199; bh=p/cY6BWr73
	AzZidMREi3d6TEzH1RaX2GVQiQLaZy0Pk=; b=QPScXCGTu9KeJkP1JBtzR85LMa
	kYj+EtEaHilNDOCIVf87+TeyGgr5IXuFGKOsYu7Hc88zZI4f5MIqSHm1Iqps8VZX
	fBK/0h5Mqwg+Ap/a0+GE41ekpvRn1nSLHxObbuO4rIVtchb13dIvp5uz/VZUCT0I
	7gNqEXRDTP55sNywTjwigMiR/8ztHAfQqLRqgl0HKl/MEho8FfKa8TaHkJowdxKi
	g++mhLCioLaRoDKqlnumtENbKvZEKU1IA+D2Dvv9ET2/W+oqD88Ado8GM+EdiHNi
	2gIo/j0Dq1v/q9gl19I4Jxz8dEat61oA6f97Ibu2RqK3yXFVWrR2ctD++SxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776083799; x=1776170199; bh=p/cY6BWr73AzZidMREi3d6TEzH1RaX2GVQi
	QLaZy0Pk=; b=PEsDIRAZgjptK9hFRkC3jFDaZKoqYyVGIQBLJ5JLQvTbs8w3m71
	Li6tSKt5B55XkwkREydP6fEMirRpMsmSlWElomkEBuug1he6PTHa5kEPOjwQW032
	8SwouaaeDcNiLyf9bpipfxrKR3/FwOdCnWPkgfpwupgMjijNSd9hCff17FOziSEh
	If2jHGD/w2olGoUg3ku43rj1+aRyc2vqfpvtyuPMFTqaHaI2cMPjJ8+6+4J0U8yj
	M/A1Umnkz2ht90GIjE8vqPORR3PUsu/O3COOAJhLbu5GD25x0Qp20qwYgpVwO6Fv
	3999RsHkbgAs1GjRZjl9zVEOZP90WLx02vA==
X-ME-Sender: <xms:V-Pcaak3KCOsHDOk-t1CCfjdbozsbFNmr09LE9R02KmSvks06VqkfA>
    <xme:V-PcaZSAv6mdmBi3Z8jJbUqKnMZjzQEy0AC7ffcNMcNcVPG9gnyjD_R4Tj7xwaWOq
    qgCHa3kBIqIvjYvxoK85sXv30sS6DzrKCbqUbgX2D2R0Axa13w14P1c>
X-ME-Received: <xmr:V-PcaWC__GiWKhzLC9xEog7xCgB1Topr_b3kNyGzJbDqev33M7Ip9u-dMSnLtVMwUezwI9SXWrdoN6leBM9eJVmjdFOm1zgifJ9S97g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefkedvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecufghrlhcuvffnffculddquddtmdenucfjughrpefkuffhvf
    evffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceo
    phgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpeejkeegveekie
    euheekheeljeeggfdtveehffevtdetueffvdduhfehgeethedtueenucffohhmrghinhep
    ohhpvghnvghmsggvugguvggurdhorhhgpdhnihhsthdrghhovhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdr
    uggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    ephhhjrgguohhnsegtihhstghordgtohhmpdhrtghpthhtohepohhpvghnvghmsggvuggu
    vgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpth
    htohepvhgthhgrvhgurgestghishgtohdrtghomh
X-ME-Proxy: <xmx:V-PcaYQ_2FxhZybv-6MEO5evKATymimGbjTnQ5KqdyuPz8uVS91wDg>
    <xmx:V-PcacoeNUEu--BDCR7gIe4P_ktcTHEUAfm1DaY9zBP-uSd7Z_7zrg>
    <xmx:V-PcaSwZERZ7oYYMo6uF37Ad3RN9lnlZIJDw4zuebCQ7OWenkY-atw>
    <xmx:V-PcaZJJSIwEw8nKfxA4vVrM3qZKhUcqWzUvJKJQiKbZ3RLaina5eQ>
    <xmx:V-Pcaf4cZR72FqSzzX9qT4PS12GJiAVs6Hu5QtC77GnXq5LFM5VRsYbA>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Apr 2026 08:36:38 -0400 (EDT)
Message-ID: <15d64fc4f3f3fe599b59afe642d02a0add64b3a5.camel@pbarker.dev>
Subject: Re: [OE-core] [master] [PATCH] acpid2: Add vendor to CVE_PRODUCT
From: Paul Barker <paul@pbarker.dev>
To: hjadon@cisco.com, openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Date: Mon, 13 Apr 2026 13:36:35 +0100
In-Reply-To: <20260413111552.1809426-1-hjadon@cisco.com>
References: <20260413111552.1809426-1-hjadon@cisco.com>
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
	protocol="application/pgp-signature"; boundary="=-0w+5uXSwt6SKZCaJk0wg"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 12:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235111


--=-0w+5uXSwt6SKZCaJk0wg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-04-13 at 04:15 -0700, Himanshu Jadon -X (hjadon - E
INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Himanshu Jadon <hjadon@cisco.com>
>=20
> Added `tedfelix` as a vendor to `CVE_PRODUCT` to align with the
> product naming defined in the NVD CPE database for `acpid2`.
>=20
> Only a single CPE entry exists in the NVD for this product:
>  `cpe:2.3:a:tedfelix:acpid2`
>=20
> So far, only two CVEs have been reported against this CPE, confirming it
> as the correct mapping for CVE reporting.
>=20
> Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
> ---
>  meta/recipes-bsp/acpid/acpid.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/ac=
pid.inc
> index ba954563b6..0d32249a61 100644
> --- a/meta/recipes-bsp/acpid/acpid.inc
> +++ b/meta/recipes-bsp/acpid/acpid.inc
> @@ -17,7 +17,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/${SOURCEFORGE_PROJEC=
T}/acpid-${PV}.tar.xz \
>             file://0001-Replace-stat64-with-stat.patch \
>             "
> =20
> -CVE_PRODUCT =3D "acpid2"
> +CVE_PRODUCT =3D "tedfelix:acpid2"

I don't see any other invalid CPEs when I search for "acpid2" [1]. Why
do we need to specify the vendor here? Are you seeing matches against
other CPEs for acpid2?

[1]: https://nvd.nist.gov/products/cpe/search/results?namingFormat=3D2.3&ke=
yword=3Dacpid2

Best regards,

--=20
Paul Barker


--=-0w+5uXSwt6SKZCaJk0wg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCadzjUxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bo3XAQD6PeS8jckUi3nKDhk9zZR0qIaaSnESRq4z
4RjVFUbvUgEAsQKD3WeLy1DYxxiaJFJbx4WWmk1d9DbpkNCzF9rRmAA=
=SZjW
-----END PGP SIGNATURE-----

--=-0w+5uXSwt6SKZCaJk0wg--

