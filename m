Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UV7fR-0007V9-BM
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 23:56:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2013 14:37:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,546,1363158000"; d="scan'208";a="300916475"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.85])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2013 14:37:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 14:37:09 -0700
Message-Id: <283c4c012bf58f336e309f34fedb49d0b13c3e63.1366827512.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
Subject: [PATCH 16/18] glib-2.0: Update to 2.36
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
X-List-Received-Date: Wed, 24 Apr 2013 21:56:57 -0000

Remove automake patch that is now correctly supported upstream
Codegen files have moved to glib-2.0, so correct packaging and
removal.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../glib-2.0/glib-2.0/obsolete_automake_macros.patch        | 13 -------------
 .../glib-2.0/{glib-2.0_2.34.3.bb => glib-2.0_2.36.0.bb}     | 12 ++++++------
 meta/recipes-core/glib-2.0/glib.inc                         |  2 +-
 3 files changed, 7 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/obsolete_automake_macros.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.34.3.bb => glib-2.0_2.36.0.bb} (85%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/obsolete_automake_macros.patch b/meta/recipes-core/glib-2.0/glib-2.0/obsolete_automake_macros.patch
deleted file mode 100644
index 2fc4e75..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Accepted [https://bugzilla.gnome.org/show_bug.cgi?id=691011]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd glib-2.34.3/configure.ac glib-2.34.3/configure.ac
---- glib-2.34.3/configure.ac	2012-11-26 19:10:04.000000000 +0200
-+++ glib-2.34.3/configure.ac	2013-01-02 15:49:27.832183712 +0200
-@@ -291,7 +291,6 @@
- AM_CONDITIONAL(HAVE_CXX, [test "$CXX" != ""])
- AC_LANG_RESTORE
-
--AM_PROG_CC_STDC
- AM_PROG_CC_C_O
- AC_PROG_INSTALL
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.36.0.bb
similarity index 85%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.36.0.bb
index 7795524..a042972 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.36.0.bb
@@ -1,6 +1,5 @@
 require glib.inc
 
-PR = "r2"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
@@ -12,15 +11,16 @@ SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]
 SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://configure-libtool.patch \
            file://glib-2.0_fix_for_x32.patch \
-           file://obsolete_automake_macros.patch \
            file://fix-conflicting-rand.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "a4ca31e258273c3761e3de2edd607661"
-SRC_URI[sha256sum] = "855fcbf87cb93065b488358e351774d8a39177281023bae58c286f41612658a7"
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
+
+SRC_URI[md5sum] = "2047dff287473450593edecb18f79c17"
+SRC_URI[sha256sum] = "455a8abe8692c5174bcc7ffa15b96a7521a2f2f9fb47594405927c35cb9bb227"
+
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS_${PN}-ptest += "\
@@ -50,8 +50,8 @@ do_configure_prepend() {
 
 do_install_append() {
   # remove some unpackaged files
-  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyc
-  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyo
+  rm -f ${D}${datadir}/glib-2.0/codegen/*.pyc
+  rm -f ${D}${datadir}/glib-2.0/codegen/*.pyo
   # and empty dirs
   rm -rf ${D}${libdir}/gio
 
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 42c34c3..35edc4e 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -38,7 +38,7 @@ FILES_${PN}-dev += "${libdir}/glib-2.0/include \
                     ${libdir}/gio/modules/*.la"
 FILES_${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb \
                     ${libdir}/gio/modules/.debug"
-FILES_${PN}-codegen = "${libdir}/gdbus-2.0/codegen/*.py"
+FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py"
 FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d \
                                ${datadir}/bash-completion"
 
-- 
1.8.0.2



