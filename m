Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71AAC46CD2
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 23:46:08 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.195707.1703979967415612461
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Dec 2023 15:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A77jX3sN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40d76923ec4so15736445e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 15:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703979966; x=1704584766; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6u35YxxRHd1upUdvYzPh0sFzw7JGVy0W7RkuBZAa4Q=;
        b=A77jX3sN2twgJLKMLiCHPNdfHRTioRwa6DcVuAKGCpCrk+bpYGj6WxhgfhwoHseb3A
         0V9mz9WtrZJ+OKoLBKXBaGVLt/dm+oxBk+0OE1Ukw24T7styCsD26nBBYRuTYRlN45IJ
         Yo3pKEIC2qvWUpOYP7rwkXEE3/jSd+PHBzlvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703979966; x=1704584766;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X6u35YxxRHd1upUdvYzPh0sFzw7JGVy0W7RkuBZAa4Q=;
        b=SiEaEXScU2m6UtowKuarNpfziQGSsIObQaxRWoS9DFOSEjGwb8+9M0oWCZBSFqEYFh
         H4p/+dAtMVlsUbWplguqXRD8It6F7PXn5sslkMX7tPNKKJijVeNTKOSikFcTyr2X4+Zt
         UHKsvwESKNhUZ5Zew6l64FluRanAsAYY3N2K4rQh86xT6Zd/EaZErIR0xrj0DYzRMATU
         vo+/xe9k+RLApVHgJxyaDBs90+wL/Go2leg92Bx+9oWwpVdgaIdJLsWVwy/+5Dcz1ai1
         J9PzVdDC9QnwPRFWVxh6M+gp7/E2XX2ra2X9EtDdxaglxNR0F2OmPpW4kxCBc1rpg2Pi
         0kAg==
X-Gm-Message-State: AOJu0YwHc+Iosk74eq7YPka0zHqcioS7O2URPiZbSoO9kTBfs7S6Gape
	9UM4lQzIMH6eo26RkNUjopsRmkSSsQDBCw==
X-Google-Smtp-Source: AGHT+IE7FLT8Wa0GNeHA9YPUDVwUDYGG9pzgCJQmQGaBV/puK+vSjtqyAGqcDs62/prz6qNY2v9G7Q==
X-Received: by 2002:a05:600c:1c93:b0:40d:3571:cc13 with SMTP id k19-20020a05600c1c9300b0040d3571cc13mr8394240wms.9.1703979965556;
        Sat, 30 Dec 2023 15:46:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cec3:25e9:1e4c:7e1c? ([2001:8b0:aba:5f3c:cec3:25e9:1e4c:7e1c])
        by smtp.gmail.com with ESMTPSA id fc20-20020a05600c525400b0040d6e07a147sm9675099wmb.23.2023.12.30.15.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 15:46:04 -0800 (PST)
Message-ID: <89ac05ec59331d8856842685bd673a75a2d812c2.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH 3/4] cargo: Move vendor directory to
 registry/src
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 30 Dec 2023 23:46:03 +0000
In-Reply-To: <20231230154953.8135-3-alex.kiernan@gmail.com>
References: <20231230154953.8135-1-alex.kiernan@gmail.com>
	 <20231230154953.8135-3-alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 23:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193085

On Sat, 2023-12-30 at 15:49 +0000, Alex Kiernan wrote:
> rust 1.75 has an assumption from 85c0ce24cc74 ("remap cargo dependencies
> to /rust/deps") that unpacked crates (vendored or otherwise)
> are found in .../registry/src (usually in ~/.cargo). Moving our vendor
> directory to match is the easiest workaround to avoid the upstream
> assumption causing issues.
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> This requires the concomitant change in bitbake to use
> CARGO_VENDORING_DIRECTORY for unpacking crates into.
>=20
>  meta/classes-recipe/cargo_common.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-reci=
pe/cargo_common.bbclass
> index e932ada862bd..3cb21cfddcb6 100644
> --- a/meta/classes-recipe/cargo_common.bbclass
> +++ b/meta/classes-recipe/cargo_common.bbclass
> @@ -31,7 +31,7 @@ export PKG_CONFIG_ALLOW_CROSS =3D "1"
>  CARGO_DISABLE_BITBAKE_VENDORING ??=3D "0"
> =20
>  # Used by libstd-rs to point to the vendor dir included in rustc src
> -CARGO_VENDORING_DIRECTORY ??=3D "${CARGO_HOME}/bitbake"
> +CARGO_VENDORING_DIRECTORY ??=3D "${CARGO_HOME}/registry/src"
> =20
>  # The directory of the Cargo.toml relative to the root directory, per de=
fault
>  # assume there's a Cargo.toml directly in the root directory

I think the patchdir in SRC_URI of the librsvg recipe needs updating to
match that else you see:

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/8232/step=
s/11/logs/stdio

Cheers,

Richard

