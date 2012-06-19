Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11O-00028G-FQ
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520305"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 09:00:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:34 -0700
Message-Id: <bca5a92916633538fc7f7f42004b4c52d6f109ef.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 16/39] libpng: clean up FILE after PACKAGE reorder
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:15 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.148.bb |   12 ++++++++----
 meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb  |    6 ++++--
 meta/recipes-multimedia/libpng/libpng_1.2.49.bb  |    4 +---
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 225627b..90bc308 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
                     file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
 DEPENDS = "libtool bzip2 zlib"
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
 
@@ -74,8 +74,12 @@ FILES_${PN}-binutils = "\
     ${bindir}/eu-readelf \
     ${bindir}/eu-size \
     ${bindir}/eu-strip"
-# Fix library issues
-FILES_${PN} =+ "${libdir}/*-${PV}.so"
 
-# The elfutils package contains symlinks that trip up insane
+# Some packages have the version preceeding the .so instead properly
+# versioned .so.<version>, so we need to reorder and repackage.
+FILES_${PN} += "${libdir}/*-${PV}.so ${base_libdir}/*-${PV}.so"
+FILES_SOLIBSDEV = "${libdir}/libasm.so ${libdir}/libdw.so ${libdir}/libelf.so"
+
+# The package contains symlinks that trip up insane
 INSANE_SKIP_${PN} = "dev-so"
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
index b128d77..08da5cd 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
@@ -14,7 +14,7 @@ BBCLASSEXTEND = "native nativesdk"
 #FIXME: remove the following
 ARM_INSTRUCTION_SET = "arm"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
            file://fix-tstamp-declaration.patch"
@@ -35,7 +35,9 @@ PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
 PACKAGES =+ "alsa-server${PKGSUFFIX} libasound${PKGSUFFIX} alsa-conf-base${PKGSUFFIX} alsa-conf${PKGSUFFIX} alsa-doc${PKGSUFFIX} alsa-dev${PKGSUFFIX}"
-FILES_${PN}-dbg += "${libdir}/alsa-lib/*/.debu*"
+FILES_${PN} += "${libdir}/${BPN}/smixer/*.so"
+FILES_${PN}-dbg += "${libdir}/${BPN}/smixer/.debug"
+FILES_${PN}-dev += "${libdir}/${BPN}/smixer/*.la"
 FILES_libasound${PKGSUFFIX} = "${libdir}/libasound.so.*"
 FILES_alsa-server${PKGSUFFIX} = "${bindir}/*"
 FILES_alsa-conf${PKGSUFFIX} = "${datadir}/alsa/"
diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.49.bb b/meta/recipes-multimedia/libpng/libpng_1.2.49.bb
index c24e691..d33a9f5 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.2.49.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.2.49.bb
@@ -6,7 +6,7 @@ LICENSE = "Libpng"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20110633230abd47fe8680afa75f1492 \
                     file://png.h;startline=308;endline=422;md5=edd1c552386a8c3773d90e278ae30891"
 DEPENDS = "zlib"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.bz2"
 
@@ -18,8 +18,6 @@ inherit autotools binconfig pkgconfig
 PACKAGES =+ "${PN}12"
 
 FILES_${PN}12 = "${libdir}/libpng12${SOLIBS}"
-FILES_${PN} = "${libdir}/lib*${SOLIBS}"
-FILES_${PN}-dev += " ${bindir} ${sbindir}"
 RPROVIDES_${PN}-dev += "${PN}12-dev"
 
 BBCLASSEXTEND = "native"
-- 
1.7.7.6



