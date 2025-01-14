Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84ABDC02180
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 01:54:40 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.35352.1736819673497420093
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 17:54:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F/kcEsTb;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-27d0e994ae3so2178200fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 17:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736819673; x=1737424473; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zgsJTHj7eLy3FAYI2sjXWB4xWagXyI2Pk9ZViH2hG8=;
        b=F/kcEsTb9g23aPV1tijfF/yBgOx78CL5PgXWhDwiZE1gHAg07UP4De/G+3yQAx5ylQ
         iUpPUjLHdo/SxHezkeMq4GjFJlGB2ifV687W3humGZXAyDGfK3bztKVmfXCjJyZFqvpw
         FV7pZZujWe++kWdOEM3FVtjKom7829Qd9pWDAE6KOfX7bqGbyEKRAS4PkGcKadaC2hjU
         g0R2WOgQ4DsUQrZrGItntsb/BYsS/m2E+Khcwf2rpNaqX5P8DFWx6B5VUcZApjZK3TWh
         Cy8MCY08ifchEOga/KyqlCTFQFyuXN8H0q3JwRq6AwNv2v4okDQMFonBOqG+BxjJtjvk
         +gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736819673; x=1737424473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zgsJTHj7eLy3FAYI2sjXWB4xWagXyI2Pk9ZViH2hG8=;
        b=GzkfcizRSE3hPxqmvFmDo1wgldaPbISVh4QpAAjf/tWcDZDPSsWvEF3gP3SIM5lBpZ
         wplPUSIwF92TUxsVJ/4jBrsevbJMuZx0ARqR8W0Abx0vkATx6DiDLQpYacxsBBxVXb7x
         n3MxvJQRTfc08DzU7CEnfnmojjc3mqRWwBoSUtVWTj/eA3lg+GUiwZ5DY5M+FIPiKLJ1
         0ltE4h7vQyqb62fINlipQTnpln1n89pxgzxBBnWkyPjX07yflIUBNVhm5etIXo/zYvU6
         +ZAsJACkx9PD2qz01ekoAnEBpqW+YSErUGSetm+23MfK8uo+fIFlPEBlY4BQeU42Wyfb
         5lsg==
X-Gm-Message-State: AOJu0YzC12gdS6IJ6gP23EnNsqicC6XjN32xP7TRMtOyZbZsfsE7sWbq
	PwmZEGf+P0A+ceoTBpmCrDsI1ifvieOQaEvoGGAfS7ceELYfyYBPxifs+lw9XyIygoZRLYI70fQ
	CdNcCjpvXmb7XAlGzt+75LtOzqRoW3g==
X-Gm-Gg: ASbGncshjP+WXWBQyJt1mltMHDa+TUNwKvZ3wXT8S8hqCG0tBY92Zk7QagGZYBhzny3
	nvL6tmef7roT0J028A1GxBeMtMXD+sCDk8C+dfcsCqbtjR+A8Mx7g
X-Google-Smtp-Source: AGHT+IFpPrxM2Dg/L34AG7HEIf66GZ8jWIXTLJkAcQ3JhjCxFDunSXzfhVrpCDv45gO/lTqWSlYm6+pTNQglzqc8fzc=
X-Received: by 2002:a05:6871:7882:b0:29d:c764:f873 with SMTP id
 586e51a60fabf-2aa0694cdacmr14221148fac.31.1736819672658; Mon, 13 Jan 2025
 17:54:32 -0800 (PST)
MIME-Version: 1.0
References: <20250113120809.2847446-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250113120809.2847446-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Jan 2025 17:54:06 -0800
X-Gm-Features: AbW1kvahu01kdLKUeM_ZOVVAZeBq6N13XeBNs9OHhnGq7qDt_nffG6FqVxf2BVc
Message-ID: <CAMKF1spB_F0LkGA6Bz62BfX7O+8ceK+QdYhE-XsZhO4CkfM0Xg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3 1/3] rust-target-config: Update the data
 layout for x86 , ppc , riscv64 , aarch64 and loongaarch64 targets.
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 01:54:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209773

do you extract the reference from same version of llvm/clang branch
that is being used by given rust compiler version.

On Mon, Jan 13, 2025 at 4:08=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> -------------------------------------------------------------------------=
----------------
> error: data-layout for target `x86-linux`, `e-m:e-p:32:32-f64:32:64-f80:3=
2-n8:16:32-S128`,
> differs from LLVM target's `i686-unknown-linux-gnu` default layout,
> `e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32=
-n8:16:32-S128`
>
> error: data-layout for target `powerpc-linux`, `E-m:e-p:32:32-i64:64-n32`=
,
> differs from LLVM target's `powerpc-unknown-linux-gnu` default layout,
> `E-m:e-p:32:32-Fn32-i64:64-n32`
>
> error: data-layout for target `x86_64-poky-linux-gnux32`,
> `e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:6=
4-S128`,
> differs from LLVM target's `x86_64-poky-linux-gnux32` default layout,
> `e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n=
8:16:32:64-S128`
> -------------------------------------------------------------------------=
------------------
> Rust commits for updating the data layouts:
>
> x86: https://github.com/rust-lang/rust/commit/dbff90c2a7c751cf9d6843cd585=
429beb100c17d
> x86_64-x32: https://github.com/rust-lang/rust/commit/ec55a05374d89d206be5=
140a4759af92f1b42f15
> aarch64: https://github.com/rust-lang/rust/commit/4d397d33da8aff64419a036=
94d152c8250916f19
> ppc: https://github.com/rust-lang/rust/commit/ad7ea8b7e690e6000006b6fde63=
0a2c8c4385019
> riscv64gc: https://github.com/rust-lang/rust/commit/f414715ebfda201f91f80=
ef9f28d9923d614d1c4
> loongaarch64: https://github.com/rust-lang/rust/commit/4a06a5bc7ad259023e=
4373e794687adfce252dac
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/classes-recipe/rust-target-config.bbclass | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classe=
s-recipe/rust-target-config.bbclass
> index 399c13db26..67aaa56bac 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -146,7 +146,7 @@ MAX_ATOMIC_WIDTH[armv7-eabi] =3D "64"
>  FEATURES[armv7-eabi] =3D "+v7,+vfp2,+thumb2"
>
>  ## aarch64-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[aarch64] =3D "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64=
-S128"
> +DATA_LAYOUT[aarch64] =3D "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64=
-S128-Fn32"
>  TARGET_ENDIAN[aarch64] =3D "little"
>  TARGET_POINTER_WIDTH[aarch64] =3D "64"
>  TARGET_C_INT_WIDTH[aarch64] =3D "32"
> @@ -160,21 +160,21 @@ TARGET_C_INT_WIDTH[x86_64] =3D "32"
>  MAX_ATOMIC_WIDTH[x86_64] =3D "64"
>
>  ## x86_64-unknown-linux-gnux32
> -DATA_LAYOUT[x86_64-x32] =3D "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64=
:64-i64:64-f80:128-n8:16:32:64-S128"
> +DATA_LAYOUT[x86_64-x32] =3D "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64=
:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
>  TARGET_ENDIAN[x86_64-x32] =3D "little"
>  TARGET_POINTER_WIDTH[x86_64-x32] =3D "32"
>  TARGET_C_INT_WIDTH[x86_64-x32] =3D "32"
>  MAX_ATOMIC_WIDTH[x86_64-x32] =3D "64"
>
>  ## i686-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[i686] =3D "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
> +DATA_LAYOUT[i686] =3D "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i1=
28:128-f64:32:64-f80:32-n8:16:32-S128"
>  TARGET_ENDIAN[i686] =3D "little"
>  TARGET_POINTER_WIDTH[i686] =3D "32"
>  TARGET_C_INT_WIDTH[i686] =3D "32"
>  MAX_ATOMIC_WIDTH[i686] =3D "64"
>
>  ## XXX: a bit of a hack so qemux86 builds, clone of i686-unknown-linux-{=
gnu, musl} above
> -DATA_LAYOUT[i586] =3D "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
> +DATA_LAYOUT[i586] =3D "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i1=
28:128-f64:32:64-f80:32-n8:16:32-S128"
>  TARGET_ENDIAN[i586] =3D "little"
>  TARGET_POINTER_WIDTH[i586] =3D "32"
>  TARGET_C_INT_WIDTH[i586] =3D "32"
> @@ -216,21 +216,21 @@ TARGET_C_INT_WIDTH[mips64el] =3D "32"
>  MAX_ATOMIC_WIDTH[mips64el] =3D "64"
>
>  ## powerpc-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[powerpc] =3D "E-m:e-p:32:32-i64:64-n32"
> +DATA_LAYOUT[powerpc] =3D "E-m:e-p:32:32-Fn32-i64:64-n32"
>  TARGET_ENDIAN[powerpc] =3D "big"
>  TARGET_POINTER_WIDTH[powerpc] =3D "32"
>  TARGET_C_INT_WIDTH[powerpc] =3D "32"
>  MAX_ATOMIC_WIDTH[powerpc] =3D "32"
>
>  ## powerpc64-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[powerpc64] =3D "E-m:e-i64:64-n32:64-S128-v256:256:256-v512:5=
12:512"
> +DATA_LAYOUT[powerpc64] =3D "E-m:e-Fi64-i64:64-n32:64-S128-v256:256:256-v=
512:512:512"
>  TARGET_ENDIAN[powerpc64] =3D "big"
>  TARGET_POINTER_WIDTH[powerpc64] =3D "64"
>  TARGET_C_INT_WIDTH[powerpc64] =3D "32"
>  MAX_ATOMIC_WIDTH[powerpc64] =3D "64"
>
>  ## powerpc64le-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[powerpc64le] =3D "e-m:e-i64:64-n32:64-v256:256:256-v512:512:=
512"
> +DATA_LAYOUT[powerpc64le] =3D "e-m:e-Fn32-i64:64-n32:64-S128-v256:256:256=
-v512:512:512"
>  TARGET_ENDIAN[powerpc64le] =3D "little"
>  TARGET_POINTER_WIDTH[powerpc64le] =3D "64"
>  TARGET_C_INT_WIDTH[powerpc64le] =3D "32"
> @@ -244,14 +244,14 @@ TARGET_C_INT_WIDTH[riscv32gc] =3D "32"
>  MAX_ATOMIC_WIDTH[riscv32gc] =3D "32"
>
>  ## riscv64gc-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[riscv64gc] =3D "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
> +DATA_LAYOUT[riscv64gc] =3D "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
>  TARGET_ENDIAN[riscv64gc] =3D "little"
>  TARGET_POINTER_WIDTH[riscv64gc] =3D "64"
>  TARGET_C_INT_WIDTH[riscv64gc] =3D "32"
>  MAX_ATOMIC_WIDTH[riscv64gc] =3D "64"
>
>  ## loongarch64-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[loongarch64] =3D "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128=
"
> +DATA_LAYOUT[loongarch64] =3D "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
>  TARGET_ENDIAN[loongarch64] =3D "little"
>  TARGET_POINTER_WIDTH[loongarch64] =3D "64"
>  TARGET_C_INT_WIDTH[loongarch64] =3D "32"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209713): https://lists.openembedded.org/g/openembedde=
d-core/message/209713
> Mute This Topic: https://lists.openembedded.org/mt/110585391/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

