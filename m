Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QodKe-0008Vb-7u
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:26:04 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Aug 2011 08:21:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,310,1309762800"; 
   d="scan'208";a="3779440"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 08:21:22 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 23:19:36 +0800
Message-Id: <f016a63806ce62ab4a7250380b20e89f9c52905d.1312384552.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1312384552.git.dongxiao.xu@intel.com>
References: <cover.1312384552.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1312384552.git.dongxiao.xu@intel.com>
References: <cover.1312384552.git.dongxiao.xu@intel.com>
Subject: [PATCH 4/7] multilib: Use BPN instead of PN for style like lib${PN}
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
X-List-Received-Date: Wed, 03 Aug 2011 15:26:04 -0000

When supporting multilib, ${PN} will be extended with MLPREFIX. However
if a package name contains ${PN} with styles like lib${PN}, such
extension will cause error. Use BPN in this case.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-devtools/python/python_2.6.6.bb |    4 ++--
 meta/recipes-extended/augeas/augeas.inc      |   12 ++++++------
 meta/recipes-extended/gamin/gamin_0.1.10.bb  |    8 ++++----
 meta/recipes-support/attr/ea-acl.inc         |    2 +-
 meta/recipes-support/sqlite/sqlite3.inc      |    6 +++---
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.6.6.bb b/meta/recipes-devtools/python/python_2.6.6.bb
index f71440a..c9c1a13 100644
--- a/meta/recipes-devtools/python/python_2.6.6.bb
+++ b/meta/recipes-devtools/python/python_2.6.6.bb
@@ -116,8 +116,8 @@ FILES_${PN}-core += "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py"
 FILES_${PN}-core += "${bindir}/2to3"
 
 # package libpython2
-PACKAGES =+ "lib${PN}2"
-FILES_lib${PN}2 = "${libdir}/libpython*.so.*"
+PACKAGES =+ "lib${BPN}2"
+FILES_lib${BPN}2 = "${libdir}/libpython*.so.*"
 
 # additional stuff -dev
 
diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-extended/augeas/augeas.inc
index 619cd20..0c6d534 100644
--- a/meta/recipes-extended/augeas/augeas.inc
+++ b/meta/recipes-extended/augeas/augeas.inc
@@ -11,15 +11,15 @@ DEPENDS = "readline"
 
 inherit autotools
 
-PACKAGES =+ "${PN}-lenses lib${PN} lib${PN}-dev lib${PN}-dbg"
+PACKAGES =+ "${PN}-lenses lib${BPN} lib${BPN}-dev lib${BPN}-dbg"
 
 FILES_${PN}-lenses = "${datadir}/augeas/lenses"
-FILES_lib${PN} = "${libdir}/*.so.*"
-FILES_lib${PN}-dev = "${libdir}/*.so ${libdir}/*.a ${libdir}/*.la ${includedir} ${libdir}/pkgconfig"
-FILES_lib${PN}-dbg = "${libdir}/.debug"
+FILES_lib${BPN} = "${libdir}/*.so.*"
+FILES_lib${BPN}-dev = "${libdir}/*.so ${libdir}/*.a ${libdir}/*.la ${includedir} ${libdir}/pkgconfig"
+FILES_lib${BPN}-dbg = "${libdir}/.debug"
 
-RDEPENDS_lib${PN} += "${PN}-lenses"
-RRECOMMENDS_lib${PN} += "${PN}"
+RDEPENDS_lib${BPN} += "${PN}-lenses"
+RRECOMMENDS_lib${BPN} += "${PN}"
 
 LEAD_SONAME = "libaugeas.so"
 
diff --git a/meta/recipes-extended/gamin/gamin_0.1.10.bb b/meta/recipes-extended/gamin/gamin_0.1.10.bb
index 81b27c0..080a325 100644
--- a/meta/recipes-extended/gamin/gamin_0.1.10.bb
+++ b/meta/recipes-extended/gamin/gamin_0.1.10.bb
@@ -20,14 +20,14 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--without-python"
 
-PACKAGES += "lib${PN} lib${PN}-dev"
+PACKAGES += "lib${BPN} lib${BPN}-dev"
 FILES_${PN} = "${libexecdir}"
 FILES_${PN}-dbg += "${libexecdir}/.debug"
-FILES_lib${PN} = "${libdir}/lib*.so.*"
-FILES_lib${PN}-dev = "${includedir} ${libdir}/pkgconfig ${libdir}/lib*.la \
+FILES_lib${BPN} = "${libdir}/lib*.so.*"
+FILES_lib${BPN}-dev = "${includedir} ${libdir}/pkgconfig ${libdir}/lib*.la \
                       ${libdir}/lib*.a ${libdir}/lib*.so"
 
-RDEPENDS_lib${PN} = "${PN}"
+RDEPENDS_lib${BPN} = "${PN}"
 
 LEAD_SONAME = "libgamin-1.so"
 
diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index 9af5960..4e79421 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -16,7 +16,7 @@ do_install () {
 	oe_runmake install install-lib install-dev DIST_ROOT="${D}"
 }
 
-PACKAGES =+ "lib${PN} lib${PN}-dev lib${PN}-doc"
+PACKAGES =+ "lib${BPN} lib${BPN}-dev lib${BPN}-doc"
 
 FILES_lib${PN} = "${base_libdir}/lib*.so.*"
 
diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index a5d122d..c96c6a6 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -17,12 +17,12 @@ export config_TARGET_LINK = "${CCLD}"
 export config_TARGET_CFLAGS = "${CFLAGS}"
 export config_TARGET_LFLAGS = "${LDFLAGS}"
 
-PACKAGES = "lib${PN} lib${PN}-dev lib${PN}-doc ${PN} ${PN}-dbg"
+PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-doc ${PN} ${PN}-dbg"
 FILES_${PN} = "${bindir}/*"
 FILES_lib${PN} = "${libdir}/*.so.*"
 FILES_lib${PN}-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so \
 		       ${libdir}/pkgconfig ${includedir}"
-FILES_lib${PN}-doc = "${docdir} ${mandir} ${infodir}"
-AUTO_LIBNAME_PKGS = "lib${PN}"
+FILES_lib${BPN}-doc = "${docdir} ${mandir} ${infodir}"
+AUTO_LIBNAME_PKGS = "lib${BPN}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.1



