Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 16D1877D85
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 14:28:31 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Apr 2017 07:28:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,384,1488873600"; d="scan'208";a="94884584"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2017 07:28:32 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 17:28:07 +0300
Message-Id: <f91e8f42613e93718268bc6a776912e558c3f8b9.1493302527.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
References: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/13] python-pycurl: remove the recipe
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
X-List-Received-Date: Thu, 27 Apr 2017 14:28:31 -0000

Nothing is using it in oe-core or meta-oe layers.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/python/python-pycurl.inc     | 31 ----------------------
 .../python/python-pycurl/no-static-link.patch      | 17 ------------
 .../python/python-pycurl_7.21.5.bb                 |  3 ---
 .../python/python3-pycurl_7.21.5.bb                |  5 ----
 4 files changed, 56 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-pycurl.inc
 delete mode 100644 meta/recipes-devtools/python/python-pycurl/no-static-link.patch
 delete mode 100644 meta/recipes-devtools/python/python-pycurl_7.21.5.bb
 delete mode 100644 meta/recipes-devtools/python/python3-pycurl_7.21.5.bb

diff --git a/meta/recipes-devtools/python/python-pycurl.inc b/meta/recipes-devtools/python/python-pycurl.inc
deleted file mode 100644
index d26318b6d22..00000000000
--- a/meta/recipes-devtools/python/python-pycurl.inc
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "Python bindings for libcurl"
-HOMEPAGE = "http://pycurl.sourceforge.net/"
-SECTION = "devel/python"
-LICENSE = "LGPLv2.1+ | MIT"
-LIC_FILES_CHKSUM = "file://README.rst;beginline=166;endline=182;md5=a84a1caa65b89d4584b693d3680062fb \
-                    file://COPYING-LGPL;md5=3579a9fd0221d49a237aaa33492f988c \
-                    file://COPYING-MIT;md5=b7e434aeb228ed731c00bcf177e79b19"
-
-DEPENDS = "curl ${PYTHON_PN}"
-RDEPENDS_${PN} = "${PYTHON_PN}-core curl"
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
diff --git a/meta/recipes-devtools/python/python-pycurl/no-static-link.patch b/meta/recipes-devtools/python/python-pycurl/no-static-link.patch
deleted file mode 100644
index 212779ca37e..00000000000
--- a/meta/recipes-devtools/python/python-pycurl/no-static-link.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
-diff -Naur pycurl-7.19.5.2-orig/setup.py pycurl-7.19.5.2/setup.py
---- pycurl-7.19.5.2-orig/setup.py	2015-11-02 15:42:24.000000000 +0200
-+++ pycurl-7.19.5.2/setup.py	2015-11-02 17:59:36.121527273 +0200
-@@ -154,7 +154,7 @@
-         optbuf = ''
-         sslhintbuf = ''
-         errtext = ''
--        for option in ["--libs", "--static-libs"]:
-+        for option in ["--libs"]:
-             p = subprocess.Popen((CURL_CONFIG, option),
-                 stdout=subprocess.PIPE, stderr=subprocess.PIPE)
-             stdout, stderr = p.communicate()
diff --git a/meta/recipes-devtools/python/python-pycurl_7.21.5.bb b/meta/recipes-devtools/python/python-pycurl_7.21.5.bb
deleted file mode 100644
index eb70cea6631..00000000000
--- a/meta/recipes-devtools/python/python-pycurl_7.21.5.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require python-pycurl.inc
-
-inherit distutils
diff --git a/meta/recipes-devtools/python/python3-pycurl_7.21.5.bb b/meta/recipes-devtools/python/python3-pycurl_7.21.5.bb
deleted file mode 100644
index 5d11192ab69..00000000000
--- a/meta/recipes-devtools/python/python3-pycurl_7.21.5.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-pycurl:"
-
-require python-pycurl.inc
-
-inherit distutils3
-- 
2.11.0


