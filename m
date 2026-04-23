Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F72F9935B
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 09:12:09 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15530.1776935524407074215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 02:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=htGxRO7+;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=dvUgAqiU;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 68FEBEC019D;
	Thu, 23 Apr 2026 05:12:03 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 23 Apr 2026 05:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776935523; x=1777021923; bh=0c3XPzs3nq
	dqdNQkTToxw/9/hYdESkBAynsly7g7G50=; b=htGxRO7+JPG5OQ6f99TTzAdQrG
	2pHJw+nPdzRdCa6aHv/66deVmr0mEpLJCIVSdtXB40xywr0+C8iLwPIsusaUrFdS
	an4rGcAXHaRihj5PGtBWHxR417XFz4l7clICTJjNlueBdMOCDXxYNf8Uo6IiPNdb
	MrYbAzQ/sg48svjA/vDR5lcxq4RinIhebfU5CCZriZA97p2xPJlWc2ZyfABE6OYW
	a8Jd77vq4Ne5sUDxeEZ5dGaqkvakyGCtozbQ2QaoB8Wr/jwuCGLsfMdZO18ecNH/
	uDxIHLPnRbkTG4xWZwBHOg38RDLwiVu3JvzEf6Ub0MDfQnWktYd5kZUdmRpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776935523; x=1777021923; bh=0c3XPzs3nqdqdNQkTToxw/9/hYdESkBAyns
	ly7g7G50=; b=dvUgAqiUIKk8UaDWnnXO1xNxkqieTDI0zDnVr52vdhSpBSYDHFw
	LfvR8R94gnUiYvAU6Cw0RTCPXeiJeGeyrldmoYlCbqFMkH8k6L2hCFBrz7C3vNWM
	1vsySWFOtXO8KvFa2lDDmowPSB0nyrIqss3LJW0FMUMtgzThzWcxIgeFRAHRA2cd
	oB4eKj6MlqffsSVAggfanPjb6fn8JGa19q5jwJhzx1jxSiMdFqYiTQKufVTuj1RR
	v+C6p1oXGM5fHpQ6iVGnwqcOz6EqC6O1M53iuGUGVG1wXkPPOIOzxn+fg4J3hmly
	BvY3AP403xZzTC637dZnwrcKTLN5qf/mLvA==
X-ME-Sender: <xms:Y-LpaR9unKyTfHdEiV2R0-eQpuMGkFX4_if_gDxWNuUCZSXcrnRE-w>
    <xme:Y-LpabtcskhuAm0DBGxDkB_XZrLa0n43dpQ8YDcEnas_brxTb0Nv9ecWMg_v7dHM5
    f6PqCuTXO88FRNB-xPqV83zSiOG1uI0DSxVSwfI5xe96YTI5U42jLY>
X-ME-Received: <xmr:Y-Lpacpz7g27v2PopESVWSnwWDdq3B5NEIDWW7LSWedxMCF9AzgvL3g2M8jX9AaAJq22KMdq9N58NxfJHShw--G_6cGg2k9fSpyU0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiieejiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkuffhvfevffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    etteejieehveekieevleelgfevhefhgeeiteejhfdtjefgveffhfffveeiffetkeenucff
    ohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtth
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepqhhurghrvghsmhgrrdhjohhsvgesghhmrghilhdr
    tghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrd
    hophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:Y-LpaQkSoTzJAN2uKBEIp_Qwdj1myi0bRVncj6FYmIj3-o26r1aXdA>
    <xmx:Y-LpaYxB296B-59240IdS_ysdNShzx_IcQFbFlvYUV6OLKDdyayh8Q>
    <xmx:Y-LpaQmc5lKruLELFY65_icppSJ0B3Mq7dHi4yfxGgVe3E1_vQUF2Q>
    <xmx:Y-LpaZc4Qf7nL_xnOg75T221jKU61Yt7lBFAdBjAEgnYtohPtDD40A>
    <xmx:Y-LpaXMbeOvOBpRQhIdmuqmDNyrCaxknULlgAb3_BOllAL9Lx0J1EMBP>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Apr 2026 05:12:02 -0400 (EDT)
Message-ID: <b44d65517593ec7279aef2618f49e00908eb938c.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v3 2/4] meta: Support opting out of any distro
 features
From: Paul Barker <paul@pbarker.dev>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2026 10:11:55 +0100
In-Reply-To: <CANPvuRmjv0YyiPqACX6JuhUfxSTYsiCQfstHxA+kFmE0sny+bg@mail.gmail.com>
References: <20260401-default-features-v3-0-8f4b40401ab7@pbarker.dev>
	 <20260401-default-features-v3-2-8f4b40401ab7@pbarker.dev>
	 <18A8B511426C8EDA.1516946@lists.openembedded.org>
	 <CANPvuRmjv0YyiPqACX6JuhUfxSTYsiCQfstHxA+kFmE0sny+bg@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-VjHI24oy4PodPeVEslbi"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 09:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235751


--=-VjHI24oy4PodPeVEslbi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-04-22 at 21:26 +0100, Jose Quaresma wrote:
> Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
> gmail.com@lists.openembedded.org> escreveu (quarta, 22/04/2026 =C3=A0(s) =
15:45):
>=20
> > Hi Paul,
> >=20
> > I think I found a bug that is somehow related to DISTRO_FEATURES_DEFAUL=
TS.
> > I don't understand why, but the variables in
> > DISTRO_FEATURES_DEFAULTS cannot
> > be used in inherit or inherit_defer.
> >=20
> > Let's use the following recipe as an example:
> >=20
> > -----------------------------------------------------------------------=
--------------------------------------------
> > mkdir -p recipes-test/inherit
> > cat <<'EOF' >recipes-test/inherit/inherit.bb
> >=20
> > LICENSE =3D "MIT"
> >=20
> > # FAIL
> > PACKAGECONFIG ??=3D " \
> >         ${@bb.utils.contains('DISTRO_FEATURES',
> > 'gobject-introspection-data', 'ccache', '', d)} \
> >         ${@bb.utils.contains('DISTRO_FEATURES',
> > 'gobject-introspection-data', 'vala', '', d)} \
> > "
> >=20
> > # OK
> > #PACKAGECONFIG ??=3D " \
> > #        ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'ccache', '=
',
> > d)} \
> > #        ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'vala', '',
> > d)} \
> > #"
> >=20
> > # get PACKAGECONFIG
> > # bitbake-getvar -r inherit PACKAGECONFIG
> >=20
> > # get CCACHE_TOP_DIR
> > # bitbake-getvar -r inherit CCACHE_TOP_DIR
> > inherit_defer ${@bb.utils.filter('PACKAGECONFIG', 'ccache', d)}
> >=20
> > # get VALADEPENDS
> > # bitbake-getvar -r inherit VALADEPENDS
> > inherit_defer ${@bb.utils.filter('PACKAGECONFIG', 'vala', d)}
> > EOF
> >=20
> > -----------------------------------------------------------------------=
--------------------------------------------
> >=20
>=20
> A clearer way to replicate the problem:
>=20
> #
> -------------------------------------------------------------------------=
------------------------------------------
> mkdir -p recipes-test/inherit
> cat <<'EOF' >recipes-test/inherit/inherit.bb
> LICENSE =3D "MIT"
>=20
> DISTRO_FEATURES_DEFAULTS +=3D "aaa"
> DISTRO_FEATURES +=3D "bbb"
>=20
> PACKAGECONFIG =3D " \
>         ${@bb.utils.contains('DISTRO_FEATURES', 'aaa', 'ccache', '', d)} =
\
>         ${@bb.utils.contains('DISTRO_FEATURES', 'bbb', 'vala', '', d)} \
> "
>=20
> inherit_defer ${@bb.utils.filter('PACKAGECONFIG', 'ccache', d)}
>=20
> inherit_defer ${@bb.utils.filter('PACKAGECONFIG', 'vala', d)}
> EOF
> #
> -------------------------------------------------------------------------=
------------------------------------------
> bitbake-getvar --value -r inherit PACKAGECONFIG
> bitbake-getvar --value -r inherit CCACHE_TOP_DIR
> bitbake-getvar --value -r inherit VALADEPENDS
> #
> -------------------------------------------------------------------------=
------------------------------------------
>=20
>=20
> The DISTRO_FEATURES is mapped to inherit/inherit_defer as follows:
>  'aaa' maps to  'ccache'
>  'bbb' maps to  'vala'
>=20
> I chose these two classes, but it could be any others. The idea is to see
> if they were inherited by looking at the class variables.
> The ccache.bbclass was not inherit and so the variable 'CCACHE_TOP_DIR' i=
s
> not defined.
>=20
>=20
> Hence my conclusion that DISTRO_FEATURES_DEFAULTS doesn't work for these
> cases, which in my opinion is not expected.
>=20
> I encountered this problem while debugging the patch
> https://lists.openembedded.org/g/openembedded-devel/topic/118939974.
>=20
> Best regards,
> Jose
>=20

Hi Jose,

We can simplify this even further to demonstrate what bitbake is doing:

    LICENSE =3D "MIT"

    python () {
        d.setVar('MAYBE_VALA', 'vala')
    }

    inherit_defer ${@bb.utils.filter('MAYBE_VALA', 'vala', d)}

Looking at the output of `bitbake -e`, MAYBE_VALA is set to "vala" but
the vala bbclass is not included.

If we simplify the last line to `inherit_defer ${MAYBE_VALA}` we get a
parse error. It also doesn't work with plain inherit.

This contadicts the example in the bitbake docs [1], which suggests that
a variable assigned in an anonymous Python block can be used with
inherit_defer.

[1]: https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bitbake-=
user-manual-metadata.html#inherit-defer-directive

I will investigate further!

Best regards,

--=20
Paul Barker


--=-VjHI24oy4PodPeVEslbi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaeniWxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bqtYAQDaIARuZZXQ4+LlJIE2mlk4WRxrcfT+JZG7
7Nk2XWs//QEA3Ccb2lePqxSU1YV+5Ps6UEn2c0L9c+bzMFJPtybFKAQ=
=YHgF
-----END PGP SIGNATURE-----

--=-VjHI24oy4PodPeVEslbi--

