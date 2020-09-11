Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.2529.1599783778780409236
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 17:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=afXm6Ql9;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id v54so6434879qtj.7
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 17:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rmo7ynUBlNL0ZgwcHWX1xApCBCZxnYO33ZlSCjJUY+o=;
        b=afXm6Ql9bMpJrCqDcHnuTGMyTsQL53zlMHXHOsCL+NQ7RcSvhHciVAWbZNF1j8DsAd
         zhIPnoaxzp+muv574GHAdGBOkJ2CqHGAOAoNBE0Lq64ukl2mBFEx+sW/wK97KTm6ZvnQ
         3bJp0ljPg9npIqBOWdlvgpQZ0oXBLsDJiyZa8rtXz/BvjABQoqO9zJIKLZGFRayF8gHO
         X6KV69M/OpbEFFUL2XNY+kiljf1of8pmiKLEb8dnZ6btBIhLRV3bOmDonHcRPORsIlnx
         p3GGqiYmxMAkR8XgZ/XOnaerrcdT+36Rq3gt+jQBcXa3ZmIH8Gz5Y7dmunJddF+8QMS9
         5Phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rmo7ynUBlNL0ZgwcHWX1xApCBCZxnYO33ZlSCjJUY+o=;
        b=oPNEAy8oMp5/dd4Q3NsksSQZlnpc+Mftrq6YDCqr/XY+BsEdzNJfGXgU6vD2GOW2i/
         D+UnAa2ZirAZN0j6TcezrdqtvORrd1R5wPZeB4RAHtB9Y2VBSmntaiVHb4gK7L05qm0U
         T806w0JLuzHcyJecgsAt88dCYFihFo1qUG9fl69JncO0hYXV3CtLHEpnJTyCZpMpu+en
         Xkjc9KJ2384B4KZu7hN9aB8PWVE4jxw9o0FT9n2CxBCwpzl8rYbGFJ4Ud4b7pwM3UB5J
         cnBD11pBcROZwgmJzgif0brlOptlEaudILDnF5kvPFWXGJv/dgwWURbvr46Zyt+knd/Z
         Rnvg==
X-Gm-Message-State: AOAM5327eu5A9iVHRKiSGe7LGib+TGfDiEaVdp3NKd4uTNrrsqCKnjEF
	e1HmYICCEdsh2VaAWGmPTOG/m79x3a2WWXkKebs=
X-Google-Smtp-Source: ABdhPJx4qZg8ixD579jpjL2g8xSrMywbOcFJ3CpBSEBo6dRJEytcWgqPGm1P0GvtDsZVKu1yFCyUct0WjKK9uP4hNH8=
X-Received: by 2002:aed:2646:: with SMTP id z64mr8500978qtc.194.1599783777771;
 Thu, 10 Sep 2020 17:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200910205354.900504-1-ross.burton@arm.com>
In-Reply-To: <20200910205354.900504-1-ross.burton@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 10 Sep 2020 17:22:31 -0700
Message-ID: <CAMKF1srCDwA4zozhqMV5V1hYfw+7Rr0ikvpe2jXWtC8xUtuwJw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ncurses: remove config.cache
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 10, 2020 at 1:54 PM Ross Burton <ross@burtonini.com> wrote:
>
> From: Ross Burton <ross.burton@intel.com>
>
> Instead of having a config.cache that overrides the system site files,
> simply set the values in CACHED_CONFIGUREVARS. We can also drop the
> mkstemp check as the configure.ac assumes it works, leaving just
> nanosleep.
>

this is a good improvement. Perhaps one downside with cache files is
that they are hardly refreshed as you have seen

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/ncurses/files/config.cache | 4 ----
>  meta/recipes-core/ncurses/ncurses.inc        | 3 ++-
>  meta/recipes-core/ncurses/ncurses_6.2.bb     | 3 +--
>  3 files changed, 3 insertions(+), 7 deletions(-)
>  delete mode 100644 meta/recipes-core/ncurses/files/config.cache
>
> diff --git a/meta/recipes-core/ncurses/files/config.cache b/meta/recipes-core/ncurses/files/config.cache
> deleted file mode 100644
> index 6a9217d5bb..0000000000
> --- a/meta/recipes-core/ncurses/files/config.cache
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -#! /bin/sh
> -
> -cf_cv_func_nanosleep=yes
> -cf_cv_func_mkstemp=yes
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index 4156bf4f7d..1627fb91d3 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -16,7 +16,8 @@ inherit autotools binconfig-disabled multilib_header pkgconfig
>  SRC_URI = "git://salsa.debian.org/debian/ncurses.git;protocol=https"
>
>  EXTRA_AUTORECONF = "-I m4"
> -CONFIG_SITE =+ "${WORKDIR}/config.cache"
> +
> +CACHED_CONFIGUREVARS = "cf_cv_func_nanosleep=yes"
>
>  EXTRASITECONFIG = "CFLAGS='${CFLAGS} -I${SYSROOT_DESTDIR}${includedir}'"
>
> diff --git a/meta/recipes-core/ncurses/ncurses_6.2.bb b/meta/recipes-core/ncurses/ncurses_6.2.bb
> index 723e685a9b..5c02db8541 100644
> --- a/meta/recipes-core/ncurses/ncurses_6.2.bb
> +++ b/meta/recipes-core/ncurses/ncurses_6.2.bb
> @@ -2,12 +2,11 @@ require ncurses.inc
>
>  SRC_URI += "file://0001-tic-hang.patch \
>             file://0002-configure-reproducible.patch \
> -           file://config.cache \
>             "
>  # commit id corresponds to the revision in package version
>  SRCREV = "a669013cd5e9d6434e5301348ea51baf306c93c4"
>  S = "${WORKDIR}/git"
> -EXTRA_OECONF += "--with-abi-version=5 --cache-file=${B}/config.cache"
> +EXTRA_OECONF += "--with-abi-version=5"
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
>
>  # This is needed when using patchlevel versions like 6.1+20181013
> --
> 2.28.0
>
> 
