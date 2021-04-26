Received: from mxout012.mail.hostpoint.ch (mxout012.mail.hostpoint.ch [217.26.49.172])
 by mx.groups.io with SMTP id smtpd.web11.279.1619470115771334726
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 13:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: reto-schneider.ch, ip: 217.26.49.172, mailfrom: code@reto-schneider.ch)
Received: from [10.0.2.45] (helo=asmtp012.mail.hostpoint.ch)
	by mxout012.mail.hostpoint.ch with esmtp (Exim 4.92.3 (FreeBSD))
	(envelope-from <code@reto-schneider.ch>)
	id 1lb89h-000DFE-1G; Mon, 26 Apr 2021 22:48:33 +0200
Received: from [2a02:168:6182:1:6da9:5990:7c25:6a2f] (helo=ryzen2700.home.reto-schneider.ch)
	by asmtp012.mail.hostpoint.ch with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92.3 (FreeBSD))
	(envelope-from <code@reto-schneider.ch>)
	id 1lb89g-000Lhc-Uu; Mon, 26 Apr 2021 22:48:32 +0200
X-Authenticated-Sender-Id: reto-schneider@reto-schneider.ch
From: code@reto-schneider.ch
To: openembedded-core@lists.openembedded.org
Cc: Reto Schneider <reto.schneider@husqvarnagroup.com>
Subject: [PATCH 1/2] license_image.bbclass: Detect broken symlinks
Date: Mon, 26 Apr 2021 22:48:27 +0200
Message-Id: <20210426204828.12339-1-code@reto-schneider.ch>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Reto Schneider <reto.schneider@husqvarnagroup.com>

Find and report symlinks which point to a non-existing file.

Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>
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
2.29.2

