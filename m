Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 490A57198A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 21:07:42 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Oct 2017 14:07:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,398,1503385200"; d="scan'208";a="162077679"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga005.jf.intel.com with ESMTP; 18 Oct 2017 14:07:43 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Oct 2017 14:07:39 -0700
Message-Id: <1c8cd04d5697f04de1ecb31734d91a7d48d002c8.1508360667.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1508360667.git.alejandro.hernandez@linux.intel.com>
References: <cover.1508360667.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1508360667.git.alejandro.hernandez@linux.intel.com>
References: <cover.1508360667.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 3/4] python3: fix RDEPENDS on several recipes, due to non-existent python3 packages
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
X-List-Received-Date: Wed, 18 Oct 2017 21:07:43 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-core/libxml/libxml2_2.9.5.bb          |  2 +-
 .../bootchart2/bootchart2_0.14.8.bb                |  2 +-
 meta/recipes-devtools/dnf/dnf_2.6.3.bb             | 26 ++++++++++++++++++++--
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |  4 ++--
 .../opkg-utils/opkg-utils_0.3.5.bb                 |  2 +-
 .../python-numpy/python3-numpy_1.13.3.bb           |  2 --
 .../recipes-devtools/python/python3-async_0.6.2.bb |  2 +-
 meta/recipes-devtools/python/python3-git_2.1.7.bb  |  2 +-
 .../recipes-devtools/python/python3-gitdb_0.6.4.bb |  2 +-
 meta/recipes-devtools/python/python3-pip_9.0.1.bb  |  1 -
 .../python/python3-pygobject_3.26.0.bb             |  2 +-
 .../python/python3-setuptools_36.5.0.bb            |  3 ---
 .../recipes-devtools/python/python3-smmap_0.9.0.bb |  2 +-
 .../qemu/nativesdk-qemu-helper_1.0.bb              |  2 +-
 meta/recipes-graphics/piglit/piglit_git.bb         |  4 ++--
 meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb        |  2 +-
 meta/recipes-rt/rt-tests/rt-tests_1.1.bb           |  2 +-
 17 files changed, 39 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.5.bb b/meta/recipes-core/libxml/libxml2_2.9.5.bb
index df060d72662..b7e60ed9948 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.5.bb
@@ -39,7 +39,7 @@ inherit autotools pkgconfig binconfig-disabled ptest
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
 
-RDEPENDS_${PN}-ptest += "make ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-argparse python3-logging python3-shell python3-signal python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
+RDEPENDS_${PN}-ptest += "make ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-logging python3-shell  python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
 
 RDEPENDS_${PN}-python += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-core', '', d)}"
 
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
index a3101351ee7..c047be1e85b 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
@@ -139,7 +139,7 @@ do_install () {
 
 PACKAGES =+ "pybootchartgui"
 FILES_pybootchartgui += "${PYTHON_SITEPACKAGES_DIR}/pybootchartgui ${bindir}/pybootchartgui"
-RDEPENDS_pybootchartgui = "python3-pycairo python3-compression python3-image python3-textutils python3-shell python3-compression python3-codecs"
+RDEPENDS_pybootchartgui = "python3-pycairo python3-compression python3-image python3-shell python3-compression python3-codecs"
 RDEPENDS_${PN}_class-target += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
 RDEPENDS_${PN}_class-target += "lsb"
 DEPENDS_append_class-native = " python3-pycairo-native"
diff --git a/meta/recipes-devtools/dnf/dnf_2.6.3.bb b/meta/recipes-devtools/dnf/dnf_2.6.3.bb
index 3ed6a74570f..39d9b92f6ec 100644
--- a/meta/recipes-devtools/dnf/dnf_2.6.3.bb
+++ b/meta/recipes-devtools/dnf/dnf_2.6.3.bb
@@ -26,8 +26,30 @@ DEPENDS += "libdnf librepo libcomps python3-iniparse"
 EXTRA_OECMAKE = " -DWITH_MAN=0 -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
 
 BBCLASSEXTEND = "native nativesdk"
-RDEPENDS_${PN}_class-target += "python3-core python3-codecs python3-netclient python3-email python3-threading python3-distutils librepo python3-shell python3-subprocess libcomps libdnf python3-sqlite3 python3-compression python3-rpm python3-iniparse python3-json python3-importlib python3-curses python3-argparse python3-misc python3-gpg"
-# Recommend gnupg so that GPG signature check on repository metadata is possible
+
+RDEPENDS_${PN}_class-target += " \
+  python3-core \
+  python3-codecs \
+  python3-netclient \
+  python3-email \
+  python3-threading \
+  python3-distutils \
+  python3-logging \
+  python3-fcntl \
+  librepo \
+  python3-shell \
+  libcomps \
+  libdnf \
+  python3-sqlite3 \
+  python3-compression \
+  python3-rpm \
+  python3-iniparse \
+  python3-json \
+  python3-curses \
+  python3-misc \
+  python3-gpg \
+  "
+
 RRECOMMENDS_${PN}_class-target += "gnupg"
 
 # Create a symlink called 'dnf' as 'make install' does not do it, but
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 3ff19895388..4fc6747d9da 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -13,9 +13,9 @@ GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 # Overrides PACKAGECONFIG variables in gdb-common.inc
 PACKAGECONFIG ??= "python readline"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,nativesdk-python3, \
-                         nativesdk-python3-core nativesdk-python3-lang nativesdk-python3-re \
+                         nativesdk-python3-core \
                          nativesdk-python3-codecs nativesdk-python3-netclient \
-                         nativesdk-python3-importlib"
+                         "
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,nativesdk-readline"
 
 SSTATE_DUPWHITELIST += "${STAGING_DATADIR}/gdb"
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
index 646cc8ff9a8..d14d89ff873 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "7f4b08912e26a3f4f6f423f3b4e7157a73b1f3a7483fc59b216d1a80b5
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 # For native builds we use the host Python
-PYTHONRDEPS = "python3 python3-shell python3-io python3-math python3-crypt python3-logging python3-fcntl python3-subprocess python3-pickle python3-compression python3-textutils python3-stringold"
+PYTHONRDEPS = "python3 python3-shell python3-io python3-math python3-crypt python3-logging python3-fcntl python3-pickle python3-compression python3-stringold"
 PYTHONRDEPS_class-native = ""
 
 PACKAGECONFIG = "python update-alternatives"
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.13.3.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.13.3.bb
index 42b2a18a5b8..277c21f9da4 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.13.3.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.13.3.bb
@@ -102,11 +102,9 @@ RDEPENDS_${PN} = "python3-unittest \
                   python3-pydoc \
                   python3-pkgutil \
                   python3-email \
-                  python3-subprocess \
                   python3-compression \
                   python3-ctypes \
                   python3-threading \
-                  python3-textutils \
 "
 
 RDEPENDS_${PN}_class-native = ""
diff --git a/meta/recipes-devtools/python/python3-async_0.6.2.bb b/meta/recipes-devtools/python/python3-async_0.6.2.bb
index 54a30f5498e..f45781c44f8 100644
--- a/meta/recipes-devtools/python/python3-async_0.6.2.bb
+++ b/meta/recipes-devtools/python/python3-async_0.6.2.bb
@@ -2,5 +2,5 @@ require python-async.inc
 
 inherit setuptools3
 
-RDEPENDS_${PN} += "python3-threading python3-lang"
+RDEPENDS_${PN} += "python3-threading"
 
diff --git a/meta/recipes-devtools/python/python3-git_2.1.7.bb b/meta/recipes-devtools/python/python3-git_2.1.7.bb
index 4ac2a0ec799..ca42688f97e 100644
--- a/meta/recipes-devtools/python/python3-git_2.1.7.bb
+++ b/meta/recipes-devtools/python/python3-git_2.1.7.bb
@@ -4,4 +4,4 @@ DEPENDS = "python3-gitdb"
 
 inherit setuptools3
 
-RDEPENDS_${PN} += "python3-gitdb python3-lang python3-io python3-shell python3-math python3-re python3-subprocess python3-stringold python3-unixadmin python3-enum python3-logging python3-datetime python3-netclient python3-unittest python3-argparse git"
+RDEPENDS_${PN} += "python3-gitdb python3-io python3-shell python3-math python3-stringold python3-unixadmin python3-logging python3-datetime python3-netclient python3-unittest git"
diff --git a/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb b/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb
index 80d9d469aff..a209c52f9ee 100644
--- a/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb
+++ b/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb
@@ -4,4 +4,4 @@ DEPENDS = "python3-async python3-smmap"
 
 inherit distutils3
 
-RDEPENDS_${PN} += "python3-smmap python3-async python3-mmap python3-lang python3-io python3-shell python3-crypt python3-compression"
+RDEPENDS_${PN} += "python3-smmap python3-async python3-mmap python3-io python3-shell python3-crypt python3-compression"
diff --git a/meta/recipes-devtools/python/python3-pip_9.0.1.bb b/meta/recipes-devtools/python/python3-pip_9.0.1.bb
index 9b907a26319..a6dd72df3b1 100644
--- a/meta/recipes-devtools/python/python3-pip_9.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_9.0.1.bb
@@ -44,7 +44,6 @@ do_install_append() {
 RDEPENDS_${PN} = "\
   python3-compile \
   python3-io \
-  python3-enum \
   python3-html \
   python3-json \
   python3-netserver \
diff --git a/meta/recipes-devtools/python/python3-pygobject_3.26.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.26.0.bb
index f368e6cce94..10a4650185e 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.26.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.26.0.bb
@@ -24,7 +24,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'directfb', 'wa
 # we don't link against python3-pycairo -> RDEPENDS
 PACKAGECONFIG[cairo] = "--enable-cairo,--disable-cairo,cairo python3-pycairo, python3-pycairo"
 
-RDEPENDS_${PN} += "python3-setuptools python3-importlib"
+RDEPENDS_${PN} += "python3-setuptools"
 
 BBCLASSEXTEND = "native"
 PACKAGECONFIG_class-native = ""
diff --git a/meta/recipes-devtools/python/python3-setuptools_36.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_36.5.0.bb
index 63f241809e0..dab8ad89b01 100644
--- a/meta/recipes-devtools/python/python3-setuptools_36.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_36.5.0.bb
@@ -23,12 +23,9 @@ RDEPENDS_${PN} = "\
   python3-ctypes \
   python3-distutils \
   python3-email \
-  python3-importlib \
   python3-numbers \
   python3-compression \
   python3-shell \
-  python3-subprocess \
-  python3-textutils \
   python3-pkgutil \
   python3-threading \
   python3-misc \
diff --git a/meta/recipes-devtools/python/python3-smmap_0.9.0.bb b/meta/recipes-devtools/python/python3-smmap_0.9.0.bb
index 9f8a26d79ed..1df74c172c4 100644
--- a/meta/recipes-devtools/python/python3-smmap_0.9.0.bb
+++ b/meta/recipes-devtools/python/python3-smmap_0.9.0.bb
@@ -2,4 +2,4 @@ require python-smmap.inc
 
 inherit setuptools3
 
-RDEPENDS_${PN} += "python3-codecs python3-mmap python3-lang"
+RDEPENDS_${PN} += "python3-codecs python3-mmap"
diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index 943ca5f89dc..1a9ad5cc2b9 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Qemu helper scripts"
 LICENSE = "GPLv2"
-RDEPENDS_${PN} = "nativesdk-qemu nativesdk-python3-subprocess \
+RDEPENDS_${PN} = "nativesdk-qemu \
                   nativesdk-python3-shell nativesdk-python3-fcntl \
                 "
 
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index d274a8fbd56..f7726f35773 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -45,9 +45,9 @@ do_install() {
 }
 
 RDEPENDS_${PN} = "waffle python3 python3-mako python3-json \
-	python3-subprocess python3-misc python3-importlib \
+	python3-misc \
 	python3-unixadmin python3-xml python3-multiprocessing \
-	python3-six python3-shell python3-io python3-argparse \
+	python3-six python3-shell python3-io \
 	python3-netserver mesa-demos bash \
 	"
 
diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb b/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
index 012b2dd0a7d..60b44a4d258 100644
--- a/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
@@ -22,5 +22,5 @@ do_install() {
 }
 
 FILES_${PN} += "${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py"
-RDEPENDS_${PN} = "python3 python3-subprocess python3-textutils"
+RDEPENDS_${PN} = "python3 "
 RRECOMMENDS_${PN} = "kernel-module-hwlat-detector"
diff --git a/meta/recipes-rt/rt-tests/rt-tests_1.1.bb b/meta/recipes-rt/rt-tests/rt-tests_1.1.bb
index 4336c50d631..496f04fdbae 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_1.1.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_1.1.bb
@@ -26,6 +26,6 @@ do_install_ptest() {
         cp ${WORKDIR}/rt_bmark.py ${D}${PTEST_PATH}
 }
 
-RDEPENDS_${PN}-ptest += " stress python3 python3-subprocess python3-multiprocessing python3-datetime python3-re python3-lang python3-misc"
+RDEPENDS_${PN}-ptest += " stress python3 python3-multiprocessing python3-datetime python3-misc"
 
 FILES_${PN} += "${prefix}/src/backfire"
-- 
2.12.3


