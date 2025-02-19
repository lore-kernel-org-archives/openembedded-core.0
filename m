Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B705FC021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 19:21:35 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.31398.1739992887247026290
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 11:21:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NDnUGgp0;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5fa2a2bdde9so56836eaf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 11:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739992886; x=1740597686; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMmrPnsStWuZaC8yLs7s8VdJOalgMJCR4PXBeT4owdQ=;
        b=NDnUGgp0KieetnLUxKESHn7ioLlgYP8Hgb3oFxsYoF2ake9LdzOWs6kbeb7Q+GUAfR
         M2mFgxa8LbRwkv/MTD+oFt7N8/nbLTReNo3gL2DSyu14nqHa06TvwgANfI/kKZQBVTC4
         5hbC+qj4CJVQRvmymPXZkOZycpzG86XXxNJLZKka3vzRbSZ2Ehh9pxhNQFRq2snkPAe0
         EhWlTYMBhX5p/OJsqQ/WX+53+iLlY/LLv5GUEg5YlNkuPpMCoJHvqPPYlAIz0QPOeBDy
         G2E9Hyv6gtsIUYx7TyEscEZ1+j+qD8GURz/98h+nw/ifw9vmibT6hUVxlXOiJP+7hkKS
         mg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739992886; x=1740597686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMmrPnsStWuZaC8yLs7s8VdJOalgMJCR4PXBeT4owdQ=;
        b=K1Zz7DingJEDp+ya1ZqjfIieGaLfDzrGsiUAe/2W7pAqmmUBnYUqwdmEtDGfbXqxwI
         urypf55ch9Wmg7lTsBRjnZqDR5zOxn5F1yRYZuUyNs8nRuPvskojaZ0cTbJ/DmR68KWZ
         CKJSAAkBhpCPFNmCs3XrdncRb+P8xMLAygU1UDBko0WnMElGuCjVczG7GKE+bKr1pARN
         GHjpZhrCsngdWx4BvtYOotTeDhzhNaIxX1tiIunZenX3vQB9TLQ4FcwcnEKMlgNWgiVU
         bqAbI1z+pAPo4Qgp/m2pyMnHlvx6nB5IZ1QWy5wXOQi0WxsYGw9kHRKfr5Kxtec64QGo
         IPvA==
X-Gm-Message-State: AOJu0Yz5gaFNfx2iqn+WB/8SQNV8+Ujj/wOpuMe3dakWnQVlJJxG83fE
	rpR3hUhzuC8KJTrTw00rlg/X2JUWp4FDsi9rV0Fgha3um2huL8RMDeVxg6XMgpL12/M1r8VwOgo
	SrRPkOLOV13R7uG7iJY3H7r68ZvwBwtsU
X-Gm-Gg: ASbGncthJBTWRmtio/lW7zaMvA+Epjh3WxBYhHScoVdyfu7DVN0yUshJIYHKH6UqOAW
	nbwlCnOHlZymHeQl9VIlc08EB4Q+aNQiTM6bF9uU8q6KFLMt12JrfkS59R1aXhqThG7siafGVNu
	uUU+19INsqluwGglnwi5vojLLJ6A==
X-Google-Smtp-Source: AGHT+IFWOP05+Jzj+5Q3LifWT9XxvlclTGAmVwKepe8c7BfaSM9B1Ig5yEHYzx+MdPp0YqWUnWWnvUeIoRwI6zlyYps=
X-Received: by 2002:a05:6870:3c11:b0:277:d8ee:6dda with SMTP id
 586e51a60fabf-2bc99ac278dmr12178570fac.23.1739992886414; Wed, 19 Feb 2025
 11:21:26 -0800 (PST)
MIME-Version: 1.0
References: <20250219185119.2168718-1-festevam@gmail.com>
In-Reply-To: <20250219185119.2168718-1-festevam@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Feb 2025 11:21:00 -0800
X-Gm-Features: AWEUYZlHbiiBGyW8XP3GvpLioUcZUBA_Gl5rm2-cRSTQMI5mPuqXHJBe8ErL_MM
Message-ID: <CAMKF1srsSNZ1XR=nTaS-Op16o15F4=SdqWgQGu-Yv4bchoif3w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] libexecinfo: Move it to the core
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 19:21:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211729

LGTM

On Wed, Feb 19, 2025 at 10:51=E2=80=AFAM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> Move the libexecinfo recipe from meta-openembedded to meta-oe.
>
> The motivation for doing this is building mtd-utils 2.3.0 with musl.
>
> Musl requires an external libexecinfo to provide backtrace support.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v2:
> - Use Upstream-Status: Inactive-Upstream. (Alexander)
>
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../0001-makefile-Fix-build-on-linux.patch    | 60 ++++++++++++++
>  ...piler-errors-found-with-newer-gcc-cl.patch | 79 +++++++++++++++++++
>  meta/recipes-core/musl/libexecinfo_1.1.bb     | 30 +++++++
>  4 files changed, 170 insertions(+)
>  create mode 100644 meta/recipes-core/musl/libexecinfo/0001-makefile-Fix-=
build-on-linux.patch
>  create mode 100644 meta/recipes-core/musl/libexecinfo/0002-execinfo-Fix-=
compiler-errors-found-with-newer-gcc-cl.patch
>  create mode 100644 meta/recipes-core/musl/libexecinfo_1.1.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index e85a0c9563..c9885e7253 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -333,6 +333,7 @@ RECIPE_MAINTAINER:pn-libepoxy =3D "Anuj Mittal <anuj.=
mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-liberation-fonts =3D "Unassigned <unassigned@yoctop=
roject.org>"
>  RECIPE_MAINTAINER:pn-libevdev =3D "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-libevent =3D "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-libexecinfo =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-libexif =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-libfakekey =3D "Unassigned <unassigned@yoctoproject=
.org>"
>  RECIPE_MAINTAINER:pn-libffi =3D "Unassigned <unassigned@yoctoproject.org=
>"
> diff --git a/meta/recipes-core/musl/libexecinfo/0001-makefile-Fix-build-o=
n-linux.patch b/meta/recipes-core/musl/libexecinfo/0001-makefile-Fix-build-=
on-linux.patch
> new file mode 100644
> index 0000000000..d4894c4256
> --- /dev/null
> +++ b/meta/recipes-core/musl/libexecinfo/0001-makefile-Fix-build-on-linux=
.patch
> @@ -0,0 +1,60 @@
> +From 910bbc2cb6cc1cfa6deed9d170da02a639902c7c Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 19 Mar 2017 16:14:54 -0700
> +Subject: [PATCH 1/2] makefile: Fix build on linux
> +
> +Upstream-Status: Inactive-Upstream [no update since 2017, no maintainer:=
 https://www.freshports.org/devel/libexecinfo]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + Makefile | 33 +++++++++++++++++----------------
> + 1 file changed, 17 insertions(+), 16 deletions(-)
> +
> +Index: libexecinfo-1.1/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libexecinfo-1.1.orig/Makefile
> ++++ libexecinfo-1.1/Makefile
> +@@ -23,24 +23,25 @@
> + # SUCH DAMAGE.
> + #
> + # $Id: Makefile,v 1.3 2004/07/19 05:19:55 sobomax Exp $
> ++#
> ++# Linux Makefile by Matt Smith <mcs@darkregion.net>, 2011/01/04
> +
> +-LIB=3D  execinfo
> +-
> +-SRCS=3D stacktraverse.c stacktraverse.h execinfo.c execinfo.h
> +-
> +-INCS=3D execinfo.h
> +-
> +-SHLIB_MAJOR=3D  1
> +-SHLIB_MINOR=3D  0
> +-
> +-NOPROFILE=3D    yes
> +-
> +-DPADD=3D                ${LIBM}
> +-LDADD=3D                -lm
> +-
> +-#WARNS?=3D      4
> +-
> +-#stacktraverse.c: gen.py
> +-#     ./gen.py > stacktraverse.c
> ++CC?=3Dcc
> ++AR?=3Dar
> ++EXECINFO_CFLAGS=3D$(CFLAGS) -O2 -pipe -fno-strict-aliasing -std=3Dgnu99=
 -fstack-protector -c
> ++EXECINFO_LDFLAGS=3D$(LDFLAGS)
> ++
> ++all: static dynamic
> ++
> ++static:
> ++      $(CC) $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) stacktraverse.c
> ++      $(CC) $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) execinfo.c
> ++      $(AR) rcs libexecinfo.a stacktraverse.o execinfo.o
> ++
> ++dynamic:
> ++      $(CC) -fpic -DPIC $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) stacktra=
verse.c -o stacktraverse.So
> ++      $(CC) -fpic -DPIC $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) execinfo=
.c -o execinfo.So
> ++      $(CC) -shared -Wl,-soname,libexecinfo.so.1 -o libexecinfo.so.1 $(=
EXECINFO_LDFLAGS) stacktraverse.So execinfo.So
> +
> +-.include <bsd.lib.mk>
> ++clean:
> ++      rm -rf *.o *.So *.a *.so
> diff --git a/meta/recipes-core/musl/libexecinfo/0002-execinfo-Fix-compile=
r-errors-found-with-newer-gcc-cl.patch b/meta/recipes-core/musl/libexecinfo=
/0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch
> new file mode 100644
> index 0000000000..914928d924
> --- /dev/null
> +++ b/meta/recipes-core/musl/libexecinfo/0002-execinfo-Fix-compiler-error=
s-found-with-newer-gcc-cl.patch
> @@ -0,0 +1,79 @@
> +From 0810817773fb81d7383d2fa8464244c8f79845fb Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 19 Mar 2017 16:16:18 -0700
> +Subject: [PATCH 2/2] execinfo: Fix compiler errors found with newer gcc/=
clang
> +
> +Upstream-Status: Inactive-Upstream [no update since 2017, no maintainer:=
 https://www.freshports.org/devel/libexecinfo]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + execinfo.c | 19 +++++++++++--------
> + 1 file changed, 11 insertions(+), 8 deletions(-)
> +
> +diff --git a/execinfo.c b/execinfo.c
> +index 906fb14..9448b60 100644
> +--- a/execinfo.c
> ++++ b/execinfo.c
> +@@ -69,7 +69,8 @@ backtrace(void **buffer, int size)
> + char **
> + backtrace_symbols(void *const *buffer, int size)
> + {
> +-    int i, clen, alen, offset;
> ++    size_t clen, alen;
> ++    int i, offset;
> +     char **rval;
> +     char *cp;
> +     Dl_info info;
> +@@ -78,7 +79,6 @@ backtrace_symbols(void *const *buffer, int size)
> +     rval =3D malloc(clen);
> +     if (rval =3D=3D NULL)
> +         return NULL;
> +-    (char **)cp =3D &(rval[size]);
> +     for (i =3D 0; i < size; i++) {
> +         if (dladdr(buffer[i], &info) !=3D 0) {
> +             if (info.dli_sname =3D=3D NULL)
> +@@ -92,14 +92,14 @@ backtrace_symbols(void *const *buffer, int size)
> +                    2 +                      /* " <" */
> +                    strlen(info.dli_sname) + /* "function" */
> +                    1 +                      /* "+" */
> +-                   D10(offset) +            /* "offset */
> ++                   10 +                     /* "offset */
> +                    5 +                      /* "> at " */
> +                    strlen(info.dli_fname) + /* "filename" */
> +                    1;                       /* "\0" */
> +             rval =3D realloc_safe(rval, clen + alen);
> +             if (rval =3D=3D NULL)
> +                 return NULL;
> +-            snprintf(cp, alen, "%p <%s+%d> at %s",
> ++            snprintf((char *) rval + clen, alen, "%p <%s+%d> at %s",
> +               buffer[i], info.dli_sname, offset, info.dli_fname);
> +         } else {
> +             alen =3D 2 +                      /* "0x" */
> +@@ -108,12 +108,15 @@ backtrace_symbols(void *const *buffer, int size)
> +             rval =3D realloc_safe(rval, clen + alen);
> +             if (rval =3D=3D NULL)
> +                 return NULL;
> +-            snprintf(cp, alen, "%p", buffer[i]);
> ++            snprintf((char *) rval + clen, alen, "%p", buffer[i]);
> +         }
> +-        rval[i] =3D cp;
> +-        cp +=3D alen;
> ++        rval[i] =3D (char *) clen;
> ++        clen +=3D alen;
> +     }
> +
> ++    for (i =3D 0; i < size; i++)
> ++        rval[i] +=3D (long) rval;
> ++
> +     return rval;
> + }
> +
> +@@ -155,6 +158,6 @@ backtrace_symbols_fd(void *const *buffer, int size, =
int fd)
> +                 return;
> +             snprintf(buf, len, "%p\n", buffer[i]);
> +         }
> +-        write(fd, buf, len - 1);
> ++        write(fd, buf, strlen(buf));
> +     }
> + }
> +--
> +2.12.0
> diff --git a/meta/recipes-core/musl/libexecinfo_1.1.bb b/meta/recipes-cor=
e/musl/libexecinfo_1.1.bb
> new file mode 100644
> index 0000000000..3711ceeebd
> --- /dev/null
> +++ b/meta/recipes-core/musl/libexecinfo_1.1.bb
> @@ -0,0 +1,30 @@
> +# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY =3D "Library for inspecting program's backtrace"
> +DESCRIPTION =3D "A quick-n-dirty BSD licensed clone of the GNU libc back=
trace facility."
> +HOMEPAGE =3D "http://www.freshports.org/devel/libexecinfo"
> +LIC_FILES_CHKSUM =3D "file://execinfo.c;endline=3D25;md5=3D85bd3fa4ea9ac=
ae5182e29db063fe2e5"
> +LICENSE =3D "BSD-2-Clause"
> +SECTION =3D "libs"
> +DEPENDS =3D ""
> +
> +SRC_URI =3D "http://distcache.freebsd.org/local-distfiles/itetcu/${BP}.t=
ar.bz2 \
> +           file://0001-makefile-Fix-build-on-linux.patch \
> +           file://0002-execinfo-Fix-compiler-errors-found-with-newer-gcc=
-cl.patch \
> +           "
> +SRC_URI[sha256sum] =3D "c9a21913e7fdac8ef6b33250b167aa1fc0a7b8a175145e26=
913a4c19d8a59b1f"
> +
> +CFLAGS +=3D "-fno-omit-frame-pointer  -D_GNU_SOURCE"
> +
> +do_install() {
> +    install -D -m 0744 ${S}/execinfo.h ${D}${includedir}/execinfo.h
> +    install -D -m 0744 ${S}/stacktraverse.h ${D}${includedir}/stacktrave=
rse.h
> +    install -D -m 0744 ${B}/libexecinfo.a ${D}${libdir}/libexecinfo.a
> +    install -D -m 0755 ${B}/libexecinfo.so.1 ${D}${libdir}/libexecinfo.s=
o.1
> +    ln -s libexecinfo.so.1 ${D}${libdir}/libexecinfo.so
> +}
> +#
> +# We will skip parsing for non-musl systems
> +#
> +COMPATIBLE_HOST =3D ".*-musl.*"
> --
> 2.40.1
>

