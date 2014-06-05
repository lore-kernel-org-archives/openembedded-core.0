Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 527C66FAB1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 09:46:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jun 2014 02:46:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,980,1392192000"; d="scan'208";a="542814633"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.113])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jun 2014 02:46:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jun 2014 10:46:17 +0100
Message-Id: <dd2066377ea36f362e8ef279155bb2982c9b4dbb.1401961481.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1401961481.git.paul.eggleton@linux.intel.com>
References: <cover.1401961481.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1401961481.git.paul.eggleton@linux.intel.com>
References: <cover.1401961481.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] libxml2: fix python packaging for nativesdk
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
X-List-Received-Date: Thu, 05 Jun 2014 09:46:25 -0000

We enable the python module in nativesdk-libxml2, but the python binary
used is in the native sysroot and thus you get the module installed in
the wrong path. Even with that fixed the python files are still
unpackaged, so create an ${PN}-python package and add them to it. (This
does not affect the libxml target build at all since python is disabled
for that.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/libxml/libxml2.inc                | 11 ++++++++++-
 .../libxml/libxml2/python-sitepackages-dir.patch    | 21 +++++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/python-sitepackages-dir.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 60bb6b8..1401c73 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -19,6 +19,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://runtest.patch \
            file://run-ptest \
            file://libxml2-CVE-2014-0191-fix.patch \
+           file://python-sitepackages-dir.patch \
           "
 
 inherit autotools pkgconfig binconfig pythonnative ptest
@@ -30,6 +31,11 @@ do_configure_prepend () {
 	sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.in
 }
 
+do_configure_prepend_class-nativesdk () {
+	# Ensure we get the correct site-packages path
+	export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"
+}
+
 EXTRA_OECONF = "--without-python --without-debug --without-legacy --without-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
 EXTRA_OECONF_class-native = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma"
 EXTRA_OECONF_class-nativesdk = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma"
@@ -49,10 +55,13 @@ python populate_packages_prepend () {
         d.setVar('PKG_libxml2', '${MLPREFIX}libxml2')
 }
 
-PACKAGES += "${PN}-utils"
+PACKAGES += "${PN}-utils ${PN}-python"
 
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug"
+FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
 FILES_${PN}-dev += "${libdir}/xml2Conf.sh"
 FILES_${PN}-utils += "${bindir}/*"
+FILES_${PN}-python += "${PYTHON_SITEPACKAGES_DIR}"
 
 do_install_ptest () {
   cp -r ${WORKDIR}/xmlconf ${D}${PTEST_PATH}
diff --git a/meta/recipes-core/libxml/libxml2/python-sitepackages-dir.patch b/meta/recipes-core/libxml/libxml2/python-sitepackages-dir.patch
new file mode 100644
index 0000000..a697ddf
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/python-sitepackages-dir.patch
@@ -0,0 +1,21 @@
+Allow us to pass in PYTHON_SITE_PACKAGES
+
+The python binary used when building for nativesdk doesn't give us the
+correct path here so we need to be able to specify it ourselves.
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+--- a/configure.in
++++ b/configure.in
+@@ -743,7 +743,8 @@ dnl
+ 
+ PYTHON_VERSION=
+ PYTHON_INCLUDES=
+-PYTHON_SITE_PACKAGES=
++# Allow this to be set externally
++#PYTHON_SITE_PACKAGES=
+ PYTHON_TESTS=
+ pythondir=
+ if test "$with_python" != "no" ; then
-- 
1.9.3


