Return-Path: <amarnath.valluri@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 63CD77834A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 11:32:29 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 04:32:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,340,1493708400"; d="scan'208";a="980709721"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga003.jf.intel.com with ESMTP; 14 Jun 2017 04:32:29 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 14:30:48 +0300
Message-Id: <1497439848-29967-8-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497439848-29967-1-git-send-email-amarnath.valluri@intel.com>
References: <1497439848-29967-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH v4 7/7] image.bbclass: create root symlinks in nativesdk target sysroot
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
X-List-Received-Date: Wed, 14 Jun 2017 11:32:29 -0000

To match with the target image, the generated nativesdk's target sysroot also
should have the root symlinks(/lib*, /bin/, /sbin). So, extended the
'create_merged_usr_symlinks' to reuse symlink creation part even for nativesdk
using POPULATE_SDK_PRE_TARGET_COMMAND.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/classes/image.bbclass | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2a3c1e3..b6c3866 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -620,21 +620,32 @@ addtask bundle_initramfs after do_image_complete
 
 # Prepare the root links to point to the /usr counterparts.
 create_merged_usr_symlinks() {
-    install -d ${IMAGE_ROOTFS}${base_bindir} ${IMAGE_ROOTFS}${base_sbindir} ${IMAGE_ROOTFS}${base_libdir}
-    lnr ${IMAGE_ROOTFS}${base_bindir} ${IMAGE_ROOTFS}/bin
-    lnr ${IMAGE_ROOTFS}${base_sbindir} ${IMAGE_ROOTFS}/sbin
-    lnr ${IMAGE_ROOTFS}${base_libdir} ${IMAGE_ROOTFS}/${baselib}
+    root="$1"
+    install -d ${root}${base_bindir} ${root}${base_sbindir} ${root}${base_libdir}
+    lnr ${root}${base_bindir} ${root}/bin
+    lnr ${root}${base_sbindir} ${root}/sbin
+    lnr ${root}${base_libdir} ${root}/${baselib}
 
     if [ "${nonarch_base_libdir}" != "${base_libdir}" ]; then
-       install -d ${IMAGE_ROOTFS}${nonarch_base_libdir}
-       lnr ${IMAGE_ROOTFS}${nonarch_base_libdir} ${IMAGE_ROOTFS}/lib
+       install -m 0755 -d ${root}${nonarch_base_libdir}
+       lnr ${root}${nonarch_base_libdir} ${root}/lib
     fi
 
     # create base links for multilibs
     multi_libdirs="${@d.getVar('MULTILIB_VARIANTS')}"
     for d in $multi_libdirs; do
-        install -d ${IMAGE_ROOTFS}${exec_prefix}/$d
-        lnr ${IMAGE_ROOTFS}${exec_prefix}/$d ${IMAGE_ROOTFS}/$d
+        install -m 0755 -d ${root}${exec_prefix}/$d
+        lnr ${root}${exec_prefix}/$d ${root}/$d
     done
 }
-ROOTFS_PREPROCESS_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks; ', '',d)}"
+
+create_merged_usr_symlinks_rootfs() {
+    create_merged_usr_symlinks ${IMAGE_ROOTFS}
+}
+
+create_merged_usr_symlinks_sdk() {
+    create_merged_usr_symlinks ${SDK_OUTPUT}${SDKTARGETSYSROOT}
+}
+
+ROOTFS_PREPROCESS_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_rootfs; ', '',d)}"
+POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_sdk; ', '',d)}"
-- 
2.7.4


