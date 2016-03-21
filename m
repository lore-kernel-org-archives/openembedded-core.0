Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1158D6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 05:11:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 20 Mar 2016 22:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,369,1455004800"; d="scan'208";a="915344800"
Received: from edeshpan-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.136.133])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2016 22:11:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 18:10:58 +1300
Message-Id: <f63b3f86393db45e4837dc19ac57085e4b3ef774.1458537025.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1458537025.git.paul.eggleton@linux.intel.com>
References: <cover.1458537025.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1458537025.git.paul.eggleton@linux.intel.com>
References: <cover.1458537025.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] classes/distutils*: don't hide logs when setup script fails
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
X-List-Received-Date: Mon, 21 Mar 2016 05:11:38 -0000

We need to see the output of the setup script in the error message
because what we are having bbfatal print here doesn't completely
describe what went wrong, thus we should use bbfatal_log here and not
bbfatal.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/distutils-tools.bbclass | 8 ++++----
 meta/classes/distutils.bbclass       | 8 ++++----
 meta/classes/distutils3.bbclass      | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/classes/distutils-tools.bbclass b/meta/classes/distutils-tools.bbclass
index f43450e..8d9b3f7 100644
--- a/meta/classes/distutils-tools.bbclass
+++ b/meta/classes/distutils-tools.bbclass
@@ -10,14 +10,14 @@ distutils_do_compile() {
          STAGING_LIBDIR=${STAGING_LIBDIR} \
          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
-         bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
+         bbfatal_log "${PYTHON_PN} setup.py build_ext execution failed."
 }
 
 distutils_stage_headers() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
-        bbfatal "${PYTHON_PN} setup.py install_headers execution failed."
+        bbfatal_log "${PYTHON_PN} setup.py install_headers execution failed."
 }
 
 distutils_stage_all() {
@@ -27,7 +27,7 @@ distutils_stage_all() {
         PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
-        bbfatal "${PYTHON_PN} setup.py install (stage) execution failed."
+        bbfatal_log "${PYTHON_PN} setup.py install (stage) execution failed."
 }
 
 distutils_do_install() {
@@ -39,7 +39,7 @@ distutils_do_install() {
         PYTHONPATH=${D}/${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
-        bbfatal "${PYTHON_PN} setup.py install execution failed."
+        bbfatal_log "${PYTHON_PN} setup.py install execution failed."
 
         echo "Step 3 of ${PN} Install ..."
         # support filenames with *spaces*
diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index cd06713..da48a2e 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -12,14 +12,14 @@ distutils_do_compile() {
          STAGING_LIBDIR=${STAGING_LIBDIR} \
          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
-         bbfatal "${PYTHON_PN} setup.py build execution failed."
+         bbfatal_log "${PYTHON_PN} setup.py build execution failed."
 }
 
 distutils_stage_headers() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
-        bbfatal "${PYTHON_PN} setup.py install_headers execution failed."
+        bbfatal_log "${PYTHON_PN} setup.py install_headers execution failed."
 }
 
 distutils_stage_all() {
@@ -29,7 +29,7 @@ distutils_stage_all() {
         PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
-        bbfatal "${PYTHON_PN} setup.py install (stage) execution failed."
+        bbfatal_log "${PYTHON_PN} setup.py install (stage) execution failed."
 }
 
 distutils_do_install() {
@@ -39,7 +39,7 @@ distutils_do_install() {
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
-        bbfatal "${PYTHON_PN} setup.py install execution failed."
+        bbfatal_log "${PYTHON_PN} setup.py install execution failed."
 
         # support filenames with *spaces*
         # only modify file if it contains path  and recompile it
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index 443bf3a..4f6ca44 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -19,7 +19,7 @@ distutils3_do_compile() {
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
         build ${DISTUTILS_BUILD_ARGS} || \
-        bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
+        bbfatal_log "${PYTHON_PN} setup.py build_ext execution failed."
 }
 distutils3_do_compile[vardepsexclude] = "MACHINE"
 
@@ -32,7 +32,7 @@ distutils3_stage_headers() {
         fi
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
-        bbfatal "${PYTHON_PN} setup.py install_headers execution failed."
+        bbfatal_log "${PYTHON_PN} setup.py install_headers execution failed."
 }
 distutils3_stage_headers[vardepsexclude] = "MACHINE"
 
@@ -48,7 +48,7 @@ distutils3_stage_all() {
         PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
-        bbfatal "${PYTHON_PN} setup.py install (stage) execution failed."
+        bbfatal_log "${PYTHON_PN} setup.py install (stage) execution failed."
 }
 distutils3_stage_all[vardepsexclude] = "MACHINE"
 
@@ -64,7 +64,7 @@ distutils3_do_install() {
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
-        bbfatal "${PYTHON_PN} setup.py install execution failed."
+        bbfatal_log "${PYTHON_PN} setup.py install execution failed."
 
         # support filenames with *spaces*
         find ${D} -name "*.py" -exec grep -q ${D} {} \; -exec sed -i -e s:${D}::g {} \;
-- 
2.5.5


