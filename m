Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.930.1588029655443984079
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 16:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FXXM4wPp;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id f13so22458221wrm.13
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 16:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jhFJ7NZNk+YgXWQSQoXXkHYZKpKq6kgL5/fcQcP+1vU=;
        b=FXXM4wPpMApXogZxrwx6JsX7segdxk6fYuiCVZvCJyY9X2FkNx2LBreGmXSkD6QYBv
         PO9ddGtowjQh/MSilj+//4lWJaR4uP7Jn0gxn7oTsOCyKU3ns9Dqro67yR9gl+fd3xoZ
         0jvu0QLNcE6g4GY/PLkFUYBQBDAaRewA0SVaYwBe5GpK3f0rzFv8EgS4+I94z1fvC9po
         IVnsMPHyApnrbt8sOAqBD59h5XD9eaYSTYwy+PycShfwJxtCBgSLyV7DelCBHXgjN02/
         OsIOOPmuIowSpWFNsAozP2huOeFt5LpJnYwEcB9V0HibqhAgT9ED718sJx/ADUoFittM
         H39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jhFJ7NZNk+YgXWQSQoXXkHYZKpKq6kgL5/fcQcP+1vU=;
        b=m8c/43LGDNoGpnnMK0DxE0fCqrHeYnbgnhJ3Dy8E+gcfbqGcMvRuwL4+y72SId5NkV
         15IgmZ0TZ2L4gbDmYeEGYC9BwnCqXSxDta+drVh0zquaHOMkp1qhKFhR/AcNcw6tVgvK
         0rwkEqpV/yLmJgqRgqIkSdARnkUQDP0GIiJP6s7fQoqEuRZ+6caR2ZVl6c+jWl+psaE7
         wrk3wzePoAkZ0Rk0zr22fMWzkVBu/Y4cdrrTXxqWDnu26J/mBQwaCQyyMnmMpN7ZQ+mb
         iDY3/c8WTd59ICyem2HJY9nfiJtOFgJrag/08ExOTKDv9A83uRcXIoaH+wfERwFlOHp6
         5RJQ==
X-Gm-Message-State: AGi0PuayxAoJYpL/dp9JPSfBZxMbHqnQMKvQ9dF7/SdBBSmrOLth1tTP
	5JeMruwIPIcBoqvdzMkJZfjS6k4KEvlcSqc/0RQ=
X-Google-Smtp-Source: APiQypITv0OTDmv0Ca4bg2FG9e2Zr9/BdI80BeLtU70uqtYIURkjaRIvcTmLejkMYq2t8ve5G/iCcJtviPQEN96yuio=
X-Received: by 2002:a5d:4748:: with SMTP id o8mr29328611wrs.422.1588029653842;
 Mon, 27 Apr 2020 16:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200415231829.4090244-1-raj.khem@gmail.com>
In-Reply-To: <20200415231829.4090244-1-raj.khem@gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 27 Apr 2020 13:20:42 -1000
Message-ID: <CAGDS+n=FfuBzJcrvbb8i=32+9JXd-0C+MskoxLuUDiz0p_RZyg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] gcc: Configure all gccs with --disable-install-libiberty
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

Is this series something I should consider for dunfell LTS?

Steve

On Wed, Apr 15, 2020 at 1:19 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> OE uses libiberty from binutils, since its properly compiled as pic
> archive and applications and other libraries needing libiberty can
> properly link with it.
>
> With this option applied, explicit delete of libiberty headers and
> libraries is not required in install step, since they wont get installed
> in first place.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc   | 6 ------
>  meta/recipes-devtools/gcc/gcc-cross.inc            | 4 ----
>  meta/recipes-devtools/gcc/gcc-target.inc           | 4 ----
>  4 files changed, 1 insertion(+), 14 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> index bb4f6923f2..a64c4caf00 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -33,6 +33,7 @@ EXTRA_OECONF = "\
>      --enable-libstdcxx-pch \
>      --program-prefix=${TARGET_PREFIX} \
>      --without-local-prefix \
> +    --disable-install-libiberty \
>      ${EXTRA_OECONF_BASE} \
>      ${EXTRA_OECONF_GCC_FLOAT} \
>      ${EXTRA_OECONF_PATHS} \
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index 4aac345bec..553ef7fe62 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -108,12 +108,6 @@ do_install () {
>         # We don't care about the gcc-<version> copies
>         rm -f ${D}${bindir}/*gcc-?.?*
>
> -       # We use libiberty from binutils
> -       rm -f ${D}${prefix}/${TARGET_SYS}/lib/libiberty.a
> -       # Not sure where the strange paths come from
> -       rm -f ${D}${libdir}/../lib/libiberty.a
> -       rm -f ${D}${libdir}/libiberty.a
> -
>         # Cleanup empty directories which are not shipped
>         # we use rmdir instead of 'rm -f' to ensure the non empty directories are not deleted
>         # ${D}${libdir}/../lib only seems to appear with SDKMACHINE=i686
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
> index c68cdd5dc4..6fa8c274cd 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -117,10 +117,6 @@ do_install () {
>         cp ${S}/libquadmath/quadmath.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
>         cp ${S}/libquadmath/quadmath_weak.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
>
> -       # We use libiberty from binutils
> -       find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
> -       find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
> -
>         find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed -type f -not -name "README" -not -name limits.h -not -name syslimits.h | xargs rm -f
>  }
>
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
> index 34c1b2263b..8cb432780f 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -192,10 +192,6 @@ do_install () {
>         # We don't care about the gcc-<version> ones for this
>         rm -f *gcc-?.?*
>
> -       # We use libiberty from binutils
> -       find ${D}${libdir} -name libiberty.a | xargs rm -f
> -       find ${D}${libdir} -name libiberty.h | xargs rm -f
> -
>         # Not sure why we end up with these but we don't want them...
>         rm -f ${TARGET_PREFIX}${TARGET_PREFIX}*
>
> --
> 2.26.1
>
> 
