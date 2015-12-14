Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFDA608B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 06:23:19 +0000 (UTC)
Received: by qkdp187 with SMTP id p187so121558435qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Dec 2015 22:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:in-reply-to:references:content-type
	:content-transfer-encoding;
	bh=JgF3RGKNnm8oH+lthVpOePCh3dresYM339doXVuC8os=;
	b=gANMB4l7jGTgAp2oTSRaK3vnyqYJbGFkvPYrdZPspRT2P8OSC7RiyTTjxOqkffBpGr
	fCWB0znpCD4n1cfV8Vk0oNCtGkxEQgJFqDty4rbfTh1JgJhv5NSS6aWxxgD7HIPheTE0
	qmUGkY7rM5NkYfPXsmEQYw5NKK7bwdDx6jku9nQtkGyzoRLm/AVvxSoxjFyYyFy2Clj9
	9WzcaCXV1FkqOSu3k2gkzXwTPT7zjm8Bvlrd9B2AZoC/767OU45wLpCmTEPZ7dPJ0QS3
	jWgOtOAOQLtpIaE+kVZsZIhR2ffKThMrfDm4gYfIIVG6xjkAB3gLdUZ0zj4GwDgjuBpB
	bN/A==
X-Received: by 10.55.80.138 with SMTP id e132mr38008058qkb.74.1450074200514;
	Sun, 13 Dec 2015 22:23:20 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	s105sm13252860qge.40.2015.12.13.22.23.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Dec 2015 22:23:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 06:23:09 +0000
Message-Id: <2ae1ec09a656b0401bdc399ac0b8fb7d488c4106.1450073907.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <a2dd5384b2607cf7e507cf280addd31ee6df2391.1450073907.git.raj.khem@gmail.com>
References: <a2dd5384b2607cf7e507cf280addd31ee6df2391.1450073907.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1450073907.git.raj.khem@gmail.com>
References: <cover.1450073907.git.raj.khem@gmail.com>
Subject: [PATCH 2/6] uclibc: Switch to using uclibc-ng
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
X-List-Received-Date: Mon, 14 Dec 2015 06:23:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

uclibc-ng is a maintained fork of uclibc project. Lets switch to using that
add patches to fix memory leak in canonicalize_file_name-memory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc        |   2 +-
 meta/recipes-core/uclibc/uclibc-config.inc         |   1 +
 meta/recipes-core/uclibc/uclibc-git.inc            |  21 +-
 ...ert-glibc-compat-bump-glibc-minor-version.patch |  26 +++
 ...-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch |  42 ----
 ...zes-away-the-write-only-static-functions-.patch |  51 -----
 .../uclibc/uclibc-git/0001-wire-in-syncfs.patch    |  49 -----
 ...t-localised-optimizations-this-helps-to-h.patch |  30 ---
 .../0005-Always-use-O2-for-compiling-fork.c.patch  |  33 ---
 ...-ldso-limited-support-for-ORIGIN-in-rpath.patch | 233 ---------------------
 ...rk-Hide-pthread_atfork-in-shared-versions.patch |  35 ----
 ...stdlib-canonicalize_file_name-memory-leak.patch |  36 ++++
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |   4 +-
 meta/recipes-core/uclibc/uclibc.inc                |   8 +-
 meta/recipes-core/uclibc/uclibc_git.bb             |   5 +
 15 files changed, 80 insertions(+), 496 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Revert-glibc-compat-bump-glibc-minor-version.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-fcntl-Add-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-gcc5-optimizes-away-the-write-only-static-functions-.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-wire-in-syncfs.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0004-Dont-support-localised-optimizations-this-helps-to-h.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0005-Always-use-O2-for-compiling-fork.c.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0006-ldso-limited-support-for-ORIGIN-in-rpath.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0007-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index f205524..51be202 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.25%"
 GDBVERSION ?= "7.9%"
 GLIBCVERSION ?= "2.22"
-UCLIBCVERSION ?= "0.9.33+git%"
+UCLIBCVERSION ?= "1.0%"
 LINUXLIBCVERSION ?= "4.1"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-core/uclibc/uclibc-config.inc b/meta/recipes-core/uclibc/uclibc-config.inc
index 8b9e41c..ed7b522 100644
--- a/meta/recipes-core/uclibc/uclibc-config.inc
+++ b/meta/recipes-core/uclibc/uclibc-config.inc
@@ -119,6 +119,7 @@ def features_to_uclibc_settings(d):
     uclibc_cfg('thumb-interwork', distro_features,'USE_BX', cnf, rem)
     uclibc_cfg('xattr',     distro_features, 'UCLIBC_HAS_XATTR', cnf, rem)
     uclibc_cfg('ssp',       distro_features, 'UCLIBC_HAS_SSP', cnf, rem)
+    uclibc_cfg('ssp',       distro_features, 'UCLIBC_BUILD_SSP', cnf, rem)
     uclibc_cfg('argp',       distro_features, 'UCLIBC_HAS_ARGP', cnf, rem)
     uclibc_cfg('libc-posix-clang-wchar',  distro_features,'UCLIBC_HAS_WCHAR', cnf, rem)
     return "\n".join(cnf), "\n".join(rem)
diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 716a647..b84912b 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -1,24 +1,19 @@
-SRCREV = "ca1c74d67dd115d059a875150e10b8560a9c35a8"
+SRCREV = "d1b81113b43a6d26dec4e0e58a380895d121006e"
 
-PV = "0.9.33+git${SRCPV}"
+PV = "1.0.9+git${SRCPV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/uclibc-git:"
 
-SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
+SRC_URI = "git://uclibc-ng.org/git/uclibc-ng;branch=1.0 \
+        file://0001-Disable-lrount_tes-function.patch \
+        file://0001-Revert-glibc-compat-bump-glibc-minor-version.patch \
+        file://0002-Add-implementation-for-copysignl-for-ppc.patch \
+        file://0003-Add-argp-implementation.patch \
+        file://libc-stdlib-canonicalize_file_name-memory-leak.patch \
         file://uClibc.machine \
         file://uClibc.distro \
         file://obstack.cfg \
         file://locale.cfg \
-        file://0001-Disable-lrount_tes-function.patch \
-        file://0002-Add-implementation-for-copysignl-for-ppc.patch \
-        file://0003-Add-argp-implementation.patch \
-        file://0004-Dont-support-localised-optimizations-this-helps-to-h.patch \
-        file://0005-Always-use-O2-for-compiling-fork.c.patch \
-        file://0006-ldso-limited-support-for-ORIGIN-in-rpath.patch \
-        file://0007-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch \
-        file://0001-gcc5-optimizes-away-the-write-only-static-functions-.patch \
-        file://0001-fcntl-Add-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch \
-        file://0001-wire-in-syncfs.patch \
 "
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Revert-glibc-compat-bump-glibc-minor-version.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Revert-glibc-compat-bump-glibc-minor-version.patch
new file mode 100644
index 0000000..1f5bec1
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-Revert-glibc-compat-bump-glibc-minor-version.patch
@@ -0,0 +1,26 @@
+From f9f566849ad0785b2fd3fd6c4c5d324f9f822aac Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 13 Dec 2015 17:25:11 +0000
+Subject: [PATCH] Revert "glibc compat: bump glibc minor version"
+
+This reverts commit 4ff3a6c8eb91db71d6dc3d2932b66e848bd20ac3.
+---
+ include/features.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/features.h b/include/features.h
+index f6fbbf4..dcf1348 100644
+--- a/include/features.h
++++ b/include/features.h
+@@ -393,7 +393,7 @@ uClibc was built without large file support enabled.
+    these macros to test for features in specific releases.  */
+ /* Don't do it, if you want to keep uClibc happy.  */
+ #define	__GLIBC__	2
+-#define	__GLIBC_MINOR__	10
++#define	__GLIBC_MINOR__	2
+ #endif
+ 
+ #define __GLIBC_PREREQ(maj, min) \
+-- 
+2.6.4
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-fcntl-Add-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch b/meta/recipes-core/uclibc/uclibc-git/0001-fcntl-Add-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch
deleted file mode 100644
index 6942db4..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0001-fcntl-Add-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 4c8f5fe7d41493e8e181941ae5a01713155f44d1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 15 Oct 2015 15:34:39 +0000
-Subject: [PATCH] fcntl: Add AT_EMPTY_PATH for all and O_PATH for arm
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- include/fcntl.h                     | 3 +++
- libc/sysdeps/linux/arm/bits/fcntl.h | 1 +
- 2 files changed, 4 insertions(+)
-
-diff --git a/include/fcntl.h b/include/fcntl.h
-index 11000dd..8a7ad9b 100644
---- a/include/fcntl.h
-+++ b/include/fcntl.h
-@@ -65,6 +65,9 @@ __BEGIN_DECLS
- # define AT_SYMLINK_FOLLOW	0x400	/* Follow symbolic links.  */
- # define AT_EACCESS		0x200	/* Test access permitted for
- 					   effective IDs, not real IDs.  */
-+# ifdef __USE_GNU
-+#  define AT_EMPTY_PATH         0x1000  /* Allow empty relative pathname.  */
-+# endif
- #endif
- 
- /* Do the file control operation described by CMD on FD.
-diff --git a/libc/sysdeps/linux/arm/bits/fcntl.h b/libc/sysdeps/linux/arm/bits/fcntl.h
-index aedc154..c6ba958 100644
---- a/libc/sysdeps/linux/arm/bits/fcntl.h
-+++ b/libc/sysdeps/linux/arm/bits/fcntl.h
-@@ -50,6 +50,7 @@
- # define O_DIRECT	0200000	/* Direct disk access.	*/
- # define O_NOATIME     01000000 /* Do not set atime.  */
- # define O_CLOEXEC     02000000 /* Set close_on_exec.  */
-+# define O_PATH       010000000 /* Resolve pathname but do not open file.  */
- #endif
- 
- /* For now Linux has synchronisity options for data and read operations.
--- 
-2.6.1
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-gcc5-optimizes-away-the-write-only-static-functions-.patch b/meta/recipes-core/uclibc/uclibc-git/0001-gcc5-optimizes-away-the-write-only-static-functions-.patch
deleted file mode 100644
index e622f87..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0001-gcc5-optimizes-away-the-write-only-static-functions-.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 2659fb25d32f4b29c1c96aa5730fe40e19d53ab0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 14 Oct 2015 17:38:37 -0700
-Subject: [PATCH] gcc5 optimizes away the write only static functions and we
- end up with
-
-  librt/librt_so.a(rt-unwind-resume.oS): In function `_Unwind_Resume':
-  rt-unwind-resume.c:(.text+0x3c): undefined reference to `libgcc_s_resume'
-  collect2: error: ld returned 1 exit status
-  make[2]: *** [lib/librt.so] Error 1
-
-marking these functions explicitly used with __attribute_used__ avoids
-that optimization.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c | 2 +-
- libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c       | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
-index f4d6f41..0c2edd7 100644
---- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
-+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
-@@ -27,7 +27,7 @@
- #define __libc_fatal(x)         {/*write(STDERR_FILENO, x, strlen(x));*/ abort();}
- 
- static void *libgcc_s_handle;
--static void (*libgcc_s_resume) (struct _Unwind_Exception *exc);
-+static void (*libgcc_s_resume) (struct _Unwind_Exception *exc) __attribute_used__;
- static _Unwind_Reason_Code (*libgcc_s_personality)
-   (_Unwind_State, struct _Unwind_Exception *, struct _Unwind_Context *);
- static _Unwind_Reason_Code (*libgcc_s_forcedunwind)
-diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
-index f9a4ffb..f0c3047 100644
---- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
-+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
-@@ -25,7 +25,7 @@
- #define __libc_dlclose          dlclose
- #define __libc_fatal(x)         {/*write(STDERR_FILENO, x, strlen(x));*/ abort();}
- 
--static void (*libgcc_s_resume) (struct _Unwind_Exception *exc);
-+static void (*libgcc_s_resume) (struct _Unwind_Exception *exc) __attribute_used__;
- static _Unwind_Reason_Code (*libgcc_s_personality)
-   (_Unwind_State, struct _Unwind_Exception *, struct _Unwind_Context *);
- 
--- 
-2.6.1
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-wire-in-syncfs.patch b/meta/recipes-core/uclibc/uclibc-git/0001-wire-in-syncfs.patch
deleted file mode 100644
index 079ad6b..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0001-wire-in-syncfs.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 4f2db1b46bda5e376245ec36198b137709f069e8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 15 Oct 2015 17:03:37 +0000
-Subject: [PATCH] wire in syncfs
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- include/unistd.h                   |  2 +-
- libc/sysdeps/linux/common/syncfs.c | 13 +++++++++++++
- 2 files changed, 14 insertions(+), 1 deletion(-)
- create mode 100644 libc/sysdeps/linux/common/syncfs.c
-
-diff --git a/include/unistd.h b/include/unistd.h
-index 3793d2d..d01bb08 100644
---- a/include/unistd.h
-+++ b/include/unistd.h
-@@ -1073,7 +1073,7 @@ extern char *getpass (const char *__prompt) __nonnull ((1));
- extern int fsync (int __fd);
- #endif /* Use BSD || X/Open || Unix98.  */
- 
--#if 0 /*def __USE_GNU */
-+#ifdef __USE_GNU
- /* Make all changes done to all files on the file system associated
-  *    with FD actually appear on disk.  */
- extern int syncfs (int __fd) __THROW;
-diff --git a/libc/sysdeps/linux/common/syncfs.c b/libc/sysdeps/linux/common/syncfs.c
-new file mode 100644
-index 0000000..d2eed05
---- /dev/null
-+++ b/libc/sysdeps/linux/common/syncfs.c
-@@ -0,0 +1,13 @@
-+/* vi: set sw=4 ts=4: */
-+/*
-+ * fsync() for uClibc
-+ *
-+ * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
-+ *
-+ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
-+ */
-+
-+#include <sys/syscall.h>
-+#include <unistd.h>
-+
-+_syscall1(int, syncfs, int, fd)
--- 
-2.6.1
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/0004-Dont-support-localised-optimizations-this-helps-to-h.patch b/meta/recipes-core/uclibc/uclibc-git/0004-Dont-support-localised-optimizations-this-helps-to-h.patch
deleted file mode 100644
index 629e13c..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0004-Dont-support-localised-optimizations-this-helps-to-h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 31785c544abe8b215dbb2264fb11ee7051515797 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 16 Aug 2015 20:58:59 -0700
-Subject: [PATCH 4/7] Dont support localised optimizations this helps to have a
- global -O level
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- libpthread/nptl/pthread_mutex_timedlock.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libpthread/nptl/pthread_mutex_timedlock.c b/libpthread/nptl/pthread_mutex_timedlock.c
-index 04187f6..f56f6c5 100644
---- a/libpthread/nptl/pthread_mutex_timedlock.c
-+++ b/libpthread/nptl/pthread_mutex_timedlock.c
-@@ -28,7 +28,9 @@
-  * error: can't find a register in class ‘GENERAL_REGS’ while reloading ‘asm’
-  */
- int
-+#ifndef  __OPTIMIZE__
- attribute_optimize("Os")
-+#endif
- pthread_mutex_timedlock (
-      pthread_mutex_t *mutex,
-      const struct timespec *abstime)
--- 
-2.1.4
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/0005-Always-use-O2-for-compiling-fork.c.patch b/meta/recipes-core/uclibc/uclibc-git/0005-Always-use-O2-for-compiling-fork.c.patch
deleted file mode 100644
index ad9b246..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0005-Always-use-O2-for-compiling-fork.c.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 883debc22e30a947fe5858cc07ee5aebd3d07a2e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 16 Aug 2015 20:59:56 -0700
-Subject: [PATCH 5/7] Always use -O2 for compiling fork.c
-
-When compiling in thumb mode for arm with -Os gcc gives up since it can
-not find registers to spill. So we use -O2 option for compiling fork.c
-It may be addressable in gcc.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch
-index 0ea0b29..0767e9c 100644
---- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch
-+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch
-@@ -21,3 +21,9 @@ ASFLAGS-pt-vfork.S = -marm
- CFLAGS-OMIT-pt-vfork.S = -mthumb
- ASFLAGS-vfork.S = -marm
- CFLAGS-OMIT-vfork.S = -mthumb
-+
-+# For arm fork.c does not compile with -Os when compiling
-+# in thumb1 mode
-+ifeq ($(COMPILE_IN_THUMB_MODE),y)
-+CFLAGS-fork.c = -O2
-+endif
--- 
-2.1.4
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/0006-ldso-limited-support-for-ORIGIN-in-rpath.patch b/meta/recipes-core/uclibc/uclibc-git/0006-ldso-limited-support-for-ORIGIN-in-rpath.patch
deleted file mode 100644
index f0d8737..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0006-ldso-limited-support-for-ORIGIN-in-rpath.patch
+++ /dev/null
@@ -1,233 +0,0 @@
-From b40c129ed2d53b69463883a5422dd4a012a398f9 Mon Sep 17 00:00:00 2001
-From: Junling Zheng <zhengjunling@huawei.com>
-Date: Fri, 3 Apr 2015 05:02:27 +0000
-Subject: [PATCH 6/7] ldso: limited support for $ORIGIN in rpath
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Derived from:
-http://lists.busybox.net/pipermail/uclibc/2011-March/045003.html
-
-However, the above patch introduced '_dl_strchr' in ldso/ldso/dl-elf.c,
-and caused the following undefined referencing compiling error:
-
-  | .../libdl.a(libdl.os): In function `search_for_named_library':
-  | .../dl-elf.c:156: undefined reference to `_dl_strchr'
-  | collect2: error: ld returned 1 exit status
-
-This problem would be reproduced through compiling gdb in static mode
-using uclibc.
-
-So, add the definition of '_dl_strchr' to fix it. The '_dl_strstr' is
-added as well.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Timo Teräs <timo.teras at iki.fi>
-Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- ldso/include/dl-string.h |  2 ++
- ldso/ldso/dl-elf.c       | 79 +++++++++++++++++++++++++-----------------------
- ldso/ldso/ldso.c         | 18 +++++++++--
- 3 files changed, 59 insertions(+), 40 deletions(-)
-
-diff --git a/ldso/include/dl-string.h b/ldso/include/dl-string.h
-index aacad10..14ae617 100644
---- a/ldso/include/dl-string.h
-+++ b/ldso/include/dl-string.h
-@@ -204,7 +204,9 @@ static __always_inline char * _dl_get_last_path_component(char *path)
- # define _dl_strcat strcat
- # define _dl_strcpy strcpy
- # define _dl_strcmp strcmp
-+# define _dl_strchr strchr
- # define _dl_strrchr strrchr
-+# define _dl_strstr strstr
- # define _dl_memcpy memcpy
- # define _dl_memcmp memcmp
- # define _dl_memset memset
-diff --git a/ldso/ldso/dl-elf.c b/ldso/ldso/dl-elf.c
-index 5631905..6ab7afe 100644
---- a/ldso/ldso/dl-elf.c
-+++ b/ldso/ldso/dl-elf.c
-@@ -133,56 +133,60 @@ _dl_protect_relro (struct elf_resolve *l)
-  * in uClibc/ldso/util/ldd.c */
- static struct elf_resolve *
- search_for_named_library(const char *name, unsigned rflags, const char *path_list,
--	struct dyn_elf **rpnt)
-+	struct dyn_elf **rpnt, const char* origin)
- {
--	char *path, *path_n, *mylibname;
-+	char *mylibname;
-+	const char *p, *pn;
- 	struct elf_resolve *tpnt;
--	int done;
-+	int plen;
- 
- 	if (path_list==NULL)
- 		return NULL;
- 
--	/* We need a writable copy of this string, but we don't
--	 * need this allocated permanently since we don't want
--	 * to leak memory, so use alloca to put path on the stack */
--	done = _dl_strlen(path_list);
--	path = alloca(done + 1);
--
- 	/* another bit of local storage */
- 	mylibname = alloca(2050);
- 
--	_dl_memcpy(path, path_list, done+1);
--
- 	/* Unlike ldd.c, don't bother to eliminate double //s */
- 
- 	/* Replace colons with zeros in path_list */
- 	/* : at the beginning or end of path maps to CWD */
- 	/* :: anywhere maps CWD */
- 	/* "" maps to CWD */
--	done = 0;
--	path_n = path;
--	do {
--		if (*path == 0) {
--			*path = ':';
--			done = 1;
-+	for (p = path_list; p != NULL; p = pn) {
-+		pn = _dl_strchr(p + 1, ':');
-+		if (pn != NULL) {
-+			plen = pn - p;
-+			pn++;
-+		} else
-+			plen = _dl_strlen(p);
-+
-+		if (plen >= 7 && _dl_memcmp(p, "$ORIGIN", 7) == 0) {
-+			int olen;
-+			if (rflags && plen != 7)
-+				continue;
-+			if (origin == NULL)
-+				continue;
-+			for (olen = _dl_strlen(origin) - 1; olen >= 0 && origin[olen] != '/'; olen--)
-+				;
-+			if (olen <= 0)
-+				continue;
-+			_dl_memcpy(&mylibname[0], origin, olen);
-+			_dl_memcpy(&mylibname[olen], p + 7, plen - 7);
-+			mylibname[olen + plen - 7] = 0;
-+		} else if (plen != 0) {
-+			_dl_memcpy(mylibname, p, plen);
-+			mylibname[plen] = 0;
-+		} else {
-+			_dl_strcpy(mylibname, ".");
- 		}
--		if (*path == ':') {
--			*path = 0;
--			if (*path_n)
--				_dl_strcpy(mylibname, path_n);
--			else
--				_dl_strcpy(mylibname, "."); /* Assume current dir if empty path */
--			_dl_strcat(mylibname, "/");
--			_dl_strcat(mylibname, name);
-+		_dl_strcat(mylibname, "/");
-+		_dl_strcat(mylibname, name);
- #ifdef __LDSO_SAFE_RUNPATH__
--			if (*mylibname == '/')
-+		if (*mylibname == '/')
- #endif
--				if ((tpnt = _dl_load_elf_shared_library(rflags, rpnt, mylibname)) != NULL)
--					return tpnt;
--			path_n = path+1;
--		}
--		path++;
--	} while (!done);
-+		if ((tpnt = _dl_load_elf_shared_library(rflags, rpnt, mylibname)) != NULL)
-+			return tpnt;
-+	}
- 	return NULL;
- }
- 
-@@ -234,7 +238,8 @@ struct elf_resolve *_dl_load_shared_library(unsigned rflags, struct dyn_elf **rp
- 	if (pnt) {
- 		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
- 		_dl_if_debug_dprint("\tsearching RPATH='%s'\n", pnt);
--		if ((tpnt1 = search_for_named_library(libname, rflags, pnt, rpnt)) != NULL)
-+		if ((tpnt1 = search_for_named_library(libname, rflags, pnt, rpnt,
-+						      tpnt->libname)) != NULL)
- 			return tpnt1;
- 	}
- #endif
-@@ -243,7 +248,7 @@ struct elf_resolve *_dl_load_shared_library(unsigned rflags, struct dyn_elf **rp
- 	/* Check in LD_{ELF_}LIBRARY_PATH, if specified and allowed */
- 	if (_dl_library_path) {
- 		_dl_if_debug_dprint("\tsearching LD_LIBRARY_PATH='%s'\n", _dl_library_path);
--		if ((tpnt1 = search_for_named_library(libname, rflags, _dl_library_path, rpnt)) != NULL)
-+		if ((tpnt1 = search_for_named_library(libname, rflags, _dl_library_path, rpnt, NULL)) != NULL)
- 		{
- 			return tpnt1;
- 		}
-@@ -257,7 +262,7 @@ struct elf_resolve *_dl_load_shared_library(unsigned rflags, struct dyn_elf **rp
- 	if (pnt) {
- 		pnt += (unsigned long) tpnt->dynamic_info[DT_STRTAB];
- 		_dl_if_debug_dprint("\tsearching RUNPATH='%s'\n", pnt);
--		if ((tpnt1 = search_for_named_library(libname, rflags, pnt, rpnt)) != NULL)
-+		if ((tpnt1 = search_for_named_library(libname, rflags, pnt, rpnt, NULL)) != NULL)
- 			return tpnt1;
- 	}
- #endif
-@@ -291,7 +296,7 @@ struct elf_resolve *_dl_load_shared_library(unsigned rflags, struct dyn_elf **rp
- 	/* Look for libraries wherever the shared library loader
- 	 * was installed */
- 	_dl_if_debug_dprint("\tsearching ldso dir='%s'\n", _dl_ldsopath);
--	tpnt1 = search_for_named_library(libname, rflags, _dl_ldsopath, rpnt);
-+	tpnt1 = search_for_named_library(libname, rflags, _dl_ldsopath, rpnt, NULL);
- 	if (tpnt1 != NULL)
- 		return tpnt1;
- #endif
-@@ -304,7 +309,7 @@ struct elf_resolve *_dl_load_shared_library(unsigned rflags, struct dyn_elf **rp
- #ifndef __LDSO_CACHE_SUPPORT__
- 					":" UCLIBC_RUNTIME_PREFIX "usr/X11R6/lib"
- #endif
--					, rpnt);
-+					, rpnt, NULL);
- 	if (tpnt1 != NULL)
- 		return tpnt1;
- 
-diff --git a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c
-index f38f9e3..3812908 100644
---- a/ldso/ldso/ldso.c
-+++ b/ldso/ldso/ldso.c
-@@ -402,6 +402,20 @@ static ptrdiff_t _dl_build_local_scope (struct elf_resolve **list,
- 				p += _dl_build_local_scope (p, q->tpnt);
- 	return p - list;
- }
-+ 
-+static void _dl_setup_progname(const char *argv0)
-+{
-+	char image[PATH_MAX];
-+	ssize_t s;
-+
-+	s = _dl_readlink("/proc/self/exe", image, sizeof(image));
-+	if (s > 0 && image[0] == '/') {
-+		image[s] = 0;
-+		_dl_progname = _dl_strdup(image);
-+	} else if (argv0) {
-+		_dl_progname = argv0;
-+	}
-+}
- 
- void *_dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
- 			  ElfW(auxv_t) auxvt[AT_EGID + 1], char **envp, char **argv
-@@ -454,9 +468,7 @@ void *_dl_get_ready_to_run(struct elf_resolve *tpnt, DL_LOADADDR_TYPE load_addr,
- 	 * been fixed up by now.  Still no function calls outside of this
- 	 * library, since the dynamic resolver is not yet ready.
- 	 */
--	if (argv[0]) {
--		_dl_progname = argv[0];
--	}
-+	_dl_setup_progname(argv[0]);
- 
- #ifdef __DSBT__
- 	_dl_ldso_dsbt = (void *)tpnt->dynamic_info[DT_DSBT_BASE_IDX];
--- 
-2.1.4
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/0007-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch b/meta/recipes-core/uclibc/uclibc-git/0007-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
deleted file mode 100644
index ee932c3..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0007-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 90516af9f776f9c2835b47fc52775dcb307a85ac Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 23 Jun 2012 15:59:01 -0700
-Subject: [PATCH 7/7] nptl/atfork: Hide pthread_atfork in shared versions
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
----
- libpthread/nptl/Makefile.in | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libpthread/nptl/Makefile.in b/libpthread/nptl/Makefile.in
-index 55eeba2..8cb8fa9 100644
---- a/libpthread/nptl/Makefile.in
-+++ b/libpthread/nptl/Makefile.in
-@@ -16,6 +16,7 @@ libc-shared-routines-y = forward.c libc-cancellation.c
- libc-static-routines-y = alloca_cutoff.c libc-cancellation.c
- libpthread-shared-only-routines-y = version.c
- libpthread-static-only-routines-y = pthread_atfork.c
-+
- libpthread-routines- += $(notdir $(wildcard $(libpthread_DIR)/gen_*.c)) # dummy generated files
- libpthread-routines- += allocatestack.c # dummy included by pthread_create.c
- libpthread-routines- += pthread_mutex_getprioceiling.c pthread_mutex_setprioceiling.c # XXX: delete those or use them!
-@@ -201,7 +202,7 @@ CFLAGS-msgsnd.c = -fexceptions -fasynchronous-unwind-tables
- CFLAGS-tcdrain.c = -fexceptions -fasynchronous-unwind-tables
- 
- CFLAGS-pt-system.c = -fexceptions -I$(top_srcdir)libc/stdlib
--
-+CFLAGS-pthread_atfork.c = -DNOT_IN_libc
- #
- # The rest of this file is uClibc specific.
- #
--- 
-2.1.4
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch b/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch
new file mode 100644
index 0000000..8b36cfc
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch
@@ -0,0 +1,36 @@
+diff --git a/libc/stdlib/canonicalize.c b/libc/stdlib/canonicalize.c
+index 06e710a..da09d58 100644
+--- a/libc/stdlib/canonicalize.c
++++ b/libc/stdlib/canonicalize.c
+@@ -9,30 +9,11 @@
+  */
+ 
+ #include <stdlib.h>
+-#include <limits.h>
+ 
+ #ifdef __USE_GNU
+ 
+-#ifndef PATH_MAX
+-# ifdef _POSIX_VERSION
+-#  define PATH_MAX _POSIX_PATH_MAX
+-# else
+-#  ifdef MAXPATHLEN
+-#   define PATH_MAX MAXPATHLEN
+-#  else
+-#   define PATH_MAX 1024
+-#  endif
+-# endif
+-#endif
+-
+ char * canonicalize_file_name (const char *name)
+ {
+-	char *buf = (char *) malloc(PATH_MAX);
+-
+-	if(unlikely(buf == NULL))
+-		return NULL;
+-
+-	*buf='\0';
+-	return realpath (name, buf);
++	return realpath (name, NULL);
+ }
+ #endif
diff --git a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
index 3827b66..7785ce8 100644
--- a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
+++ b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
@@ -79,11 +79,11 @@ UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
 UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
 UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
 # UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
-UCLIBC_HAS_STDIO_BUFSIZ_256=y
+# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
 # UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
 # UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
 # UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_4096 is not set
+UCLIBC_HAS_STDIO_BUFSIZ_4096=y
 # UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
 UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
 # UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 533aa3d..ff7d744 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -13,7 +13,6 @@ SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
 file://${S}/test/regex/testregex.c;beginline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
-PR = "r9"
 
 require uclibc-config.inc
 
@@ -60,18 +59,13 @@ export V="2"
 CFLAGS_arm := "${@oe_filter_out('-fno-omit-frame-pointer', '${CFLAGS}', d)}"
 UCLIBC_EXTRA_CFLAGS  := "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
 
-do_compile_prepend () {
-  unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-  oe_runmake pregen
-}
-
 configmangle = '/^KERNEL_HEADERS/d; \
                 /^RUNTIME_PREFIX/d; \
                 /^DEVEL_PREFIX/d; \
                 /^SHARED_LIB_LOADER_PREFIX/d; \
                 /^UCLIBC_EXTRA_CFLAGS/d; \
                 s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g; \
-                ${@["","s,.*COMPILE_IN_THUMB_MODE.*,COMPILE_IN_THUMB_MODE=y,;"][d.getVar("ARM_INSTRUCTION_SET", True) != "arm"]} \
+                ${@["","s,.*COMPILE_IN_THUMB_MODE.*,COMPILE_IN_THUMB_MODE=y,;"][d.getVar("ARM_INSTRUCTION_SET", True) == "thumb"]} \
                 ${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y,;"][d.getVar("USE_NLS", True) == "yes"]} \
                 ${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_GNU_HASH_SUPPORT is not set,;"][d.getVar("TARGET_ARCH", True) in ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]} \
                 /^CROSS/d; \
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index fd02b3d..81756ac 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -13,6 +13,11 @@ DEPENDS = "virtual/${TARGET_PREFIX}binutils \
            linux-libc-headers ncurses-native \
            libgcc-initial kern-tools-native"
 
+#do_compile_prepend () {
+#  unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+#  oe_runmake pregen
+#}
+#
 RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
 RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
 # uclibc does not really have libsegfault but then using the one from glibc is also not
-- 
2.6.4


