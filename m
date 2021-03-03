Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.7670.1614783363987558052
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 06:56:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jS7YFtJy;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id w1so17714209qto.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 06:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sy6B7blxudcagHhvoWh014MRUbgYohBX7Ln/ii6zlZ8=;
        b=jS7YFtJyeojlJCdu0Nh3+YImMbk4qTeVGnYBqMEKqe7xqNO7a1w8woBNLHtr2yjIH3
         El5YcPBrusUGY5FnoMvVRnYbvmPbahSvYn0PP5Nk0zPRJu6MKkjPK8WrBtieZVtzkmVM
         UuFl8rZM98fQdk5lp8BNXCdwj5GFuJWp0fcdaRAWcajzBmkKSkgqj7kWbJFK3m9RJCem
         XTpErQtvEuQCkWi5XR+CHa/CgNScEuW20+e/VdoOHro33dzTsoajYcrktrtRwhsPGMQG
         vDQWKTEGt8Yj6KoMfAx+deyyHg7FEL0J3FStb4Ih6x92/z8z/ytK5FtFANqYW+NwnTRY
         WJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sy6B7blxudcagHhvoWh014MRUbgYohBX7Ln/ii6zlZ8=;
        b=rVoOuAZrXa53NeVfxho3z6Ql9FqlOOQ7uhR22L7wlTDgBTnT10BGEVejA0aAEp7HaJ
         7lVxxNi4PuyF40k7DBiwfbiclKtIgoyBB/PlI1fgCNydJwchot4sqHaw3Pr7CVFE6SJX
         iVs/pG9RI5qKRL32hmo202HFQWHgpF1loScjuzs2v0kAT08DBh1T694evAI5dHPKRUy2
         MKq/OVTBacTaq3gyykbn94n/qcbVudf87S5JOhM6eT+T0URNa6zUyJXzLjqkAAITd0Zz
         758mDsRP92B6MiXSHM7ZzXQnXcyXRFHQGC8hvrad31fCnZ6fwA44Ooia2LaMhjWzO8QV
         WNKQ==
X-Gm-Message-State: AOAM532vayc5BMNeWG/rQ4fX7QGpsx/Q+nMRWSNOfHcM8riggC0s+F0+
	xV++aaIwIGjgaYgRJoYT6StT+leGE++Ms/v8L1c=
X-Google-Smtp-Source: ABdhPJyAv4RULPj7iDiMDKxwEeEYV/VTAg88BezzlNuADmxYBso3zx6kPtJJHOOapA/1cDaP/Lo8WAL5f8aSBqsfSJ8=
X-Received: by 2002:ac8:74c9:: with SMTP id j9mr23218278qtr.369.1614783362944;
 Wed, 03 Mar 2021 06:56:02 -0800 (PST)
MIME-Version: 1.0
References: <20210302135920.2228759-1-richard.purdie@linuxfoundation.org> <20210302135920.2228759-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210302135920.2228759-2-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 3 Mar 2021 06:55:35 -0800
Message-ID: <CAMKF1sqF4TUyshZjUoS1Pjrx9-LFfqpREDhT4=8gNnstVWbsDA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-cython: Remove build paths from debug sources
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 2, 2021 at 5:59 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> There are build paths which are in generated sources injected
> into ${PN}-src. These are in generated files and don't influence the
> binary output. As such we can correct them at do_package time by
> tweaking in an appropriately injected function. This fixes
> the reproducbility of the recipe.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py      |  1 -
>  .../python/python3-cython_0.29.21.bb              | 15 +++++++++++++++
>  2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
> index 3d6a88314b8..0d0259477e3 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -37,7 +37,6 @@ exclude_packages = [
>         'meson',
>         'ovmf-shell-efi',
>         'perf',
> -       'python3-cython',
>         'ruby-ri-docs'
>         ]
>
> diff --git a/meta/recipes-devtools/python/python3-cython_0.29.21.bb b/meta/recipes-devtools/python/python3-cython_0.29.21.bb
> index 2ce6bdbd68b..01f716c16f5 100644
> --- a/meta/recipes-devtools/python/python3-cython_0.29.21.bb
> +++ b/meta/recipes-devtools/python/python3-cython_0.29.21.bb
> @@ -16,3 +16,18 @@ do_install_append() {
>      mv ${D}${bindir}/cythonize ${D}${bindir}/cythonize3
>      mv ${D}${bindir}/cygdb ${D}${bindir}/cygdb3
>  }
> +
> +PACKAGEBUILDPKGD += "cython_fix_sources"
> +
> +cython_fix_sources () {
> +       sed -i -e 's#${WORKDIR}#/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}#g' \
> +               ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/FlowControl.c \
> +               ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/FusedNode.c \
> +               ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/Scanning.c \
> +               ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/Visitor.c \
> +               ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Plex/Actions.c \
> +               ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Plex/Scanners.c \
> +               ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Runtime/refnanny.c \
> +               ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Tempita/_tempita.c \
> +               ${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt
> +}

this fails build on clang
https://errors.yoctoproject.org/Errors/Details/573408/

> --
> 2.27.0
>
>
> 
>
