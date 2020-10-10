Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.3201.1602290574874311614
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 17:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cbOEIZpp;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id g29so8630410pgl.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 17:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WTOpXnvcLJ5WYjF5Eu/DQkMjF4UQn2dRmhrB8hJl640=;
        b=cbOEIZppQKa9hv6FwNVm8KWCCgnNdG+jCE99zcAq7rXpyUiJxYAksYLnrIWBpBfhUJ
         oPDMiYeMjkLNRxhrDEH4c8J68ELHDZBBdtd1ynCUb5p2cO3bOhiHhzZR7yImI1UpV2vl
         Y0tnOPQAEH20XFeZ2/vCo4lrGpPTqC+tGS4SgmA7vOSWmLMdHYlQGNAWqE9dnNknvFLQ
         5MAIhPL9RPKTK/JVOxO2ozqeeUxatMrlBPY6q2hATryszc11l/+nNEh06As3rx0Cbwo0
         QHdvOfGJz1le6so8PisEqXXLixzPYC4LcJZbmLSliEistjOUGVBacuCwwDnb5H30Kt+e
         rLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=WTOpXnvcLJ5WYjF5Eu/DQkMjF4UQn2dRmhrB8hJl640=;
        b=QdiLs2bKWLPubdYsn15RwcjoxNqz3GAfO5M6X9qfzVOpdg2IstJQ+DgilpGE2zX2yK
         QDSkVgvyQnTnX3UjRqdaJ8ae40EujO4gUshbAPeRKtmL9202MZfR8tdbLhgOrQaIft4C
         dQXoggRmblwAvmBsorST/vGNZftEoRhbzDoffSCoYiwgk+GCuhUiIkpKZ/YoEzKls3NL
         Jgk6us0w8+el2KTVMBwbSroMt2pEAjblFrBkdajWQpwltPP7dev3YBMyiCPLxynUd4K+
         VTYsJnybxOeBGDLiVKzDrVFIgqY/BQkJskB1oGdQkmnM8ft8YBpDew+3b7GC3cT3rPlb
         pdcA==
X-Gm-Message-State: AOAM5315zzrKUKSs0dGIBXQjK0zPjwUUcsGYX2v9TCRIceBREL55w9kW
	3PMhozSughcoJgxm7id3VJ4tUxmHC7Z5eg==
X-Google-Smtp-Source: ABdhPJyVodP1qbZKkWq9SVNRSdznNaRJyBNDsozZ8+22V2H6nGiW0mETTWdZQV4yIUDu/nhdjwmQXw==
X-Received: by 2002:a63:e501:: with SMTP id r1mr5139207pgh.95.1602290573911;
        Fri, 09 Oct 2020 17:42:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:35fc:34e3:9834:c6b? ([2601:646:9200:4e0:35fc:34e3:9834:c6b])
        by smtp.gmail.com with ESMTPSA id b11sm11868899pfd.33.2020.10.09.17.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 17:42:53 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] valgrind: drd: fix pthread intercept test failures
To: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20201009204431.681565-1-stacy.gaikovaia@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c30dd6a8-ba13-c450-cc54-ce45ec1641e8@gmail.com>
Date: Fri, 9 Oct 2020 17:42:52 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201009204431.681565-1-stacy.gaikovaia@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 10/9/20 1:44 PM, Stacy Gaikovaia wrote:
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
> === Test Summary ===                                                                       TOTAL: 728
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
>   .../valgrind/0001-drd-Port-to-Fedora-33.patch | 48 +++++++++++++++++++
>   .../valgrind/valgrind_3.16.1.bb               |  1 +
>   2 files changed, 49 insertions(+)
>   create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
> 
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
> new file mode 100644
> index 0000000000..693403a29d
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
> +(https://sourceware.org/git/?p=valgrind.git), commit id
> +15330adf7c2471fbaa6a0818db07078d81dbff97. It was modified to
> +remove the changes to the valgrind NEWS file, as these are difficult to
> +maintain and don't impact the valgrind code itself.
> +
> +Upstream-Status: Backport

add relevant link to above. This helps with context in next upgrades
otherwise this patch is fine

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
>              file://s390x_vec_op_t.patch \
>              file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
>              file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
> +           file://0001-drd-Port-to-Fedora-33.patch \
>              "
>   SRC_URI[md5sum] = "d1b153f1ab17cf1f311705e7a83ef589"
>   SRC_URI[sha256sum] = "c91f3a2f7b02db0f3bc99479861656154d241d2fdb265614ba918cc6720a33ca"
> 
> 
> 
> 
> 
