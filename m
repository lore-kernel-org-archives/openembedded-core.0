Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DADECD991
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 17:08:52 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26119.1770311327192588764
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 09:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vdG0jUjc;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso10867665e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 09:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770311325; x=1770916125; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GmN9hgF/MOdzEPwjQogvxCO4O1M3B55kbNsM2Mv24Q=;
        b=vdG0jUjcNxI7Rx6le4DshWtwJMKLUY8nRJe4/QYzmvQj4xMUiZlZ6IwxHXGIhMC6az
         jp4Guzt8zEs5bGWW7z09zpygJCPFuJYEWEaqguD6LWoornuC9YTznAbRpA0msU8D+l53
         1YGSbbSR7l0LFsCcb1tz17QnzIBlUBiKJeKSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311325; x=1770916125;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+GmN9hgF/MOdzEPwjQogvxCO4O1M3B55kbNsM2Mv24Q=;
        b=b5e17u8TAIifgHVzXh/zNpr3j1U6bxYBjrSu7yyvlv/XmMYUlMII43Hk4d85mLSo/l
         A5aIfNr+XhY80m1W34QHy3MiMXIesfPluApkxI4IejBdJCtdm1HliyfRivjZBZRVySVz
         kgYV3EE/PmxmEu/gezwn7EHid4UkCF4uZKHvexdRN0ZfnCSd0UPucEb4kW3R2jrc2voS
         KiWZ9MVXqqwrKxwLLiAdjGe9N9oQ1V48/cSRg8e96n8wnm+0U92rwt1o6g+hxkOvpt70
         7xBURwj1SpsSGL309L2OBDRX3tPdmMT4ruSeCaoRntv3j+lJhjemJJQkhpV7UEfc1qrV
         DXxA==
X-Forwarded-Encrypted: i=1; AJvYcCUH4nKa2c6ZthHYe/xCdzMQGENJ/61JS+u0znMCG/XbD6xZBqxzaMLDk5wBspUkAKjzIoILNfaaOz1ga8Qlqjjghg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyoP/zR/qpfpnwzr7lmKq/6OAMHd1dUChHnpWCijgMls6O8qgJ2
	+FA897z8CccSONs5L3rgLLVwXzi/hyN+r8WhVHclYmla5wYGWo8bKKTMhwCrIvPeYoHWo9/jK4d
	mMUK4Fso=
X-Gm-Gg: AZuq6aIjcA9fNnpNrNAd56WxAhB1iDJFpE9zU7KhPW7bCsekQKwwr2CLIfvnobJJk1r
	9LViDgRaLBbJ/NksxR8WCcV3ZwPMmNmn0BUXo3ALLxkVhT8kKBhZCdA4taCUDgMHTMonWj8f2DX
	Qq/Xu6zWoi6+h8ZNDE1W4JhXcWBlDsFLq6+dwI+zHpvwDdFVCTdMnpXK/VLBpNdcCl+WOyot71t
	MbuDbodXW/ovjDNy/1ktauw352AM1lBzGrea6B29YfByPq/B+i8Hqr2fMajfXehoJQ2tSr9VSmg
	F5gaZWY153qyF5+QGkzhxtu5+X6zv/KXRJ+xlDBk93ehsPM7HYf3ysV7uqcb2k+U9qDShZ1FceT
	Eh2VAyB7Ui6EEtW9nw6iLSW4rWKf45yQwXaSXkZ4AhUoDPGftSispJpgjEnw+5I+mcEJ2N55vsf
	ztnJRTk4L0ymmJwWK6IEBQlZYxoRwMmzC7k73xTsfwv8y9caLiaVYZFsV2+DY6Tg+skEfVwrdlc
	+k=
X-Received: by 2002:a05:600c:34d1:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-483201dadccmr1552675e9.3.1770311325525;
        Thu, 05 Feb 2026 09:08:45 -0800 (PST)
Received: from localhost (2a01cb001331aa008fabb4f40b3eded6.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8fab:b4f4:b3e:ded6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d2bab2sm120822695e9.3.2026.02.05.09.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 09:08:45 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 18:08:44 +0100
Message-Id: <DG76ZND24N16.1FFJG987M3ZUU@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] glibc: stable 2.39 branch updates
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260125161623.729884-1-peter.marko@siemens.com>
In-Reply-To: <20260125161623.729884-1-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 17:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230586

On Sun Jan 25, 2026 at 5:16 PM CET, Peter Marko via lists.openembedded.org =
wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> git log --oneline 58cbbd43fe82910cf8ae9008351b0b0665104500..ce65d944e38a2=
0cb70af2a48a4b8aa5d8fabe1cc
> ce65d944e3 (HEAD -> release/2.39/master, origin/release/2.39/master) posi=
x: Reset wordexp_t fields with WRDE_REUSE (CVE-2025-15281 / BZ 33814)
> 831f63b94c resolv: Fix NSS DNS backend for getnetbyaddr (CVE-2026-0915)
> fb22fd3f5b memalign: reinstate alignment overflow check (CVE-2026-0861)
> 10c0bcb3d3 support: Exit on consistency check failure in resolv_response_=
add_name
> f47dd22366 support: Fix FILE * leak in check_for_unshare_hints in test-co=
ntainer
> 4a53354eaf sprof: fix -Wformat warnings on 32-bit hosts
> beb8267909 sprof: check pread size and offset for overflow
> c07002038f getaddrinfo.c: Avoid uninitialized pointer access [BZ #32465]
> ae5fb93559 nptl: Optimize trylock for high cache contention workloads (BZ=
 #33704)
> efff7cb659 ppc64le: Power 10 rawmemchr clobbers v20 (bug #33091)
> f6becd8ae8 ppc64le: Restore optimized strncmp for power10
> 0daa4e46b8 ppc64le: Restore optimized strcmp for power10
> 28c1de6580 AArch64: Fix instability in AdvSIMD tan
> 03d0393343 AArch64: Optimise SVE scalar callbacks
> 0d05a895f1 aarch64: fix includes in SME tests
> c1dc4412f8 aarch64: fix cfi directives around __libc_arm_za_disable
> d60f15dc89 aarch64: tests for SME
> d1d0d09e9e aarch64: clear ZA state of SME before clone and clone3 syscall=
s
> dbe1904b7c aarch64: define macro for calling __libc_arm_za_disable
> 58cf4aa421 aarch64: update tests for SME
> 1b3bd9a9a6 aarch64: Disable ZA state of SME in setjmp and sigsetjmp
> 38942a336b linux: Also check pkey_get for ENOSYS on tst-pkey (BZ 31996)
> c74d59a656 aarch64: Do not link conform tests with -Wl,-z,force-bti (bug =
33601)
> 323ad087a1 x86: fix wmemset ifunc stray '!' (bug 33542)
>
> Testing Results:
>              Before    After    Diff
> PASS         4926      4921     -5
> XPASS        4         4         0
> FAIL         223       229      +6
> XFAIL        16        16        0
> UNSUPPORTED  224       224       0
>
> Changes in failed testcases:
>
> testcase-name                                before  after
> elf/tst-audit21                              PASS    FAIL
> malloc/tst-malloc-too-large                  PASS    FAIL
> malloc/tst-malloc-too-large-malloc-check     PASS    FAIL
> malloc/tst-malloc-too-large-malloc-hugetlb1  PASS    FAIL
> malloc/tst-malloc-too-large-malloc-hugetlb2  PASS    FAIL
> malloc/tst-malloc-too-large-mcheck           PASS    FAIL

Hello Peter,

Those test results show a clear regression (6 PASS->FAIL
transistions).

I noticed that the same tests have been fixed with the whinlatter
upgrade:
https://lore.kernel.org/openembedded-core/c5401d89c51fe73d93afc73d73cb0f93c=
00bbca7.1769845858.git.yoann.congal@smile.fr/

I'm not familiar with the glibc stable policy but shouldn't we wait the
next cycle to get the fix for those tests and avoid triggering this
regression in the meantime?

What do you think?

> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  meta/recipes-core/glibc/glibc_2.39.bb     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index 2ca15711587..03a8e5d01e3 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.39/master"
>  PV =3D "2.39+git"
> -SRCREV_glibc ?=3D "58cbbd43fe82910cf8ae9008351b0b0665104500"
> +SRCREV_glibc ?=3D "ce65d944e38a20cb70af2a48a4b8aa5d8fabe1cc"
>  SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
> =20
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
> diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/gl=
ibc/glibc_2.39.bb
> index ff6c8f3b437..7958d64eed1 100644
> --- a/meta/recipes-core/glibc/glibc_2.39.bb
> +++ b/meta/recipes-core/glibc/glibc_2.39.bb
> @@ -18,7 +18,7 @@ easier access for another. 'ASLR bypass itself is not a=
 vulnerability.'"
> =20
>  CVE_STATUS_GROUPS +=3D "CVE_STATUS_STABLE_BACKPORTS"
>  CVE_STATUS_STABLE_BACKPORTS =3D "CVE-2024-2961 CVE-2024-33599 CVE-2024-3=
3600 CVE-2024-33601 CVE-2024-33602 CVE-2025-0395 \
> -    CVE-2025-4802 CVE-2025-5702 CVE-2025-8058"
> +    CVE-2025-4802 CVE-2025-5702 CVE-2025-8058 CVE-2025-15281 CVE-2026-08=
61 CVE-2026-0915"
>  CVE_STATUS_STABLE_BACKPORTS[status] =3D "cpe-stable-backport: fix availa=
ble in used git hash"
> =20
>  DEPENDS +=3D "gperf-native bison-native"


--=20
Yoann Congal
Smile ECS


