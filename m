Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.3749.1610079532734030116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: x70Jfek7hkmv/IUdnY9+YdUdisAukojCJh4xzxRUpGC3c6CogmMtgurj5F4+L3tO1XZd8nlR0o
 pktJI0KSj5lg==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613753"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613753"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:58 -0800
IronPort-SDR: LuiAE8P/JR4LlSBhjhfhwSbSRHTWwMOA5bKyy9BF2yONaBsL3BqXttNamNsfopwxOnMzptlgXb
 z6ImervpRDbg==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209524"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:57 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 30/30] bitbake.conf: Prevent pyc file generation in pseudo context
Date: Fri,  8 Jan 2021 12:18:12 +0800
Message-Id: <7aa1ae139b9131faff04c0ed156fd8efcde114f6.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

This also effectively reverts commit b6d30c21b0:
    bitbake.conf: Extend PSEUDO_IGNORE_PATHS to ${COREBASE}/meta

The contents of ${COREBASE}/meta were ignored as pyc files could be
generated for the contents of the lib subdirectory if python modules
were imported within a pseudo context. However this doesn't protect us
from pyc files being generated in the lib directories for other layers.
It's far better to tell python not to produce pyc files when running
under pseudo (by setting the PYTHONDONTWRITEBYTECODE variable) as this
will cover any location where pyc files could possibly be created. This
variable is set in FAKEROOTBASEENV so that it applies to the
bitbake-worker instance for fakeroot tasks, preventing pyc files from
being generated for imports in python tasks themselves.

Also add a test case to ensure that pyc files are not created in tasks
which are executed under pseudo.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 73d538f20743017a44cea4c20dbe09a0327cfc71)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-selftest/lib/pseudo_pyc_test1.py         |  1 +
 meta-selftest/lib/pseudo_pyc_test2.py         |  1 +
 .../pseudo-pyc-test/pseudo-pyc-test.bb        | 15 +++++++++++
 meta/conf/bitbake.conf                        |  4 +--
 meta/lib/oeqa/selftest/cases/pseudo.py        | 27 +++++++++++++++++++
 5 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 meta-selftest/lib/pseudo_pyc_test1.py
 create mode 100644 meta-selftest/lib/pseudo_pyc_test2.py
 create mode 100644 meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-test.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/pseudo.py

diff --git a/meta-selftest/lib/pseudo_pyc_test1.py b/meta-selftest/lib/pseudo_pyc_test1.py
new file mode 100644
index 0000000000..b59abdd536
--- /dev/null
+++ b/meta-selftest/lib/pseudo_pyc_test1.py
@@ -0,0 +1 @@
+STRING = "pseudo_pyc_test1"
diff --git a/meta-selftest/lib/pseudo_pyc_test2.py b/meta-selftest/lib/pseudo_pyc_test2.py
new file mode 100644
index 0000000000..fb67a978e0
--- /dev/null
+++ b/meta-selftest/lib/pseudo_pyc_test2.py
@@ -0,0 +1 @@
+STRING = "pseudo_pyc_test2"
diff --git a/meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-test.bb b/meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-test.bb
new file mode 100644
index 0000000000..12dc91a8f3
--- /dev/null
+++ b/meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-test.bb
@@ -0,0 +1,15 @@
+SUMMARY = "pseudo env test"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+python do_compile() {
+    import pseudo_pyc_test1
+    print(pseudo_pyc_test1.STRING)
+}
+
+python do_install() {
+    import pseudo_pyc_test2
+    print(pseudo_pyc_test2.STRING)
+}
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 812cd05102..da6db9f595 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -685,13 +685,13 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${COREBASE}/meta,${CCACHE_DIR}"
+PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
 #export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
 #export PSEUDO_LIBDIR = "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
-FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=1"
+FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=1 PYTHONDONTWRITEBYTECODE=1"
 FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
 FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=0"
 FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
diff --git a/meta/lib/oeqa/selftest/cases/pseudo.py b/meta/lib/oeqa/selftest/cases/pseudo.py
new file mode 100644
index 0000000000..33593d5ce9
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/pseudo.py
@@ -0,0 +1,27 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+import glob
+import os
+import shutil
+from oeqa.utils.commands import bitbake, get_test_layer
+from oeqa.selftest.case import OESelftestTestCase
+
+class Pseudo(OESelftestTestCase):
+
+    def test_pseudo_pyc_creation(self):
+        self.write_config("")
+
+        metaselftestpath = get_test_layer()
+        pycache_path = os.path.join(metaselftestpath, 'lib/__pycache__')
+        if os.path.exists(pycache_path):
+            shutil.rmtree(pycache_path)
+
+        bitbake('pseudo-pyc-test -c install')
+
+        test1_pyc_present = len(glob.glob(os.path.join(pycache_path, 'pseudo_pyc_test1.*.pyc')))
+        self.assertTrue(test1_pyc_present, 'test1 pyc file missing, should be created outside of pseudo context.')
+
+        test2_pyc_present = len(glob.glob(os.path.join(pycache_path, 'pseudo_pyc_test2.*.pyc')))
+        self.assertFalse(test2_pyc_present, 'test2 pyc file present, should not be created in pseudo context.')
-- 
2.29.2

