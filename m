Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5954671DAD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 20:24:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Jan 2017 12:24:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,285,1477983600"; d="scan'208";a="1087278620"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2017 12:24:08 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 12:20:06 +0000
Message-Id: <72a1ec2a14ab3e90ee089da798c96b64458f9ed6.1485346622.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1485346622.git.mariano.lopez@linux.intel.com>
References: <cover.1485346622.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1485346622.git.mariano.lopez@linux.intel.com>
References: <cover.1485346622.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 3/3] testimage.bbclass: Allow to run tests on autobuilder's images
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
X-List-Received-Date: Wed, 25 Jan 2017 20:24:07 -0000

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
 meta/classes/testimage.bbclass   | 11 +++++++----
 meta/lib/oeqa/core/utils/misc.py |  7 +++++++
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 96e41c6..d65ac52 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -79,12 +79,13 @@ TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'ipk', 'opkg-utils-na
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'deb', 'apt-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python-smartpm-native:do_populate_sysroot', '', d)}"
 
-
 TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
 TESTIMAGELOCK_qemuall = ""
 
 TESTIMAGE_DUMP_DIR ?= "/tmp/oe-saved-tests/"
 
+TESTIMAGE_UPDATE_VARS ?= "WORKDIR DEPLOY_DIR"
+
 testimage_dump_target () {
     top -bn1
     ps
@@ -137,13 +138,12 @@ def testimage_sanity(d):
 
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
@@ -165,6 +165,9 @@ def testimage_main(d):
 
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


