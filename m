Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rfz2U-0005ij-Ci
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 20:19:50 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Dec 2011 11:12:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="90309408"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.80])
	by azsmga001.ch.intel.com with ESMTP; 28 Dec 2011 11:12:35 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 11:12:25 -0800
Message-Id: <2aee382df36582e7c5ae0953e72296fd1218c0ff.1325099431.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325099430.git.sgw@linux.intel.com>
References: <cover.1325099430.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325099430.git.sgw@linux.intel.com>
References: <cover.1325099430.git.sgw@linux.intel.com>
Subject: [PATCH 4/6] boost: Cleanup multiple BJAM_OPTS
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
X-List-Received-Date: Wed, 28 Dec 2011 19:19:50 -0000

There were 2 BJAM_OPTS = in the .bb and .inc, the .inc was being
overwritten and the ICU dependency was not removed correctly.

Do some clean-up including moving install_append into do_install
directly.

Finally the BJAM_EXTRAS += "threading=multi" was un-needed, since
that is the default

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/boost/boost.inc       |   11 ++++++++++-
 meta/recipes-support/boost/boost_1.47.0.bb |   17 -----------------
 2 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index aa577b3..d7ca00b 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -16,7 +16,7 @@ BOOST_VER = "${@"_".join(d.getVar("PV",1).split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV",1).split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BOOST_P}.tar.bz2"
 
@@ -153,6 +153,15 @@ do_install() {
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
index e1e0ca1..333fdb1 100644
--- a/meta/recipes-support/boost/boost_1.47.0.bb
+++ b/meta/recipes-support/boost/boost_1.47.0.bb
@@ -8,20 +8,3 @@ SRC_URI += "file://arm-intrinsics.patch"
 
 SRC_URI[md5sum] = "a2dc343f7bc7f83f8941e47ed4a18200"
 SRC_URI[sha256sum] = "815a5d9faac4dbd523fbcf3fe1065e443c0bbf43427c44aa423422c6ec4c2e31"
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
-- 
1.7.6.4



