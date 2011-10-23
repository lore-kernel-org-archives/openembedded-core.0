Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RI2rT-0005xS-OY
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 20:33:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2011 11:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="66250244"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.219])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2011 11:27:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2011 11:26:57 -0700
Message-Id: <bed0d2b264db3ed9c76c64d2f4936ebb4e8326c9.1319394187.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/27] coreutils: Upgrade recipe 8.12 -> 8.14
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
X-List-Received-Date: Sun, 23 Oct 2011 18:33:32 -0000

From: Khem Raj <raj.khem@gmail.com>

Change in site files is needed since in cross
build envrionment the test to check for
gl_cv_func_fstatat_zero_flag is a runtime test

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../remove-usr-local-lib-from-m4.patch             |   18 +++++++++---------
 .../{coreutils_8.12.bb => coreutils_8.14.bb}       |   11 ++++++-----
 meta/site/common-linux                             |    3 +++
 3 files changed, 18 insertions(+), 14 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils-8.12 => coreutils-8.14}/remove-usr-local-lib-from-m4.patch (65%)
 rename meta/recipes-core/coreutils/{coreutils_8.12.bb => coreutils_8.14.bb} (90%)

diff --git a/meta/recipes-core/coreutils/coreutils-8.12/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-lib-from-m4.patch
similarity index 65%
rename from meta/recipes-core/coreutils/coreutils-8.12/remove-usr-local-lib-from-m4.patch
rename to meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-lib-from-m4.patch
index aac097a..2ef8a54 100644
--- a/meta/recipes-core/coreutils/coreutils-8.12/remove-usr-local-lib-from-m4.patch
+++ b/meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-lib-from-m4.patch
@@ -8,24 +8,24 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Inappropriate [Upstream does care for AIX while we may not]
 
-Index: coreutils-8.12/m4/getloadavg.m4
+Index: coreutils-8.14/m4/getloadavg.m4
 ===================================================================
---- coreutils-8.12.orig/m4/getloadavg.m4	2011-08-03 14:03:59.982197767 -0700
-+++ coreutils-8.12/m4/getloadavg.m4	2011-08-03 14:04:20.402197763 -0700
-@@ -44,16 +44,6 @@ AC_CHECK_FUNC([getloadavg], [],
-        [LIBS="-lutil $LIBS" gl_have_func=yes])
+--- coreutils-8.14.orig/m4/getloadavg.m4	2011-09-19 08:09:24.000000000 -0700
++++ coreutils-8.14/m4/getloadavg.m4	2011-10-19 21:42:00.385533357 -0700
+@@ -41,16 +41,6 @@
+        [LIBS="-lutil $LIBS" gl_func_getloadavg_done=yes])
     fi
  
--   if test $gl_have_func = no; then
+-   if test $gl_func_getloadavg_done = no; then
 -     # There is a commonly available library for RS/6000 AIX.
 -     # Since it is not a standard part of AIX, it might be installed locally.
 -     gl_getloadavg_LIBS=$LIBS
 -     LIBS="-L/usr/local/lib $LIBS"
 -     AC_CHECK_LIB([getloadavg], [getloadavg],
--                  [LIBS="-lgetloadavg $LIBS" gl_have_func=yes],
+-                  [LIBS="-lgetloadavg $LIBS" gl_func_getloadavg_done=yes],
 -                  [LIBS=$gl_getloadavg_LIBS])
 -   fi
 -
     # Set up the replacement function if necessary.
-    if test $gl_have_func = no; then
-      AC_LIBOBJ([getloadavg])
+    if test $gl_func_getloadavg_done = no; then
+      HAVE_GETLOADAVG=0
diff --git a/meta/recipes-core/coreutils/coreutils_8.12.bb b/meta/recipes-core/coreutils/coreutils_8.14.bb
similarity index 90%
rename from meta/recipes-core/coreutils/coreutils_8.12.bb
rename to meta/recipes-core/coreutils/coreutils_8.14.bb
index 0004ce7..f3b7af7 100644
--- a/meta/recipes-core/coreutils/coreutils_8.12.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
@@ -7,18 +7,17 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
-PR = "r3"
+PR = "r0"
 DEPENDS = "gmp"
 DEPENDS_virtclass-native = ""
 
 inherit autotools gettext
 
-SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
           "
-
-SRC_URI[md5sum] = "fce7999953a67243d00d75cc86dbcaa6"
-SRC_URI[sha256sum] = "9e233a62c98a3378a7b0483d2ae3d662dbaf6cd3917d3830d3514665e12a85c8"
+SRC_URI[md5sum] = "bcb135ce553493a45aba01b39eb3920a"
+SRC_URI[sha256sum] = "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb116cf82b65d18b02d"
 
 EXTRA_OECONF_virtclass-native = "--without-gmp"
 
@@ -49,6 +48,8 @@ do_install_append() {
 	# in update-alternatives to fail, therefore use lbracket - the name used
 	# for the actual source file.
 	mv ${D}${bindir}/[ ${D}${bindir}/lbracket.${PN}
+	install -d ${D}${libdir}/coreutils
+	mv ${D}${libexecdir}/coreutils/libstdbuf.so ${D}${libdir}/coreutils
 }
 
 pkg_postinst_${PN} () {
diff --git a/meta/site/common-linux b/meta/site/common-linux
index 00ac717..947ed5b 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -34,6 +34,9 @@ bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
 bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
 bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
 
+# coreutils
+gl_cv_func_fstatat_zero_flag=${gl_cv_func_fstatat_zero_flag=yes}
+
 # mysql
 ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
 ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
-- 
1.7.6.4



