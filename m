Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9B4516F137
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 10:51:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 19 Feb 2014 02:47:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,504,1389772800"; d="scan'208";a="477586663"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2014 02:51:20 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 12:51:15 +0200
Message-Id: <6c2e8a6b62170b58e9513494203d24d3ae2df2c9.1392806896.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1392806896.git.laurentiu.palcu@intel.com>
References: <cover.1392806896.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1392806896.git.laurentiu.palcu@intel.com>
References: <cover.1392806896.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/3] package_manager.py: fix installed package list creation for Opkg/Dpkg
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
X-List-Received-Date: Wed, 19 Feb 2014 10:51:19 -0000

Small error in the package list creation routine. Buildhistory was
supposed to use this but was never called. Hence, it escaped tests...

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/lib/oe/package_manager.py |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 6dc8fbd..a3c0a8e 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1134,7 +1134,8 @@ class OpkgPM(PackageManager):
 
         if format == "file":
             tmp_output = ""
-            for pkg, pkg_file, pkg_arch in tuple(output.split('\n')):
+            for line in output.split('\n'):
+                pkg, pkg_file, pkg_arch = line.split()
                 full_path = os.path.join(self.deploy_dir, pkg_arch, pkg_file)
                 if os.path.exists(full_path):
                     tmp_output += "%s %s %s\n" % (pkg, full_path, pkg_arch)
@@ -1435,7 +1436,8 @@ class DpkgPM(PackageManager):
 
         if format == "file":
             tmp_output = ""
-            for pkg, pkg_file, pkg_arch in tuple(output.split('\n')):
+            for line in tuple(output.split('\n')):
+                pkg, pkg_file, pkg_arch = line.split()
                 full_path = os.path.join(self.deploy_dir, pkg_arch, pkg_file)
                 if os.path.exists(full_path):
                     tmp_output += "%s %s %s\n" % (pkg, full_path, pkg_arch)
-- 
1.7.9.5


