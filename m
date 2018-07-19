Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E21E278A68
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 14:49:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6JEn1tN011469
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 19 Jul 2018 07:49:01 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 19 Jul 2018 07:49:00 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 19 Jul 2018 22:59:04 +0800
Message-ID: <fcb127984691dc4cc213ddffec86effa94b76e7b.1532012164.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1532012164.git.hongxu.jia@windriver.com>
References: <cover.1532012164.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] distutils/setuptools, distutils3/setuptools3: improve reproducibility
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
X-List-Received-Date: Thu, 19 Jul 2018 14:49:01 -0000
Content-Type: text/plain

- Unify var-DISTUTILS_INSTALL_ARGS in distutils and setuptools

- Supply "--root" directory to the "install" command, and use
  it as a prefix to strip off the purported filename encoded
  in bytecode files. (It strips build path prefix from .pyc files)

[YOCTO #8446]
[YOCTO #12084]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/distutils.bbclass   | 8 +++++---
 meta/classes/distutils3.bbclass  | 8 +++++---
 meta/classes/setuptools.bbclass  | 5 -----
 meta/classes/setuptools3.bbclass | 4 ----
 4 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 1930c35..db28767 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -4,8 +4,10 @@ DISTUTILS_BUILD_ARGS ?= ""
 DISTUTILS_STAGE_HEADERS_ARGS ?= "--install-dir=${STAGING_INCDIR}/${PYTHON_DIR}"
 DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
     --install-data=${STAGING_DATADIR}"
-DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
-    --install-data=${D}/${datadir}"
+DISTUTILS_INSTALL_ARGS ?= "--root=${D} \
+    --prefix=${prefix} \
+    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
+    --install-data=${datadir}"
 
 distutils_do_compile() {
          STAGING_INCDIR=${STAGING_INCDIR} \
@@ -34,7 +36,7 @@ distutils_do_install() {
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal_log "${PYTHON_PN} setup.py install execution failed."
 
         # support filenames with *spaces*
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index d4b92a3..9637486 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -5,8 +5,10 @@ DISTUTILS_BUILD_EXT_ARGS ?= ""
 DISTUTILS_STAGE_HEADERS_ARGS ?= "--install-dir=${STAGING_INCDIR}/${PYTHON_DIR}"
 DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
     --install-data=${STAGING_DATADIR}"
-DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
-    --install-data=${D}/${datadir}"
+DISTUTILS_INSTALL_ARGS ?= "--root=${D} \
+    --prefix=${prefix} \
+    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
+    --install-data=${datadir}"
 
 distutils3_do_configure() {
 	if [ "${CLEANBROKEN}" != "1" ] ; then
@@ -45,7 +47,7 @@ distutils3_do_install() {
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal_log "${PYTHON_PN} setup.py install execution failed."
 
         # support filenames with *spaces*
diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bbclass
index 157ef63..a923ea3 100644
--- a/meta/classes/setuptools.bbclass
+++ b/meta/classes/setuptools.bbclass
@@ -1,8 +1,3 @@
 inherit distutils
 
 DEPENDS += "python-setuptools-native"
-
-DISTUTILS_INSTALL_ARGS = "--root=${D} \
-    --prefix=${prefix} \
-    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
-    --install-data=${datadir}"
diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
index de6dd94..8ca66ee 100644
--- a/meta/classes/setuptools3.bbclass
+++ b/meta/classes/setuptools3.bbclass
@@ -2,7 +2,3 @@ inherit distutils3
 
 DEPENDS += "python3-setuptools-native"
 
-DISTUTILS_INSTALL_ARGS = "--root=${D} \
-    --prefix=${prefix} \
-    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
-    --install-data=${datadir}"
-- 
2.7.4


