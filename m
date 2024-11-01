Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD1EE6F077
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 17:51:04 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web11.518.1730483462689079400
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 10:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R3IQMbGq;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5ec6bdd9923so1162885eaf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 10:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730483462; x=1731088262; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRHNoI70ARar/Kk5I9BVPp/LKPrXInpZLhHhsc5CmMs=;
        b=R3IQMbGqn4vLX4P5KNs8yRk+tM8VWTX+WKtGpFig2eYWJvwA1NWrRWWsZGEEqn40Wh
         IlKjl7fgrEGXeOnO/En44w7YNryuLYZhkTTmhUroMIuOFPXgOhLoTCxNmqLB8STJAlYG
         oxRRPjgOt4BcyaMAWX2rs5RwPwpP+SCHARFMSHGQoRZxqLvyh+6NxaTPZcg1F0+8+4PS
         hdH2jvp0RFYXGVK7nZsXaK9SnlQj4kdj8JOtwcQSpm6vIsFdVCQHj/R0cZUxRWCU2eQK
         J6hE8MO5+NaUl2PXlumjXQWgYMbNqkGNUUvTg4d3pX/vJXmn6bOUJYmhqpg7/hMGM1g5
         97Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730483462; x=1731088262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kRHNoI70ARar/Kk5I9BVPp/LKPrXInpZLhHhsc5CmMs=;
        b=rceRGCpIMwKMCYueTmRwyrdCWsjIsrugI4Znl6YHC484A67Dw3gYZpilnPUx7vGF3I
         sQn9UuxRz0PjRYPJH0+BdIk0yLFkdk2t76mK0ZCgwAFV3HZTe23VoXYumXZCBAnnj0Ek
         zUHkKy5ELrq66lsKM5RWj9kT1cLjM7FLWJOd5hqivtCyYb9moZ+ZAdlXckE7HoWmh8r/
         MA5OxtjFJDmBq4caKrWYapLY+pftMdnHqD/4D8T9w/JMPisx941u0btnxtLEPsYLVd2m
         VIZA7ZpMz8DfRS1FnktgssDmjnV78XKDApIDa7va0Ezh3SQ/8lSwoMX2sPOkeJ/gdGkm
         A5Qw==
X-Gm-Message-State: AOJu0YxBDv8BmqQX/61VsRgZLS7PXMTir7ZaIlqrPv0jADvjh47hT/iJ
	lAxLmz/y5PjO8L8nIUDZxI7CnUKKg56SmoxAZHACKkKBLZ7oOJrp4eMJ+ra4aKBoVsGI0GZEG0E
	gWaCHWe+m37Aipo3R7MR2NscfMbg=
X-Google-Smtp-Source: AGHT+IH+6COnWvrB19yCGhGXvg/6+HXSKJq+SK9z4RQ3QHlttngcMyHKCbeRAvDHT3uVfZuik5EbhTYfzdxF88lBKHo=
X-Received: by 2002:a05:6820:1629:b0:5e7:cb2e:e01e with SMTP id
 006d021491bc7-5ede65f508cmr2950470eaf.7.1730483461719; Fri, 01 Nov 2024
 10:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20241031101556.1913400-1-alex.kanavin@gmail.com>
In-Reply-To: <20241031101556.1913400-1-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Nov 2024 10:50:35 -0700
Message-ID: <CAMKF1spGp5xPKbVv85dKoC_E9Vk28C_r0vc3a48z2m+f1HnXjw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] tcl: update 8.6.15 -> 9.0.0
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 17:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206624

here are couple of fails on meta-openembedded layers

https://errors.yoctoproject.org/Errors/Build/194630/

On Thu, Oct 31, 2024 at 3:16=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Alexander Kanavin <alex@linutronix.de>
>
> Make adjustments needed for ptests: among others,
> the binary.test needs 4G of RAM.
>
> Apply all patches unconditionally for ease of future upgrades.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-core/images/core-image-ptest.bb  |  1 +
>  ...m-OE.dev-but-with-legacy-staging-fu.patch} | 16 +++++---
>  ...patch =3D> 0002-tcl-fix-a-build-issue.patch} | 37 ++++++++++---------
>  ...o-lib64-instead-of-lib-on-64bit-tar.patch} | 19 ++++++----
>  ...0004-tcl-update-the-header-location.patch} | 27 ++++++++------
>  ...=3D> 0005-tcl-fix-race-in-interp.test.patch} | 11 ++++--
>  meta/recipes-devtools/tcltk/tcl/run-ptest     |  7 ++--
>  .../tcltk/{tcl_8.6.15.bb =3D> tcl_9.0.0.bb}     | 25 ++++++-------
>  8 files changed, 79 insertions(+), 64 deletions(-)
>  rename meta/recipes-devtools/tcltk/tcl/{tcl-add-soname.patch =3D> 0001-t=
cl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch} (80%)
>  rename meta/recipes-devtools/tcltk/tcl/{fix_non_native_build_issue.patch=
 =3D> 0002-tcl-fix-a-build-issue.patch} (71%)
>  rename meta/recipes-devtools/tcltk/tcl/{tcl-remove-hardcoded-install-pat=
h.patch =3D> 0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patc=
h} (63%)
>  rename meta/recipes-devtools/tcltk/tcl/{alter-includedir.patch =3D> 0004=
-tcl-update-the-header-location.patch} (80%)
>  rename meta/recipes-devtools/tcltk/tcl/{interp.patch =3D> 0005-tcl-fix-r=
ace-in-interp.test.patch} (82%)
>  rename meta/recipes-devtools/tcltk/{tcl_8.6.15.bb =3D> tcl_9.0.0.bb} (82=
%)
>
> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-=
core/images/core-image-ptest.bb
> index 72081f938de..a0ff8d9528e 100644
> --- a/meta/recipes-core/images/core-image-ptest.bb
> +++ b/meta/recipes-core/images/core-image-ptest.bb
> @@ -32,6 +32,7 @@ QB_MEM =3D "-m 1024"
>  QB_MEM:virtclass-mcextend-lttng-tools =3D "-m 4096"
>  QB_MEM:virtclass-mcextend-python3 =3D "-m 2048"
>  QB_MEM:virtclass-mcextend-python3-cryptography =3D "-m 5100"
> +QB_MEM:virtclass-mcextend-tcl =3D "-m 5100"
>
>  TEST_SUITES =3D "ping ssh parselogs ptest"
>
> diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch b/meta/=
recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-s=
taging-fu.patch
> similarity index 80%
> rename from meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
> rename to meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-=
but-with-legacy-staging-fu.patch
> index a0195e263c1..9472591a55f 100644
> --- a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
> +++ b/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-=
with-legacy-staging-fu.patch
> @@ -1,7 +1,8 @@
> -From b89fd73daf9b3eb2f889f65baba5f90d8a930c82 Mon Sep 17 00:00:00 2001
> +From f69a01c5932af2d5ece6141e4424b14a2d645fd7 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <rpurdie@linux.intel.com>
>  Date: Wed, 9 Dec 2009 23:59:44 +0000
> -Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging func=
tion
> +Subject: [PATCH 1/5] tcl: Add tcltk from OE.dev but with legacy staging
> + function
>
>  Upstream-Status: Pending
>  ---
> @@ -10,10 +11,10 @@ Upstream-Status: Pending
>   2 files changed, 7 insertions(+), 1 deletion(-)
>
>  diff --git a/unix/Makefile.in b/unix/Makefile.in
> -index 7619afc..9dd053d 100644
> +index 0ff1258..6e74458 100644
>  --- a/unix/Makefile.in
>  +++ b/unix/Makefile.in
> -@@ -904,7 +904,10 @@ install-binaries: binaries
> +@@ -1027,7 +1027,10 @@ install-binaries: binaries
>         done
>         @echo "Installing $(LIB_FILE) to $(DLL_INSTALL_DIR)/"
>         @@INSTALL_LIB@
> @@ -26,10 +27,10 @@ index 7619afc..9dd053d 100644
>         @$(INSTALL_PROGRAM) ${TCL_EXE} "$(BIN_INSTALL_DIR)/tclsh$(VERSION=
)${EXE_SUFFIX}"
>         @echo "Installing tclConfig.sh to $(CONFIG_INSTALL_DIR)/"
>  diff --git a/unix/tcl.m4 b/unix/tcl.m4
> -index 0307a06..37c4d67 100644
> +index 99bc8bf..7e6e0da 100644
>  --- a/unix/tcl.m4
>  +++ b/unix/tcl.m4
> -@@ -1378,6 +1378,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
> +@@ -1269,6 +1269,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
>             # get rid of the warnings.
>             #CFLAGS_OPTIMIZE=3D"${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINES =
-D__NO_MATH_INLINES"
>
> @@ -39,3 +40,6 @@ index 0307a06..37c4d67 100644
>             SHLIB_LD=3D'${CC} ${CFLAGS} ${LDFLAGS} -shared'
>             DL_OBJS=3D"tclLoadDl.o"
>             DL_LIBS=3D"-ldl"
> +--
> +2.39.5
> +
> diff --git a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.p=
atch b/meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patch
> similarity index 71%
> rename from meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.pa=
tch
> rename to meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patc=
h
> index fac7ed7e281..53cfd8927db 100644
> --- a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
> +++ b/meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patch
> @@ -1,18 +1,18 @@
> -From bd512547fc002fdb20808bf5b8b9feeb848b6512 Mon Sep 17 00:00:00 2001
> +From 61ef40f2bc418ce072828ad1939eaa40f981e76e Mon Sep 17 00:00:00 2001
>  From: Nitin A Kamble <nitin.a.kamble@intel.com>
>  Date: Fri, 13 Aug 2010 12:24:00 -0700
> -Subject: [PATCH] tcl: fix a build issue
> +Subject: [PATCH 2/5] tcl: fix a build issue
>
>  Upstream-Status: Inappropriate [upstream does not support installed test=
s]
>  ---
> - unix/Makefile.in | 20 ++++++++++----------
> - 1 file changed, 10 insertions(+), 10 deletions(-)
> + unix/Makefile.in | 19 +++++++++----------
> + 1 file changed, 9 insertions(+), 10 deletions(-)
>
>  diff --git a/unix/Makefile.in b/unix/Makefile.in
> -index 965f6da..a0bd63f 100644
> +index 6e74458..bd0b818 100644
>  --- a/unix/Makefile.in
>  +++ b/unix/Makefile.in
> -@@ -723,7 +723,7 @@ tcltest-real:
> +@@ -918,7 +918,7 @@ tcltest-real:
>   test: test-tcl test-packages
>
>   test-tcl: ${TCLTEST_EXE}
> @@ -20,15 +20,12 @@ index 965f6da..a0bd63f 100644
>  +      $(SHELL_ENV) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl $(TESTFLAGS)
>
>   gdb-test: ${TCLTEST_EXE}
> -       @printf '%s ' set env @LD_LIBRARY_PATH_VAR@=3D\"`pwd`$${@LD_LIBRA=
RY_PATH_VAR@:+:$${@LD_LIBRARY_PATH_VAR}}\" > gdb.run
> -@@ -732,17 +732,17 @@ gdb-test: ${TCLTEST_EXE}
> -       @printf '\n' >>gdb.run
> -       @printf '%s ' set args $(call shquotequote,$(TOP_DIR))/tests/all.=
tcl\
> -               $(call shquotequote,$(TESTFLAGS)) -singleproc 1 >> gdb.ru=
n
> --      $(GDB) ./${TCLTEST_EXE} --command=3Dgdb.run
> -+      $(GDB) ${TCLTEST_EXE} --command=3Dgdb.run
> -       rm gdb.run
> +       $(SHELL_ENV) $(GDB) --args ./${TCLTEST_EXE} $(TOP_DIR)/tests/all.=
tcl \
> +@@ -928,15 +928,14 @@ lldb-test: ${TCLTEST_EXE}
> +       $(SHELL_ENV) $(LLDB) -- ./${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl=
 \
> +               $(TESTFLAGS) -singleproc 1
>
> +-
>   # Useful target to launch a built tcltest with the proper path,...
>   runtest: ${TCLTEST_EXE}
>  -      $(SHELL_ENV) ./${TCLTEST_EXE}
> @@ -37,12 +34,12 @@ index 965f6da..a0bd63f 100644
>   # Useful target for running the test suite with an unwritable current
>   # directory...
>   ro-test: ${TCLTEST_EXE}
> --      echo 'exec chmod -w .;package require tcltest;tcltest::temporaryD=
irectory /tmp;source -encoding utf-8 ../tests/all.tcl;exec chmod +w .' | $(=
SHELL_ENV) ./${TCLTEST_EXE}
> -+      echo 'exec chmod -w .;package require tcltest;tcltest::temporaryD=
irectory /tmp;source -encoding utf-8 ../tests/all.tcl;exec chmod +w .' | $(=
SHELL_ENV) ${TCLTEST_EXE}
> +-      echo 'exec chmod -w .;package require tcltest;tcltest::temporaryD=
irectory /tmp;source ../tests/all.tcl;exec chmod +w .' | $(SHELL_ENV) ./${T=
CLTEST_EXE}
> ++      echo 'exec chmod -w .;package require tcltest;tcltest::temporaryD=
irectory /tmp;source ../tests/all.tcl;exec chmod +w .' | $(SHELL_ENV) ${TCL=
TEST_EXE}
>
>   # The following target generates the shared libraries in dltest/ that a=
re used
>   # for testing; they are included as part of the "tcltest" target (via t=
he
> -@@ -760,28 +760,28 @@ dltest.marker: ${STUB_LIB_FILE}
> +@@ -954,17 +953,17 @@ dltest.marker: ${STUB_LIB_FILE}
>   # This target can be used to run tclsh from the build directory
>   # via `make shell SCRIPT=3D/tmp/foo.tcl`
>   shell: ${TCL_EXE}
> @@ -63,6 +60,9 @@ index 965f6da..a0bd63f 100644
>                 $(TOP_DIR)/tests/all.tcl -singleproc 1 -constraints valgr=
ind \
>                 $(TESTFLAGS)
>
> +@@ -990,13 +989,13 @@ valgrind_each: $(addprefix testresults/valgrind/,$=
(addsuffix .success,$(notdir\
> +
> +
>   valgrindshell: ${TCL_EXE}
>  -      $(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ./${TCL_EXE} $(SCRIPT)
>  +      $(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ${TCL_EXE} $(SCRIPT)
> @@ -77,3 +77,6 @@ index 965f6da..a0bd63f 100644
>
>   #----------------------------------------------------------------------=
----
>   # Installation rules
> +--
> +2.39.5
> +
> diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install=
-path.patch b/meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib64=
-instead-of-lib-on-64bit-tar.patch
> similarity index 63%
> rename from meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-=
path.patch
> rename to meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib64-i=
nstead-of-lib-on-64bit-tar.patch
> index 93e7877256b..fb534044988 100644
> --- a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.p=
atch
> +++ b/meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib64-inste=
ad-of-lib-on-64bit-tar.patch
> @@ -1,7 +1,7 @@
> -From 050fc597fbfa4da2c31bd0df58c871892a490470 Mon Sep 17 00:00:00 2001
> +From 8af08b6f1e566af239e36864823a96c2c283e4ea Mon Sep 17 00:00:00 2001
>  From: "Song.Li" <Song.Li@windriver.com>
>  Date: Wed, 1 Aug 2012 19:05:51 +0800
> -Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit target
> +Subject: [PATCH 3/5] tcl:install tcl to lib64 instead of lib on 64bit ta=
rget
>
>  Remove hardcoded library install path. Change $(prefix)/lib/ to ${libdir=
}.
>
> @@ -13,14 +13,14 @@ Signed-off-by: Song.Li <Song.Li@windriver.com>
>  Signed-off-by: Kai Kang <kai.kang@windriver.com>
>  Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>  ---
> - unix/configure.in | 2 +-
> + unix/configure.ac | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -diff --git a/unix/configure.in b/unix/configure.in
> -index 4f62510..4974fb6 100644
> ---- a/unix/configure.in
> -+++ b/unix/configure.in
> -@@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=3Dlibtcl${LIB_SUFFIX}"
> +diff --git a/unix/configure.ac b/unix/configure.ac
> +index 461b394..b6d2506 100644
> +--- a/unix/configure.ac
> ++++ b/unix/configure.ac
> +@@ -753,7 +753,7 @@ eval "TCL_LIB_FILE=3Dlibtcl${LIB_SUFFIX}"
>
>   eval "TCL_LIB_FILE=3D${TCL_LIB_FILE}"
>
> @@ -29,3 +29,6 @@ index 4f62510..4974fb6 100644
>   PRIVATE_INCLUDE_DIR=3D'$(includedir)'
>   HTML_DIR=3D'$(DISTDIR)/html'
>
> +--
> +2.39.5
> +
> diff --git a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch b/met=
a/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
> similarity index 80%
> rename from meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
> rename to meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-loca=
tion.patch
> index bfc718cfd3c..7953dcecff1 100644
> --- a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
> +++ b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location=
.patch
> @@ -1,7 +1,7 @@
> -From 3130dca60636dc12d0d12df75b002fd123349e21 Mon Sep 17 00:00:00 2001
> +From 20870e9cd4f5a211fe94f484f707269ee1abd947 Mon Sep 17 00:00:00 2001
>  From: Mingli Yu <mingli.yu@windriver.com>
>  Date: Tue, 22 Nov 2022 18:48:27 +0800
> -Subject: [PATCH] tcl: update the header location
> +Subject: [PATCH 4/5] tcl: update the header location
>
>  Lets install the include header and private header files into
>  usr/include/tcl8.6 when version of tcl is 8.6.x
> @@ -21,16 +21,16 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>  Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>  ---
>   unix/Makefile.in  | 2 +-
> - unix/configure.in | 4 ++--
> + unix/configure.ac | 4 ++--
>   unix/tcl.pc.in    | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
>
>  diff --git a/unix/Makefile.in b/unix/Makefile.in
> -index a3b7d69..969ddb8 100644
> +index bd0b818..ddf2b67 100644
>  --- a/unix/Makefile.in
>  +++ b/unix/Makefile.in
>  @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR   =3D $(INSTALL_ROOT)$(TCL_LIBRARY)
> - MODULE_INSTALL_DIR    =3D $(SCRIPT_INSTALL_DIR)/../tcl8
> + MODULE_INSTALL_DIR    =3D $(SCRIPT_INSTALL_DIR)/../tcl9
>
>   # Directory in which to install the include file tcl.h:
>  -INCLUDE_INSTALL_DIR   =3D $(INSTALL_ROOT)$(includedir)
> @@ -38,11 +38,11 @@ index a3b7d69..969ddb8 100644
>
>   # Path to the private tcl header dir:
>   PRIVATE_INCLUDE_DIR   =3D @PRIVATE_INCLUDE_DIR@
> -diff --git a/unix/configure.in b/unix/configure.in
> -index 4974fb6..a72934f 100644
> ---- a/unix/configure.in
> -+++ b/unix/configure.in
> -@@ -776,7 +776,7 @@ eval "TCL_LIB_FILE=3Dlibtcl${LIB_SUFFIX}"
> +diff --git a/unix/configure.ac b/unix/configure.ac
> +index b6d2506..72a8b0d 100644
> +--- a/unix/configure.ac
> ++++ b/unix/configure.ac
> +@@ -754,7 +754,7 @@ eval "TCL_LIB_FILE=3Dlibtcl${LIB_SUFFIX}"
>   eval "TCL_LIB_FILE=3D${TCL_LIB_FILE}"
>
>   test -z "$TCL_LIBRARY" && TCL_LIBRARY=3D'$(libdir)/tcl$(VERSION)'
> @@ -51,7 +51,7 @@ index 4974fb6..a72934f 100644
>   HTML_DIR=3D'$(DISTDIR)/html'
>
>   # Note:  in the following variable, it's important to use the absolute
> -@@ -897,7 +897,7 @@ TCL_BUILD_STUB_LIB_PATH=3D"`pwd`/${TCL_STUB_LIB_FILE=
}"
> +@@ -921,7 +921,7 @@ TCL_BUILD_STUB_LIB_PATH=3D"`pwd`/${TCL_STUB_LIB_FILE=
}"
>   TCL_STUB_LIB_PATH=3D"${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
>
>   # Install time header dir can be set via --includedir
> @@ -61,7 +61,7 @@ index 4974fb6..a72934f 100644
>   #----------------------------------------------------------------------=
--
>   # tclConfig.sh refers to this by a different name
>  diff --git a/unix/tcl.pc.in b/unix/tcl.pc.in
> -index 93b5e69..dcd51d7 100644
> +index 9c6da82..8aa5ae8 100644
>  --- a/unix/tcl.pc.in
>  +++ b/unix/tcl.pc.in
>  @@ -3,7 +3,7 @@
> @@ -73,3 +73,6 @@ index 93b5e69..dcd51d7 100644
>   libfile=3D@TCL_LIB_FILE@
>
>   Name: Tool Command Language
> +--
> +2.39.5
> +
> diff --git a/meta/recipes-devtools/tcltk/tcl/interp.patch b/meta/recipes-=
devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test.patch
> similarity index 82%
> rename from meta/recipes-devtools/tcltk/tcl/interp.patch
> rename to meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.tes=
t.patch
> index 2e0dc94cff1..dfb0b63a0e0 100644
> --- a/meta/recipes-devtools/tcltk/tcl/interp.patch
> +++ b/meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test.pa=
tch
> @@ -1,7 +1,7 @@
> -From 426aa2ff62dda77fd011e8f630b9d4ea17984817 Mon Sep 17 00:00:00 2001
> +From 8a96171a33c886d1d9aab40e40f8aae2f621ca08 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@arm.com>
>  Date: Mon, 12 Jul 2021 14:50:13 +0100
> -Subject: [PATCH] tcl: fix race in interp.test
> +Subject: [PATCH 5/5] tcl: fix race in interp.test
>
>  The interp-36.7 patch has race conditions and is missing cleanup.  This =
patch by
>  a Tcl maintainer should improve matters.
> @@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
>  diff --git a/tests/interp.test b/tests/interp.test
> -index d742484..fc90990 100644
> +index 30dc659..e7cd0ee 100644
>  --- a/tests/interp.test
>  +++ b/tests/interp.test
> -@@ -3595,17 +3595,18 @@ test interp-36.7 {ChildBgerror sets error handle=
r of child [1999035]} -setup {
> +@@ -3614,17 +3614,18 @@ test interp-36.7 {ChildBgerror sets error handle=
r of child [1999035]} -setup {
>           variable result
>           set result [lindex $args 0]
>       }
> @@ -38,3 +38,6 @@ index d742484..fc90990 100644
>       interp delete child
>   } -result foo
>
> +--
> +2.39.5
> +
> diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-dev=
tools/tcltk/tcl/run-ptest
> index c485e535c71..8a9f611b0f7 100644
> --- a/meta/recipes-devtools/tcltk/tcl/run-ptest
> +++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
> @@ -1,9 +1,8 @@
>  #!/bin/sh
>
> -# clock.test needs a timezone to be set
> -export TZ=3D"Europe/London"
> -export TCL_LIBRARY=3Dlibrary
> +export TCL_LIBRARY=3D/usr/lib/tcl/ptest/library
>  export ERROR_ON_FAILURES=3D1
> +export LANG=3Den-US.UTF-8
>
>  # Some tests are overly strict with timings and fail on loaded systems.
>  SKIP=3D""
> @@ -19,6 +18,8 @@ SKIP=3D"$SKIP \*io-46.1"
>  SKIP=3D"$SKIP io-13.6"
>  # 14825
>  SKIP=3D"$SKIP socket-\* socket_inet-\*"
> +# tries to access google.com
> +SKIP=3D"$SKIP httpProxy-\*"
>
>  for i in tests/*.test; do
>      i=3D$(basename $i)
> diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.15.bb b/meta/recipes-dev=
tools/tcltk/tcl_9.0.0.bb
> similarity index 82%
> rename from meta/recipes-devtools/tcltk/tcl_8.6.15.bb
> rename to meta/recipes-devtools/tcltk/tcl_9.0.0.bb
> index 340854056eb..b3968b5be14 100644
> --- a/meta/recipes-devtools/tcltk/tcl_8.6.15.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
> @@ -15,18 +15,15 @@ LIC_FILES_CHKSUM =3D "file://license.terms;md5=3D058f=
6229798281bbcac4239c788cfa38 \
>
>  DEPENDS =3D "tcl-native zlib"
>
> -BASE_SRC_URI =3D "${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.tar.gz \
> -                file://tcl-add-soname.patch"
> -SRC_URI =3D "${BASE_SRC_URI} \
> -           file://fix_non_native_build_issue.patch \
> -           file://tcl-remove-hardcoded-install-path.patch \
> -           file://alter-includedir.patch \
> -           file://interp.patch \
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.tar.gz \
>             file://run-ptest \
> +           file://0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging=
-fu.patch \
> +           file://0002-tcl-fix-a-build-issue.patch \
> +           file://0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-=
tar.patch \
> +           file://0004-tcl-update-the-header-location.patch \
> +           file://0005-tcl-fix-race-in-interp.test.patch \
>             "
> -SRC_URI[sha256sum] =3D "844775491e435e34d83d6ccfbadd1342f1855f1705253233=
a86152df0765e78d"
> -
> -SRC_URI:class-native =3D "${BASE_SRC_URI}"
> +SRC_URI[sha256sum] =3D "3186e23c7417359d90e3c46f531d442c76d3c05a2dba1081=
c02b75e32908b2b7"
>
>  UPSTREAM_CHECK_URI =3D "https://www.tcl.tk/software/tcltk/download.html"
>  UPSTREAM_CHECK_REGEX =3D "tcl(?P<pver>\d+(\.\d+)+)-src"
> @@ -38,7 +35,7 @@ VER =3D "${PV}"
>  inherit autotools ptest binconfig
>
>  AUTOTOOLS_SCRIPT_PATH =3D "${S}/unix"
> -EXTRA_OECONF =3D "--enable-threads --disable-rpath --enable-man-suffix"
> +EXTRA_OECONF =3D "--disable-rpath --enable-man-suffix"
>
>  # Prevent installing copy of tzdata based on tzdata installation on the =
build host
>  # It doesn't install tzdata if one of the following files exist on the h=
ost:
> @@ -65,13 +62,13 @@ do_install() {
>  SYSROOT_DIRS +=3D "${bindir_crossscripts}"
>
>  PACKAGES =3D+ "tcl-lib"
> -FILES:tcl-lib =3D "${libdir}/libtcl8.6.so.*"
> -FILES:${PN} +=3D "${libdir}/tcl${VER} ${libdir}/tcl8.6 ${libdir}/tcl8"
> +FILES:tcl-lib =3D "${libdir}/libtcl9.0.so.*"
> +FILES:${PN} +=3D "${libdir}/tcl${VER} ${libdir}/tcl9.0 ${libdir}/tcl9"
>  FILES:${PN}-dev +=3D "${libdir}/tclConfig.sh ${libdir}/tclooConfig.sh"
>
>  # isn't getting picked up by shlibs code
>  RDEPENDS:${PN} +=3D "tcl-lib"
> -RDEPENDS:${PN}-ptest +=3D "libgcc"
> +RDEPENDS:${PN}-ptest +=3D "libgcc locale-base-en-us tzdata"
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206575): https://lists.openembedded.org/g/openembedde=
d-core/message/206575
> Mute This Topic: https://lists.openembedded.org/mt/109311930/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

