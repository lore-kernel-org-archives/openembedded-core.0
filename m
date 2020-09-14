Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com [209.85.221.196])
 by mx.groups.io with SMTP id smtpd.web10.65469.1600102718357861531
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 09:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=syHhgpqj;
 spf=pass (domain: gmail.com, ip: 209.85.221.196, mailfrom: armccurdy@gmail.com)
Received: by mail-vk1-f196.google.com with SMTP id n7so127735vkq.5
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 09:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x5WGVht4VX33wuTy/kxGXJnKkhmbyrhe2dI4MWfohh4=;
        b=syHhgpqjMy2Qprrdu/9GnjiFuR/+KUbq8YRaJ7Hfkvx53cLRWXsgrA/ZJdUS1m4hw3
         H+UEtgKg/AnJPpZD9NCF8eHggfEcM/XhiwurdIN1M/oHoBljhNctzYbCqXfOZk7TdiMS
         /SbPT+id1XUFZ6bVIJbn+ANfyD8MEfMikkkjPW4fUHRrHtXcxnt5i/QDXaHQoc7eeBD6
         QR9fAKpHkLvtUNz0J0MkenKzlHrEyEWk/jUj6tqUDaQgwakUebbxd7CuEN0TscQmYNGV
         qLxBiidu5ff2+aOqNzbQRA2l+gQ6pcfSoCxh+fm7cuNXNGXKQRDFZK49Dwhvoq7uiikp
         pXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x5WGVht4VX33wuTy/kxGXJnKkhmbyrhe2dI4MWfohh4=;
        b=DRnxhLXdNnGMAxFcGnNWfs9uGqFDsaiM/5vI0B2ER3vDTWVOAJoBPU3pm3XPzHHAEv
         U9YLCEc3gpiKJ0PjqPDezjrDQH4XPyP/uXaPe2tclfCPd+BKo6N+8RVt5x+aCcgWR/f0
         q3uAASQrMnxNpCyc+ICLJQmRlyytCKoR5C+I9NQozKPeHnNWGwRRvn+A6/ps94KHLMAp
         gN3JeMV/kU1PGTm/C1QtVW1iLfK7TeH74MGM6Yt87C54RWsXNtVsGa3l58SlVxDxH6/1
         zk5CZVRfZiGOmzGG+Z57yXrrFLNlMJ31l+OY7yvbr81JfoJNVbTmh27M1DBa1SeQgaQX
         KlMA==
X-Gm-Message-State: AOAM533/gOSMmgAogKBcLT/qfy3H33Br7yBMyFmIRr22IIEQ0/l2awzu
	10SHb8qHs/JJ8J4NhbLJ4k8gHmbLYCMQFDyZm80=
X-Google-Smtp-Source: ABdhPJwjwL7bz6hd3mHtk7wemJ7j+UhYddnYzn2oMDuemg+o9Yn4xv95dd+ivp2l57lLHVSVJTdxfY7Qjyi6P4cwuWc=
X-Received: by 2002:a1f:284e:: with SMTP id o75mr7583664vko.19.1600102717329;
 Mon, 14 Sep 2020 09:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200914083507.36978-1-mingli.yu@windriver.com>
In-Reply-To: <20200914083507.36978-1-mingli.yu@windriver.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 14 Sep 2020 09:58:27 -0700
Message-ID: <CAJ86T=XPi8SKOi6N=sTwZL12SpNLeLAzVZivfDCN43VCNbtUNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bison: remove the parallel build patch
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 14, 2020 at 1:35 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Remove the parallel build patch as the issue have already been
> fixed in bison 3.7.2(f7b642cf build: fix incorrect dependencies).

If parallel make issues have been fixed upstream then this workaround
should be removed from the recipe too:

 # Reset any loadavg set via environment, it breaks parallel build
 # | ../bison-3.5.2/lib/uniwidth/width.c:21:10: fatal error:
uniwidth.h: No such file or directory
 # |  #include "uniwidth.h"
 # |           ^~~~~~~~~~~~
 EXTRA_OEMAKE_append = " -l"

> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../0001-bison-fix-the-parallel-build.patch   | 63 -------------------
>  meta/recipes-devtools/bison/bison_3.7.2.bb    |  1 -
>  2 files changed, 64 deletions(-)
>  delete mode 100644 meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
>
> diff --git a/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch b/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
> deleted file mode 100644
> index c3be91a109..0000000000
> --- a/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -From e0dbcee6e25b3c0cb11a627bbfe3af45ef67ec30 Mon Sep 17 00:00:00 2001
> -From: Mingli Yu <mingli.yu@windriver.com>
> -Date: Thu, 14 May 2020 15:23:16 +0800
> -Subject: [PATCH] bison: fix the parallel build
> -
> -Explicitly make the BUILT_SOURCES which
> -are the generated headers such as stdio.h,
> -fcntl.h and etc to be the dependencies of
> -the gl_LIBOBJS such as libbison_a-sprintf.o,
> -libbison_a-printf.o and etc to guarantee the
> -BUILT_SOURCES is generated before begin to
> -compile EXTRA_lib_libbison_a_SOURCES such as
> -fprintf.c in parallel builid, otherwise there
> -may come below error:
> - | muscle-tab.c:(.text+0x77a): undefined reference to `rpl_sprintf'
> -
> -It does the same for src_bison_OBJECTS and
> -lib_libbison_a_OBJECTS to make sure BUILT_SOURCES
> -generated before begin to compile src_bison_SOURCES
> -which contains AnnotationList.c and etc.
> -
> -BTW, the MOSTLYCLEANFILES also contains the
> -generated header needs to be created early
> -in the build process, so add it also in to
> -avoid below error:
> - | ./lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No such file or directory
> -
> -Upstream-Status: Submitted [bison-patches@gnu.org maillist]
> -
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> - lib/gnulib.mk | 2 ++
> - src/local.mk  | 1 +
> - 2 files changed, 3 insertions(+)
> -
> -diff --git a/lib/gnulib.mk b/lib/gnulib.mk
> -index c21c656..27fb3dc 100644
> ---- a/lib/gnulib.mk
> -+++ b/lib/gnulib.mk
> -@@ -120,6 +120,8 @@ lib_libbison_a_SOURCES =
> - lib_libbison_a_LIBADD = $(gl_LIBOBJS)
> - lib_libbison_a_DEPENDENCIES = $(gl_LIBOBJS)
> - EXTRA_lib_libbison_a_SOURCES =
> -+$(lib_libbison_a_OBJECTS): $(BUILT_SOURCES) $(MOSTLYCLEANFILES:%.h)
> -+$(gl_LIBOBJS): $(BUILT_SOURCES) $(MOSTLYCLEANFILES:%.h)
> -
> - lib_libbison_a_CPPFLAGS = $(AM_CPPFLAGS) -DDEFAULT_TEXT_DOMAIN=\"bison-gnulib\"
> -
> -diff --git a/src/local.mk b/src/local.mk
> -index 61dc573..b5b9079 100644
> ---- a/src/local.mk
> -+++ b/src/local.mk
> -@@ -24,6 +24,7 @@ if RELOCATABLE_VIA_LD
> -   src_bison_LDFLAGS = `$(RELOCATABLE_LDFLAGS) $(bindir)`
> - endif
> -
> -+$(src_bison_OBJECTS): $(BUILT_SOURCES) $(MOSTLYCLEANFILES:%.h)
> - src_bison_CFLAGS = $(AM_CFLAGS) $(WERROR_CFLAGS)
> - src_bison_SOURCES =                             \
> -   src/AnnotationList.c                          \
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-devtools/bison/bison_3.7.2.bb b/meta/recipes-devtools/bison/bison_3.7.2.bb
> index f7bf70fff3..efc426376d 100644
> --- a/meta/recipes-devtools/bison/bison_3.7.2.bb
> +++ b/meta/recipes-devtools/bison/bison_3.7.2.bb
> @@ -11,7 +11,6 @@ DEPENDS = "bison-native flex-native"
>
>  SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
>             file://add-with-bisonlocaledir.patch \
> -           file://0001-bison-fix-the-parallel-build.patch \
>             "
>  SRC_URI[sha256sum] = "7948d193104d979c0fb0294a1854c73c89d72ae41acfc081826142578a78a91b"
>
> --
> 2.17.1
>
> 
