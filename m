Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A31E371F82
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 17:14:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 04 Nov 2014 09:12:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,313,1413270000"; d="scan'208";a="631275876"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.154])
	by orsmga002.jf.intel.com with ESMTP; 04 Nov 2014 09:14:32 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Nov 2014 11:14:57 -0600
Message-Id: <1415121300-16524-6-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1415121300-16524-1-git-send-email-anibal.limon@linux.intel.com>
References: <1415121300-16524-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 5/8] license_class: license_manifest_creation improvment copying licenses to target
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
X-List-Received-Date: Tue, 04 Nov 2014 17:14:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Do a hardlink for license.manifest and licenses instead of copy this helps in
reduce disk usage when rootfs is built.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/license.bbclass | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 74de364..f2dd0eb 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -26,7 +26,6 @@ python write_package_manifest() {
 }
 
 python license_create_manifest() {
-    import shutil
     import re
     import oe.license
 
@@ -143,7 +142,7 @@ python license_create_manifest() {
         os.makedirs(rootfs_license_dir)
         rootfs_license_manifest = os.path.join(rootfs_license_dir,
                                                 'license.manifest')
-        shutil.copyfile(license_manifest, rootfs_license_manifest)
+        os.link(license_manifest, rootfs_license_manifest)
 
         if copy_lic_dirs == "1":
             for pkg in sorted(pkg_dic):
@@ -162,15 +161,15 @@ python license_create_manifest() {
                         if not license_ok(bad_licenses, generic_lic):
                             continue
 
-                        if not os.path.exists(pkg_rootfs_license):
-                            shutil.copyfile(pkg_license, rootfs_license)
+                        if not os.path.exists(rootfs_license):
+                            os.link(pkg_license, rootfs_license)
 
                         os.symlink(os.path.join('..', lic), pkg_rootfs_license)
                     else:
                         if not license_ok(bad_licenses, lic):
                             continue
 
-                        shutil.copyfile(pkg_license, pkg_rootfs_license)
+                        os.link(pkg_license, pkg_rootfs_license)
 }
 
 python do_populate_lic() {
-- 
1.9.1


