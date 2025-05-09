Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0809C3ABC9
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 17:31:54 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.4387.1746811906925070432
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 10:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uvjv5+Uu;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-60658e1fedfso1154590eaf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 10:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746811906; x=1747416706; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXt0IOJgr1g+LmSiYCDACpsUohfsSx5V2lY+dTYC6HY=;
        b=Uvjv5+UulWb+XVdgGq7NXWgreZ6Dq1/5d/S3+Z2UD7406PoRR5lnPcWrGsPbg98Mr7
         Tse9+YLBC26OEFLg+gfSshctMDGobAhvYwFF/WWpKpIueWSNDTaHCouwH6cP0FHn3AJl
         tEjB/jnj2gLngYmv50txTAp94Lmv9ju2KeOOF52RBiCT56OPKhDCN/leA2idZMdBaLv8
         pemimj3p0BlP5l2BWNCmZN4n+Zi/MwOu9oHqiTp5UFu6Y0iqJWwkGjIxqVm+XoUzWbWK
         UFZnB8MkLQr43bQyyY9dBTEEdWp8HLI3HqDrSyKMTHSKDrLurSGuvZQeQtb7dT3ypbMo
         DGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746811906; x=1747416706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXt0IOJgr1g+LmSiYCDACpsUohfsSx5V2lY+dTYC6HY=;
        b=bBWzWISXBOgom7/58MaBMPxP+tXRcC0X4AzcI2lKuDxERxraMXr2UNqo9T4kS6xFhI
         mUv/7vUe8wwt4+FE4qsWQxrkurkaP2uJYozZtc4u0bXcJ85YdWVwPIjCcOABwSixrV9J
         iubz/SIoh52RLrMwaJ1/BwLM/Rb0xpUjTquhfTc3Eawh96T2AhPIfICbnSmURh5ywJpL
         Blqk2cFb0w/QATCo1QP0fhQ+fDRVHTwKc9zLLqg14KjkJ3o5xo2Oczfe/8JJIsPX9/4T
         twotumaEoyFxJolfBO/OpuHYgN9LiJgDK4lEPxfFTdbsVVytbmgfzFaUbjuPa0bNdOqc
         8KuA==
X-Gm-Message-State: AOJu0YzUjYx/zjO0M9NTE4b1YUzjdEeO+LfrCyx5VUTimX1P19cqmRNJ
	E6KdGt5NfYN8cLlS4vWTrMyWqI3Dlqnx3gJMFfaFZI2ZcwU5z72FF5q85xfKLae8y0JTLJRk+bg
	FBtAPZUXs6FiLe2N5+jIxGslTOo4MRDXIPk0=
X-Gm-Gg: ASbGnculTnFD8LyiRKkQ4zqS1/6EWfXwRkn1ulyzjb3JNpDU/SoeC0Hazx06H5mRX4h
	BwKgSGHaQ1Lj9O3zvOzC7CggEkwG7HvRUF3uRU7Hj9lDaknrIeEHGR3UTGF/CT+bZ6xPTjcnA9S
	Jov7L1sjj6Z3W43Tmgf4I6/Q==
X-Google-Smtp-Source: AGHT+IFC5Kpz9MTCnZtXwVZNwYN41EqWoqOSWsttKejhn/hlJnFDV901vMlRMehJhxkyOI2/UCl1i1as+MhVB+e5bzM=
X-Received: by 2002:a4a:e90f:0:b0:608:34d1:db96 with SMTP id
 006d021491bc7-6084b654972mr2470359eaf.4.1746811906048; Fri, 09 May 2025
 10:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250509115800.3929803-1-hongxu.jia@windriver.com>
In-Reply-To: <20250509115800.3929803-1-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 May 2025 10:31:20 -0700
X-Gm-Features: AX0GCFvFHZn3SA_ZFLAfnhmtCiHm3ainAKskOradwsK5fxPzESgBP0ISkdOanGA
Message-ID: <CAMKF1spkq=LkQf7qHmBB_DPD+4s73iXiCe54-kA+qfdnwFiT0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] compiler-rt-sanitizers, compiler-rt: skip for armv5
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 17:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216243

On Fri, May 9, 2025 at 4:58=E2=80=AFAM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> $ echo 'MACHINE =3D "qemuarmv5"' >> conf/local.conf
> $ bitbake compiler-rt compiler-rt-sanitizers
> ...
> tmp/work-shared/llvm-project-source-20.1.2-r0/llvm-project-20.1.2.src/com=
piler-rt/lib/builtins/arm/sync-ops.h:22:2: error: #error DMB is only suppor=
ted on ARMv6+
> |    22 | #error DMB is only supported on ARMv6+
> |       |  ^~~~~
>
> Due to upstream commit [[compiler-rt][builtins] Move DMB definition
> to syn-ops.h][1], compiler-rt cross-compile for ARMv5 fails.
>
> [1] https://github.com/llvm/llvm-project/commit/1c9415806ba6d0d48a160637e=
ea7d1b70efaae69
>

while it might be fine to have it disabled for armv5, I think there is
a compilation problem we are seeing here due
to misconfiguration. qemuarmv5 is using armv5te for DEFAULTTUNE which
also shows up in -march=3Darmv5te in
TUNE_CCARGS, compiler-rt build system skips compiling the
sync_fetch_and_* routines if its armv5te and those routines
are the only one's using DMB macro, now I wonder why compiler-rt cmake
thinks it should be compiling for armv7 as
it seems to be the case here, perhaps we are missing to feed the right
value through configure arguments to cmake.
We are passing HOST_ARCH to -DCOMPILER_RT_DEFAULT_TARGET_ARCH=3D${HOST_ARCH=
}

Perhaps it should be more qualified for qemuarmv5 case, it should be
deduced from DEFAULTTUNE can you try
building for qemuarmv5 using
-DCOMPILER_RT_DEFAULT_TARGET_ARCH=3D"${@bb.utils.contains('TUNE_FEATURES',
'armv5 thumb dsp', 'armv5te', '${HOST_ARCH}', d)}"

if this works then we need to define it more comprehensively we will
need similar mapping for armv4t and armv6 as well.

> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb | 1 +
>  meta/recipes-devtools/clang/compiler-rt_git.bb            | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/=
meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
> index b3c4bfcffdc..8b591b757e3 100644
> --- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
> +++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
> @@ -129,3 +129,4 @@ COMPATIBLE_HOST:libc-musl:x86-64 =3D "(.*)"
>  COMPATIBLE_HOST:libc-musl:riscv64 =3D "(.*)"
>  COMPATIBLE_HOST:libc-musl:riscv32 =3D "(.*)"
>  COMPATIBLE_HOST:libc-musl =3D "null"
> +COMPATIBLE_HOST:armv5 =3D "null"
> diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipe=
s-devtools/clang/compiler-rt_git.bb
> index 93928541273..d634c148508 100644
> --- a/meta/recipes-devtools/clang/compiler-rt_git.bb
> +++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
> @@ -119,3 +119,5 @@ BBCLASSEXTEND =3D "native nativesdk"
>  ALLOW_EMPTY:${PN} =3D "1"
>
>  SYSROOT_DIRS:append:class-target =3D " ${nonarch_libdir}"
> +
> +COMPATIBLE_HOST:armv5 =3D "null"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216201): https://lists.openembedded.org/g/openembedde=
d-core/message/216201
> Mute This Topic: https://lists.openembedded.org/mt/112897300/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

