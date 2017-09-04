Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0DA3D606BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 16:13:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Sep 2017 09:13:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,475,1498546800"; d="scan'208";a="896974403"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Sep 2017 09:13:54 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Sep 2017 09:13:53 -0700
Message-Id: <20170904161353.20275-1-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] test_sdkext: Add support to execute suite with pre-built artifacts from Auto Builder
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
X-List-Received-Date: Mon, 04 Sep 2017 16:13:54 -0000

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

testsdkest' suite is not working properly when using pre-built artifacts downloaded
from AutoBuilder, some updates are applied as follows:

- testsdk.bbclass: add functionally to override the <toolchain>.data.json file with
the paths of the host were the test are being executed instead of the the paths of
the Auto Builder.

- devtool.py: add support to install libxml2 from the source as AutoBuilder
artifacts have a minimal SDK tools and libraries.

[YOCTO #11963]

(From OE-Core rev: 7f10c5118793da6ded59ae6e60e796152dbd7ca3)

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 meta/classes/testsdk.bbclass          | 25 +++++++++++++++++++++----
 meta/lib/oeqa/sdkext/cases/devtool.py |  2 +-
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 6b51a33db2..2d803e5202 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -14,6 +14,9 @@
 #
 # where "<image-name>" is an image like core-image-sato.
 
+
+TESTSDK_UPDATE_VARS ?= "DL_DIR WORKDIR DEPLOY_DIR SDK_DEPLOY COMPONENTS_DIR TOOLCHAINEXT_OUTPUTNAME PKGDATA_DIR"
+
 def testsdk_main(d):
     import os
     import subprocess
@@ -92,6 +95,7 @@ do_testsdk[nostamp] = "1"
 def testsdkext_main(d):
     import os
     import json
+    from oeqa.core.utils.misc import updateTestData
     import subprocess
     import logging
 
@@ -99,6 +103,21 @@ def testsdkext_main(d):
     from oeqa.utils import avoid_paths_in_environ, make_logger_bitbake_compatible, subprocesstweak
     from oeqa.sdkext.context import OESDKExtTestContext, OESDKExtTestContextExecutor
 
+    toolchain_name = ("%s/%s" % (d.getVar('SDK_DEPLOY'),
+                                     d.getVar('TOOLCHAINEXT_OUTPUTNAME')))
+
+    tdname = "%s.testdata.json" % toolchain_name
+
+    try:
+        test_data = json.load(open(tdname, "r"))
+    except (FileNotFoundError) as err:
+        bb.fatal('File %s Not Found. Have you built the image with INHERIT+="testsdkext" ' \
+                 'in the conf/local.conf or downlaoded the pre-built from the AB?' % tdname)
+
+    # Some variables need to be updated (mostly paths) with the
+    # ones of the current environment because some tests use them.
+    updateTestData(d, test_data, d.getVar('TESTSDK_UPDATE_VARS').split())
+
     bb.event.enable_threadlock()
 
     pn = d.getVar("PN")
@@ -118,10 +137,8 @@ def testsdkext_main(d):
     tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.sh")
     if not os.path.exists(tcname):
         bb.fatal("The toolchain ext %s is not built. Build it before running the" \
-                 " tests: 'bitbake <image> -c populate_sdk_ext' ." % tcname)
-
-    tdname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.testdata.json")
-    test_data = json.load(open(tdname, "r"))
+                 " tests: 'bitbake <image> -c populate_sdk_ext' . or donwload the" \
+                 " pre-built form the AB" % tcname)
 
     target_pkg_manifest = OESDKExtTestContextExecutor._load_manifest(
         d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"))
diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index ea9051710a..857628cef8 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -70,7 +70,7 @@ class DevtoolTest(OESDKExtTestCase):
     def test_extend_autotools_recipe_creation(self):
         req = 'https://github.com/rdfa/librdfa'
         recipe = "librdfa"
-        self._run('devtool sdk-install libxml2')
+        self._run('devtool sdk-install -s libxml2')
         self._run('devtool add %s %s' % (recipe, req) )
         try:
             self._run('devtool build %s' % recipe)
-- 
2.12.3


