Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E849377177
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567387"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:41 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:09:45 -0600
Message-Id: <7442a210f43288e345e888e0fa748fb2ee6780f7.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 14/55] classes/rootfs-postcommands: Add write_image_test_data
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This function will generates testdata.json by image type.

[YOCTO #10231]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 53a4fda..c8f18c6 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -14,6 +14,9 @@ ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
 # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
 
+# Generates test data file with data store variables expanded in json format
+ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data ; "
+
 # Write manifest
 IMAGE_MANIFEST = "${IMGDEPLOYDIR}/${IMAGE_NAME}.rootfs.manifest"
 ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
@@ -300,3 +303,18 @@ rootfs_check_host_user_contaminated () {
 rootfs_sysroot_relativelinks () {
 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
 }
+
+# Generated test data json file
+python write_image_test_data() {
+    from oe.data import export2json
+
+    testdata = "%s/%s.testdata.json" % (d.getVar('DEPLOY_DIR_IMAGE', True), d.getVar('IMAGE_NAME', True))
+    testdata_link = "%s/%s.testdata.json" % (d.getVar('DEPLOY_DIR_IMAGE', True), d.getVar('IMAGE_LINK_NAME', True))
+
+    bb.utils.mkdirhier(os.path.dirname(testdata))
+    export2json(d, testdata)
+
+    if os.path.lexists(testdata_link):
+       os.remove(testdata_link)
+    os.symlink(os.path.basename(testdata), testdata_link)
+}
-- 
2.1.4


