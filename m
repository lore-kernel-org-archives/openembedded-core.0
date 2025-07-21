Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E51C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 05:41:50 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.33473.1753076509243870858
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 22:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V0lYwa4x;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-710bbd7a9e2so36166457b3.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 22:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753076508; x=1753681308; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gabWLM+5Xxn2kpKycf5959zBxNMo5JQnkaKKAxGA0g=;
        b=V0lYwa4xA2j5bL96JTT7ZwelaR4Wz/0axU30OHklsDnTnLCppriGLkbRLhrKXEt3MU
         YSddi8DUb6dsmChdluEzfMNz2mmAnsJLlfLofZUMNLAwB2Q3d+70ZFOVZhjiFKWEgZu/
         6Fzrhl0kb7I4a1xjy+tvNI8Utk7Qx+EXCrdCY1T49BBmEhZ9jim9b5a+DSGPAvCjAntS
         jNTpy5PWCiZmA92jxp0B20F5hev0l7sXRQFFGQ5XEhdvt0XqsQv4lrxMrKRUBgD0iXnd
         Q7/MZ4gf79MzNUSAvpki8Rw4myopO+9erlQF1bQHU73en+Q3GZjKuGZ3cGPh2oPprRaT
         75JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753076508; x=1753681308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gabWLM+5Xxn2kpKycf5959zBxNMo5JQnkaKKAxGA0g=;
        b=IsQIWAwxyRV0wPx693oqFeqas04s6q/+CqwEvSalEGX7i0E3P+E+KOFeL0gao4zif3
         sLS/QFy8Iqy8NxbeO9NXYv9JNynwfpJX/PbEaD/SqqwtE6nfyVg1CS9mMSzd3/jxleox
         qUMCr7XaWHM1WivnfweI1OET59Pbz7qxY5Bfy0EoTntefhA9lLyXdsD3zK/Comd6mYdT
         xgRsmqt9PKN0g6ZmnS12S7O3D8C3lCS2ePhvLuibLAoXulGJe/mLYZLPYYnEv2Vr3pAE
         YXD8uRZ/pbsQbtsZUIvUSZUjVtu0vm7ICd02bRHkXKQ/poj0U0uGFfu3ds6UOKuZU+gr
         tAKA==
X-Gm-Message-State: AOJu0YzxSLvw0tlc5dkKmbsFJNMAKPFKd4XDqo/K21VTzx/ErWZvY3Eu
	FJkn/xep4+nDsocgOkDXiNDv1UeIE3YGDaCIANCyeqiNtG/inNPglXFV0kIWEGcJnsud3/A22b9
	vUCSQOiAloUe9SoDPVTtv0viEbAZhRgB/Ut0c
X-Gm-Gg: ASbGncvlQfUzADWG4WaaK6VOJTYCnOPNa7QgUpKV8FbcjXUlzxK0SJrCPLD67jPLh6G
	070JSXQzHIVsHOAz9UPN/S9rb1gpj5q7+OqETqHlGCLAKYbIDSpucZ6JfiwGuDT0y/Lg91DnEcq
	OgLUpQwHFBrXr9MF67dqkg98BSSTtjxeu05894gNQDoLGsgEjLUSdOvQWzMmcA6UAe+ch/JaBXn
	20E98fctI4oD/DP
X-Google-Smtp-Source: AGHT+IGNrTfjTwN8BulnPh+lqSuDP05im0xhIJkyNlsYG1GchSUTFFmXJh+W/ZFJ+pwrCch439/NWiIc5yzbWUAiJpY=
X-Received: by 2002:a05:690c:708b:b0:70e:142d:9c6f with SMTP id
 00721157ae682-7183751a174mr299096307b3.28.1753076508188; Sun, 20 Jul 2025
 22:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250721053012.4156913-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250721053012.4156913-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Jul 2025 22:41:22 -0700
X-Gm-Features: Ac12FXyX-TqkBr0ufa-s8jJuOwm4KWLkCuv95t3Uofs6paHNX3FVllIRZ_ea0Hw
Message-ID: <CAMKF1so8TB1Lfaf=k-6+Z-hV7kNJYnsHoTrWqvLknHWtNezVUw@mail.gmail.com>
Subject: Re: [OE-core] [walnascar][PATCH V2] glibc: stable 2.41 branch updates
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 05:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220657

On Sun, Jul 20, 2025 at 10:30=E2=80=AFPM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> $ git log --oneline 0c76c951620f9e12df2a89b2c684878b55bb6795..6e489c17f82=
7317bcf8544efefa65f13b5a079dc
> 6e489c17f8 Fix error reporting (false negatives) in SGID tests
> 11e634ccf3 support: Pick group in support_capture_subprogram_self_sgid if=
 UID =3D=3D 0
> 61e461ed0c sparc: Fix sparc32 Fix argument passing to __libc_start_main (=
BZ 32981)
>
> Testing Results:
>             Before     After   Diff
> PASS         5803      5813    +10
> XPASS        4         4        0
> FAIL         266       257     -9
> XFAIL        16        16       0
> UNSUPPORTED  164       161     -3
>
> 6e489c17f8 Fix error reporting (false negatives) in SGID tests
> Improved SGID test handling by unifying error reporting and using secure =
temporary directories.
> Replaced non-standard exit codes and fixed premature exits to avoid maski=
ng failures.
> These changes reduced false negatives, increasing overall test pass rates=
.
>

Thanks for the details.

> UNSUPPORTED tests changes
> -UNSUPPORTED: stdlib/tst-secure-getenv
> -UNSUPPORTED: elf/tst-env-setuid-static
> -UNSUPPORTED: elf/tst-env-setuid-tunables
>
> FAILed tests changes
> +FAIL: elf/tst-env-setuid-tunables
> -FAIL: stdio-common/tst-printf-format-d-int
> -FAIL: stdio-common/tst-printf-format-d-long
> -FAIL: stdio-common/tst-printf-format-sn-ushort
> -FAIL: stdio-common/tst-printf-format-v-short
> -FAIL: stdio-common/tst-printf-format-v-ushort
> -FAIL: stdio-common/tst-printf-format-vas-double-f
> -FAIL: stdio-common/tst-printf-format-vas-double-g
> -FAIL: stdio-common/tst-printf-format-vas-double-g-mem
> -FAIL: stdio-common/tst-printf-format-vas-int
>
> PASSed tests changes
> +PASS: stdlib/tst-secure-getenv
> +PASS: elf/tst-env-setuid-static
> +PASS: stdio-common/tst-printf-format-d-int
> +PASS: stdio-common/tst-printf-format-d-long
> +PASS: stdio-common/tst-printf-format-sn-ushort
> +PASS: stdio-common/tst-printf-format-v-short
> +PASS: stdio-common/tst-printf-format-v-ushort
> +PASS: stdio-common/tst-printf-format-vas-double-f
> +PASS: stdio-common/tst-printf-format-vas-double-g
> +PASS: stdio-common/tst-printf-format-vas-double-g-mem
> +PASS: stdio-common/tst-printf-format-vas-int
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index 2d31131e03..a2cfd0f308 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.41/master"
>  PV =3D "2.41+git"
> -SRCREV_glibc ?=3D "0c76c951620f9e12df2a89b2c684878b55bb6795"
> +SRCREV_glibc ?=3D "6e489c17f827317bcf8544efefa65f13b5a079dc"
>  SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220656): https://lists.openembedded.org/g/openembedde=
d-core/message/220656
> Mute This Topic: https://lists.openembedded.org/mt/114263786/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

