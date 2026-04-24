Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B61FE51FB
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 09:54:24 +0000 (UTC)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17524.1777024459333266450
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 02:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=PQQWORNH;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=HsI7kX40;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6A967140006F;
	Fri, 24 Apr 2026 05:54:18 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 24 Apr 2026 05:54:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1777024458; x=1777110858; bh=2icUIpy5oo
	U4ujYsqoDZIUnR8zmUuBxsP29islf5wCo=; b=PQQWORNHvV5TF2Hk7nLohcwxSr
	UpidPJXENShDCHKxB8ff5aIfdj7B+gBRDsBeuBXJgK/WTqQWjI4b8LpNHJAyOmf+
	TjZtOzbaYSbKgoaZYoczjygJoEc1Tm/DvY97n57tqOoKIOqsDKRk0oFZZswhi8g/
	cXmrEJHoY2jqAm1f2hpgnJoHMKonO7SpI234RHv6okHSVlElfanmpwvTot1YYDHn
	X/oMy6XuzNA9OFeqIjbcnBK439+iZ31Afe1OFdeOdmTgCL8wJWLLEt7s05KSHh+3
	rYK4/THFRSdDtBowkO+zhAFr7OnwfU7rmOZ+JxFkn09W8AoBn6L9w+mHE4eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1777024458; x=1777110858; bh=2icUIpy5ooU4ujYsqoDZIUnR8zmUuBxsP29
	islf5wCo=; b=HsI7kX40CHNZAbR6xIZcV4nu6RU22L/lTbwdVAV8iZWTxiKkolf
	NUtPWFP5zfN8HsOgaHtdZrTOvXBUVCIuTikK6he/46fd4uGTrzdGYsWYakqSXa0Z
	OeJfaXIA25VNUgd01XZeuBl7pAAOhgM1SDsv8YYNrBMGJTfFDL7sycs5FJy1M5oO
	0OIz6LRsw3+jRIKHq4iYFRGyCKPk6HFqkJBx4k3W4F5cpNJEGS1jWmnVvHXZ3grk
	6ObXbHKi86tzUcZQZEaRLdz49gZg7mC/fQqhrcoR3AR3JnemsukwkjCOxPKb7iXf
	dzTdR31Yf/FA53IJ3kBiMhDB9rPtemuHQxg==
X-ME-Sender: <xms:yj3raTJx-xwN0W6vCQJaHZJ3a3jRQ6JwUWp5AQGcZLFdpa2RahXL2w>
    <xme:yj3raZv-jSf-_usTWgMIr9Ee6Spo7q-uW-0wE5Uq-QT0SuQiV_NuIB1lG1wBZHAyy
    zrYXE14o8JPZVFXv1YsXoB40HZclLDqdZX0J3J4qRsF9vNd4uuOEQ8>
X-ME-Received: <xmr:yj3rafV-NhILjzgZ-2ASNz7wNF5z6N-rmI87Tg2w35WAe4TaY_sjbt8UmWRmCTOMZtsKOQF37cctAFLdyGffvPg9YnOpn9H4ZHe2kfrJjltn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeileejvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepkffuhffvveffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepjeeggfelgfeggffggfejfeeugfelffegveekhf
    egueefveegkeehveejteejudefnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdpuddurdgssgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepjedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhirggthhgvnhhgrdhshhhisehosh
    hsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdq
    tghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhope
    gumhhithhrhidrsggrrhihshhhkhhovhesohhsshdrqhhurghltghomhhmrdgtohhmpdhr
    tghpthhtohepiihhihdrtghhvghnsehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtph
    htthhopehmihgrohhqihhnghdrphgrnhesohhsshdrqhhurghltghomhhmrdgtohhmpdhr
    tghpthhtohepphgvnhhgfhgvihdriihhrghnghesohhsshdrqhhurghltghomhhmrdgtoh
    hmpdhrtghpthhtohepghgrohhlvgdriihhrghnghesohhsshdrqhhurghltghomhhmrdgt
    ohhm
X-ME-Proxy: <xmx:yj3racjhrERz0azZlJvbCsQMwEjmPG4gv_-D-GgA2opUWX18H15zKA>
    <xmx:yj3rafoBVqaFw4__kl5oMa_gLHF7x_YbAjTgzdRsy-LuP8rc7cDQMQ>
    <xmx:yj3raaEpf8ju-ZUQLhs-sbO5YOTpNGfeWW27jS5oKg9JT7W1pj9IwQ>
    <xmx:yj3rac5b_mQ-fwRBhd_epFPGQpSuqlnCzPquqrx1dhs2zxbfquyvEg>
    <xmx:yj3rabWn47i_VB77h3dzg09F9q3WvGzYSnarO82Pwjkr5h47PsFTq1Hv>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Apr 2026 05:54:17 -0400 (EDT)
Message-ID: <e0a1a2fa3b627a698b46cf3ef645a29bb1e98127.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v2] wpa-supplicant: add patches to support
 RSNE/RSNXE overriding
From: Paul Barker <paul@pbarker.dev>
To: jiacheng.shi@oss.qualcomm.com, openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com, zhi.chen@oss.qualcomm.com, 
	miaoqing.pan@oss.qualcomm.com, pengfei.zhang@oss.qualcomm.com, 
	gaole.zhang@oss.qualcomm.com
Date: Fri, 24 Apr 2026 10:54:14 +0100
In-Reply-To: <20260424093601.1867587-1-jiacheng.shi@oss.qualcomm.com>
References: <20260424093601.1867587-1-jiacheng.shi@oss.qualcomm.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-LTqG3qaXAUAshN3Yq2Wk"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 09:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235854


--=-LTqG3qaXAUAshN3Yq2Wk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-04-24 at 17:36 +0800, Jiacheng Shi via
lists.openembedded.org wrote:
> Add RSN/RSNXE override support in wpa_supplicant to pass Wi-Fi
> certification test FC 5.2.3.3.
>=20
> During the 2EAPMSG exchange, the STA did not apply the SNonce_Cookie
> provided by the AP as required by the test specification, resulting
> in sniffer validation failure.
> To address this, allow RSN/RSNX overriding in STA mode and explicitly
> signal SNonce_Cookie=E2=80=93based override capability.
>=20
> Signed-off-by: Jiacheng Shi <jiacheng.shi@oss.qualcomm.com>
> ---
> v2:
>  * Change commit message=20
>=20
>  ...r-specific-element-types-for-RSNE-RS.patch |  34 +
>  ...-overriding-elements-into-IE-parsing.patch |  58 ++
>  ...ide-element-to-override-RSNE-content.patch |  36 +
>  ...ride-element-to-override-RSNXE-conte.patch |  36 +
>  ...eature-flags-to-indicate-RSN-overrid.patch |  67 ++
>  ...a-capability-flag-for-RSN-overriding.patch |  65 ++
>  ...ions-to-access-RSNE-RSNXE-from-BSS-e.patch | 448 +++++++++++
>  ...bilities-for-AKM-suites-available-wi.patch |  66 ++
>  .../0013-RSNE-RSNXE-overriding-for-STA.patch  | 739 ++++++++++++++++++
>  ...-Selection-element-to-indicate-which.patch | 415 ++++++++++
>  ...cookie-to-indicate-support-for-RSN-o.patch |  84 ++
>  .../wpa-supplicant/wpa-supplicant_2.11.bb     |  11 +
>  12 files changed, 2059 insertions(+)
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0005-Define-WFA-vendor-specific-element-types-for-RSNE-RS.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0006-Add-RSN-overriding-elements-into-IE-parsing.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0007-Allow-RSNE-Override-element-to-override-RSNE-content.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0008-Allow-RSNXE-Override-element-to-override-RSNXE-conte.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0009-Add-QCA-vendor-feature-flags-to-indicate-RSN-overrid.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0010-nl80211-Add-a-capability-flag-for-RSN-overriding.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0011-Use-helper-functions-to-access-RSNE-RSNXE-from-BSS-e.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0012-Make-driver-capabilities-for-AKM-suites-available-wi.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0013-RSNE-RSNXE-overriding-for-STA.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0014-RSNO-Use-the-RSN-Selection-element-to-indicate-which.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0015-RSNO-Use-SNonce-cookie-to-indicate-support-for-RSN-o.patch

Hi,

This is a lot to backport for a new feature. Have you tried asking
upstream for a new release? That would be a better path forward if they
have important new features in their development branch.

Thanks,

--=20
Paul Barker


--=-LTqG3qaXAUAshN3Yq2Wk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaes9xhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bjWMAQCKugEnss2Tc3jwt2YbnvDAKiJjFa4rwzeH
aljnqsxQpAD7B5XondZGVCPy8CojjjmCpCm2OJtaStXg3hiunT8ZWw8=
=xWpa
-----END PGP SIGNATURE-----

--=-LTqG3qaXAUAshN3Yq2Wk--

