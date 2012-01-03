Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrN-0004lf-RT
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:34 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752244"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:06 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:56 -0800
Message-Id: <674faf66794e278284a128ca570d18d2d0702ad8.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 070/113] boost: Update to 1.48 and Clean ups
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:34 -0000

There were 2 "BJAM_OPTS =" in the .bb and .inc, the .inc was being
overwritten and the ICU dependency was not removed correctly.

Do some clean-up including moving install_append into do_install
directly.

Finally the BJAM_EXTRAS += "threading=multi" was not setting set
correctly, set it on the BUILD spec line

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/boost/boost.inc       |   16 ++++++++++++----
 meta/recipes-support/boost/boost_1.47.0.bb |   27 ---------------------------
 meta/recipes-support/boost/boost_1.48.0.bb |   10 ++++++++++
 3 files changed, 22 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-support/boost/boost_1.47.0.bb
 create mode 100644 meta/recipes-support/boost/boost_1.48.0.bb

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index fc417c9..74f3e4b 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -16,7 +16,7 @@ BOOST_VER = "${@"_".join(d.getVar("PV",1).split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV",1).split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-INC_PR = "r2"
+INC_PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BOOST_P}.tar.bz2"
 
@@ -120,15 +120,14 @@ BJAM_TOOLS   = "-sTOOLS=gcc \
 		'-sGCC_STDLIB_DIRECTORY=${STAGING_LIBDIR}' \
 		'-sNO_BZIP2=1' \
 		'-sNO_ZLIB=1' \
-		'-sBUILD=release <optimization>space <inlining>on <debug-symbols>off' \
+		'-sBUILD=release <optimization>space <threading>multi <inlining>on <debug-symbols>off' \
 		'-sPYTHON_VERSION=${PYTHON_VERSION}' \
 		'--layout=system' \
 		"
 
 BJAM_OPTS    = '${BJAM_TOOLS} \
 		--builddir=${S}/${TARGET_SYS} \
-		--with-python-root=${PYTHON_ROOT} \
-		--without-icu \
+                --disable-icu \
 		${BJAM_EXTRA}'
 
 
@@ -154,6 +153,15 @@ do_install() {
 		--libdir=${D}${libdir} \
 		--includedir=${D}${includedir} \
 		install
+	for lib in ${BOOST_LIBS}; do
+		if [ -e ${D}${libdir}/libboost_${lib}.a ]; then
+			ln -s libboost_${lib}.a ${D}${libdir}/libboost_${lib}-mt.a
+		fi
+		if [ -e ${D}${libdir}/libboost_${lib}.so ]; then
+			ln -s libboost_${lib}.so ${D}${libdir}/libboost_${lib}-mt.so
+		fi
+	done
+
 }
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/boost/boost_1.47.0.bb b/meta/recipes-support/boost/boost_1.47.0.bb
deleted file mode 100644
index e1e0ca1..0000000
--- a/meta/recipes-support/boost/boost_1.47.0.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-include boost.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://arm-intrinsics.patch"
-
-SRC_URI[md5sum] = "a2dc343f7bc7f83f8941e47ed4a18200"
-SRC_URI[sha256sum] = "815a5d9faac4dbd523fbcf3fe1065e443c0bbf43427c44aa423422c6ec4c2e31"
-
-BJAM_OPTS    = '${BJAM_TOOLS} \
-                --builddir=${S}/${TARGET_SYS} \
-                ${BJAM_EXTRA}'
-
-# build only mt libraries and install symlinks for compatibility
-BJAM_EXTRA += "threading=multi"
-do_install_append() {
-	for lib in ${BOOST_LIBS}; do
-	    if [ -e ${D}${libdir}/libboost_${lib}.a ]; then
-		ln -s libboost_${lib}.a ${D}${libdir}/libboost_${lib}-mt.a
-	    fi
-	    if [ -e ${D}${libdir}/libboost_${lib}.so ]; then
-		ln -s libboost_${lib}.so ${D}${libdir}/libboost_${lib}-mt.so
-	    fi
-	done
-}
diff --git a/meta/recipes-support/boost/boost_1.48.0.bb b/meta/recipes-support/boost/boost_1.48.0.bb
new file mode 100644
index 0000000..29e2153
--- /dev/null
+++ b/meta/recipes-support/boost/boost_1.48.0.bb
@@ -0,0 +1,10 @@
+include boost.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://arm-intrinsics.patch"
+
+SRC_URI[md5sum] = "d1e9a7a7f532bb031a3c175d86688d95"
+SRC_URI[sha256sum] = "1bf254b2d69393ccd57a3cdd30a2f80318a005de8883a0792ed2f5e2598e5ada"
-- 
1.7.6.4



