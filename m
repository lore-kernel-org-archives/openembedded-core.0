Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D6C7477E1C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:19:01 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2017 06:19:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="102711838"
Received: from bkearns-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.90])
	by fmsmga006.fm.intel.com with ESMTP; 16 May 2017 06:19:01 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 16:18:36 +0300
Message-Id: <a84944bf98f442cab31edd5c307c53b1884d70bd.1494939394.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 06/20] python: make profile-optimized build possible
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
X-List-Received-Date: Tue, 16 May 2017 13:19:02 -0000

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
 meta/recipes-devtools/python/python_2.7.13.bb | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python_2.7.13.bb b/meta/recipes-devtools/python/python_2.7.13.bb
index efe02aa8a3..d9e458cf72 100644
--- a/meta/recipes-devtools/python/python_2.7.13.bb
+++ b/meta/recipes-devtools/python/python_2.7.13.bb
@@ -42,6 +42,17 @@ EXTRA_OECONF += "ac_cv_file__dev_ptmx=yes ac_cv_file__dev_ptc=no"
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
@@ -79,9 +90,15 @@ do_compile() {
 
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
@@ -99,6 +116,11 @@ do_install() {
 
 	export CROSS_COMPILE="${TARGET_PREFIX}"
 	export PYTHONBUILDDIR="${B}"
+    # This only has effect if we build with -fprofile-use, e.g. when make
+    # target is build_all_use_profile
+    if [ -n "${PYTHON_PROFILE_DIR}" ]; then
+        export EXTRA_CFLAGS="-fprofile-dir=${PYTHON_PROFILE_DIR}"
+    fi
 
 	# After swizzling the makefile, we need to run the build again.
 	# install can race with the build so we have to run this first, then install
@@ -146,6 +168,7 @@ py_package_preprocess () {
     python -m py_compile ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
 }
 
+
 require python-${PYTHON_MAJMIN}-manifest.inc
 
 # manual dependency additions
-- 
2.12.0


