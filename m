Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 11CC6731A3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 17:55:29 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id o11so333435646qge.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 09:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=smqqgTIBKV8t8SD6blqPIWFzwo0wHnp/SS4CfeTGLGE=;
	b=vlmUEGUPZr53gNm/TQ7VzP+i7wXgNeZvxUW2zOtWJ28vydQk43JS/IbILlBn5IZdwz
	FXyqobbWWw6gWQ+pTY7jRuKY+cohPMKNukk5q/HYeCF7FUoOMu60iK3d+TV2Gvyev8i5
	Bo8ENEdifMe0b4eEZO4cRFnZ517Ez9wo2oelbHTBISJF7055sUM8bR5SiWQsAkie4LIO
	zVtMQfDRkKEVtccI3xeKfl6WlYGq8WmwrRu3qyaS9PmGQZ26BZ4ZNarpw8w6kuyKGcjN
	bODhMWVe3s60iAycqt7K2cdGhxGbUY39nOKiAOI2uPcVCQ5ROGZ0HBHvIX4VpPYwrAPE
	uwsQ==
X-Received: by 10.140.226.198 with SMTP id w189mr147705134qhb.83.1452189330399;
	Thu, 07 Jan 2016 09:55:30 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	e92sm42325420qge.2.2016.01.07.09.55.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 09:55:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 17:55:24 +0000
Message-Id: <1452189324-9568-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] uclibc: Upgrade to 1.0.10
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
X-List-Received-Date: Thu, 07 Jan 2016 17:55:30 -0000

Drop upstreamed patches
Seems to fix parallel build race with locales

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |   7 +-
 ...ert-glibc-compat-bump-glibc-minor-version.patch |  28 -----
 ...-Add-implementation-for-copysignl-for-ppc.patch | 125 ---------------------
 ...stdlib-canonicalize_file_name-memory-leak.patch |  95 ----------------
 4 files changed, 2 insertions(+), 253 deletions(-)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Revert-glibc-compat-bump-glibc-minor-version.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0002-Add-implementation-for-copysignl-for-ppc.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index b84912b..a5c4b5e 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -1,15 +1,12 @@
-SRCREV = "d1b81113b43a6d26dec4e0e58a380895d121006e"
+SRCREV = "0ad73077c230093ae004829da44418597f330c6a"
 
-PV = "1.0.9+git${SRCPV}"
+PV = "1.0.10+git${SRCPV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/uclibc-git:"
 
 SRC_URI = "git://uclibc-ng.org/git/uclibc-ng;branch=1.0 \
         file://0001-Disable-lrount_tes-function.patch \
-        file://0001-Revert-glibc-compat-bump-glibc-minor-version.patch \
-        file://0002-Add-implementation-for-copysignl-for-ppc.patch \
         file://0003-Add-argp-implementation.patch \
-        file://libc-stdlib-canonicalize_file_name-memory-leak.patch \
         file://uClibc.machine \
         file://uClibc.distro \
         file://obstack.cfg \
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Revert-glibc-compat-bump-glibc-minor-version.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Revert-glibc-compat-bump-glibc-minor-version.patch
deleted file mode 100644
index 72d0109..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0001-Revert-glibc-compat-bump-glibc-minor-version.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f9f566849ad0785b2fd3fd6c4c5d324f9f822aac Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 13 Dec 2015 17:25:11 +0000
-Subject: [PATCH] Revert "glibc compat: bump glibc minor version"
-
-This reverts commit 4ff3a6c8eb91db71d6dc3d2932b66e848bd20ac3.
----
-Upstream-Status: Inappropriate [ OE-Specific ]
-
- include/features.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/features.h b/include/features.h
-index f6fbbf4..dcf1348 100644
---- a/include/features.h
-+++ b/include/features.h
-@@ -393,7 +393,7 @@ uClibc was built without large file support enabled.
-    these macros to test for features in specific releases.  */
- /* Don't do it, if you want to keep uClibc happy.  */
- #define	__GLIBC__	2
--#define	__GLIBC_MINOR__	10
-+#define	__GLIBC_MINOR__	2
- #endif
- 
- #define __GLIBC_PREREQ(maj, min) \
--- 
-2.6.4
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/0002-Add-implementation-for-copysignl-for-ppc.patch b/meta/recipes-core/uclibc/uclibc-git/0002-Add-implementation-for-copysignl-for-ppc.patch
deleted file mode 100644
index d4275c9..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0002-Add-implementation-for-copysignl-for-ppc.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From 5d362074e5975b150a35bcfa77eab1bfa4e30de7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 16 Aug 2015 20:50:56 -0700
-Subject: [PATCH 2/7] Add implementation for copysignl for ppc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- libc/sysdeps/linux/powerpc/Makefile.arch |  2 +-
- libc/sysdeps/linux/powerpc/copysignl.c   | 89 ++++++++++++++++++++++++++++++++
- 2 files changed, 90 insertions(+), 1 deletion(-)
- create mode 100644 libc/sysdeps/linux/powerpc/copysignl.c
-
-diff --git a/libc/sysdeps/linux/powerpc/Makefile.arch b/libc/sysdeps/linux/powerpc/Makefile.arch
-index 4fbcb11..7c09c87 100644
---- a/libc/sysdeps/linux/powerpc/Makefile.arch
-+++ b/libc/sysdeps/linux/powerpc/Makefile.arch
-@@ -5,7 +5,7 @@
- # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
- #
- 
--CSRC-y := __syscall_error.c ioctl.c
-+CSRC-y := __syscall_error.c ioctl.c copysignl.c
- 
- SSRC-y := \
- 	__longjmp.S setjmp.S bsd-setjmp.S bsd-_setjmp.S brk.S \
-diff --git a/libc/sysdeps/linux/powerpc/copysignl.c b/libc/sysdeps/linux/powerpc/copysignl.c
-new file mode 100644
-index 0000000..000f653
---- /dev/null
-+++ b/libc/sysdeps/linux/powerpc/copysignl.c
-@@ -0,0 +1,89 @@
-+/* s_copysignl.c -- long double version of s_copysign.c.
-+ * Conversion to long double by Ulrich Drepper,
-+ * Cygnus Support, drepper@cygnus.com.
-+ */
-+
-+/*
-+ * ====================================================
-+ * Copyright (C) 1993 by Sun Microsystems, Inc. All rights reserved.
-+ *
-+ * Developed at SunPro, a Sun Microsystems, Inc. business.
-+ * Permission to use, copy, modify, and distribute this
-+ * software is freely granted, provided that this notice
-+ * is preserved.
-+ * ====================================================
-+ */
-+
-+/*
-+ * copysignl(long double x, long double y)
-+ * copysignl(x,y) returns a value with the magnitude of x and
-+ * with the sign bit of y.
-+ */
-+
-+#include <endian.h>
-+#include <stdint.h>
-+
-+#if __FLOAT_WORD_ORDER == BIG_ENDIAN
-+
-+typedef union
-+{
-+  long double value;
-+  struct
-+  {
-+    int sign_exponent:16;
-+    unsigned int empty:16;
-+    uint32_t msw;
-+    uint32_t lsw;
-+  } parts;
-+} ieee_long_double_shape_type;
-+
-+#endif
-+
-+#if __FLOAT_WORD_ORDER == LITTLE_ENDIAN
-+
-+typedef union
-+{
-+  long double value;
-+  struct
-+  {
-+    uint32_t lsw;
-+    uint32_t msw;
-+    int sign_exponent:16;
-+    unsigned int empty:16;
-+  } parts;
-+} ieee_long_double_shape_type;
-+
-+#endif
-+
-+/* Get int from the exponent of a long double.  */
-+
-+#define GET_LDOUBLE_EXP(exp,d)					\
-+do {								\
-+  ieee_long_double_shape_type ge_u;				\
-+  ge_u.value = (d);						\
-+  (exp) = ge_u.parts.sign_exponent;				\
-+} while (0)
-+
-+/* Set exponent of a long double from an int.  */
-+
-+#define SET_LDOUBLE_EXP(d,exp)					\
-+do {								\
-+  ieee_long_double_shape_type se_u;				\
-+  se_u.value = (d);						\
-+  se_u.parts.sign_exponent = (exp);				\
-+  (d) = se_u.value;						\
-+} while (0)
-+
-+long double copysignl(long double x, long double y);
-+libc_hidden_proto(copysignl);
-+
-+long double copysignl(long double x, long double y)
-+{
-+	uint32_t es1,es2;
-+	GET_LDOUBLE_EXP(es1,x);
-+	GET_LDOUBLE_EXP(es2,y);
-+	SET_LDOUBLE_EXP(x,(es1&0x7fff)|(es2&0x8000));
-+        return x;
-+}
-+
-+libc_hidden_def(copysignl);
--- 
-2.1.4
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch b/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch
deleted file mode 100644
index 83d21e2..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From patchwork Wed Oct 21 06:02:30 2015
-Content-Type: text/plain; charset="utf-8"
-MIME-Version: 1.0
-Content-Transfer-Encoding: 7bit
-Subject: libc/stdlib: canonicalize_file_name() memory leak
-From: =?utf-8?q?Wojciech_Nizi=C5=84ski?= <niziak@spox.org>
-X-Patchwork-Id: 533608
-Message-Id: <loom.20151021T080015-833@post.gmane.org>
-To: uclibc@uclibc.org
-Date: Wed, 21 Oct 2015 06:02:30 +0000 (UTC)
-
-System based on Buildroot 2014.11
-    Linux 3.10.88
-    uclibc 0.9.33.2 (also with 1.0.2)
-    systemd 216
-    gcc 4.8.3 (also with 4.9.2)
-
-Bug:
-    After 2 days system is out of memory. PID 1 (systemd) is allocating.
-    over 120MB od RAM..
-    Just after reboot PID 1 is taking only about 600kB.
-
-How to reproduce:
-    With every systemd service reload or restart, heap of PID 1 grows.
-    Try with command:
-    watch -n1 \
-    'systemctl stop systemd-sysctl ; grep heap /proc/1/smaps -A15; free'
-
-Source of bug:
-
-    Uclibc's canonicalize_file_name() is allocating temprary buffer of.
-    4kB (PATH_MAX), and passing it to realpath() as second argument..
-    Function canonicalize... is not checking if realpath() fails and.
-    memory is lost.
-
-    Backtrace:
-    #0  malloc (bytes=4096) at libc/stdlib/malloc-standard/malloc.c:844
-    #1  canonicalize_file_name.
-        (name="/etc/systemd/system/systemd-sysctl.service.d") at.
-        libc/stdlib/canonicalize.c:30
-    #2  path_strv_resolve (...) at src/shared/path-util.c:275
-
-Solution:
-    Do not use temporary buffer like in eglibc.
-    Function realpath() will be responsible for allocation.
-
-From: Wojciech Nizinski <w.nizinski@grinn-global.com>
-Date: Tue, 20 Oct 2015 14:08:09 +0200
-Subject: [PATCH]libc/stdlib: canonicalize_file_name() memory leak
-
-Uclibc's canonicalize_file_name() is allocating temprary buffer of 4kB
-(PATH_MAX), and passing it to realpath() as second argument. Function is
-not checking if realpath() fails and memory is lost.
----
-Upstream-Status: Submitted
-
- libc/stdlib/canonicalize.c | 21 +--------------------
- 1 file changed, 1 insertion(+), 20 deletions(-)
-
-diff --git a/libc/stdlib/canonicalize.c b/libc/stdlib/canonicalize.c
-index 06e710a..da09d58 100644
---- a/libc/stdlib/canonicalize.c
-+++ b/libc/stdlib/canonicalize.c
-@@ -9,30 +9,11 @@
-  */
- 
- #include <stdlib.h>
--#include <limits.h>
- 
- #ifdef __USE_GNU
- 
--#ifndef PATH_MAX
--# ifdef _POSIX_VERSION
--#  define PATH_MAX _POSIX_PATH_MAX
--# else
--#  ifdef MAXPATHLEN
--#   define PATH_MAX MAXPATHLEN
--#  else
--#   define PATH_MAX 1024
--#  endif
--# endif
--#endif
--
- char * canonicalize_file_name (const char *name)
- {
--	char *buf = (char *) malloc(PATH_MAX);
--
--	if(unlikely(buf == NULL))
--		return NULL;
--
--	*buf='\0';
--	return realpath (name, buf);
-+	return realpath (name, NULL);
- }
- #endif
-- 
2.7.0


