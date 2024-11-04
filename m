Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E1CD2E006
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 21:52:34 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.2828.1730757147075929105
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Nov 2024 13:52:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lot9jmy1;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e8607c2aso5137841e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 13:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730757145; x=1731361945; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=flAgbxISxXoPfTqcCdmU0g7C1jZkkvtRiLMPQNw/WcU=;
        b=lot9jmy1BzDBNryJJ5lIe8EfDfWaQ8ck63b7i5/6ZmONlTbSLSSe+SfWbeG4SzBe/7
         xhkKzNY96VKLz5qljIBZyZ2tskE8N83El8vdgv29Xzseu1s7F8tSw+qyYa1qhwgZunw2
         aj8Yw4E9rODjX//nVMJe0mH78sZEsbq4cmaA71Y0tCeYFhaF8ywE3PTbCwfT+JFPr+H3
         lObwEOH3JEEdcxyc5S0hhiuQqrnHC8SXC8iY8kzbG+B9AHUiCOejQ6PzLo45aENk7qWz
         ckPQu8b/457iEdUsuhNhPpvOLxm7DgJA9W6V/T2wALNZmDVCfw1gwqxEVZCiqcgS2PWz
         psWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730757145; x=1731361945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flAgbxISxXoPfTqcCdmU0g7C1jZkkvtRiLMPQNw/WcU=;
        b=LiseqREDUVIagjVBdBsLFBj7Rp9RFxSqLXn/5ETmEBOvTlRyeCczlCLAVhCnPS/I6g
         rr0pLniZhNyNy4iYQz0RYubXkMBJ68gKnnWuyEWPbUjnMbCBnG+2uliPf0zpkN8CER9g
         49itKqHK/ry/vI0Ztae6Sg2ernIx6PvjHORrDJITOx6KfcC2rZ5sG9z6WKKmZacFOe1r
         NMP0sZ0qWzhQMbIZE3bHczcC9NlVhW+2AbDrA7V8995w4/Y8sNKPMPO42p2W6L2/OQAm
         sB4KVVV69UKzHqq2p4K6vYc466sJnMd31+RI4mCBQeGs4a4r21mv+bo75AaLwbXCsfvh
         B/Eg==
X-Gm-Message-State: AOJu0YzA4P42qVZCYqzxWm45CAOfj2jIDajQk0IssviaqP5yABdU4NJt
	kcJnpU1sg++4XrBnDQwl5vbyUV3iu4dWBUxv7zgUj/i1AD3iY5Qaq8UCv6MV0o/x0roMX83JWLV
	L60kxl3SAgzVUoMuj6NJphqE+EGY=
X-Google-Smtp-Source: AGHT+IGFtcBMdjtnguLlClQcou/fLL2euLLj6ehw/lLtuolCm0DXMI1wJv7SvgeFF57y+VE4JHqzufic5mixkb7P5K4=
X-Received: by 2002:a05:6512:2341:b0:536:554a:24c2 with SMTP id
 2adb3069b0e04-53b348c8978mr17575472e87.13.1730757144698; Mon, 04 Nov 2024
 13:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20241031101556.1913400-1-alex.kanavin@gmail.com> <CAMKF1spGp5xPKbVv85dKoC_E9Vk28C_r0vc3a48z2m+f1HnXjw@mail.gmail.com>
In-Reply-To: <CAMKF1spGp5xPKbVv85dKoC_E9Vk28C_r0vc3a48z2m+f1HnXjw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Nov 2024 22:52:13 +0100
Message-ID: <CANNYZj8pwm0wgV8Dzz_Z07v=OOnssxEibhtYHTqL8Uvq-jTmRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] tcl: update 8.6.15 -> 9.0.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000cd666e06261d4cdd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 21:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206694

--000000000000cd666e06261d4cdd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, I=E2=80=99m taking a look into it.

Alex

On Fri 1. Nov 2024 at 18.51, Khem Raj <raj.khem@gmail.com> wrote:

> here are couple of fails on meta-openembedded layers
>
> https://errors.yoctoproject.org/Errors/Build/194630/
>
> On Thu, Oct 31, 2024 at 3:16=E2=80=AFAM Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > From: Alexander Kanavin <alex@linutronix.de>
> >
> > Make adjustments needed for ptests: among others,
> > the binary.test needs 4G of RAM.
> >
> > Apply all patches unconditionally for ease of future upgrades.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/recipes-core/images/core-image-ptest.bb  |  1 +
> >  ...m-OE.dev-but-with-legacy-staging-fu.patch} | 16 +++++---
> >  ...patch =3D> 0002-tcl-fix-a-build-issue.patch} | 37 ++++++++++-------=
--
> >  ...o-lib64-instead-of-lib-on-64bit-tar.patch} | 19 ++++++----
> >  ...0004-tcl-update-the-header-location.patch} | 27 ++++++++------
> >  ...=3D> 0005-tcl-fix-race-in-interp.test.patch} | 11 ++++--
> >  meta/recipes-devtools/tcltk/tcl/run-ptest     |  7 ++--
> >  .../tcltk/{tcl_8.6.15.bb =3D> tcl_9.0.0.bb}     | 25 ++++++-------
> >  8 files changed, 79 insertions(+), 64 deletions(-)
> >  rename meta/recipes-devtools/tcltk/tcl/{tcl-add-soname.patch =3D>
> 0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch} (80%)
> >  rename
> meta/recipes-devtools/tcltk/tcl/{fix_non_native_build_issue.patch =3D>
> 0002-tcl-fix-a-build-issue.patch} (71%)
> >  rename
> meta/recipes-devtools/tcltk/tcl/{tcl-remove-hardcoded-install-path.patch =
=3D>
> 0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch} (63%)
> >  rename meta/recipes-devtools/tcltk/tcl/{alter-includedir.patch =3D>
> 0004-tcl-update-the-header-location.patch} (80%)
> >  rename meta/recipes-devtools/tcltk/tcl/{interp.patch =3D>
> 0005-tcl-fix-race-in-interp.test.patch} (82%)
> >  rename meta/recipes-devtools/tcltk/{tcl_8.6.15.bb =3D> tcl_9.0.0.bb}
> (82%)
> >
> > diff --git a/meta/recipes-core/images/core-image-ptest.bb
> b/meta/recipes-core/images/core-image-ptest.bb
> > index 72081f938de..a0ff8d9528e 100644
> > --- a/meta/recipes-core/images/core-image-ptest.bb
> > +++ b/meta/recipes-core/images/core-image-ptest.bb
> > @@ -32,6 +32,7 @@ QB_MEM =3D "-m 1024"
> >  QB_MEM:virtclass-mcextend-lttng-tools =3D "-m 4096"
> >  QB_MEM:virtclass-mcextend-python3 =3D "-m 2048"
> >  QB_MEM:virtclass-mcextend-python3-cryptography =3D "-m 5100"
> > +QB_MEM:virtclass-mcextend-tcl =3D "-m 5100"
> >
> >  TEST_SUITES =3D "ping ssh parselogs ptest"
> >
> > diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
> b/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with=
-legacy-staging-fu.patch
> > similarity index 80%
> > rename from meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
> > rename to
> meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-l=
egacy-staging-fu.patch
> > index a0195e263c1..9472591a55f 100644
> > --- a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
> > +++
> b/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with=
-legacy-staging-fu.patch
> > @@ -1,7 +1,8 @@
> > -From b89fd73daf9b3eb2f889f65baba5f90d8a930c82 Mon Sep 17 00:00:00 2001
> > +From f69a01c5932af2d5ece6141e4424b14a2d645fd7 Mon Sep 17 00:00:00 2001
> >  From: Richard Purdie <rpurdie@linux.intel.com>
> >  Date: Wed, 9 Dec 2009 23:59:44 +0000
> > -Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging
> function
> > +Subject: [PATCH 1/5] tcl: Add tcltk from OE.dev but with legacy stagin=
g
> > + function
> >
> >  Upstream-Status: Pending
> >  ---
> > @@ -10,10 +11,10 @@ Upstream-Status: Pending
> >   2 files changed, 7 insertions(+), 1 deletion(-)
> >
> >  diff --git a/unix/Makefile.in b/unix/Makefile.in
> > -index 7619afc..9dd053d 100644
> > +index 0ff1258..6e74458 100644
> >  --- a/unix/Makefile.in
> >  +++ b/unix/Makefile.in
> > -@@ -904,7 +904,10 @@ install-binaries: binaries
> > +@@ -1027,7 +1027,10 @@ install-binaries: binaries
> >         done
> >         @echo "Installing $(LIB_FILE) to $(DLL_INSTALL_DIR)/"
> >         @@INSTALL_LIB@
> > @@ -26,10 +27,10 @@ index 7619afc..9dd053d 100644
> >         @$(INSTALL_PROGRAM) ${TCL_EXE}
> "$(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}"
> >         @echo "Installing tclConfig.sh to $(CONFIG_INSTALL_DIR)/"
> >  diff --git a/unix/tcl.m4 b/unix/tcl.m4
> > -index 0307a06..37c4d67 100644
> > +index 99bc8bf..7e6e0da 100644
> >  --- a/unix/tcl.m4
> >  +++ b/unix/tcl.m4
> > -@@ -1378,6 +1378,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
> > +@@ -1269,6 +1269,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
> >             # get rid of the warnings.
> >             #CFLAGS_OPTIMIZE=3D"${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINE=
S
> -D__NO_MATH_INLINES"
> >
> > @@ -39,3 +40,6 @@ index 0307a06..37c4d67 100644
> >             SHLIB_LD=3D'${CC} ${CFLAGS} ${LDFLAGS} -shared'
> >             DL_OBJS=3D"tclLoadDl.o"
> >             DL_LIBS=3D"-ldl"
> > +--
> > +2.39.5
> > +
> > diff --git
> a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
> b/meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patch
> > similarity index 71%
> > rename from
> meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
> > rename to
> meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patch
> > index fac7ed7e281..53cfd8927db 100644
> > --- a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
> > +++ b/meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patch
> > @@ -1,18 +1,18 @@
> > -From bd512547fc002fdb20808bf5b8b9feeb848b6512 Mon Sep 17 00:00:00 2001
> > +From 61ef40f2bc418ce072828ad1939eaa40f981e76e Mon Sep 17 00:00:00 2001
> >  From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >  Date: Fri, 13 Aug 2010 12:24:00 -0700
> > -Subject: [PATCH] tcl: fix a build issue
> > +Subject: [PATCH 2/5] tcl: fix a build issue
> >
> >  Upstream-Status: Inappropriate [upstream does not support installed
> tests]
> >  ---
> > - unix/Makefile.in | 20 ++++++++++----------
> > - 1 file changed, 10 insertions(+), 10 deletions(-)
> > + unix/Makefile.in | 19 +++++++++----------
> > + 1 file changed, 9 insertions(+), 10 deletions(-)
> >
> >  diff --git a/unix/Makefile.in b/unix/Makefile.in
> > -index 965f6da..a0bd63f 100644
> > +index 6e74458..bd0b818 100644
> >  --- a/unix/Makefile.in
> >  +++ b/unix/Makefile.in
> > -@@ -723,7 +723,7 @@ tcltest-real:
> > +@@ -918,7 +918,7 @@ tcltest-real:
> >   test: test-tcl test-packages
> >
> >   test-tcl: ${TCLTEST_EXE}
> > @@ -20,15 +20,12 @@ index 965f6da..a0bd63f 100644
> >  +      $(SHELL_ENV) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl $(TESTFLAG=
S)
> >
> >   gdb-test: ${TCLTEST_EXE}
> > -       @printf '%s ' set env @LD_LIBRARY_PATH_VAR@
> =3D\"`pwd`$${@LD_LIBRARY_PATH_VAR@:+:$${@LD_LIBRARY_PATH_VAR}}\" > gdb.ru=
n
> > -@@ -732,17 +732,17 @@ gdb-test: ${TCLTEST_EXE}
> > -       @printf '\n' >>gdb.run
> > -       @printf '%s ' set args $(call
> shquotequote,$(TOP_DIR))/tests/all.tcl\
> > -               $(call shquotequote,$(TESTFLAGS)) -singleproc 1 >>
> gdb.run
> > --      $(GDB) ./${TCLTEST_EXE} --command=3Dgdb.run
> > -+      $(GDB) ${TCLTEST_EXE} --command=3Dgdb.run
> > -       rm gdb.run
> > +       $(SHELL_ENV) $(GDB) --args ./${TCLTEST_EXE}
> $(TOP_DIR)/tests/all.tcl \
> > +@@ -928,15 +928,14 @@ lldb-test: ${TCLTEST_EXE}
> > +       $(SHELL_ENV) $(LLDB) -- ./${TCLTEST_EXE}
> $(TOP_DIR)/tests/all.tcl \
> > +               $(TESTFLAGS) -singleproc 1
> >
> > +-
> >   # Useful target to launch a built tcltest with the proper path,...
> >   runtest: ${TCLTEST_EXE}
> >  -      $(SHELL_ENV) ./${TCLTEST_EXE}
> > @@ -37,12 +34,12 @@ index 965f6da..a0bd63f 100644
> >   # Useful target for running the test suite with an unwritable current
> >   # directory...
> >   ro-test: ${TCLTEST_EXE}
> > --      echo 'exec chmod -w .;package require
> tcltest;tcltest::temporaryDirectory /tmp;source -encoding utf-8
> ../tests/all.tcl;exec chmod +w .' | $(SHELL_ENV) ./${TCLTEST_EXE}
> > -+      echo 'exec chmod -w .;package require
> tcltest;tcltest::temporaryDirectory /tmp;source -encoding utf-8
> ../tests/all.tcl;exec chmod +w .' | $(SHELL_ENV) ${TCLTEST_EXE}
> > +-      echo 'exec chmod -w .;package require
> tcltest;tcltest::temporaryDirectory /tmp;source ../tests/all.tcl;exec chm=
od
> +w .' | $(SHELL_ENV) ./${TCLTEST_EXE}
> > ++      echo 'exec chmod -w .;package require
> tcltest;tcltest::temporaryDirectory /tmp;source ../tests/all.tcl;exec chm=
od
> +w .' | $(SHELL_ENV) ${TCLTEST_EXE}
> >
> >   # The following target generates the shared libraries in dltest/ that
> are used
> >   # for testing; they are included as part of the "tcltest" target (via
> the
> > -@@ -760,28 +760,28 @@ dltest.marker: ${STUB_LIB_FILE}
> > +@@ -954,17 +953,17 @@ dltest.marker: ${STUB_LIB_FILE}
> >   # This target can be used to run tclsh from the build directory
> >   # via `make shell SCRIPT=3D/tmp/foo.tcl`
> >   shell: ${TCL_EXE}
> > @@ -63,6 +60,9 @@ index 965f6da..a0bd63f 100644
> >                 $(TOP_DIR)/tests/all.tcl -singleproc 1 -constraints
> valgrind \
> >                 $(TESTFLAGS)
> >
> > +@@ -990,13 +989,13 @@ valgrind_each: $(addprefix
> testresults/valgrind/,$(addsuffix .success,$(notdir\
> > +
> > +
> >   valgrindshell: ${TCL_EXE}
> >  -      $(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ./${TCL_EXE} $(SCRIPT)
> >  +      $(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ${TCL_EXE} $(SCRIPT)
> > @@ -77,3 +77,6 @@ index 965f6da..a0bd63f 100644
> >
> >
>  #-----------------------------------------------------------------------=
---
> >   # Installation rules
> > +--
> > +2.39.5
> > +
> > diff --git
> a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch
> b/meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib64-instead-o=
f-lib-on-64bit-tar.patch
> > similarity index 63%
> > rename from
> meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch
> > rename to
> meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib64-instead-of-=
lib-on-64bit-tar.patch
> > index 93e7877256b..fb534044988 100644
> > ---
> a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch
> > +++
> b/meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib64-instead-o=
f-lib-on-64bit-tar.patch
> > @@ -1,7 +1,7 @@
> > -From 050fc597fbfa4da2c31bd0df58c871892a490470 Mon Sep 17 00:00:00 2001
> > +From 8af08b6f1e566af239e36864823a96c2c283e4ea Mon Sep 17 00:00:00 2001
> >  From: "Song.Li" <Song.Li@windriver.com>
> >  Date: Wed, 1 Aug 2012 19:05:51 +0800
> > -Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit targ=
et
> > +Subject: [PATCH 3/5] tcl:install tcl to lib64 instead of lib on 64bit
> target
> >
> >  Remove hardcoded library install path. Change $(prefix)/lib/ to
> ${libdir}.
> >
> > @@ -13,14 +13,14 @@ Signed-off-by: Song.Li <Song.Li@windriver.com>
> >  Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >  Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> >  ---
> > - unix/configure.in | 2 +-
> > + unix/configure.ac | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > -diff --git a/unix/configure.in b/unix/configure.in
> > -index 4f62510..4974fb6 100644
> > ---- a/unix/configure.in
> > -+++ b/unix/configure.in
> > -@@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=3Dlibtcl${LIB_SUFFIX}"
> > +diff --git a/unix/configure.ac b/unix/configure.ac
> > +index 461b394..b6d2506 100644
> > +--- a/unix/configure.ac
> > ++++ b/unix/configure.ac
> > +@@ -753,7 +753,7 @@ eval "TCL_LIB_FILE=3Dlibtcl${LIB_SUFFIX}"
> >
> >   eval "TCL_LIB_FILE=3D${TCL_LIB_FILE}"
> >
> > @@ -29,3 +29,6 @@ index 4f62510..4974fb6 100644
> >   PRIVATE_INCLUDE_DIR=3D'$(includedir)'
> >   HTML_DIR=3D'$(DISTDIR)/html'
> >
> > +--
> > +2.39.5
> > +
> > diff --git a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
> b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.pat=
ch
> > similarity index 80%
> > rename from meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
> > rename to
> meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
> > index bfc718cfd3c..7953dcecff1 100644
> > --- a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
> > +++
> b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.pat=
ch
> > @@ -1,7 +1,7 @@
> > -From 3130dca60636dc12d0d12df75b002fd123349e21 Mon Sep 17 00:00:00 2001
> > +From 20870e9cd4f5a211fe94f484f707269ee1abd947 Mon Sep 17 00:00:00 2001
> >  From: Mingli Yu <mingli.yu@windriver.com>
> >  Date: Tue, 22 Nov 2022 18:48:27 +0800
> > -Subject: [PATCH] tcl: update the header location
> > +Subject: [PATCH 4/5] tcl: update the header location
> >
> >  Lets install the include header and private header files into
> >  usr/include/tcl8.6 when version of tcl is 8.6.x
> > @@ -21,16 +21,16 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> >  Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >  ---
> >   unix/Makefile.in  | 2 +-
> > - unix/configure.in | 4 ++--
> > + unix/configure.ac | 4 ++--
> >   unix/tcl.pc.in    | 2 +-
> >   3 files changed, 4 insertions(+), 4 deletions(-)
> >
> >  diff --git a/unix/Makefile.in b/unix/Makefile.in
> > -index a3b7d69..969ddb8 100644
> > +index bd0b818..ddf2b67 100644
> >  --- a/unix/Makefile.in
> >  +++ b/unix/Makefile.in
> >  @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR   =3D $(INSTALL_ROOT)$(TCL_LIBRAR=
Y)
> > - MODULE_INSTALL_DIR    =3D $(SCRIPT_INSTALL_DIR)/../tcl8
> > + MODULE_INSTALL_DIR    =3D $(SCRIPT_INSTALL_DIR)/../tcl9
> >
> >   # Directory in which to install the include file tcl.h:
> >  -INCLUDE_INSTALL_DIR   =3D $(INSTALL_ROOT)$(includedir)
> > @@ -38,11 +38,11 @@ index a3b7d69..969ddb8 100644
> >
> >   # Path to the private tcl header dir:
> >   PRIVATE_INCLUDE_DIR   =3D @PRIVATE_INCLUDE_DIR@
> > -diff --git a/unix/configure.in b/unix/configure.in
> > -index 4974fb6..a72934f 100644
> > ---- a/unix/configure.in
> > -+++ b/unix/configure.in
> > -@@ -776,7 +776,7 @@ eval "TCL_LIB_FILE=3Dlibtcl${LIB_SUFFIX}"
> > +diff --git a/unix/configure.ac b/unix/configure.ac
> > +index b6d2506..72a8b0d 100644
> > +--- a/unix/configure.ac
> > ++++ b/unix/configure.ac
> > +@@ -754,7 +754,7 @@ eval "TCL_LIB_FILE=3Dlibtcl${LIB_SUFFIX}"
> >   eval "TCL_LIB_FILE=3D${TCL_LIB_FILE}"
> >
> >   test -z "$TCL_LIBRARY" && TCL_LIBRARY=3D'$(libdir)/tcl$(VERSION)'
> > @@ -51,7 +51,7 @@ index 4974fb6..a72934f 100644
> >   HTML_DIR=3D'$(DISTDIR)/html'
> >
> >   # Note:  in the following variable, it's important to use the absolut=
e
> > -@@ -897,7 +897,7 @@ TCL_BUILD_STUB_LIB_PATH=3D"`pwd`/${TCL_STUB_LIB_FI=
LE}"
> > +@@ -921,7 +921,7 @@ TCL_BUILD_STUB_LIB_PATH=3D"`pwd`/${TCL_STUB_LIB_FI=
LE}"
> >   TCL_STUB_LIB_PATH=3D"${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
> >
> >   # Install time header dir can be set via --includedir
> > @@ -61,7 +61,7 @@ index 4974fb6..a72934f 100644
> >
>  #-----------------------------------------------------------------------=
-
> >   # tclConfig.sh refers to this by a different name
> >  diff --git a/unix/tcl.pc.in b/unix/tcl.pc.in
> > -index 93b5e69..dcd51d7 100644
> > +index 9c6da82..8aa5ae8 100644
> >  --- a/unix/tcl.pc.in
> >  +++ b/unix/tcl.pc.in
> >  @@ -3,7 +3,7 @@
> > @@ -73,3 +73,6 @@ index 93b5e69..dcd51d7 100644
> >   libfile=3D@TCL_LIB_FILE@
> >
> >   Name: Tool Command Language
> > +--
> > +2.39.5
> > +
> > diff --git a/meta/recipes-devtools/tcltk/tcl/interp.patch
> b/meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test.patch
> > similarity index 82%
> > rename from meta/recipes-devtools/tcltk/tcl/interp.patch
> > rename to
> meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test.patch
> > index 2e0dc94cff1..dfb0b63a0e0 100644
> > --- a/meta/recipes-devtools/tcltk/tcl/interp.patch
> > +++
> b/meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test.patch
> > @@ -1,7 +1,7 @@
> > -From 426aa2ff62dda77fd011e8f630b9d4ea17984817 Mon Sep 17 00:00:00 2001
> > +From 8a96171a33c886d1d9aab40e40f8aae2f621ca08 Mon Sep 17 00:00:00 2001
> >  From: Ross Burton <ross.burton@arm.com>
> >  Date: Mon, 12 Jul 2021 14:50:13 +0100
> > -Subject: [PATCH] tcl: fix race in interp.test
> > +Subject: [PATCH 5/5] tcl: fix race in interp.test
> >
> >  The interp-36.7 patch has race conditions and is missing cleanup.  Thi=
s
> patch by
> >  a Tcl maintainer should improve matters.
> > @@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
> >   1 file changed, 4 insertions(+), 3 deletions(-)
> >
> >  diff --git a/tests/interp.test b/tests/interp.test
> > -index d742484..fc90990 100644
> > +index 30dc659..e7cd0ee 100644
> >  --- a/tests/interp.test
> >  +++ b/tests/interp.test
> > -@@ -3595,17 +3595,18 @@ test interp-36.7 {ChildBgerror sets error
> handler of child [1999035]} -setup {
> > +@@ -3614,17 +3614,18 @@ test interp-36.7 {ChildBgerror sets error
> handler of child [1999035]} -setup {
> >           variable result
> >           set result [lindex $args 0]
> >       }
> > @@ -38,3 +38,6 @@ index d742484..fc90990 100644
> >       interp delete child
> >   } -result foo
> >
> > +--
> > +2.39.5
> > +
> > diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest
> b/meta/recipes-devtools/tcltk/tcl/run-ptest
> > index c485e535c71..8a9f611b0f7 100644
> > --- a/meta/recipes-devtools/tcltk/tcl/run-ptest
> > +++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
> > @@ -1,9 +1,8 @@
> >  #!/bin/sh
> >
> > -# clock.test needs a timezone to be set
> > -export TZ=3D"Europe/London"
> > -export TCL_LIBRARY=3Dlibrary
> > +export TCL_LIBRARY=3D/usr/lib/tcl/ptest/library
> >  export ERROR_ON_FAILURES=3D1
> > +export LANG=3Den-US.UTF-8
> >
> >  # Some tests are overly strict with timings and fail on loaded systems=
.
> >  SKIP=3D""
> > @@ -19,6 +18,8 @@ SKIP=3D"$SKIP \*io-46.1"
> >  SKIP=3D"$SKIP io-13.6"
> >  # 14825
> >  SKIP=3D"$SKIP socket-\* socket_inet-\*"
> > +# tries to access google.com
> > +SKIP=3D"$SKIP httpProxy-\*"
> >
> >  for i in tests/*.test; do
> >      i=3D$(basename $i)
> > diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.15.bb
> b/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
> > similarity index 82%
> > rename from meta/recipes-devtools/tcltk/tcl_8.6.15.bb
> > rename to meta/recipes-devtools/tcltk/tcl_9.0.0.bb
> > index 340854056eb..b3968b5be14 100644
> > --- a/meta/recipes-devtools/tcltk/tcl_8.6.15.bb
> > +++ b/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
> > @@ -15,18 +15,15 @@ LIC_FILES_CHKSUM =3D
> "file://license.terms;md5=3D058f6229798281bbcac4239c788cfa38 \
> >
> >  DEPENDS =3D "tcl-native zlib"
> >
> > -BASE_SRC_URI =3D "${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.tar.gz \
> > -                file://tcl-add-soname.patch"
> > -SRC_URI =3D "${BASE_SRC_URI} \
> > -           file://fix_non_native_build_issue.patch \
> > -           file://tcl-remove-hardcoded-install-path.patch \
> > -           file://alter-includedir.patch \
> > -           file://interp.patch \
> > +SRC_URI =3D "${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.tar.gz \
> >             file://run-ptest \
> > +
>  file://0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch \
> > +           file://0002-tcl-fix-a-build-issue.patch \
> > +
>  file://0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch \
> > +           file://0004-tcl-update-the-header-location.patch \
> > +           file://0005-tcl-fix-race-in-interp.test.patch \
> >             "
> > -SRC_URI[sha256sum] =3D
> "844775491e435e34d83d6ccfbadd1342f1855f1705253233a86152df0765e78d"
> > -
> > -SRC_URI:class-native =3D "${BASE_SRC_URI}"
> > +SRC_URI[sha256sum] =3D
> "3186e23c7417359d90e3c46f531d442c76d3c05a2dba1081c02b75e32908b2b7"
> >
> >  UPSTREAM_CHECK_URI =3D "https://www.tcl.tk/software/tcltk/download.htm=
l"
> >  UPSTREAM_CHECK_REGEX =3D "tcl(?P<pver>\d+(\.\d+)+)-src"
> > @@ -38,7 +35,7 @@ VER =3D "${PV}"
> >  inherit autotools ptest binconfig
> >
> >  AUTOTOOLS_SCRIPT_PATH =3D "${S}/unix"
> > -EXTRA_OECONF =3D "--enable-threads --disable-rpath --enable-man-suffix=
"
> > +EXTRA_OECONF =3D "--disable-rpath --enable-man-suffix"
> >
> >  # Prevent installing copy of tzdata based on tzdata installation on th=
e
> build host
> >  # It doesn't install tzdata if one of the following files exist on the
> host:
> > @@ -65,13 +62,13 @@ do_install() {
> >  SYSROOT_DIRS +=3D "${bindir_crossscripts}"
> >
> >  PACKAGES =3D+ "tcl-lib"
> > -FILES:tcl-lib =3D "${libdir}/libtcl8.6.so.*"
> > -FILES:${PN} +=3D "${libdir}/tcl${VER} ${libdir}/tcl8.6 ${libdir}/tcl8"
> > +FILES:tcl-lib =3D "${libdir}/libtcl9.0.so.*"
> > +FILES:${PN} +=3D "${libdir}/tcl${VER} ${libdir}/tcl9.0 ${libdir}/tcl9"
> >  FILES:${PN}-dev +=3D "${libdir}/tclConfig.sh ${libdir}/tclooConfig.sh"
> >
> >  # isn't getting picked up by shlibs code
> >  RDEPENDS:${PN} +=3D "tcl-lib"
> > -RDEPENDS:${PN}-ptest +=3D "libgcc"
> > +RDEPENDS:${PN}-ptest +=3D "libgcc locale-base-en-us tzdata"
> >
> >  BBCLASSEXTEND =3D "native nativesdk"
> >
> > --
> > 2.39.5
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#206575):
> https://lists.openembedded.org/g/openembedded-core/message/206575
> > Mute This Topic: https://lists.openembedded.org/mt/109311930/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000cd666e06261d4cdd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks, I=E2=80=99m taking a look into it.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 1. Nov 2024 at 18.51,=
 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex=
;border-left-color:rgb(204,204,204)">here are couple of fails on meta-opene=
mbedded layers<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Build/194630/" rel=3D"nor=
eferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Build/194=
630/</a><br>
<br>
On Thu, Oct 31, 2024 at 3:16=E2=80=AFAM Alexander Kanavin via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" targ=
et=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;<br>
&gt; Make adjustments needed for ptests: among others,<br>
&gt; the binary.test needs 4G of RAM.<br>
&gt;<br>
&gt; Apply all patches unconditionally for ease of future upgrades.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/images/<a href=3D"http://core-image-ptest.bb" =
rel=3D"noreferrer" target=3D"_blank">core-image-ptest.bb</a>=C2=A0 |=C2=A0 =
1 +<br>
&gt;=C2=A0 ...m-OE.dev-but-with-legacy-staging-fu.patch} | 16 +++++---<br>
&gt;=C2=A0 ...patch =3D&gt; 0002-tcl-fix-a-build-issue.patch} | 37 ++++++++=
++---------<br>
&gt;=C2=A0 ...o-lib64-instead-of-lib-on-64bit-tar.patch} | 19 ++++++----<br=
>
&gt;=C2=A0 ...0004-tcl-update-the-header-location.patch} | 27 ++++++++-----=
-<br>
&gt;=C2=A0 ...=3D&gt; 0005-tcl-fix-race-in-interp.test.patch} | 11 ++++--<b=
r>
&gt;=C2=A0 meta/recipes-devtools/tcltk/tcl/run-ptest=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 7 ++--<br>
&gt;=C2=A0 .../tcltk/{<a href=3D"http://tcl_8.6.15.bb" rel=3D"noreferrer" t=
arget=3D"_blank">tcl_8.6.15.bb</a> =3D&gt; <a href=3D"http://tcl_9.0.0.bb" =
rel=3D"noreferrer" target=3D"_blank">tcl_9.0.0.bb</a>}=C2=A0 =C2=A0 =C2=A0|=
 25 ++++++-------<br>
&gt;=C2=A0 8 files changed, 79 insertions(+), 64 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/tcltk/tcl/{tcl-add-soname.patch =3D=
&gt; 0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch} (80%)=
<br>
&gt;=C2=A0 rename meta/recipes-devtools/tcltk/tcl/{fix_non_native_build_iss=
ue.patch =3D&gt; 0002-tcl-fix-a-build-issue.patch} (71%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/tcltk/tcl/{tcl-remove-hardcoded-ins=
tall-path.patch =3D&gt; 0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64b=
it-tar.patch} (63%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/tcltk/tcl/{alter-includedir.patch =
=3D&gt; 0004-tcl-update-the-header-location.patch} (80%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/tcltk/tcl/{interp.patch =3D&gt; 000=
5-tcl-fix-race-in-interp.test.patch} (82%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/tcltk/{<a href=3D"http://tcl_8.6.15=
.bb" rel=3D"noreferrer" target=3D"_blank">tcl_8.6.15.bb</a> =3D&gt; <a href=
=3D"http://tcl_9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">tcl_9.0.0.bb<=
/a>} (82%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/images/<a href=3D"http://core-image-pte=
st.bb" rel=3D"noreferrer" target=3D"_blank">core-image-ptest.bb</a> b/meta/=
recipes-core/images/<a href=3D"http://core-image-ptest.bb" rel=3D"noreferre=
r" target=3D"_blank">core-image-ptest.bb</a><br>
&gt; index 72081f938de..a0ff8d9528e 100644<br>
&gt; --- a/meta/recipes-core/images/<a href=3D"http://core-image-ptest.bb" =
rel=3D"noreferrer" target=3D"_blank">core-image-ptest.bb</a><br>
&gt; +++ b/meta/recipes-core/images/<a href=3D"http://core-image-ptest.bb" =
rel=3D"noreferrer" target=3D"_blank">core-image-ptest.bb</a><br>
&gt; @@ -32,6 +32,7 @@ QB_MEM =3D &quot;-m 1024&quot;<br>
&gt;=C2=A0 QB_MEM:virtclass-mcextend-lttng-tools =3D &quot;-m 4096&quot;<br=
>
&gt;=C2=A0 QB_MEM:virtclass-mcextend-python3 =3D &quot;-m 2048&quot;<br>
&gt;=C2=A0 QB_MEM:virtclass-mcextend-python3-cryptography =3D &quot;-m 5100=
&quot;<br>
&gt; +QB_MEM:virtclass-mcextend-tcl =3D &quot;-m 5100&quot;<br>
&gt;<br>
&gt;=C2=A0 TEST_SUITES =3D &quot;ping ssh parselogs ptest&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch b/me=
ta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legac=
y-staging-fu.patch<br>
&gt; similarity index 80%<br>
&gt; rename from meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch<br>
&gt; rename to meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.d=
ev-but-with-legacy-staging-fu.patch<br>
&gt; index a0195e263c1..9472591a55f 100644<br>
&gt; --- a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch<br>
&gt; +++ b/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-b=
ut-with-legacy-staging-fu.patch<br>
&gt; @@ -1,7 +1,8 @@<br>
&gt; -From b89fd73daf9b3eb2f889f65baba5f90d8a930c82 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From f69a01c5932af2d5ece6141e4424b14a2d645fd7 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Richard Purdie &lt;<a href=3D"mailto:rpurdie@linux.intel.c=
om" target=3D"_blank">rpurdie@linux.intel.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 9 Dec 2009 23:59:44 +0000<br>
&gt; -Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging f=
unction<br>
&gt; +Subject: [PATCH 1/5] tcl: Add tcltk from OE.dev but with legacy stagi=
ng<br>
&gt; + function<br>
&gt;<br>
&gt;=C2=A0 Upstream-Status: Pending<br>
&gt;=C2=A0 ---<br>
&gt; @@ -10,10 +11,10 @@ Upstream-Status: Pending<br>
&gt;=C2=A0 =C2=A02 files changed, 7 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/unix/Makefile.in b/unix/Makefile.in<br>
&gt; -index 7619afc..9dd053d 100644<br>
&gt; +index 0ff1258..6e74458 100644<br>
&gt;=C2=A0 --- a/unix/Makefile.in<br>
&gt;=C2=A0 +++ b/unix/Makefile.in<br>
&gt; -@@ -904,7 +904,10 @@ install-binaries: binaries<br>
&gt; +@@ -1027,7 +1027,10 @@ install-binaries: binaries<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;Installing $(LIB_FILE) to=
 $(DLL_INSTALL_DIR)/&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@@INSTALL_LIB@<br>
&gt; @@ -26,10 +27,10 @@ index 7619afc..9dd053d 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@$(INSTALL_PROGRAM) ${TCL_EXE} &quot;=
$(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;Installing tclConfig.sh t=
o $(CONFIG_INSTALL_DIR)/&quot;<br>
&gt;=C2=A0 diff --git a/unix/tcl.m4 b/unix/tcl.m4<br>
&gt; -index 0307a06..37c4d67 100644<br>
&gt; +index 99bc8bf..7e6e0da 100644<br>
&gt;=C2=A0 --- a/unix/tcl.m4<br>
&gt;=C2=A0 +++ b/unix/tcl.m4<br>
&gt; -@@ -1378,6 +1378,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [<br>
&gt; +@@ -1269,6 +1269,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# get rid of the warnin=
gs.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#CFLAGS_OPTIMIZE=3D&quo=
t;${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINES -D__NO_MATH_INLINES&quot;<br>
&gt;<br>
&gt; @@ -39,3 +40,6 @@ index 0307a06..37c4d67 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SHLIB_LD=3D&#39;${CC} $=
{CFLAGS} ${LDFLAGS} -shared&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DL_OBJS=3D&quot;tclLoad=
Dl.o&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DL_LIBS=3D&quot;-ldl&qu=
ot;<br>
&gt; +--<br>
&gt; +2.39.5<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issu=
e.patch b/meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patch<=
br>
&gt; similarity index 71%<br>
&gt; rename from meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue=
.patch<br>
&gt; rename to meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.p=
atch<br>
&gt; index fac7ed7e281..53cfd8927db 100644<br>
&gt; --- a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch=
<br>
&gt; +++ b/meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patch=
<br>
&gt; @@ -1,18 +1,18 @@<br>
&gt; -From bd512547fc002fdb20808bf5b8b9feeb848b6512 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 61ef40f2bc418ce072828ad1939eaa40f981e76e Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Nitin A Kamble &lt;<a href=3D"mailto:nitin.a.kamble@intel.=
com" target=3D"_blank">nitin.a.kamble@intel.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 13 Aug 2010 12:24:00 -0700<br>
&gt; -Subject: [PATCH] tcl: fix a build issue<br>
&gt; +Subject: [PATCH 2/5] tcl: fix a build issue<br>
&gt;<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [upstream does not support instal=
led tests]<br>
&gt;=C2=A0 ---<br>
&gt; - unix/Makefile.in | 20 ++++++++++----------<br>
&gt; - 1 file changed, 10 insertions(+), 10 deletions(-)<br>
&gt; + unix/Makefile.in | 19 +++++++++----------<br>
&gt; + 1 file changed, 9 insertions(+), 10 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/unix/Makefile.in b/unix/Makefile.in<br>
&gt; -index 965f6da..a0bd63f 100644<br>
&gt; +index 6e74458..bd0b818 100644<br>
&gt;=C2=A0 --- a/unix/Makefile.in<br>
&gt;=C2=A0 +++ b/unix/Makefile.in<br>
&gt; -@@ -723,7 +723,7 @@ tcltest-real:<br>
&gt; +@@ -918,7 +918,7 @@ tcltest-real:<br>
&gt;=C2=A0 =C2=A0test: test-tcl test-packages<br>
&gt;<br>
&gt;=C2=A0 =C2=A0test-tcl: ${TCLTEST_EXE}<br>
&gt; @@ -20,15 +20,12 @@ index 965f6da..a0bd63f 100644<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 $(SHELL_ENV) ${TCLTEST_EXE} $(TOP_DIR)/tes=
ts/all.tcl $(TESTFLAGS)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0gdb-test: ${TCLTEST_EXE}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0@printf &#39;%s &#39; set env @LD_LIBRARY_=
PATH_VAR@=3D\&quot;`pwd`$${@LD_LIBRARY_PATH_VAR@:+:$${@LD_LIBRARY_PATH_VAR}=
}\&quot; &gt; gdb.run<br>
&gt; -@@ -732,17 +732,17 @@ gdb-test: ${TCLTEST_EXE}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0@printf &#39;\n&#39; &gt;&gt;gdb.run<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0@printf &#39;%s &#39; set args $(call shqu=
otequote,$(TOP_DIR))/tests/all.tcl\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(call shquote=
quote,$(TESTFLAGS)) -singleproc 1 &gt;&gt; gdb.run<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $(GDB) ./${TCLTEST_EXE} --command=3Dgdb.run<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $(GDB) ${TCLTEST_EXE} --command=3Dgdb.run<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm gdb.run<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(SHELL_ENV) $(GDB) --args ./${TCLTEST_EXE=
} $(TOP_DIR)/tests/all.tcl \<br>
&gt; +@@ -928,15 +928,14 @@ lldb-test: ${TCLTEST_EXE}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(SHELL_ENV) $(LLDB) -- ./${TCLTEST_EXE} $=
(TOP_DIR)/tests/all.tcl \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TESTFLAGS) -=
singleproc 1<br>
&gt;<br>
&gt; +-<br>
&gt;=C2=A0 =C2=A0# Useful target to launch a built tcltest with the proper =
path,...<br>
&gt;=C2=A0 =C2=A0runtest: ${TCLTEST_EXE}<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 $(SHELL_ENV) ./${TCLTEST_EXE}<br>
&gt; @@ -37,12 +34,12 @@ index 965f6da..a0bd63f 100644<br>
&gt;=C2=A0 =C2=A0# Useful target for running the test suite with an unwrita=
ble current<br>
&gt;=C2=A0 =C2=A0# directory...<br>
&gt;=C2=A0 =C2=A0ro-test: ${TCLTEST_EXE}<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 echo &#39;exec chmod -w .;package require tclte=
st;tcltest::temporaryDirectory /tmp;source -encoding utf-8 ../tests/all.tcl=
;exec chmod +w .&#39; | $(SHELL_ENV) ./${TCLTEST_EXE}<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 echo &#39;exec chmod -w .;package require tclte=
st;tcltest::temporaryDirectory /tmp;source -encoding utf-8 ../tests/all.tcl=
;exec chmod +w .&#39; | $(SHELL_ENV) ${TCLTEST_EXE}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 echo &#39;exec chmod -w .;package require tclte=
st;tcltest::temporaryDirectory /tmp;source ../tests/all.tcl;exec chmod +w .=
&#39; | $(SHELL_ENV) ./${TCLTEST_EXE}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 echo &#39;exec chmod -w .;package require tclte=
st;tcltest::temporaryDirectory /tmp;source ../tests/all.tcl;exec chmod +w .=
&#39; | $(SHELL_ENV) ${TCLTEST_EXE}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0# The following target generates the shared libraries in d=
ltest/ that are used<br>
&gt;=C2=A0 =C2=A0# for testing; they are included as part of the &quot;tclt=
est&quot; target (via the<br>
&gt; -@@ -760,28 +760,28 @@ dltest.marker: ${STUB_LIB_FILE}<br>
&gt; +@@ -954,17 +953,17 @@ dltest.marker: ${STUB_LIB_FILE}<br>
&gt;=C2=A0 =C2=A0# This target can be used to run tclsh from the build dire=
ctory<br>
&gt;=C2=A0 =C2=A0# via `make shell SCRIPT=3D/tmp/foo.tcl`<br>
&gt;=C2=A0 =C2=A0shell: ${TCL_EXE}<br>
&gt; @@ -63,6 +60,9 @@ index 965f6da..a0bd63f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TOP_DIR=
)/tests/all.tcl -singleproc 1 -constraints valgrind \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TESTFLA=
GS)<br>
&gt;<br>
&gt; +@@ -990,13 +989,13 @@ valgrind_each: $(addprefix testresults/valgrind=
/,$(addsuffix .success,$(notdir\<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0valgrindshell: ${TCL_EXE}<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 $(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) .=
/${TCL_EXE} $(SCRIPT)<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 $(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) $=
{TCL_EXE} $(SCRIPT)<br>
&gt; @@ -77,3 +77,6 @@ index 965f6da..a0bd63f 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#---------------------------------------------------------=
-----------------<br>
&gt;=C2=A0 =C2=A0# Installation rules<br>
&gt; +--<br>
&gt; +2.39.5<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-inst=
all-path.patch b/meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-li=
b64-instead-of-lib-on-64bit-tar.patch<br>
&gt; similarity index 63%<br>
&gt; rename from meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-insta=
ll-path.patch<br>
&gt; rename to meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib6=
4-instead-of-lib-on-64bit-tar.patch<br>
&gt; index 93e7877256b..fb534044988 100644<br>
&gt; --- a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-pat=
h.patch<br>
&gt; +++ b/meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib64-in=
stead-of-lib-on-64bit-tar.patch<br>
&gt; @@ -1,7 +1,7 @@<br>
&gt; -From 050fc597fbfa4da2c31bd0df58c871892a490470 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 8af08b6f1e566af239e36864823a96c2c283e4ea Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: &quot;Song.Li&quot; &lt;<a href=3D"mailto:Song.Li@windrive=
r.com" target=3D"_blank">Song.Li@windriver.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 1 Aug 2012 19:05:51 +0800<br>
&gt; -Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit tar=
get<br>
&gt; +Subject: [PATCH 3/5] tcl:install tcl to lib64 instead of lib on 64bit=
 target<br>
&gt;<br>
&gt;=C2=A0 Remove hardcoded library install path. Change $(prefix)/lib/ to =
${libdir}.<br>
&gt;<br>
&gt; @@ -13,14 +13,14 @@ Signed-off-by: Song.Li &lt;<a href=3D"mailto:Song.=
Li@windriver.com" target=3D"_blank">Song.Li@windriver.com</a>&gt;<br>
&gt;=C2=A0 Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver=
.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt;=C2=A0 Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.c=
om" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - unix/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a> | 2 +-<br>
&gt; + unix/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a> | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; -diff --git a/unix/<a href=3D"http://configure.in" rel=3D"noreferrer" =
target=3D"_blank">configure.in</a> b/unix/<a href=3D"http://configure.in" r=
el=3D"noreferrer" target=3D"_blank">configure.in</a><br>
&gt; -index 4f62510..4974fb6 100644<br>
&gt; ---- a/unix/<a href=3D"http://configure.in" rel=3D"noreferrer" target=
=3D"_blank">configure.in</a><br>
&gt; -+++ b/unix/<a href=3D"http://configure.in" rel=3D"noreferrer" target=
=3D"_blank">configure.in</a><br>
&gt; -@@ -775,7 +775,7 @@ eval &quot;TCL_LIB_FILE=3Dlibtcl${LIB_SUFFIX}&quo=
t;<br>
&gt; +diff --git a/unix/<a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a> b/unix/<a href=3D"http://configure.ac" r=
el=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index 461b394..b6d2506 100644<br>
&gt; +--- a/unix/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt; ++++ b/unix/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt; +@@ -753,7 +753,7 @@ eval &quot;TCL_LIB_FILE=3Dlibtcl${LIB_SUFFIX}&quo=
t;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0eval &quot;TCL_LIB_FILE=3D${TCL_LIB_FILE}&quot;<br>
&gt;<br>
&gt; @@ -29,3 +29,6 @@ index 4f62510..4974fb6 100644<br>
&gt;=C2=A0 =C2=A0PRIVATE_INCLUDE_DIR=3D&#39;$(includedir)&#39;<br>
&gt;=C2=A0 =C2=A0HTML_DIR=3D&#39;$(DISTDIR)/html&#39;<br>
&gt;<br>
&gt; +--<br>
&gt; +2.39.5<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch b/=
meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch<b=
r>
&gt; similarity index 80%<br>
&gt; rename from meta/recipes-devtools/tcltk/tcl/alter-includedir.patch<br>
&gt; rename to meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-l=
ocation.patch<br>
&gt; index bfc718cfd3c..7953dcecff1 100644<br>
&gt; --- a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch<br>
&gt; +++ b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-locat=
ion.patch<br>
&gt; @@ -1,7 +1,7 @@<br>
&gt; -From 3130dca60636dc12d0d12df75b002fd123349e21 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 20870e9cd4f5a211fe94f484f707269ee1abd947 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" t=
arget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;=C2=A0 Date: Tue, 22 Nov 2022 18:48:27 +0800<br>
&gt; -Subject: [PATCH] tcl: update the header location<br>
&gt; +Subject: [PATCH 4/5] tcl: update the header location<br>
&gt;<br>
&gt;=C2=A0 Lets install the include header and private header files into<br=
>
&gt;=C2=A0 usr/include/tcl8.6 when version of tcl is 8.6.x<br>
&gt; @@ -21,16 +21,16 @@ Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zh=
ao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
&gt;=C2=A0 Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriv=
er.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0unix/Makefile.in=C2=A0 | 2 +-<br>
&gt; - unix/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a> | 4 ++--<br>
&gt; + unix/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a> | 4 ++--<br>
&gt;=C2=A0 =C2=A0unix/<a href=3D"http://tcl.pc.in" rel=3D"noreferrer" targe=
t=3D"_blank">tcl.pc.in</a>=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A03 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/unix/Makefile.in b/unix/Makefile.in<br>
&gt; -index a3b7d69..969ddb8 100644<br>
&gt; +index bd0b818..ddf2b67 100644<br>
&gt;=C2=A0 --- a/unix/Makefile.in<br>
&gt;=C2=A0 +++ b/unix/Makefile.in<br>
&gt;=C2=A0 @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR=C2=A0 =C2=A0=3D $(INSTALL_R=
OOT)$(TCL_LIBRARY)<br>
&gt; - MODULE_INSTALL_DIR=C2=A0 =C2=A0 =3D $(SCRIPT_INSTALL_DIR)/../tcl8<br=
>
&gt; + MODULE_INSTALL_DIR=C2=A0 =C2=A0 =3D $(SCRIPT_INSTALL_DIR)/../tcl9<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0# Directory in which to install the include file tcl.h:<br=
>
&gt;=C2=A0 -INCLUDE_INSTALL_DIR=C2=A0 =C2=A0=3D $(INSTALL_ROOT)$(includedir=
)<br>
&gt; @@ -38,11 +38,11 @@ index a3b7d69..969ddb8 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0# Path to the private tcl header dir:<br>
&gt;=C2=A0 =C2=A0PRIVATE_INCLUDE_DIR=C2=A0 =C2=A0=3D @PRIVATE_INCLUDE_DIR@<=
br>
&gt; -diff --git a/unix/<a href=3D"http://configure.in" rel=3D"noreferrer" =
target=3D"_blank">configure.in</a> b/unix/<a href=3D"http://configure.in" r=
el=3D"noreferrer" target=3D"_blank">configure.in</a><br>
&gt; -index 4974fb6..a72934f 100644<br>
&gt; ---- a/unix/<a href=3D"http://configure.in" rel=3D"noreferrer" target=
=3D"_blank">configure.in</a><br>
&gt; -+++ b/unix/<a href=3D"http://configure.in" rel=3D"noreferrer" target=
=3D"_blank">configure.in</a><br>
&gt; -@@ -776,7 +776,7 @@ eval &quot;TCL_LIB_FILE=3Dlibtcl${LIB_SUFFIX}&quo=
t;<br>
&gt; +diff --git a/unix/<a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a> b/unix/<a href=3D"http://configure.ac" r=
el=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index b6d2506..72a8b0d 100644<br>
&gt; +--- a/unix/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt; ++++ b/unix/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt; +@@ -754,7 +754,7 @@ eval &quot;TCL_LIB_FILE=3Dlibtcl${LIB_SUFFIX}&quo=
t;<br>
&gt;=C2=A0 =C2=A0eval &quot;TCL_LIB_FILE=3D${TCL_LIB_FILE}&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0test -z &quot;$TCL_LIBRARY&quot; &amp;&amp; TCL_LIBRARY=3D=
&#39;$(libdir)/tcl$(VERSION)&#39;<br>
&gt; @@ -51,7 +51,7 @@ index 4974fb6..a72934f 100644<br>
&gt;=C2=A0 =C2=A0HTML_DIR=3D&#39;$(DISTDIR)/html&#39;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0# Note:=C2=A0 in the following variable, it&#39;s importan=
t to use the absolute<br>
&gt; -@@ -897,7 +897,7 @@ TCL_BUILD_STUB_LIB_PATH=3D&quot;`pwd`/${TCL_STUB_=
LIB_FILE}&quot;<br>
&gt; +@@ -921,7 +921,7 @@ TCL_BUILD_STUB_LIB_PATH=3D&quot;`pwd`/${TCL_STUB_=
LIB_FILE}&quot;<br>
&gt;=C2=A0 =C2=A0TCL_STUB_LIB_PATH=3D&quot;${TCL_STUB_LIB_DIR}/${TCL_STUB_L=
IB_FILE}&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0# Install time header dir can be set via --includedir<br>
&gt; @@ -61,7 +61,7 @@ index 4974fb6..a72934f 100644<br>
&gt;=C2=A0 =C2=A0#---------------------------------------------------------=
---------------<br>
&gt;=C2=A0 =C2=A0# tclConfig.sh refers to this by a different name<br>
&gt;=C2=A0 diff --git a/unix/<a href=3D"http://tcl.pc.in" rel=3D"noreferrer=
" target=3D"_blank">tcl.pc.in</a> b/unix/<a href=3D"http://tcl.pc.in" rel=
=3D"noreferrer" target=3D"_blank">tcl.pc.in</a><br>
&gt; -index 93b5e69..dcd51d7 100644<br>
&gt; +index 9c6da82..8aa5ae8 100644<br>
&gt;=C2=A0 --- a/unix/<a href=3D"http://tcl.pc.in" rel=3D"noreferrer" targe=
t=3D"_blank">tcl.pc.in</a><br>
&gt;=C2=A0 +++ b/unix/<a href=3D"http://tcl.pc.in" rel=3D"noreferrer" targe=
t=3D"_blank">tcl.pc.in</a><br>
&gt;=C2=A0 @@ -3,7 +3,7 @@<br>
&gt; @@ -73,3 +73,6 @@ index 93b5e69..dcd51d7 100644<br>
&gt;=C2=A0 =C2=A0libfile=3D@TCL_LIB_FILE@<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Name: Tool Command Language<br>
&gt; +--<br>
&gt; +2.39.5<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/tcltk/tcl/interp.patch b/meta/recip=
es-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test.patch<br>
&gt; similarity index 82%<br>
&gt; rename from meta/recipes-devtools/tcltk/tcl/interp.patch<br>
&gt; rename to meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.=
test.patch<br>
&gt; index 2e0dc94cff1..dfb0b63a0e0 100644<br>
&gt; --- a/meta/recipes-devtools/tcltk/tcl/interp.patch<br>
&gt; +++ b/meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test=
.patch<br>
&gt; @@ -1,7 +1,7 @@<br>
&gt; -From 426aa2ff62dda77fd011e8f630b9d4ea17984817 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 8a96171a33c886d1d9aab40e40f8aae2f621ca08 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" tar=
get=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 12 Jul 2021 14:50:13 +0100<br>
&gt; -Subject: [PATCH] tcl: fix race in interp.test<br>
&gt; +Subject: [PATCH 5/5] tcl: fix race in interp.test<br>
&gt;<br>
&gt;=C2=A0 The interp-36.7 patch has race conditions and is missing cleanup=
.=C2=A0 This patch by<br>
&gt;=C2=A0 a Tcl maintainer should improve matters.<br>
&gt; @@ -13,10 +13,10 @@ Signed-off-by: Ross Burton &lt;<a href=3D"mailto:r=
oss.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/tests/interp.test b/tests/interp.test<br>
&gt; -index d742484..fc90990 100644<br>
&gt; +index 30dc659..e7cd0ee 100644<br>
&gt;=C2=A0 --- a/tests/interp.test<br>
&gt;=C2=A0 +++ b/tests/interp.test<br>
&gt; -@@ -3595,17 +3595,18 @@ test interp-36.7 {ChildBgerror sets error han=
dler of child [1999035]} -setup {<br>
&gt; +@@ -3614,17 +3614,18 @@ test interp-36.7 {ChildBgerror sets error han=
dler of child [1999035]} -setup {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0variable result<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set result [lindex $args 0]<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -38,3 +38,6 @@ index d742484..fc90990 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0interp delete child<br>
&gt;=C2=A0 =C2=A0} -result foo<br>
&gt;<br>
&gt; +--<br>
&gt; +2.39.5<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-=
devtools/tcltk/tcl/run-ptest<br>
&gt; index c485e535c71..8a9f611b0f7 100644<br>
&gt; --- a/meta/recipes-devtools/tcltk/tcl/run-ptest<br>
&gt; +++ b/meta/recipes-devtools/tcltk/tcl/run-ptest<br>
&gt; @@ -1,9 +1,8 @@<br>
&gt;=C2=A0 #!/bin/sh<br>
&gt;<br>
&gt; -# clock.test needs a timezone to be set<br>
&gt; -export TZ=3D&quot;Europe/London&quot;<br>
&gt; -export TCL_LIBRARY=3Dlibrary<br>
&gt; +export TCL_LIBRARY=3D/usr/lib/tcl/ptest/library<br>
&gt;=C2=A0 export ERROR_ON_FAILURES=3D1<br>
&gt; +export LANG=3Den-US.UTF-8<br>
&gt;<br>
&gt;=C2=A0 # Some tests are overly strict with timings and fail on loaded s=
ystems.<br>
&gt;=C2=A0 SKIP=3D&quot;&quot;<br>
&gt; @@ -19,6 +18,8 @@ SKIP=3D&quot;$SKIP \*io-46.1&quot;<br>
&gt;=C2=A0 SKIP=3D&quot;$SKIP io-13.6&quot;<br>
&gt;=C2=A0 # 14825<br>
&gt;=C2=A0 SKIP=3D&quot;$SKIP socket-\* socket_inet-\*&quot;<br>
&gt; +# tries to access <a href=3D"http://google.com" rel=3D"noreferrer" ta=
rget=3D"_blank">google.com</a><br>
&gt; +SKIP=3D&quot;$SKIP httpProxy-\*&quot;<br>
&gt;<br>
&gt;=C2=A0 for i in tests/*.test; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 i=3D$(basename $i)<br>
&gt; diff --git a/meta/recipes-devtools/tcltk/<a href=3D"http://tcl_8.6.15.=
bb" rel=3D"noreferrer" target=3D"_blank">tcl_8.6.15.bb</a> b/meta/recipes-d=
evtools/tcltk/<a href=3D"http://tcl_9.0.0.bb" rel=3D"noreferrer" target=3D"=
_blank">tcl_9.0.0.bb</a><br>
&gt; similarity index 82%<br>
&gt; rename from meta/recipes-devtools/tcltk/<a href=3D"http://tcl_8.6.15.b=
b" rel=3D"noreferrer" target=3D"_blank">tcl_8.6.15.bb</a><br>
&gt; rename to meta/recipes-devtools/tcltk/<a href=3D"http://tcl_9.0.0.bb" =
rel=3D"noreferrer" target=3D"_blank">tcl_9.0.0.bb</a><br>
&gt; index 340854056eb..b3968b5be14 100644<br>
&gt; --- a/meta/recipes-devtools/tcltk/<a href=3D"http://tcl_8.6.15.bb" rel=
=3D"noreferrer" target=3D"_blank">tcl_8.6.15.bb</a><br>
&gt; +++ b/meta/recipes-devtools/tcltk/<a href=3D"http://tcl_9.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">tcl_9.0.0.bb</a><br>
&gt; @@ -15,18 +15,15 @@ LIC_FILES_CHKSUM =3D &quot;file://license.terms;md=
5=3D058f6229798281bbcac4239c788cfa38 \<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;tcl-native zlib&quot;<br>
&gt;<br>
&gt; -BASE_SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.ta=
r.gz \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://tcl-ad=
d-soname.patch&quot;<br>
&gt; -SRC_URI =3D &quot;${BASE_SRC_URI} \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix_non_native_build_=
issue.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://tcl-remove-hardcoded-=
install-path.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://alter-includedir.patc=
h \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://interp.patch \<br>
&gt; +SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.tar.gz =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tcl-Add-tcltk-fr=
om-OE.dev-but-with-legacy-staging-fu.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-tcl-fix-a-build-=
issue.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-tcl-install-tcl-=
to-lib64-instead-of-lib-on-64bit-tar.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-tcl-update-the-h=
eader-location.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-tcl-fix-race-in-=
interp.test.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;844775491e435e34d83d6ccfbadd1342f1855f17=
05253233a86152df0765e78d&quot;<br>
&gt; -<br>
&gt; -SRC_URI:class-native =3D &quot;${BASE_SRC_URI}&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;3186e23c7417359d90e3c46f531d442c76d3c05a=
2dba1081c02b75e32908b2b7&quot;<br>
&gt;<br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://www.tcl.tk/softw=
are/tcltk/download.html" rel=3D"noreferrer" target=3D"_blank">https://www.t=
cl.tk/software/tcltk/download.html</a>&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;tcl(?P&lt;pver&gt;\d+(\.\d+)+)-sr=
c&quot;<br>
&gt; @@ -38,7 +35,7 @@ VER =3D &quot;${PV}&quot;<br>
&gt;=C2=A0 inherit autotools ptest binconfig<br>
&gt;<br>
&gt;=C2=A0 AUTOTOOLS_SCRIPT_PATH =3D &quot;${S}/unix&quot;<br>
&gt; -EXTRA_OECONF =3D &quot;--enable-threads --disable-rpath --enable-man-=
suffix&quot;<br>
&gt; +EXTRA_OECONF =3D &quot;--disable-rpath --enable-man-suffix&quot;<br>
&gt;<br>
&gt;=C2=A0 # Prevent installing copy of tzdata based on tzdata installation=
 on the build host<br>
&gt;=C2=A0 # It doesn&#39;t install tzdata if one of the following files ex=
ist on the host:<br>
&gt; @@ -65,13 +62,13 @@ do_install() {<br>
&gt;=C2=A0 SYSROOT_DIRS +=3D &quot;${bindir_crossscripts}&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGES =3D+ &quot;tcl-lib&quot;<br>
&gt; -FILES:tcl-lib =3D &quot;${libdir}/libtcl8.6.so.*&quot;<br>
&gt; -FILES:${PN} +=3D &quot;${libdir}/tcl${VER} ${libdir}/tcl8.6 ${libdir}=
/tcl8&quot;<br>
&gt; +FILES:tcl-lib =3D &quot;${libdir}/libtcl9.0.so.*&quot;<br>
&gt; +FILES:${PN} +=3D &quot;${libdir}/tcl${VER} ${libdir}/tcl9.0 ${libdir}=
/tcl9&quot;<br>
&gt;=C2=A0 FILES:${PN}-dev +=3D &quot;${libdir}/tclConfig.sh ${libdir}/tclo=
oConfig.sh&quot;<br>
&gt;<br>
&gt;=C2=A0 # isn&#39;t getting picked up by shlibs code<br>
&gt;=C2=A0 RDEPENDS:${PN} +=3D &quot;tcl-lib&quot;<br>
&gt; -RDEPENDS:${PN}-ptest +=3D &quot;libgcc&quot;<br>
&gt; +RDEPENDS:${PN}-ptest +=3D &quot;libgcc locale-base-en-us tzdata&quot;=
<br>
&gt;<br>
&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.39.5<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#206575): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/206575" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/206575</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10931193=
0/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/109311930/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000cd666e06261d4cdd--

