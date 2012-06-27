Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjuZW-0001h3-S6
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 17:54:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Jun 2012 08:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="161344538"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 27 Jun 2012 08:43:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 08:43:16 -0700
Message-Id: <afe357190a70c71957dbe1b370b1d3dbd80d25f5.1340811559.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 11/20] systemtap: update to version 1.8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jun 2012 15:54:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Wade Farnsworth <wade_farnsworth@mentor.com>

Update the systemtap recipes to the recently released 1.8.  Remove a
couple patches whose changes are already present in the new version.

Signed-off-by: Wade Farnsworth <wade_farnsworth@mentor.com>
---
 ...prun-configure.ac-support-without-nss-for.patch |   50 --------------------
 .../systemtap_fix_for_automake_1.12.patch          |   23 ---------
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    6 +--
 4 files changed, 3 insertions(+), 78 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/systemtap_fix_for_automake_1.12.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch b/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch
deleted file mode 100644
index eef414a..0000000
--- a/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From fa81ccd4f92e5cb15a11a81a7e656bfe01745afb Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Tue, 5 Jun 2012 10:22:23 +0200
-Subject: [PATCH] runtime/staprun/configure.ac: support --without-nss for
- staprun
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Submitted
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- runtime/staprun/configure.ac |   20 +++++++++++++++-----
- 1 files changed, 15 insertions(+), 5 deletions(-)
-
-diff --git a/runtime/staprun/configure.ac b/runtime/staprun/configure.ac
-index 8fd1b42..7b05f73 100644
---- a/runtime/staprun/configure.ac
-+++ b/runtime/staprun/configure.ac
-@@ -67,11 +67,21 @@ AS_IF([test "x$enable_sdt_probes" != xno], [
-             [Define to 1 to enable process.mark probes in staprun, stapio.])
- ])
- 
--PKG_CHECK_MODULES([nss], [nss >= 3], [have_nss=yes], [have_nss=no])
--AM_CONDITIONAL([HAVE_NSS], [test $have_nss = yes])
--AS_IF([test $have_nss = yes], [
--  AC_DEFINE([HAVE_NSS], [1], [Define to 1 if you have the nss libraries.])
--])
-+dnl See if we have the nss/nspr headers and libraries
-+AC_ARG_WITH([nss],
-+  AS_HELP_STRING([--without-nss],
-+    [Do not use NSS even if present]))
-+
-+AS_IF([test "x$with_nss" != "xno"], [
-+  PKG_CHECK_MODULES([nss], [nss >= 3],
-+    [have_nss=yes
-+     AC_DEFINE([HAVE_NSS], [1], [Define to 1 if you have the nss libraries.])
-+    ], [have_nss=no])
-+], [have_nss=no])
-+
-+AM_CONDITIONAL([HAVE_NSS], [test "${have_nss}" = "yes"])
-+
-+
- AC_ARG_ENABLE([nls], [AS_HELP_STRING([--enable-nls], [enable translating program messages])])
- AS_IF([test "x$enable_nls" != xno], [
- AC_DEFINE([ENABLE_NLS], [1], [Define to 1 if program messages should be translated.])
--- 
-1.7.6.5
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/systemtap_fix_for_automake_1.12.patch b/meta/recipes-kernel/systemtap/systemtap/systemtap_fix_for_automake_1.12.patch
deleted file mode 100644
index ef74a09..0000000
--- a/meta/recipes-kernel/systemtap/systemtap/systemtap_fix_for_automake_1.12.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Pending 
-
-Automake 1.12 has deprecated automatic de-ANSI-fication support
-
-Fix this issue with automake 1.12:
-
-| configure.ac:23: error: automatic de-ANSI-fication support has been removed
-
-Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/02
-
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -20,7 +20,6 @@ AC_PROG_CXX
- AC_PROG_CPP
- AM_PROG_CC_STDC
- AM_PROG_CC_C_O
--AM_C_PROTOTYPES
- AC_PROG_RANLIB
- AC_OBJEXT
- AC_EXEEXT
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 7ed5fcd..059aca7 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "elfutils sqlite3 systemtap-native"
 DEPENDS_virtclass-native = "elfutils-native sqlite3-native gettext-native"
 DEPENDS_virtclass-nativesdk = "elfutils-nativesdk sqlite3-nativesdk gettext-nativesdk"
 
-PR = "r5"
+PR = "r0"
 
 export CC_FOR_BUILD = "${BUILD_CC}"
 export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 5f2987b..093e62d 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,13 +1,11 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81"
-PV = "1.7+git${SRCPV}"
+SRCREV = "48fa6b5e1d3e636c34cbd5650370e6f634efc294"
+PV = "1.8+git${SRCPV}"
 
 SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git \
            file://docproc-build-fix.patch \
-           file://systemtap_fix_for_automake_1.12.patch \
-           file://runtime-staprun-configure.ac-support-without-nss-for.patch \
           "
 
 FILESPATH = "${FILE_DIRNAME}/systemtap"
-- 
1.7.7.6



