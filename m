Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1T48Ym-0005zZ-0z
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 12:53:16 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by fmsmga102.fm.intel.com with ESMTP; 22 Aug 2012 03:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,808,1336374000"; d="scan'208";a="136780741"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Aug 2012 03:41:08 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2012 13:43:29 +0300
Message-Id: <1345632209-4188-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] coreutils: Upgrade to upstream version 8.17
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
X-List-Received-Date: Wed, 22 Aug 2012 10:53:16 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../coreutils-8.17/realpath-works-yes.patch        |   21 ++++++++++++++++++++
 .../remove-gets.patch                              |   20 ++++++++++---------
 .../remove-usr-local-lib-from-m4.patch             |    0
 .../{coreutils_8.14.bb => coreutils_8.17.bb}       |    9 +++++----
 4 files changed, 37 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
 rename meta/recipes-core/coreutils/{coreutils-8.14 => coreutils-8.17}/remove-gets.patch (47%)
 rename meta/recipes-core/coreutils/{coreutils-8.14 => coreutils-8.17}/remove-usr-local-lib-from-m4.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils_8.14.bb => coreutils_8.17.bb} (91%)

diff --git a/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
new file mode 100644
index 0000000..e32f612
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
@@ -0,0 +1,21 @@
+Signed-off-by: Radu Moisan <radu.moisan@intel.com>
+Upstream status: pending
+
+The new version of coreutils, adds use of canonicalize_file_name() function defined in canonicalize.h
+The problem: the function is redefined to rpl_canonicalize_file_name by means of a macro,which gives
+an undefined reference error at compile time. Macro definition depends in the end on 
+gl_cv_func_realpath_works but assumed true only when set to "yes" 
+
+Index: coreutils-8.17/m4/canonicalize.m4
+===================================================================
+--- coreutils-8.17.orig/m4/canonicalize.m4	2012-05-08 12:05:23.000000000 +0300
++++ coreutils-8.17/m4/canonicalize.m4	2012-08-17 14:20:22.000000000 +0300
+@@ -95,7 +95,7 @@
+      [gl_cv_func_realpath_works=no],
+      [case "$host_os" in
+                 # Guess yes on glibc systems.
+-        *-gnu*) gl_cv_func_realpath_works="guessing yes" ;;
++        *-gnu*) gl_cv_func_realpath_works="yes" ;;
+                 # If we don't know, assume the worst.
+         *)      gl_cv_func_realpath_works="guessing no" ;;
+       esac
diff --git a/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch b/meta/recipes-core/coreutils/coreutils-8.17/remove-gets.patch
similarity index 47%
rename from meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
rename to meta/recipes-core/coreutils/coreutils-8.17/remove-gets.patch
index 4f61c92..eaadf7e 100644
--- a/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
+++ b/meta/recipes-core/coreutils/coreutils-8.17/remove-gets.patch
@@ -3,19 +3,21 @@ use gets iff its defined. eglibc 2.16 removed gets
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
-Index: coreutils-8.14/lib/stdio.in.h
+Index: coreutils-8.17/lib/stdio.in.h
 ===================================================================
---- coreutils-8.14.orig/lib/stdio.in.h	2011-09-24 04:20:48.000000000 -0700
-+++ coreutils-8.14/lib/stdio.in.h	2012-07-03 10:36:19.886296576 -0700
-@@ -713,11 +713,13 @@
- _GL_CXXALIAS_SYS (gets, char *, (char *s));
- #  undef gets
+--- coreutils-8.17.orig/lib/stdio.in.h
++++ coreutils-8.17/lib/stdio.in.h
+@@ -698,13 +698,14 @@ _GL_WARN_ON_USE (getline, "getline is un
+                  "use gnulib module getline for portability");
  # endif
+ #endif
+-
 +# if defined gets
- _GL_CXXALIASWARN (gets);
  /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
+    so any use of gets warrants an unconditional warning; besides, C11
+    removed it.  */
+ #undef gets
+ #if HAVE_RAW_DECL_GETS
  _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
 +# endif
  #endif
diff --git a/meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils-8.17/remove-usr-local-lib-from-m4.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-lib-from-m4.patch
rename to meta/recipes-core/coreutils/coreutils-8.17/remove-usr-local-lib-from-m4.patch
diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.17.bb
similarity index 91%
rename from meta/recipes-core/coreutils/coreutils_8.14.bb
rename to meta/recipes-core/coreutils/coreutils_8.17.bb
index 9a714a9..9d8170e 100644
--- a/meta/recipes-core/coreutils/coreutils_8.14.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.17.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
-                    file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
-PR = "r5"
+                    file://src/ls.c;startline=5;endline=16;md5=30c84fd2942cad91041e5e2dcd19ced6"
+PR = "r0"
 DEPENDS = "gmp libcap"
 DEPENDS_virtclass-native = ""
 
@@ -16,9 +16,10 @@ inherit autotools gettext
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://remove-gets.patch \
+           file://realpath-works-yes.patch \
           "
-SRC_URI[md5sum] = "bcb135ce553493a45aba01b39eb3920a"
-SRC_URI[sha256sum] = "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb116cf82b65d18b02d"
+SRC_URI[md5sum] = "bbda656ce8ca2c6903948f9faa204ba3"
+SRC_URI[sha256sum] = "4e075a0d238072a5bd079046e1f024dc5e0d9133d43a39c73d0b86b0d1e2c5e5"
 
 EXTRA_OECONF_virtclass-native = "--without-gmp"
 
-- 
1.7.9.5



