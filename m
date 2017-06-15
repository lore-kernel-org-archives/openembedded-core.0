Return-Path: <amarnath.valluri@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C039878397
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 10:31:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Jun 2017 03:31:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,343,1493708400"; d="scan'208";a="1141526042"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga001.jf.intel.com with ESMTP; 15 Jun 2017 03:31:54 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 13:32:39 +0300
Message-Id: <1497522759-32376-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <ba4d34ea616f45249fb2bed1c4a4e3a3@XBOX02.axis.com>
References: <ba4d34ea616f45249fb2bed1c4a4e3a3@XBOX02.axis.com>
Subject: [PATCH v6] image.bbclass: create root symlinks in nativesdk target sysroot
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
X-List-Received-Date: Thu, 15 Jun 2017 10:31:55 -0000

To match with the target image, the generated nativesdk's target sysroot also
should have the root symlinks(/lib*, /bin/, /sbin). So, extended the
'create_merged_usr_symlinks' to reuse symlink creation part even for nativesdk
using POPULATE_SDK_PRE_TARGET_COMMAND.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/classes/image.bbclass | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 971918b..64af689 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -621,21 +621,32 @@ addtask bundle_initramfs after do_image_complete
 
 # Prepare the root links to point to the /usr counterparts.
 create_merged_usr_symlinks() {
-    install -d ${IMAGE_ROOTFS}${base_bindir} ${IMAGE_ROOTFS}${base_sbindir} ${IMAGE_ROOTFS}${base_libdir}
-    lnr ${IMAGE_ROOTFS}${base_bindir} ${IMAGE_ROOTFS}/bin
-    lnr ${IMAGE_ROOTFS}${base_sbindir} ${IMAGE_ROOTFS}/sbin
-    lnr ${IMAGE_ROOTFS}${base_libdir} ${IMAGE_ROOTFS}/${baselib}
+    root="$1"
+    install -d $root${base_bindir} $root${base_sbindir} $root${base_libdir}
+    lnr $root${base_bindir} $root/bin
+    lnr $root${base_sbindir} $root/sbin
+    lnr $root${base_libdir} $root/${baselib}
 
     if [ "${nonarch_base_libdir}" != "${base_libdir}" ]; then
-       install -d ${IMAGE_ROOTFS}${nonarch_base_libdir}
-       lnr ${IMAGE_ROOTFS}${nonarch_base_libdir} ${IMAGE_ROOTFS}/lib
+       install -d $root${nonarch_base_libdir}
+       lnr $root${nonarch_base_libdir} $root/lib
     fi
 
     # create base links for multilibs
     multi_libdirs="${@d.getVar('MULTILIB_VARIANTS')}"
     for d in $multi_libdirs; do
-        install -d ${IMAGE_ROOTFS}${exec_prefix}/$d
-        lnr ${IMAGE_ROOTFS}${exec_prefix}/$d ${IMAGE_ROOTFS}/$d
+        install -d $root${exec_prefix}/$d
+        lnr $root${exec_prefix}/$d $root/$d
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


