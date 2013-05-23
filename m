Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 961716A459
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 13:15:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2013 06:15:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,728,1363158000"; d="scan'208";a="342006808"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2013 06:15:32 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 16:15:21 +0300
Message-Id: <01001592080393b0f28aca06ff4adc98260b6669.1369313581.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1369313581.git.laurentiu.palcu@intel.com>
References: <cover.1369313581.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1369313581.git.laurentiu.palcu@intel.com>
References: <cover.1369313581.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/7] image.bbclass: remove unneeded files from the image
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
X-List-Received-Date: Thu, 23 May 2013 13:15:32 -0000

This patch creates a new function, rootfs_remove_unneeded(), that will
be called after rootfs_*_do_rootfs is called and which will handle
delayed postinstalls in a generic fashion, for all backends in the same
way.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/image.bbclass |   33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 04db533..380ed8e 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -303,6 +303,9 @@ fakeroot do_rootfs () {
 
 	rootfs_${IMAGE_PKGTYPE}_do_rootfs
 
+	# remove unneeded packages/files from the final image
+	rootfs_remove_unneeded
+
 	insert_feed_uris
 
 	if [ "x${LDCONFIGDEPEND}" != "x" ]; then
@@ -463,6 +466,36 @@ rootfs_install_complementary() {
     fi
 }
 
+rootfs_remove_unneeded () {
+	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
+		if [ -z "$(delayed_postinsts)" ]; then
+			# All packages were successfully configured.
+			# update-rc.d, base-passwd, run-postinsts are no further use, remove them now
+			remove_run_postinsts=false
+			if [ -e ${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts ]; then
+				remove_run_postinsts=true
+			fi
+			rootfs_remove_packages update-rc.d base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}
+
+			# Need to remove rc.d files for run-postinsts by hand since opkg won't
+			# call postrm scripts in offline root mode.
+			if $remove_run_postinsts; then
+				update-rc.d -f -r ${IMAGE_ROOTFS} run-postinsts remove
+			fi
+		else
+			# Some packages were not successfully configured, save them only
+			# if we have run-postinsts script present. Otherwise, they're
+			# useless
+			if [ -e ${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts ]; then
+				save_postinsts
+			fi
+		fi
+
+		# Since no package manager is present in the image the metadata is not needed
+		remove_packaging_data_files
+	fi
+}
+
 # set '*' as the root password so the images
 # can decide if they want it or not
 zap_root_password () {
-- 
1.7.9.5


