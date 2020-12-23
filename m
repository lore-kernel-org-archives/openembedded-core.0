Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.10343.1608736768391429647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: B4q+TbXLx8KIJcbKBl1k0wIXvE6cKZeYgodfogR93Mhyp14vit6Z/sGndmGSZiEJaQoDq3PI11
 BQChDDisQYJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236134"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236134"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:35 -0800
IronPort-SDR: fsMDPPJyBv+XAeUm5KRBVK2AkOyy3eKZLG4UTyBIoX6kjpaix6bgOGff8MtzweoP+ZeYezk7M/
 afmY1vloRpmg==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027721"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:34 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 30/35] gcc: Add patch to resolve i*86 tune configuration overrides
Date: Wed, 23 Dec 2020 23:18:40 +0800
Message-Id: <5235a7cd67b43a53035bfc06cb24639d6653fce4.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nathan Rossi <nathan@nathanrossi.com>

When compiling gcc-runtime for i686 libatomic, libgomp and libitm are
compiled with additional '-march' and '-mtune' overrides. This typically
does not cause build errors (e.g. core2-32 tune), and results in less
optimally tuned outputs. However with specific TUNE_CCARGS (e.g. has
'-mfpmath=sse' but not '-msse*'), the build errors with conflicting
'-mfpmath' options.

This is caused by gcc-runtime specific configure scripts and Makefile
options that override by adding additional '-march'/'-mtune' args. OE
builds gcc-runtime differently to other build systems, and provides
target specific arch/tune options directly. As such, this change adds a
patch for gcc to remove the specific cases where the args are added.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d39b686cc5fcc89405ffeb560ea64b5d305b0608)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/gcc/gcc-10.2.inc        |   1 +
 ...0001-lib-Remove-i-86-march-overrides.patch | 113 ++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch

diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools/gcc/gcc-10.2.inc
index 7625af5110..87dc988d70 100644
--- a/meta/recipes-devtools/gcc/gcc-10.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
@@ -69,6 +69,7 @@ SRC_URI = "\
            file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch \
            file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch \
            file://0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch \
+           file://0001-lib-Remove-i-86-march-overrides.patch \
 "
 SRC_URI[sha256sum] = "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch b/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
new file mode 100644
index 0000000000..3f04e121ba
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-lib-Remove-i-86-march-overrides.patch
@@ -0,0 +1,113 @@
+From 3776789cde95916f95deef48acf9532b0ebf91ae Mon Sep 17 00:00:00 2001
+From: Nathan Rossi <nathan@nathanrossi.com>
+Date: Tue, 15 Dec 2020 11:43:36 +1000
+Subject: [PATCH] lib*: Remove i*86 march overrides
+
+OE does not pass the '--with-arch' option to gccs configure, as such
+some gcc-runtime libraries try to override the value of '-march' and
+'-mtune' which OE already provides. This causes conflicts with other
+i*86 instruction/architecture flags (e.g. -msse* and -mfpmath=*).
+Additionally this caused the following libraries to be built with less
+optimized tune configurations.
+
+Upstream suggests that this should be detecting or otherwise checking if
+the target supports the desired functionality before overriding.
+
+    https://gcc.gnu.org/legacy-ml/gcc-patches/2016-04/msg01344.html
+
+libatomic also overrides the '-march' specifically for IFUNC objects.
+OE already supplies the correct march flag, so remove setting.
+
+Upstream-Status: Inappropriate [OE Specific]
+Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
+---
+ libatomic/Makefile.am   | 1 -
+ libatomic/Makefile.in   | 1 -
+ libatomic/configure.tgt | 9 ---------
+ libgomp/configure.tgt   | 8 --------
+ libitm/configure.tgt    | 9 ---------
+ 5 files changed, 28 deletions(-)
+
+diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
+index ac1ca64587..5aa16e0699 100644
+--- a/libatomic/Makefile.am
++++ b/libatomic/Makefile.am
+@@ -133,7 +133,6 @@ libatomic_la_LIBADD += $(foreach s,$(SIZES),$(addsuffix _$(s)_1_.lo,$(SIZEOBJS))
+ libatomic_la_LIBADD += $(addsuffix _8_2_.lo,$(SIZEOBJS))
+ endif
+ if ARCH_I386
+-IFUNC_OPTIONS	     = -march=i586
+ libatomic_la_LIBADD += $(addsuffix _8_1_.lo,$(SIZEOBJS))
+ endif
+ if ARCH_X86_64
+diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
+index 97df2d7ff0..82c511d420 100644
+--- a/libatomic/Makefile.in
++++ b/libatomic/Makefile.in
+@@ -432,7 +432,6 @@ libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix \
+ 	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
+ 	$(am__append_3) $(am__append_4)
+ @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv7-a+fp -DHAVE_KERNEL64
+-@ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=i586
+ @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16
+ libatomic_convenience_la_SOURCES = $(libatomic_la_SOURCES)
+ libatomic_convenience_la_LIBADD = $(libatomic_la_LIBADD)
+diff --git a/libatomic/configure.tgt b/libatomic/configure.tgt
+index 5dd0926d20..3cc41773c3 100644
+--- a/libatomic/configure.tgt
++++ b/libatomic/configure.tgt
+@@ -82,15 +82,6 @@ case "${target_cpu}" in
+ 	;;
+ 
+   i[3456]86)
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m64 "*|*" -mx32 "*)
+-	    ;;
+-	  *)
+-	    if test -z "$with_arch"; then
+-	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
+-	      XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
+-	    fi
+-	esac
+ 	ARCH=x86
+ 	# ??? Detect when -march=i686 is already enabled.
+ 	try_ifunc=yes
+diff --git a/libgomp/configure.tgt b/libgomp/configure.tgt
+index 4790a31e39..46c4c958e6 100644
+--- a/libgomp/configure.tgt
++++ b/libgomp/configure.tgt
+@@ -72,14 +72,6 @@ if test x$enable_linux_futex = xyes; then
+     # Note that bare i386 is not included here.  We need cmpxchg.
+     i[456]86-*-linux*)
+ 	config_path="linux/x86 linux posix"
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m64 "*|*" -mx32 "*)
+-	    ;;
+-	  *)
+-	    if test -z "$with_arch"; then
+-	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
+-	    fi
+-	esac
+ 	;;
+ 
+     # Similar jiggery-pokery for x86_64 multilibs, except here we
+diff --git a/libitm/configure.tgt b/libitm/configure.tgt
+index 04109160e9..3d78ea609d 100644
+--- a/libitm/configure.tgt
++++ b/libitm/configure.tgt
+@@ -59,15 +59,6 @@ case "${target_cpu}" in
+   arm*)		ARCH=arm ;;
+ 
+   i[3456]86)
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m64 "*|*" -mx32 "*)
+-	    ;;
+-	  *)
+-	    if test -z "$with_arch"; then
+-	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
+-	      XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
+-	    fi
+-	esac
+ 	XCFLAGS="${XCFLAGS} -mrtm"
+ 	ARCH=x86
+ 	;;
-- 
2.29.2

