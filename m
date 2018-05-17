Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8BAA1747F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 01:03:59 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id v63-v6so1204706pfk.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 18:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=N58rmHb+DXlg67FCFrHCtfbyJuiuyM5QQB/xH4pKcxs=;
	b=nAnDG5caXLyFVV7dPDo3lWvulPM5ukQiWd+zl+0OK6Yyr31mTT4izekKvhmlHeGzdl
	Xw8ZrcsMw6O/TOFRm3bsIkQED40inkx6qwiC1L1vdeAFugeY8Z8WOcku3OUXsj0o+68n
	WJap1YX7gmerExw5unjlDRhiC/H1j7jidPFnomrS5eDTpWIZVJeJkiPU+ZjLTmnxkTnT
	uo2jAzQpVf2vSgFdIdXseWTkwNGWNlH5GNS2vHFNRNIIoMpnLxufg8LijNYBsDhn5jBU
	9uY2teTU65L3oaUjNF4iMMaXgQnGyN1IoBbgp70u/y1SRhcHK0wI9pxaw8Ax/397lJep
	RfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N58rmHb+DXlg67FCFrHCtfbyJuiuyM5QQB/xH4pKcxs=;
	b=PkLYvilk38XFcDqKIuT0bxv+P9aPRfoAcvxi/RY706wA1GGxATWVxNIlyGmSA/mhNp
	WRo+M/ez4854wXxs68b1Gq/fGH0fo8e5tmtZ7umHxyhyzhuKK190xrX4X6EEH3fSwv7p
	U8WTdv3GnpRjDsCgSrBbec/vrIj/hJSLtoi0O83czhYRRZxD2kUaoWsdFUg92j3vcHww
	1bj5BQ8FZia+zvO46YsBGbMCXx4fOKV8s5A9IO+uf6PbFTKZjWtzZIpGHTUTYdO69BAp
	CyhBdKoo+Qq0uJMkOv2xcOfpHLuupGYGpaRwJYyzQ2c1Gemo/SNbwKpAqUvdHc/TjvnW
	gE7A==
X-Gm-Message-State: ALKqPwcssSGj/kVNEs/6XNUCVyGPaoIexOdEov1M2EX2kZ9Ee+klWbFE
	v4WopcXuN28GrcoWeNlzazO1Rw==
X-Google-Smtp-Source: AB8JxZoZ1woUG7TvVl9YnMfX3F25ki7ijRZY2bW78tYtWm+TNTqnQZDmxJx7vp/ZXZsv0CE9EyPEsA==
X-Received: by 2002:a63:6e8e:: with SMTP id
	j136-v6mr2512816pgc.450.1526519039970; 
	Wed, 16 May 2018 18:03:59 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	u86-v6sm7844616pfg.71.2018.05.16.18.03.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 May 2018 18:03:59 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 May 2018 18:03:53 -0700
Message-Id: <1526519033-26577-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] strace: fix ARM Thumb build with frame pointers enabled
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
X-List-Received-Date: Thu, 17 May 2018 01:03:59 -0000

Replace the previous (incomplete) workaround with better solution
backported from upstream.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...aw_syscall.h-avoid-r7-specified-register-.patch | 74 ++++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.22.bb        | 16 ++---
 2 files changed, 81 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-linux-arm-raw_syscall.h-avoid-r7-specified-register-.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-linux-arm-raw_syscall.h-avoid-r7-specified-register-.patch b/meta/recipes-devtools/strace/strace/0001-linux-arm-raw_syscall.h-avoid-r7-specified-register-.patch
new file mode 100644
index 0000000..8584291
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-linux-arm-raw_syscall.h-avoid-r7-specified-register-.patch
@@ -0,0 +1,74 @@
+From 0c75ebaad09d6d3f2395dfe6160904af883dd0d9 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Tue, 15 May 2018 15:34:39 -0700
+Subject: [PATCH] linux/arm/raw_syscall.h: avoid r7 specified register
+ variables with Thumb
+
+If Thumb code is being generated and frame pointers are enabled, the
+Thumb frame pointer in r7 clashes with any local variable which may
+need to be assigned to r7 (e.g. the syscall NR when making a raw
+syscall).
+
+With gcc, the double use of r7 results in a build error, e.g.
+
+  strace-4.22/tests/inject-nf.c:86:1: error: r7 cannot be used in asm here
+
+With clang, the double use of r7 can result in the compiler silently
+generating broken code which crashes at run time due to frame pointer
+corruption:
+
+  https://bugs.llvm.org/show_bug.cgi?id=34165
+
+In most cases the problem isn't visible as frame pointers will be
+disabled automatically due to optimisation level. However to handle
+cases where frame pointers are enabled (e.g. when CFLAGS etc are set
+to support a debug build, etc) provide a version of raw_syscall_0
+which manually saves and restores the frame pointer value in r7
+to a temporary register before setting up the syscall NR in r7
+and invoking the syscall.
+
+* linux/arm/raw_syscall.h (raw_syscall_0) [__thumb__]: Provide
+an alternative version.
+
+Upstream-Status: Backport
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ linux/arm/raw_syscall.h | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/linux/arm/raw_syscall.h b/linux/arm/raw_syscall.h
+index 69c7e23..ec534ec 100644
+--- a/linux/arm/raw_syscall.h
++++ b/linux/arm/raw_syscall.h
+@@ -36,12 +36,27 @@ static inline kernel_ulong_t
+ raw_syscall_0(const kernel_ulong_t nr, kernel_ulong_t *err)
+ {
+ 	*err = 0;
++
++#ifdef __thumb__ /* && FRAME_POINTERS_ENABLED */
++
++	register kernel_ulong_t rt;
++	register kernel_ulong_t r0 __asm__("r0");
++	__asm__ __volatile__("mov %1,r7; mov r7,%2; swi 0x0; mov r7,%1"
++			     : "=r"(r0), "=&r"(rt)
++			     : "r"(nr)
++			     : "memory");
++
++#else
++
+ 	register kernel_ulong_t r7 __asm__("r7") = nr;
+ 	register kernel_ulong_t r0 __asm__("r0");
+ 	__asm__ __volatile__("swi 0x0"
+ 			     : "=r"(r0)
+ 			     : "r"(r7)
+ 			     : "memory");
++
++#endif
++
+ 	return r0;
+ }
+ # define raw_syscall_0 raw_syscall_0
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/strace/strace_4.22.bb b/meta/recipes-devtools/strace/strace_4.22.bb
index 947b3f7..99691f8 100644
--- a/meta/recipes-devtools/strace/strace_4.22.bb
+++ b/meta/recipes-devtools/strace/strace_4.22.bb
@@ -14,21 +14,13 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://mips-SIGEMT.patch \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
+           file://0001-linux-arm-raw_syscall.h-avoid-r7-specified-register-.patch \
            "
 SRC_URI[md5sum] = "7a2a7d7715da6e6834bc65bd09bace1c"
 SRC_URI[sha256sum] = "068cd09264c95e4d591bbcd3ea08f99a693ed8663cd5169b0fdad72eb5bdb39d"
 
 inherit autotools ptest bluetooth
 
-EXTRA_OECONF += "--enable-mpers=no"
-
-CFLAGS_append_libc-musl = " -Dsigcontext_struct=sigcontext"
-# otherwise strace-4.22/tests/inject-nf.c fails to build as discussed here:
-# http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150647.html
-DEBUG_OPTIMIZATION_remove = "${@bb.utils.contains('PTEST_ENABLED', '1', '-fno-omit-frame-pointer', '', d)}"
-
-RDEPENDS_${PN}-ptest += "make coreutils grep gawk sed"
-
 PACKAGECONFIG_class-target ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
 "
@@ -36,6 +28,10 @@ PACKAGECONFIG_class-target ??= "\
 PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,${BLUEZ}"
 PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
 
+EXTRA_OECONF += "--enable-mpers=no"
+
+CFLAGS_append_libc-musl = " -Dsigcontext_struct=sigcontext"
+
 TESTDIR = "tests"
 
 do_install_append() {
@@ -61,5 +57,7 @@ do_install_ptest() {
 	${D}/${PTEST_PATH}/${TESTDIR}/Makefile
 }
 
+RDEPENDS_${PN}-ptest += "make coreutils grep gawk sed"
+
 BBCLASSEXTEND = "native"
 TOOLCHAIN = "gcc"
-- 
1.9.1


