Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 85CD76FF6B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:31:49 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3qQnm352Vdz3hjp5;
	Thu, 17 Mar 2016 13:31:47 +0100 (CET)
X-Auth-Info: A2/E3WM+uVP+CGSeZ5cJ8extZbg6uv0l2c0mMaUGZc0=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3qQnm3249VzvdWt;
	Thu, 17 Mar 2016 13:31:47 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 13:31:34 +0100
Message-Id: <1458217899-5542-2-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1458217899-5542-1-git-send-email-marex@denx.de>
References: <1458217899-5542-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Thomas Chou <thomas@wytron.com.tw>,
	Ley Foon Tan <lftan@altera.com>, Walter Goossens <waltergoossens@home.nl>
Subject: [PATCH 2/7] bdgwc: Backport nios2 support
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
X-List-Received-Date: Thu, 17 Mar 2016 12:31:51 -0000

Backport patch from bdwgc mainline which adds initial
support for nios2 architecture.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Ley Foon Tan <lftan@altera.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Thomas Chou <thomas@wytron.com.tw>
Cc: Walter Goossens <waltergoossens@home.nl>
---
 .../bdwgc/bdwgc/0002-Altera-NIOS2-support.patch    | 71 ++++++++++++++++++++++
 meta/recipes-support/bdwgc/bdwgc_7.4.2.bb          |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-support/bdwgc/bdwgc/0002-Altera-NIOS2-support.patch

diff --git a/meta/recipes-support/bdwgc/bdwgc/0002-Altera-NIOS2-support.patch b/meta/recipes-support/bdwgc/bdwgc/0002-Altera-NIOS2-support.patch
new file mode 100644
index 0000000..c73c540
--- /dev/null
+++ b/meta/recipes-support/bdwgc/bdwgc/0002-Altera-NIOS2-support.patch
@@ -0,0 +1,71 @@
+From 2571df0e30b4976d7a12dbc6fbec4f1c4027924d Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Thu, 28 Jan 2016 04:13:13 +0100
+Subject: [PATCH] Altera NIOS2 support
+
+Add simple nios2 configuration support.
+
+* include/private/gcconfig.h (NIOS2): New macro.
+* include/private/gcconfig.h (mach_type_known, CPP_WORDSZ, MACH_TYPE,
+OS_TYPE, DYNAMIC_LOADING, _end, __data_start, DATASTART, DATAEND,
+ALIGNMENT, HBLKSIZE, HBLKSIZE, LINUX_STACKBOTTOM, NO_GETCONTEXT):
+Define for NIOS2.
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Upstream-Status: Backport [ https://github.com/ivmai/bdwgc.git 2571df0e30b4976d7a12dbc6fbec4f1c4027924d ]
+---
+ include/private/gcconfig.h | 24 +++++++++++++++++++++++-
+ 1 file changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/include/private/gcconfig.h b/include/private/gcconfig.h
+index c467c26..92d4727 100644
+--- a/include/private/gcconfig.h
++++ b/include/private/gcconfig.h
+@@ -181,6 +181,10 @@
+ #    endif
+ #    define mach_type_known
+ # endif
++# if defined(__NIOS2__) || defined(__NIOS2) || defined(__nios2__)
++#   define NIOS2 /* Altera NIOS2 */
++#   define mach_type_known
++# endif
+ # if defined(DGUX) && (defined(i386) || defined(__i386__))
+ #    define I386
+ #    ifndef _USING_DGUX
+@@ -1658,6 +1662,24 @@
+ #   endif
+ # endif
+ 
++# ifdef NIOS2
++#  define CPP_WORDSZ 32
++#  define MACH_TYPE "NIOS2"
++#  ifdef LINUX
++#    define OS_TYPE "LINUX"
++#    define DYNAMIC_LOADING
++     extern int _end[];
++     extern int __data_start[];
++#    define DATASTART ((ptr_t)(__data_start))
++#    define DATAEND ((ptr_t)(_end))
++#    define ALIGNMENT 4
++#    ifndef HBLKSIZE
++#      define HBLKSIZE 4096
++#    endif
++#    define LINUX_STACKBOTTOM
++#  endif /* Linux */
++# endif
++
+ # ifdef HP_PA
+ #   define MACH_TYPE "HP_PA"
+ #   ifdef __LP64__
+@@ -2622,6 +2644,7 @@
+ #if ((defined(UNIX_LIKE) && (defined(DARWIN) || defined(HURD) \
+                              || defined(OPENBSD) || defined(ARM32) \
+-                             || defined(MIPS) || defined(AVR32))) \
++                             || defined(MIPS) || defined(AVR32) \
++                             || defined(NIOS2))) \
+      || (defined(LINUX) && (defined(SPARC) || defined(M68K))) \
+      || ((defined(RTEMS) || defined(PLATFORM_ANDROID)) && defined(I386))) \
+     && !defined(NO_GETCONTEXT)
+-- 
+2.7.0
+
diff --git a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
index 95e358f..eb26e81 100644
--- a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
+++ b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
@@ -23,6 +23,7 @@ LIC_FILES_CHKSUM = "file://README.QUICK;md5=55f5088f90a982fed7af9a4897047ef7"
 
 SRC_URI = "http://www.hboehm.info/gc/gc_source/gc-${PV}.tar.gz \
            file://0001-fix-build-with-musl.patch \
+	   file://0002-Altera-NIOS2-support.patch \
           "
 
 SRC_URI[md5sum] = "12c05fd2811d989341d8c6d81f66af87"
-- 
2.7.0


