Return-Path: <radu.moisan@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 29FEE6AE9E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 12:22:17 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Jul 2013 05:22:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1036,1363158000"; d="scan'208";a="329274353"
Received: from ubuntu.rb.intel.com ([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 10 Jul 2013 05:22:16 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2013 15:24:12 +0300
Message-Id: <0fcb6318b76ca2616a5cf69df4de48ca8238861a.1373451815.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1373451815.git.radu.moisan@intel.com>
References: <cover.1373451815.git.radu.moisan@intel.com>
In-Reply-To: <cover.1373451815.git.radu.moisan@intel.com>
References: <cover.1373451815.git.radu.moisan@intel.com>
Subject: [PATCH 2/2] diffutils: Upgrade to v3.3
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
X-List-Received-Date: Wed, 10 Jul 2013 12:22:17 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../diffutils-3.2/obsolete_automake_macros.patch   |   14 -------------
 .../diffutils/diffutils-3.2/remove-gets.patch      |   22 --------------------
 meta/recipes-extended/diffutils/diffutils.inc      |    4 ----
 meta/recipes-extended/diffutils/diffutils_2.8.1.bb |    7 ++++---
 .../{diffutils_3.2.bb => diffutils_3.3.bb}         |   12 ++++-------
 5 files changed, 8 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-extended/diffutils/diffutils-3.2/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-extended/diffutils/diffutils-3.2/remove-gets.patch
 rename meta/recipes-extended/diffutils/{diffutils_3.2.bb => diffutils_3.3.bb} (59%)

diff --git a/meta/recipes-extended/diffutils/diffutils-3.2/obsolete_automake_macros.patch b/meta/recipes-extended/diffutils/diffutils-3.2/obsolete_automake_macros.patch
deleted file mode 100644
index f47cc79..0000000
--- a/meta/recipes-extended/diffutils/diffutils-3.2/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd diffutils-3.2/configure.ac diffutils-3.2/configure.ac
---- diffutils-3.2/configure.ac	2011-08-11 18:17:54.000000000 +0300
-+++ diffutils-3.2/configure.ac	2013-02-08 08:13:28.271427213 +0200
-@@ -33,7 +33,6 @@
-
- AC_PROG_AWK
- AC_PROG_CC
--AM_PROG_CC_STDC
- AM_MISSING_PROG([HELP2MAN], [help2man])
- AC_PROG_RANLIB
- gl_EARLY
diff --git a/meta/recipes-extended/diffutils/diffutils-3.2/remove-gets.patch b/meta/recipes-extended/diffutils/diffutils-3.2/remove-gets.patch
deleted file mode 100644
index 58ed62d..0000000
--- a/meta/recipes-extended/diffutils/diffutils-3.2/remove-gets.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-check for gets before using it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: diffutils-3.2/lib/stdio.in.h
-===================================================================
---- diffutils-3.2.orig/lib/stdio.in.h	2011-08-28 04:57:28.000000000 -0700
-+++ diffutils-3.2/lib/stdio.in.h	2012-07-03 10:45:07.518322117 -0700
-@@ -693,11 +693,13 @@
- _GL_CXXALIAS_SYS (gets, char *, (char *s));
- #  undef gets
- # endif
-+# if defined gets
- _GL_CXXALIASWARN (gets);
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+# endif
- #endif
- 
- 
diff --git a/meta/recipes-extended/diffutils/diffutils.inc b/meta/recipes-extended/diffutils/diffutils.inc
index c90a3c9..c2ca417 100644
--- a/meta/recipes-extended/diffutils/diffutils.inc
+++ b/meta/recipes-extended/diffutils/diffutils.inc
@@ -4,10 +4,6 @@ sdiff, and cmp utilities. These programs are usually \
 used for creating patch files."
 SECTION = "base"
 
-INC_PR = "r7"
-
-SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.gz"
-
 inherit autotools update-alternatives gettext
 
 # diffutils assumes non-glibc compilation with uclibc and
diff --git a/meta/recipes-extended/diffutils/diffutils_2.8.1.bb b/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
index da6719d..bf425bb 100644
--- a/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
+++ b/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
@@ -3,13 +3,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 require diffutils.inc
 
-PR = "${INC_PR}.0"
+PR = "r7.0"
 
-SRC_URI += "file://diffutils_fix_for_automake-1.12.patch"
+SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.gz \
+           file://diffutils_fix_for_automake-1.12.patch"
 
 SRC_URI[md5sum] = "71f9c5ae19b60608f6c7f162da86a428"
 SRC_URI[sha256sum] = "c5001748b069224dd98bf1bb9ee877321c7de8b332c8aad5af3e2a7372d23f5a"
 
 do_configure_prepend () {
 	chmod u+w ${S}/po/Makefile.in.in
-}
\ No newline at end of file
+}
diff --git a/meta/recipes-extended/diffutils/diffutils_3.2.bb b/meta/recipes-extended/diffutils/diffutils_3.3.bb
similarity index 59%
rename from meta/recipes-extended/diffutils/diffutils_3.2.bb
rename to meta/recipes-extended/diffutils/diffutils_3.3.bb
index ef400ef..7a95c1a 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.2.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.3.bb
@@ -3,6 +3,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 require diffutils.inc
 
+SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz"
+
 do_configure_prepend () {
 	# Need to remove gettext macros with weird mix of versions
 	for i in codeset.m4 gettext_gl.m4 intlmacosx.m4 inttypes-pri.m4 lib-ld_gl.m4 lib-prefix_gl.m4 po_gl.m4 ssize_t.m4 wchar_t.m4 wint_t.m4; do
@@ -10,11 +12,5 @@ do_configure_prepend () {
 	done
 }
 
-PR = "${INC_PR}.1"
-
-SRC_URI += "file://remove-gets.patch \
-            file://obsolete_automake_macros.patch \
-"
-
-SRC_URI[md5sum] = "22e4deef5d8949a727b159d6bc65c1cc"
-SRC_URI[sha256sum] = "2aaaebef615be7dc365306a14caa5d273a4fc174f9f10abca8b60e082c054ed3"
+SRC_URI[md5sum] = "99180208ec2a82ce71f55b0d7389f1b3"
+SRC_URI[sha256sum] = "a25e89a8ab65fded1731e4186be1bb25cda967834b6df973599cdcd5abdfc19c"
-- 
1.7.9.5


