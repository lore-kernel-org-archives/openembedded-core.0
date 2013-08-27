Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id AFD126BB8B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 17:16:02 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id g10so5133125pdj.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=m+QiGsVTmtN7xMi/KoGjvljVu2PSVieC3V3o2ctnwoo=;
	b=eV2EUrG+vu9lYRq5ccHzcJXtVBd4taqouXCyZqi86Iyk6myYZ3Z8okjRCS7xh5nPpo
	a9cV9WazXyjYz+6V5jqQ3SiTL+dXipxdhxSgk0u5bxM0oVNfjxetA+21WLoZIfvT0hEf
	D2lgDBZuEK1nyXISGZyRhLtojjQPjMT35Z0EmSHvjokK3wTSLoJtbdXzM7DqlyBxqgaR
	jXsIjdIi1AD820nWcDbr8b0ne1L7WADC2TgBiM6nkqSos79zWigAVlg4d+xDRAdVKWOa
	+83iRY/8QafqqmrJ+3QrWx/jF//dqttVl8Mcf+n6lQh2Fxuc/usgquMlLM7EynYYJLsB
	TuaA==
X-Received: by 10.66.253.4 with SMTP id zw4mr21969519pac.119.1377623763698;
	Tue, 27 Aug 2013 10:16:03 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id t9sm25769021pba.46.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 10:16:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 10:15:04 -0700
Message-Id: <71a27ff30f984ac8735d1248000761762b907d72.1377623208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
References: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1377623208.git.raj.khem@gmail.com>
References: <cover.1377623208.git.raj.khem@gmail.com>
Subject: [PATCH 05/20] classes/distutils: Introduce PYTHON_PN
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
X-List-Received-Date: Tue, 27 Aug 2013 17:16:02 -0000

This is needed to accomodate python3 alongside
python2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils-base.bbclass        |  5 ++---
 meta/classes/distutils-native-base.bbclass |  4 ++--
 meta/classes/distutils.bbclass             | 23 ++++++++++++-----------
 meta/classes/python-dir.bbclass            |  1 +
 meta/classes/pythonnative.bbclass          |  9 ++++++---
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
index a0e1f50..ed2b72a 100644
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
1.8.3.4


