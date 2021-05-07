Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: KBs6Qfg52GwRsoqD9AwqVRZS+4lHVPt/8O71IeWfluNMAKUUph+hHcsqTBOL5eHn1qRJiLg5KD
 s5aZ1cPebtpw==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794665"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794665"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:02:52 -0700
IronPort-SDR: oO4pjsxTqJrXMrstrEQfGrfXtV3Zmtdw5JrJFVS4BiMMOtLkYiiExSMFgdj5BjnyLnJRh013GO
 AUcl8esRrvsw==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331531"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:02:51 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/31] license_image.bbclass: Detect broken symlinks
Date: Fri,  7 May 2021 15:02:13 +0800
Message-Id: <afeefde357e468ba79570208bd67d097b9cb9ee1.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Reto Schneider <reto.schneider@husqvarnagroup.com>

Find and report symlinks which point to a non-existing file.

Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 81809a1ffe67aade1b2ed66fe95044ffbf7d3df8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/license_image.bbclass | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index c96b032ebd..b9a0f2359b 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -1,3 +1,5 @@
+ROOTFS_LICENSE_DIR = "${IMAGE_ROOTFS}/usr/share/common-licenses"
+
 python write_package_manifest() {
     # Get list of installed packages
     license_image_dir = d.expand('${LICENSE_DIRECTORY}/${IMAGE_NAME}')
@@ -104,8 +106,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
     copy_lic_manifest = d.getVar('COPY_LIC_MANIFEST')
     copy_lic_dirs = d.getVar('COPY_LIC_DIRS')
     if rootfs and copy_lic_manifest == "1":
-        rootfs_license_dir = os.path.join(d.getVar('IMAGE_ROOTFS'), 
-                                'usr', 'share', 'common-licenses')
+        rootfs_license_dir = d.getVar('ROOTFS_LICENSE_DIR')
         bb.utils.mkdirhier(rootfs_license_dir)
         rootfs_license_manifest = os.path.join(rootfs_license_dir,
                 os.path.split(license_manifest)[1])
@@ -267,3 +268,13 @@ python do_populate_lic_deploy() {
 addtask populate_lic_deploy before do_build after do_image_complete
 do_populate_lic_deploy[recrdeptask] += "do_populate_lic do_deploy"
 
+python license_qa_dead_symlink() {
+    import os
+
+    for root, dirs, files in os.walk(d.getVar('ROOTFS_LICENSE_DIR')):
+        for file in files:
+            full_path = root + "/" + file
+            if os.path.islink(full_path) and not os.path.exists(full_path):
+                bb.error("broken symlink: " + full_path)
+}
+IMAGE_QA_COMMANDS += "license_qa_dead_symlink"
-- 
2.30.2

