Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7E395731D7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 05:57:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jun 2016 22:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,437,1459839600"; d="scan'208";a="993287628"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2016 22:57:09 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jun 2016 05:56:12 +0000
Message-Id: <0081f309e834eacff1ca4817a381a3d24e8709c0.1465365165.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <12b9dd4338999b75a21fd1d293fa911e9dca3f1e.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <12b9dd4338999b75a21fd1d293fa911e9dca3f1e.1465365165.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 6/9] python-pexpect: Upgrade from 4.0.1 to 4.1.0
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
X-List-Received-Date: Wed, 08 Jun 2016 05:57:11 -0000

Fixes source location, uses setuptools instead of distutils
Adds python-ptyprocess package, since it is now a runtime
dependency for python-pexpect

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 ...hon-pexpect_4.0.1.bb => python-pexpect_4.1.0.bb} | 11 +++++++----
 .../python/python-ptyprocess_0.5.1.bb               | 21 +++++++++++++++++++++
 2 files changed, 28 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python-pexpect_4.0.1.bb => python-pexpect_4.1.0.bb} (60%)
 create mode 100644 meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb

diff --git a/meta/recipes-devtools/python/python-pexpect_4.0.1.bb b/meta/recipes-devtools/python/python-pexpect_4.1.0.bb
similarity index 60%
rename from meta/recipes-devtools/python/python-pexpect_4.0.1.bb
rename to meta/recipes-devtools/python/python-pexpect_4.1.0.bb
index 7f142a3..10590e4 100644
--- a/meta/recipes-devtools/python/python-pexpect_4.0.1.bb
+++ b/meta/recipes-devtools/python/python-pexpect_4.1.0.bb
@@ -4,15 +4,17 @@ SECTION = "devel/python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=66c2378a96b307d56bfb3a9e58edafa8"
 
-SRC_URI = "https://pypi.python.org/packages/source/p/pexpect/pexpect-${PV}.tar.gz"
-SRC_URI[md5sum] = "056df81e6ca7081f1015b4b147b977b7"
-SRC_URI[sha256sum] = "232795ebcaaf2e120396dbbaa3a129eda51757eeaae1911558f4ef8ee414fc6c"
+SRCNAME = "pexpect"
+
+SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "562a1a21f2a60b36dfd5d906dbf0943e"
+SRC_URI[sha256sum] = "c381c60f1987355b65df8f08a27f428831914c8a81091bd1778ac336fa2f27e7"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
 
 S = "${WORKDIR}/pexpect-${PV}"
 
-inherit distutils
+inherit setuptools
 
 RDEPENDS_${PN} = "\
     python-core \
@@ -20,6 +22,7 @@ RDEPENDS_${PN} = "\
     python-terminal \
     python-resource \
     python-fcntl \
+    python-ptyprocess \
 "
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb b/meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb
new file mode 100644
index 0000000..a9f7b4f
--- /dev/null
+++ b/meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Run a subprocess in a pseudo terminal"
+HOMEPAGE = "http://ptyprocess.readthedocs.io/en/latest/"
+SECTION = "devel/python"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cfdcd51fa7d5808da4e74346ee394490"
+
+SRCNAME = "ptyprocess"
+
+SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "94e537122914cc9ec9c1eadcd36e73a1"
+SRC_URI[sha256sum] = "0530ce63a9295bfae7bd06edc02b6aa935619f486f0f1dc0972f516265ee81a6"
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ptyprocess"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} = "\
+    python-core \
+"
-- 
2.6.6


