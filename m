Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082F5EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 15:33:37 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.1322.1687880009707770372
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 08:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Le/xQaj1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fa94ea1caaso22721195e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 08:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687880008; x=1690472008;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zaxpaR3zmm3E+5dWta8zFD/OkuCWJTgtyDm+J6Udl5M=;
        b=Le/xQaj1wb0YmI7k3yCL43NRl9Y1+zCBMMz5rcJkhtLw8mqOq45P1s7114GlWU1Arj
         gPMYnenWNiVZ3OiH/yh+fYCGfpIDXMl7aMIR7uqbHNi7uDSACrCIIlChNv4kFC4Vlxsj
         UJ/YcDcS+6fquxzTckP5YKGrI72J5emQTuh34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687880008; x=1690472008;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zaxpaR3zmm3E+5dWta8zFD/OkuCWJTgtyDm+J6Udl5M=;
        b=lx7pAcVZ+pYcgKnR8dTNo1nVVlMu/5dkE3NSakN0I78PQoV6n9xBA/8wfy1SxHKyDp
         MDRSKn9CKpAZ0ooASRq18PWt/PzRzFWbxJv2V4skFv1ZuiQLNPwTxs1NQrxaEUoZq51l
         WOJO1cWhgwb2xz08M/0MtQqzQBKWVYJ/M+nOmFY5/9pGG6vFF2YNteNNmah5JtMX6Vvi
         TvoTdDBiT9M7fAdvWeXghtqCpl/Yb+YYH8pCKT1Z7Fo5oUDX0lmGGUYpORRjP4tSG7OE
         j1U9CFkf2OAqh3imt86qCKZzsastg1Z8D320Gb7y0RjTI6TTHbM6TmqL4qSFS9/vuQtw
         VaRw==
X-Gm-Message-State: AC+VfDyGbejm9DC5N+eRONB1G6Vwx/WIrAQGbEfRUnpFZTgRFnpC8HSD
	0if1QxeLknNDePfcffYSMyXmqA==
X-Google-Smtp-Source: ACHHUZ4+mhiyAl1ESG3ed/UkmBpkWW1myhkEa3Zz7stlQ0k31KFRezO051krw83GtNqGN8td8nEy0A==
X-Received: by 2002:a05:600c:511f:b0:3fa:9996:8e03 with SMTP id o31-20020a05600c511f00b003fa99968e03mr5589476wms.10.1687880007968;
        Tue, 27 Jun 2023 08:33:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:90b7:e2b1:2368:2244? ([2001:8b0:aba:5f3c:90b7:e2b1:2368:2244])
        by smtp.gmail.com with ESMTPSA id s6-20020a5d4ec6000000b0030ae849c70csm10729902wrv.37.2023.06.27.08.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 08:33:27 -0700 (PDT)
Message-ID: <4bba0c7b5452904314560eeb060fdce085da9a11.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] time64.inc: annotate and clean up
 recipe-specific Y2038 exceptions
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Tue, 27 Jun 2023 16:33:26 +0100
In-Reply-To: <20230627150859.1895109-1-alex@linutronix.de>
References: <20230627150859.1895109-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 15:33:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183492

On Tue, 2023-06-27 at 17:08 +0200, Alexander Kanavin wrote:
> Additionally:
> - drop pseudo from INSANE_SKIP for 32bit time API check
> (pseudo passes the check; it's not clear where the issue may have been)
>=20
> - move rust exceptions to the cargo class, as the problem
> is common across the ecosystem, and needs to be fixed in the
> libc crate.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes-recipe/cargo_common.bbclass |  4 ++++
>  meta/conf/distro/include/time64.inc      | 26 ++++++++++++++++--------
>  2 files changed, 22 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-reci=
pe/cargo_common.bbclass
> index 82ab25b59c5..dea03a004ba 100644
> --- a/meta/classes-recipe/cargo_common.bbclass
> +++ b/meta/classes-recipe/cargo_common.bbclass
> @@ -170,3 +170,7 @@ oe_cargo_fix_env () {
>  EXTRA_OECARGO_PATHS ??=3D ""
> =20
>  EXPORT_FUNCTIONS do_configure
> +
> +# Please check the comment in meta/conf/distro/include/time64.inc
> +# for information about the Y2038 situation in rust and this setting
> +INSANE_SKIP:append =3D " 32bit-time"
> diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/inclu=
de/time64.inc
> index a0cee4fad67..4edd6d87308 100644
> --- a/meta/conf/distro/include/time64.inc
> +++ b/meta/conf/distro/include/time64.inc
> @@ -27,22 +27,32 @@ GLIBC_64BIT_TIME_FLAGS:pn-glibc-testsuite =3D ""
>  GLIBC_64BIT_TIME_FLAGS:pn-pipewire =3D ""
>  # Pulseaudio override certain LFS64 functions e.g. open64 and intentiona=
lly
>  # undefines _FILE_OFFSET_BITS, which wont work when _TIME_BITS=3D64 is s=
et
> +# See https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/3770
>  GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio =3D ""
> +# Undefines _FILE_OFFSET_BITS on purpose in
> +# libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
>  GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers =3D ""
>  # https://github.com/strace/strace/issues/250
>  GLIBC_64BIT_TIME_FLAGS:pn-strace =3D ""
> =20
> -INSANE_SKIP:append:pn-cargo =3D " 32bit-time"
> +# Caused by the flags exceptions above
>  INSANE_SKIP:append:pn-gcc-sanitizers =3D " 32bit-time"
>  INSANE_SKIP:append:pn-glibc =3D " 32bit-time"
>  INSANE_SKIP:append:pn-glibc-tests =3D " 32bit-time"
> -INSANE_SKIP:append:pn-librsvg =3D " 32bit-time"
> -INSANE_SKIP:append:pn-libstd-rs =3D " 32bit-time"
> -INSANE_SKIP:append:pn-pseudo =3D " 32bit-time"
>  INSANE_SKIP:append:pn-pulseaudio =3D " 32bit-time"
> -INSANE_SKIP:append:pn-python3-bcrypt =3D " 32bit-time"
> -INSANE_SKIP:append:pn-python3-cryptography =3D " 32bit-time"
> -INSANE_SKIP:append:pn-rust =3D " 32bit-time"
> -INSANE_SKIP:append:pn-rust-hello-world =3D " 32bit-time"
> +
> +# Strace has tests that call 32 bit API directly, which is fair enough, =
e.g.
> +# /usr/lib/strace/ptest/tests/ioctl_termios uses 32-bit api 'ioctl'
>  INSANE_SKIP:append:pn-strace =3D " 32bit-time"
> =20
> +# Additionally cargo_common class (i.e. everything written in rust)
> +# gets the same INSANE_SKIP setting. The culprit is the libc crate,
> +# which as of Jun 2023 calls directly into 32 bit time functions in glib=
c,
> +# bypassing all of glibc provisions to choose the right Y2038-safe funct=
ions. As
> +# rust components statically link with that crate, pretty much everythin=
g
> +# is affected, and so there's no point trying to have recipe-specific
> +# INSANE_SKIP entries.
> +#
> +# Upstream ticket and PR:
> +# https://github.com/rust-lang/libc/issues/3223
> +# https://github.com/rust-lang/libc/pull/3175

This doesn't feel quite right. I think this comment should be in the
cargo class with a comment in time64.inc to see the cargo class for=C2=A0
rust specific issues?

Cheers,

Richard


