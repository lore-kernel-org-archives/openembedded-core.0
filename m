Return-Path: <matthias.schoepfer@googlemail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id CB2497DE74
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 15:59:42 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id f9so2968156wre.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 08:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7WvjtZWJVLtFBOM9EeaXYN/hhZoorwiQdPYHcIQDxAU=;
	b=QM2SmEjP1kw3rnpCcUrYEhWrfgheEJ5OGaYMAv0cHfmf8ZPaJnUq6g3kKbFI1ZVcRg
	C6uHxruc2chaAk1VmwmeFsnmDViAf2flWBG6DGu+PGgotFcKwPIL6swRFa5uBP1YS21i
	igoJhtau6/KXG6g+Ozpm/Lu4TrIcrIpzKf7eVICALOxggIQl/DoHpzGxILOtywAjrBvU
	HFqhjJzPBsvJxmSP1V0VVBXkfRBpi9rlpngdE8HDkNreipHVvAamfHAwS2x0r3aIYxF4
	pQmynam2XPg7N3l8iINLZaRQtILjGMYxyI425lOvBWCQjDhrixxKPiTTcB2cKGENBN1u
	isIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7WvjtZWJVLtFBOM9EeaXYN/hhZoorwiQdPYHcIQDxAU=;
	b=WLwn2vE+5p2P0hNKYoYMv7WdOgSbOXzL8dTKyjG9sIEurJai16hdDeLn3wNO1SH9Na
	Jxm5GnuE1/h2+pljx5DW/1mVK19Bl/mzr8hLISSyD2IUY8BrXlwrlGMoO/FQiiFVBz88
	kKmLHF1higmmGOjnY60noKQnj6nO56MEm76i9I+sZchVpZI+txPOIjQE4mUCAinB+Dsz
	0wemZ1103JmR4QE3BbWzGDvM/Qc3C1TaeuW124LnZXaIoYchqv/wxZjj69FxhlYAz5rb
	BIMd2EJhUusSQsmtmODTpUoGF4d0mwWczHyar9UtxhDclPjOeD3HIswOyL/kOsGr9XQM
	8BJw==
X-Gm-Message-State: APjAAAX12j3+ylwaPwVLr+1L2qMlZU4gRDCX3rotVSoNqx5l4qoOqClK
	OOm++q64OvEynM+0mUL3wfKXAgmv
X-Google-Smtp-Source: APXvYqyz81vbuJDLKWYUEqsu0OIXEIQZrsU8iuJsY9ZI+291bpM/pj8OFTK1SipGzJ0zOyG3urjv8w==
X-Received: by 2002:a5d:4086:: with SMTP id o6mr10267851wrp.185.1559836783233; 
	Thu, 06 Jun 2019 08:59:43 -0700 (PDT)
Received: from sl-hw-u100.kelle.grp ([213.168.66.146])
	by smtp.gmail.com with ESMTPSA id
	o14sm2450626wrp.77.2019.06.06.08.59.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 08:59:42 -0700 (PDT)
From: Matthias Schoepfer <matthias.schoepfer@googlemail.com>
X-Google-Original-From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jun 2019 17:59:33 +0200
Message-Id: <20190606155933.603-1-matthias.schoepfer@ithinx.io>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v2] python3: fix build on softfloat mips
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
X-List-Received-Date: Thu, 06 Jun 2019 15:59:43 -0000
Content-Transfer-Encoding: 8bit

This patch originally only meant to correct the python3 build for mips
with softfloat, as the original test only checked for mips hardfloat.

Replaced custom C Program for triplet detection with autotools triplet
detection.

Upstream-Status: Submitted [https://github.com/python/cpython/pull/13196]

Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
---
 ...-detection-of-mips-architecture-for-.patch | 198 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.3.bb |   1 +
 2 files changed, 199 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch

diff --git a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
new file mode 100644
index 0000000000..8325cecc29
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
@@ -0,0 +1,198 @@
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


