Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web09.10561.1617815782658386902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 10:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LTFH7XPg;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id t13so3359904qvs.7
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Apr 2021 10:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FMnQAN/zqAipKIl9H0ul2Wgd2vyEyh46+WzUmBMSq0o=;
        b=LTFH7XPgfGpemwjzepa79XDhERNptQRWDHZNvTr2ndGx5qa3tj7bQe1xIKyiUYbTAc
         75q3eu2Qq3LoFlzCfmhJOS6AQdov4hu1uDkJIKjFc3hmKfy5yxR80NLkjY+/apWEVkfy
         DopubCRYhwTpaAzTulNASMy+7nDBueEVGm9H2xwx7VXyQcMthnKmQizBm+WOIEZTAaqa
         pVTMekaoYNlVLaXAqNwZmCt5TolO3/LnYVryuiyNfBNfg8mHhuQqSa8ymZtc5G2Ap+Bv
         mKLZEVQ9UVJqGYdFQCGjZ+MC3ceGa7yqg1Dbm/TylRTTk1iz8+9+ErLwcRnHrAw/unLu
         MGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FMnQAN/zqAipKIl9H0ul2Wgd2vyEyh46+WzUmBMSq0o=;
        b=P2vmTuXI7qt3/07XD2ejtdU1YuyXTVYuuVhbvp+WJa8hUE7RYF3peLiOM7LiXr9z+S
         YSZOgsFQILo8J5uarEcwwSCR9JMORNcjmzqrXFhgK/WAciUraliSfPzYmkXtWMGhnpkY
         Z05Rec2fbSvlfEKGuVLhPpuzXN1104dMw95/o4q0dyen9zX0Axe4pzC5tTBBqUSt9uII
         VH4n5ttpT6QRR5JOYR6bhPDbAI17/RITDxTnZjCfNHX9pjmz+skLw5MJu2PtH/Q0qXbP
         t2uzRDEw16S9dL79vvbdC7aKiow1sqVyAyfTolVrV4SEHFIwLeFJg2pYVbAHmCOjjqkD
         akvA==
X-Gm-Message-State: AOAM532bllACIKkcxmID3mLVWb9z9rIkkXJG4pOG7b3eqSluzxx6HtQI
	9q4rSq6fOzaljKko9NcIa+wIrSPrFELV8hgMVMQ=
X-Google-Smtp-Source: ABdhPJxNVysV+0Am4DUfEPBmlYirl/wGHJQFy76e8qpTpmpEakHXr9bfm5yD13PzHcUh+q/aWBBE0uGNLDk3fJG1kWY=
X-Received: by 2002:a05:6214:f27:: with SMTP id iw7mr4760434qvb.50.1617815781717;
 Wed, 07 Apr 2021 10:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210407080824.37913-1-mingli.yu@windriver.com>
In-Reply-To: <20210407080824.37913-1-mingli.yu@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 7 Apr 2021 10:15:55 -0700
Message-ID: <CAMKF1spZrThpGcEBPxto2NZ9PJ5Mzs7fwGPAagLbLsp0m6PgKQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxshmfence: Build fixes for riscv32
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 7, 2021 at 1:08 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> NR_futex is not defined by newer architectures e.g. riscv32 as
> they only have 64bit variant of time_t. Glibc defines SYS_futex
> interface based on __NR_futex, since this is used in applications,
> such applications start to fail to build for these newer architectures.
>
> Define a fallback to alias __NR_futex to __NR_futex_time64 to make
> SYS_futex keep working.
>
> Reference: https://git.openembedded.org/openembedded-core/commit/?id=7a218adf9990f5e18d0b6a33eb34091969f979c7
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...h-Define-SYS_futex-if-it-does-not-ex.patch | 39 +++++++++++++++++++
>  .../xorg-lib/libxshmfence_1.3.bb              |  4 +-
>  2 files changed, 42 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libxshmfence/0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch
>
> diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence/0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch b/meta/recipes-graphics/xorg-lib/libxshmfence/0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch
> new file mode 100644
> index 0000000000..3e87794d20
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libxshmfence/0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch
> @@ -0,0 +1,39 @@
> +From 5827f6389a227157958d14a687fb29223cb3a03a Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Wed, 7 Apr 2021 07:48:42 +0000
> +Subject: [PATCH] xshmfence_futex.h: Define SYS_futex if it does not exist
> +
> +_NR_futex is not defines by newer architectures e.g. riscv32 as
> +they only have 64bit variant of time_t. Glibc defines SYS_futex
> +interface based on __NR_futex, since this is used in applications,
> +such applications start to fail to build for these newer architectures.
> +This patch defines a fallback to alias __NR_futex to __NR_futex_time64
> +to make SYS_futex keep working.
> +
> +Reference: https://git.openembedded.org/openembedded-core/commit/?id=7a218adf9990f5e18d0b6a33eb34091969f979c7
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + src/xshmfence_futex.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/xshmfence_futex.h b/src/xshmfence_futex.h
> +index 673ac0e..a71efa5 100644
> +--- a/src/xshmfence_futex.h
> ++++ b/src/xshmfence_futex.h
> +@@ -53,6 +53,10 @@ static inline int futex_wait(int32_t *addr, int32_t value) {
> + #include <sys/time.h>
> + #include <sys/syscall.h>
> +
> ++#if !defined(SYS_futex) && defined(SYS_futex_time64)
> ++#define SYS_futex SYS_futex_time64
> ++#endif
> ++
> + static inline long sys_futex(void *addr1, int op, int val1, struct timespec *timeout, void *addr2, int val3)
> + {
> +       return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
> +--
> +2.29.2
> +
> diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
> index cc45696530..d153c7a603 100644
> --- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
> @@ -13,7 +13,9 @@ DEPENDS += "virtual/libx11"
>
>  EXTRA_OECONF += "--with-shared-memory-dir=/dev/shm"
>
> -BBCLASSEXTEND = "native nativesdk"
> +SRC_URI += "file://0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch"
>
>  SRC_URI[md5sum] = "42dda8016943dc12aff2c03a036e0937"
>  SRC_URI[sha256sum] = "b884300d26a14961a076fbebc762a39831cb75f92bed5ccf9836345b459220c7"
> +
> +BBCLASSEXTEND = "native nativesdk"

 can you also. send a pull to meta-riscv to remove it from there ?
