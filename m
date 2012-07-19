Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1Sruyw-0003zW-MP
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 19:57:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6JHkMOo010902
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 10:46:23 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 19 Jul 2012 10:46:23 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jul 2012 13:46:06 -0400
Message-ID: <1342719981-1324-2-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1342719981-1324-1-git-send-email-morgan.little@windriver.com>
References: <1342719981-1324-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 01/16] python-native: Put binaries in seperate directory
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
X-List-Received-Date: Thu, 19 Jul 2012 17:57:47 -0000
Content-Type: text/plain

Update python-native to install the binaries in the python-native directory,
add pythonnative.bbclass to let recipes that need python-native use the
binaries and update disutils access the new binaries. Update distutils-base
to inherit pythonnative.
---
 meta/classes/distutils-base.bbclass                |    2 +-
 meta/classes/distutils.bbclass                     |    8 ++++----
 meta/classes/pythonnative.bbclass                  |    3 +++
 .../recipes-devtools/python/python-native_2.7.3.bb |   10 ++++++----
 4 files changed, 14 insertions(+), 9 deletions(-)
 create mode 100644 meta/classes/pythonnative.bbclass

diff --git a/meta/classes/distutils-base.bbclass b/meta/classes/distutils-base.bbclass
index 6d18e08..c761b36 100644
--- a/meta/classes/distutils-base.bbclass
+++ b/meta/classes/distutils-base.bbclass
@@ -1,5 +1,5 @@
 DEPENDS  += "${@["python-native python", ""][(d.getVar('PACKAGES', True) == '')]}"
 RDEPENDS_${PN} += "${@['', 'python-core']['${PN}' == '${BPN}']}"
 
-inherit distutils-common-base
+inherit distutils-common-base pythonnative
 
diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index bcddf8d..690df73 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -11,14 +11,14 @@ distutils_do_compile() {
          STAGING_INCDIR=${STAGING_INCDIR} \
          STAGING_LIBDIR=${STAGING_LIBDIR} \
          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-         ${STAGING_BINDIR_NATIVE}/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
+         ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
          bbfatal "python setup.py build_ext execution failed."
 }
 
 distutils_stage_headers() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-        ${STAGING_BINDIR_NATIVE}/python setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
         bbfatal "python setup.py install_headers execution failed."
 }
 
@@ -28,7 +28,7 @@ distutils_stage_all() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-        ${STAGING_BINDIR_NATIVE}/python setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
         bbfatal "python setup.py install (stage) execution failed."
 }
 
@@ -38,7 +38,7 @@ distutils_do_install() {
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}/${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-        ${STAGING_BINDIR_NATIVE}/python setup.py install ${DISTUTILS_INSTALL_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal "python setup.py install execution failed."
 
         for i in `find ${D} -name "*.py"` ; do \
diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnative.bbclass
new file mode 100644
index 0000000..bc346da
--- /dev/null
+++ b/meta/classes/pythonnative.bbclass
@@ -0,0 +1,3 @@
+PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
+PATH_prepend = "${STAGING_BINDIR_NATIVE}/python-native:"
+DEPENDS += " python-native "
diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
index 50bf894..bfdcd12 100644
--- a/meta/recipes-devtools/python/python-native_2.7.3.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += "file://04-default-is-optimized.patch \
            file://05-enable-ctypes-cross-build.patch \
@@ -20,6 +20,8 @@ inherit native
 
 RPROVIDES += "python-distutils-native python-compression-native python-textutils-native python-core-native"
 
+EXTRA_OECONF += " --bindir=${bindir}/${PN}"
+
 EXTRA_OEMAKE = '\
   BUILD_SYS="" \
   HOST_SYS="" \
@@ -34,11 +36,11 @@ do_configure_prepend() {
 
 do_install() {
 	oe_runmake 'DESTDIR=${D}' install
-	install -d ${D}${bindir}/
-	install -m 0755 Parser/pgen ${D}${bindir}/
+	install -d ${D}${bindir}/${PN}
+	install -m 0755 Parser/pgen ${D}${bindir}/${PN}
 
 	# Make sure we use /usr/bin/env python
-	for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
+	for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
 		sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
 	done
 }
-- 
1.7.0.4



