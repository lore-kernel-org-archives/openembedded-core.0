Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web09.836.1614822081422195681
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 17:41:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RBJEvTiN;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id w6so19276556qti.6
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 17:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uTbPTb2FVM757td/cZroNsgFk0DHtuCrba/SNK5jEP8=;
        b=RBJEvTiNEVkv51LwoaNzrpQNpFacU/GGUSDD+PmpoZCxipSpoKqdF/HZ59wS4062Lj
         bs/ROK2z0DVVkWHKJskTMOkMRgrSPFntaEUCOny+UtEi/pmHaK21U4ahUmg++pEb2cF9
         ubYQl/tQ53NBmDueiZlob0YulSmiyFlaVRfcQRz1mah8FHb7p6mGuQbMaC/S/vHSDCIN
         0XpCfP1M0+77o9E8bkWsFjxcQj+BENfHkHAaIuFSCi3itOeciFGrQXK+vv4eXudndnsh
         lxZPYeV19nQHcDj3uUng6BBxXhZRfg10xF7GGVk2wTSbIzw4tVQM1szcn+iF+b1kIKFY
         7K9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uTbPTb2FVM757td/cZroNsgFk0DHtuCrba/SNK5jEP8=;
        b=hnUKsQsuVDskR2s0RlPeIhktjbS+CxGyAqwk0FlC0W+Zvug7HrmIlUZuml9XPJUumI
         bxAxQBMhvVLiuKCR31t6EkAJUd5xvzSyTNdMo7XqrhlxgQmxsCN/e2MQMo1UQKkn7liC
         kaXLx/jcRtqBPsA7t1KEsQ7FJWWpd9AKV2Qp/O4kC0PGnEKACeVXqQWiL5DpBI3Tu9RZ
         gmwfxD/1cFfs2HLKA+kowVzSx2Ln859YflI+cGMgtydMSI8T9hWXqkM6AeCPrJ18uAps
         /41o4HDX5bIx6E3U+4EeqV0nZ9V4tKM862Glp13iEhMVmdRiP49VgANYuV67Ucqgtba2
         1HCg==
X-Gm-Message-State: AOAM5312MmDnwcccyqbqelySwN7fZk4zSbKtZ74OyvKoPpZZk4QcEr2B
	srZBpNl35LLWKrGXNu+sVHxKIs64ql+pf7K9fv8=
X-Google-Smtp-Source: ABdhPJzhehGrsKadl9VR8tW9NiDRsrtdGUjYzc6mwywlUH2Nd1w0mZ3vSGfQxa8LBzXemiWVG9w32K+b8S+eAlyVRtY=
X-Received: by 2002:ac8:74c9:: with SMTP id j9mr2059404qtr.369.1614822080326;
 Wed, 03 Mar 2021 17:41:20 -0800 (PST)
MIME-Version: 1.0
References: <20210302135920.2228759-1-richard.purdie@linuxfoundation.org>
 <20210302135920.2228759-2-richard.purdie@linuxfoundation.org> <CAMKF1sqF4TUyshZjUoS1Pjrx9-LFfqpREDhT4=8gNnstVWbsDA@mail.gmail.com>
In-Reply-To: <CAMKF1sqF4TUyshZjUoS1Pjrx9-LFfqpREDhT4=8gNnstVWbsDA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 3 Mar 2021 17:40:54 -0800
Message-ID: <CAMKF1spUtiHMRYPiv0+v-uO+kEefu41xPe4HZpg+J+eR-Hn5iA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-cython: Remove build paths from debug sources
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Richard

We can also reproduce the failure with

PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"

so I guess we should check for this var

On Wed, Mar 3, 2021 at 6:55 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Mar 2, 2021 at 5:59 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > There are build paths which are in generated sources injected
> > into ${PN}-src. These are in generated files and don't influence the
> > binary output. As such we can correct them at do_package time by
> > tweaking in an appropriately injected function. This fixes
> > the reproducbility of the recipe.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/lib/oeqa/selftest/cases/reproducible.py      |  1 -
> >  .../python/python3-cython_0.29.21.bb              | 15 +++++++++++++++
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
> > index 3d6a88314b8..0d0259477e3 100644
> > --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> > +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> > @@ -37,7 +37,6 @@ exclude_packages = [
> >         'meson',
> >         'ovmf-shell-efi',
> >         'perf',
> > -       'python3-cython',
> >         'ruby-ri-docs'
> >         ]
> >
> > diff --git a/meta/recipes-devtools/python/python3-cython_0.29.21.bb b/meta/recipes-devtools/python/python3-cython_0.29.21.bb
> > index 2ce6bdbd68b..01f716c16f5 100644
> > --- a/meta/recipes-devtools/python/python3-cython_0.29.21.bb
> > +++ b/meta/recipes-devtools/python/python3-cython_0.29.21.bb
> > @@ -16,3 +16,18 @@ do_install_append() {
> >      mv ${D}${bindir}/cythonize ${D}${bindir}/cythonize3
> >      mv ${D}${bindir}/cygdb ${D}${bindir}/cygdb3
> >  }
> > +
> > +PACKAGEBUILDPKGD += "cython_fix_sources"
> > +
> > +cython_fix_sources () {
> > +       sed -i -e 's#${WORKDIR}#/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}#g' \
> > +               ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/FlowControl.c \
> > +               ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/FusedNode.c \
> > +               ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/Scanning.c \
> > +               ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/Visitor.c \
> > +               ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Plex/Actions.c \
> > +               ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Plex/Scanners.c \
> > +               ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Runtime/refnanny.c \
> > +               ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Tempita/_tempita.c \
> > +               ${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt
> > +}
>
> this fails build on clang
> https://errors.yoctoproject.org/Errors/Details/573408/
>
> > --
> > 2.27.0
> >
> >
> > 
> >
