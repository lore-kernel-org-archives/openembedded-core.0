Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 63B6065CBF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2016 04:50:50 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id ez1so6184040pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 21:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VcfiH9y2Td7P9c9rsXaKqF0gisliFR2IjWz0yfBpNeY=;
	b=l8MEuFZKuMTDtFPjefHS0nNwcKn0rFCsU1OJpEHYcowF7fMGVFERAQ0maz96pSPlus
	eAhPNsJviors4b0Xs3ZehKA7jjseYW7tHlsuw4319oWhGoenELfJFQptWz+paHXC/+hB
	pJzh3WR3636PzsUeijiwUDZ4vsOrhuCE6/8hC3neIdzmCgOiAMXm1pv4X2yJmbV1hH8L
	ScV6fAj1M2Gg/+IxS1ZfhvQcMDQlIGDMytaUqmBw073oKBBhE0At2nnhDj72Zs4zVsyi
	qTpPC6Xd/8QyyK3FGkPFw27I9xzHcIafx9/Natb/zbIdTQHRFaSJYQTbHQ6r6pFs8TKl
	OWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VcfiH9y2Td7P9c9rsXaKqF0gisliFR2IjWz0yfBpNeY=;
	b=dCnZrnvmjnAycJIrbxVo+21kTYqj9F5C9OPRmppnIE/fWik0yU0ZzJ46cjM57PnopD
	tHomnD7kn72FJG4Y9MumyLAxR9MEJEyUKkUvUi+X+25WAtKX/FMhhZk1bPHm708Dlcih
	sRzMwonIxM3qvu+jAZwB+vzfbvpJLSj436djxObQRd/FrLynSjdAXzGjiefVP/I86wB+
	jci1YiNw1ASUnxNfmXl2QG9tt0gH+TGCOmWJZQDew4Bdj8StkUelWiLlUllwSfNygLjC
	0ocQKo4wLDP17y7B7JL9OtDsbWWbQsMnHcvP4bKpB3u+d7r8OiwuyWP+tM9jDvNF1nIQ
	mRqg==
X-Gm-Message-State: AEkoouvK2KZGldDP5qlWISi9HTsYrwTtUatMeAh9p/duc/ojagyQ0mc0YVHvvHkknE96aw==
X-Received: by 10.66.191.66 with SMTP id gw2mr34234468pac.153.1469854251388;
	Fri, 29 Jul 2016 21:50:51 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id o8sm28718622pav.5.2016.07.29.21.50.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jul 2016 21:50:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2016 21:50:46 -0700
Message-Id: <20160730045046.6664-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH] mesa: Fix build when cross compiling with clang
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
X-List-Received-Date: Sat, 30 Jul 2016 04:50:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mesa/files/clang-compile-PR89599.patch         | 116 +++++++++++++++++++++
 .../mesa/files/disable-asm-on-non-gcc.patch        |  29 ++++++
 meta/recipes-graphics/mesa/mesa_12.0.1.bb          |   2 +
 3 files changed, 147 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/clang-compile-PR89599.patch
 create mode 100644 meta/recipes-graphics/mesa/files/disable-asm-on-non-gcc.patch

diff --git a/meta/recipes-graphics/mesa/files/clang-compile-PR89599.patch b/meta/recipes-graphics/mesa/files/clang-compile-PR89599.patch
new file mode 100644
index 0000000..48bd325
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/clang-compile-PR89599.patch
@@ -0,0 +1,116 @@
+From 5ec140c17b54c25920091501b665b9aa809cc5e8 Mon Sep 17 00:00:00 2001
+From: Matt Turner <mattst88@gmail.com>
+Date: Mon, 11 Jul 2016 10:44:25 -0700
+Subject: mapi: Massage code to allow clang to compile.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+According to https://llvm.org/bugs/show_bug.cgi?id=19778#c3 this code
+was violating the spec, resulting in it failing to compile.
+
+Cc: mesa-stable@lists.freedesktop.org
+Co-authored-by: Tomasz Paweł Gajc <tpgxyz@gmail.com>
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=89599
+Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+diff --git a/configure.ac b/configure.ac
+index 3799d8d..1ca8359 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -226,6 +226,7 @@ AX_GCC_FUNC_ATTRIBUTE([packed])
+ AX_GCC_FUNC_ATTRIBUTE([pure])
+ AX_GCC_FUNC_ATTRIBUTE([returns_nonnull])
+ AX_GCC_FUNC_ATTRIBUTE([unused])
++AX_GCC_FUNC_ATTRIBUTE([visibility])
+ AX_GCC_FUNC_ATTRIBUTE([warn_unused_result])
+ AX_GCC_FUNC_ATTRIBUTE([weak])
+ 
+diff --git a/src/mapi/entry_x86-64_tls.h b/src/mapi/entry_x86-64_tls.h
+index 38faccc..c5262a1 100644
+--- a/src/mapi/entry_x86-64_tls.h
++++ b/src/mapi/entry_x86-64_tls.h
+@@ -25,6 +25,11 @@
+  *    Chia-I Wu <olv@lunarg.com>
+  */
+ 
++#ifdef HAVE_FUNC_ATTRIBUTE_VISIBIITY
++#define HIDDEN __attribute__((visibility("hidden")))
++#else
++#define HIDDEN
++#endif
+ 
+ __asm__(".text\n"
+         ".balign 32\n"
+@@ -54,8 +59,8 @@ entry_patch_public(void)
+ {
+ }
+ 
+-static char
+-x86_64_entry_start[];
++extern char
++x86_64_entry_start[] HIDDEN;
+ 
+ mapi_func
+ entry_get_public(int slot)
+diff --git a/src/mapi/entry_x86_tls.h b/src/mapi/entry_x86_tls.h
+index 46d2ece..231b409 100644
+--- a/src/mapi/entry_x86_tls.h
++++ b/src/mapi/entry_x86_tls.h
+@@ -27,6 +27,12 @@
+ 
+ #include <string.h>
+ 
++#ifdef HAVE_FUNC_ATTRIBUTE_VISIBIITY
++#define HIDDEN __attribute__((visibility("hidden")))
++#else
++#define HIDDEN
++#endif
++
+ __asm__(".text");
+ 
+ __asm__("x86_current_tls:\n\t"
+@@ -71,8 +77,8 @@ __asm__(".text");
+ extern unsigned long
+ x86_current_tls();
+ 
+-static char x86_entry_start[];
+-static char x86_entry_end[];
++extern char x86_entry_start[] HIDDEN;
++extern char x86_entry_end[] HIDDEN;
+ 
+ void
+ entry_patch_public(void)
+diff --git a/src/mapi/entry_x86_tsd.h b/src/mapi/entry_x86_tsd.h
+index ea7bacb..03d9735 100644
+--- a/src/mapi/entry_x86_tsd.h
++++ b/src/mapi/entry_x86_tsd.h
+@@ -25,6 +25,11 @@
+  *    Chia-I Wu <olv@lunarg.com>
+  */
+ 
++#ifdef HAVE_FUNC_ATTRIBUTE_VISIBIITY
++#define HIDDEN __attribute__((visibility("hidden")))
++#else
++#define HIDDEN
++#endif
+ 
+ #define X86_ENTRY_SIZE 32
+ 
+@@ -58,8 +63,8 @@ __asm__(".balign 32\n"
+ #include <string.h>
+ #include "u_execmem.h"
+ 
+-static const char x86_entry_start[];
+-static const char x86_entry_end[];
++extern const char x86_entry_start[] HIDDEN;
++extern const char x86_entry_end[] HIDDEN;
+ 
+ void
+ entry_patch_public(void)
+-- 
+cgit v0.10.2
+
diff --git a/meta/recipes-graphics/mesa/files/disable-asm-on-non-gcc.patch b/meta/recipes-graphics/mesa/files/disable-asm-on-non-gcc.patch
new file mode 100644
index 0000000..d2d6755
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/disable-asm-on-non-gcc.patch
@@ -0,0 +1,29 @@
+Configure checks for compiler to be gcc and then it enables asm_offsets
+generation. see
+
+https://cgit.freedesktop.org/mesa/mesa/commit/?id=73c9b4b0e05fc66629ba250846948dc55c0e7a0d
+
+However, we missed the check when enabling this on cross compilation
+when architecture for both host and target is x86
+
+Fixes errors like
+./gen_matypes > matypes.h
+/bin/bash: ./gen_matypes: No such file or directory
+
+-Khem
+
+Upstream-Status: Submitted
+
+Index: mesa-12.0.1/configure.ac
+===================================================================
+--- mesa-12.0.1.orig/configure.ac
++++ mesa-12.0.1/configure.ac
+@@ -732,7 +732,7 @@ test "x$enable_asm" = xno && AC_MSG_RESU
+ if test "x$enable_asm" = xyes -a "x$cross_compiling" = xyes; then
+     case "$host_cpu" in
+     i?86 | x86_64 | amd64)
+-        if test "x$host_cpu" != "x$target_cpu"; then
++        if test "x$host_cpu" != "x$target_cpu" -o "x$acv_mesa_CLANG" = xyes; then
+             enable_asm=no
+             AC_MSG_RESULT([no, cross compiling])
+         fi
diff --git a/meta/recipes-graphics/mesa/mesa_12.0.1.bb b/meta/recipes-graphics/mesa/mesa_12.0.1.bb
index ad872b3..80189e3 100644
--- a/meta/recipes-graphics/mesa/mesa_12.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_12.0.1.bb
@@ -2,6 +2,8 @@ require ${BPN}.inc
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz \
            file://replace_glibc_check_with_linux.patch \
+           file://clang-compile-PR89599.patch \
+           file://disable-asm-on-non-gcc.patch \
 "
 
 SRC_URI[md5sum] = "972fd5ad5a63aeabf173fb9adefc6522"
-- 
2.9.0


