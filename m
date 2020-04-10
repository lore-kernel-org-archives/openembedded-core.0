Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.2925.1586543489098774688
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2020 11:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nlTE55XA;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id b7so1079050pju.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2020 11:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CxskTQuo+70Fu3FfJWup/jPI8CMe+N+8wseW+/Ke464=;
        b=nlTE55XAB5bDJfEIMoet6L3xzUOt8JPxLZjAtqkGqOI4byigwzfuCTBNa7bh0EUbJt
         khtYw1hr68/ewDyu13GMCgBPGV4/W2hNyhATfOo7uyyAajI3tUSG7JziyVFt1RinIght
         l5ZPI57hfAggMLgYKBlUQAfncp8USNId6lGg3XhNHlSMSUH8uBJyR73XrTmMH1WJx9gC
         UmfxR539XikKxIHJo579pSxSumuApkkdV+VQWmSuKGkebq+3N1CQmcN+qJwZgdNCUjcf
         cPSDa2aIUsE7jA2oOf0UBQ3+cdTCv5Qu8YjPSEgSiHOGu3aBGp4Lf0gbQvLTH60ri5TU
         nhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CxskTQuo+70Fu3FfJWup/jPI8CMe+N+8wseW+/Ke464=;
        b=c8pBUcL6aFjzjtm54U82MlMxKoKerdo7rk/sol//qvkT7Auv1xC/6r1bs11F84H1EK
         hZ3gmEsZeAh9OTdyjJg0XW3bO6LvLOeJAS5ksnxaXuxWw+3K3Dc4BWMxDWT6sN8JdPbc
         66PndpGVYiVadUjx7H+NAtMQOvqnfilmHFW2we9EjjYShWREOpKWgNw3soUt5g6w+MIR
         zAD9hPEqC/1eHkEXuqgh/pBCGS/037+2MyoRWtXcz7ejM8x5f3E91xisH5LvZO5ejTBc
         slLFJeEVwUI5JzuHELbQ/o+3wHmP1c2rCQvF/8H4lAY9cCt5YCeuGTiJJDoM+C++RoXE
         U6VA==
X-Gm-Message-State: AGi0PuZ87fNoYUrNPJbMOTAP/jkR+shgveXy1lji3G+6VQ0h9/ygHg9G
	ieOkbagJCls/ZHXAi0MRXhJ4skZFjYk=
X-Google-Smtp-Source: APiQypKZCF/uDPE1NrnU9KX0AmAYOQ6Tird+NnhsVBHRn3TeM4A+boKejB9vJQZ+X1CHWcvSdpmoWw==
X-Received: by 2002:a17:90a:7f01:: with SMTP id k1mr6961350pjl.158.1586543487890;
        Fri, 10 Apr 2020 11:31:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id c12sm2463353pji.19.2020.04.10.11.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 11:31:27 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 1/2] libucontext: Bring in mips/mips64 support
Date: Fri, 10 Apr 2020 11:31:24 -0700
Message-Id: <20200410183125.1026358-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: Updated copyright years [1]

Latest master 0.10.x+ has added support for mips/mips64, which should
help compile ruby on musl for these architectures

Switch SRC_URI to github upstream URI

Check for common arches before checking others in map_kernel_arch

Drop already upstreamed patches

fix build with clang

[1] https://github.com/kaniini/libucontext/commit/d31eaabbaf5f45656c10e4bccd3fe6653a7d3ec1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Delete removed patches, update license checksum
v3: Fix build with clang

 ...move-using-.end-directive-with-clang.patch | 36 ++++++++++++++
 .../0001-Makefile-Add-LIBDIR-variable.patch   | 46 -----------------
 ...move-using-.end-directive-with-clang.patch | 36 ++++++++++++++
 .../0001-pass-LDFLAGS-to-link-step.patch      | 31 ------------
 meta/recipes-core/musl/libucontext_git.bb     | 49 ++++++++++---------
 5 files changed, 97 insertions(+), 101 deletions(-)
 create mode 100644 meta/recipes-core/musl/0001-Remove-using-.end-directive-with-clang.patch
 delete mode 100644 meta/recipes-core/musl/libucontext/0001-Makefile-Add-LIBDIR-variable.patch
 create mode 100644 meta/recipes-core/musl/libucontext/0001-Remove-using-.end-directive-with-clang.patch
 delete mode 100644 meta/recipes-core/musl/libucontext/0001-pass-LDFLAGS-to-link-step.patch

diff --git a/meta/recipes-core/musl/0001-Remove-using-.end-directive-with-clang.patch b/meta/recipes-core/musl/0001-Remove-using-.end-directive-with-clang.patch
new file mode 100644
index 0000000000..be79cb53f1
--- /dev/null
+++ b/meta/recipes-core/musl/0001-Remove-using-.end-directive-with-clang.patch
@@ -0,0 +1,36 @@
+From b6732f68848ecc8ff01054bf7aea70a241c37116 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 10 Apr 2020 11:23:39 -0700
+Subject: [PATCH] Remove using .end directive with clang
+
+Clang does not support this asm directive
+Fixes Issue #19
+
+Upstream-Status: Submitted [https://github.com/kaniini/libucontext/pull/20]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ arch/common/common-defs.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/arch/common/common-defs.h b/arch/common/common-defs.h
+index bf2fb8c..618116b 100644
+--- a/arch/common/common-defs.h
++++ b/arch/common/common-defs.h
+@@ -28,10 +28,13 @@
+ 	ENT(__proc)					\
+ __proc:							\
+ 	SETUP_FRAME(__proc)
+-
++#ifdef __clang__
++#define END(__proc)
++#else
+ #define END(__proc)					\
+ 	.end	__proc;					\
+ 	.size	__proc,.-__proc;
++#endif
+ 
+ #define ALIAS(__alias, __real)				\
+ 	.weak	__alias;				\
+-- 
+2.26.0
+
diff --git a/meta/recipes-core/musl/libucontext/0001-Makefile-Add-LIBDIR-variable.patch b/meta/recipes-core/musl/libucontext/0001-Makefile-Add-LIBDIR-variable.patch
deleted file mode 100644
index 4f91c8f189..0000000000
--- a/meta/recipes-core/musl/libucontext/0001-Makefile-Add-LIBDIR-variable.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 9bc3cedba54708c40c4a853b240c46e69f87de3c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 17 Mar 2020 10:04:40 -0700
-Subject: [PATCH] Makefile: Add LIBDIR variable
-
-This ensures that it can be installed into custom location and also
-
-Upstream-Status: Submitted
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
---- a/Makefile
-+++ b/Makefile
-@@ -1,5 +1,5 @@
- ARCH := $(shell uname -m)
--
-+LIBDIR := /lib
- CFLAGS = -ggdb3 -O2 -Wall -Iarch/${ARCH}
- 
- LIBUCONTEXT_C_SRC = $(wildcard arch/${ARCH}/*.c)
-@@ -10,8 +10,8 @@ LIBUCONTEXT_SOVERSION = 0
- LIBUCONTEXT_NAME = libucontext.so
- LIBUCONTEXT_STATIC_NAME = libucontext.a
- LIBUCONTEXT_SONAME = libucontext.so.${LIBUCONTEXT_SOVERSION}
--LIBUCONTEXT_PATH = /lib/${LIBUCONTEXT_SONAME}
--LIBUCONTEXT_STATIC_PATH = /lib/${LIBUCONTEXT_STATIC_NAME}
-+LIBUCONTEXT_PATH = ${LIBDIR}/${LIBUCONTEXT_SONAME}
-+LIBUCONTEXT_STATIC_PATH = ${LIBDIR}/${LIBUCONTEXT_STATIC_NAME}
- 
- all: ${LIBUCONTEXT_SONAME} ${LIBUCONTEXT_STATIC_NAME}
- 
-@@ -36,9 +36,9 @@ clean:
- 		${LIBUCONTEXT_OBJ} test_libucontext
- 
- install: all
--	install -D -m755 ${LIBUCONTEXT_NAME} ${DESTDIR}/${LIBUCONTEXT_PATH}
--	install -D -m664 ${LIBUCONTEXT_STATIC_NAME} ${DESTDIR}/${LIBUCONTEXT_STATIC_PATH}
--	ln -sf ${LIBUCONTEXT_SONAME} ${DESTDIR}/lib/${LIBUCONTEXT_NAME}
-+	install -D -m755 ${LIBUCONTEXT_NAME} ${DESTDIR}${LIBUCONTEXT_PATH}
-+	install -D -m664 ${LIBUCONTEXT_STATIC_NAME} ${DESTDIR}${LIBUCONTEXT_STATIC_PATH}
-+	ln -sf ${LIBUCONTEXT_SONAME} ${DESTDIR}${LIBDIR}/${LIBUCONTEXT_NAME}
- 
- check: test_libucontext ${LIBUCONTEXT_SONAME}
- 	env LD_LIBRARY_PATH=$(shell pwd) ./test_libucontext
diff --git a/meta/recipes-core/musl/libucontext/0001-Remove-using-.end-directive-with-clang.patch b/meta/recipes-core/musl/libucontext/0001-Remove-using-.end-directive-with-clang.patch
new file mode 100644
index 0000000000..be79cb53f1
--- /dev/null
+++ b/meta/recipes-core/musl/libucontext/0001-Remove-using-.end-directive-with-clang.patch
@@ -0,0 +1,36 @@
+From b6732f68848ecc8ff01054bf7aea70a241c37116 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 10 Apr 2020 11:23:39 -0700
+Subject: [PATCH] Remove using .end directive with clang
+
+Clang does not support this asm directive
+Fixes Issue #19
+
+Upstream-Status: Submitted [https://github.com/kaniini/libucontext/pull/20]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ arch/common/common-defs.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/arch/common/common-defs.h b/arch/common/common-defs.h
+index bf2fb8c..618116b 100644
+--- a/arch/common/common-defs.h
++++ b/arch/common/common-defs.h
+@@ -28,10 +28,13 @@
+ 	ENT(__proc)					\
+ __proc:							\
+ 	SETUP_FRAME(__proc)
+-
++#ifdef __clang__
++#define END(__proc)
++#else
+ #define END(__proc)					\
+ 	.end	__proc;					\
+ 	.size	__proc,.-__proc;
++#endif
+ 
+ #define ALIAS(__alias, __real)				\
+ 	.weak	__alias;				\
+-- 
+2.26.0
+
diff --git a/meta/recipes-core/musl/libucontext/0001-pass-LDFLAGS-to-link-step.patch b/meta/recipes-core/musl/libucontext/0001-pass-LDFLAGS-to-link-step.patch
deleted file mode 100644
index 0ab8caf3e6..0000000000
--- a/meta/recipes-core/musl/libucontext/0001-pass-LDFLAGS-to-link-step.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 12d45d250d08e96e889e38e77273c3ef73e6fc97 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 25 Nov 2019 15:07:35 -0800
-Subject: [PATCH] pass LDFLAGS to link step
-
-This helps to use OE specific linker flags and fixes
-
-do_package_qa: QA Issue: No GNU_HASH in the ELF binary
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 8a605fd..d1c9637 100644
---- a/Makefile
-+++ b/Makefile
-@@ -20,7 +20,7 @@ ${LIBUCONTEXT_STATIC_NAME}: ${LIBUCONTEXT_OBJ}
- 
- ${LIBUCONTEXT_NAME}: ${LIBUCONTEXT_OBJ}
- 	$(CC) -o ${LIBUCONTEXT_NAME} -Wl,-soname,${LIBUCONTEXT_SONAME} \
--		-shared ${LIBUCONTEXT_OBJ}
-+		-shared ${LIBUCONTEXT_OBJ} ${LDFLAGS}
- 
- ${LIBUCONTEXT_SONAME}: ${LIBUCONTEXT_NAME}
- 	ln -sf ${LIBUCONTEXT_NAME} ${LIBUCONTEXT_SONAME}
--- 
-2.24.0
-
diff --git a/meta/recipes-core/musl/libucontext_git.bb b/meta/recipes-core/musl/libucontext_git.bb
index 92cb703b0b..5aeeb62c6c 100644
--- a/meta/recipes-core/musl/libucontext_git.bb
+++ b/meta/recipes-core/musl/libucontext_git.bb
@@ -4,26 +4,26 @@
 SUMMARY = "ucontext implementation featuring glibc-compatible ABI"
 HOMEPAGE = "https://github.com/kaniini/libucontext"
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=864cc1445419406b7093e8e531c9515e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6eed01fa0e673c76f5a5715438f65b1d"
 SECTION = "libs"
 DEPENDS = ""
 
-PV = "0.1.3+${SRCPV}"
-SRCREV = "e6b4d7516dae9b200e94fcfcb9ebc9331389655f"
-SRC_URI = "git://code.foxkit.us/adelie/libucontext.git;protocol=https \
-           file://0001-pass-LDFLAGS-to-link-step.patch \
-           file://0001-Makefile-Add-LIBDIR-variable.patch \
+PV = "0.10+${SRCPV}"
+SRCREV = "272d6821039813818595e9a3b909ce18f33a89ab"
+SRC_URI = "git://github.com/kaniini/libucontext \
+           file://0001-Remove-using-.end-directive-with-clang.patch \
 "
 
 S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST = ".*-musl.*"
 
-valid_archs = "\
-i386 x86 \
-ppc powerpc powerpc64 ppc64  \
-arm aarch64 \
-s390 \
+valid_archs = " \
+    x86 x86_64  \
+    ppc ppc64   \
+    mips mips64 \
+    arm aarch64 \
+    s390x       \
 "
 
 def map_kernel_arch(a, d):
@@ -31,18 +31,19 @@ def map_kernel_arch(a, d):
 
     valid_archs = d.getVar('valid_archs').split()
 
-    if   re.match('(i.86|athlon)$', a):         return 'x86'
-    elif re.match('x86.64$', a):                return 'x86_64'
-    elif re.match('armeb$', a):                 return 'arm'
-    elif re.match('aarch64$', a):               return 'aarch64'
-    elif re.match('aarch64_be$', a):            return 'aarch64'
-    elif re.match('aarch64_ilp32$', a):         return 'aarch64'
-    elif re.match('aarch64_be_ilp32$', a):      return 'aarch64'
-    elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a):      return 'mips'
-    elif re.match('p(pc|owerpc)', a):           return 'ppc'
-    elif re.match('p(pc64|owerpc64)', a):       return 'ppc64'
-    elif re.match('riscv64$', a):               return 'riscv64'
-    elif a in valid_archs:                      return a
+    if a in valid_archs:                            return a
+    elif re.match('(i.86|athlon)$', a):             return 'x86'
+    elif re.match('x86.64$', a):                    return 'x86_64'
+    elif re.match('armeb$', a):                     return 'arm'
+    elif re.match('aarch64$', a):                   return 'aarch64'
+    elif re.match('aarch64_be$', a):                return 'aarch64'
+    elif re.match('aarch64_ilp32$', a):             return 'aarch64'
+    elif re.match('aarch64_be_ilp32$', a):          return 'aarch64'
+    elif re.match('mips(isa|)(32|)(r6|)(el|)$', a): return 'mips'
+    elif re.match('mips(isa|)64(r6|)(el|)$', a):    return 'mips64'
+    elif re.match('p(pc|owerpc)', a):               return 'ppc'
+    elif re.match('p(pc64|owerpc64)', a):           return 'ppc64'
+    elif re.match('riscv64$', a):                   return 'riscv64'
     else:
         if not d.getVar("TARGET_OS").startswith("linux"):
             return a
@@ -50,7 +51,7 @@ def map_kernel_arch(a, d):
 
 export ARCH = "${@map_kernel_arch(d.getVar('TARGET_ARCH'), d)}"
 
-CFLAGS += "-Iarch/${ARCH}"
+CFLAGS += "-Iarch/${ARCH} -Iarch/common"
 
 EXTRA_OEMAKE = "CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}' LIBDIR='${base_libdir}'"
 
-- 
2.26.0

