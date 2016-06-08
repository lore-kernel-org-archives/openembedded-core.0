Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 648CD731D5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 05:57:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jun 2016 22:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,437,1459839600"; d="scan'208";a="993287627"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2016 22:57:09 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jun 2016 05:56:11 +0000
Message-Id: <a3db900e913933abfb5dc94fa7f5c5e491ec8c06.1465365165.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <12b9dd4338999b75a21fd1d293fa911e9dca3f1e.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <12b9dd4338999b75a21fd1d293fa911e9dca3f1e.1465365165.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 5/9] python-numpy: Upgrade from 1.10.4 to 1.11.0
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
X-List-Received-Date: Wed, 08 Jun 2016 05:57:10 -0000

Upgrades python-numpy and python3-numpy to 1.11.0,
Drops using distutils class, to use setuptools class instead,
this fixes a problem where after compilation the package was created
as an egg, see YOCTO #8673
Fixes source location for both packages and also adds a new patch
to fix the shebang on the f2py script, see YOCTO #9729

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../python-numpy/files/fix_shebang_f2py.patch      | 29 ++++++++++++++++++++++
 ...thon-numpy_1.10.4.bb => python-numpy_1.11.0.bb} | 14 ++++++-----
 ...on3-numpy_1.10.4.bb => python3-numpy_1.11.0.bb} | 15 ++++++-----
 3 files changed, 46 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-devtools/python-numpy/files/fix_shebang_f2py.patch
 rename meta/recipes-devtools/python-numpy/{python-numpy_1.10.4.bb => python-numpy_1.11.0.bb} (85%)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.10.4.bb => python3-numpy_1.11.0.bb} (84%)

diff --git a/meta/recipes-devtools/python-numpy/files/fix_shebang_f2py.patch b/meta/recipes-devtools/python-numpy/files/fix_shebang_f2py.patch
new file mode 100644
index 0000000..6c61b09
--- /dev/null
+++ b/meta/recipes-devtools/python-numpy/files/fix_shebang_f2py.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Avoids using python from the HOSTs native sysroot for f2py,
+uses TARGET env python instead.
+
+Signed-Off-By: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
+
+Index: numpy-1.11.0/numpy/f2py/setup.py
+===================================================================
+--- numpy-1.11.0.orig/numpy/f2py/setup.py
++++ numpy-1.11.0/numpy/f2py/setup.py
+@@ -37,10 +37,13 @@ def _get_f2py_shebang():
+     should be ``#!python`` rather than ``#!`` followed by the contents of
+     ``sys.executable``.
+     """
+-    if set(('bdist_wheel', 'bdist_egg', 'bdist_wininst',
+-            'bdist_rpm')).intersection(sys.argv):
+-        return '#!python'
+-    return '#!' + sys.executable
++    #if set(('bdist_wheel', 'bdist_egg', 'bdist_wininst',
++    #        'bdist_rpm')).intersection(sys.argv):
++    #    return '#!python'
++    #return '#!' + sys.executable
++    
++    # On OE, we need to avoid using the HOSTs python-native, we return env python instead
++    return '#!/usr/bin/env python'
+ 
+ 
+ def configuration(parent_package='', top_path=None):
diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.10.4.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.11.0.bb
similarity index 85%
rename from meta/recipes-devtools/python-numpy/python-numpy_1.10.4.bb
rename to meta/recipes-devtools/python-numpy/python-numpy_1.11.0.bb
index ca6a7ab..51ef171 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy_1.10.4.bb
+++ b/meta/recipes-devtools/python-numpy/python-numpy_1.11.0.bb
@@ -1,12 +1,14 @@
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
 LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9f4e88b5748e8313caaf33d081ce65a3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7e51a5677b22b865abbfb3dff6ffb2d0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
+SRCNAME = "numpy"
+
+SRC_URI = "https://files.pythonhosted.org/packages/source/n/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://remove-build-path-in-comments.patch \
-           file://add-glibc-check.patch \
+           file://fix_shebang_f2py.patch \
            ${CONFIGFILESURI} "
 
 CONFIGFILESURI ?= ""
@@ -58,7 +60,7 @@ CONFIGFILESURI_mips64n32 = " \
 
 S = "${WORKDIR}/numpy-${PV}"
 
-inherit distutils
+inherit setuptools
 
 # Make the build fail and replace *config.h with proper one
 # This is a ugly, ugly hack - Koen
@@ -70,8 +72,8 @@ do_compile_prepend_class-target() {
 
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
 
-SRC_URI[md5sum] = "90bb9034652cefbada19cf7d141a6a61"
-SRC_URI[sha256sum] = "f7f91842056a7cf680b0eaf8cefc5e46c69e2521e651128d2e6aaaccec8652ae"
+SRC_URI[md5sum] = "bc56fb9fc2895aa4961802ffbdb31d0b"
+SRC_URI[sha256sum] = "a1d1268d200816bfb9727a7a27b78d8e37ecec2e4d5ebd33eb64e2789e0db43e"
 
 # install what is needed for numpy.test()
 RDEPENDS_${PN} = "python-unittest \
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.10.4.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.11.0.bb
similarity index 84%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.10.4.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.11.0.bb
index dcd23ac..218909b 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.10.4.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.11.0.bb
@@ -1,12 +1,14 @@
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
 LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9f4e88b5748e8313caaf33d081ce65a3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7e51a5677b22b865abbfb3dff6ffb2d0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
+SRCNAME = "numpy"
+
+SRC_URI = "https://files.pythonhosted.org/packages/source/n/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://remove-build-path-in-comments.patch \
-           file://add-glibc-check.patch \
+           file://fix_shebang_f2py.patch \
            ${CONFIGFILESURI} "
 
 CONFIGFILESURI ?= ""
@@ -58,7 +60,7 @@ CONFIGFILESURI_mips64n32 = " \
 
 S = "${WORKDIR}/numpy-${PV}"
 
-inherit distutils3
+inherit setuptools3
 
 # Make the build fail and replace *config.h with proper one
 # This is a ugly, ugly hack - Koen
@@ -70,8 +72,8 @@ do_compile_prepend_class-target() {
 
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
 
-SRC_URI[md5sum] = "90bb9034652cefbada19cf7d141a6a61"
-SRC_URI[sha256sum] = "f7f91842056a7cf680b0eaf8cefc5e46c69e2521e651128d2e6aaaccec8652ae"
+SRC_URI[md5sum] = "bc56fb9fc2895aa4961802ffbdb31d0b"
+SRC_URI[sha256sum] = "a1d1268d200816bfb9727a7a27b78d8e37ecec2e4d5ebd33eb64e2789e0db43e"
 
 # install what is needed for numpy.test()
 RDEPENDS_${PN} = "python3-unittest \
@@ -94,6 +96,7 @@ RDEPENDS_${PN} = "python3-unittest \
                   python3-compression \
                   python3-ctypes \
                   python3-threading \
+                  python3-textutils \
 "
 
 RDEPENDS_${PN}_class-native = ""
-- 
2.6.6


