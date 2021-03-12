Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web12.3984.1615521475466667980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 19:57:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Oey7H5YH;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id s2so2871360qtx.10
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 19:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6j/xZF6VhTew1HX79gG9t+zDhEJtK/JwjMa7dObBdkI=;
        b=Oey7H5YHMLV4R4oUAQiODYRTL/Y1e1um3P6tT0Cxb3R+nCIy39bv8rupZcg487Sm1Y
         uAQQuyxdmv9KQu9UI9kFjJCBgpdSU2sIAytIg8L9Ssf0yx273EXbEg9JjHUYwR1uPLEQ
         o7+xlTEUWv9ghZ/FjluNneNoONBKT0Lsehl5eCD/r1OsUPBZ/Tx3no6M1TNgfbjWOpdZ
         HUsFSECUR/JC7wZmjxoEFyFXRIous+VMWNJh/9cL2hNh2AVaxriNYohRVLK6mMzoLwu8
         N6ituFLMDyVnw+5Y8sa+MVhcjq4YWwekKXJRvh4AWCmiOzZ/wMLIdWGDAPFF12niLDQL
         v1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6j/xZF6VhTew1HX79gG9t+zDhEJtK/JwjMa7dObBdkI=;
        b=RhgxjYz2KLtk+6Y4XQQWS0zP8BrhCBo8lruBOQwouFm8N+RlifMzxrPEcBVub1AXFH
         YWAD54bml38dlHHPwCIo9ulu6XJmonmxpWsXwfiFDbjUJi76XrPfFNmCFaY4U8yh5fXy
         6UpZ55gnfU6AA9I4WZnfGiyTBvSUfbYH6cFpCoQxYGPK1jC0TCbflu3jppVPFvbtfZbD
         NQhdWMZY4R42jxB3bIIiRZoX/h5HXmEfHcvPvSzNJicMFaWMFFMDUsLAEZQGBVSL9jkf
         n7ZdeDdPFL9TXI0mZRl+sM5wWJs0VDjPR4BTO1XEbr9gP0NWQute9NK8N1AAadqblrVB
         K2PQ==
X-Gm-Message-State: AOAM530qrAw6EUy5iFxVSAScayhiA9OWrcdKpepVE4GxWYeGPMyuLDQe
	SgjsVjC2dRNg3D7WK5nRLw3Hcl1u5xUCRLVpSY0=
X-Google-Smtp-Source: ABdhPJxQb/6GjtSFkp4Y9H6gKV70mkT8avk5M7h2UBYGfVqck5gd9XCAded78T1LZXFT9ZLrq1VSNh8VakrvHOpoFa8=
X-Received: by 2002:ac8:4f52:: with SMTP id i18mr10278085qtw.82.1615521474461;
 Thu, 11 Mar 2021 19:57:54 -0800 (PST)
MIME-Version: 1.0
References: <20210312032227.563402-1-yanfei.xu@windriver.com>
In-Reply-To: <20210312032227.563402-1-yanfei.xu@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 11 Mar 2021 19:57:28 -0800
Message-ID: <CAMKF1spbmXaaLNN-sQgwOxNbxWBKovkwMV98o6FK5mnqNMw_PQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] glibc: fix pthread_cond_destroy hang with process-shared mutex
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 11, 2021 at 7:22 PM Xu, Yanfei <yanfei.xu@windriver.com> wrote:
>
> From: Yanfei Xu <yanfei.xu@windriver.com>
>
> This bug can cause pthread_cond_destroy hang with process-shared
> mutex. And it is since glibc-2.32, will be fixed in glibc-2.34.
>
> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>  ...-private-futex-optimization-BZ-27304.patch | 49 +++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.33.bb         |  3 ++
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-optimization-BZ-27304.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-optimization-BZ-27304.patch b/meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-optimization-BZ-27304.patch
> new file mode 100644
> index 0000000000..19f391cc84
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-optimization-BZ-27304.patch
> @@ -0,0 +1,49 @@
> +From c4ad832276f4dadfa40904109b26a521468f66bc Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Thu, 4 Feb 2021 15:00:20 +0100
> +Subject: [PATCH] nptl: Remove private futex optimization [BZ #27304]
> +
> +It is effectively used, unexcept for pthread_cond_destroy, where we do
> +not want it; see bug 27304.  The internal locks do not support a
> +process-shared mode.
> +
> +This fixes commit dc6cfdc934db9997c33728082d63552b9eee4563 ("nptl:
> +Move pthread_cond_destroy implementation into libc").
> +
> +Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
> +
> +Upstream-Status: Accepted [https://sourceware.org/bugzilla/show_bug.cgi?id=27304]
> +Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> +---
> + sysdeps/nptl/lowlevellock-futex.h | 14 +-------------
> + 1 file changed, 1 insertion(+), 13 deletions(-)
> +
> +diff --git a/sysdeps/nptl/lowlevellock-futex.h b/sysdeps/nptl/lowlevellock-futex.h
> +index ecb729da6b..ca96397a4a 100644
> +--- a/sysdeps/nptl/lowlevellock-futex.h
> ++++ b/sysdeps/nptl/lowlevellock-futex.h
> +@@ -50,20 +50,8 @@
> + #define LLL_SHARED    FUTEX_PRIVATE_FLAG
> +
> + #ifndef __ASSEMBLER__
> +-
> +-# if IS_IN (libc) || IS_IN (rtld)
> +-/* In libc.so or ld.so all futexes are private.  */
> +-#  define __lll_private_flag(fl, private)                     \
> +-  ({                                                          \
> +-    /* Prevent warnings in callers of this macro.  */         \
> +-    int __lll_private_flag_priv __attribute__ ((unused));     \
> +-    __lll_private_flag_priv = (private);                      \
> +-    ((fl) | FUTEX_PRIVATE_FLAG);                              \
> +-  })
> +-# else
> +-#  define __lll_private_flag(fl, private) \
> ++# define __lll_private_flag(fl, private) \
> +   (((fl) | FUTEX_PRIVATE_FLAG) ^ (private))
> +-# endif
> +
> + # define lll_futex_syscall(nargs, futexp, op, ...)                      \
> +   ({                                                                    \
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
> index c47826a51e..6ba8cd9b71 100644
> --- a/meta/recipes-core/glibc/glibc_2.33.bb
> +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> @@ -45,6 +45,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
>             file://0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch \
>             file://0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch \
> +           file://0001-nptl-Remove-private-futex-optimization-BZ-27304.patch \
>             "
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
> @@ -55,6 +56,8 @@ PACKAGES_DYNAMIC = ""
>  BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
>  TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
>
> +TARGET_CFLAGS += " ${PROFILING_OPTIMIZATION} "

why do we need this change ?

> +
>  GLIBC_BROKEN_LOCALES = ""
>
>  GLIBCPIE ??= ""
> --
> 2.27.0
>
>
> 
>
