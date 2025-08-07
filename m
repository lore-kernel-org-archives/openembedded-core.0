Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096FDC87FCA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 11:49:30 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.49910.1754567368589049982
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 04:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YvxVAf3b;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b786421e36so410931f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 04:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754567367; x=1755172167; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMnVh7NxtLUNhUfezR8BdlwpAJtgHFdsY54A1bUtRyY=;
        b=YvxVAf3bXLelZleZD1Etcic/XLi9xdoK3T7vscixE0tcbMtlCCmHBoPr5LbX6s44+G
         zTyd1j7SbEl7Xg0U5Dp4by3yWtu5DenBgXjZtU3h4wTbRIUuWkZMfJ830DrEmIJZjcxC
         sa3ZGEWYvFRwX9W+sgVGPxYRgJu/XWWKnNe/kkaOt9B8jiWTM2aeJHPULIzME4XNFHDa
         PLxn2V87jUySYq31HJYmrXMLGuWp9gp6cBWvGFYUb4erKqJXSmyUWN+ZAyXwJY8fN6KI
         Km/94TOyEGCMVtqlWxVmmrbUABaorl7nrMxcf7X9RNnm0kUewtQX1AY9uBb8/viwzh5g
         STgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754567367; x=1755172167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMnVh7NxtLUNhUfezR8BdlwpAJtgHFdsY54A1bUtRyY=;
        b=MpQ6HaKsI9MWcbWJ77px+T5vdKYc9XLuvZ4RZwf6c5ZmgO8LYlv34AFmz4hRhX5Qk6
         H0c6kJu9CzMa5Vc2GaQCnEQ2BHvTjJe8Ohy93n5nbDnJiMLy/4WSFq8+Ml21F3kbsrKk
         I8ITZKratFsgf8E7e15L1fUW0Fx2U590aYvIoZpyT+5BND8IGq7k8liKs7qEXm1I2WD1
         P3foILMLIgblG+A3RaSfbS/UntBx/ll6yzKjR/1O9N8nWmznQef/IiTrP9lJhhalDTvI
         kmBk7Iy+1jG+zcXUJDsY8hR+k1AlXd4txf5Z4kN4PEvvOCseM11fmoPRVbNd9lgrbSLL
         FXag==
X-Gm-Message-State: AOJu0Yy5skecY/aqUQ6Q6PzVKdjdV1Yrz9wlBkKKQO07z/AzpnK7s67Z
	vVTxLOmPiMWrw+LBPd4w6jNBaUZafmN+TQleDYUGbCvmU3z+BCXxclZ6WY+Lbq4d5lafCnWkt3o
	/d0llP/HbjoMX//mJ3oP9AZu6Ab16UbA=
X-Gm-Gg: ASbGncsVWyLR/Ky6Z+0ntY4w+9LCl1gKpE1pkxXzU12YNVkXDKmJKFZx26ER/ODZkXs
	DVScTHzFXk2MVEqriyE3Q5KL7cGx1tIc3fC6IvKZ9mmVaPlTV59dvkEBF76RCgqwsBeKLE324Ap
	BeuV5sI98igp9BSTiLUOIQl/xCCYIbnCRz1XrB9PDJiTBSiM1yN4SRZA7H4QyjRoOQ+/SSiwJDI
	JN7uHzn
X-Google-Smtp-Source: AGHT+IGB9hCimI2JBgpyCl91H0YNV/xcyB5GOL3zwyuerwy/dnDOIwB/Q8C2yN6cB301SgBOiPk0/NZCOqsaT/NbNNA=
X-Received: by 2002:a05:6000:220d:b0:3b7:9214:6d70 with SMTP id
 ffacd0b85a97d-3b8f9f2c144mr2724819f8f.15.1754567366584; Thu, 07 Aug 2025
 04:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250724170600.1113476-1-raj.khem@gmail.com>
In-Reply-To: <20250724170600.1113476-1-raj.khem@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Thu, 7 Aug 2025 13:49:14 +0200
X-Gm-Features: Ac12FXxeF9iX5FfhtHrf_Twt1c36EyZUxuyDvcwF_wRdvuRpROIAH4mYbgX8-GA
Message-ID: <CAEHkU3V3tOfwAimXsEtj1vfKynQUB_+Ydq+x+ow5--pTYbrmHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] feature-arm-crypto: Add +nocrypto to -mcpu
 when crypto not in features
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Quentin Schulz <quentin.schulz@cherry.de>, Ryan Eatmon <reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 11:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221566

Hi

On Thu, Jul 24, 2025 at 7:06=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> When crypto is not in tune features then add +nocryto to
> -mcpu explicitly. This makes the behavior between clang
> and gcc match. Currently -mcpu=3Dcortex-a72 has different
> behavior in clang and gcc in terms of what features are
> considered default. Clang enables different set of common
> features than gcc on other hand. For example clang
> enables crypto with default set but gcc
> does not, gcc recommends to disable unavailable extensions
> in -mcpu [1] explicitly. crypto is optional on cortex-a53
> and cortex-a72. This is not as common but Broadcom
> SOCs in raspberrypi3/4 have dropped crypto for cost
> reasons [2]. This results in illegal instruction
> traps [3] [4] when building components e.g. chromium,
> qtwebengine, weston etc. with clang using -mcpu=3Dcortex-a72
> for rpi4 target.
>
> Adding +nocrypto makes clang behave like gcc does today. We
> do have separate tune if crypto enabled cortex-a72 cores
> are to be targeted (cortexa72-cryto) as DEFAULTTUNE
>
> They are added to default feature file since crypto extension
> is available in multiple arm architecture versions e.g. armv8,
> armv9. It is optional extension as per spec [5]
>
> Extensions can be enabled and disabled with -mcpu using the same
> syntax as with -march, and have same effect thats why it is
> intrumented via TUNE_CCARGS_MARCH_OPTS
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html#index-mcpu-2
> [2] https://forums.raspberrypi.com/viewtopic.php?f=3D63&t=3D207888#p13329=
60
> [3] https://github.com/llvm/llvm-project/issues/85699
> [4] https://github.com/llvm/llvm-project/issues/90365
> [5] https://developer.arm.com/documentation/109697/2025_06/Feature-descri=
ptions/The-Armv9-0-architecture-extension
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> v2: Move the change to feature-arm-crypto.inc.
> v3: Adjust commit message for clarity on reason to be in common feature f=
ile.
> v4: Address commit msg comments, add section on why use TUNE_CCARGS_MARCH=
_OPTS
>
>  meta/conf/machine/include/arm/feature-arm-crypto.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/arm/feature-arm-crypto.inc b/meta/=
conf/machine/include/arm/feature-arm-crypto.inc
> index aade6ce08d5..8202de78e46 100644
> --- a/meta/conf/machine/include/arm/feature-arm-crypto.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-crypto.inc
> @@ -2,4 +2,5 @@
>  # armv8-a, armv8.1-a, armv8.3-a, armv8.4-a, armv8.5-a, armv8.6-a, and ar=
mv8-r
>
>  TUNEVALID[crypto] =3D "Enable cryptographic instructions for ARMv8"
> -TUNE_CCARGS_MARCH_OPTS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cryp=
to', '+crypto', '', d)}"
> +# See  https://github.com/llvm/llvm-project/issues/85699
> +TUNE_CCARGS_MARCH_OPTS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cryp=
to', '+crypto', '+nocrypto', d)}"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

This breaks machines which set `DEFAULTTUNE ?=3D "aarch64"` and use gcc
as e.g. done for TI SoC [1].
For that tune the `TUNE_CCARGS_MARCH` is not set at all resulting in a
lone `+nocrypto`
in the compiler arguments. Note that for gcc additionally
`-march=3Daarch64` is not an allowed argument.

I don't really know what is a good way forward. Of course one could
not use aarch64 as a default tune
to work around the issue.

Any ideas?

Regards
Max

| checking for aarch64-tdx-linux-gcc... aarch64-tdx-linux-gcc
+nocrypto -mbranch-protection=3Dstandard -fstack-protector-strong  -O2
-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security
--sysroot=3D...aarch64-tdx-linux/libgcc-initial/15.1.0/recipe-sysroot
| checking for suffix of object files... configure: error: in
`...aarch64-tdx-linux/libgcc-initial/15.1.0/gcc-15.1.0/build.aarch64-tdx-li=
nux.aarch64-tdx-linux/libgcc':
| configure: error: cannot compute suffix of object files: cannot compile

[1] https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/conf/machine/incl=
ude/k3.inc#n6

