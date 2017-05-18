Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3E78060069
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 08:43:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 May 2017 01:43:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,358,1491289200"; d="scan'208";a="88535229"
Received: from dmcgahon-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.14.225])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2017 01:43:03 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 May 2017 11:42:55 +0300
Message-Id: <6ac89c5c7768b71776da4e6e590d8d535f3bf00d.1495095863.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1495095863.git.markus.lehtonen@linux.intel.com>
References: <cover.1495095863.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1495095863.git.markus.lehtonen@linux.intel.com>
References: <cover.1495095863.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v3 5/8] python3: support profile optimized build
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
X-List-Received-Date: Thu, 18 May 2017 08:43:03 -0000

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
 meta/recipes-devtools/python/python3_3.5.2.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.5.2.bb b/meta/recipes-devtools/python/python3_3.5.2.bb
index 97ecbab5e3..d40bc14d93 100644
--- a/meta/recipes-devtools/python/python3_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3_3.5.2.bb
@@ -76,6 +76,17 @@ export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dy
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
@@ -115,6 +126,10 @@ do_compile() {
     if [ "${PYTHON3_MAKE_TARGET}" = "build_all_generate_profile" ]; then
         # This is only used in PGO profiling by python3-profile-opt package
         export EXTRA_CFLAGS="-fprofile-dir=./python3-pgo-profiles/"
+    elif [ -n "${PYTHON3_PROFILE_DIR}" ]; then
+            export EXTRA_CFLAGS="-fprofile-dir=${PYTHON3_PROFILE_DIR}"
+            # Remove non-optimized build artefacts
+            oe_runmake clean
     fi
 
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
@@ -135,6 +150,11 @@ do_install() {
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
2.12.0


