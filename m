Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0101F7848A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:29:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:29:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279569"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:29:06 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:41 +0300
Message-Id: <928c8d055c77573cc452133cccfa190df2a07d6a.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/32] bdwgc: remove the recipe
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
X-List-Received-Date: Fri, 16 Jun 2017 12:29:27 -0000

It will be moved to meta-oe, but nothing needs it in oe-core anymore.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/distro_alias.inc          |  1 -
 ...ac-add-check-for-NO_GETCONTEXT-definition.patch | 29 ---------------
 .../bdwgc/bdwgc/musl_header_fix.patch              | 27 --------------
 meta/recipes-support/bdwgc/bdwgc_7.6.0.bb          | 42 ----------------------
 4 files changed, 99 deletions(-)
 delete mode 100644 meta/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
 delete mode 100644 meta/recipes-support/bdwgc/bdwgc/musl_header_fix.patch
 delete mode 100644 meta/recipes-support/bdwgc/bdwgc_7.6.0.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index b8fc5dea657..ce8e0aa3594 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -15,7 +15,6 @@ DISTRO_PN_ALIAS_pn-alsa-utils-scripts = "OE-Core"
 DISTRO_PN_ALIAS_pn-atk = "Fedora=atk OpenSuSE=atk"
 DISTRO_PN_ALIAS_pn-avahi-ui = "Ubuntu=avahi-discover Debian=avahi-discover"
 DISTRO_PN_ALIAS_pn-babeltrace = "OSPDT"
-DISTRO_PN_ALIAS_pn-bdwgc = "OSPDT"
 DISTRO_PN_ALIAS_pn-bigreqsproto = "Meego=xorg-x11-proto-bigreqsproto"
 DISTRO_PN_ALIAS_pn-bjam = "OpenSuSE=boost-jam Debina=bjam"
 DISTRO_PN_ALIAS_pn-blktool = "Debian=blktool Mandriva=blktool"
diff --git a/meta/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch b/meta/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
deleted file mode 100644
index 8ef774f0f2c..00000000000
--- a/meta/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-configure.ac: add check for NO_GETCONTEXT definition
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[yann.morin.1998@free.fr: add a comment, change variable name, use
- AS_IF, remove debug traces, use AC_CHECK_FUNCS (as suggested by
- Thomas)]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
----
-Upstream-Status: Pending
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
---- bdwgc-7.2f.orig/configure.ac	2014-06-01 19:00:47.000000000 +0200
-+++ bdwgc-7.2f/configure.ac	2014-12-23 14:13:11.585716713 +0100
-@@ -365,6 +365,12 @@
-   AC_MSG_RESULT($ac_cv_fno_strict_aliasing)
- fi
- 
-+# Check for getcontext (uClibc can be configured without it, for example)
-+AC_CHECK_FUNCS([getcontext])
-+AS_IF([test "$ac_cv_func_getcontext" = "no"],
-+  [CFLAGS="$CFLAGS -DNO_GETCONTEXT"
-+   CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"])
-+
- case "$host" in
- # While IRIX 6 has libdl for the O32 and N32 ABIs, it's missing for N64
- # and unnecessary everywhere.
diff --git a/meta/recipes-support/bdwgc/bdwgc/musl_header_fix.patch b/meta/recipes-support/bdwgc/bdwgc/musl_header_fix.patch
deleted file mode 100644
index 4a184966501..00000000000
--- a/meta/recipes-support/bdwgc/bdwgc/musl_header_fix.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Add missing header to avoid:
-
-| 1472659610.016355: ../git/pthread_stop_world.c: In function 'GC_brief_async_signal_safe_sleep':
-| 1472659610.0540252: ../git/pthread_stop_world.c:397:22: error: storage size of 'tv' isn't known
-| 1472659610.0540252:        struct timeval tv;
-| 1472659610.0540252:                       ^~
-| 1472659610.054099: ../git/pthread_stop_world.c:397:22: warning: unused variable 'tv' [-Wunused-variable]
-| 1472659610.054099:        struct timeval tv;
-| 1472659610.054099:                       ^~
-| 1472659610.054099: Makefile:1530: recipe for target 'pthread_stop_world.lo' failed
-
-in musl builds.
-
-Upstream-Status: Pending
-
-Index: git/pthread_stop_world.c
-===================================================================
---- git.orig/pthread_stop_world.c
-+++ git/pthread_stop_world.c
-@@ -45,6 +45,7 @@
- #include <semaphore.h>
- #include <errno.h>
- #include <unistd.h>
-+#include <sys/time.h>
- #include "atomic_ops.h"
- 
- /* It's safe to call original pthread_sigmask() here.   */
diff --git a/meta/recipes-support/bdwgc/bdwgc_7.6.0.bb b/meta/recipes-support/bdwgc/bdwgc_7.6.0.bb
deleted file mode 100644
index dcb68f02826..00000000000
--- a/meta/recipes-support/bdwgc/bdwgc_7.6.0.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-SUMMARY = "A garbage collector for C and C++"
-
-DESCRIPTION = "The Boehm-Demers-Weiser conservative garbage collector can be\
- used as a garbage collecting replacement for C malloc or C++ new. It allows\
- you to allocate memory basically as you normally would, without explicitly\
- deallocating memory that is no longer useful. The collector automatically\
- recycles memory when it determines that it can no longer be otherwise\
- accessed.\
-  The collector is also used by a number of programming language\
- implementations that either use C as intermediate code, want to facilitate\
- easier interoperation with C libraries, or just prefer the simple collector\
- interface.\
-  Alternatively, the garbage collector may be used as a leak detector for C\
- or C++ programs, though that is not its primary goal.\
-  Empirically, this collector works with most unmodified C programs, simply\
- by replacing malloc with GC_malloc calls, replacing realloc with GC_realloc\
- calls, and removing free calls."
-
-HOMEPAGE = "http://www.hboehm.info/gc/"
-SECTION = "devel"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README.QUICK;md5=4f81f24ec69726c312487c2ac740e9e3"
-
-SRCREV = "8ac1d84a40eb7a431fec1b8097e3f24b48fb23fa"
-SRC_URI = "git://github.com/ivmai/bdwgc.git \
-           file://0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch \
-           file://musl_header_fix.patch \
-          "
-
-FILES_${PN}-doc = "${datadir}"
-
-S = "${WORKDIR}/git"
-
-ARM_INSTRUCTION_SET = "arm"
-
-inherit autotools pkgconfig
-
-# by default use external libatomic-ops
-PACKAGECONFIG ??= "libatomic-ops"
-PACKAGECONFIG[libatomic-ops] = "--with-libatomic-ops=yes,--with-libatomic-ops=no,libatomic-ops"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


