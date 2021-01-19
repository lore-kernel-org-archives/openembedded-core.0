Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.8735.1611043982812880037
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 00:13:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=MtGJ4q2P;
 spf=pass (domain: nathanrossi.com, ip: 209.85.214.179, mailfrom: nathan@nathanrossi.com)
Received: by mail-pl1-f179.google.com with SMTP id be12so10055531plb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 00:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=uojA38UQ5IJUoOSwiRI9ICgkJ9SwDvls6mv5YRrbvI4=;
        b=MtGJ4q2PM7AIXxnmhsnfmAbNvYCJF2HOAtSZj9lX7gZmDj8z/Weu4pGH+2bDIoS9fh
         jsWeWDh48nYSC8ZXnXlgN8p257J4V10Qp56nnJum9tANtT4sLcqJOkuJRaI0VxrMnD+p
         zFQuOiNbOFzzlnrU+uhE6ixmy8pJM9cyDzSbxa8sxsW6Zggd6Ys692AFlwrJK+ylm8VC
         7vpoiomwxqEgweHXgD2xeHH4YxJobNqSYoBtXK21iRXO4qOHj0va8+EgAO5gd0CDGZhR
         LKsmaUr9aHfXxd/jnu7vsYsj3tDxy0WoHFP4LpFsV1GrfGncQ3q3NmaLgv6IdiKxyO5o
         6ENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=uojA38UQ5IJUoOSwiRI9ICgkJ9SwDvls6mv5YRrbvI4=;
        b=qKc4Bcwq+3lg42I8Nq+kLwLzMGhPoJqFG7RXYP5Ooa6uP3B241mjCp/qRXee9WZA71
         RT3N+vl5Isl6Gq5iwhk6nJPJHub6FKJnqxcbk4ve2gCeVMwdOOsdKSWsVOQ4qItzVLIs
         zeSTzZE6HqFstVXYjpvhfPN1w3D1g0qs7/VwdXRkHQQaQZnHOI5rJE1fFGsDog8/9LHW
         kJxEFGjz6MPxSUbqVe289Ct/unzY0qJUf8iLWId8qIb0+9VlcypedSsp52TlBVP9XRbo
         dV6FJMb2UKPgPrGIJtTlCspF+fjZ+ZNSY8MwEZTk9kIThBEczEhlZCSge6uvw5a8GhWo
         ueDg==
X-Gm-Message-State: AOAM5313rriGNx0QfJCGlo3tRgmwJSQopJ/+SnVAhZjv6BD6vYNvD1r3
	RaXPsQMN14TR3kcP9Hml2W5lVQ==
X-Google-Smtp-Source: ABdhPJxzqiGUmQcOFxxDaFKxJbKV3JXY2enu43mvFJUkNiuvfJY62Pe/WzhcBBu7r0YrynF3bENtVg==
X-Received: by 2002:a17:90a:bd13:: with SMTP id y19mr3995558pjr.24.1611043982233;
        Tue, 19 Jan 2021 00:13:02 -0800 (PST)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-70-209.751446.bne.nbn.aussiebb.net. [117.20.70.209])
        by smtp.gmail.com with UTF8SMTPSA id gg22sm1932387pjb.24.2021.01.19.00.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 00:13:01 -0800 (PST)
Date: Tue, 19 Jan 2021 08:12:51 +0000
Message-Id: <20210119081251.253018-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH] gcc: Backport patch to resolve i*86 tune configuration overrides
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Upstream has merged a change to handle detection of target overrides so
that they are only applied as required. Backport this patch from
upstream and remove the OE specific patch.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/gcc/gcc-10.2.inc             |   2 +-
 .../gcc/0001-lib-Remove-i-86-march-overrides.patch | 113 -----------
 ...omic-libgomp-libitc-Fix-bootstrap-PR70454.patch | 208 +++++++++++++++++++++
 3 files changed, 209 insertions(+), 114 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch

diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools/gcc/gcc-10.2.inc
index 1e69c91311..c0cd8b31d5 100644
--- a/meta/recipes-devtools/gcc/gcc-10.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
@@ -69,7 +69,7 @@ SRC_URI = "\
            file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch \
            file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch \
            file://0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch \
-           file://0001-lib-Remove-i-86-march-overrides.patch \
+           file://0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch \
 "
 SRC_URI[sha256sum] = "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch b/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
deleted file mode 100644
index 3f04e121ba..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 3776789cde95916f95deef48acf9532b0ebf91ae Mon Sep 17 00:00:00 2001
-From: Nathan Rossi <nathan@nathanrossi.com>
-Date: Tue, 15 Dec 2020 11:43:36 +1000
-Subject: [PATCH] lib*: Remove i*86 march overrides
-
-OE does not pass the '--with-arch' option to gccs configure, as such
-some gcc-runtime libraries try to override the value of '-march' and
-'-mtune' which OE already provides. This causes conflicts with other
-i*86 instruction/architecture flags (e.g. -msse* and -mfpmath=*).
-Additionally this caused the following libraries to be built with less
-optimized tune configurations.
-
-Upstream suggests that this should be detecting or otherwise checking if
-the target supports the desired functionality before overriding.
-
-    https://gcc.gnu.org/legacy-ml/gcc-patches/2016-04/msg01344.html
-
-libatomic also overrides the '-march' specifically for IFUNC objects.
-OE already supplies the correct march flag, so remove setting.
-
-Upstream-Status: Inappropriate [OE Specific]
-Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
----
- libatomic/Makefile.am   | 1 -
- libatomic/Makefile.in   | 1 -
- libatomic/configure.tgt | 9 ---------
- libgomp/configure.tgt   | 8 --------
- libitm/configure.tgt    | 9 ---------
- 5 files changed, 28 deletions(-)
-
-diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
-index ac1ca64587..5aa16e0699 100644
---- a/libatomic/Makefile.am
-+++ b/libatomic/Makefile.am
-@@ -133,7 +133,6 @@ libatomic_la_LIBADD += $(foreach s,$(SIZES),$(addsuffix _$(s)_1_.lo,$(SIZEOBJS))
- libatomic_la_LIBADD += $(addsuffix _8_2_.lo,$(SIZEOBJS))
- endif
- if ARCH_I386
--IFUNC_OPTIONS	     = -march=i586
- libatomic_la_LIBADD += $(addsuffix _8_1_.lo,$(SIZEOBJS))
- endif
- if ARCH_X86_64
-diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
-index 97df2d7ff0..82c511d420 100644
---- a/libatomic/Makefile.in
-+++ b/libatomic/Makefile.in
-@@ -432,7 +432,6 @@ libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix \
- 	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
- 	$(am__append_3) $(am__append_4)
- @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv7-a+fp -DHAVE_KERNEL64
--@ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=i586
- @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16
- libatomic_convenience_la_SOURCES = $(libatomic_la_SOURCES)
- libatomic_convenience_la_LIBADD = $(libatomic_la_LIBADD)
-diff --git a/libatomic/configure.tgt b/libatomic/configure.tgt
-index 5dd0926d20..3cc41773c3 100644
---- a/libatomic/configure.tgt
-+++ b/libatomic/configure.tgt
-@@ -82,15 +82,6 @@ case "${target_cpu}" in
- 	;;
- 
-   i[3456]86)
--	case " ${CC} ${CFLAGS} " in
--	  *" -m64 "*|*" -mx32 "*)
--	    ;;
--	  *)
--	    if test -z "$with_arch"; then
--	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
--	      XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
--	    fi
--	esac
- 	ARCH=x86
- 	# ??? Detect when -march=i686 is already enabled.
- 	try_ifunc=yes
-diff --git a/libgomp/configure.tgt b/libgomp/configure.tgt
-index 4790a31e39..46c4c958e6 100644
---- a/libgomp/configure.tgt
-+++ b/libgomp/configure.tgt
-@@ -72,14 +72,6 @@ if test x$enable_linux_futex = xyes; then
-     # Note that bare i386 is not included here.  We need cmpxchg.
-     i[456]86-*-linux*)
- 	config_path="linux/x86 linux posix"
--	case " ${CC} ${CFLAGS} " in
--	  *" -m64 "*|*" -mx32 "*)
--	    ;;
--	  *)
--	    if test -z "$with_arch"; then
--	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
--	    fi
--	esac
- 	;;
- 
-     # Similar jiggery-pokery for x86_64 multilibs, except here we
-diff --git a/libitm/configure.tgt b/libitm/configure.tgt
-index 04109160e9..3d78ea609d 100644
---- a/libitm/configure.tgt
-+++ b/libitm/configure.tgt
-@@ -59,15 +59,6 @@ case "${target_cpu}" in
-   arm*)		ARCH=arm ;;
- 
-   i[3456]86)
--	case " ${CC} ${CFLAGS} " in
--	  *" -m64 "*|*" -mx32 "*)
--	    ;;
--	  *)
--	    if test -z "$with_arch"; then
--	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
--	      XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
--	    fi
--	esac
- 	XCFLAGS="${XCFLAGS} -mrtm"
- 	ARCH=x86
- 	;;
diff --git a/meta/recipes-devtools/gcc/gcc/0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch b/meta/recipes-devtools/gcc/gcc/0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
new file mode 100644
index 0000000000..addecb4bd8
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
@@ -0,0 +1,208 @@
+From 2824d2418605e092899117e77bc8ebf332321807 Mon Sep 17 00:00:00 2001
+From: Jakub Jelinek <jakub@redhat.com>
+Date: Fri, 15 Jan 2021 13:12:59 +0100
+Subject: [PATCH] libatomic, libgomp, libitc: Fix bootstrap [PR70454]
+
+The recent changes to error on mixing -march=i386 and -fcf-protection broke
+bootstrap.  This patch changes lib{atomic,gomp,itm} configury, so that it
+only adds -march=i486 to flags if really needed (i.e. when 486 or later isn't
+on by default already).  Similarly, it will not use ifuncs if -mcx16
+(or -march=i686 for 32-bit) is on by default.
+
+2021-01-15  Jakub Jelinek  <jakub@redhat.com>
+
+	PR target/70454
+libatomic/
+	* configure.tgt: For i?86 and x86_64 determine if -march=i486 needs to
+	be added through preprocessor check on
+	__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4.  Determine if try_ifunc is needed
+	based on preprocessor check on __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16
+	or __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8.
+libgomp/
+	* configure.tgt: For i?86 and x86_64 determine if -march=i486 needs to
+	be added through preprocessor check on
+	__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4.
+libitm/
+	* configure.tgt: For i?86 and x86_64 determine if -march=i486 needs to
+	be added through preprocessor check on
+	__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4.
+
+Upstream-Status: Backport [master post 10.x release]
+---
+ libatomic/configure.tgt | 56 +++++++++++++++++++++++------------------
+ libgomp/configure.tgt   | 35 +++++++++++---------------
+ libitm/configure.tgt    | 37 +++++++++++++--------------
+ 3 files changed, 64 insertions(+), 64 deletions(-)
+
+diff --git a/libatomic/configure.tgt b/libatomic/configure.tgt
+index 5dd0926d20..6ea082a29b 100644
+--- a/libatomic/configure.tgt
++++ b/libatomic/configure.tgt
+@@ -81,32 +81,40 @@ case "${target_cpu}" in
+ 	ARCH=sparc
+ 	;;
+ 
+-  i[3456]86)
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m64 "*|*" -mx32 "*)
+-	    ;;
+-	  *)
+-	    if test -z "$with_arch"; then
+-	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
+-	      XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
+-	    fi
+-	esac
+-	ARCH=x86
+-	# ??? Detect when -march=i686 is already enabled.
+-	try_ifunc=yes
+-	;;
+-  x86_64)
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m32 "*)
++  i[3456]86 | x86_64)
++	cat > conftestx.c <<EOF
++#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
++#error need -march=i486
++#endif
++EOF
++	if ${CC} ${CFLAGS} -E conftestx.c > /dev/null 2>&1; then
++	  :
++	else
++	  if test "${target_cpu}" = x86_64; then
+ 	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=generic"
+-	    XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
+-	    ;;
+-	  *)
+-	    ;;
+-	esac
++	  else
++	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
++	  fi
++	  XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
++	fi
++	cat > conftestx.c <<EOF
++#ifdef __x86_64__
++#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16
++#error need -mcx16
++#endif
++#else
++#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8
++#error need -march=i686
++#endif
++#endif
++EOF
++	if ${CC} ${CFLAGS} -E conftestx.c > /dev/null 2>&1; then
++	  try_ifunc=no
++	else
++	  try_ifunc=yes
++	fi
++	rm -f conftestx.c
+ 	ARCH=x86
+-	# ??? Detect when -mcx16 is already enabled.
+-	try_ifunc=yes
+ 	;;
+ 
+   *)			ARCH="${target_cpu}" ;;
+diff --git a/libgomp/configure.tgt b/libgomp/configure.tgt
+index 4790a31e39..761ef2a7db 100644
+--- a/libgomp/configure.tgt
++++ b/libgomp/configure.tgt
+@@ -70,28 +70,23 @@ if test x$enable_linux_futex = xyes; then
+ 	;;
+ 
+     # Note that bare i386 is not included here.  We need cmpxchg.
+-    i[456]86-*-linux*)
++    i[456]86-*-linux* | x86_64-*-linux*)
+ 	config_path="linux/x86 linux posix"
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m64 "*|*" -mx32 "*)
+-	    ;;
+-	  *)
+-	    if test -z "$with_arch"; then
+-	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
+-	    fi
+-	esac
+-	;;
+-
+-    # Similar jiggery-pokery for x86_64 multilibs, except here we
+-    # can't rely on the --with-arch configure option, since that
+-    # applies to the 64-bit side.
+-    x86_64-*-linux*)
+-	config_path="linux/x86 linux posix"
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m32 "*)
++	cat > conftestx.c <<EOF
++#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
++#error need -march=i486
++#endif
++EOF
++	if ${CC} ${CFLAGS} -E conftestx.c > /dev/null 2>&1; then
++	  :
++	else
++	  if test "${target_cpu}" = x86_64; then
+ 	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=generic"
+-	    ;;
+-	esac
++	  else
++	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
++	  fi
++	fi
++	rm -f conftestx.c
+ 	;;
+ 
+     # Note that sparcv7 and sparcv8 is not included here.  We need cas.
+diff --git a/libitm/configure.tgt b/libitm/configure.tgt
+index 04109160e9..ca62bac627 100644
+--- a/libitm/configure.tgt
++++ b/libitm/configure.tgt
+@@ -58,16 +58,23 @@ case "${target_cpu}" in
+ 
+   arm*)		ARCH=arm ;;
+ 
+-  i[3456]86)
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m64 "*|*" -mx32 "*)
+-	    ;;
+-	  *)
+-	    if test -z "$with_arch"; then
+-	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
+-	      XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
+-	    fi
+-	esac
++  i[3456]86 | x86_64)
++	cat > conftestx.c <<EOF
++#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
++#error need -march=i486
++#endif
++EOF
++	if ${CC} ${CFLAGS} -E conftestx.c > /dev/null 2>&1; then
++	  :
++	else
++	  if test "${target_cpu}" = x86_64; then
++	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=generic"
++	  else
++	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
++	  fi
++	  XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
++	fi
++	rm -f conftestx.c
+ 	XCFLAGS="${XCFLAGS} -mrtm"
+ 	ARCH=x86
+ 	;;
+@@ -102,16 +109,6 @@ case "${target_cpu}" in
+ 	ARCH=sparc
+ 	;;
+ 
+-  x86_64)
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m32 "*)
+-	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=generic"
+-	    XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
+-	    ;;
+-	esac
+-	XCFLAGS="${XCFLAGS} -mrtm"
+-	ARCH=x86
+-	;;
+   s390|s390x)
+ 	XCFLAGS="${XCFLAGS} -mzarch -mhtm"
+ 	ARCH=s390
---
2.30.0
