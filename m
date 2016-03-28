Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 95DEF73177
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 08:19:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2S8JV8b000028
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Mar 2016 01:19:31 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 28 Mar 2016 01:19:30 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<mark.hatle@windriver.com>
Date: Mon, 28 Mar 2016 04:18:54 -0400
Message-ID: <9396e53ae3ae8d17d122915ebdaa9fb7c1733b65.1459147231.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1459147231.git.hongxu.jia@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/17] bbclass distutils/distutils3/setuptools/setuptools3: clean up DISTUTILS_INSTALL_ARGS
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
X-List-Received-Date: Mon, 28 Mar 2016 08:19:31 -0000
Content-Type: text/plain

Since fix .pyc/.pyo buildpaths issue, we have the same
DISTUTILS_INSTALL_ARGS in these bbclass files, so clean
up the duplicate.

[YOCTO #8446]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/distutils.bbclass   | 4 +++-
 meta/classes/distutils3.bbclass  | 4 +++-
 meta/classes/setuptools.bbclass  | 5 -----
 meta/classes/setuptools3.bbclass | 5 -----
 4 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 8427c1a..407ccd4 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -5,6 +5,8 @@ DISTUTILS_STAGE_HEADERS_ARGS ?= "--install-dir=${STAGING_INCDIR}/${PYTHON_DIR}"
 DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
     --install-data=${STAGING_DATADIR}"
 DISTUTILS_INSTALL_ARGS ?= "--prefix=${prefix} \
+    --root=${D} \
+    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
     --install-data=${datadir}"
 
 distutils_do_compile() {
@@ -38,7 +40,7 @@ distutils_do_install() {
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --root=${D} --install-lib=${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal_log "${PYTHON_PN} setup.py install execution failed."
 
         # support filenames with *spaces*
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index a98606b..5da93fa 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -6,6 +6,8 @@ DISTUTILS_STAGE_HEADERS_ARGS ?= "--install-dir=${STAGING_INCDIR}/${PYTHON_DIR}"
 DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
     --install-data=${STAGING_DATADIR}"
 DISTUTILS_INSTALL_ARGS ?= "--prefix=${prefix} \
+    --root=${D} \
+    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
     --install-data=${datadir}"
 
 distutils3_do_compile() {
@@ -63,7 +65,7 @@ distutils3_do_install() {
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --root=${D} --install-lib=${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal_log "${PYTHON_PN} setup.py install execution failed."
 
         # support filenames with *spaces*
diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bbclass
index 56343b1..0a3f0f9 100644
--- a/meta/classes/setuptools.bbclass
+++ b/meta/classes/setuptools.bbclass
@@ -1,8 +1,3 @@
 inherit distutils
 
 DEPENDS += "python-distribute-native"
-
-DISTUTILS_INSTALL_ARGS = "--root=${D} \
-    --prefix=${prefix} \
-    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
-    --install-data=${datadir}"
diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
index de6dd94..38e175a 100644
--- a/meta/classes/setuptools3.bbclass
+++ b/meta/classes/setuptools3.bbclass
@@ -1,8 +1,3 @@
 inherit distutils3
 
 DEPENDS += "python3-setuptools-native"
-
-DISTUTILS_INSTALL_ARGS = "--root=${D} \
-    --prefix=${prefix} \
-    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
-    --install-data=${datadir}"
-- 
1.9.1


