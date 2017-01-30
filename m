Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CB3B0771D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 16:12:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 30 Jan 2017 08:12:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,312,1477983600"; d="scan'208";a="815056927"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jan 2017 08:12:31 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2017 08:08:21 +0000
Message-Id: <752434a669ab742e3d1cd1d666974a487c4ca002.1485763510.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1485515180.git.mariano.lopez@linux.intel.com>
References: <cover.1485515180.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1485763510.git.mariano.lopez@linux.intel.com>
References: <cover.1485763510.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv3 3/5] testimage.bbclass: Allow to run tests on autobuilder's images
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
X-List-Received-Date: Mon, 30 Jan 2017 16:12:33 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

With the change to the new framework data store dependecy was
removed, instead a new file is generated and used in testimage.
When testing builds from the autobuilders the test data values
are from the autobuilder, including the paths.

Some tests require paths to current environment in order to run,
this commit will update such paths and fix the error of running
images donwloaded from autobuilders.

[YOCTO #10964]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass   | 18 +++++++++++-------
 meta/lib/oeqa/core/utils/misc.py |  7 +++++++
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 73a5c1a..7495fe1 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -49,11 +49,11 @@ DEFAULT_TEST_SUITES_pn-core-image-x11 = "${MINTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-lsb = "${NETTESTSUITE} pam parselogs ${RPMTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-sato = "${NETTESTSUITE} connman xorg parselogs ${RPMTESTSUITE} \
     ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python', '', d)}"
-DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${NETTESTSUITE} connman xorg perl python \
-    ${DEVTESTSUITE} parselogs ${RPMTESTSUITE}"
+DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${NETTESTSUITE} buildcvs buildiptables buildgalculator \
+    connman ${DEVTESTSUITE} logrotate perl parselogs python ${RPMTESTSUITE} xorg"
 DEFAULT_TEST_SUITES_pn-core-image-lsb-dev = "${NETTESTSUITE} pam perl python parselogs ${RPMTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${NETTESTSUITE} buildcvs buildiptables buildgalculator \
-    connman ${DEVTESTSUITE} pam perl python parselogs ${RPMTESTSUITE}"
+    connman ${DEVTESTSUITE} logrotate pam parselogs perl python ${RPMTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-meta-toolchain = "auto"
 
 # aarch64 has no graphics
@@ -79,13 +79,15 @@ TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python-smartp
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'ipk', 'opkg-utils-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'deb', 'apt-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python-smartpm-native:do_populate_sysroot', '', d)}"
-
+TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'createrepo-native:do_populate_sysroot', '', d)}"
 
 TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
 TESTIMAGELOCK_qemuall = ""
 
 TESTIMAGE_DUMP_DIR ?= "/tmp/oe-saved-tests/"
 
+TESTIMAGE_UPDATE_VARS ?= "DL_DIR WORKDIR DEPLOY_DIR"
+
 testimage_dump_target () {
     top -bn1
     ps
@@ -138,13 +140,12 @@ def testimage_sanity(d):
 
 def testimage_main(d):
     import os
-    import signal
     import json
-    import sys
+    import signal
     import logging
-    import time
 
     from bb.utils import export_proxies
+    from oeqa.core.utils.misc import updateTestData
     from oeqa.runtime.context import OERuntimeTestContext
     from oeqa.runtime.context import OERuntimeTestContextExecutor
     from oeqa.core.target.qemu import supported_fstypes
@@ -166,6 +167,9 @@ def testimage_main(d):
 
     tdname = "%s.testdata.json" % image_name
     td = json.load(open(tdname, "r"))
+    # Some variables need to be updates (mostly paths) with the
+    # ones of the current environment because some tests require them.
+    updateTestData(d, td, d.getVar('TESTIMAGE_UPDATE_VARS').split())
 
     image_manifest = "%s.manifest" % image_name
     image_packages = OERuntimeTestContextExecutor.readPackagesManifest(image_manifest)
diff --git a/meta/lib/oeqa/core/utils/misc.py b/meta/lib/oeqa/core/utils/misc.py
index 6ae58ad..d1eec13 100644
--- a/meta/lib/oeqa/core/utils/misc.py
+++ b/meta/lib/oeqa/core/utils/misc.py
@@ -35,3 +35,10 @@ def dataStoteToDict(d, variables):
         data[v] = d.getVar(v, True)
 
     return data
+
+def updateTestData(d, td, variables):
+    """
+    Updates variables with values of data store to test data.
+    """
+    for var in variables:
+        td[var] = d.getVar(var)
-- 
2.6.6


