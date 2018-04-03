Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 90A5574940
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 15:51:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 08:51:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,401,1517904000"; d="scan'208";a="39069202"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2018 08:51:51 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2018 18:45:18 +0300
Message-Id: <20180403154524.31588-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180403154524.31588-1-alexander.kanavin@linux.intel.com>
References: <20180403154524.31588-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/8] package_manager.py: move target_rootfs property to common ancestor class
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
X-List-Received-Date: Tue, 03 Apr 2018 15:51:51 -0000

This will be useful when also moving postinst_intercept handling to
package manager class from rootfs class.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index e006dc6215d..e0a114c3325 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -326,8 +326,9 @@ class PackageManager(object, metaclass=ABCMeta):
     This is an abstract class. Do not instantiate this directly.
     """
 
-    def __init__(self, d):
+    def __init__(self, d, target_rootfs):
         self.d = d
+        self.target_rootfs = target_rootfs
         self.deploy_dir = None
         self.deploy_lock = None
 
@@ -585,8 +586,7 @@ class RpmPM(PackageManager):
                  os_var=None,
                  rpm_repo_workdir="oe-rootfs-repo",
                  filterbydependencies=True):
-        super(RpmPM, self).__init__(d)
-        self.target_rootfs = target_rootfs
+        super(RpmPM, self).__init__(d, target_rootfs)
         self.target_vendor = target_vendor
         self.task_name = task_name
         if arch_var == None:
@@ -919,11 +919,11 @@ class RpmPM(PackageManager):
 
 
 class OpkgDpkgPM(PackageManager):
-    def __init__(self, d):
+    def __init__(self, d, target_rootfs):
         """
         This is an abstract class. Do not instantiate this directly.
         """
-        super(OpkgDpkgPM, self).__init__(d)
+        super(OpkgDpkgPM, self).__init__(d, target_rootfs)
 
     def package_info(self, pkg, cmd):
         """
@@ -988,9 +988,8 @@ class OpkgDpkgPM(PackageManager):
 
 class OpkgPM(OpkgDpkgPM):
     def __init__(self, d, target_rootfs, config_file, archs, task_name='target'):
-        super(OpkgPM, self).__init__(d)
+        super(OpkgPM, self).__init__(d, target_rootfs)
 
-        self.target_rootfs = target_rootfs
         self.config_file = config_file
         self.pkg_archs = archs
         self.task_name = task_name
@@ -1367,8 +1366,7 @@ class OpkgPM(OpkgDpkgPM):
 
 class DpkgPM(OpkgDpkgPM):
     def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None):
-        super(DpkgPM, self).__init__(d)
-        self.target_rootfs = target_rootfs
+        super(DpkgPM, self).__init__(d, target_rootfs)
         self.deploy_dir = self.d.getVar('DEPLOY_DIR_DEB')
         if apt_conf_dir is None:
             self.apt_conf_dir = self.d.expand("${APTCONF_TARGET}/apt")
-- 
2.16.1


