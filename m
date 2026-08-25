Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26CAC5DF94
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 06:30:05 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16024.1787639401199533280
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 23:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DVMl4dxE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954df200ddso23639535e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 23:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787639399; x=1788244199; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=24Zr29ofQsaJe/fx8sMa+mhgU5UaBfXYfPFm69Y54co=;
        b=DVMl4dxEt8d4XYXRg55nda80jD4QiJlcHb7GXCKKkuoiGDU3frdsIttJPiGDGL6Ax6
         t482CuKQwRMPKXu2qH9TeN60VPPxTsW1Cwn0QafIxM9sSm1UE12UAc1GOcbpy/jckLPJ
         Eif9NKQsxDRPIORy+SgSdFCDjfNJcUL64EVe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787639399; x=1788244199;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24Zr29ofQsaJe/fx8sMa+mhgU5UaBfXYfPFm69Y54co=;
        b=aeFSAHuEQV1XkBl1cGzZCoKxsjE0eyyxTH4P6YvitAcFX9tpjO0wnJTAcbKWCglgA1
         fJ+vVLmY8ypKpXgO3MDQz5aBW5Zg1xBeiMZA9NJwz6j993HjaZXp14vYzboS0EsYc2ci
         xGXhrYe7JQQTGLxSkBXeLxp16ej7jnF5hXO2vBY++cuxKwBRs5dFCTKJyEDINfgKXpR9
         +K4IIaUQSBYCuhmtL5Bey031XULoJ0puUw/LNCbJ15M54p+580zTM6rwxXDYp10460Ht
         GH7ANYadkuyDJLGrOoaawvX3HwOHpVFHKDQTnyHEskYQ0Xj7GwdJbivgCUP/knUklxC7
         n9gA==
X-Forwarded-Encrypted: i=1; AHgh+RqgIyWHxVFyW5TnURSmkl+HEN4kRUB+idrchMVMn6YSa/dDf5fgCgL7GZB2oeB08If+VcMq/nAiGhmhtPwN2BXYgQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++kTavjKl6YEYBPcbdroGKRa5P6TW6gO75l0ZP7Hv3J1klqvKfzA
	ueFTMkwb30Kbre7d0nJ2+VwDlTNt7vXlktElqEAbjwG1RMvxN9Y0+EOYnM4r7sSYK/k=
X-Gm-Gg: AR+sD10n86YvVkbB56M1ouSJfxhrQ3+NFoztWIp9lDx/SJeH6tmqZp0YKEnaD6nIKTI
	NJ5LGZ1OrA03hPvtVdVcCldjGCQCMwfufleLB4vBrbISPpv9TAL047vRY8mAeE6QStAnLHrRQa/
	bzwIjTzil2OnRbXshP1Ofp1+xrpcjqMeCAKMK5Jhov4ihvApAt5hfgXSzuYDUzwbdcirmXGILWe
	2ZAKgVJ6QoANFeiaFkpbF3aY96a6bv+/d72lQd0E43vY0NjIwaFrJhtF+2MzNDAYKydgdRDzvG8
	eoAY5HevEvGhzDjj6TqfbGm8FfDOkc/gnzn5T7ylfqslXFHoVrqSgnf2rrdFLZscGpUxaMAGFDj
	OM1U9cqYQgQ93bdYWSrdJn7Pwj9iFLIoOtsrJjurDQTmFNyprXRmZNQDb7nZE4ol8mYsrw5qDL4
	Oq/Kb7P3FTvIsns2WBt+WTNxN3i50ftZFw8+38/fYaOq60ktkDZleDP1mdetQHdZkL2mMTpdK+8
	g7VbDn97i2B5a3UytseLXu9vZWA9pZMxglMkvUN7Kb9rDuAdKXzFQ==
X-Received: by 2002:a05:600c:8705:b0:499:8758:8cb4 with SMTP id 5b1f17b1804b1-499c19c6f63mr279437795e9.5.1787639399337;
        Mon, 24 Aug 2026 23:29:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1d9d:dbf1:7ccf:7617? ([2001:8b0:aba:5f3c:1d9d:dbf1:7ccf:7617])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499d83040b0sm8837495e9.15.2026.08.24.23.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:29:57 -0700 (PDT)
Message-ID: <ed480f0c689e6f49c7f71306a55ec328a74d68ec.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v17 10/14] libarchive: Disable RPM filter
 auto-bidding and update huge_rpm test
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sumanth.gavini@windriver.com, openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com, 
	mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com, 
	randy.macleod@windriver.com
Date: Tue, 25 Aug 2026 07:29:54 +0100
In-Reply-To: <20260825013312.2695028-11-sumanth.gavini@windriver.com>
References: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
	 <20260825013312.2695028-11-sumanth.gavini@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244203

On Mon, 2026-08-24 at 18:33 -0700, Sumanth Gavini via lists.openembedded.or=
g wrote:
> =C2=A0* Add 0005-Disable-RPM-filter-auto-bidding.patch:
> =C2=A0=C2=A0 - RPM is now handled by the format reader. Disable the filte=
r's automatic
> =C2=A0=C2=A0=C2=A0=C2=A0 bidding (return 0) so it never intercepts RPM fi=
les during normal
> =C2=A0=C2=A0=C2=A0=C2=A0 archive opening. The filter remains functional w=
hen explicitly requested
> =C2=A0=C2=A0=C2=A0=C2=A0 via archive_read_append_filter(ARCHIVE_FILTER_RP=
M).
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 This ensures debuginfod and other tools that use
> =C2=A0=C2=A0=C2=A0=C2=A0 archive_read_support_format_all() will use the n=
ew RPM format reader
> =C2=A0=C2=A0=C2=A0=C2=A0 for RPM 6 packages, while maintaining API compat=
ibility.
>=20
> =C2=A0* Update 0004-Convert-RPM-reader-into-a-proper-format.patch:
> =C2=A0=C2=A0 - Include the test_read_format_huge_rpm.c changes from upstr=
eam PR #2846.
> =C2=A0=C2=A0=C2=A0=C2=A0 With the filter no longer auto-bidding, the form=
at reader handles the
> =C2=A0=C2=A0=C2=A0=C2=A0 truncated test RPM: opens successfully (ARCHIVE_=
OK), returns ARCHIVE_EOF
> =C2=A0=C2=A0=C2=A0=C2=A0 on next_header, and identifies the format as ARC=
HIVE_FORMAT_RPM.
>=20
> Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
> ---
> =C2=A0.../meta/nativesdk-sdk-provides-dummy.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 -
> =C2=A0.../recipes-devtools/pkgconf/pkgconf_3.0.6.bb |=C2=A0 2 +-
> =C2=A0...vert-RPM-reader-into-a-proper-format.patch | 42 ++++++++++-
> =C2=A0...0005-Disable-RPM-filter-auto-bidding.patch | 73 ++++++++++++++++=
+++
> =C2=A0.../libarchive/libarchive_3.8.9.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A05 files changed, 116 insertions(+), 3 deletions(-)
> =C2=A0create mode 100644 meta/recipes-extended/libarchive/libarchive/0005=
-Disable-RPM-filter-auto-bidding.patch
>=20
> diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/met=
a/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
> index 6075770bf0..37dad54409 100644
> --- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
> +++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
> @@ -11,7 +11,6 @@ DUMMYPROVIDES =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 /bin/sh \
> =C2=A0=C2=A0=C2=A0=C2=A0 /bin/bash \
> =C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/env \
> -=C2=A0=C2=A0=C2=A0 /usr/bin/pkg-config \
> =C2=A0=C2=A0=C2=A0=C2=A0 libGL.so()(64bit) \
> =C2=A0=C2=A0=C2=A0=C2=A0 libGL.so \
> =C2=A0"
> diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb b/meta/recipe=
s-devtools/pkgconf/pkgconf_3.0.6.bb
> index 471433e7b5..0249c87878 100644
> --- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
> +++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
> @@ -7,7 +7,7 @@ HOMEPAGE =3D "http://pkgconf.org"
> =C2=A0BUGTRACKER =3D "https://github.com/pkgconf/pkgconf/issues"
> =C2=A0SECTION =3D "devel"
> =C2=A0PROVIDES +=3D "pkgconfig"
> -RPROVIDES:${PN} +=3D "pkgconfig"
> +RPROVIDES:${PN} +=3D "pkgconfig /usr/bin/pkg-config"
> =C2=A0
> =C2=A0# The pkgconf license seems to be functionally equivalent to BSD-2-=
Clause or
> =C2=A0# ISC, but has different wording, so needs its own name.

Thanks, the series is getting close. The two changes above are not part
of libarchive though? Should they be part of a different patch?

Cheers,

Richard

