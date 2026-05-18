Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5634CD4F48
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 07:18:10 +0000 (UTC)
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3286.1779088687967019988
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 00:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=a1rBWTsw;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=XvQfow7l;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id AA1401D000F6;
	Mon, 18 May 2026 03:18:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 18 May 2026 03:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1779088685; x=1779175085; bh=vkvj+8ALAL
	rzFkC2nalR22Y127qOk8fN83DfgWlV+7w=; b=a1rBWTsw1CBGFzKI6LbxsX74er
	aN7z956dNH15aXsAp8KM6eta5Vz6evanW1UAVJeDFTKoYHhF2ogLVBEflUFO7rql
	2F9OB1Q0C1vA/GfpyGCXHxBHBHrK7K4sdrEvaPwgrlPFt1Ljlv063j3l1eh2tS09
	IRoN7eo5cYRaWuQsMkFgsjBMnezI+1ROU2cjYQBnmRmACViqOJI45a8XGnxLL1CE
	raWvhBPKmW6k5uISuKJAw8Fy6BfweyldvyIktaDBs69A6cfvRsgwwehUCkdN/IQM
	RannIaO42mKD7h68R3YdN2zByTrzBlraskvZc5TvuiyrAno5kcinOfxvQTcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779088685; x=1779175085; bh=vkvj+8ALALrzFkC2nalR22Y127qOk8fN83D
	fgWlV+7w=; b=XvQfow7lLzMdG7rxAe0/XO7Cdx4JTKTppmPJLay/iSbhHmYjFvL
	ZggFLrERWgyz57dI7YBDQ8mnmdeRD0wddkM0jNdkKe7mEhDDmF1h4Y8ktokIT6rT
	BwwH0qPJIADM9XSrL/3TkQkum9DB0XaQxzy0j3nPAHB+a/vUYoP8dcT25LdzbwLw
	4qJYR/W9o+EtDD3ilNVd6Cq3T0+dQhGHKzeAsy3VywzbhGC8VSIvi0Nlz6fq/lFw
	wJRcvO3crEh8mZf+r567oJu/dVLjdlcphXT+IBP0fi5Rd0TtciEPB5QO0tL+XFTr
	TL7Fb9TRW+Zwpf/yZ/B6aeKKjXBHweBrY9w==
X-ME-Sender: <xms:K70KatpZ5LjLnXCyed_dpMXA-kFmV9PwUdeCTmF0YRCowjyjBIXA4w>
    <xme:K70Kalq9f5sMjEw8I6jMIoUJueA59ot24JK8qAtRfp9H59pg1x7wypQw7E-gtOtXE
    D4sBGA7CYOVRrKT7T-BQiCZPL2ctwnLTeurmGH_7QsVpD8CpuCCRag>
X-ME-Received: <xmr:K70Kan1xw8iSZtg1ebYWCvlGCLpWzYuw3ycZaZaf2zTMVvCRCh00W-nG56QTkNCIXa4Wz-glE3JhdkdaBhB6hAoDHNpqMhje7KvP3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeekvdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepieelheejfefgueffvddtveffteegieelteevje
    elieeiveehhfdtvdevteeuledunecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdpghholhgrnhhgrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphht
    thhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegthhgrnhhgqhhinhhgrd
    hlihesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggv
    ugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:LL0KakDpQ0BcLRz7rsA4PagCtcV8nClnAEAczRy5t4xnxm6LMQc2lg>
    <xmx:LL0KavdNQNHt5yklX_tqkgEiNkLCPdM8MUKPxdilPdls4FRRC4pgIg>
    <xmx:LL0KapgHuY2IJOsvO5Txt_6ofhpWD47amYXTJsRT3Vya2WWPt9aifQ>
    <xmx:LL0Kanp-T0Bk8n4X40MQLONuAOGyp737LIbhgvrIF_dsWxf17Hi4vw>
    <xmx:Lb0KapJA52uemIC8VnV-RFN17eNDRVzhMCc7T85aJDwNQIkbXxy0ytwZ>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 May 2026 03:18:03 -0400 (EDT)
Message-ID: <1b05833208339033ec4ae244d71d1391b4fe42cd.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] cgo-helloworld: init add
From: Paul Barker <paul@pbarker.dev>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2026 08:17:56 +0100
In-Reply-To: <20260515024119.4192524-1-changqing.li@windriver.com>
References: <20260515024119.4192524-1-changqing.li@windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-SF59IYUWJNtjh3UMRyb7"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 07:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237203


--=-SF59IYUWJNtjh3UMRyb7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-05-15 at 10:41 +0800, Changqing Li via
lists.openembedded.org wrote:
> Add a go example recipe with cgo enabled. This is for covering
> go reproducibility with cgo enabled. Related to the following commit [1]:
> [0642d23230 go.bbclass: change GOTMPDIR to improve reproducibility]
>=20
> [1] https://git.openembedded.org/openembedded-core/commit/?id=3D0642d2323=
072f561a4d0eeb9266213387b2997fc
>=20
> [YOCTO #16100]
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../cgo-helloworld/cgo-helloworld.go          |  9 ++++++++
>  .../go-examples/cgo-helloworld_1.0.bb         | 23 +++++++++++++++++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-extended/go-examples/cgo-helloworld/cgo-=
helloworld.go
>  create mode 100644 meta/recipes-extended/go-examples/cgo-helloworld_1.0.=
bb
>=20
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 24c5a9d712..b72cbe7c93 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -97,6 +97,7 @@ RECIPE_MAINTAINER:pn-cargo =3D "Randy MacLeod <Randy.Ma=
cLeod@windriver.com>"
>  RECIPE_MAINTAINER:pn-cargo-c =3D "Deepesh Varatharajan <Deepesh.Varathar=
ajan@windriver.com>"
>  RECIPE_MAINTAINER:pn-ccache =3D "Robert Yang <liezhi.yang@windriver.com>=
"
>  RECIPE_MAINTAINER:pn-cdrtools-native =3D "Yi Zhao <yi.zhao@windriver.com=
>"
> +RECIPE_MAINTAINER:pn-cgo-helloworld =3D "Changqing Li <changqing.li@wind=
river.com>"
>  RECIPE_MAINTAINER:pn-chrpath =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-clang =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-clang-cross-${TARGET_ARCH} =3D "Khem Raj <raj.khem@=
gmail.com>"
> diff --git a/meta/recipes-extended/go-examples/cgo-helloworld/cgo-hellowo=
rld.go b/meta/recipes-extended/go-examples/cgo-helloworld/cgo-helloworld.go
> new file mode 100644
> index 0000000000..4eb052a09e
> --- /dev/null
> +++ b/meta/recipes-extended/go-examples/cgo-helloworld/cgo-helloworld.go
> @@ -0,0 +1,9 @@
> +package main
> +
> +// #include <stdio.h>
> +// void hello() { printf("Hello, World!\n"); }
> +import "C"
> +
> +func main() {
> +	C.hello()
> +}
> diff --git a/meta/recipes-extended/go-examples/cgo-helloworld_1.0.bb b/me=
ta/recipes-extended/go-examples/cgo-helloworld_1.0.bb
> new file mode 100644
> index 0000000000..9ca1e16c7a
> --- /dev/null
> +++ b/meta/recipes-extended/go-examples/cgo-helloworld_1.0.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "A simple CGO example that calls C to print hello world"
> +SECTION =3D "examples"
> +HOMEPAGE =3D "https://golang.org/"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
> +
> +SRC_URI =3D "file://cgo-helloworld.go"
> +
> +S =3D "${UNPACKDIR}"
> +
> +GO_IMPORT =3D "cgo-helloworld"
> +GO_INSTALL =3D "${GO_IMPORT}"
> +
> +inherit go
> +
> +export GO111MODULE =3D "off"
> +export CGO_ENABLED =3D "1"
> +
> +do_configure:prepend() {
> +    mkdir -p ${S}/src/${GO_IMPORT}
> +    cp ${UNPACKDIR}/cgo-helloworld.go ${S}/src/${GO_IMPORT}/main.go
> +}

Hi Changqing,

Please could you add a selftest case which checks that this recipe can
be built? I think this should be added in the existing file
meta/lib/oeqa/selftest/cases/gotoolchain.py.

Best regards,

--=20
Paul Barker


--=-SF59IYUWJNtjh3UMRyb7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCagq9JBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bgP9AP0drVL9ROgQ8C7UKPQNws5n4NdqPwX8MK79
06WZibYJmwD/VoW2eEH+XR7D/G1nsABtYkgz6HLUweJJ5tbaUlBu6Qw=
=HBP1
-----END PGP SIGNATURE-----

--=-SF59IYUWJNtjh3UMRyb7--

