Return-Path: <matthias.schoepfer@googlemail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 72AEC7DDAA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 16:07:25 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d18so3031760wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 09:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OMPUESp5i2svE7ZerC6JhcBdyALzz2ykJpcB0VzqB9M=;
	b=bd5cH6qZvwdEimifdfCcjtJDMhFt73J+52rpwonWQF3gL0mE22IcUfBWl05xtHwo4Y
	lA8ArroeXiyLGGkuezNPZpFHe5mNrX1d38o8p7XMFJHJRx2k2XqH9KeLwEYTwdIhdizn
	sgBZF606Y8TmKlkGOzx4j6ONxTly7KaJYfhlLKXpZfMusHlvnhtYWzUV3d3SwAWS8Nn5
	8iWO67bdpxDf/NqKmFWxwy8g9Ds827SSFMpILW/ngxvPaaEmv39Ih4fa6a0HhrFXfYGm
	g6frZapVN1UYkWSebaUV2CjLJRYPPX4foYjJRmRvcbzhi5If+DX6wUvPYTYtCH/RL+fd
	dTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OMPUESp5i2svE7ZerC6JhcBdyALzz2ykJpcB0VzqB9M=;
	b=kZzwyhcDEUZJ9veOJ0hJRxEvFzusTRQKvb+kBMASkVjcSyn1C32GbyPzm+eNYXs6mF
	dWqhYnG2+Lf3F50HhZTjtABMdSIMFU/QuWNsAP+B1cRr+fQkBAtKsGXb8bAq+DsrVxTD
	nX3qCdStJOyqm8znl/zVjTVqHoPrrh0Fd4bNn4kwlYTihTkqgRQBP2NzTuxV0ZXUVnbl
	X9uoTzE3kANcZeEvzf1YIkX0m5Wk3dx9uO1uzEnb/J9pOEoZjVOERhM4nKVnB158ycrK
	xyAL/AQ3/Z2k7BLOxQHRZtLuJPSzv1Yk70jAuUKwNkncPOmQfYGDZwTaLtWCFYI2ZQ1E
	JTDg==
X-Gm-Message-State: APjAAAXnCMW/KGqP2NdPz5xIn5NdkUTfPtC94STwjTGhULNw6d4bHFHF
	KOMzn2HPqBYq40MA0aNV7xgBXJGU
X-Google-Smtp-Source: APXvYqy6qf/OOZj5x1LoHEXHDswvKW3TKmQ3RnTtzsI/rbXduC+p4gH7Ig596Fzx7ngYWHbzeOWpaw==
X-Received: by 2002:a5d:4d84:: with SMTP id b4mr4174879wru.102.1559837245863; 
	Thu, 06 Jun 2019 09:07:25 -0700 (PDT)
Received: from sl-hw-u100.kelle.grp ([213.168.66.146])
	by smtp.gmail.com with ESMTPSA id
	135sm2481119wmb.28.2019.06.06.09.07.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 09:07:25 -0700 (PDT)
From: Matthias Schoepfer <matthias.schoepfer@googlemail.com>
X-Google-Original-From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jun 2019 18:07:18 +0200
Message-Id: <20190606160718.3433-1-matthias.schoepfer@ithinx.io>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v3] python3: fix build on softfloat mips
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
X-List-Received-Date: Thu, 06 Jun 2019 16:07:25 -0000
Content-Transfer-Encoding: 8bit

This patch originally only meant to correct the python3 build for mips
with softfloat, as the original test only checked for mips hardfloat.

Replaced custom C Program for triplet detection with autotools triplet
detection.

Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
---
 ...-detection-of-mips-architecture-for-.patch | 201 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.3.bb |   1 +
 2 files changed, 202 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch

diff --git a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
new file mode 100644
index 0000000000..b4586a7373
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
+
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
diff --git a/meta/recipes-devtools/python/python3_3.7.3.bb b/meta/recipes-devtools/python/python3_3.7.3.bb
index 413d35ae10..832ef1b3c3 100644
--- a/meta/recipes-devtools/python/python3_3.7.3.bb
+++ b/meta/recipes-devtools/python/python3_3.7.3.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
            file://0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch \
+	   file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.21.0


