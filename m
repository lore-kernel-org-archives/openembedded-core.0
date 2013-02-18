Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U7Phg-0006Mx-PN
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 13:20:50 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Feb 2013 04:04:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,687,1355126400"; d="scan'208";a="287136036"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga002.jf.intel.com with ESMTP; 18 Feb 2013 04:04:07 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 14:05:09 +0200
Message-Id: <1361189109-2869-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] augeas: upgrade to 1.0.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2013 12:20:53 -0000

0001-Add-missing-argument-to-escape.patch: removed
    - included in the new version

remove-gets.patch: not needed anymore

add-missing-argz-conditional.patch: added
    - the Makefiles assume that the argz conditional
is present in configure.ac

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-extended/augeas/augeas.inc            |  2 +-
 .../0001-Add-missing-argument-to-escape.patch      | 29 ---------------------
 ...ts.patch => add-missing-argz-conditional.patch} | 30 +++++++++++-----------
 meta/recipes-extended/augeas/augeas_0.10.0.bb      |  8 ------
 meta/recipes-extended/augeas/augeas_1.0.0.bb       |  6 +++++
 5 files changed, 22 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-extended/augeas/augeas/0001-Add-missing-argument-to-escape.patch
 rename meta/recipes-extended/augeas/augeas/{remove-gets.patch => add-missing-argz-conditional.patch} (12%)
 delete mode 100644 meta/recipes-extended/augeas/augeas_0.10.0.bb
 create mode 100644 meta/recipes-extended/augeas/augeas_1.0.0.bb

diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-extended/augeas/augeas.inc
index 479fb97..a0aa9dd 100644
--- a/meta/recipes-extended/augeas/augeas.inc
+++ b/meta/recipes-extended/augeas/augeas.inc
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
 
 SRC_URI = "http://augeas.net/download/${BP}.tar.gz \
-           file://0001-Add-missing-argument-to-escape.patch \
+           file://add-missing-argz-conditional.patch \
           "
 
 DEPENDS = "readline libxml2"
diff --git a/meta/recipes-extended/augeas/augeas/0001-Add-missing-argument-to-escape.patch b/meta/recipes-extended/augeas/augeas/0001-Add-missing-argument-to-escape.patch
deleted file mode 100644
index 3d0d0e3..0000000
--- a/meta/recipes-extended/augeas/augeas/0001-Add-missing-argument-to-escape.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-From 021ea39f8e400225e2d01b4c62eb9d56404f2ecd Mon Sep 17 00:00:00 2001
-From: Michael Chapman <mike@very.puzzling.org>
-Date: Fri, 16 Dec 2011 21:30:07 +1100
-Subject: [PATCH] Add missing argument to escape()
-
-Fixes ticket #242.
----
- src/regexp.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/src/regexp.c b/src/regexp.c
-index cf0ea5d..811087d 100644
---- a/src/regexp.c
-+++ b/src/regexp.c
-@@ -50,7 +50,7 @@ char *regexp_escape(const struct regexp *r) {
-     ret = fa_restrict_alphabet(r->pattern->str, strlen(r->pattern->str),
-                                &nre, &nre_len, 2, 1);
-     if (ret == 0) {
--        pat = escape(nre, nre_len);
-+        pat = escape(nre, nre_len, RX_ESCAPES);
-         free(nre);
-     }
- #endif
--- 
-1.7.5.4
-
diff --git a/meta/recipes-extended/augeas/augeas/remove-gets.patch b/meta/recipes-extended/augeas/augeas/add-missing-argz-conditional.patch
similarity index 12%
rename from meta/recipes-extended/augeas/augeas/remove-gets.patch
rename to meta/recipes-extended/augeas/augeas/add-missing-argz-conditional.patch
index bd6e92c..abbdbaa 100644
--- a/meta/recipes-extended/augeas/augeas/remove-gets.patch
+++ b/meta/recipes-extended/augeas/augeas/add-missing-argz-conditional.patch
@@ -1,20 +1,20 @@
-eglibc 2.16 has remove gets so check for it to be there before using it
+Add missing GL_GENERATE_ARGZ_H conditional
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+- GL_GENERATE_ARGZ_H is used in gnulib/lib/Makefile.am
 
 Upstream-Status: Pending
-Index: augeas-0.10.0/gnulib/lib/stdio.in.h
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Index: augeas-1.0.0/configure.ac
 ===================================================================
---- augeas-0.10.0.orig/gnulib/lib/stdio.in.h	2011-03-03 17:07:59.000000000 -0800
-+++ augeas-0.10.0/gnulib/lib/stdio.in.h	2012-07-03 19:46:42.871894833 -0700
-@@ -161,8 +161,10 @@
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
-+#if defined gets
- #undef gets
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+#endif
+--- augeas-1.0.0.orig/configure.ac
++++ augeas-1.0.0/configure.ac
+@@ -55,6 +55,8 @@ AC_ARG_WITH([failmalloc],
+ 
+ AM_CONDITIONAL([WITH_FAILMALLOC], [test x$with_failmalloc != xno])
  
- #if @GNULIB_FOPEN@
- # if @REPLACE_FOPEN@
++AM_CONDITIONAL([GL_GENERATE_ARGZ_H], [test -n "$ARGZ_H"])
++
+ dnl --enable-debug=(yes|no)
+ AC_ARG_ENABLE([debug],
+               [AC_HELP_STRING([--enable-debug=no/yes],
diff --git a/meta/recipes-extended/augeas/augeas_0.10.0.bb b/meta/recipes-extended/augeas/augeas_0.10.0.bb
deleted file mode 100644
index 0840428..0000000
--- a/meta/recipes-extended/augeas/augeas_0.10.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require augeas.inc
-
-SRC_URI += "file://remove-gets.patch \
-           "
-PR = "r3"
-
-SRC_URI[md5sum] = "fe1834e90a066c3208ac0214622c7352"
-SRC_URI[sha256sum] = "ec111af06186216930176ebe5ecccdf7bf528528aee9acde1d5d70088484afca"
diff --git a/meta/recipes-extended/augeas/augeas_1.0.0.bb b/meta/recipes-extended/augeas/augeas_1.0.0.bb
new file mode 100644
index 0000000..2f7061a
--- /dev/null
+++ b/meta/recipes-extended/augeas/augeas_1.0.0.bb
@@ -0,0 +1,6 @@
+require augeas.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "82131019432ecf8102e1491610ad2dd1"
+SRC_URI[sha256sum] = "31bf757c5b8197765946b3805f3793c32b03cd92a7a77ec95d37e71a1f131912"
-- 
1.7.11.7



