Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EDDF2731C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 07:24:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2A7O2g5005955
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Mar 2016 23:24:02 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Mar 2016 23:24:01 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Mar 2016 02:23:21 -0500
Message-ID: <132c0179f28f7a5ec972c236cd7c58ac88879973.1457593651.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1457593651.git.hongxu.jia@windriver.com>
References: <cover.1457593651.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 16/18] tcl: fix buildpath QA issue
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
X-List-Received-Date: Thu, 10 Mar 2016 07:24:03 -0000
Content-Type: text/plain

- Use relative path rather than absolute path to compile

- Remove build path in tclConfig.sh

- Tweak sed expression at tclConfig.sh to strict the pattern

[YOCTO #8457]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../tcltk/tcl/use-relative-path-to-compile.patch   | 52 ++++++++++++++++++++++
 meta/recipes-devtools/tcltk/tcl_8.6.4.bb           | 10 ++++-
 2 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/tcltk/tcl/use-relative-path-to-compile.patch

diff --git a/meta/recipes-devtools/tcltk/tcl/use-relative-path-to-compile.patch b/meta/recipes-devtools/tcltk/tcl/use-relative-path-to-compile.patch
new file mode 100644
index 0000000..8086eb5
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tcl/use-relative-path-to-compile.patch
@@ -0,0 +1,52 @@
+From 1d288139c184f33586de5f0013adff7b3a9d4b7c Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 1 Mar 2016 03:52:34 -0500
+Subject: [PATCH] use relative path to compile
+
+Use relative path rather than absolute path to compile
+which fix build path issue.
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.in | 4 ++--
+ configure   | 1 -
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index ef4f786..072e196 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -224,7 +224,7 @@ AR			= @AR@
+ RANLIB			= @RANLIB@
+ DTRACE			= @DTRACE@
+ SRC_DIR			= @srcdir@
+-TOP_DIR			= @TCL_SRC_DIR@
++TOP_DIR			= @srcdir@/..
+ BUILD_DIR		= @builddir@
+ GENERIC_DIR		= $(TOP_DIR)/generic
+ TOMMATH_DIR		= $(TOP_DIR)/libtommath
+@@ -737,7 +737,7 @@ ro-test: ${TCLTEST_EXE}
+ # directory after a successful build.
+ 
+ dltest.marker: ${STUB_LIB_FILE}
+-	cd dltest ; $(MAKE)
++	cd dltest ; $(MAKE) SRC_DIR=../$(SRC_DIR)/dltest
+ 
+ #--------------------------------------------------------------------------
+ # Rules for running a shell before installation
+diff --git a/configure b/configure
+index 0d7eece..97275be 100755
+--- a/configure
++++ b/configure
+@@ -1374,7 +1374,6 @@ if test "${exec_prefix}" = "NONE"; then
+     exec_prefix=$prefix
+ fi
+ # Make sure srcdir is fully qualified!
+-srcdir="`cd "$srcdir" ; pwd`"
+ TCL_SRC_DIR="`cd "$srcdir"/..; pwd`"
+ 
+ #------------------------------------------------------------------------
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb b/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
index 8e92b3e..1966148 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
@@ -22,6 +22,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://no_packages.patch \
            file://tcl-remove-hardcoded-install-path.patch \
            file://alter-includedir.patch \
+           file://use-relative-path-to-compile.patch \
            file://run-ptest \
 "
 SRC_URI[md5sum] = "d7cbb91f1ded1919370a30edd1534304"
@@ -54,8 +55,8 @@ do_install() {
 	autotools_do_install install-private-headers
 	ln -sf ./tclsh${VER} ${D}${bindir}/tclsh
 	ln -sf tclsh8.6 ${D}${bindir}/tclsh${VER}
-	sed -i "s+-L${B}+-L${STAGING_LIBDIR}+g" tclConfig.sh
-	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
+	sed -i "s,-L${B},-L${STAGING_LIBDIR},g" tclConfig.sh
+	sed -i "s,='${WORKDIR},='${STAGING_INCDIR},g" tclConfig.sh
 	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
 	sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh
 	install -d ${D}${bindir_crossscripts}
@@ -73,6 +74,11 @@ tcl_sysroot_preprocess () {
 	sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts}
 }
 
+inherit fix_buildpaths
+PACKAGE_BUILDPATH_TEXT_FILES ?= "${bindir_crossscripts}/tclConfig.sh \
+                                 ${libdir}/tclConfig.sh \
+"
+
 PACKAGES =+ "tcl-lib"
 FILES_tcl-lib = "${libdir}/libtcl8.6.so.*"
 FILES_${PN} += "${libdir}/tcl${VER} ${libdir}/tcl8.6 ${libdir}/tcl8"
-- 
1.9.1


