Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id A1CF47F4FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:19:59 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id p26so1866637pfq.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=C8Lx62+xwtUfDz+agDoXt0g9DJvTuFw9j4NFM6hC5Ho=;
	b=ivsorc3pEU84fDYG2gM2HRAAucnlvmwDgGmBM7lUjmBvps38f6SfsFYDC1YqNMrPtw
	ZPEwTidlxBxRt3xetzg2XTnjTkDnGhUutLNEiud4NDrWCQddROHT8OwRro/U+PvIyoCb
	XNsaB5PQaevas9kzWvAAawC58AY5ydj8zRBAcsunl7+wWz7GZF+YpIrBF4oR9jqGKLGS
	qLqo93n2P3yFyMJqcPfHduuyuOSFBKsSENL6WmleEOXqA2PAUSb1r5Hhpalq6Kob3RXF
	WBYnRrEpAYwDSxT2sI93xEEdWzX0mQUHIS5grFJntwCUc5KDxfVbtCjMbuqH4GuGzJwo
	5Ksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=C8Lx62+xwtUfDz+agDoXt0g9DJvTuFw9j4NFM6hC5Ho=;
	b=Ui7PouZJzawC5xGQSZxuuxT7XvMHt0SKv65rIujoMFIUFBItCFBfn+abJ/CHuTq7hU
	rJYB+hs7x+bBrQn7coL5XOpKI8fREbQZlJlxOKNW/OFNWN9fx8QXqFMVOEDZbxJYjT5K
	pME5BQioFjczP7WV5nHeaXdFIYs/rD3zzC8J4HPsH8e/+pkoII2wzEHvHywaGbVh7+Hn
	yFrERS9BMrO3ATXa5aje3QFBonPclIdc+KG7dtwzryquat6y2WJgiITclg+ZIElSmEBI
	OMMGvtfAGIinXQSu6Xrw1mbBUKCVQwvdGUtQB8gSp0VDGEz50dVGFJtVchVHamTNx83J
	FPvA==
X-Gm-Message-State: APjAAAXLVY92CsnCocHIN78fcvigJVgW1kOJ4zLSAm5kaApjeeIvNOdM
	RiEURMhy8llkL66MGlCfpHai6yKU
X-Google-Smtp-Source: APXvYqwB26AnUDUCRcP7NzY6o58kJLiqCrGcyi1tBPeYTOeyn3N2jx15XjDGJICbI4GXOpIYHvTt4Q==
X-Received: by 2002:a63:d1a:: with SMTP id c26mr4282983pgl.24.1573658400375;
	Wed, 13 Nov 2019 07:20:00 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.19.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:20:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:17 -0800
Message-Id: <f3326309c7c22a6034917f6eee21908c61f44a2f.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 14/25] python3: fix build on softfloat mips
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Nov 2019 15:19:59 -0000

From: Matthias Schoepfer via Openembedded-core <openembedded-core@lists.openembedded.org>

This patch originally only meant to correct the python3 build for mips
with softfloat, as the original test only checked for mips hardfloat.

Replaced custom C Program for triplet detection with autotools triplet
detection.

Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...roper-detection-of-mips-architecture-for-.patch | 201 +++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.4.bb      |   1 +
 2 files changed, 202 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch

diff --git a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
new file mode 100644
index 0000000..e7af886
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
@@ -0,0 +1,201 @@
+From 7535c39951b9d15dd64c4669092a8582ba555466 Mon Sep 17 00:00:00 2001
+From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
+Date: Fri, 31 May 2019 15:34:34 +0200
+Subject: [PATCH] bpo-36852: proper detection of mips architecture for soft
+ float
+
+When (cross) compiling for softfloat mips, __mips_hard_float will not be
+defined and detection of OS triplet in configure.ac / configure will fail.
+
+This also has to do with the custom detection of the build triplet. Trying
+to do this in a more autoconf/autotools manner.
+
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/13196]
+Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
+---
+ configure.ac | 169 ++++++---------------------------------------------
+ 1 file changed, 17 insertions(+), 152 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a7de901e08..a73e2de51b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -727,158 +727,23 @@ fi
+ MULTIARCH=$($CC --print-multiarch 2>/dev/null)
+ AC_SUBST(MULTIARCH)
+ 
+-AC_MSG_CHECKING([for the platform triplet based on compiler characteristics])
+-cat >> conftest.c <<EOF
+-#undef bfin
+-#undef cris
+-#undef fr30
+-#undef linux
+-#undef hppa
+-#undef hpux
+-#undef i386
+-#undef mips
+-#undef powerpc
+-#undef sparc
+-#undef unix
+-#if defined(__ANDROID__)
+-    # Android is not a multiarch system.
+-#elif defined(__linux__)
+-# if defined(__x86_64__) && defined(__LP64__)
+-        x86_64-linux-gnu
+-# elif defined(__x86_64__) && defined(__ILP32__)
+-        x86_64-linux-gnux32
+-# elif defined(__i386__)
+-        i386-linux-gnu
+-# elif defined(__aarch64__) && defined(__AARCH64EL__)
+-#  if defined(__ILP32__)
+-        aarch64_ilp32-linux-gnu
+-#  else
+-        aarch64-linux-gnu
+-#  endif
+-# elif defined(__aarch64__) && defined(__AARCH64EB__)
+-#  if defined(__ILP32__)
+-        aarch64_be_ilp32-linux-gnu
+-#  else
+-        aarch64_be-linux-gnu
+-#  endif
+-# elif defined(__alpha__)
+-        alpha-linux-gnu
+-# elif defined(__ARM_EABI__) && defined(__ARM_PCS_VFP)
+-#  if defined(__ARMEL__)
+-        arm-linux-gnueabihf
+-#  else
+-        armeb-linux-gnueabihf
+-#  endif
+-# elif defined(__ARM_EABI__) && !defined(__ARM_PCS_VFP)
+-#  if defined(__ARMEL__)
+-        arm-linux-gnueabi
+-#  else
+-        armeb-linux-gnueabi
+-#  endif
+-# elif defined(__hppa__)
+-        hppa-linux-gnu
+-# elif defined(__ia64__)
+-        ia64-linux-gnu
+-# elif defined(__m68k__) && !defined(__mcoldfire__)
+-        m68k-linux-gnu
+-# elif defined(__mips_hard_float) && defined(__mips_isa_rev) && (__mips_isa_rev >=6) && defined(_MIPSEL)
+-#  if _MIPS_SIM == _ABIO32
+-        mipsisa32r6el-linux-gnu
+-#  elif _MIPS_SIM == _ABIN32
+-        mipsisa64r6el-linux-gnuabin32
+-#  elif _MIPS_SIM == _ABI64
+-        mipsisa64r6el-linux-gnuabi64
+-#  else
+-#   error unknown platform triplet
+-#  endif
+-# elif defined(__mips_hard_float) && defined(__mips_isa_rev) && (__mips_isa_rev >=6)
+-#  if _MIPS_SIM == _ABIO32
+-        mipsisa32r6-linux-gnu
+-#  elif _MIPS_SIM == _ABIN32
+-        mipsisa64r6-linux-gnuabin32
+-#  elif _MIPS_SIM == _ABI64
+-        mipsisa64r6-linux-gnuabi64
+-#  else
+-#   error unknown platform triplet
+-#  endif
+-# elif defined(__mips_hard_float) && defined(_MIPSEL)
+-#  if _MIPS_SIM == _ABIO32
+-        mipsel-linux-gnu
+-#  elif _MIPS_SIM == _ABIN32
+-        mips64el-linux-gnuabin32
+-#  elif _MIPS_SIM == _ABI64
+-        mips64el-linux-gnuabi64
+-#  else
+-#   error unknown platform triplet
+-#  endif
+-# elif defined(__mips_hard_float)
+-#  if _MIPS_SIM == _ABIO32
+-        mips-linux-gnu
+-#  elif _MIPS_SIM == _ABIN32
+-        mips64-linux-gnuabin32
+-#  elif _MIPS_SIM == _ABI64
+-        mips64-linux-gnuabi64
+-#  else
+-#   error unknown platform triplet
+-#  endif
+-# elif defined(__or1k__)
+-        or1k-linux-gnu
+-# elif defined(__powerpc__) && defined(__SPE__)
+-        powerpc-linux-gnuspe
+-# elif defined(__powerpc64__)
+-#  if defined(__LITTLE_ENDIAN__)
+-        powerpc64le-linux-gnu
+-#  else
+-        powerpc64-linux-gnu
+-#  endif
+-# elif defined(__powerpc__)
+-        powerpc-linux-gnu
+-# elif defined(__s390x__)
+-        s390x-linux-gnu
+-# elif defined(__s390__)
+-        s390-linux-gnu
+-# elif defined(__sh__) && defined(__LITTLE_ENDIAN__)
+-        sh4-linux-gnu
+-# elif defined(__sparc__) && defined(__arch64__)
+-        sparc64-linux-gnu
+-# elif defined(__sparc__)
+-        sparc-linux-gnu
+-# elif defined(__riscv)
+-#  if __riscv_xlen == 32
+-        riscv32-linux-gnu
+-#  elif __riscv_xlen == 64
+-        riscv64-linux-gnu
+-#  else
+-#   error unknown platform triplet
+-#  endif
+-# else
+-#   error unknown platform triplet
+-# endif
+-#elif defined(__FreeBSD_kernel__)
+-# if defined(__LP64__)
+-        x86_64-kfreebsd-gnu
+-# elif defined(__i386__)
+-        i386-kfreebsd-gnu
+-# else
+-#   error unknown platform triplet
+-# endif
+-#elif defined(__gnu_hurd__)
+-        i386-gnu
+-#elif defined(__APPLE__)
+-        darwin
+-#else
+-# error unknown platform triplet
+-#endif
+-
+-EOF
+-
+-if $CPP $CPPFLAGS conftest.c >conftest.out 2>/dev/null; then
+-  PLATFORM_TRIPLET=`grep -v '^#' conftest.out | grep -v '^ *$' | tr -d ' 	'`
+-  AC_MSG_RESULT([$PLATFORM_TRIPLET])
+-else
+-  AC_MSG_RESULT([none])
+-fi
+-rm -f conftest.c conftest.out
++AC_CANONICAL_TARGET
++## Not using $target to filter out vendor
++## Need to handle macos, vxworks and hurd special (?) :-/
++case ${target_os} in
++     darwin*)
++     	PLATFORM_TRIPLET=darwin
++	;;
++     hurd*)
++     	PLATFORM_TRIPLET=i386-gnu
++	;;
++     vxworks*)
++     	PLATFORM_TRIPLET=vxworks
++	;;
++     *)
++	PLATFORM_TRIPLET=${target_cpu}-${target_os}
++	;;
++esac	
+ 
+ if test x$PLATFORM_TRIPLET != x && test x$MULTIARCH != x; then
+   if test x$PLATFORM_TRIPLET != x$MULTIARCH; then
+-- 
+2.21.0
+
diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
index 13f4f5f..c21fe90 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
            file://0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch \
+	   file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.7.4


