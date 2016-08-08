Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5968C771AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316026"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:22:59 -0700
Message-Id: <b12d2379240e76e96934ed22623c7e7b627695bc.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 11/20] oeqa.selftest.manifest: Split configuration from code
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:22 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.

[Yocto 9389]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/selftest/conf/manifest.conf |  8 ++++++++
 meta/lib/oeqa/selftest/manifest.py        | 22 +++++++++++++++-------
 2 files changed, 23 insertions(+), 7 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/manifest.conf

diff --git a/meta/lib/oeqa/selftest/conf/manifest.conf b/meta/lib/oeqa/selftest/conf/manifest.conf
new file mode 100644
index 0000000..ac5ad56
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/manifest.conf
@@ -0,0 +1,8 @@
+[VerifyManifest]
+setUpClass_buildtarget = core-image-minimal
+setUpClass_classname = VerifyManifest
+# the setup should bitbake core-image-minimal and here it is required
+# to do an additional setup for the sdk
+SDK_manifest_entries_sdktask = -c populate_sdk 
+SDK_manifest_entries_host = nativesdk-packagegroup-sdk-host
+image_manifest_entries_revdir_name = runtime-reverse
diff --git a/meta/lib/oeqa/selftest/manifest.py b/meta/lib/oeqa/selftest/manifest.py
index 44d0404..2f7cd29 100644
--- a/meta/lib/oeqa/selftest/manifest.py
+++ b/meta/lib/oeqa/selftest/manifest.py
@@ -4,6 +4,8 @@ import os
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import get_bb_var, bitbake
 from oeqa.utils.decorators import testcase
+from oeqa.utils.readconfig import conffile
+
 
 class ManifestEntry:
     '''A manifest item of a collection able to list missing packages'''
@@ -48,9 +50,12 @@ class VerifyManifest(oeSelfTest):
     @classmethod
     def setUpClass(self):
 
-        self.buildtarget = 'core-image-minimal'
-        self.classname = 'VerifyManifest'
-
+        # Get test configurations from configuration file
+        self.config = conffile(__file__)
+        self.buildtarget = self.config.get(
+                         'VerifyManifest', 'setUpClass_buildtarget')
+        self.classname = self.config.get(
+                       'VerifyManifest', 'setUpClass_classname')
         self.log.info("{}: doing bitbake {} as a prerequisite of the test"\
                 .format(self.classname, self.buildtarget))
         if bitbake(self.buildtarget).status:
@@ -65,7 +70,9 @@ class VerifyManifest(oeSelfTest):
 
         # the setup should bitbake core-image-minimal and here it is required
         # to do an additional setup for the sdk
-        sdktask = '-c populate_sdk'
+        sdktask = self.config.get(
+                'VerifyManifest', 'SDK_manifest_entries_sdktask')
+        host = self.config.get('VerifyManifest', 'SDK_manifest_entries_host')
         bbargs = sdktask + ' ' + self.buildtarget
         self.log.debug("{}: doing bitbake {} as a prerequisite of the test"\
                 .format(self.classname, bbargs))
@@ -79,8 +86,7 @@ class VerifyManifest(oeSelfTest):
         pkgdata_dir = reverse_dir = {}
         mfilename = mpath = m_entry = {}
         # get manifest location based on target to query about
-        d_target= dict(target = self.buildtarget,
-                         host = 'nativesdk-packagegroup-sdk-host')
+        d_target = dict(target=self.buildtarget, host=host)
         try:
             mdir = self.get_dir_from_bb_var('SDK_DEPLOY', self.buildtarget)
             for k in d_target.keys():
@@ -130,6 +136,8 @@ class VerifyManifest(oeSelfTest):
         '''Verifying the image manifest entries exist'''
 
         # get manifest location based on target to query about
+        revdir_name = self.config.get(
+                    'VerifyManifest', 'image_manifest_entries_revdir_name')
         try:
             mdir = self.get_dir_from_bb_var('DEPLOY_DIR_IMAGE',
                                                 self.buildtarget)
@@ -142,7 +150,7 @@ class VerifyManifest(oeSelfTest):
             pkgdata_dir = {}
             pkgdata_dir = self.get_dir_from_bb_var('PKGDATA_DIR',
                                                 self.buildtarget)
-            revdir = os.path.join(pkgdata_dir, 'runtime-reverse')
+            revdir = os.path.join(pkgdata_dir, revdir_name)
             if not os.path.exists(revdir): raise IOError
         except OSError:
             raise unittest.SkipTest("{}: Error in obtaining manifest dirs"\
-- 
1.8.3.1


