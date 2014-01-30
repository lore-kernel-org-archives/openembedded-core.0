Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id A6FB86EABD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 04:11:49 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id z10so2554715pdj.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 20:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=vApfcJM3+ji3nLrGbsZBv6nbK1U6n3dZGhMtOz8yh0E=;
	b=VOdJDqbR2MldhJjQ2aFZ+Q05pRWA/3KlrdKs2owz5R2oF0ucf5kgteVaSlww+nezWR
	hm3LpRE1NapgAU/MdKn1fvGuxye1DZoYI+lwVraPMZS9rEWylT2dLAoF4eKlXUz0Eqlp
	e15SGigIutIBEfVRTTfERTKcpdzXsXam1qIOmea0YvBXkyTM12iCjmoWz2UhpBWNLQ1r
	76tFaNo/CTdwp9wX9WdaY5D07Dcwwx/IZC3sZZOiB5Qn/C8+BxoBkLsCYCrigxllyqg3
	tlpzXzkwvPCF/k+WOBVBYN1AmLJxr7KO/2NIScftwTGXl5Cgs8AeSlSJxzL1e8TxWU7t
	mPLw==
X-Received: by 10.66.142.132 with SMTP id rw4mr12374799pab.6.1391055110998;
	Wed, 29 Jan 2014 20:11:50 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	iu7sm12388951pbc.45.2014.01.29.20.11.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Jan 2014 20:11:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 20:12:27 -0800
Message-Id: <668539f2827a397597737e50fa6683ef10e63b7c.1391054829.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
References: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
In-Reply-To: <cover.1391054829.git.raj.khem@gmail.com>
References: <cover.1391054829.git.raj.khem@gmail.com>
Subject: [PATCH 05/15] classes/distutils: Introduce PYTHON_PN
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
X-List-Received-Date: Thu, 30 Jan 2014 04:11:50 -0000

This is needed to accomodate python3 alongside
python2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils-base.bbclass        |    5 ++---
 meta/classes/distutils-native-base.bbclass |    4 ++--
 meta/classes/distutils.bbclass             |   23 ++++++++++++-----------
 meta/classes/python-dir.bbclass            |    1 +
 meta/classes/pythonnative.bbclass          |    9 ++++++---
 5 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/meta/classes/distutils-base.bbclass b/meta/classes/distutils-base.bbclass
index 3b43e76..aa18e8b 100644
--- a/meta/classes/distutils-base.bbclass
+++ b/meta/classes/distutils-base.bbclass
@@ -1,5 +1,4 @@
-DEPENDS  += "${@["python-native python", ""][(d.getVar('PACKAGES', True) == '')]}"
-RDEPENDS_${PN} += "${@['', 'python-core']['${CLASSOVERRIDE}' == 'class-target']}"
+DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES', True) == '')]}"
+RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
 
 inherit distutils-common-base pythonnative
-
diff --git a/meta/classes/distutils-native-base.bbclass b/meta/classes/distutils-native-base.bbclass
index ceda512..509cb95 100644
--- a/meta/classes/distutils-native-base.bbclass
+++ b/meta/classes/distutils-native-base.bbclass
@@ -1,3 +1,3 @@
-DEPENDS  += "${@["python-native", ""][(d.getVar('PACKAGES', True) == '')]}"
-
 inherit distutils-common-base
+
+DEPENDS  += "${@["${PYTHON_PN}-native", ""][(d.getVar('PACKAGES', True) == '')]}"
diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 80f6df8..f3da023 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -11,15 +11,15 @@ distutils_do_compile() {
          STAGING_INCDIR=${STAGING_INCDIR} \
          STAGING_LIBDIR=${STAGING_LIBDIR} \
          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-         ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
-         bbfatal "python setup.py build_ext execution failed."
+         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
+         bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
 }
 
 distutils_stage_headers() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
-        bbfatal "python setup.py install_headers execution failed."
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
+        bbfatal "${PYTHON_PN} setup.py install_headers execution failed."
 }
 
 distutils_stage_all() {
@@ -28,21 +28,22 @@ distutils_stage_all() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
-        bbfatal "python setup.py install (stage) execution failed."
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
+        bbfatal "${PYTHON_PN} setup.py install (stage) execution failed."
 }
 
 distutils_do_install() {
         install -d ${D}${PYTHON_SITEPACKAGES_DIR}
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
-        PYTHONPATH=${D}/${PYTHON_SITEPACKAGES_DIR} \
+        PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
-        bbfatal "python setup.py install execution failed."
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
+        bbfatal "${PYTHON_PN} setup.py install execution failed."
 
-        for i in `find ${D} -name "*.py"` ; do \
-            sed -i -e s:${D}::g $i
+        # support filenames with *spaces*
+        find ${D} -name "*.py" -print0 | while read -d $'\0' i ; do \
+            sed -i -e s:${D}::g "$i"
         done
 
         if test -e ${D}${bindir} ; then	
diff --git a/meta/classes/python-dir.bbclass b/meta/classes/python-dir.bbclass
index 0b6a33c..b4b5ab0 100644
--- a/meta/classes/python-dir.bbclass
+++ b/meta/classes/python-dir.bbclass
@@ -1,3 +1,4 @@
 PYTHON_BASEVERSION ?= "2.7"
 PYTHON_DIR = "python${PYTHON_BASEVERSION}"
+PYTHON_PN = "python${@'' if '${PYTHON_BASEVERSION}'.startswith('2') else '3'}"
 PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnative.bbclass
index 7886207..fdd22bb 100644
--- a/meta/classes/pythonnative.bbclass
+++ b/meta/classes/pythonnative.bbclass
@@ -1,3 +1,6 @@
-PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
-EXTRANATIVEPATH += "python-native"
-DEPENDS += " python-native "
+
+inherit python-dir
+
+PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
+EXTRANATIVEPATH += "${PYTHON_PN}-native"
+DEPENDS += " ${PYTHON_PN}-native "
-- 
1.7.10.4


