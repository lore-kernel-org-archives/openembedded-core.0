Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.143.1602112298356567236
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 16:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1xLv698L;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.50, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f50.google.com with SMTP id x1so3944270eds.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 16:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2SHhi5iNgUOzVmd4fQpMpuajJSna8XLwMvhvh10DExU=;
        b=1xLv698LHWnZhkTHFgwbDzo2rqlRYj7VOB/8vb2iQ1YTCE5nQOq6BfUSPc/7PYzmBc
         /csZdZwHuQlii5BaFikunESLcFj1FnZCuomUi7vtqfLE5nYznyCDrdxPmdRIaT8cJXsf
         nH7W8FoZCKRHHdj0vZNsPNwgUGnG4ZbOgKG/3KCJsDzHDWJTqc6yoQZ4O9rb06IIDdZ6
         agjmKeWkbf2NpaZicaia2CuGj0EEn9dFhWM0LRZ7wTYVtCQGzgsF2Nxezi74brPeFo2B
         d8487rSEjLsU2JNlZcgP9mJQrB4hexagXMMy3qfkS0ngtzrVz8ggiCBlbD0vb2S+fkht
         UDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2SHhi5iNgUOzVmd4fQpMpuajJSna8XLwMvhvh10DExU=;
        b=FzjL+VcjX6J/udUzZN41Km4Ho03T6DnUcKi0g2AAVWXgKbfz5jp3LoYOIdJtxNBVAG
         BfPa/6zqJhCE2hq8fkn7g1wFL4QnglrH04keTI1dSaKM+ThRs1WVPU6SgU3A/FxQ4lVD
         RorAZCMghl7sB/K+vo5oYgRmPqs731QPVBBzZIEITBAmGAtZHo50BdHtd/XuiywZITo7
         NWevibmLCF2pOBUdz78yHw/GXdF+XN8wCGT9GGLADkKjIKiuy1hWY+QpjCFhLKBY83L+
         19lxSRt6hRgWP+1fCKmXxIfmOEDzGV6CyisInhEn297JEgfc97Dy0cMqEUY0QCcvGL6T
         wDtw==
X-Gm-Message-State: AOAM533vKgXQq1e2oAgNmzIf1KJPFo+JpVkE9BI7BlyXhb0WWTAFUlDl
	O0F6gfLSl/VHU25DyIh9gSgG6yhlWt2cqFxyN0J/7Q==
X-Google-Smtp-Source: ABdhPJx3ZLZ0D9ssNpNDudxynZi0xo24toXLoxAP2n3JhJxy5G8tqmRLU7iKq+yuS7tFMX7Jk69rkwhiekdx+E12ke0=
X-Received: by 2002:a05:6402:2076:: with SMTP id bd22mr6255352edb.197.1602112296392;
 Wed, 07 Oct 2020 16:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200929221638.2114178-1-ross.burton@arm.com>
In-Reply-To: <20200929221638.2114178-1-ross.burton@arm.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 7 Oct 2020 13:11:24 -1000
Message-ID: <CAOSpxda6Whj+z3+SBrWyfk-Ujj78LCm7UByLe3qarx6SeOFX7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] bjam-native: don't do debug builds
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Does this make sense for dunfell too? (adjusted to version 1.72 of course)

Steve

On Tue, Sep 29, 2020 at 12:16 PM Ross Burton <ross@burtonini.com> wrote:
>
> Previously this recipe was changed to do debug builds because otherwise insane
> warns that the binary is already stripped.
>
> However, debug builds for boost.build also pass -O0.  It turns out that given
> how large Boost is (or, how bad boost.build is) doing a release build with -O3
> knocks a third off the walltime for a Boost package in my test, mainly by reducing
> how long it spends deciding that nothing needs to be rebuilt in do_install:
>
>   PKG      TASK        ABSDIFF  RELDIFF  WALLTIME1 -> WALLTIME2
>   boost    do_install  -330.7s   -69.2%     477.6s -> 146.9s
>   boost    do_compile    -7.1s    -2.7%     269.3s -> 262.2s
>
> Replace debug mode with INSANE_SKIP=already-stripped.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../boost/bjam-native_1.74.0.bb               | 10 ++---
>  .../0001-Build-debug-version-of-bjam.patch    | 38 -------------------
>  ....sh-use-DNDEBUG-also-in-debug-builds.patch | 27 -------------
>  3 files changed, 4 insertions(+), 71 deletions(-)
>  delete mode 100644 meta/recipes-support/boost/files/0001-Build-debug-version-of-bjam.patch
>  delete mode 100644 meta/recipes-support/boost/files/0001-build.sh-use-DNDEBUG-also-in-debug-builds.patch
>
> diff --git a/meta/recipes-support/boost/bjam-native_1.74.0.bb b/meta/recipes-support/boost/bjam-native_1.74.0.bb
> index d843eb038c..c0eeed60b0 100644
> --- a/meta/recipes-support/boost/bjam-native_1.74.0.bb
> +++ b/meta/recipes-support/boost/bjam-native_1.74.0.bb
> @@ -5,16 +5,14 @@ SECTION = "devel"
>
>  inherit native
>
> -SRC_URI += "file://0001-Build-debug-version-of-bjam.patch \
> -            file://0001-build.sh-use-DNDEBUG-also-in-debug-builds.patch \
> -           "
> -
>  do_compile() {
>      ./bootstrap.sh --with-toolset=gcc
>  }
>
>  do_install() {
>      install -d ${D}${bindir}/
> -    # install unstripped version for bjam
> -    install -c -m 755 b2 ${D}${bindir}/bjam
> +    install b2 ${D}${bindir}/bjam
>  }
> +
> +# The build is either release mode (pre-stripped) or debug (-O0).
> +INSANE_SKIP_${PN} = "already-stripped"
> diff --git a/meta/recipes-support/boost/files/0001-Build-debug-version-of-bjam.patch b/meta/recipes-support/boost/files/0001-Build-debug-version-of-bjam.patch
> deleted file mode 100644
> index c6dcee915e..0000000000
> --- a/meta/recipes-support/boost/files/0001-Build-debug-version-of-bjam.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 19c117c3d1388654da484e26afb3fb6c3e4181a9 Mon Sep 17 00:00:00 2001
> -From: Daniel Klauer <daniel.klauer@gin.de>
> -Date: Tue, 30 Jul 2019 11:39:09 +0200
> -Subject: [PATCH] Build debug version of bjam
> -
> -bjam is stripped by default, this causes QA warning while stripping it
> -from do_populate_sysroot():
> -
> -  WARNING: File '.../tmp/sysroots/x86_64-linux/usr/bin/bjam' \
> -    from bjam-native was already stripped, \
> -    this will prevent future debugging!
> -
> -The JAM scripts allow to build unstripped version with '--debug'. Just
> -build and install the bjam.debug to stop bjam from being stripped in
> -compile step.
> -
> -Upstream-Status: Inappropriate [configuration]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - bootstrap.sh | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/bootstrap.sh b/bootstrap.sh
> -index ca0b08d58..87f38dcf2 100755
> ---- a/bootstrap.sh
> -+++ b/bootstrap.sh
> -@@ -223,7 +223,7 @@ rm -f config.log
> - if test "x$BJAM" = x; then
> -   $ECHO -n "Building Boost.Build engine with toolset $TOOLSET... "
> -   pwd=`pwd`
> --  (cd "$my_dir/tools/build/src/engine" && ./build.sh "$TOOLSET") > bootstrap.log 2>&1
> -+  (cd "$my_dir/tools/build/src/engine" && ./build.sh "$TOOLSET" --debug) > bootstrap.log 2>&1
> -   if [ $? -ne 0 ]; then
> -       echo
> -       echo "Failed to build Boost.Build build engine"
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-support/boost/files/0001-build.sh-use-DNDEBUG-also-in-debug-builds.patch b/meta/recipes-support/boost/files/0001-build.sh-use-DNDEBUG-also-in-debug-builds.patch
> deleted file mode 100644
> index 4c6ef2ed84..0000000000
> --- a/meta/recipes-support/boost/files/0001-build.sh-use-DNDEBUG-also-in-debug-builds.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 2afd025997a57794ce24e07e914b461dfea6ba5f Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Mon, 26 Aug 2019 16:04:16 +0200
> -Subject: [PATCH] build.sh: use -DNDEBUG also in debug builds
> -
> -Without it, there is a significant performance regression
> -when running 'bjam install'.
> -
> -Upstream-Status: Inappropriate [configuration]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - tools/build/src/engine/build.sh | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/tools/build/src/engine/build.sh b/tools/build/src/engine/build.sh
> -index a1e4cd335..64e0a4c80 100755
> ---- a/tools/build/src/engine/build.sh
> -+++ b/tools/build/src/engine/build.sh
> -@@ -436,7 +436,7 @@ case $B2_OS in
> -     ;;
> - esac
> -
> --if check_debug_build "$@" ; then B2_CXXFLAGS="${B2_CXXFLAGS_DEBUG}"
> -+if check_debug_build "$@" ; then B2_CXXFLAGS="${B2_CXXFLAGS_DEBUG} -DNDEBUG"
> - else B2_CXXFLAGS="${B2_CXXFLAGS_RELEASE} -DNDEBUG"
> - fi
> - echo_run ${B2_CXX} ${CXXFLAGS} ${B2_CXXFLAGS} ${B2_SOURCES} -o b2
> --
> 2.25.1
>
>
> 
>
