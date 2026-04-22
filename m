Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C269F9B60C
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 10:31:08 +0000 (UTC)
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79555.1776853864878903626
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 03:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=fpni8BQh;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=q98NZC9f;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 281537A0201;
	Wed, 22 Apr 2026 06:31:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 22 Apr 2026 06:31:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776853863; x=1776940263; bh=6WXX3w+nUE
	6Hn0CaXLamuATPej7XvSSU4VfkDj3GYIs=; b=fpni8BQhJrg2hJMP1WtY8akM4K
	vqz5dzUD6e8awmGie+KGrcY0wv5diT3RrW/UaeQbj8NLMhCGInfZVD5zQxHnxEOj
	kDzf+He9wdZZFLQ0az+gEAm5/EpYN/1YtTjjcavE3Dp+r4Y6NbVK+nslOapNR5/a
	yvqshy/nkN4FugPhKK04LwwnEKdUCbNM/LsAkwoGpxPbzISCc40j/aFIAZViDo8a
	XNCgrybQk+S9ZLA7+IP4HZsTgf2savZnMmNX3ivnKRztepFfGY7sLr0xu7fOgYcE
	67g5gjXWxpnuUc3h4FQU+PQ7LaUrCNbDLTAnkGcKfwVDZyfjnnA0J0JwXIyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776853863; x=1776940263; bh=6WXX3w+nUE6Hn0CaXLamuATPej7XvSSU4Vf
	kDj3GYIs=; b=q98NZC9fxxLje+ZPVk3bJSQP3lK8AZeySWW9VZfAuOyrR7DSD8Z
	KhlGBX3iC5m6fyPaDRU3cj0dYh3RF0b788raDX5uh3nJozUW8DZ6kaNR2+o270rz
	1I5xLo3mnP40DBVzfuxrgLM0OaV13JwJ4tpK2WP0Er61fcP39npcRI/sQQwHkwMK
	/zy7NbtGjwWhHdeWgpqNSap/gl0cTPwKjY5ixXi2QLaMoDGrkp9r/RLIhOew//lX
	7KjJ7JsMFvsJTmOHf0L5wuPKlGqTnvPqRGQYtU7Ebh9+4QBMShbrX08BiL4lw6+a
	8OBo/A7o39GoH+kIuVt8suXWQBsfByn3uMw==
X-ME-Sender: <xms:Z6PoaaQelFLYosCVWpDsizNe6xIBxq7sUjOlkXFtL6siFhBStdwA5g>
    <xme:Z6PoaVwDXIz9f4n6oltfWK7q_R1i5hsi6O2RpDStIiPLy4VsRigqFg9c4eObC0jxm
    acZkCJYmO087dJnY9yqnX8hmvn9E1C7gZuLFfKERk8638WyUllxEW_E>
X-ME-Received: <xmr:Z6PoaVcMS4O0D7YPpdL-rJkhCZ8zDpNckYRHUczKoth2ZwO-6IXrChAnbwSk1AyS_C-68Ya6ixyYw28QTXxiGHUkRw_ovPzHT7kwDK5VFEDj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeigedtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfgggsehgtderredtre
    ejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdgu
    vghvqeenucggtffrrghtthgvrhhnpeegfefhudethfffveehveekjefhgeffgeeikedtfe
    ektdethfduvdffueeiieetffenucffohhmrghinhepohhpvghnvghmsggvugguvggurdho
    rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepph
    gruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehhjhgrughonhestghishgtohdrtghomhdprhgtphhtth
    hopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvggu
    uggvugdrohhrgh
X-ME-Proxy: <xmx:Z6PoaRK0GE45_AHzfYIZboSzpOxsRvze5pH0dcckRu0XaFZp8YwqMQ>
    <xmx:Z6PoaWFVq_jKXupV3dlI0mfs_s2nF6stpqza6Yx7JzhWhDGyYG1mCA>
    <xmx:Z6PoabprrED3BeHILSIt1rbEHRFyHlAXj0pfi03N6CE_QNbatIXavw>
    <xmx:Z6PoafSsP-m80PxzqxVzmK7glGYiDdK4OuM4XrD27_1J2ycyT2yd9A>
    <xmx:Z6PoaVh91CInIYw7oLh3cTEhhwMct1LHMkWJ1a-zQ4uXjseGfiN_Zvzv>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Apr 2026 06:31:03 -0400 (EDT)
Message-ID: <e225fccde9314e31a8efa5a171afa97780f67332.camel@pbarker.dev>
Subject: Re: [OE-core] [master] [PATCH] apt: Add CVE_PRODUCT to support
 product name
From: Paul Barker <paul@pbarker.dev>
To: hjadon@cisco.com, openembedded-core@lists.openembedded.org
Date: Wed, 22 Apr 2026 11:31:00 +0100
In-Reply-To: <988308.1776780282564546487@lists.openembedded.org>
References: <20260421111028.2501890-1-hjadon@cisco.com>
	 <b6875fed11ec10d190215ff3587a9553362a55a2.camel@pbarker.dev>
	 <988308.1776780282564546487@lists.openembedded.org>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-kbASMarE+gr3VwLQU48D"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 10:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235709


--=-kbASMarE+gr3VwLQU48D
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-04-21 at 07:04 -0700, Himanshu Jadon -X (hjadon - E
INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> Hi Paul,
>=20
> Thanks for raising this point.
>=20
> The main intention of these patches is to improve CVE correlation in case=
s where the recipe name does not match the active NVD product identity prop=
erly, or where NVD has moved from an older/deprecated product string to a n=
ewer normalized one. In such situations, depending only on default recipe-n=
ame-based matching can lead to missed CVEs.
>=20
> We have already added CVE_PRODUCT internally for multiple packages and ha=
ve seen better reporting because of that, which also helps improve the over=
all security view. For example:
> - abseil-cpp -> abseil:common_libraries, which results in reporting of CV=
E-2025-0838 with CVSS v3 9.8
> - onig -> oniguruma_project:oniguruma, where the current DB contains mult=
iple CVEs with CVSS v3 9.8 such as CVE-2017-9224 and CVE-2019-1901
> - apr -> apache:portable_runtime, where the current DB contains CVE-2022-=
2496 and CVE-2022-2833, both CVSS v3 9.8
>=20
> This also helps in the longer term by making SBOM-to-CVE correlation more=
 reliable and by reducing dependency on implicit recipe-name matching when =
the upstream NVD product naming differs.
>=20
> So the purpose here is not only metadata cleanup, and not only false-posi=
tive handling. The main goal is to make the mapping explicit wherever it im=
proves correctness, avoids missed CVEs, and gives better security reporting=
.
>=20
> Regarding deprecated CPEs, I agree that they should not be removed blindl=
y. If a deprecated CPE still carries CVEs that are relevant for the recipe =
version being considered, then it makes sense to keep that older alias alon=
g with the newer active one.
>=20
> In the specific apt case, the older debian:apt alias is deprecated, and t=
he CVEs currently associated with that alias do not apply to apt_3.0.3. So =
in this case the deprecated alias is not adding relevant coverage for the c=
urrent recipe version, whereas debian:advanced_package_tool is the active N=
VD product identity. Because of that, this patch uses the new identity inst=
ead of carrying the deprecated one unnecessarily.
>=20
> Additionally, whenever we come across cases where the NVD CPE naming or m=
apping itself looks inconsistent or incorrect, we are also informing NVD se=
parately so that the source data can be corrected there as well. So these r=
ecipe-side CVE_PRODUCT updates are for improving present correlation, while=
 the underlying CPE/data-quality issues should ideally be corrected upstrea=
m in NVD.
>=20
> I also think there is scope to improve the cve-check class itself so that=
 it can report when a deprecated CPE is being used in a recipe. That would =
make such cases more visible and help maintain the mappings more cleanly.
>=20
> Best regards,
> Himanshu

Hi Himanshu,

I've discussed this with Richard and Ross. We should keep the older CPE
in the list, both for completeness and because future CVEs may be filed
using the older CPE by mistake.

So, we should set:

    CVE_PRODUCT =3D "debian:apt debian:advanced_package_tool"

Also, please quote the email you're replying to in future (as I have
done here) so that the conversation is easier to follow.

Best regards,

--=20
Paul Barker


--=-kbASMarE+gr3VwLQU48D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaeijZBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0boCIAP9nSrBSI2vWq+F+YUkk50EcfSs7cCPv98B6
UTRR7E5hrwD/avXjZBTQRGcUnNw3yD2E5QoXY6O6rnqZefOtBBXevws=
=QoQC
-----END PGP SIGNATURE-----

--=-kbASMarE+gr3VwLQU48D--

