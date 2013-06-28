Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 504CC6AF2E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:04:29 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id tj12so2946183pac.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZP3+5rOVce0qq0NEaaFq6NtDkAE59PKytyKbGA3Ncpc=;
	b=nJTGlmqQ1lKlY3YlkE9FXDZTBnGvMwWkU/xLJzzWjrQktdILbRAoANEPyoMrTwDMsn
	EMah2KXtKuEIFYj5HAwv6XnTajmPZQE2pb5T6mxlg/epMEEjvgBZFswqtHWb+u9sF0Ev
	7r28H2WWmZW/qmo34g5Yiud67Q18r5v7Px81HBiUT4aW2lMs9RrD8yMRumjLE/jFfbNm
	exrlmNzZ8sUJAoOV0MK3mhdeOBnCoRDxIzLDHHAX7YfFInA2nwt7ZcrT/1KPUBDMYo4E
	XgqajBCQoEXwV0e7XNBdoTYCHA4BmhnAMJYw/AQIHPWPndowtsYtMz0E+C0rLc7pfrYx
	3P6Q==
X-Received: by 10.66.191.99 with SMTP id gx3mr13532889pac.88.1372457070711;
	Fri, 28 Jun 2013 15:04:30 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm10723745pac.16.2013.06.28.15.04.29 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:04:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 15:03:50 -0700
Message-Id: <860ba65f833a1b1055378ee6d891f619e330d68e.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
References: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
Subject: [PATCH 05/24] classes: Add distutils for python3
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
X-List-Received-Date: Fri, 28 Jun 2013 22:04:29 -0000

In line with python2 add distutils and setuptools
classes for handing python3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils-tools.bbclass        |   77 +++++++++++++++++++++++
 meta/classes/distutils3-base.bbclass        |    5 ++
 meta/classes/distutils3-native-base.bbclass |    3 +
 meta/classes/distutils3.bbclass             |   90 +++++++++++++++++++++++++++
 meta/classes/setuptools3.bbclass            |   10 +++
 5 files changed, 185 insertions(+)
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
index 0000000..3738b14
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
+            sed -i -e s:${D}::g $i
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
diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
new file mode 100644
index 0000000..601c0f6
--- /dev/null
+++ b/meta/classes/setuptools3.bbclass
@@ -0,0 +1,10 @@
+inherit distutils3
+
+DEPENDS += "python3-distribute-native"
+
+DISTUTILS_INSTALL_ARGS = "--root=${D} \
+    --prefix=${prefix} \
+    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
+    --install-data=${datadir}"
+
+#    --single-version-externally-managed \
-- 
1.7.9.5


