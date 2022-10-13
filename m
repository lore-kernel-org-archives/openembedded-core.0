Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED82C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 15:41:34 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.9168.1665675688413739907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 08:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PmFr2vWO;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id h1-20020a4aa741000000b004756c611188so1348774oom.4
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 08:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2/x1UabV0Mzoy7sOFpcZ8UeF2sd8ugaIJSc9r2KhpU=;
        b=PmFr2vWOAJ4zRqeXaTP9s58nqcEi9v3eXcsS2XRk1bVVZAGJzx74LgZp6x00lSNxc9
         mzlLXJ8q5X94nhXgTkAFWpCBpaTfSBQZBfjQlPDNOJKBC3eKq2MPf0nxz3TTmy1ckNLy
         h4Des3QWk+JP0xT64p/Beu0MDAGIFPaEo5zwyREtzFTUdLZ9nZrM64hnEjjHIoBWp4sd
         ocbWznJzC9FH5HyVReHG/XSZgbsT1jmfOmcqdA2WSwFNyo+Byl5U6NaA7x/Z/nN6YOAS
         avSgOGSv1RsYyg+joP7g4s19DtuRYcA/GQg0plVlfiwyb0zJAE73aUW4ScDPjDQF4MB0
         liUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2/x1UabV0Mzoy7sOFpcZ8UeF2sd8ugaIJSc9r2KhpU=;
        b=CNObNiL2Rxqpj8Uy3czcVBK20L3ucZcSFsG2SXeFyqcrEJxSzvzVEQ+FakkxkEXNtk
         C19QnTyugBZr6ZKscNPtcVxALP+q/bL1uUpwhoF+NIbCdUunqmk5wZdLqufwzelpFKYd
         GpvtUVbrO07tbMOdNaMzwcLRXNqD7MjRKZ3aTY2qwXklDDOLnfn5UpocEWp97N9Wf/0R
         /hQQIyozPMl41LV0P2RA4Oen+bdM8ewkQlVSv0IcVlUl9SDtn/n7AwIjg/pQfWtXduK3
         ysSJwWbMweggLWbTR1cEjJs02Ni++/6cUvnFCK6sDdTb72x0E9C2dytRbXKNKfDDH4kI
         H3Yg==
X-Gm-Message-State: ACrzQf3rptBmLw2PUFtypJJWWi7ywUtETULIWrOULBoHBPxAxQKvUuZH
	beWiLXgV5jYMxUnBhiUYTqlRLM13hzD7WHh69+0=
X-Google-Smtp-Source: AMsMyM7MnSSHZLOeuM8Uj6Jc4jLMw0zV1FXScm/2PkTAsAyHpsyOPy6jHPv9tyuu9ZSE4zCMjrbTJFUQJr9QZSDJiho=
X-Received: by 2002:a4a:c90f:0:b0:480:8d45:3246 with SMTP id
 v15-20020a4ac90f000000b004808d453246mr130259ooq.9.1665675687379; Thu, 13 Oct
 2022 08:41:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221013132926.2771530-1-pkj@axis.com> <6E25C44F-E526-49E7-9AAE-336E670B7F15@arm.com>
 <32ff3b495b8640fb9706bcd5119305f1@axis.com>
In-Reply-To: <32ff3b495b8640fb9706bcd5119305f1@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Oct 2022 08:41:01 -0700
Message-ID: <CAMKF1spjQSXimjhUeufGppgKenNLgsR+c_ppWJJd0ON4GS=dHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Allow -Wno-error=poison-system-directories
 to take effect
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 15:41:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171707

On Thu, Oct 13, 2022 at 7:38 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Ross Burton <Ross.Burton@arm.com>
> > Sent: den 13 oktober 2022 16:05
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: Patches and discussions about the oe-core layer <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] gcc: Allow -Wno-error=3Dpoison-system-
> > directories to take effect
> >
> > Whilst this is a good fix, I=E2=80=99m horrified to ask why you need it=
=E2=80=A6
>
> We have a recipe for skia. Somewhere in that mess of a build
> system it uses (gn), something adds -I/usr/include/freetype2,
> which results in an error with -Werror=3Dpoison-system-directories
> enabled (as it should). Now, to work around that problem, the
> recipe currently adds -I=3D/usr/include/freetype2, which means we
> know that the correct path is used. However, since the original
> -I/usr/include/freetype2 is still in the list of options, the
> error still triggers.
>
> Now, to fix the problem properly, skias's build files should be
> patched, but that is not my job. What I am working on is to get
> our recipes to build with Langdale. This means I can cut some
> corners and, e.g., disable errors and then hand off to the
> responsible team to fix the underlying problem at a time that
> suits them. Thus in this case I wanted to add
> -Wno-error=3Dpoison-system-directories for skia, which I then, to
> my surprise, noticed had no effect...

from gcc recipe point of view, this fix is fine. however your use of
this seems to be a workaround that perhaps is better fixed in skia
because =3D syntax for sysroot works with gcc but may not work with
clang e.g. so you are being lucky here.

>
> //Peter
>
> >
> > Ross
> >
> > > On 13 Oct 2022, at 14:29, Peter Kjellerstedt via lists.openembedded.o=
rg
> > <peter.kjellerstedt=3Daxis.com@lists.openembedded.org> wrote:
> > >
> > > The change in commit e903b29f (gcc-cross: pass
> > > -Werror=3Dpoison-system-directories to compiler stages) made it impos=
sible
> > > to disable the error using -Wno-error=3Dpoison-system-directories.
> > >
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > ---
> > > .../0002-gcc-poison-system-directories.patch  | 36 +++++++++---------=
-
> > > 1 file changed, 18 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-
> > directories.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-syste=
m-
> > directories.patch
> > > index bfec4477c1..5aa635b3d4 100644
> > > --- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-
> > directories.patch
> > > +++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-
> > directories.patch
> > > @@ -1,4 +1,4 @@
> > > -From e1dbdcd0ea667bab4b551294354e04c6fe288ab6 Mon Sep 17 00:00:00 20=
01
> > > +From 99f1e61b2957226254a116fde7fd73bf07034012 Mon Sep 17 00:00:00 20=
01
> > > From: Khem Raj <raj.khem@gmail.com>
> > > Date: Mon, 8 Mar 2021 16:04:20 -0800
> > > Subject: [PATCH] gcc: poison-system-directories
> > > @@ -20,12 +20,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >  gcc/configure       | 19 +++++++++++++++++++
> > >  gcc/configure.ac    | 16 ++++++++++++++++
> > >  gcc/doc/invoke.texi |  9 +++++++++
> > > - gcc/gcc.cc          |  9 +++++++--
> > > + gcc/gcc.cc          | 15 ++++++++++++---
> > >  gcc/incpath.cc      | 21 +++++++++++++++++++++
> > > - 7 files changed, 86 insertions(+), 2 deletions(-)
> > > + 7 files changed, 91 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/gcc/common.opt b/gcc/common.opt
> > > -index 8a0dafc522d..0357868e22c 100644
> > > +index 8a0dafc52..0357868e2 100644
> > > --- a/gcc/common.opt
> > > +++ b/gcc/common.opt
> > > @@ -710,6 +710,10 @@ Wreturn-local-addr
> > > @@ -40,7 +40,7 @@ index 8a0dafc522d..0357868e22c 100644
> > >  Common Var(warn_shadow) Warning
> > >  Warn when one variable shadows another.  Same as -Wshadow=3Dglobal.
> > > diff --git a/gcc/config.in b/gcc/config.in
> > > -index 64c27c9cfac..a693cb8a886 100644
> > > +index 64c27c9cf..a693cb8a8 100644
> > > --- a/gcc/config.in
> > > +++ b/gcc/config.in
> > > @@ -230,6 +230,16 @@
> > > @@ -61,7 +61,7 @@ index 64c27c9cfac..a693cb8a886 100644
> > >     optimizer and back end) to be checked for dynamic type safety at
> > runtime.
> > >     This is quite expensive. */
> > > diff --git a/gcc/configure b/gcc/configure
> > > -index 5ce0557719a..dc2d59701ad 100755
> > > +index 2b83acfb0..8bb97578c 100755
> > > --- a/gcc/configure
> > > +++ b/gcc/configure
> > > @@ -1023,6 +1023,7 @@ enable_maintainer_mode
> > > @@ -81,7 +81,7 @@ index 5ce0557719a..dc2d59701ad 100755
> > >    --enable-plugin         enable plugin support
> > >    --enable-host-shared    build host code as shared libraries
> > >    --disable-libquadmath-support
> > > -@@ -31982,6 +31985,22 @@ if test
> > "${enable_version_specific_runtime_libs+set}" =3D set; then :
> > > +@@ -31996,6 +31999,22 @@ if test
> > "${enable_version_specific_runtime_libs+set}" =3D set; then :
> > >  fi
> > >
> > >
> > > @@ -105,10 +105,10 @@ index 5ce0557719a..dc2d59701ad 100755
> > >
> > >
> > > diff --git a/gcc/configure.ac b/gcc/configure.ac
> > > -index 23bee7010a3..36ce78924de 100644
> > > +index daf2a708c..6155b83a7 100644
> > > --- a/gcc/configure.ac
> > > +++ b/gcc/configure.ac
> > > -@@ -7421,6 +7421,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
> > > +@@ -7435,6 +7435,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
> > >                  [specify that runtime libraries should be
> > >                   installed in a compiler-specific directory])])
> > >
> > > @@ -132,7 +132,7 @@ index 23bee7010a3..36ce78924de 100644
> > >  AC_SUBST(subdirs)
> > >  AC_SUBST(srcdir)
> > > diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> > > -index 07b440190c3..b2de464798a 100644
> > > +index ff6c338be..a8ebfa59a 100644
> > > --- a/gcc/doc/invoke.texi
> > > +++ b/gcc/doc/invoke.texi
> > > @@ -379,6 +379,7 @@ Objective-C and Objective-C++ Dialects}.
> > > @@ -159,10 +159,10 @@ index 07b440190c3..b2de464798a 100644
> > >  @opindex Wfloat-equal
> > >  @opindex Wno-float-equal
> > > diff --git a/gcc/gcc.cc b/gcc/gcc.cc
> > > -index bb07cc244e3..ce161d3c853 100644
> > > +index beefde7f6..4e6557b3c 100644
> > > --- a/gcc/gcc.cc
> > > +++ b/gcc/gcc.cc
> > > -@@ -1159,6 +1159,8 @@ proper position among the other output files. =
 */
> > > +@@ -1162,6 +1162,8 @@ proper position among the other output files. =
 */
> > >     "%{fuse-ld=3D*:-fuse-ld=3D%*} " LINK_COMPRESS_DEBUG_SPEC \
> > >     "%X %{o*} %{e*} %{N} %{n} %{r}\
> > >      %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!r:%{!nostartfiles:%S}}}=
 \
> > > @@ -171,7 +171,7 @@ index bb07cc244e3..ce161d3c853 100644
> > >      %{static|no-pie|static-pie:} %@{L*} %(mfwrap) %(link_libgcc) " \
> > >      VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o "" \
> > >      %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=3D*:%*} 1):\
> > > -@@ -1254,8 +1256,11 @@ static const char *cpp_unique_options =3D
> > > +@@ -1257,8 +1259,11 @@ static const char *cpp_unique_options =3D
> > >  static const char *cpp_options =3D
> > >  "%(cpp_unique_options) %1 %{m*} %{std*&ansi&trigraphs} %{W*&pedantic=
*}
> > %{w}\
> > >   %{f*} %{g*:%{%:debug-level-gt(0):%{g*}\
> > > @@ -179,27 +179,27 @@ index bb07cc244e3..ce161d3c853 100644
> > > - %{undef} %{save-temps*:-fpch-preprocess}";
> > > + %{!fno-working-directory:-fworking-directory}}} %{O*}"
> > > +#ifdef POISON_BY_DEFAULT
> > > -+ " -Werror=3Dpoison-system-directories"
> > > ++ " %{!Wno-error=3Dpoison-system-directories:-Werror=3Dpoison-system=
-
> > directories}"
> > > +#endif
> > > + " %{undef} %{save-temps*:-fpch-preprocess}";
> > >
> > >  /* Pass -d* flags, possibly modifying -dumpdir, -dumpbase et al.
> > >
> > > -@@ -1265,7 +1270,11 @@ static const char *cc1_options =3D
> > > +@@ -1287,7 +1292,11 @@ static const char *cc1_options =3D
> > >   %{coverage:-fprofile-arcs -ftest-coverage}\
> > >   %{fprofile-arcs|fprofile-generate*|coverage:\
> > >     %{!fprofile-update=3Dsingle:\
> > > -     %{pthread:-fprofile-update=3Dprefer-atomic}}}";
> > > +     %{pthread:-fprofile-update=3Dprefer-atomic}}}"
> > > +#ifdef POISON_BY_DEFAULT
> > > -+ " -Werror=3Dpoison-system-directories"
> > > ++ " %{!Wno-error=3Dpoison-system-directories:-Werror=3Dpoison-system=
-
> > directories}"
> > > +#endif
> > > +  ;
> > > -
> > > +
> > >  static const char *asm_options =3D
> > >  "%{-target-help:%:print-asm-header()} "
> > > diff --git a/gcc/incpath.cc b/gcc/incpath.cc
> > > -index bd2a97938eb..c80f100f476 100644
> > > +index 622204a38..5ac03c086 100644
> > > --- a/gcc/incpath.cc
> > > +++ b/gcc/incpath.cc
> > > @@ -26,6 +26,7 @@
> > >
> > >
> > >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171706): https://lists.openembedded.org/g/openembedde=
d-core/message/171706
> Mute This Topic: https://lists.openembedded.org/mt/94303421/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

