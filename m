Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2BCE67816
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 22:55:32 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.26697.1730588123142704131
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Nov 2024 15:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GL6UmXsd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43163667f0eso25115085e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 15:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730588121; x=1731192921; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SkE7TAoALKGKy8fqyPs4HMkLcFBIwIghdI1BWOAtWzE=;
        b=GL6UmXsdXtX3ZLHX/7Wi56cA3ulvpxaV12StCUhHqNQES8Jq6dHuvvD+EojBTHO3C/
         7FwmygZ0chxpyB6Xj0UP4YyTVDfchBb9SrRgjgbt2kKN7NtsgLxTLD+8gXRcagfamJ7c
         mR0OzpbqfEdpxt6DtdA1RhMQwf9htDejRXVN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730588121; x=1731192921;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SkE7TAoALKGKy8fqyPs4HMkLcFBIwIghdI1BWOAtWzE=;
        b=jU7dQAvnhBm9pJ5XWH2R8skphodxysnO5HLO8kRZrpJCDtN3h7BYtB8mE9EQeMV4de
         1K+H4EhozwafAbf/Bhch1xq1YnZ2aSvJmHnlDXD+OBeDLDA/V194Eccy6xAd6PVQVj6s
         naQ8EDo8gZbJEKwl5XOKwbSq3VjTQZO2QRUMP9fjFY/CaLxocHPlJTc2BwGzWCcYJ/PI
         LyDE+YDWjTyeoHiysEb9xMD6eXGcXMMvk4lDBScndKn3v5Az9BD2ApsSFXEUspniW4im
         mCdkjeS5+XVpXzPPQ8tr5iOWNIhcWGsfLs3v016XqgWw3Xv7wP9Hcqzdm6f32fBivN2n
         Wniw==
X-Forwarded-Encrypted: i=1; AJvYcCWBUPJ6hcThOy+gs8kGZmDCZNcc6uQE8kzxioDX6P7jpCP6x0NEaSv/QzBEGMbCRfAfnP5tCAPP0zpQT3I1X0xmLQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywr9C0+1h0H7D/hlXfFhwmb3e/pdhQ9TsQukuXt/xNbRGmALaen
	+SddUAiFGLaWOZaDYwuEhjoGLy2/A/rlDKaka5jWE4KEnVBiclYKF92fVuVv9yI=
X-Google-Smtp-Source: AGHT+IHaTN6WhZ5jmfSJKiybhudogaPWmV1NGnyqBG2TfCTgjPS+u2/0pJXPSwKngUSia6Z0UilZyA==
X-Received: by 2002:a05:600c:54c8:b0:431:5bb1:f088 with SMTP id 5b1f17b1804b1-43285649f9cmr59638405e9.29.1730588121225;
        Sat, 02 Nov 2024 15:55:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cdf4:f032:bd3a:44d7? ([2001:8b0:aba:5f3c:cdf4:f032:bd3a:44d7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca747sm137012755e9.45.2024.11.02.15.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 15:55:20 -0700 (PDT)
Message-ID: <d8961217f36bad0aa1d687a520f9ce389eefecd7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] busybox: Backport a patch to build with
 CONFIG_SHA1_HWACCEL on non-x86
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Date: Sat, 02 Nov 2024 22:55:20 +0000
In-Reply-To: <20241102203910.1267120-1-pkj@axis.com>
References: <20241102203910.1267120-1-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 22:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206659

On Sat, 2024-11-02 at 21:39 +0100, Peter Kjellerstedt via lists.openembedde=
d.org wrote:
> This allows CONFIG_SHA1_HWACCEL to be enabled regardless of the
> architecture.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
> =C2=A0...sha1-on-x86-if-CONFIG_SHA1_HWACCEL-y.patch | 33 ++++++++++++++++=
+++
> =C2=A0meta/recipes-core/busybox/busybox_1.37.0.bb=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A02 files changed, 34 insertions(+)
> =C2=A0create mode 100644 meta/recipes-core/busybox/busybox/0001-libbb-fix=
-sha1-on-x86-if-CONFIG_SHA1_HWACCEL-y.patch
>=20
> diff --git a/meta/recipes-core/busybox/busybox/0001-libbb-fix-sha1-on-x86=
-if-CONFIG_SHA1_HWACCEL-y.patch b/meta/recipes-core/busybox/busybox/0001-li=
bbb-fix-sha1-on-x86-if-CONFIG_SHA1_HWACCEL-y.patch
> new file mode 100644
> index 0000000000..2af188938e
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/0001-libbb-fix-sha1-on-x86-if-CON=
FIG_SHA1_HWACCEL-y.patch
> @@ -0,0 +1,33 @@
> +From bf57f732a5b6842f6fa3e0f90385f039e5d6a92c Mon Sep 17 00:00:00 2001
> +From: Rudi Heitbaum <rudi@heitbaum.com>
> +Date: Sun, 29 Sep 2024 17:57:55 +0000
> +Subject: [PATCH] libbb: fix sha1 on !x86 if CONFIG_SHA1_HWACCEL=3Dy
> +
> +fixes non i386 and x86 builds
> +
> +libbb/hash_md5_sha.c: In function 'sha1_end':
> +libbb/hash_md5_sha.c:1316:35: error: 'sha1_process_block64_shaNI' undecl=
ared
> + 1316 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 || ctx->pr=
ocess_block =3D=3D sha1_process_block64_shaNI
> +
> +Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3D=
bf57f732a5b6842f6fa3e0f90385f039e5d6a92c]
> +Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +---
> + libbb/hash_md5_sha.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/libbb/hash_md5_sha.c b/libbb/hash_md5_sha.c
> +index 57a801459..75a61c32c 100644
> +--- a/libbb/hash_md5_sha.c
> ++++ b/libbb/hash_md5_sha.c
> +@@ -1313,7 +1313,9 @@ unsigned FAST_FUNC sha1_end(sha1_ctx_t *ctx, void =
*resbuf)
> +=C2=A0	hash_size =3D 8;
> +=C2=A0	if (ctx->process_block =3D=3D sha1_process_block64
> + #if ENABLE_SHA1_HWACCEL
> ++# if defined(__GNUC__) && (defined(__i386__) || defined(__x86_64__))
> +=C2=A0	 || ctx->process_block =3D=3D sha1_process_block64_shaNI
> ++# endif
> + #endif
> +=C2=A0	) {
> +=C2=A0		hash_size =3D 5;
> diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-c=
ore/busybox/busybox_1.37.0.bb
> index c3131eb453..3aae6eff4d 100644
> --- a/meta/recipes-core/busybox/busybox_1.37.0.bb
> +++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
> @@ -53,6 +53,7 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV=
}.tar.bz2;name=3Dtarball=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0001-syslogd-fix-wrong-OPT_locallog-flag-detection.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0002-start-stop-daemon-fix-tests.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0003-start-stop-false.patch=C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001=
-libbb-fix-sha1-on-x86-if-CONFIG_SHA1_HWACCEL-y.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> =C2=A0SRC_URI:append:libc-musl =3D " file://musl.cfg"
> =C2=A0SRC_URI:append:x86-64 =3D " file://sha_accel.cfg"

Looks like musl doesn't like this:

https://valkyrie.yoctoproject.org/#/builders/6/builds/368/steps/11/logs/std=
io

Cheers,

Richard


