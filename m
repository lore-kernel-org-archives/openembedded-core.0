Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7470E782A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 10:08:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Oct 2017 03:08:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,304,1505804400"; d="scan'208";a="1236012590"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2017 03:08:01 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Oct 2017 13:07:50 +0300
Message-Id: <a3c7f9f84d5dc31442950e4766c2e34145928b1c.1509094533.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v5 07/10] python3: support profile optimized build
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
X-List-Received-Date: Fri, 27 Oct 2017 10:08:00 -0000

This patch makes it possible to build python3 with profile directed
optimization. That is, feed python build process with profile data to
guide optimization. This is the third (and the last) step in profile
directed optimization for Python 3.x.

In order to do a profile-optimized build you need to specify
PYTHON3_PROFILE_OPT = "1" in your local.conf, and, have profile data available
in the location pointed to by PYTHON3_PROFILE_DIR. Profile data can be
obtainen e.g. by running bitbake python-pgo-image -c profile3.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/python/python3_3.5.3.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.5.3.bb b/meta/recipes-devtools/python/python3_3.5.3.bb
index 3522b74991..1115c3feba 100644
--- a/meta/recipes-devtools/python/python3_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3_3.5.3.bb
@@ -79,6 +79,17 @@ export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dy
 # No ctypes option for python 3
 PYTHONLSBOPTS = ""
 
+# Automatic profile guided optimization
+PYTHON3_MAKE_TARGET ?= "${@'build_all_use_profile' if d.getVar('PYTHON3_PROFILE_OPT', True) == '1' else ''}"
+PYTHON3_PROFILE_DIR ?= "${@'${TMPDIR}/work-shared/${MACHINE}/python3/pgo-data' if d.getVar('PYTHON3_PROFILE_OPT', True) == '1' else ''}"
+python () {
+    if (d.getVar('PYTHON3_PROFILE_OPT', True) == '1' and
+            d.getVar('PYTHON3_MAKE_TARGET', True) == 'build_all_use_profile'):
+        profile_dir = d.getVar('PYTHON3_PROFILE_DIR', True)
+        bb.utils.mkdirhier(profile_dir)
+        d.setVarFlag('do_compile', 'file-checksums', '%s:True' % profile_dir)
+}
+
 do_configure_append() {
 	rm -f ${S}/Makefile.orig
 	autoreconf -Wcross --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
@@ -118,6 +129,10 @@ do_compile() {
     if [ "${PYTHON3_MAKE_TARGET}" = "build_all_generate_profile" ]; then
         # This is only used in PGO profiling by python3-profile-opt package
         export EXTRA_CFLAGS="-fprofile-dir=./python3-pgo-profiles/"
+    elif [ -n "${PYTHON3_PROFILE_DIR}" ]; then
+            export EXTRA_CFLAGS="-fprofile-dir=${PYTHON3_PROFILE_DIR}"
+            # Remove non-optimized build artefacts
+            oe_runmake clean
     fi
 
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
@@ -138,6 +153,11 @@ do_install() {
 	install -d ${D}${libdir}/pkgconfig
 	install -d ${D}${libdir}/python${PYTHON_MAJMIN}/config
 
+    # This only has effect if we build with -fprofile-use, e.g. when make
+    # target is build_all_use_profile
+    if [ -n "${PYTHON3_PROFILE_DIR}" ]; then
+        export EXTRA_CFLAGS="-fprofile-dir=${PYTHON3_PROFILE_DIR}"
+    fi
 	# rerun the build once again with original makefile this time
 	# run install in a separate step to avoid compile/install race
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
-- 
2.13.6


