Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 210FD77353
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 01:45:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1Q1jD8H011004
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Feb 2016 17:45:13 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 25 Feb 2016 17:45:12 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <alejandro.hernandez@linux.intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 25 Feb 2016 20:44:56 -0500
Message-ID: <130bd7dce4a8d3fa398b12883c83711642c5b1f4.1456449257.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456449257.git.hongxu.jia@windriver.com>
References: <cover.1456449257.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/15] bbclass distutils/distutils3: fix .pyc/.pyo buildpath
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
X-List-Received-Date: Fri, 26 Feb 2016 01:45:14 -0000
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


