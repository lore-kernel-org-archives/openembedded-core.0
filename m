Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QgPjW-0005ba-2c
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 01:17:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jul 2011 16:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,517,1304319600"; d="scan'208";a="26491847"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2011 16:13:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 16:13:33 -0700
Message-Id: <bec0ee6bd47296fed4efd8e11894b0e907080b54.1310425837.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
Subject: [PATCH 26/26] binutils: Use bitbake default FILES for packaging
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
X-List-Received-Date: Mon, 11 Jul 2011 23:17:46 -0000

This will ensure correct -dev and -staticdev packging

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../binutils/binutils-cross-canadian_2.21.1.bb     |    2 +-
 meta/recipes-devtools/binutils/binutils-cross.inc  |    2 ++
 .../binutils/binutils-cross_csl-arm-2008q1.bb      |    2 +-
 .../binutils/binutils-crosssdk_2.21.1.bb           |    2 +-
 meta/recipes-devtools/binutils/binutils.inc        |    9 ++-------
 meta/recipes-devtools/binutils/binutils_2.21.1.bb  |    2 +-
 6 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb
index 7dad2a6..0a91dfb 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb
@@ -1,3 +1,3 @@
 require binutils_${PV}.bb
 require binutils-cross-canadian.inc
-PR = "r0"
+PR = "${INC_PR}.0"
diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 5a41970..87bfe5a 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -1,6 +1,8 @@
 inherit cross
 PROVIDES = "virtual/${TARGET_PREFIX}binutils"
 
+INC_PR = "r2"
+
 EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
                 --program-prefix=${TARGET_PREFIX} \
                 --disable-install-libbfd \
diff --git a/meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1.bb b/meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1.bb
index 8ab1e7f..f7a2c48 100644
--- a/meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1.bb
+++ b/meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1.bb
@@ -1,3 +1,3 @@
 require binutils_csl-arm-2008q1.bb
 require binutils-cross.inc
-PR = "r1"
+PR = "${INC_PR}.0"
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb
index 0d6efff..3886d85 100644
--- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb
+++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb
@@ -4,7 +4,7 @@ inherit crosssdk
 
 PROVIDES = "virtual/${TARGET_PREFIX}binutils-crosssdk"
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 do_configure_prepend () {
 	sed -i 's#/usr/local/lib /lib /usr/lib#${SDKPATHNATIVE}/lib ${SDKPATHNATIVE}/usr/lib /usr/local/lib /lib /usr/lib#' ${S}/ld/configure.tgt
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 08c14b2..8085a21 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -11,6 +11,8 @@ BUGTRACKER = "http://sourceware.org/bugzilla/"
 SECTION = "devel"
 LICENSE = "GPLv3"
 
+INC_PR = "r2"
+
 DEPENDS = "flex-native bison-native zlib-native"
 
 inherit autotools gettext
@@ -22,13 +24,6 @@ FILES_${PN} = " \
 	${libdir}/lib*-*.so \
 	${prefix}/${TARGET_SYS}/bin/*"
 
-FILES_${PN}-dev = " \
-	${includedir} \
-	${libdir}/*.a \
-	${libdir}/*.la \
-	${libdir}/libbfd.so \
-	${libdir}/libopcodes.so"
-
 FILES_${PN}-symlinks = " \
 	${bindir}/addr2line \
 	${bindir}/as \
diff --git a/meta/recipes-devtools/binutils/binutils_2.21.1.bb b/meta/recipes-devtools/binutils/binutils_2.21.1.bb
index 368ec4a..a005aa6 100644
--- a/meta/recipes-devtools/binutils/binutils_2.21.1.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.21.1.bb
@@ -1,6 +1,6 @@
 require binutils.inc
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
-- 
1.7.3.4



