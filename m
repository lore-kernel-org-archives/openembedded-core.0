Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A25F271C14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:35:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2017 02:35:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,186,1484035200"; d="scan'208";a="1132314411"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 20 Feb 2017 02:35:57 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Feb 2017 12:35:37 +0200
Message-Id: <20170220103551.20022-6-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170220103551.20022-1-markus.lehtonen@linux.intel.com>
References: <20170220103551.20022-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 06/20] python: make profile-optimized build possible
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
X-List-Received-Date: Mon, 20 Feb 2017 10:35:57 -0000

This patch makes it possible to build python with profile directed
optimization. That is, feed python build process with profile data to
guide optimization. This is the third (and the last) step in profile
directed optimization for Python.

In order to do a profile-optimized build you need to set
PYTHON_PROFILE_OPT = "1" in your local.conf. Be sure to get the profile
data for python, preferably by running
"bitbake python-pgo-image -c profile".

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/python/python_2.7.12.bb | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python_2.7.12.bb b/meta/recipes-devtools/python/python_2.7.12.bb
index 31df7bb..dbd44bf 100644
--- a/meta/recipes-devtools/python/python_2.7.12.bb
+++ b/meta/recipes-devtools/python/python_2.7.12.bb
@@ -43,6 +43,17 @@ EXTRA_OECONF += "ac_cv_file__dev_ptmx=yes ac_cv_file__dev_ptc=no"
 STAGING_INCDIR_DEFAULT ?= "${STAGING_INCDIR}"
 STAGING_LIBDIR_DEFAULT ?= "${STAGING_LIBDIR}"
 
+# Automatic profile guided optimization
+PYTHON_MAKE_TARGET ?= "${@'build_all_use_profile' if d.getVar('PYTHON_PROFILE_OPT', True) == '1' else ''}"
+PYTHON_PROFILE_DIR ?= "${@'${TMPDIR}/work-shared/${MACHINE}/python/pgo-data' if d.getVar('PYTHON_PROFILE_OPT', True) == '1' else ''}"
+python () {
+    if (d.getVar('PYTHON_PROFILE_OPT', True) == '1' and
+            d.getVar('PYTHON_MAKE_TARGET', True) == 'build_all_use_profile'):
+        profile_dir = d.getVar('PYTHON_PROFILE_DIR', True)
+        bb.utils.mkdirhier(profile_dir)
+        d.setVarFlag('do_compile', 'file-checksums', '%s:True' % profile_dir)
+}
+
 do_configure_append() {
 	rm -f ${S}/Makefile.orig
         autoreconf -Wcross --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
@@ -80,9 +91,15 @@ do_compile() {
 
 	export CROSS_COMPILE="${TARGET_PREFIX}"
 	export PYTHONBUILDDIR="${B}"
-    # This is only used in PGO profiling by python-profile-opt package
     if [ "${PYTHON_MAKE_TARGET}" = "build_all_generate_profile" ]; then
+        # This is only used in PGO profiling by python-profile-opt package
         export EXTRA_CFLAGS="-fprofile-dir=./python-pgo-profiles/"
+    else
+        if [ -n "${PYTHON_PROFILE_DIR}" ]; then
+            export EXTRA_CFLAGS="-fprofile-dir=${PYTHON_PROFILE_DIR}"
+            # Remove non-optimized build artefacts
+            oe_runmake clean
+        fi
     fi
 
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
@@ -100,6 +117,11 @@ do_install() {
 
 	export CROSS_COMPILE="${TARGET_PREFIX}"
 	export PYTHONBUILDDIR="${B}"
+    # This only has effect if we build with -fprofile-use, e.g. when make
+    # target is build_all_use_profile
+    if [ -n "${PYTHON_PROFILE_DIR}" ]; then
+        export EXTRA_CFLAGS="-fprofile-dir=${PYTHON_PROFILE_DIR}"
+    fi
 
 	# After swizzling the makefile, we need to run the build again.
 	# install can race with the build so we have to run this first, then install
@@ -147,6 +169,7 @@ py_package_preprocess () {
     python -m py_compile ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
 }
 
+
 require python-${PYTHON_MAJMIN}-manifest.inc
 
 # manual dependency additions
-- 
2.10.2


