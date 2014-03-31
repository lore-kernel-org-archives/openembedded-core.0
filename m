Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6175160C14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 15:09:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Mar 2014 08:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,766,1389772800"; d="scan'208";a="511595104"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 31 Mar 2014 08:05:57 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.160])
	by linux.intel.com (Postfix) with ESMTP id 4B6B66A4007;
	Mon, 31 Mar 2014 08:05:42 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Mar 2014 18:06:15 +0300
Message-Id: <1396278375-6315-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] image.bbclass: add postprocess func to disable DNS lookups for openssh
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
X-List-Received-Date: Mon, 31 Mar 2014 15:09:54 -0000

In the default config openssh does reverse DNS resolution, but
if there is no DNS configured on the target (or even worse the
DNS server is unreachable) there is a long timeout when connecting
over ssh. This is most visible on core-image-sato-sdk builds on AB, where the
tests take a long time because each ssh command spends 15 seconds
just connecting to the target, disabling the reverse DNS resolution halves
the total test time.
This isn't a qemu specific problem however and instead of changing the default
config I think it's worth disabling this when debug-tweaks is enabled.

Patch based on a previous version sent by Saul Wold <sgw@linux.intel.com>

[YOCTO #5954]

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/image.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 29309f5..846c768 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -146,6 +146,8 @@ MACHINE_POSTPROCESS_COMMAND ?= ""
 ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "ssh_allow_empty_password; ", "",d)}'
 # Enable postinst logging if debug-tweaks is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "postinst_enable_logging; ", "",d)}'
+# Disable DNS lookups if debug-tweaks is enabled
+ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "ssh_disable_dns_lookup; ", "",d)}'
 # Write manifest
 IMAGE_MANIFEST = "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.manifest"
 ROOTFS_POSTPROCESS_COMMAND =+ "write_image_manifest ; "
@@ -304,6 +306,12 @@ ssh_allow_empty_password () {
 	fi
 }
 
+ssh_disable_dns_lookup () {
+        if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
+            sed -i -e 's:#UseDNS yes:UseDNS no:' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
+        fi
+}
+
 # Enable postinst logging if debug-tweaks is enabled
 postinst_enable_logging () {
 	mkdir -p ${IMAGE_ROOTFS}${sysconfdir}/default
@@ -374,7 +382,7 @@ rootfs_sysroot_relativelinks () {
 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
 }
 
-EXPORT_FUNCTIONS zap_empty_root_password remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp rootfs_no_x_startup
+EXPORT_FUNCTIONS zap_empty_root_password remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp rootfs_no_x_startup ssh_disable_dns_lookup
 
 do_fetch[noexec] = "1"
 do_unpack[noexec] = "1"
-- 
1.9.0


