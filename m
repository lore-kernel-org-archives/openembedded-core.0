Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E38C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 22:10:43 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.24196.1635631841684080279
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Oct 2021 15:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=Cp7gYcbZ;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635631841;
  x=1667167841;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=o2LPRc2IS9Zk34kj99A3NM2k/7dJ8/6W7wn6A85s2v0=;
  b=Cp7gYcbZl/Gs4/3jZ/F3y7DIr5XdTDiV9z/Dy7BOjhPMVTMZZZWDgSdf
   wA6mtVdbHe5/JlG2g1u16RqUHDwUBww2k4FILTix5NBQbsi2LtpFCD9qF
   hitqqNJIUaZzc+jQWecGZCm//FSBYy8alLVJ99ltZJDZaMSSMMEsQmH2b
   Fbzaugj06b42VNaneZ7pegX5K0wNb6NG3KD9wL0S4wobeGdudwUNFrR9s
   +rm8PqRQTQ7GcHTQdxC/KurnRU9V5QLi0XYY2f7q0etbZClntBUXtHP7/
   eBkQiygx7CHtki6i6bGRmdX5XCiLzoiTJ8omHwsSRvqZF9+MmmCqKMk7B
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [OE-core] [PATCH] wpebackend-fdo: Add -Wno-c++11-narrowing
Thread-Topic: [OE-core] [PATCH] wpebackend-fdo: Add -Wno-c++11-narrowing
Thread-Index: AQHXzcaoubrF1/9SH0u5FhxqIujXj6vsGYmQ
Date: Sat, 30 Oct 2021 22:10:38 +0000
Message-ID: <ac9a683a3c9c4af69b03c878732a5f38@axis.com>
References: <20211030194501.2751905-1-raj.khem@gmail.com>
In-Reply-To: <20211030194501.2751905-1-raj.khem@gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Oct 2021 22:10:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157652

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: den 30 oktober 2021 21:45
> To: openembedded-core@lists.openembedded.org
> Cc: Khem Raj <raj.khem@gmail.com>; lexander Kanavin <alex@linutronix.de>
> Subject: [OE-core] [PATCH] wpebackend-fdo: Add -Wno-c++11-narrowing
>=20
> This commit https://github.com/Igalia/WPEBackend-fdo/commit/e4c578f23359d=
ba4d5abbd14b108f59e1b0701c1
> causes this warning due to int to uint conversion without static casts
> unless its fixes properly by upstream make behaviour same as g++ where
> this is flagged too but only as a warning unlike clang which is pedantic
> and enables it as error
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: lexander Kanavin <alex@linutronix.de>

Typo: lexander -> Alexander

//Peter

> ---
>  meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb b/meta/rec=
ipes-sato/webkit/wpebackend-fdo_1.12.0.bb
> index ba6c54412a..4a18467ea4 100644
> --- a/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb
> +++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb
> @@ -15,6 +15,10 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
>  SRC_URI =3D "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
>  SRC_URI[sha256sum] =3D "6239c9c15523410798d66315de6b491712ab30009ba180f3=
e0dd076d9b0074ac"
>=20
> +# Especially helps compiling with clang which enable this as error when
> +# using c++11
> +CXXFLAGS +=3D "-Wno-c++11-narrowing"
> +
>  # This is a tweak of upstream-version-is-even needed because
>  # ipstream directory contains tarballs for other components as well.
>  UPSTREAM_CHECK_REGEX =3D "wpebackend-fdo-(?P<pver>\d+\.(\d*[02468])+(\.\=
d+)+)\.tar"
> --
> 2.33.1


