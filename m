Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QgPjS-0005ba-6a
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 01:17:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jul 2011 16:13:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,517,1304319600"; d="scan'208";a="26491839"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2011 16:13:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 16:13:29 -0700
Message-Id: <8b4139e21f5a109d01c518808deb49441293bbbf.1310425837.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
Subject: [PATCH 22/26] gcc: Use bitbake default FILES for packaging
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
 meta/recipes-devtools/gcc/gcc-package-runtime.inc |   25 +++++++++++++++------
 meta/recipes-devtools/gcc/libgcc_4.6.bb           |    2 +-
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
index 7ac68f2..fafb655 100644
--- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
@@ -3,14 +3,19 @@ PACKAGES = "\
   libstdc++ \
   libstdc++-precompile-dev \
   libstdc++-dev \
+  libstdc++-staticdev \
   libg2c \
   libg2c-dev \
+  libg2c-staticdev \
   libssp \
   libssp-dev \
+  libssp-staticdev \
   libgfortran \
   libgfortran-dev \
+  libgfortran-staticdev \
   libmudflap \
   libmudflap-dev \
+  libmudflap-staticdev \
 "
 # The base package doesn't exist, so we clear the recommends.
 RRECOMMENDS_${PN}-dbg = ""
@@ -23,36 +28,42 @@ FILES_${PN}-dbg += "\
 FILES_libg2c = "${target_libdir}/libg2c.so.*"
 FILES_libg2c-dev = "\
   ${libdir}/libg2c.so \
+FILES_libg2c-staticdev = "\
   ${libdir}/libg2c.a \
   ${libdir}/libfrtbegin.a"
-
+RDEPENDS_libg2c-staticdev = "libg2c-dev (= ${EXTENDPKGV})"
 FILES_libstdc++ = "${libdir}/libstdc++.so.*"
 FILES_libstdc++-dev = "\
   ${includedir}/c++/ \
   ${libdir}/libstdc++.so \
   ${libdir}/libstdc++.la \
-  ${libdir}/libstdc++.a \
   ${libdir}/libsupc++.la \
+FILES_libstdc++-staticdev = " \
+  ${libdir}/libstdc++.a \
   ${libdir}/libsupc++.a"
+RDEPENDS_libstdc++-staticdev = "libstdc++-dev (= ${EXTENDPKGV})"
 
 FILES_libstdc++-precompile-dev = "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
 
 FILES_libssp = "${libdir}/libssp.so.*"
 FILES_libssp-dev = " \
   ${libdir}/libssp*.so \
-  ${libdir}/libssp*.a \
   ${libdir}/libssp*.la \
+  ${libdir}/libssp_nonshared.a \
   ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp"
+FILES_libssp-staticdev = "${libdir}/libssp.a"
+RDEPENDS_libssp-staticdev = "libssp-dev (= ${EXTENDPKGV})"
 
 FILES_libgfortran = "${libdir}/libgfortran.so.*"
-FILES_libgfortran-dev = " \
+FILES_libgfortran-dev = "${libdir}/libgfortran.so"
+FILES_libgfortran-staticdev = " \
   ${libdir}/libgfortran.a \
-  ${libdir}/libgfortran.so \
   ${libdir}/libgfortranbegin.a"
+RDEPENDS_libfortran-staticdev = "libfortran-dev (= ${EXTENDPKGV})"
 
 FILES_libmudflap = "${libdir}/libmudflap*.so.*"
 FILES_libmudflap-dev = "\
   ${libdir}/libmudflap*.so \
-  ${libdir}/libmudflap*.a \
   ${libdir}/libmudflap*.la"
-
+FILES_libmudflap-staticdev = "${libdir}/libmudflap*.a"
+RDEPENDS_libmudflap-staticdev = "libmudflap-dev (= ${EXTENDPKGV})"
diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devtools/gcc/libgcc_4.6.bb
index b0523c7..71130bf 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
@@ -1,6 +1,6 @@
 require gcc-${PV}.inc
 
-PR = "r0"
+PR = "r1"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
-- 
1.7.3.4



