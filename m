Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.1397.1611246150445140456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Dj1Y+oodZeVpgM1O2Ap9Pgv5ZdBBfY0hnMIvcTzz8f6msSd8iVyafKB4XFxXCj6cIWZ+vi2mmr
 ULZnx6EcN3zg==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166392456"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="166392456"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:29 -0800
IronPort-SDR: KCTnAnuZOfE+VJua2pJQdSilTk7QxD31CUkdGEiUSsmCJLLFK+KungoYpMf0WlyTZ2R9QybfJB
 6tGMTK7xeWlA==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413671"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:28 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 10/20] gcc: Backport patch to resolve i*86 tune configuration overrides
Date: Fri, 22 Jan 2021 00:21:55 +0800
Message-Id: <ef87c3609ecf93158685f4d4cdc53754a6102330.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nathan Rossi <nathan@nathanrossi.com>

Upstream has merged a change to handle detection of target overrides so
that they are only applied as required. Backport this patch from
upstream and remove the OE specific patch.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d430f425e1a5725e93833a652e5c6988576f7347)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/gcc/gcc-10.2.inc        |   2 +-
 ...0001-lib-Remove-i-86-march-overrides.patch | 113 ----------
 ...libgomp-libitc-Fix-bootstrap-PR70454.patch | 208 ++++++++++++++++++
 3 files changed, 209 insertions(+), 114 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch

diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools/gcc/gcc-10.2.inc
index 87dc988d70..82f180db77 100644
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
-- 
2.29.2

