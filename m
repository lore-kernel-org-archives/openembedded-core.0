Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EC9E9A047
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 11:58:41 +0000 (UTC)
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10511.1771415916323374827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 03:58:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=AMQl1Gfd;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=aoSSTn8J;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 8B0631D001A0;
	Wed, 18 Feb 2026 06:58:35 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 18 Feb 2026 06:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1771415915; x=1771502315; bh=PlvwLLa2ZE
	A5dxAmFz5eDSi0aN+uRd2PGdESo7bEeyI=; b=AMQl1GfdhlIDMmu0zmLRM8ncIU
	ZIBLi9tRRm/OBL6ka51WgXqJdRtDmIBJqvvKnYwbC14jFsNN+wH+r+fBt8wBm38y
	n8hZSzgy8FBrR4+DeDpD1d7+y5QC0zZI8Vql9xELQSaVT/+2zG0He6IuYIZavP29
	e3OlwqISn/XE8iBKvWbitEwI9uEz3RnQIaBRJT1e6n6UsUKa4kZq5CO3CyOBzByl
	zWGmHqQ3bLb496b4Qc2Gl43aAv8LSDEC+SNQy0b16kcnDUDZmiQEXznQuDKDy8aL
	9nFFXjRbov2OhU5mY1xGw+uXUebkMOHZJLqs52KNy77vaLWkAXQ5fuN7I/9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771415915; x=1771502315; bh=PlvwLLa2ZEA5dxAmFz5eDSi0aN+uRd2PGdE
	So7bEeyI=; b=aoSSTn8JlhwM5Ioinbuz2EVAiTSq7ZP3ywOTCJMe3ylEpFVMaCI
	kIjHrdeDVrq2/y/UTTf4h5NZQMKD9pBeM+ohx1h+4QF3bCFkTOUoY9rWSk770Dyy
	iZIxOBlOfS1s9GUe9l1IDc6UAnJPFJHWWWIaWUHEyIbm6knGqquvNxkLx3vfgppE
	iTiRjTiZGmqbksrOj+S4npJ9EgwadAXIECsx2CStRP6wvHcS1tVR/ggjGMS8FwkI
	XXgJthTyT34wstuO7YDKR45FRsGTaxj3YbE03KHZKAF9xPNbC5dgUskv94Y7/M+H
	cbw6TIxZ2Pk0bedfA7LwZhJ5w8vT0vhfuJw==
X-ME-Sender: <xms:aqmVaXRlt4nvMkF5Nk7DutHbnBERxF8KEKnD57lEWP3GuK8LMPxKfA>
    <xme:aqmVaQNi_jhCX0ZYxoWWDm_tDY1I3dgWUQnbnBZ9Ou5x9f95_-4s6wLizY6781To3
    GMNqYreB1II_rvh82wfySghNV2drABnNFXZ65ko5E95O0eShxuHW4A>
X-ME-Received: <xmr:aqmVaaN1oPlvjcGcs5RB0IefQHOJaNFKaq7A-v6tTRYFcqOFiuFGVXRgyF40RV7LPrcve0riFTuTryO1wqVc55VuPa2bdKrS6gBA7PhMgBQE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvddvheekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    eiteefhfdvteefteefuddvgfdvhfeitdevueefueegffevffffkefgfeevvdefteenucff
    ohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhkvghrnhgvlhdrohhrghdphi
    hotghtohhprhhojhgvtghtrdhorhhgpdduvddrsggspdifvggskhhithdrohhrghenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesph
    gsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohephihorghnnhdrtghonhhgrghlsehsmhhilhgvrdhfrhdprhgtphhtth
    hopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvggu
    uggvugdrohhrghdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugi
    hfohhunhgurghtihhonhdrohhrgh
X-ME-Proxy: <xmx:aqmVaQsMESicQ6Rk3BPZJduo-mPZAMkizXZdAZ0qSIxQxtpHruA8jg>
    <xmx:aqmVaUV-mW5zX3WB-I5f15V9LgSmap94w3npE877UO4tfxOTOI409A>
    <xmx:aqmVaYtC-kaSdsxXTqFjOlbRx50zOasuNxXVHScb1fDsjLojhyWzcQ>
    <xmx:aqmVaQVBTmAj56y1q4P3SMECk6611sTHt_6BN0vILGPOZLiKvyv2Ug>
    <xmx:a6mVac1r8GVaS26MWeFKRe0hnyhTtFLCL7mC-RmW1a6psbNx4zIXWoJD>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Feb 2026 06:58:34 -0500 (EST)
Message-ID: <a6ff2517a153a9d771838fe2baff048527a2cfcc.camel@pbarker.dev>
Subject: Re: [OE-core][whinlatter 00/20] Pull request (cover letter only)
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org, Richard
 Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 18 Feb 2026 11:58:31 +0000
In-Reply-To: <cover.1771322143.git.yoann.congal@smile.fr>
References: <cover.1771322143.git.yoann.congal@smile.fr>
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
	protocol="application/pgp-signature"; boundary="=-bBzkVixI1v1gmcTI+Lzz"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 11:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231294


--=-bBzkVixI1v1gmcTI+Lzz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-02-17 at 11:24 +0100, Yoann Congal via
lists.openembedded.org wrote:
> Those are the patches from the last patch review:
> https://lore.kernel.org/openembedded-core/cover.1770968514.git.yoann.cong=
al@smile.fr/T/#t
> with backported "pseudo: Update to include an openat2 fix" to fix #16143
> (AB-INT: do_image_wic: tar command return exit status 2)
>=20
> Passed a-full on autobuilder (with errors):
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3229
> * meta-intel failed with #16172 =E2=80=93 intel-media-driver: ninja: posi=
x_spawn: Argument list too long
>   * This failure is independent of this patch series.
> * oe-selftest-fedora failed on a temporary github glitch (502 Bad Gateway=
 or Proxy Error)
>   * https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/3=
104
>   * Successfully retried in https://autobuilder.yoctoproject.org/valkyrie=
/?#/builders/48/builds/3106

Both of the above look ok to me, they shouldn't block this merge.

The following changes since commit 000a044d285d93ded3280f27360165c943bb5d7e=
:

  inetutils: patch CVE-2026-24061 (2026-02-10 21:15:17 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib pbarker/whinlatter

for you to fetch changes up to 4ce61fbd915b3c78461d04194b3405e4d8e98e63:

  pseudo: Update to include an openat2 fix (2026-02-17 15:21:33 +0000)

----------------------------------------------------------------
Adarsh Jagadish Kamini (1):
      avahi: Backport fix CVE-2025-68276

Aleksandar Nikolic (1):
      scripts/install-buildtools: Update to 5.3.1

Amaury Couderc (2):
      avahi: patch CVE-2025-68468
      avahi: patch CVE-2025-68471

Ankur Tyagi (3):
      mobile-broadband-provider-info: upgrade 20250613 -> 20251101
      avahi: patch CVE-2026-24401
      vim: ignore CVE-2025-66476

Bruce Ashfield (2):
      linux-yocto/6.12: update to v6.12.69
      linux-yocto/6.12: update CVE exclusions (6.12.69)

Dragomir, Daniel (2):
      wic/engine: fix copying directories into wic image with ext* partitio=
n
      oeqa/selftest/wic: test recursive dir copy on ext partitions

Hongxu Jia (2):
      webkitgtk: workaround compile failure for large debug symbols
      webkitgtk: upgrade 2.50.0 -> 2.50.4

Paul Barker (2):
      devtool: deploy: Run pseudo with correct PATH
      devtool: deploy: Reset PATH after strip_execs

Peter Marko (4):
      openssl: upgrade 3.5.4 -> 3.5.5
      ffmpeg: ignore 10 CVEs
      libsndfile1: patch CVE-2025-56226
      go: upgrade 1.25.6 -> 1.25.7

Richard Purdie (1):
      pseudo: Update to include an openat2 fix

 meta/conf/distro/include/yocto-space-optimize.inc  |     3 -
 meta/lib/oeqa/selftest/cases/wic.py                |    65 +
 meta/recipes-connectivity/avahi/avahi_0.8.bb       |     4 +
 .../avahi/files/CVE-2025-68276.patch               |    68 +
 .../avahi/files/CVE-2025-68468.patch               |    32 +
 .../avahi/files/CVE-2025-68471.patch               |    36 +
 .../avahi/files/CVE-2026-24401.patch               |    74 +
 ... =3D> mobile-broadband-provider-info_20251101.bb} |     2 +-
 ...ndshake-history-reporting-when-test-fails.patch |    23 +-
 .../0001-extend-check_cwm-test-timeout.patch       |     2 +-
 .../openssl/{openssl_3.5.4.bb =3D> openssl_3.5.5.bb} |     2 +-
 .../go/{go-1.25.6.inc =3D> go-1.25.7.inc}            |     2 +-
 ...native_1.25.6.bb =3D> go-binary-native_1.25.7.bb} |     6 +-
 ...adian_1.25.6.bb =3D> go-cross-canadian_1.25.7.bb} |     0
 .../go/{go-cross_1.25.6.bb =3D> go-cross_1.25.7.bb}  |     0
 ...go-crosssdk_1.25.6.bb =3D> go-crosssdk_1.25.7.bb} |     0
 .../{go-runtime_1.25.6.bb =3D> go-runtime_1.25.7.bb} |     0
 .../go/{go_1.25.6.bb =3D> go_1.25.7.bb}              |     0
 meta/recipes-devtools/pseudo/pseudo_git.bb         |     2 +-
 meta/recipes-kernel/linux/cve-exclusion_6.12.inc   | 13004 +++++++++++----=
----
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   |     6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb |     6 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      |    28 +-
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb       |     7 +
 .../libsndfile/libsndfile1/CVE-2025-56226-01.patch |    36 +
 .../libsndfile/libsndfile1/CVE-2025-56226-02.patch |    43 +
 .../libsndfile/libsndfile1_1.2.2.bb                |     2 +
 ...-variable-to-control-macro-__PAS_ALWAYS_I.patch |     8 +-
 ...Introspection.cmake-prefix-variables-obta.patch |     2 +-
 ...rrors-on-RISCV-https-bugs.webkit.org-show.patch |     4 +-
 .../webkit/webkitgtk/fix-ftbfs-riscv64.patch       |    24 +-
 .../webkit/webkitgtk/fix-musl-compilation.patch    |    94 -
 ...nstanceof_handler_for_32-bit_C-loop_build.patch |   122 -
 .../webkit/webkitgtk/reproducibility.patch         |     2 +-
 meta/recipes-sato/webkit/webkitgtk/sys_futex.patch |    11 +-
 .../webkit/webkitgtk/t6-not-declared.patch         |     6 +-
 .../{webkitgtk_2.50.0.bb =3D> webkitgtk_2.50.4.bb}   |    15 +-
 meta/recipes-support/vim/vim_9.1.bb                |     2 +
 scripts/install-buildtools                         |     4 +-
 scripts/lib/devtool/__init__.py                    |     3 +-
 scripts/lib/devtool/deploy.py                      |     9 +-
 scripts/lib/wic/engine.py                          |    63 +-
 42 files changed, 8391 insertions(+), 5431 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68276.pa=
tch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68468.pa=
tch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68471.pa=
tch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-24401.pa=
tch
 rename meta/recipes-connectivity/mobile-broadband-provider-info/{mobile-br=
oadband-provider-info_20250613.bb =3D> mobile-broadband-provider-info_20251=
101.bb} (91%)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.4.bb =3D> openssl_3.=
5.5.bb} (99%)
 rename meta/recipes-devtools/go/{go-1.25.6.inc =3D> go-1.25.7.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.6.bb =3D> go-binary=
-native_1.25.7.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.6.bb =3D> go-cross=
-canadian_1.25.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.6.bb =3D> go-cross_1.25.7.b=
b} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.6.bb =3D> go-crosssdk_1.=
25.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.6.bb =3D> go-runtime_1.25=
.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.6.bb =3D> go_1.25.7.bb} (100%)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025=
-56226-01.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025=
-56226-02.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation=
.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix_op_instanceof_ha=
ndler_for_32-bit_C-loop_build.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.50.0.bb =3D> webkitgtk_2.50.4=
.bb} (93%)

Best regards,

--=20
Paul Barker


--=-bBzkVixI1v1gmcTI+Lzz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaZWpZxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bvdGAQDW83hZBhiveQ8jJa+0RPnTY1gczir2OL53
CGjogeHGtwD+IH1k8FFnwoCsvAxWDrVbm5HV4mIpFnIy6YAhybaMgAk=
=2BB8
-----END PGP SIGNATURE-----

--=-bBzkVixI1v1gmcTI+Lzz--

