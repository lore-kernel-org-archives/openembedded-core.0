Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53088C5B549
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 21:41:38 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.7210.1748900488748360532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 14:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AQ3LHHvA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a0ac853894so4662914f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 14:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748900487; x=1749505287; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5sDLEev/qe2YUVFEppQQlNgy6hpeWsQtogWk8xooVM=;
        b=AQ3LHHvAdWiFbfuZ2/PBmF6jQdYfJriZsLLxs5QVqbQk7sgGHA4h75UkOdE2805LUP
         RCEaALOD9FByeq56bZROtUa8uWtyBa/iisH5Q400ZczslPIY/Cswm3a9fhCcsjgrN9Az
         M4tuQYwcVP9uyFEd5Vu6pqnW/6Kuis+YRVAoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748900487; x=1749505287;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e5sDLEev/qe2YUVFEppQQlNgy6hpeWsQtogWk8xooVM=;
        b=AfRFEnqUXfo40+8pI6oayx4fpiqD5TkDfZ6CuacqRcIxjUNVo61RLpchME1eOBnYYI
         6xdHXjzfY+37LpKInRXa1gM3oOq8KqJC6Lh2sSAnbA6ekZZ5IGt1mOpvJvLMBA9OYFwK
         fIM7UlKjz+eTR/sL5WDHH/9jDk3G5E7bXkp8DJcTHBWyqbDtk0b/HNQxINexg2f4EAMw
         +pDb/wC8UmDX5Gi+TS7syZ8gz9E9FYwd9J+HzC6bhrQpKSlyGS6Hiw2x4fv0XSkpIp1R
         Sv5x5cnj81hZAfNRmWpbmeqAx/hsG9PpALkaVHD1AmfwEBKNV4EUJsZFd9gZuoKxvkzD
         mdZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAaJe9FJaXO4Cm8PIUFMyYCO9hmLA+5SIOt0B+cotdgEIpxEx7x62I31GNTdmDu30cWVgBlTJ9HMk7ODhiahwqiQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw+IAVjYHUOEGuKOGM8szqcXgU9ihnkH7771N1REmLo/IAeIF83
	bhqG7OOm8MzVa7SB20LdGAeaVSiDD8uWxBzrJTtTG3jYT7XZbLosP9/yd3mPDnYe+CqLeRT8by3
	1i5gEhhc=
X-Gm-Gg: ASbGnctcgwbzDKUmqzJjvoWHXIGtNuucDnwM1ygZgNQxwSt1tq8maUJabuCET6HZiYD
	grQiClgRb0F7wvWboOkPMcKNjwZ1+aw3ZzgwmozEb43t8yrDHGPCxPNhhbS4ZV4K8k/IGA2oKYz
	HxnvkcyGfGL6+GgQLs6Tl0LHjBNPQh/cms1i7FjQUNzelz9hRaYg9ZLQ54XneJU2RhkE/yUh7h+
	1P8HZL3bWPcAQZXgv0GsSYJQKym+oRwV9y51NvOmwl9kuYUOVPzhCR3FTTVO0K9eJV3bq+tO1IE
	jMJHMMojoBTg74p9WHC4iFqpkGEuIXbkSDBihEgoKAwI7XhM2Dn8517x4/uCTmrVX703J1EO73o
	c/NNJAb/p1ey6j4nWip6Rh4ukhkhrYHkb9e2R2B5/
X-Google-Smtp-Source: AGHT+IGgENVsxzYnyOhhBcbeJ5BwR3hSU4pvzJYRWH1H6vOd9Rxy2w9dccEeZEz0rtxHjdwoa25PUw==
X-Received: by 2002:a05:6000:18ad:b0:3a4:fc07:f453 with SMTP id ffacd0b85a97d-3a4fe154a70mr6710536f8f.8.1748900487090;
        Mon, 02 Jun 2025 14:41:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f190:efe6:7bd4:a92a? ([2001:8b0:aba:5f3c:f190:efe6:7bd4:a92a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009f865sm16081835f8f.81.2025.06.02.14.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 14:41:26 -0700 (PDT)
Message-ID: <765485fbbd229582a973ccb8e9119eec21fb2cbf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5] pixmap: Enable openmp support with clang
 compiler
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 02 Jun 2025 22:41:25 +0100
In-Reply-To: <20250530205609.3185264-1-raj.khem@gmail.com>
References: <20250530205609.3185264-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 21:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217739

On Fri, 2025-05-30 at 13:56 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> pixman's meson detects openmp support and if it finds it in runtime then
> enables it, this happens for gcc via gcc-runtime, however for clang, it
> does not. In some cases e.g. mips it enables it during configure only to
> find that clang can not find the libomp during linking. Therefore, add
> the dependency on openmp when using clang compiler. This ensures consiste=
nt
> behaviour across architectures.
>=20
> Disable internal assembler on mips since it can not handle the inline ass=
embly
>=20
> Turn openmp into a packageconfig
>=20
> openmp is not yet ported to all architectures e.g. RISCV32/PPC32
> does not have it
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v5: Remove openmp on rv32 and ppc32
>=20
> =C2=A0meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb | 13 ++++++++++++-
> =C2=A01 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb b/meta/recip=
es-graphics/xorg-lib/pixman_0.46.0.bb
> index c1c71fd4202..925a7d7b29b 100644
> --- a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
> @@ -23,6 +23,17 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D14096c769ae=
0cbb5fcb94ec468be11b3=C2=A0\
> =C2=A0
> =C2=A0inherit meson pkgconfig
> =C2=A0
> +OPENMP ?=3D ""
> +OPENMP:toolchain-clang =3D "openmp"
> +# openmp is not yet ported to rv32/ppc
> +OPENMP:remove:riscv32 =3D "openmp"
> +OPENMP:remove:powerpc =3D "openmp"
> +
> +PACKAGECONFIG ??=3D "openmp"
> +PACKAGECONFIG:class-native ?=3D ""
> +
> +PACKAGECONFIG[openmp] =3D ",-Dopenmp=3Ddisabled,${OPENMP}"
> +
> =C2=A0# These are for the tests and demos, which we don't install
> =C2=A0EXTRA_OEMESON =3D "-Dgtk=3Ddisabled -Dlibpng=3Ddisabled"
> =C2=A0# ld: pixman/libpixman-mmx.a(pixman-mmx.c.o):
> @@ -36,7 +47,7 @@ EXTRA_OEMESON:append:class-target:powerpc64le =3D " ${@=
bb.utils.contains("TUNE_FEA
> =C2=A0EXTRA_OEMESON:append:armv7a =3D "${@bb.utils.contains("TUNE_FEATURE=
S","neon",""," -Dneon=3Ddisabled",d)}"
> =C2=A0EXTRA_OEMESON:append:armv7ve =3D "${@bb.utils.contains("TUNE_FEATUR=
ES","neon",""," -Dneon=3Ddisabled",d)}"
> =C2=A0
> -EXTRA_OEMESON:append:class-native =3D " -Dopenmp=3Ddisabled"
> +CFLAGS:append:toolchain-clang:mipsarch =3D " -fno-integrated-as"
> =C2=A0
> =C2=A0BBCLASSEXTEND =3D "native nativesdk"

I think this needs more discussion or potentially a better fix.

Potentially the test for openmp in pixman is wrong and it shouldn't
build if it can find the header but not the library.

Alternatively, if the openmp library can't be built, why are we
shipping the header? Should we delete it in that case?

Something doesn't see right here and I think we need to fix the root
cause.

Cheers,

Richard





