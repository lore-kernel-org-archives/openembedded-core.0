Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8CF14771E1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 22:27:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 04 Feb 2016 14:27:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="647384199"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2016 14:27:57 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 16:29:34 -0600
Message-Id: <d7373e32ba9893424bc20427691a8d631c6fcfdd.1454624835.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454624835.git.anibal.limon@linux.intel.com>
References: <cover.1454624835.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1454624835.git.anibal.limon@linux.intel.com>
References: <cover.1454624835.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
Subject: [PATCH v3 17/22] classes/populate_sdk_ext: Add SDK_EXT_TARGET_MANIFEST and SDK_EXT_HOST_MANIFEST
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
X-List-Received-Date: Thu, 04 Feb 2016 22:27:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <limon.anibal@gmail.com>

Extensible SDK needs to point to the correct manifest so add
SDK_EXT_TARGET_MANIFEST and SDK_EXT_HOST_MANIFEST variables.

oeqa/oetest.py: Fix SDKExtTestContext for load the correct manifests.

Signed-off-by: Aníbal Limón <limon.anibal@gmail.com>
---
 meta/classes/populate_sdk_ext.bbclass |  3 +++
 meta/lib/oeqa/oetest.py               | 11 +++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 394c70c..c47dd0b 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -48,6 +48,9 @@ B_task-populate-sdk-ext = "${SDK_DIR}"
 TOOLCHAINEXT_OUTPUTNAME = "${SDK_NAME}-toolchain-ext-${SDK_VERSION}"
 TOOLCHAIN_OUTPUTNAME_task-populate-sdk-ext = "${TOOLCHAINEXT_OUTPUTNAME}"
 
+SDK_EXT_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"
+SDK_EXT_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"
+
 SDK_TITLE_task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME', True) or d.getVar('DISTRO', True)} Extensible SDK"
 
 python copy_buildsystem () {
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 620617c..80b40b6 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -382,14 +382,18 @@ class SDKTestContext(TestContext):
         self.sdktestdir = sdktestdir
         self.sdkenv = sdkenv
 
+        if not hasattr(self, 'target_manifest'):
+            self.target_manifest = d.getVar("SDK_TARGET_MANIFEST", True)
         try:
-            with open(d.getVar("SDK_TARGET_MANIFEST", True)) as f:
+            with open(self.target_manifest) as f:
                  self.pkgmanifest = f.read()
         except IOError as e:
             bb.fatal("No package manifest file found. Did you build the sdk image?\n%s" % e)
 
+        if not hasattr(self, 'host_manifest'):
+            self.host_manifest = d.getVar("SDK_HOST_MANIFEST", True)
         try:
-            with open(d.getVar("SDK_HOST_MANIFEST", True)) as f:
+            with open(self.host_manifest) as f:
                 self.hostpkgmanifest = f.read()
         except IOError as e:
             bb.fatal("No host package manifest file found. Did you build the sdk image?\n%s" % e)
@@ -406,6 +410,9 @@ class SDKTestContext(TestContext):
 
 class SDKExtTestContext(SDKTestContext):
     def __init__(self, d, sdktestdir, sdkenv):
+        self.target_manifest = d.getVar("SDK_EXT_TARGET_MANIFEST", True)
+        self.host_manifest = d.getVar("SDK_EXT_HOST_MANIFEST", True)
+
         super(SDKExtTestContext, self).__init__(d, sdktestdir, sdkenv)
 
         self.sdkextfilesdir = os.path.join(os.path.dirname(os.path.abspath(
-- 
2.1.4


