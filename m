Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2665CFEEF47
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 13:45:20 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81586.1775569518121449956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 06:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HZAi6qvV;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59de8155501so5839128e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 06:45:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775569516; cv=none;
        d=google.com; s=arc-20240605;
        b=dgeaUlIBzD+/9BtH5y8rJCiKoMT4w7hHgBeR9tVGHe8WiCnvhHCPYIG7mOu8/+ACl/
         T8D/YqpsXT0KxCIqHq9Oz8B9TOnZVMV0rUFfqt3OXlBgcqy3FhQ033Q2PgQVpmrwbP6W
         7ceuoi3zSV7gfu5jXAysVCtGp1zyQHswfg9b+E/BrkDQg831hxrCYzrs0614huxlcs2l
         y0W5AFP2YQXuAuVnHEls/JXvKzK2gVXTLmzJfLZ4SsH+B22gdheT2XpBhJBPN/qY6TaW
         RvH20r4+14ommESkANAecmxaYg+Glo1/wcvXQ2vR5U2vD666YnP8eYg8RjPK12TrbqQI
         Wamg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z9xoB/gavcUC6vxAtyZE9JvUPr5MjoBbAefhm1D1LZU=;
        fh=OwEGsuUTqZbR3bu1Dsw0Gs2ZTr4+cbCmfklWGCyCgU0=;
        b=Yk8yFGZfmyy+TE3gKCodFOE5+KriqdJHw1I4tc77hDfWDBC/u6lWUJpBelQHW3Nazw
         DcvGGFBakYHKBFcDxQImPNgDOP9C4XSCrg/JQfy9MjUYzcMvRyWbCgFo31CGOfZitX2S
         681gUIpxLgD//Wui44L5SYZuvqfMNo/5gbsDUrg85cRCjpL4j2QzgjGNsaFbiuThWKiT
         82b4HOr+km/s+0zQl/PtMDk5rZNmMzA80S0lsX3rKyEJ/GvX6krCMyzFKqStqtyssSZ2
         FTMtfExFgQS+d4gad0HNSv2V0zhxhNDWlXCVLvmnCHjLCuYPx1SFpJFuPDHrWNSDKJ6l
         5a3w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775569516; x=1776174316; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9xoB/gavcUC6vxAtyZE9JvUPr5MjoBbAefhm1D1LZU=;
        b=HZAi6qvV83YLWfV8KLwsgx3MKS8q43cOK6F1XuQJNTezSdUVfAMzCIVKC3BRfN72LR
         /o44EpyoHnWmRZjDWgpc4co7v3O9czTFyaKZEJfDHId/jUAOUMoS00ydI5SVijBKInrk
         rj2MMW9tuieq34PPG8ubryXD9a2AdVCGMiUn0gNZaASPmuZnKZ6xpFi7iAqXyDOGlIYg
         S65SsG27tZJTt8ojt3uB/P3fE4UJO/Y+NNHBm6a1cXqWSWKLlVrNmKN/f0begdZW0yYy
         F+gWiL7fGi9ybPGieUSQa6CXbTYq/9C9tVpbO8fcxFKkbCjfJ6YgpUKJ6CiFJ0ftvURy
         FmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775569516; x=1776174316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z9xoB/gavcUC6vxAtyZE9JvUPr5MjoBbAefhm1D1LZU=;
        b=rGJyZdmRmDVFBaPSStW442y7BHphaiHbcKx+MIITJv/j+1LfT7CefM6JCD6nHmfB9F
         DGSXBY2RRpt6VGZMD1mnlxlko/simuqxCWIKdVRxXDIFjq2rLl0SIP2nv+IE80z/FXex
         BUd+0m6sEf3o3dXNPrENP/hTWhADPKhgblhkpRCahvgC+6wxlgjVDAAYO+bDDd9rRaCT
         RLYBaCcTCi3j/slsWOJuwyQYgax1AzL7u3GzAdp0qYoEeyN6guu/wgqadscjvwlR7Gpg
         gVjubj3Fm8XzGfkntQFqsFprMrXvqZ2BlCJXiDdmPLsN0o0nL9nLku1jwTQqm4CnQdKH
         EX3Q==
X-Gm-Message-State: AOJu0YxRF1c0z+uWnzlIq/Ssa7UWxy7AI/TNhpin9knD6bQ5FPFVJvcK
	Mb2yX0LQ40ibiZKUtUDy+QgmcGWZTpvx1tsy1lkhCF4439HFkWCdi+vtSE/c+15tp1gsaun0bOF
	Vdk4ItKEdas4FS1WuEmofmaez11rq+Hc=
X-Gm-Gg: AeBDiettASv8fStbqHgfSNtH2VBopT490Y3hGCZwDPhzzRp4eX80Fy1KdfzxSJIqlLw
	eomqTe+0b+Yr4USC1Yzv8+yMHd5wKepcrpBXDyLgi6Otd0M09fYBkAnm9Xx8EaGhOIhoLxN5N8T
	s+466sA/OjpkHvSewkG4TJkEpWEKjOK8mKc7j092ik4A+gtDv5rrvuot16+7dzqys6lfovxSRSE
	AcxiTcumvsLbMi/KdWpmobDW+whjxKrmhbnljWePS6L8yq5sfcoUog6B50hHiSheQESMCLjs3Op
	6i+S3tIBZg==
X-Received: by 2002:a05:6512:39d6:b0:5a2:9bd4:30c7 with SMTP id
 2adb3069b0e04-5a337516c84mr5195158e87.0.1775569515808; Tue, 07 Apr 2026
 06:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260407133521.840916-1-zboszor@gmail.com>
In-Reply-To: <20260407133521.840916-1-zboszor@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 7 Apr 2026 15:45:01 +0200
X-Gm-Features: AQROBzCjstSZDUfXqw_5N6Z_5n_EFFjXQHWyz0diu1952NN-WFlGwW9fkbb-1-Q
Message-ID: <CA+chaQc3FhCA66mXB7cUhh15Dfpi1hAGhOW4Xj8wLLrcoqzQdA@mail.gmail.com>
Subject: Re: [whinlatter][PATCH v2 1/2] binutils: Fix build with GLIBC 2.43 on
 the host
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 13:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234738

I've sent this one for scarthgap in:
https://patchwork.yoctoproject.org/project/oe-core/patch/20260326181450.126=
2870-6-martin.jansa@gmail.com/
but surprisingly gcc-cross nor binutils were failing for me in
whinlatter with ubuntu-26.04, please help asking Yoann to accept them
(https://lists.openembedded.org/g/bitbake-devel/message/19317),
because last message from him is that he is putting the glibc-2.43
series on hold until there is a new host with glibc-2.43 in
autobuilder and that will probably be after whinlatter is EOL :/.

Cheers,

On Tue, Apr 7, 2026 at 3:35=E2=80=AFPM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9n=
yi <zboszor@gmail.com> wrote:
>
> Added a patch to fix a build error in the CALL_UTIL() macro
> when built against GLIBC 2.43 on Fedora 44. This fixes
> binutils-native.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  .../binutils/binutils-2.45.inc                |  1 +
>  ...tect-against-standard-library-macros.patch | 34 +++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0001-gprofng-=
protect-against-standard-library-macros.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/reci=
pes-devtools/binutils/binutils-2.45.inc
> index 16a63cabc5..666b588062 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.45.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
> @@ -46,4 +46,5 @@ SRC_URI =3D "\
>       file://0018-CVE-2025-11494.patch \
>       file://0019-CVE-2025-11839.patch \
>       file://0020-CVE-2025-11840.patch \
> +     file://0001-gprofng-protect-against-standard-library-macros.patch \
>  "
> diff --git a/meta/recipes-devtools/binutils/binutils/0001-gprofng-protect=
-against-standard-library-macros.patch b/meta/recipes-devtools/binutils/bin=
utils/0001-gprofng-protect-against-standard-library-macros.patch
> new file mode 100644
> index 0000000000..b626c51b6c
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0001-gprofng-protect-agains=
t-standard-library-macros.patch
> @@ -0,0 +1,34 @@
> +From 5f66aee7f4bec7a2d8378034116f5e5c3dc50f41 Mon Sep 17 00:00:00 2001
> +From: Andreas Schwab <schwab@suse.de>
> +Date: Sat, 22 Nov 2025 11:29:43 +0100
> +Subject: [PATCH] gprofng: protect against standard library macros
> +
> +The CALL_UTIL macro can expand to an unparsable expression of the argume=
nt
> +is a macro, like with the new const-preserving standard library macros i=
n
> +C23.
> +
> +       * gprofng/src/collector_module.h (CALL_UTIL): Add parens to not
> +       expand its argument if it is a function-like macro.
> +
> +Signed-off-by: Andreas Schwab <schwab@suse.de>
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommit;h=3D5f66aee7f4bec7a2d8378034116f5e5c3dc50f41]
> +---
> + gprofng/src/collector_module.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_modu=
le.h
> +index b64d69c45ab..859a6dd1f7d 100644
> +--- a/gprofng/src/collector_module.h
> ++++ b/gprofng/src/collector_module.h
> +@@ -119,7 +119,7 @@ typedef struct CollectorUtilFuncs
> + extern CollectorUtilFuncs __collector_util_funcs;
> + extern int __collector_dlsym_guard;
> +
> +-#define CALL_UTIL(x) __collector_util_funcs.x
> ++#define CALL_UTIL(x) (__collector_util_funcs.x)
> +
> + /* The following constants define the meaning of the "void *arg"
> +  * argument of getFrameInfo().
> +--
> +2.53.0
> +
> --
> 2.53.0
>

