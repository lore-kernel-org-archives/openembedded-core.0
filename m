Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCE6FD2D63
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 12:00:27 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38347.1773144018747573395
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 05:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=CZXZ58tV;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=nok0NdGU;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id D5A63EC0C7A;
	Tue, 10 Mar 2026 08:00:17 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 10 Mar 2026 08:00:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1773144017; x=1773230417; bh=aO6sWoqiZu
	+UyCONdKf2vwfPZEaIumMp1aRZRg1WfMU=; b=CZXZ58tVFCcTivhggkkhasynFK
	K8/6yNtk5AW20v9Q0nbkuWjXG+6h/RF5Ka0FGDlmaFW1Rds1rl5vMQcYC1+HInMQ
	HgU6PKDgd1ox4fiodZ7ffoUxsnalZU5exV+drEjqoyiXV+CGyusUrzvZDssJogtf
	DeLLBbGN1bJqZIsDrRl9W6597dT8fjztj4CE1+p+f4Vuyy0c0wy9iS+pHKdtYyod
	dukF1K+pngP6nkmDNZ/suWdWD3L2PFGHz4FbZLnhqA8doWLzW/56evJJn05214af
	C8/olq+5OQMgtOEh5bcg7B8oePywh1FqMl9qCkQSpjzqbrpomqB+m6sd67Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773144017; x=1773230417; bh=aO6sWoqiZu+UyCONdKf2vwfPZEaIumMp1aR
	ZRg1WfMU=; b=nok0NdGUOQpPWZMdb1tbi6xvQ6O4n9g8T6vhO0WjLgp03H2Iw5G
	nUS7fwOL2RhLI6tmhd+YsHztmm25DDwd8j3K1z1D5x+kjoS1RRFhMxBCoSY6B/+Z
	SmfiMTPMyQAIBz6Oz2oyHWm8Ya/daAybeAjEd8F3IVr/BgEQqNKrh1z5x7hKaMmo
	VvAx1ZkGtvjnV+z+CCqGtYDtHyNskrbrBf3d8YL7q7HnU36CXjhbP6yLVAeZ9xlN
	+DjpEleU/Iza4rixYXgwxT2hQtA81evOOxQjVwbP46L5QpKmwHWIsa0RcQ0dW09N
	cdLYFBJINUtVtoQjrLhzmorcti4qxnomJTA==
X-ME-Sender: <xms:0QewaRCxUO-Z-thXGfNO7CWiBrnfNtZJKvV52Np123sk7lhXGhZDiw>
    <xme:0QewaVhjw1fqktKx_RAUfBnVXWljN0HhBod2A_D9VGndyGVmyc-SKCwgN_w9BuFcy
    YQijpgxvNyf_FSccCj5RVt3mDyLbq-2jCpRoNKuE0UQZGXbN-aqmAar>
X-ME-Received: <xmr:0QewaaNS2wJvLw8pdJ-r55Et-pjvaDFGm8LdBvSae34uSaiMNH7gI010pizlIKDhHLB2n4mQn_U8m5jb96-gjunIajM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkedtleejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepgeekueefueeujeetfeffveehkeeigedvudevve
    fgvdehfffgtddugefguddugfffnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdpkhgvrhhnvghlrdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgs
    rghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohephihorghnnhdrtghonhhgrghlsehsmhhilhgvrdhfrhdprhgtphhtthho
    pehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguug
    gvugdrohhrgh
X-ME-Proxy: <xmx:0QewaW7qvvM3MsQ-r0RlEeltLkHb7sSjeonm6lyOp9VEX1isKIFLHw>
    <xmx:0QewaY0iF7qCqC-QvxuEJu2Z0vQmj1QthRjMqpje-8Sn0IGQO8o7eQ>
    <xmx:0QewaXZPeML1Tf_2nROe3QNKnahkDZmvTmRjuospuOgevWjF7qfMNw>
    <xmx:0QewaQCM-lR2KJMbkn7FR8oqDQkEhXkei7wIKP86EKmb1ZXYalM4Cw>
    <xmx:0QewaVl623jOrv5Lj307yj6KA-6nHsIaZeEaoJ8EjQGccoNOhNHeg1TH>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Mar 2026 08:00:16 -0400 (EDT)
Message-ID: <66d62185dfcba13f425d39107de4549a75eaf59f.camel@pbarker.dev>
Subject: Re: [OE-core][whinlatter 00/16] Pull request (cover letter only)
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2026 12:00:11 +0000
In-Reply-To: <cover.1773140572.git.yoann.congal@smile.fr>
References: <cover.1773140572.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-liPP3O2kGThbATiJqwYC"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 12:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232773


--=-liPP3O2kGThbATiJqwYC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-03-10 at 12:05 +0100, Yoann Congal via
lists.openembedded.org wrote:
> Those are the patches from the last patch review:
> https://lore.kernel.org/openembedded-core/cover.1772780989.git.yoann.cong=
al@smile.fr/#r
>=20
> Passed a-full on autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3341
>=20
> The following changes since commit 45cba1329d541fdc5857d6df2624b34c91133f=
7a:
>=20
>   build-appliance-image: Update to whinlatter head revisions (2026-02-27 =
17:46:44 +0000)
>=20
> are available in the Git repository at:
>=20
>   https://git.openembedded.org/openembedded-core-contrib stable/whinlatte=
r-next
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
whinlatter-next
>=20
> for you to fetch changes up to cfc0e446a1ad57e710d2c82914211f9bcdc4a752:
>=20
>   python3-urllib3: patch CVE-2025-66471 (2026-03-06 00:48:43 +0100)
>=20
> ----------------------------------------------------------------
>=20
> Adarsh Jagadish Kamini (1):
>   python3-pip: Backport fix CVE-2026-1703
>=20
> Ankur Tyagi (1):
>   wireless-regdb: upgrade 2025.10.07 -> 2026.02.04
>=20
> Antonin Godard (1):
>   python3: skip flaky test_default_timeout test
>=20
> Benjamin Robin (Schneider Electric) (2):
>   avahi: Remove a reference to the rejected CVE-2021-36217
>   lz4: Remove a reference to the rejected CVE-2025-62813
>=20
> Hugo SIMELIERE (2):
>   zlib: Fix CVE-2026-27171
>   harfbuzz: Fix CVE-2026-22693
>=20
> Paul Barker (1):
>   create-pull-request: Keep commit hash to be pulled in cover email
>=20
> Peter Marko (4):
>   linux-yocto: apply cve-exclusions also to rt and tiny recipe variants
>   cve-exclusions: set status for 5 CVEs
>   ffmpeg: set status for CVE-2025-12343
>   python3-urllib3: patch CVE-2025-66471
>=20
> Shaik Moin (1):
>   gdk-pixbuf: Fix CVE-2025-6199
>=20
> Vijay Anusuri (1):
>   gnutls: Fix CVE-2025-14831
>=20
> Yoann Congal (2):
>   README: Add whinlatter subject-prefix to git-send-email suggestion
>   b4-config: add send-prefixes for whinlatter

There are two large CVE patches in this series:

- CVE-2025-66471 has been adequately discussed.

- CVE-2025-14831 was also a patched with a large delta from several
  upstream commits in Ubuntu and in CentOS Stream 10, so we're in line
  with what others are backporting.

So, LGTM.

Best regards,

--=20
Paul Barker


--=-liPP3O2kGThbATiJqwYC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCabAHyxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bj2LAQCwKrvNHysdvBeiA4uodZesxadVXPnIby7/
d7VG4hdpXAEA/BVxOiS9SNRtTENJVfYbE9RsjfblSZGwaNK7lDx5HwY=
=hPqV
-----END PGP SIGNATURE-----

--=-liPP3O2kGThbATiJqwYC--

