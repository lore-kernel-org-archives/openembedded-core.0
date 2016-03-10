Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 31D3B73174
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 07:23:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2A7NX0t014499
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Mar 2016 23:23:33 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Mar 2016 23:23:32 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Mar 2016 02:23:08 -0500
Message-ID: <3d4eb8ef20cc0cbe32afad4c426074e63ec8007b.1457593651.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1457593651.git.hongxu.jia@windriver.com>
References: <cover.1457593651.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/18] bbclass distutils/distutils3: fix .pyc/.pyo buildpath
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
X-List-Received-Date: Thu, 10 Mar 2016 07:23:34 -0000
Content-Type: text/plain

Get the "--root" directory supplied to the "install" command,
and use it as a prefix to strip off the purported filename
encoded in bytecode files.

Since --root added, we need to tweak --install-data,
--prefix and --install-lib to use relative path.

[YOCTO #8446]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/distutils.bbclass  | 6 +++---
 meta/classes/distutils3.bbclass | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index cd06713..f054006 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -4,8 +4,8 @@ DISTUTILS_BUILD_ARGS ?= ""
 DISTUTILS_STAGE_HEADERS_ARGS ?= "--install-dir=${STAGING_INCDIR}/${PYTHON_DIR}"
 DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
     --install-data=${STAGING_DATADIR}"
-DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
-    --install-data=${D}/${datadir}"
+DISTUTILS_INSTALL_ARGS ?= "--prefix=${prefix} \
+    --install-data=${datadir}"
 
 distutils_do_compile() {
          STAGING_INCDIR=${STAGING_INCDIR} \
@@ -38,7 +38,7 @@ distutils_do_install() {
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --root=${D} --install-lib=${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install execution failed."
 
         # support filenames with *spaces*
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index 443bf3a..7962d40 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -5,8 +5,8 @@ DISTUTILS_BUILD_EXT_ARGS ?= ""
 DISTUTILS_STAGE_HEADERS_ARGS ?= "--install-dir=${STAGING_INCDIR}/${PYTHON_DIR}"
 DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
     --install-data=${STAGING_DATADIR}"
-DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
-    --install-data=${D}/${datadir}"
+DISTUTILS_INSTALL_ARGS ?= "--prefix=${prefix} \
+    --install-data=${datadir}"
 
 distutils3_do_compile() {
         if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
@@ -63,7 +63,7 @@ distutils3_do_install() {
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --root=${D} --install-lib=${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install execution failed."
 
         # support filenames with *spaces*
-- 
1.9.1


