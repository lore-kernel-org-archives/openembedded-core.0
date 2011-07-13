Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qgu1F-0003mE-U5
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 09:38:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jul 2011 00:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="25272074"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.40])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2011 00:34:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 00:33:50 -0700
Message-Id: <abb1f53d669bfc2f04a38d947f88485b8ea39fec.1310541680.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
Subject: [PATCH V2 18/25] opkg: Use bitbake default FILES for packaging
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
X-List-Received-Date: Wed, 13 Jul 2011 07:38:06 -0000

This will ensure correct -dev and -staticdev packging

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/opkg/opkg_0.1.8.bb |   10 ++++++----
 meta/recipes-devtools/opkg/opkg_svn.bb   |   10 ++++++----
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.1.8.bb b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
index 18cf042..f43cbc5 100644
--- a/meta/recipes-devtools/opkg/opkg_0.1.8.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
@@ -13,13 +13,15 @@ SRC_URI = "http://opkg.googlecode.com/files/opkg-${PV}.tar.gz \
            file://headerfix.patch \
 "
 
-PR = "r4"
+PR = "r5"
 
-PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
+PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX}-staticdev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
 
 FILES_update-alternatives-cworth${PKGSUFFIX} = "${bindir}/update-alternatives"
-FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so"
-FILES_libopkg${PKGSUFFIX} = "${libdir}/*.so.* ${localstatedir}/lib/opkg/"
+FILES_libopkg${PKGSUFFIX} = "${libdir}/*${SOLIBS} ${localstatedir}/lib/opkg/"
+FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.la ${libdir}/*${SOLIBSDEV}"
+FILES_libopkg${PKGSUFFIX}-staticdev = "${libdir}/*.a"
+RDEPENDS_libopkg${PKGSUFFIX}-staticdev = "libopkg${PKGSUFFIX}-dev (= ${EXTENDPKGV})"
 
 # We need to create the lock directory
 do_install_append() {
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 5f07c17..6f81419 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -17,13 +17,15 @@ S = "${WORKDIR}/trunk"
 
 SRCREV = "609"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
-PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
+PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX}-staticdev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
 
 FILES_update-alternatives-cworth${PKGSUFFIX} = "${bindir}/update-alternatives"
-FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so"
-FILES_libopkg${PKGSUFFIX} = "${libdir}/*.so.* ${localstatedir}/lib/opkg/"
+FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.la ${libdir}/*${SOLIBSDEV}"
+FILES_libopkg${PKGSUFFIX}-staticdev = "${libdir}/*.a"
+RDEPENDS_libopkg${PKGSUFFIX}-staticdev = "libopkg${PKGSUFFIX}-dev (= ${EXTENDPKGV})"
+FILES_libopkg${PKGSUFFIX} = "${libdir}/*${SOLIBS} ${localstatedir}/lib/opkg/"
 
 # We need to create the lock directory
 do_install_append() {
-- 
1.7.3.4



