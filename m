Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.5618.1611020417212731521
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 17:40:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=c1bTa1uB;
 spf=pass (domain: nathanrossi.com, ip: 209.85.128.53, mailfrom: nathan@nathanrossi.com)
Received: by mail-wm1-f53.google.com with SMTP id c124so15098372wma.5
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 17:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x7bA7Xi+9ZEX2c/Hhv3Tunu3T9AytIcpKl8Uwdt3HBU=;
        b=c1bTa1uBZ7WHDoziJ0J4MFtbWW+ZKlVP4o//boAKngwP4pbDh3iyGLiSWoxGaQBPpi
         oBDSHa+4c6nF7HM6SZ196ZAnMH8pEtHadVjsbtC2iibolUi6lopb7OCmCK9I3wDss+c1
         eYPzcXYJ6uktQ0VZxFS7OGT7UrnUNd5kWIuAkQgj7+zLA7meGHjD8nnr8g4aNCMxP3vi
         4SPdxU2Bir+3/EcjzpQe3PsMhXzcqOzKOQ9L4wGRF7ySppK//q2GDcB1lyWnhiv3A7cY
         hYxAPU02ouTJ/IPnmAlWPgMvRlzE3BxXfhkV5YThElpRfmwuAUTO3b8a2Bg5ZmD2dH6b
         Whag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x7bA7Xi+9ZEX2c/Hhv3Tunu3T9AytIcpKl8Uwdt3HBU=;
        b=jZGRSW+kGvHevBG4W8cQdD3KpjeqrXR9rAOT4fZlcBD2dWSYMW+/RReBSj7AU4RDRi
         iBvG8YcypZP+07IPtMkYa/my3dWeWvUqEr8HgxvJ8mayHspKwEanneOCeJOT5FmVMS50
         xzy8jWAfS31xOdZ8e8ch04//Xdmz5k/infUYRoGxir79ZgBOEkoXFABSDyWUXq2jxYdR
         JCxDBco2am2efDs7yRBm6vuzCes8pxka3pjKF9FsA7g4CjdcF1TlWuPx6/wDphUH6UxB
         GLyBUit7ALZ3m7FrhRkDos+VUPDzQFfuie/NmXCdkIcMm+Wuvr+so4rAeJoiUtoBT/CP
         omnw==
X-Gm-Message-State: AOAM531VjxVhDi3ZHDo3t2Qu2R2e5S/6K9j6PK6pJTvfhIXr72T8LyM2
	b4sN3D3QW4Lt3fYQbzV8QIq65DohurD2unYngGc41g==
X-Google-Smtp-Source: ABdhPJxXMqGy55AZMtbPUmNb8BMvtnOqkQNfi7vOZciGrjY11m9Gb7JmWJwv66Bm+cu7Gj1OI+49LKk0QqXckQkCDfM=
X-Received: by 2002:a1c:46c5:: with SMTP id t188mr1739579wma.170.1611020415632;
 Mon, 18 Jan 2021 17:40:15 -0800 (PST)
MIME-Version: 1.0
References: <20201215083458.1360882-1-nathan@nathanrossi.com> <CAMKF1sqxHgujjbZ+D0u15gtu4Pqae+9LCpjgvaanV3ts1vvCig@mail.gmail.com>
In-Reply-To: <CAMKF1sqxHgujjbZ+D0u15gtu4Pqae+9LCpjgvaanV3ts1vvCig@mail.gmail.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
Date: Tue, 19 Jan 2021 11:40:04 +1000
Message-ID: <CA+aJhH07k50aF3v6XxO56HTJWTkaw=6o+0o2apUz1XaYEynsFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Add patch to resolve i*86 tune configuration overrides
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 16 Jan 2021 at 03:40, Khem Raj <raj.khem@gmail.com> wrote:
>
> Nathan
>
> Can you check if your patch is still needed after
>
> https://github.com/kraj/gcc/commit/0411ae7f08e0f5a8b02ff313d26d27a0f6d1bb34

Hi Khem,

I tested this change and it resolves the configuration issue. Did you
want the above change backported to replace the oe specific patch?
Since that oe specific patch has already been backported to a number
of releases.

Thanks,
Nathan

>
> On Tue, Dec 15, 2020 at 12:35 AM Nathan Rossi <nathan@nathanrossi.com> wrote:
> >
> > When compiling gcc-runtime for i686 libatomic, libgomp and libitm are
> > compiled with additional '-march' and '-mtune' overrides. This typically
> > does not cause build errors (e.g. core2-32 tune), and results in less
> > optimally tuned outputs. However with specific TUNE_CCARGS (e.g. has
> > '-mfpmath=sse' but not '-msse*'), the build errors with conflicting
> > '-mfpmath' options.
> >
> > This is caused by gcc-runtime specific configure scripts and Makefile
> > options that override by adding additional '-march'/'-mtune' args. OE
> > builds gcc-runtime differently to other build systems, and provides
> > target specific arch/tune options directly. As such, this change adds a
> > patch for gcc to remove the specific cases where the args are added.
> >
> > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-10.2.inc             |   1 +
> >  .../gcc/0001-lib-Remove-i-86-march-overrides.patch | 113 +++++++++++++++++++++
> >  2 files changed, 114 insertions(+)
> >  create mode 100644 meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools/gcc/gcc-10.2.inc
> > index e88f2ade6d..1e69c91311 100644
> > --- a/meta/recipes-devtools/gcc/gcc-10.2.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
> > @@ -69,6 +69,7 @@ SRC_URI = "\
> >             file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch \
> >             file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch \
> >             file://0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch \
> > +           file://0001-lib-Remove-i-86-march-overrides.patch \
> >  "
> >  SRC_URI[sha256sum] = "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c"
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch b/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
> > new file mode 100644
> > index 0000000000..3f04e121ba
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
> > @@ -0,0 +1,113 @@
> > +From 3776789cde95916f95deef48acf9532b0ebf91ae Mon Sep 17 00:00:00 2001
> > +From: Nathan Rossi <nathan@nathanrossi.com>
> > +Date: Tue, 15 Dec 2020 11:43:36 +1000
> > +Subject: [PATCH] lib*: Remove i*86 march overrides
> > +
> > +OE does not pass the '--with-arch' option to gccs configure, as such
> > +some gcc-runtime libraries try to override the value of '-march' and
> > +'-mtune' which OE already provides. This causes conflicts with other
> > +i*86 instruction/architecture flags (e.g. -msse* and -mfpmath=*).
> > +Additionally this caused the following libraries to be built with less
> > +optimized tune configurations.
> > +
> > +Upstream suggests that this should be detecting or otherwise checking if
> > +the target supports the desired functionality before overriding.
> > +
> > +    https://gcc.gnu.org/legacy-ml/gcc-patches/2016-04/msg01344.html
> > +
> > +libatomic also overrides the '-march' specifically for IFUNC objects.
> > +OE already supplies the correct march flag, so remove setting.
> > +
> > +Upstream-Status: Inappropriate [OE Specific]
> > +Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > +---
> > + libatomic/Makefile.am   | 1 -
> > + libatomic/Makefile.in   | 1 -
> > + libatomic/configure.tgt | 9 ---------
> > + libgomp/configure.tgt   | 8 --------
> > + libitm/configure.tgt    | 9 ---------
> > + 5 files changed, 28 deletions(-)
> > +
> > +diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
> > +index ac1ca64587..5aa16e0699 100644
> > +--- a/libatomic/Makefile.am
> > ++++ b/libatomic/Makefile.am
> > +@@ -133,7 +133,6 @@ libatomic_la_LIBADD += $(foreach s,$(SIZES),$(addsuffix _$(s)_1_.lo,$(SIZEOBJS))
> > + libatomic_la_LIBADD += $(addsuffix _8_2_.lo,$(SIZEOBJS))
> > + endif
> > + if ARCH_I386
> > +-IFUNC_OPTIONS      = -march=i586
> > + libatomic_la_LIBADD += $(addsuffix _8_1_.lo,$(SIZEOBJS))
> > + endif
> > + if ARCH_X86_64
> > +diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
> > +index 97df2d7ff0..82c511d420 100644
> > +--- a/libatomic/Makefile.in
> > ++++ b/libatomic/Makefile.in
> > +@@ -432,7 +432,6 @@ libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix \
> > +       _$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
> > +       $(am__append_3) $(am__append_4)
> > + @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv7-a+fp -DHAVE_KERNEL64
> > +-@ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=i586
> > + @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16
> > + libatomic_convenience_la_SOURCES = $(libatomic_la_SOURCES)
> > + libatomic_convenience_la_LIBADD = $(libatomic_la_LIBADD)
> > +diff --git a/libatomic/configure.tgt b/libatomic/configure.tgt
> > +index 5dd0926d20..3cc41773c3 100644
> > +--- a/libatomic/configure.tgt
> > ++++ b/libatomic/configure.tgt
> > +@@ -82,15 +82,6 @@ case "${target_cpu}" in
> > +       ;;
> > +
> > +   i[3456]86)
> > +-      case " ${CC} ${CFLAGS} " in
> > +-        *" -m64 "*|*" -mx32 "*)
> > +-          ;;
> > +-        *)
> > +-          if test -z "$with_arch"; then
> > +-            XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
> > +-            XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
> > +-          fi
> > +-      esac
> > +       ARCH=x86
> > +       # ??? Detect when -march=i686 is already enabled.
> > +       try_ifunc=yes
> > +diff --git a/libgomp/configure.tgt b/libgomp/configure.tgt
> > +index 4790a31e39..46c4c958e6 100644
> > +--- a/libgomp/configure.tgt
> > ++++ b/libgomp/configure.tgt
> > +@@ -72,14 +72,6 @@ if test x$enable_linux_futex = xyes; then
> > +     # Note that bare i386 is not included here.  We need cmpxchg.
> > +     i[456]86-*-linux*)
> > +       config_path="linux/x86 linux posix"
> > +-      case " ${CC} ${CFLAGS} " in
> > +-        *" -m64 "*|*" -mx32 "*)
> > +-          ;;
> > +-        *)
> > +-          if test -z "$with_arch"; then
> > +-            XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
> > +-          fi
> > +-      esac
> > +       ;;
> > +
> > +     # Similar jiggery-pokery for x86_64 multilibs, except here we
> > +diff --git a/libitm/configure.tgt b/libitm/configure.tgt
> > +index 04109160e9..3d78ea609d 100644
> > +--- a/libitm/configure.tgt
> > ++++ b/libitm/configure.tgt
> > +@@ -59,15 +59,6 @@ case "${target_cpu}" in
> > +   arm*)               ARCH=arm ;;
> > +
> > +   i[3456]86)
> > +-      case " ${CC} ${CFLAGS} " in
> > +-        *" -m64 "*|*" -mx32 "*)
> > +-          ;;
> > +-        *)
> > +-          if test -z "$with_arch"; then
> > +-            XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
> > +-            XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
> > +-          fi
> > +-      esac
> > +       XCFLAGS="${XCFLAGS} -mrtm"
> > +       ARCH=x86
> > +       ;;
> > ---
> > 2.29.2
> >
> > 
> >
