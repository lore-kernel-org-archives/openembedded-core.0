Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.8950.1602828975232260502
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 23:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GKe6tI+U;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id z33so971714qth.8
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 23:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0iYGSXesapmmfckhxuqe6V6kLKxgkDKpyt+n5bOm1V8=;
        b=GKe6tI+UBnrtgQb5XvAOkzki9aHR2nYstIAfBrP7TcENhYsJZ8/BtqkGiv2RjbcUFh
         sdBqDhm01jVkZGi7+o1NN1GU72L8+jegE5tQjO9UFfopd4INwoIitk16u2jsaf6OGllX
         NlwD2w3S9axsj2LoY5zx3UncTQ1caGVCFpUb32mPm2DG9Sy8l7plNZdAlQJXLdW/agEH
         zxURvADkTwA5PFw92BNUZO62CBeYX2bMHp6GTj30ROGSp5+8OAI/eNbfoYyBFlDsWxdL
         6/O0QJEk8Lwlmka5SrYAUc3Qx59aiW/eogQj15q6yGVv5uWATclRJLDWaWnC8/ZuErgH
         8SgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0iYGSXesapmmfckhxuqe6V6kLKxgkDKpyt+n5bOm1V8=;
        b=FjRx9UddhAkQ/0RCHSfGz+80SV1DaChYVdRnJDkU4o9psvuHPOVPevNaJ/GR0UL8v8
         Z5S85+6OuU5lWGAHsNQL3bj+nYHgK+aiu0Ab/FfoEystO8zwrmjSvLKJ6hkrPQW8lxkT
         nhvmmMHo/JVO+aHHP13h26DcmZ+9SZTnf6YaBgntxshpw97nDEN0+K6CxYPqOI8voVB4
         qa+2qVoW8H5pTOLOqv5iZ3geXendJEmCM0BPlts1pZURmKaNnu00yzOoPiYjDfM2wGyW
         8BeRZ7U+77KxdsdWL6oWmVc9FwpaZYPdJbI2B6GIOTy06y/oL2JhFpw7uBCktPJFz220
         BE3g==
X-Gm-Message-State: AOAM530NGydkntcSyZK1Q0ClEdTreZSrqxu2SaNE793r+I3Wz5uzwo9H
	+07jbuGXyRPiOZ8ATZdF9nXH4mgnKYYH6GiH6/c=
X-Google-Smtp-Source: ABdhPJzlxFFgZxXHTkcoSw8XkvmPMD+USYMXNTkh1fNwji2+ZScVRyZA00ztBEBFSGAAqzCz2dqCB+yZcFncVJB3EHw=
X-Received: by 2002:ac8:3975:: with SMTP id t50mr1933735qtb.53.1602828974194;
 Thu, 15 Oct 2020 23:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201013144426.888835-1-stacy.gaikovaia@windriver.com>
In-Reply-To: <20201013144426.888835-1-stacy.gaikovaia@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 15 Oct 2020 23:15:47 -0700
Message-ID: <CAMKF1spc2tkSxzj1DKwZne8_Q0_2Sef9gqfAToahYLq-ow8P5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] valgrind: drd: fix pthread intercept test failures
To: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I think this is failing builds on musl see [1]
perhaps you also need to check for __GLIBC__

http://errors.yoctoproject.org/Errors/Details/509767/

On Tue, Oct 13, 2020 at 7:44 AM Stacy Gaikovaia
<Stacy.Gaikovaia@windriver.com> wrote:
>
> From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
>
> After glibc uprev 2.31 -> 2.32, the following drd ptests
> fail with the error "condition variable has not been initialized".
>
> drd/tests/annotate_hb_err
> drd/tests/annotate_sem
> drd/tests/annotate_rwlock
> drd/tests/annotate_order_2
> drd/tests/annotate_smart_pointer
> drd/tests/annotate_spinlock
> drd/tests/monitor_example
> drd/tests/pth_cond_race
> drd/tests/pth_inconsistent_cond_wait
>
> In glibc 2.32, the POSIX thread functions are in both
> libc and libpthread, causing valgrind to misinterpert
> test behaviour. This patch tells valgrind to intercept
> both the libc and the libpthread functions, resolving
> these ptest failures.
>
> Here are the latest test results on qemux86-64:
> === Test Summary ===
> TOTAL: 728
> PASSED: 688
> FAILED: 1
> SKIPPED: 39
>
> The failed test is in helgrind:
> FAIL: helgrind/tests/pth_destroy_cond
>
> Patch can be removed once we uprev valgrind.
> See valgrind commit 15330adf7c2471fbaa6a0818db07078d81dbff97.
>
> Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
> ---
>  .../valgrind/0001-drd-Port-to-Fedora-33.patch | 48 +++++++++++++++++++
>  .../valgrind/valgrind_3.16.1.bb               |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
> new file mode 100644
> index 0000000000..37f6ea667d
> --- /dev/null
> +++ b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
> @@ -0,0 +1,48 @@
> +From 15330adf7c2471fbaa6a0818db07078d81dbff97 Mon Sep 17 00:00:00 2001
> +From: Bart Van Assche <bvanassche@acm.org>
> +Date: Sat, 19 Sep 2020 08:08:59 -0700
> +Subject: [PATCH] drd: Port to Fedora 33
> +
> +Apparently on Fedora 33 the POSIX thread functions exist in both libc and
> +libpthread. Hence this patch that intercepts the pthread functions in
> +libc. See also https://bugs.kde.org/show_bug.cgi?id=426144 .
> +
> +Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> +
> +This patch was imported from the valgrind sourceware server
> +(https://sourceware.org/git/?p=valgrind.git;a=commit;h=15330adf7c2471fbaa6a0818db07078d81dbff97)
> +It was modified to remove the changes to the valgrind NEWS file,
> +as these are difficult to maintain and don't impact the valgrind
> +code itself.
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
> +---
> + drd/drd_pthread_intercepts.c | 9 +++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/drd/drd_pthread_intercepts.c b/drd/drd_pthread_intercepts.c
> +index 58c45aaec..c2882e5ab 100644
> +--- a/drd/drd_pthread_intercepts.c
> ++++ b/drd/drd_pthread_intercepts.c
> +@@ -174,7 +174,16 @@ static int never_true;
> +    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
> +    { return implf argl; }
> + #else
> ++/*
> ++ * On Linux, intercept both the libc and the libpthread functions. At
> ++ * least glibc 2.32.9000 (Fedora 34) has an implementation of all pthread
> ++ * functions in both libc and libpthread. Older glibc versions only have an
> ++ * implementation of the pthread functions in libpthread.
> ++ */
> + #define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)                    \
> ++   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl;           \
> ++   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
> ++   { return implf argl; }                                               \
> +    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl;     \
> +    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl      \
> +    { return implf argl; }
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
> index d4ca1a7752..7508098b55 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
> @@ -40,6 +40,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
>             file://s390x_vec_op_t.patch \
>             file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
>             file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
> +           file://0001-drd-Port-to-Fedora-33.patch \
>             "
>  SRC_URI[md5sum] = "d1b153f1ab17cf1f311705e7a83ef589"
>  SRC_URI[sha256sum] = "c91f3a2f7b02db0f3bc99479861656154d241d2fdb265614ba918cc6720a33ca"
> --
> 2.25.1
>
>
> 
>
