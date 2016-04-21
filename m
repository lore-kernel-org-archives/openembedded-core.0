Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3BE6FF73
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 11:03:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Apr 2016 04:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,512,1455004800"; d="scan'208";a="963437673"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2016 04:03:27 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2016 14:03:26 +0300
Message-Id: <1461236606-11337-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] license.bbclass: make sure that image manifest dir exists
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
X-List-Received-Date: Thu, 21 Apr 2016 11:03:29 -0000

Previously, write_deploy_manifest() was relying on
write_package_manifest() to create the subdirectory for the manifest
file. However, do_rootfs may be an empty function so that
write_package_manifest() will not be called and the manifest
subdirectory will not be created, causing a build failure. This patch
fixes that by creating the directory hierarchy inside
write_deploy_manifest().

[YOCTO #9446]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/license.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 43944e6..69335d6 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -181,8 +181,10 @@ def license_deployed_manifest(d):
                 key,val = line.split(": ", 1)
                 man_dic[dep][key] = val[:-1]
 
-    image_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
-            d.getVar('IMAGE_NAME', True), 'image_license.manifest')
+    lic_manifest_dir = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
+                                    d.getVar('IMAGE_NAME', True))
+    bb.utils.mkdirhier(lic_manifest_dir)
+    image_license_manifest = os.path.join(lic_manifest_dir, 'image_license.manifest')
     write_license_files(d, image_license_manifest, man_dic)
 
 def get_deployed_dependencies(d):
-- 
2.6.6


