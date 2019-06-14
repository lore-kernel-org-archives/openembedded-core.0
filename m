Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 060A87E780
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 16:45:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5EGjlIC014364
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 09:45:47 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 14 Jun 2019 09:45:46 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Jun 2019 12:45:40 -0400
Message-ID: <20190614164542.7178-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190614164542.7178-1-Randy.MacLeod@windriver.com>
References: <7dfc2889b06074410d65ec1a2cda992a12e6a80a.camel@linuxfoundation.org>
	<20190614164542.7178-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] libcap-ng: split into libcap-ng/libcap-ng-python
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
X-List-Received-Date: Fri, 14 Jun 2019 16:45:46 -0000
Content-Type: text/plain

util-linux's setpriv needs the libcap-ng library but
not the python package so split the package up to enable
this without a dependency loop.

Add libcap-ng-python to mainatiners.inc.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/recipes-support/libcap-ng/libcap-ng      |  1 +
 .../python.patch                              |  0
 .../libcap-ng/libcap-ng-python_0.7.9.bb       | 27 ++++++++++++++++++
 meta/recipes-support/libcap-ng/libcap-ng.inc  | 17 +++++++++++
 .../libcap-ng/libcap-ng_0.7.9.bb              | 28 +++----------------
 6 files changed, 50 insertions(+), 24 deletions(-)
 create mode 120000 meta/recipes-support/libcap-ng/libcap-ng
 rename meta/recipes-support/libcap-ng/{libcap-ng => libcap-ng-python}/python.patch (100%)
 create mode 100644 meta/recipes-support/libcap-ng/libcap-ng-python_0.7.9.bb
 create mode 100644 meta/recipes-support/libcap-ng/libcap-ng.inc

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 40c93107c8..3a109b5aea 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -312,6 +312,7 @@ RECIPE_MAINTAINER_pn-libatomic-ops = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libbsd = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libcap = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libcap-ng = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER_pn-libcap-ng-python = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libcgroup = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libcheck = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libcomps = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng b/meta/recipes-support/libcap-ng/libcap-ng
new file mode 120000
index 0000000000..fb7744d293
--- /dev/null
+++ b/meta/recipes-support/libcap-ng/libcap-ng
@@ -0,0 +1 @@
+libcap-ng-python
\ No newline at end of file
diff --git a/meta/recipes-support/libcap-ng/libcap-ng/python.patch b/meta/recipes-support/libcap-ng/libcap-ng-python/python.patch
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng/python.patch
rename to meta/recipes-support/libcap-ng/libcap-ng-python/python.patch
diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.7.9.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.7.9.bb
new file mode 100644
index 0000000000..e49b445f57
--- /dev/null
+++ b/meta/recipes-support/libcap-ng/libcap-ng-python_0.7.9.bb
@@ -0,0 +1,27 @@
+require libcap-ng.inc
+
+SUMMARY .= " - python"
+
+inherit lib_package autotools python3native
+
+DEPENDS += "libcap-ng python3 swig-native"
+
+S = "${WORKDIR}/libcap-ng-${PV}"
+
+EXTRA_OECONF += "--with-python --with-python3"
+EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}${PYTHON_ABI}' PYINC='${STAGING_INCDIR}/${PYLIBVER}'"
+
+do_install_append() {
+    rm -rf ${D}${bindir}
+    rm -rf ${D}${libdir}/.debug
+    rm -f ${D}${libdir}/lib*
+    rm -rf ${D}${libdir}/pkgconfig
+    rm -rf ${D}${datadir}
+    rm -rf ${D}${includedir}
+}
+
+# PACKAGES = "${PN}"
+
+FILES_${PN} = "${libdir}/python${PYTHON_BASEVERSION}"
+FILES_${PN}-dbg =+ "${PYTHON_SITEPACKAGES_DIR}/.debug/_capng.so"
+
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
new file mode 100644
index 0000000000..739b91fd2e
--- /dev/null
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -0,0 +1,17 @@
+SUMMARY = "An alternate posix capabilities library"
+DESCRIPTION = "The libcap-ng library is intended to make programming \
+with POSIX capabilities much easier than the traditional libcap library."
+HOMEPAGE = "http://freecode.com/projects/libcap-ng"
+SECTION = "base"
+LICENSE = "GPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
+
+SRC_URI = "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
+           file://python.patch \
+"
+
+SRC_URI[md5sum] = "2398d695508fab9ce33668c53a89b0e9"
+SRC_URI[sha256sum] = "4a1532bcf3731aade40936f6d6a586ed5a66ca4c7455e1338d1f6c3e09221328"
+
+BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.7.9.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.7.9.bb
index aff6259db2..6e6de45494 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng_0.7.9.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng_0.7.9.bb
@@ -1,30 +1,10 @@
-SUMMARY = "An alternate posix capabilities library"
-DESCRIPTION = "The libcap-ng library is intended to make programming \
-with POSIX capabilities much easier than the traditional libcap library."
-HOMEPAGE = "http://freecode.com/projects/libcap-ng"
-SECTION = "base"
-LICENSE = "GPLv2+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
+require libcap-ng.inc
 
-SRC_URI = "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
-           file://python.patch"
+inherit lib_package autotools
 
-inherit lib_package autotools python3native
+EXTRA_OECONF += "--without-python --without-python3"
 
-SRC_URI[md5sum] = "2398d695508fab9ce33668c53a89b0e9"
-SRC_URI[sha256sum] = "4a1532bcf3731aade40936f6d6a586ed5a66ca4c7455e1338d1f6c3e09221328"
-
-DEPENDS += "swig-native python3"
-
-EXTRA_OECONF += "--with-python --with-python3"
-EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}${PYTHON_ABI}' PYINC='${STAGING_INCDIR}/${PYLIBVER}'"
-
-PACKAGES += "${PN}-python"
-
-FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
-
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 do_install_append() {
 	# Moving libcap-ng to base_libdir
-- 
2.17.0


