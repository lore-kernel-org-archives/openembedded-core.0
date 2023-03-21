Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B5AC761A6
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 19:16:28 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.23424.1679426181045262531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 12:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IrOk6n3L;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id k14-20020a056830150e00b0069f156d4ce9so4514369otp.6
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 12:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679426180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYln+i0ilZ5B84OG2/s2LihbsBBr15n2RyDfENTTG9Q=;
        b=IrOk6n3La4U9B9k9+yXyjrCctSZu/AaqG24oftp9etq+zmCD9nvKs3WQBEzUhBYKzK
         1Yg2vxxZVATeAEq+mH+kb2ZScS/2bw6MXk+3beP5K8DxoXYHnBqtZBkmm1SOd5xZ2zF8
         x1pzr6MeNqeUNZe2MRTc+qFqZJ3e0O1OoOtl1ze/w/EUx0Pm7tgMZsXLVUAajq5CGl2f
         P/Sj37sDzOOddeF42SCK3GSbxfj8THsCrWnyb/CRkBV1QHfdIKR6V0ITRWHPTSIrhlU7
         bRRKf3FiGUwOkZ3QCl7HzWkqXps3D41SR3BPOieCNiwLDfNbZEDOo4JUgmAQZ3FDMUgG
         f/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679426180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYln+i0ilZ5B84OG2/s2LihbsBBr15n2RyDfENTTG9Q=;
        b=arA2/XKnRshusjbBaAHnpZwkzSyCECgRfOSFu28UOYV0mA/iPIJzNNC+CL7wmGG/fI
         YZtECG45SSQPJ4eblRap+/3qghCqsZxkSJvUuKRAG+iZUgCvLsWE5aOQs3ccoQg0JHhE
         gaBADanCsKyrdjRUK3qgtO6rtzEQGagBjyPIjwqQdNXO/m0YGcu+QGFD1S5yh87tTwNu
         oDYAvS4OZJKEXDE5F5PkpDT1flg+dW/EyKTOSu5g7xMNW/BJpvGm2t/xepWfHESUC0f5
         aFtQWvTq9/B+ijf/cWfdC4EVC1VlPUdbGeiAL67c7AGBBgAhliEQWvq79O4KAH62rTx0
         aBFw==
X-Gm-Message-State: AO0yUKVMcipmJPhkV8K0NJ35jrS6dCNM5RnSfqubEWqA63SJ6avjJ2Fm
	sR+28WtCYoCIeMDUUdTXc/QEPje0n42c/GsbjjxWpl0B
X-Google-Smtp-Source: AK7set+xEtly1AmSBsy/vKO0Bg/NuIyh6vNk8PeWs2Y94liMRv6coZrA8v7W3F2LTmrmttGPXMHcMpa4hg7MaoZRsD4=
X-Received: by 2002:a05:6830:1441:b0:690:daac:e823 with SMTP id
 w1-20020a056830144100b00690daace823mr118962otp.2.1679426179982; Tue, 21 Mar
 2023 12:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230321190032.908584-1-jdmason@kudzu.us>
In-Reply-To: <20230321190032.908584-1-jdmason@kudzu.us>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Mar 2023 12:15:54 -0700
Message-ID: <CAMKF1spKpK1DF98FQkS0r-1fUKmN+qQ9ewHrWd_WviQvZSi4Rw@mail.gmail.com>
Subject: Re: [PATCH] libunwind: work around arm printf issue
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 19:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178899

On Tue, Mar 21, 2023 at 12:00=E2=80=AFPM Jon Mason <jdmason@kudzu.us> wrote=
:
>
> When building for Arm, the following error is seen:
> | ../../libunwind-1.6.2/src/arm/Gtrace.c:529:7: error: call to undeclared=
 library function 'printf' with type 'int (const char *, ...)'; ISO C99 and=
 later do not support implicit function declarations [-Wimplicit-function-d=
eclaration]
> |       printf("XXX1\n");
>
> Since every other reference to printf either has BSD or !linux then, I
> think it's safe to assume this is not valid and a BSD ifdef can be
> placed around this code.
>

I think you can add
#include <stdio.h>
that should make the compiler happy, and you can easily upstream that
change too.

> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  .../0007-Remove-undefined-printf.patch        | 32 +++++++++++++++++++
>  .../libunwind/libunwind_1.6.2.bb              |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-support/libunwind/libunwind/0007-Remove-=
undefined-printf.patch
>
> diff --git a/meta/recipes-support/libunwind/libunwind/0007-Remove-undefin=
ed-printf.patch b/meta/recipes-support/libunwind/libunwind/0007-Remove-unde=
fined-printf.patch
> new file mode 100644
> index 000000000000..1826d8d72405
> --- /dev/null
> +++ b/meta/recipes-support/libunwind/libunwind/0007-Remove-undefined-prin=
tf.patch
> @@ -0,0 +1,32 @@
> +From ed4777e3200aadacfaf2b48e1cd6dec9da37c737 Mon Sep 17 00:00:00 2001
> +From: Jon Mason <jon.mason@arm.com>
> +Date: Tue, 21 Mar 2023 15:14:10 +0000
> +Subject: [PATCH] Remove undefined printf
> +
> +Seeing the following error when building with clang for Linux on Arm
> +| ../../libunwind-1.6.2/src/arm/Gtrace.c:529:7: error: call to undeclare=
d library function 'printf' with type 'int (const char *, ...)'; ISO C99 an=
d later do not support implicit function declarations [-Wimplicit-function-=
declaration]
> +|       printf("XXX1\n");
> +
> +Based on other printf's in libunwind, this appears to not be used on
> +Linux (and appears to only be used for BSD).  So, add an ifdef around
> +this chunk to only be defined for BSD
> +
> +Upstream-Status: Pending
> +---
> + src/arm/Gtrace.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/arm/Gtrace.c b/src/arm/Gtrace.c
> +index 51fc281..fb73d87 100644
> +--- a/src/arm/Gtrace.c
> ++++ b/src/arm/Gtrace.c
> +@@ -526,7 +526,9 @@ tdep_trace (unw_cursor_t *cursor, void **buffer, int=
 *size)
> +       break;
> +
> +     case UNW_ARM_FRAME_SYSCALL:
> ++#if defined(__FreeBSD__)
> +       printf("XXX1\n");
> ++#endif
> +       break;
> +
> +     default:
> diff --git a/meta/recipes-support/libunwind/libunwind_1.6.2.bb b/meta/rec=
ipes-support/libunwind/libunwind_1.6.2.bb
> index 716be9a452f4..74d7874f50bb 100644
> --- a/meta/recipes-support/libunwind/libunwind_1.6.2.bb
> +++ b/meta/recipes-support/libunwind/libunwind_1.6.2.bb
> @@ -5,6 +5,7 @@ SRC_URI =3D "http://download.savannah.nongnu.org/releases=
/libunwind/libunwind-${PV
>             file://0004-Fix-build-on-mips-musl.patch \
>             file://0005-ppc32-Consider-ucontext-mismatches-between-glibc-=
and.patch \
>             file://0006-Fix-for-X32.patch \
> +           file://0007-Remove-undefined-printf.patch \
>             "
>  SRC_URI:append:libc-musl =3D " file://musl-header-conflict.patch"
>
> --
> 2.30.2
>

