Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED8860034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 21:45:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 18 Mar 2015 14:45:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,425,1422950400"; d="scan'208";a="469161281"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.44])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Mar 2015 14:45:05 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 15:42:15 -0600
Message-Id: <1426714935-3348-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] python-pexpect: Adds python-pexpect recipe
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
X-List-Received-Date: Wed, 18 Mar 2015 21:45:07 -0000

Creates a recipe for the pexpect module and adds it to buildtools, since it is needed by
some of the automated runtime test code.

[YOCTO #7279]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb       |  1 +
 meta/recipes-devtools/python/python-pexpect_3.3.bb | 23 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-pexpect_3.3.bb

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 302510c..6d4c8c8 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -12,6 +12,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-python-modules \
     nativesdk-python-misc \
     nativesdk-python-git \
+    nativesdk-python-pexpect \
     nativesdk-ncurses-terminfo-base \
     nativesdk-chrpath \
     nativesdk-tar \
diff --git a/meta/recipes-devtools/python/python-pexpect_3.3.bb b/meta/recipes-devtools/python/python-pexpect_3.3.bb
new file mode 100644
index 0000000..cd80aeb
--- /dev/null
+++ b/meta/recipes-devtools/python/python-pexpect_3.3.bb
@@ -0,0 +1,23 @@
+SUMMARY = "A Pure Python Expect like Module for Python"
+HOMEPAGE = "http://pexpect.readthedocs.org/"
+SECTION = "devel/python"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c25d9a0770ba69a9965acc894e9f3644"
+
+SRC_URI = "https://pypi.python.org/packages/source/p/pexpect/pexpect-${PV}.tar.gz"
+SRC_URI[md5sum] = "0de72541d3f1374b795472fed841dce8"
+SRC_URI[sha256sum] = "dfea618d43e83cfff21504f18f98019ba520f330e4142e5185ef7c73527de5ba"
+
+S = "${WORKDIR}/pexpect-${PV}"
+
+inherit distutils
+
+RDEPENDS_${PN} = "\
+    python-core \
+    python-io \
+    python-terminal \
+    python-resource \
+    python-fcntl \
+"
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.9.1


