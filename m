Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BBF5071BF9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:36:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2017 02:36:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,186,1484035200"; d="scan'208";a="1132314538"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 20 Feb 2017 02:36:08 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Feb 2017 12:35:47 +0200
Message-Id: <20170220103551.20022-16-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170220103551.20022-1-markus.lehtonen@linux.intel.com>
References: <20170220103551.20022-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 16/20] python3: support profile optimized build
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
X-List-Received-Date: Mon, 20 Feb 2017 10:36:09 -0000

Make it possible to do profile-optimized build. The implementation is
virtually identical to how we do it in Python 2.7. Basically, you need
to define PYTHON3_PROFILE_OPT = "1" in your local.conf and have profile
data available in the location pointed to by PYTHON3_PROFILE_DIR.
Profile data can be obtainen e.g. by running bitbake python-pgo-image -c
profile3.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/python/python3_3.5.2.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.5.2.bb b/meta/recipes-devtools/python/python3_3.5.2.bb
index 18d683e..7a3d2b3 100644
--- a/meta/recipes-devtools/python/python3_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3_3.5.2.bb
@@ -78,6 +78,17 @@ export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dy
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
@@ -117,6 +128,10 @@ do_compile() {
     if [ "${PYTHON3_MAKE_TARGET}" = "build_all_generate_profile" ]; then
         # This is only used in PGO profiling by python-profile-opt package
         export EXTRA_CFLAGS="-fprofile-dir=./python3-pgo-profiles/"
+    elif [ -n "${PYTHON3_PROFILE_DIR}" ]; then
+            export EXTRA_CFLAGS="-fprofile-dir=${PYTHON3_PROFILE_DIR}"
+            # Remove non-optimized build artefacts
+            oe_runmake clean
     fi
 
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
@@ -137,6 +152,11 @@ do_install() {
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
2.10.2


