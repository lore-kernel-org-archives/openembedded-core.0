Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D844CE7719F
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 13:51:26 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.16950.1736776278033332375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 05:51:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SGWSV+3r;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467a1ee7ff2so40954641cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 05:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736776277; x=1737381077; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kd4mvpUPHtk5rWN70jDIec9YFHFH5bWgX0T2nTvJxNY=;
        b=SGWSV+3rgy7bTRy6+Sy8hqlR+oOEby7eCHtKffKmR/C3xZkX+N14ATcNPQ3FoSuAWa
         +f8nUEMkQZehUox4acv5V/ar7sHNTXzOKkblEir/e/62D0LSa52u/GtALjnlXmwX5spW
         IFzIcjPlf2fdydhiPw1Rg1O0CkGTkuBDHaQq7hdeMdWT9Ecsta+FQbwNBhaalji5ev+g
         N22KDwxaKHeaH5xiqFUv81SckknPmCocbMKtShnQAOefD5gllAwX+KSm6Jt6LlfPK0iB
         IcMjZDQvXYdcbsXDJnBHDfLzU094NkoylM2b82Moy9c3wk0K/2VaI5FfVSqikt1UmO2j
         N5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736776277; x=1737381077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kd4mvpUPHtk5rWN70jDIec9YFHFH5bWgX0T2nTvJxNY=;
        b=l93EiscOwNRoA5ZiAZ+A4zrwvvknJe5ewXdQp/tl2/YFOaeKouIWo3CMD0K73N+yic
         JGk0PgFPgij8YEDetHwOvvnth47o8rWZlGf+Rk/3ACxoO4z2A9OvPwns5BZ7YIBVnK5I
         Jj0NG3CHr2sw3GmtgFTkAHVbuaeNp/yvttBgwJcgA3AJNRtRH5gMJJyU22GPEodHXprw
         7E9Umoqk4cANiiYFvOTi70bKthtaIFpM+Dj3q1mfjEsX2Cn82i+QnC98BAUlnBTTOFij
         OroX/WR6ucYGfPsh6sxFRW3PjHfNoEoYvj2fr4w8FeYIpxapByV/PMaHYzsotqyeTilY
         5IFg==
X-Gm-Message-State: AOJu0Yxkwt+G1JclVmKCD3zsozcy3a6dSjUmIimT4jVm2LrA67wQwfbH
	dDGbs0cfP2ZsW8/KUtoUy/56niGjP/46ztiuPtpXn9ZuJtm0MXkt+KCNvmkGgjBz5YVv+wYxiGZ
	TQn8laIds5ryORmqyb0edcjsZKGLrZA==
X-Gm-Gg: ASbGncsUHPXUen6UiJDc1G5cXAxpR0m4LB51wzuzO7q+5Q3xUM5UFc4tm/QI8MdFaw6
	0mTtHU/l/qnMwmGZ20BFR7DVrMsIBBaHH9NiuoH1OxSQZC3X13ihiEY5OZm0SU3qT0L4I0O7k
X-Google-Smtp-Source: AGHT+IEbK+ZmyxALVGspIcWIFO/wLNj0ovGKOgQ/CDM+0qhcvs0DXkunCqc9ijn+q0YDVuFv2EOJclTWf8CpLdhHcGo=
X-Received: by 2002:a05:6214:1249:b0:6d8:b371:6a0f with SMTP id
 6a1803df08f44-6df9b2d5c50mr356655886d6.31.1736776276920; Mon, 13 Jan 2025
 05:51:16 -0800 (PST)
MIME-Version: 1.0
References: <20250113133936.2968211-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250113133936.2968211-1-Deepesh.Varatharajan@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jan 2025 14:51:06 +0100
X-Gm-Features: AbW1kvZrGa7bfz59Uw42zln-BM0-14lL8LPkksSoRNcGaBSt74X5_JW4px2MfPc
Message-ID: <CANNYZj_cEFw7-GZoSzAz27LQ0Rvh32xfVU9jQCGB4rdduNkGgQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V4 1/3] rust-target-config: Update data layout
 x86,ppc,riscv64,aarch64,loongaarch64 targets.
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 13:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209724

Hello,

when you send new patchset revisions, it helps to explain what changed
between revisions, especially when no feedback was given to the
previous revisions.

You can do this with cover letters, or by including a changelog in
commit messages under --- separator (so the changelog won't be
included in actual repo commits when patches are taken from the
mailing list by maintainers).

Alex


On Mon, 13 Jan 2025 at 14:40, Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> -----------------------------------------------------------------------------------------
> error: data-layout for target `x86-linux`, `e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128`,
> differs from LLVM target's `i686-unknown-linux-gnu` default layout,
> `e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128`
>
> error: data-layout for target `powerpc-linux`, `E-m:e-p:32:32-i64:64-n32`,
> differs from LLVM target's `powerpc-unknown-linux-gnu` default layout,
> `E-m:e-p:32:32-Fn32-i64:64-n32`
>
> error: data-layout for target `x86_64-poky-linux-gnux32`,
> `e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128`,
> differs from LLVM target's `x86_64-poky-linux-gnux32` default layout,
> `e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128`
> ------------------------------------------------------------------------------------------
>
> Rust commits for updating the data layouts:
>
> x86:
> https://github.com/rust-lang/rust/commit/dbff90c2a7c751cf9d6843cd585429beb100c17d
> x86_64-x32:
> https://github.com/rust-lang/rust/commit/ec55a05374d89d206be5140a4759af92f1b42f15
> aarch64:
> https://github.com/rust-lang/rust/commit/4d397d33da8aff64419a03694d152c8250916f19
> ppc:
> https://github.com/rust-lang/rust/commit/ad7ea8b7e690e6000006b6fde630a2c8c4385019
> riscv64gc:
> https://github.com/rust-lang/rust/commit/f414715ebfda201f91f80ef9f28d9923d614d1c4
> loongaarch64:
> https://github.com/rust-lang/rust/commit/4a06a5bc7ad259023e4373e794687adfce252dac
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/classes-recipe/rust-target-config.bbclass | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
> index 399c13db26..67aaa56bac 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -146,7 +146,7 @@ MAX_ATOMIC_WIDTH[armv7-eabi] = "64"
>  FEATURES[armv7-eabi] = "+v7,+vfp2,+thumb2"
>
>  ## aarch64-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[aarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
> +DATA_LAYOUT[aarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32"
>  TARGET_ENDIAN[aarch64] = "little"
>  TARGET_POINTER_WIDTH[aarch64] = "64"
>  TARGET_C_INT_WIDTH[aarch64] = "32"
> @@ -160,21 +160,21 @@ TARGET_C_INT_WIDTH[x86_64] = "32"
>  MAX_ATOMIC_WIDTH[x86_64] = "64"
>
>  ## x86_64-unknown-linux-gnux32
> -DATA_LAYOUT[x86_64-x32] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
> +DATA_LAYOUT[x86_64-x32] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
>  TARGET_ENDIAN[x86_64-x32] = "little"
>  TARGET_POINTER_WIDTH[x86_64-x32] = "32"
>  TARGET_C_INT_WIDTH[x86_64-x32] = "32"
>  MAX_ATOMIC_WIDTH[x86_64-x32] = "64"
>
>  ## i686-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[i686] = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
> +DATA_LAYOUT[i686] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128"
>  TARGET_ENDIAN[i686] = "little"
>  TARGET_POINTER_WIDTH[i686] = "32"
>  TARGET_C_INT_WIDTH[i686] = "32"
>  MAX_ATOMIC_WIDTH[i686] = "64"
>
>  ## XXX: a bit of a hack so qemux86 builds, clone of i686-unknown-linux-{gnu, musl} above
> -DATA_LAYOUT[i586] = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
> +DATA_LAYOUT[i586] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128"
>  TARGET_ENDIAN[i586] = "little"
>  TARGET_POINTER_WIDTH[i586] = "32"
>  TARGET_C_INT_WIDTH[i586] = "32"
> @@ -216,21 +216,21 @@ TARGET_C_INT_WIDTH[mips64el] = "32"
>  MAX_ATOMIC_WIDTH[mips64el] = "64"
>
>  ## powerpc-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[powerpc] = "E-m:e-p:32:32-i64:64-n32"
> +DATA_LAYOUT[powerpc] = "E-m:e-p:32:32-Fn32-i64:64-n32"
>  TARGET_ENDIAN[powerpc] = "big"
>  TARGET_POINTER_WIDTH[powerpc] = "32"
>  TARGET_C_INT_WIDTH[powerpc] = "32"
>  MAX_ATOMIC_WIDTH[powerpc] = "32"
>
>  ## powerpc64-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[powerpc64] = "E-m:e-i64:64-n32:64-S128-v256:256:256-v512:512:512"
> +DATA_LAYOUT[powerpc64] = "E-m:e-Fi64-i64:64-n32:64-S128-v256:256:256-v512:512:512"
>  TARGET_ENDIAN[powerpc64] = "big"
>  TARGET_POINTER_WIDTH[powerpc64] = "64"
>  TARGET_C_INT_WIDTH[powerpc64] = "32"
>  MAX_ATOMIC_WIDTH[powerpc64] = "64"
>
>  ## powerpc64le-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[powerpc64le] = "e-m:e-i64:64-n32:64-v256:256:256-v512:512:512"
> +DATA_LAYOUT[powerpc64le] = "e-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
>  TARGET_ENDIAN[powerpc64le] = "little"
>  TARGET_POINTER_WIDTH[powerpc64le] = "64"
>  TARGET_C_INT_WIDTH[powerpc64le] = "32"
> @@ -244,14 +244,14 @@ TARGET_C_INT_WIDTH[riscv32gc] = "32"
>  MAX_ATOMIC_WIDTH[riscv32gc] = "32"
>
>  ## riscv64gc-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[riscv64gc] = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
> +DATA_LAYOUT[riscv64gc] = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
>  TARGET_ENDIAN[riscv64gc] = "little"
>  TARGET_POINTER_WIDTH[riscv64gc] = "64"
>  TARGET_C_INT_WIDTH[riscv64gc] = "32"
>  MAX_ATOMIC_WIDTH[riscv64gc] = "64"
>
>  ## loongarch64-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[loongarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
> +DATA_LAYOUT[loongarch64] = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
>  TARGET_ENDIAN[loongarch64] = "little"
>  TARGET_POINTER_WIDTH[loongarch64] = "64"
>  TARGET_C_INT_WIDTH[loongarch64] = "32"
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209721): https://lists.openembedded.org/g/openembedded-core/message/209721
> Mute This Topic: https://lists.openembedded.org/mt/110586460/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

