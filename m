Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3B6CA60FF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 04:21:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Feb 2020 20:21:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,482,1574150400"; d="scan'208";a="226217589"
Received: from wrath.jf.intel.com ([10.54.31.24])
	by orsmga007.jf.intel.com with ESMTP; 24 Feb 2020 20:21:45 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2020 20:21:42 -0800
Message-Id: <20200225042142.39745-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] python3-scons{-native}: upgrade 3.1.1 -> 3.1.2
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
X-List-Received-Date: Tue, 25 Feb 2020 04:21:45 -0000
Content-Transfer-Encoding: 8bit

THis release is a mix of improvements and fixes:
https://github.com/SCons/scons/blob/3.1.2/src/RELEASE.txt

* Changed to inherit pypi rather than relying on SOURCEFORGE_MIRROR.
* Add SRC_URI for LICENSE file (not included in pypi tarball).
* Make it more obvious that RDEPENDS are for class-target and
  drop empty RDEPENDS from -native
* python3-scons-native now DEPENDS on python3-setuptools-native

* Tested with core-image-base + packagegroup-core-buildessential
  with "scons" oe-selftest via testimage.
* Tested build of "serf" (which uses python3-scons-native via the
  scons.bbclass).

License-Update: Added "MIT License" text, updated copyright years

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...3.1.1.bb => python3-scons-native_3.1.2.bb} |  3 +-
 .../python/python3-scons_3.1.1.bb             | 29 ----------------
 .../python/python3-scons_3.1.2.bb             | 33 +++++++++++++++++++
 3 files changed, 34 insertions(+), 31 deletions(-)
 rename meta/recipes-devtools/python/{python3-scons-native_3.1.1.bb => python3-scons-native_3.1.2.bb} (79%)
 delete mode 100644 meta/recipes-devtools/python/python3-scons_3.1.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-scons_3.1.2.bb

diff --git a/meta/recipes-devtools/python/python3-scons-native_3.1.1.bb b/meta/recipes-devtools/python/python3-scons-native_3.1.2.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-scons-native_3.1.1.bb
rename to meta/recipes-devtools/python/python3-scons-native_3.1.2.bb
index 5cd5956625..9e127304d6 100644
--- a/meta/recipes-devtools/python/python3-scons-native_3.1.1.bb
+++ b/meta/recipes-devtools/python/python3-scons-native_3.1.2.bb
@@ -1,7 +1,6 @@
 require python3-scons_${PV}.bb
 inherit native python3native
-DEPENDS = "python3-native"
-RDEPENDS_${PN} = ""
+DEPENDS = "python3-native python3-setuptools-native"
 
 do_install_append() {
     create_wrapper ${D}${bindir}/scons SCONS_LIB_DIR='${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}' PYTHONNOUSERSITE='1'
diff --git a/meta/recipes-devtools/python/python3-scons_3.1.1.bb b/meta/recipes-devtools/python/python3-scons_3.1.1.bb
deleted file mode 100644
index 0c7aaeaeee..0000000000
--- a/meta/recipes-devtools/python/python3-scons_3.1.1.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Software Construction tool (make/autotools replacement)"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=37bb53a08e6beaea0c90e7821d731284"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
-SRC_URI[md5sum] = "35b2a3993313bbedd221d4d5758fd2fd"
-SRC_URI[sha256sum] = "4cea417fdd7499a36f407923d03b4b7000b0f9e8fd7b31b316b9ce7eba9143a5"
-
-S = "${WORKDIR}/scons-${PV}"
-
-UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-
-inherit setuptools3
-
-do_install_prepend() {
-    sed -i -e "1s,#!.*python.*,#!${USRBINPATH}/env python3," ${S}/script/*
-}
-
-RDEPENDS_${PN} = "\
-  python3-core \
-  python3-fcntl \
-  python3-io \
-  python3-json \
-  python3-shell \
-  python3-pickle \
-  python3-pprint \
-  "
diff --git a/meta/recipes-devtools/python/python3-scons_3.1.2.bb b/meta/recipes-devtools/python/python3-scons_3.1.2.bb
new file mode 100644
index 0000000000..aa7a2a8300
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-scons_3.1.2.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Software Construction tool (make/autotools replacement)"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=e14e1b33428df24a40a782ae142785d0"
+
+# pypi package does not have a valid license file
+SRC_URI += "https://raw.githubusercontent.com/SCons/scons/${PV}/LICENSE;name=license"
+
+SRC_URI[md5sum] = "f9c4ad06dcf1427be95472eaf380c81a"
+SRC_URI[sha256sum] = "8aaa483c303efeb678e6f7c776c8444a482f8ddc3ad891f8b6cdd35264da9a1f"
+SRC_URI[license.md5sum] = "e14e1b33428df24a40a782ae142785d0"
+SRC_URI[license.sha256sum] = "72ed889165fb28378cadac14552be4a959f1ebab6b148abb5dd2b49712c3c6f6"
+
+S = "${WORKDIR}/scons-${PV}"
+
+UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
+
+inherit pypi setuptools3
+
+do_install_prepend() {
+    sed -i -e "1s,#!.*python.*,#!${USRBINPATH}/env python3," ${S}/script/*
+}
+
+RDEPENDS_${PN}_class-target = "\
+  python3-core \
+  python3-fcntl \
+  python3-io \
+  python3-json \
+  python3-shell \
+  python3-pickle \
+  python3-pprint \
+  "
-- 
2.24.0


