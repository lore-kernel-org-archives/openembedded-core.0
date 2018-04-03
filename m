Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 94EC5749D3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 15:51:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 08:51:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,401,1517904000"; d="scan'208";a="39069203"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2018 08:51:52 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2018 18:45:19 +0300
Message-Id: <20180403154524.31588-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180403154524.31588-1-alexander.kanavin@linux.intel.com>
References: <20180403154524.31588-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/8] package_manager.py: move postinst_intercept dir initialization from RootFS to PackageManager class
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
X-List-Received-Date: Tue, 03 Apr 2018 15:51:52 -0000

This will allow handling postinst_intercepts when populating SDKs (which
use PackageManager class directly, and do not utilize RootFS class).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 25 +++++++++++++++++++------
 meta/lib/oe/rootfs.py          | 13 +------------
 2 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index e0a114c3325..5b52fc9e713 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -12,6 +12,7 @@ import oe.utils
 import oe.path
 import string
 from oe.gpg_sign import get_signer
+import hashlib
 
 # this can be used by all PM backends to create the index files in parallel
 def create_index(arg):
@@ -331,6 +332,21 @@ class PackageManager(object, metaclass=ABCMeta):
         self.target_rootfs = target_rootfs
         self.deploy_dir = None
         self.deploy_lock = None
+        self._initialize_intercepts()
+
+    def _initialize_intercepts(self):
+        bb.note("Initializing intercept dir for %s" % self.target_rootfs)
+        postinst_intercepts_dir = self.d.getVar("POSTINST_INTERCEPTS_DIR")
+        if not postinst_intercepts_dir:
+            postinst_intercepts_dir = self.d.expand("${COREBASE}/scripts/postinst-intercepts")
+        # As there might be more than one instance of PackageManager operating at the same time
+        # we need to isolate the intercept_scripts directories from each other,
+        # hence the ugly hash digest in dir name.
+        self.intercepts_dir = os.path.join(self.d.getVar('WORKDIR'),
+                                      "intercept_scripts-%s" %(hashlib.sha256(self.target_rootfs.encode()).hexdigest()) )
+
+        bb.utils.remove(self.intercepts_dir, True)
+        shutil.copytree(postinst_intercepts_dir, self.intercepts_dir)
 
     @abstractmethod
     def update(self):
@@ -699,8 +715,7 @@ class RpmPM(PackageManager):
         os.environ['OFFLINE_ROOT'] = self.target_rootfs
         os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
         os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['INTERCEPT_DIR'] = oe.path.join(self.d.getVar('WORKDIR'),
-                                                   "intercept_scripts")
+        os.environ['INTERCEPT_DIR'] = self.intercepts_dir
         os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
 
 
@@ -1178,8 +1193,7 @@ class OpkgPM(OpkgDpkgPM):
         os.environ['OFFLINE_ROOT'] = self.target_rootfs
         os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
         os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['INTERCEPT_DIR'] = os.path.join(self.d.getVar('WORKDIR'),
-                                                   "intercept_scripts")
+        os.environ['INTERCEPT_DIR'] = self.intercepts_dir
         os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
 
         try:
@@ -1440,8 +1454,7 @@ class DpkgPM(OpkgDpkgPM):
         os.environ['OFFLINE_ROOT'] = self.target_rootfs
         os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
         os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['INTERCEPT_DIR'] = os.path.join(self.d.getVar('WORKDIR'),
-                                                   "intercept_scripts")
+        os.environ['INTERCEPT_DIR'] = self.intercepts_dir
         os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
 
         failed_pkgs = []
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index bf2aea2b25a..600a685d68f 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -178,20 +178,10 @@ class Rootfs(object, metaclass=ABCMeta):
         post_process_cmds = self.d.getVar("ROOTFS_POSTPROCESS_COMMAND")
         rootfs_post_install_cmds = self.d.getVar('ROOTFS_POSTINSTALL_COMMAND')
 
-        postinst_intercepts_dir = self.d.getVar("POSTINST_INTERCEPTS_DIR")
-        if not postinst_intercepts_dir:
-            postinst_intercepts_dir = self.d.expand("${COREBASE}/scripts/postinst-intercepts")
-        intercepts_dir = os.path.join(self.d.getVar('WORKDIR'),
-                                      "intercept_scripts")
-
-        bb.utils.remove(intercepts_dir, True)
-
         bb.utils.mkdirhier(self.image_rootfs)
 
         bb.utils.mkdirhier(self.deploydir)
 
-        shutil.copytree(postinst_intercepts_dir, intercepts_dir)
-
         execute_pre_post_process(self.d, pre_process_cmds)
 
         if self.progress_reporter:
@@ -312,8 +302,7 @@ class Rootfs(object, metaclass=ABCMeta):
 
 
     def _run_intercepts(self):
-        intercepts_dir = os.path.join(self.d.getVar('WORKDIR'),
-                                      "intercept_scripts")
+        intercepts_dir = self.pm.intercepts_dir
 
         bb.note("Running intercept scripts:")
         os.environ['D'] = self.image_rootfs
-- 
2.16.1


