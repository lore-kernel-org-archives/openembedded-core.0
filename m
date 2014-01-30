Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id E62EC6E9CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 04:11:50 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id rd3so2634458pab.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 20:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=cnT1rXcTezYUzCH4AtMr2IjkI9XEj3Sffs0Jyl5BbaQ=;
	b=Qgb0vfO/94pXyuRQ7UagPYYMBI+BBjUFF5aZqh7yr3BB04Ko5VvsAsxcH+ocuo4f3y
	LHuv2WQZNvHBuLXuJl4psOiUi5hDJWzvGG1Lw1972f/4/26PcJX1ju1ePlLCsgdn4uVi
	oco+f/qBj4PbNg8v7TjaBx54apqzCi0TCDDqcuKQe2nisQ/BMPK4q+6uoGm8NHaDi8Vo
	TtK6MgN9S674EwBP3wGT7ZrCaDJztgMjFFUY03nB4EBJESNwcOdBc6DccVOnG+uhi0QM
	BZDsm4U5oTG/5TW3g4RLSLygs56t8qqFvsprrdKLTvEN/YOwTLs6IOXkgBPXMe26i1NF
	nW3A==
X-Received: by 10.66.27.107 with SMTP id s11mr12234167pag.64.1391055112202;
	Wed, 29 Jan 2014 20:11:52 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	iu7sm12388951pbc.45.2014.01.29.20.11.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Jan 2014 20:11:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 20:12:28 -0800
Message-Id: <6b4f8176a4550377a47043c774853918985c3c96.1391054829.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
References: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
In-Reply-To: <cover.1391054829.git.raj.khem@gmail.com>
References: <cover.1391054829.git.raj.khem@gmail.com>
Subject: [PATCH 06/15] classes: Add distutils for python3
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
X-List-Received-Date: Thu, 30 Jan 2014 04:11:51 -0000

In line with python2 add distutils and setuptools
classes for handing python3

Use python-distribute instead of python-setuptools in setuptools bbclass

Remove --single-version-externally-managed since its setuptools
specific and we dont use it anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils-tools.bbclass        |   77 +++++++++++++++++++++++
 meta/classes/distutils3-base.bbclass        |    5 ++
 meta/classes/distutils3-native-base.bbclass |    3 +
 meta/classes/distutils3.bbclass             |   90 +++++++++++++++++++++++++++
 meta/classes/setuptools.bbclass             |    3 +-
 meta/classes/setuptools3.bbclass            |    8 +++
 6 files changed, 184 insertions(+), 2 deletions(-)
 create mode 100644 meta/classes/distutils-tools.bbclass
 create mode 100644 meta/classes/distutils3-base.bbclass
 create mode 100644 meta/classes/distutils3-native-base.bbclass
 create mode 100644 meta/classes/distutils3.bbclass
 create mode 100644 meta/classes/setuptools3.bbclass

diff --git a/meta/classes/distutils-tools.bbclass b/meta/classes/distutils-tools.bbclass
new file mode 100644
index 0000000..f43450e
--- /dev/null
+++ b/meta/classes/distutils-tools.bbclass
@@ -0,0 +1,77 @@
+DISTUTILS_BUILD_ARGS ?= ""
+DISTUTILS_STAGE_HEADERS_ARGS ?= "--install-dir=${STAGING_INCDIR}/${PYTHON_DIR}"
+DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
+    --install-data=${STAGING_DATADIR}"
+DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
+    --install-data=${D}/${datadir}"
+
+distutils_do_compile() {
+         STAGING_INCDIR=${STAGING_INCDIR} \
+         STAGING_LIBDIR=${STAGING_LIBDIR} \
+         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
+         bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
+}
+
+distutils_stage_headers() {
+        install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
+        bbfatal "${PYTHON_PN} setup.py install_headers execution failed."
+}
+
+distutils_stage_all() {
+        STAGING_INCDIR=${STAGING_INCDIR} \
+        STAGING_LIBDIR=${STAGING_LIBDIR} \
+        install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
+        PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
+        bbfatal "${PYTHON_PN} setup.py install (stage) execution failed."
+}
+
+distutils_do_install() {
+        echo "Beginning ${PN} Install ..."
+        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+        echo "Step 2 of ${PN} Install ..."
+        STAGING_INCDIR=${STAGING_INCDIR} \
+        STAGING_LIBDIR=${STAGING_LIBDIR} \
+        PYTHONPATH=${D}/${PYTHON_SITEPACKAGES_DIR} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
+        bbfatal "${PYTHON_PN} setup.py install execution failed."
+
+        echo "Step 3 of ${PN} Install ..."
+        # support filenames with *spaces*
+        find ${D} -name "*.py" -print0 | while read -d $'\0' i ; do \
+            sed -i -e s:${D}::g $i
+        done
+
+        echo "Step 4 of ${PN} Install ..."
+        if test -e ${D}${bindir} ; then	
+            for i in ${D}${bindir}/* ; do \
+                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
+            done
+        fi
+
+        echo "Step 4 of ${PN} Install ..."
+        if test -e ${D}${sbindir}; then
+            for i in ${D}${sbindir}/* ; do \
+                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
+            done
+        fi
+
+        echo "Step 5 of ${PN} Install ..."
+        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
+        
+        #
+        # FIXME: Bandaid against wrong datadir computation
+        #
+        if test -e ${D}${datadir}/share; then
+            mv -f ${D}${datadir}/share/* ${D}${datadir}/
+        fi
+}
+
+#EXPORT_FUNCTIONS do_compile do_install
+
+export LDSHARED="${CCLD} -shared"
diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3-base.bbclass
new file mode 100644
index 0000000..82ab6a3
--- /dev/null
+++ b/meta/classes/distutils3-base.bbclass
@@ -0,0 +1,5 @@
+DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES', True) == '')]}"
+RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
+
+inherit distutils-common-base python3native
+
diff --git a/meta/classes/distutils3-native-base.bbclass b/meta/classes/distutils3-native-base.bbclass
new file mode 100644
index 0000000..b4a333f
--- /dev/null
+++ b/meta/classes/distutils3-native-base.bbclass
@@ -0,0 +1,3 @@
+PYTHON_BASEVERSION = "3.3"
+
+inherit distutils-native-base
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
new file mode 100644
index 0000000..602ce48
--- /dev/null
+++ b/meta/classes/distutils3.bbclass
@@ -0,0 +1,90 @@
+
+PYTHON_BASEVERSION = "3.3"
+
+inherit distutils3-base 
+#distutils-tools
+
+DISTUTILS_BUILD_ARGS ?= ""
+DISTUTILS_STAGE_HEADERS_ARGS ?= "--install-dir=${STAGING_INCDIR}/${PYTHON_DIR}"
+DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
+    --install-data=${STAGING_DATADIR}"
+DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
+    --install-data=${D}/${datadir}"
+
+distutils3_do_compile() {
+         STAGING_INCDIR=${STAGING_INCDIR} \
+         STAGING_LIBDIR=${STAGING_LIBDIR} \
+         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
+         bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
+}
+
+distutils3_stage_headers() {
+        install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
+        bbfatal "${PYTHON_PN} setup.py install_headers execution failed."
+}
+
+distutils3_stage_all() {
+        STAGING_INCDIR=${STAGING_INCDIR} \
+        STAGING_LIBDIR=${STAGING_LIBDIR} \
+        install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
+        PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
+        bbfatal "${PYTHON_PN} setup.py install (stage) execution failed."
+}
+
+distutils3_do_install() {
+        echo "Beginning ${PN} Install ..."
+        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+
+        echo "Step 2 of ${PN} Install ..."
+        STAGING_INCDIR=${STAGING_INCDIR} \
+        STAGING_LIBDIR=${STAGING_LIBDIR} \
+        PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
+        bbfatal "${PYTHON_PN} setup.py install execution failed."
+
+        echo "Step 3 of ${PN} Install ..."
+        # support filenames with *spaces*
+        find ${D} -name "*.py" -print0 | while read -d $'\0' i ; do \
+            sed -i -e s:${D}::g "$i"
+        done
+
+        echo "Step 4 of ${PN} Install ..."
+        if test -e ${D}${bindir} ; then	
+            for i in ${D}${bindir}/* ; do \
+                echo "Processing " $i; \
+                sed -i \
+                    -e s:${STAGING_BINDIR_NATIVE}/python3-native:${bindir}:g \
+                    $i
+            done
+        fi
+
+        echo "Step 4 of ${PN} Install ..."
+        if test -e ${D}${sbindir}; then
+            for i in ${D}${sbindir}/* ; do \
+                echo "Processing " $i; \
+                sed -i \
+                    -e s:${STAGING_BINDIR_NATIVE}/python3-native:${bindir}:g \
+                    $i
+            done
+        fi
+
+        echo "Step 5 of ${PN} Install ..."
+        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
+        
+        #
+        # FIXME: Bandaid against wrong datadir computation
+        #
+        if test -e ${D}${datadir}/share; then
+            mv -f ${D}${datadir}/share/* ${D}${datadir}/
+        fi
+}
+
+EXPORT_FUNCTIONS do_compile do_install
+
+export LDSHARED="${CCLD} -shared"
diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bbclass
index ba9cf13..56343b1 100644
--- a/meta/classes/setuptools.bbclass
+++ b/meta/classes/setuptools.bbclass
@@ -1,9 +1,8 @@
 inherit distutils
 
-DEPENDS += "python-setuptools-native"
+DEPENDS += "python-distribute-native"
 
 DISTUTILS_INSTALL_ARGS = "--root=${D} \
-    --single-version-externally-managed \
     --prefix=${prefix} \
     --install-lib=${PYTHON_SITEPACKAGES_DIR} \
     --install-data=${datadir}"
diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
new file mode 100644
index 0000000..40c18c8
--- /dev/null
+++ b/meta/classes/setuptools3.bbclass
@@ -0,0 +1,8 @@
+inherit distutils3
+
+DEPENDS += "python3-distribute-native"
+
+DISTUTILS_INSTALL_ARGS = "--root=${D} \
+    --prefix=${prefix} \
+    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
+    --install-data=${datadir}"
-- 
1.7.10.4


