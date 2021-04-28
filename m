Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web09.4363.1619652060431054559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 16:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eA8dtIsz;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id h3so30932357qve.13
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 16:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jLZauZueMPa2v5QysgsU6fwyLbM7UIw/vu9rSTHAhE4=;
        b=eA8dtIszO+1frWWz4Oi2vWBJ4HJD5LFHEhN3UStlLem5A9EsjYXYriwzurG6PMWY2h
         QXgGWt5WkffbFs9o82MATsUu0ZR7jjp8Nr6yjGjl+PaKcEbgGKkUoLxFI1HMd3QmxRQn
         dJ6natL/UqV8McyCPyxfxnFYd4MOQ8xrJwrU6sb+FzR9RhumedQFOSX6ZQ2HiUhvZklh
         WpYFoGNtnIrC9G8wq0uRMMOE3m4zpJiApmjnXvyIHrbxfJwid82Ox4hpWF0CkYFyfHfo
         zWf3bxl1KNXZ6m9MqkMCS/W8T2xS5mUvc/mjq1PCp3UD7ZgfkpCSID+NJl1R1GlbLybR
         XFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jLZauZueMPa2v5QysgsU6fwyLbM7UIw/vu9rSTHAhE4=;
        b=tDGneQhX7DnUDqwGLwBE1Gn9IL27r+I8GfClb2Y9PO6BLTorakxFHv9FWloqhvpa+V
         bD3h0AnBGy0RRVk5eVMtniNouvCPXBfh3FTtaiu9m7fVo9TLG1aqpoySS+3sz18hOCAa
         3jgjy27ERrg7vy0STiOsqQbvlSISPY9LKf0Evccc0x60A62YVnE3EENB1CXAUf7u9L/k
         q5yCnUatpCRU1TpdAPezjVSydBVRxHJTCj4sF8MreF53xM6ymYAML1fRIKibnN6tpYwB
         A3BuBVRlZTzsgRcjmUcjCADydxJgkWQ6HEPy8xXNAogcrkxM5WOP83jUS0rypt/HsWNa
         p1+w==
X-Gm-Message-State: AOAM533SWJ0OGElIX/6R6WpdpvNZybJCKQTxC8ko1dz+f9R9pB4Qxfdv
	Vb1fzMPB0cigVYv7+SafteRTmWgxPX9QWZ62pZY=
X-Google-Smtp-Source: ABdhPJyOEDdCOmdNNWEIEDai8EsFQ1p58UohZXyZ8Avl1dP5u+zK5FLPsJxHdxEX/+pOzv/VGkQGK9fpuH6Ovm4Mzfo=
X-Received: by 2002:ad4:5be1:: with SMTP id k1mr31741138qvc.55.1619652059540;
 Wed, 28 Apr 2021 16:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210428191736.26963-1-petr.vorel@gmail.com>
In-Reply-To: <20210428191736.26963-1-petr.vorel@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 28 Apr 2021 16:20:33 -0700
Message-ID: <CAMKF1sqE9vx-nqVKgDMrqsgnxpBoxXg0FzHt+YrPXyoQ0mCcdQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] ltp: Replace musl patches with do_patch[postfuncs]
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yi Zhao <yi.zhao@windriver.com>, =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>, 
	Andre McCurdy <armccurdy@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 28, 2021 at 12:17 PM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> MUSL related build fixes are not going to be upstreamed.  They just not
> compile broken files, thus replace them with upstream solution for CI:
> just deleting files for musl (easier to maintain).
>

Thanks for doing this Petr, looks good to me.

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  .../ltp/0001-Add-more-musl-exclusions.patch   | 32 --------
>  ...option-to-select-libc-implementation.patch | 81 -------------------
>  meta/recipes-extended/ltp/ltp_20210121.bb     | 24 +++++-
>  3 files changed, 21 insertions(+), 116 deletions(-)
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
>
> diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch b/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
> deleted file mode 100644
> index f2fc8ee958..0000000000
> --- a/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From ad8e73306cb8293f7d32841e1599fd9048801f1f Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Fri, 20 Dec 2019 13:06:05 +0100
> -Subject: [PATCH] Add more musl exclusions
> -
> -Upstream-Status: Pending
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -[ pvorel: rebase for 20200515: enable accept4_01 ]
> -[ pvorel: rebase for 20200120: enable fanotify13, fanotify15, setxattr03 ]
> -Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ----
> - testcases/kernel/syscalls/timer_create/Makefile | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/testcases/kernel/syscalls/timer_create/Makefile b/testcases/kernel/syscalls/timer_create/Makefile
> -index ada241fe1..d454b01e7 100644
> ---- a/testcases/kernel/syscalls/timer_create/Makefile
> -+++ b/testcases/kernel/syscalls/timer_create/Makefile
> -@@ -5,6 +5,10 @@ top_srcdir            ?= ../../../..
> -
> - include $(top_srcdir)/include/mk/testcases.mk
> -
> -+ifeq ($(LIBC),musl)
> -+FILTER_OUT_MAKE_TARGETS        := timer_create01 timer_create03
> -+endif
> -+
> - CPPFLAGS              += -D_GNU_SOURCE -I$(abs_srcdir)/../include
> -
> - LDLIBS                        += -lpthread -lrt
> ---
> -2.26.2
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch b/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
> deleted file mode 100644
> index 29b2bf7e41..0000000000
> --- a/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -From 74958c3e341de713b596c8cfd35b2391d6c7bc09 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 7 Jan 2016 18:19:03 +0000
> -Subject: [PATCH] build: Add option to select libc implementation
> -
> -There are more than glibc for C library implementation available on
> -linux now a days, uclibc cloaked like glibc but musl e.g. is very
> -different and does not implement all GNU extensions.
> -
> -Disable tests specifically not building _yet_ on musl based systems
> -
> -Upstream-Status: Pending (pvorel: this is not going to be fixed, instead
> -each test needs to be fixed)
> -
> -rt_tgsigqueueinfo fails with:
> -rt_tgsigqueueinfo01.c: In function 'sigusr1_handler':
> -rt_tgsigqueueinfo01.c:42:22: error: 'siginfo_t' {aka 'struct <anonymous>'} has no member named '_sifields'; did you mean '__si_fields'?
> -   42 |  sigval_rcv = uinfo->_sifields._rt.SI_SIGVAL.sival_ptr;
> -      |                      ^~~~~~~~~
> -      |                      __si_fields
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -[ pvorel: rebase for 20200515: enable pty, ioctl ]
> -[ pvorel: rebase for 20200120: enable mallopt, profil, rpc016,
> -rt_sigsuspend, sbrk_mutex, setdomainname, sethostname, sigsuspend,
> -testpi-3, testpi-5, testpi-6, ustat; move rt_tgsigqueueinfo
> -from 0006-rt_tgsigqueueinfo-disable-test-on-musl.patch ]
> -Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ----
> - Makefile                           | 5 +++++
> - testcases/kernel/sched/Makefile    | 4 +++-
> - testcases/kernel/syscalls/Makefile | 4 ++++
> - 3 files changed, 12 insertions(+), 1 deletion(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 768ca4606..e9d679a71 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -41,6 +41,11 @@ vpath %.mk          $(top_srcdir)/mk:$(top_srcdir)/mk/include
> - UCLINUX                       ?= 0
> - export UCLINUX
> -
> -+# System C library implementation (glibc,uclibc,musl etc.)
> -+# default to glibc if not set
> -+LIBC                  ?= glibc
> -+export LIBC
> -+
> - # CLEAN_TARGETS:      Targets which exist solely in clean.
> - # COMMON_TARGETS:     Targets which exist in all, clean, and install.
> - # INSTALL_TARGETS:    Targets which exist in clean and install (contains
> -diff --git a/testcases/kernel/sched/Makefile b/testcases/kernel/sched/Makefile
> -index 6a57d79ee..74bb93370 100644
> ---- a/testcases/kernel/sched/Makefile
> -+++ b/testcases/kernel/sched/Makefile
> -@@ -23,5 +23,7 @@
> - top_srcdir            ?= ../../..
> -
> - include $(top_srcdir)/include/mk/env_pre.mk
> --
> -+ifeq ($(LIBC),musl)
> -+      FILTER_OUT_DIRS += process_stress
> -+endif
> - include $(top_srcdir)/include/mk/generic_trunk_target.mk
> -diff --git a/testcases/kernel/syscalls/Makefile b/testcases/kernel/syscalls/Makefile
> -index c6dc8d9e7..aa50761ea 100644
> ---- a/testcases/kernel/syscalls/Makefile
> -+++ b/testcases/kernel/syscalls/Makefile
> -@@ -15,6 +15,10 @@ FILTER_OUT_DIRS     += capget capset chmod chown clone fork getcontext llseek \
> -                  mincore mprotect nftw profil remap_file_pages sbrk
> - endif
> -
> -+ifeq ($(LIBC),musl)
> -+FILTER_OUT_DIRS       += confstr fmtmsg getcontext rt_tgsigqueueinfo
> -+endif
> -+
> - ifeq ($(UCLIBC),1)
> - FILTER_OUT_DIRS       += profil
> - endif
> ---
> -2.26.2
> -
> diff --git a/meta/recipes-extended/ltp/ltp_20210121.bb b/meta/recipes-extended/ltp/ltp_20210121.bb
> index d98c9fdc25..7c4b56b76c 100644
> --- a/meta/recipes-extended/ltp/ltp_20210121.bb
> +++ b/meta/recipes-extended/ltp/ltp_20210121.bb
> @@ -34,9 +34,7 @@ PR = "r4"
>  HASHEQUIV_HASH_VERSION .= ".4"
>
>  SRC_URI = "git://github.com/linux-test-project/ltp.git \
> -           file://0001-build-Add-option-to-select-libc-implementation.patch \
>             file://0007-Fix-test_proc_kill-hanging.patch \
> -           file://0001-Add-more-musl-exclusions.patch \
>             file://0001-Remove-OOM-tests-from-runtest-mm.patch \
>             file://determinism.patch \
>             file://0001-open_posix_testsuite-generate-makefiles.sh-Avoid-inc.patch \
> @@ -78,7 +76,7 @@ do_install(){
>      find ${D}${prefix} -name Makefile | xargs -n 1 sed -i \
>           -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
>           -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
> -         -e 's@[^ ]*--sysroot=[^ "]*@@g'
> +         -e 's@[^ ]*--sysroot=[^ "]*@@g'
>
>      # The controllers memcg_stree test seems to cause us hangs and takes 900s
>      # (maybe we expect more regular output?), anyhow, skip it
> @@ -121,6 +119,26 @@ FILES_${PN} += "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_groups/* ${pr
>  INHIBIT_PACKAGE_STRIP_FILES = "${prefix}/testcases/bin/nm01 ${prefix}/testcases/bin/ldd01"
>  INSANE_SKIP_${PN} += "already-stripped staticdev"
>
> +remove_broken_musl_sources() {
> +       [ "${TCLIBC}" = "musl" ] || return 0
> +
> +       cd ${S}
> +       echo "WARNING: remove unsupported tests (until they're fixed)"
> +
> +       # sync with upstream
> +       # https://github.com/linux-test-project/ltp/blob/master/travis/alpine.sh#L33
> +       rm -rfv \
> +               testcases/kernel/sched/process_stress/process.c \
> +               testcases/kernel/syscalls/confstr/confstr01.c \
> +               testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
> +               testcases/kernel/syscalls/getcontext/getcontext01.c \
> +               testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
> +               testcases/kernel/syscalls/timer_create/timer_create01.c \
> +               testcases/kernel/syscalls/timer_create/timer_create03.c \
> +               utils/benchmark/ebizzy-0.3
> +}
> +do_patch[postfuncs] += "remove_broken_musl_sources"
> +
>  # Avoid file dependency scans, as LTP checks for things that may or may not
>  # exist on the running system.  For instance it has specific checks for
>  # csh and ksh which are not typically part of OpenEmbedded systems (but
> --
> 2.31.1
>
