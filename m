Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9B7A777A93
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 13:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491570890; x=1523106890;
	h=from:to:cc:subject:date:message-id;
	bh=/eQ+LNsLojGNiIz7oo9nceIXAduuZffqVHoHGyveJR8=;
	b=NPov0btjUezXSLy5hqemdObEnHTQewM9+onQFqApRvkPEZBc68pCI2m8
	F13oRjkb2TW74L9KpKcJW4rbtaq4qA==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Apr 2017 06:14:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,165,1488873600"; d="scan'208";a="245852313"
Received: from drozhkov-desk.fi.intel.com ([10.237.72.60])
	by fmsmga004.fm.intel.com with ESMTP; 07 Apr 2017 06:14:48 -0700
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 16:14:16 +0300
Message-Id: <20170407131416.5329-1-dmitry.rozhkov@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH v2] python-pycurl: create python3-pycurl recipe
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
X-List-Received-Date: Fri, 07 Apr 2017 13:14:50 -0000

The python-pycurl recipe can be used with python2 only even
though python3 is officially supported by upstream.

Create python3-pycurl recipe enabling the pycurl module for
python3.

Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
---

Changes in v2:
- redefine SECURITY_CFLAGS for python3-pycurl to drop PIE cflag.
  Otherwise poky-lsb builds fail.

 meta/conf/distro/include/security_flags.inc        |  1 +
 meta/recipes-devtools/python/python-pycurl.inc     | 31 +++++++++++++++++++++
 .../python/python-pycurl_7.21.5.bb                 | 32 +---------------------
 .../python/python3-pycurl_7.21.5.bb                |  5 ++++
 4 files changed, 38 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-pycurl.inc
 create mode 100644 meta/recipes-devtools/python/python3-pycurl_7.21.5.bb

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 6df1842..e162abe 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -76,6 +76,7 @@ SECURITY_CFLAGS_pn-python-pycurl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-numpy = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python3-numpy = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python3-pycairo = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-python3-pycurl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python3-pygpgme = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python3 = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-syslinux = "${SECURITY_NO_PIE_CFLAGS}"
diff --git a/meta/recipes-devtools/python/python-pycurl.inc b/meta/recipes-devtools/python/python-pycurl.inc
new file mode 100644
index 0000000..d26318b
--- /dev/null
+++ b/meta/recipes-devtools/python/python-pycurl.inc
@@ -0,0 +1,31 @@
+SUMMARY = "Python bindings for libcurl"
+HOMEPAGE = "http://pycurl.sourceforge.net/"
+SECTION = "devel/python"
+LICENSE = "LGPLv2.1+ | MIT"
+LIC_FILES_CHKSUM = "file://README.rst;beginline=166;endline=182;md5=a84a1caa65b89d4584b693d3680062fb \
+                    file://COPYING-LGPL;md5=3579a9fd0221d49a237aaa33492f988c \
+                    file://COPYING-MIT;md5=b7e434aeb228ed731c00bcf177e79b19"
+
+DEPENDS = "curl ${PYTHON_PN}"
+RDEPENDS_${PN} = "${PYTHON_PN}-core curl"
+SRCNAME = "pycurl"
+
+SRC_URI = "\
+  http://${SRCNAME}.sourceforge.net/download/${SRCNAME}-${PV}.tar.gz;name=archive \
+  file://no-static-link.patch \
+"
+
+SRC_URI[archive.md5sum] = "bca7bf47320082588db544ced2ba8717"
+SRC_URI[archive.sha256sum] = "8a1e0eb55573388275a1d6c2534ca4cfca5d7fa772b99b505c08fa149b27aed0"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+BBCLASSEXTEND = "native"
+
+# Ensure the docstrings are generated as make clean will remove them
+do_compile_prepend() {
+	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py docstrings
+}
+
+do_install_append() {
+	rm -rf ${D}${datadir}/share
+}
diff --git a/meta/recipes-devtools/python/python-pycurl_7.21.5.bb b/meta/recipes-devtools/python/python-pycurl_7.21.5.bb
index 7b41f6d..eb70cea 100644
--- a/meta/recipes-devtools/python/python-pycurl_7.21.5.bb
+++ b/meta/recipes-devtools/python/python-pycurl_7.21.5.bb
@@ -1,33 +1,3 @@
-SUMMARY = "Python bindings for libcurl"
-HOMEPAGE = "http://pycurl.sourceforge.net/"
-SECTION = "devel/python"
-LICENSE = "LGPLv2.1+ | MIT"
-LIC_FILES_CHKSUM = "file://README.rst;beginline=166;endline=182;md5=a84a1caa65b89d4584b693d3680062fb \
-                    file://COPYING-LGPL;md5=3579a9fd0221d49a237aaa33492f988c \
-                    file://COPYING-MIT;md5=b7e434aeb228ed731c00bcf177e79b19"
-
-DEPENDS = "curl python"
-RDEPENDS_${PN} = "python-core curl"
-SRCNAME = "pycurl"
-
-SRC_URI = "\
-  http://${SRCNAME}.sourceforge.net/download/${SRCNAME}-${PV}.tar.gz;name=archive \
-  file://no-static-link.patch \
-"
-
-SRC_URI[archive.md5sum] = "bca7bf47320082588db544ced2ba8717"
-SRC_URI[archive.sha256sum] = "8a1e0eb55573388275a1d6c2534ca4cfca5d7fa772b99b505c08fa149b27aed0"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+require python-pycurl.inc
 
 inherit distutils
-
-BBCLASSEXTEND = "native"
-
-# Ensure the docstrings are generated as make clean will remove them
-do_compile_prepend() {
-	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py docstrings
-}
-
-do_install_append() {
-	rm -rf ${D}${datadir}/share
-}
diff --git a/meta/recipes-devtools/python/python3-pycurl_7.21.5.bb b/meta/recipes-devtools/python/python3-pycurl_7.21.5.bb
new file mode 100644
index 0000000..5d11192
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycurl_7.21.5.bb
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-pycurl:"
+
+require python-pycurl.inc
+
+inherit distutils3
-- 
2.9.3


