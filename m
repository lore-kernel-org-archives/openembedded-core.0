Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44F0106FD9E
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 09:38:33 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6561.1773481104801696457
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 02:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CPsqba8V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b9b190easo2104218f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 02:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773481103; x=1774085903; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dWl8tD5mqRVyoO3UaixEKBZ/4Fw+vDW/TXd6g9dXGSQ=;
        b=CPsqba8V670mSNfju4aShmWhp1nBd1eMzDLe0vUI88SLsl791fqPRzRORTL2/6bSIF
         5+i4/0oe6vdjySVa19jLCWVQMOKSmMeoFYtjHp37wrVxRwiCQ7/pOYkqqIdnYfG+g27H
         gTZ8TWbJEwShhFAQw+2GNBMET/LhIzfGDDZ80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773481103; x=1774085903;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dWl8tD5mqRVyoO3UaixEKBZ/4Fw+vDW/TXd6g9dXGSQ=;
        b=jp1y+svTRVKZQ1K3dtW3H0u34RCeWfYBUn58lnRQ3IIdsLtwkzTzKmbZnOmP+PcDi/
         6/AnMjD8JsDCcmHR3DcEVcjm0mWCo/qYVLvcVkBB3vZ9GX874CS3hd0OKHwgSfkpmEsP
         M3cOrHAyvqsgltL6qGkMdBpXTKcSwGxEl/Wd4f+e6/WiAv3RIPf+0mazFsoPP8Ei9KU+
         aaejLbbM48vZ0//fdAbhQ4thPqYpoNi7sMo6JWQyVoITTHlMqw1kDEXz2dszNcBjqHVw
         4aQ3Agg7r4oY+l385aUPED0w/xwmDWgS+ziBlvLfA9yIcl6ATipzQromB9TWIIIo4nnG
         9Lvw==
X-Forwarded-Encrypted: i=1; AJvYcCUfAXuB76gWPurCj8eUV0IZOuGuoWGaertsHlXdaX7wVYBIfTk7iJWpjpGbJcfWcjtxKXaxLSo9yFjlS8FFIYUQLw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyXh+PPdbXVfvcsrrl7OZ7gs2GuIqpI9Kkaha+OBecPhsJBrtD9
	7xW4Pc16NQmpZO/sePjRuXGl7dArLpSAw1HH8CSdtEGbmRDctvudVuO+4aEmHfCo3eA=
X-Gm-Gg: ATEYQzzVjEZuQrntcA3B8oPnNKrGlM55WtxX7Tz6HNk+qVvIgZUsHCLUqgHWSFMWEi3
	AbUcHGrXun4PdWcDo67X2GQ0UJf2IgDodiLdr1QDXG8gDA8XPEzJ2HoJwP9oKA3H26vsQ79udCz
	PTaVRGzM6QzY/WszcZ1tKy8JA+dJPSNc54RwNJpnwB6TKJlD4yf1mfUuIULUZEpImdr7MD9ZODK
	jIqfsYNKQc9ELRxC/U9AMaXKs1sBnUYcLD3HVEqTsPALp8zRnGl8qSnNPbAKPJ8dFsexWf6MScp
	6XLpb2diOjxfT3Q+gOdtXjjVay9P277OvFoGAFOHvoqsrcxzB5Nf5uDHh+EQxgvCENxon1hEUag
	OnBIBtvAQJOJKmns1Gklv0+HqFIpkyfgfyX8oStD+vlHvC8R++95jgagBFtF/p/gg0kJ8WCHkL3
	AeyvzBLlcSoMuZaEad7/+hcm6ICf2xFMB2i+uN6YddZV8AfOWgdEep0gbn5LsqgL4nNmcS3w+NY
	5Ft+n6YO3hntoI=
X-Received: by 2002:a05:6000:2406:b0:439:e334:426a with SMTP id ffacd0b85a97d-43a04db5108mr11559905f8f.46.1773481102842;
        Sat, 14 Mar 2026 02:38:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1366:c81f:8eb8:9990? ([2001:8b0:aba:5f3c:1366:c81f:8eb8:9990])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm26497628f8f.20.2026.03.14.02.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:38:22 -0700 (PDT)
Message-ID: <1cb32301f3c59441a94163ddf5ee25ff3f8be634.camel@linuxfoundation.org>
Subject: Re: [PATCH v9 07/14] kernel: Disable ccache when kernel rust
 support is enabled
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com, 
	yoann.congal@smile.fr, bruce.ashfield@gmail.com
Date: Sat, 14 Mar 2026 09:38:21 +0000
In-Reply-To: <20260313155920.2347101-8-Harish.Sadineni@windriver.com>
References: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
	 <20260313155920.2347101-8-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 09:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233075

On Fri, 2026-03-13 at 08:59 -0700, Harish.Sadineni@windriver.com wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> Currently, a ccache enabled build fails with:
> =C2=A0 |=C2=A0=C2=A0 HOSTRUSTC scripts/generate_rust_target
> =C2=A0 |=C2=A0=C2=A0 HOSTCC=C2=A0 scripts/kallsyms
> =C2=A0 |=C2=A0=C2=A0 HOSTCC=C2=A0 scripts/sorttable
> =C2=A0 |=C2=A0=C2=A0 HOSTCC=C2=A0 scripts/asn1_compiler
> =C2=A0 |=C2=A0=C2=A0 TOUCH=C2=A0=C2=A0 include/generated/gcc-plugins.h
> =C2=A0 |=C2=A0=C2=A0 DESCEND objtool
> =C2=A0 | error: multiple input filenames provided (first two filenames ar=
e gcc and
> .../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target=
.rs)
>=20
> Linux rust build infrastructure does not currently support ccache (Opened=
 bug[0]).
>=20
> Quick summary: There are 2 issues: $HOSTCC is not escaped and rustc
> expect a path (and not a command)
>=20
> Disable ccache if KERNEL_RUST_SUPPORT is 'True' for kernel and kernel mod=
ule builds, including
> auxiliary tooling such as make-mod-scripts.
>=20
> More details in: https://lists.openembedded.org/g/openembedded-core/messa=
ge/229336
>=20
> [0]: https://github.com/Rust-for-Linux/linux/issues/1224
>=20
> Co-developed-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> Cc: Alban MOIZAN <alban.moizan@smile.fr>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
> =C2=A0meta/classes-recipe/kernel-yocto-rust.bbclass=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7 +++++++
> =C2=A0.../make-mod-scripts/make-mod-scripts_1.0.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7 +++++++
> =C2=A02 files changed, 14 insertions(+)
>=20
> diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes=
-recipe/kernel-yocto-rust.bbclass
> index fd9ee91c79..608ccc4609 100644
> --- a/meta/classes-recipe/kernel-yocto-rust.bbclass
> +++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
> @@ -16,3 +16,10 @@ do_kernel_configme[depends] +=3D "${RUST_KERNEL_TASK_D=
EPENDS}"
> =C2=A0do_kernel_configme:append () {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe_runmake -C ${S} O=3D$=
{B} rustavailable
> =C2=A0}
> +
> +# Linux rust build infrastructure does not currently support ccache
> +# see https://github.com/Rust-for-Linux/linux/issues/1224
> +# Quick summary: There are 2 issues: $HOSTCC is not escaped and rustc ex=
pect a path (and not a command)
> +# More details in: https://lists.openembedded.org/g/openembedded-core/me=
ssage/229336
> +# Disable ccache for kernel build if kernel rust support is enabled to w=
orkaround this.
> +CCACHE_DISABLE ?=3D "1"
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb=
 b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index 874e16e642..5fbc5c2154 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -36,3 +36,10 @@ do_configure() {
> =C2=A0		-C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} $t
> =C2=A0	done
> =C2=A0}
> +
> +# Linux rust build infrastructure does not currently support ccache
> +# see https://github.com/Rust-for-Linux/linux/issues/1224
> +# Quick summary: There are 2 issues: $HOSTCC is not escaped and rustc ex=
pect a path (and not a command)
> +# More details in: https://lists.openembedded.org/g/openembedded-core/me=
ssage/229336
> +# Disable ccache for kernel build if kernel rust support is enabled to w=
orkaround this
> +CCACHE_DISABLE ?=3D "{@bb.utils.contains('KERNEL_FEATURES', 'rust', "1",=
 "0", d)}"

This fails to run, it is missing a '$'. No need to resend, I've fixed
in what I'm testing on master-next.

Cheers,

Richard


