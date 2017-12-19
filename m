Return-Path: <california.l.sullivan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id B94577867C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:58:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2017 14:58:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,428,1508828400"; d="scan'208";a="17433569"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2017 14:58:36 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 14:58:20 -0800
Message-Id: <20171219225831.22587-8-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171219225831.22587-1-california.l.sullivan@intel.com>
References: <20171219225831.22587-1-california.l.sullivan@intel.com>
Subject: [PATCH RFC 07/18] rootfs-postcommands: add rootfs postprocess command to avoid /boot/ duplication
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
X-List-Received-Date: Tue, 19 Dec 2017 22:58:39 -0000

EFI systems need their /boot/ directory in its own partition. By
splitting it into its own directory like this, we avoid /boot/ ending up
in the primary rootfs, and can easily create the EFI partition from the
IMAGE_BOOTFS directory.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index a4e627fef84..e617c26f41a 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -25,6 +25,9 @@ APPEND_append = '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", " ro
 # Generates test data file with data store variables expanded in json format
 ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data ; "
 
+# Splits /boot into its own rootfs to easily turn it into its own partition
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("MACHINE_FEATURES", "efi", "split_bootpartition; ", "",d)}'
+
 # Write manifest
 IMAGE_MANIFEST = "${IMGDEPLOYDIR}/${IMAGE_NAME}.rootfs.manifest"
 ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
@@ -317,6 +320,22 @@ python write_image_test_data() {
 }
 write_image_test_data[vardepsexclude] += "TOPDIR"
 
+IMAGE_BOOTFS="${WORKDIR}/bootfs"
+# hardlink rootfs/boot/* into bootfs/, then delete the original
+split_bootpartition () {
+	if [ ! -d ${IMAGE_BOOTFS} ];
+	then
+		mkdir -p ${IMAGE_BOOTFS}
+	else
+		rm -rf ${IMAGE_BOOTFS}/*
+	fi
+	if [ -d ${IMAGE_ROOTFS}/boot ] && [ -n "$(ls -A ${IMAGE_ROOTFS}/boot)" ];
+	then
+		cp -rla ${IMAGE_ROOTFS}/boot/* ${IMAGE_BOOTFS}/
+		rm -rf ${IMAGE_ROOTFS}/boot/*
+	fi
+}
+
 # Check for unsatisfied recommendations (RRECOMMENDS)
 python rootfs_log_check_recommends() {
     log_path = d.expand("${T}/log.do_rootfs")
-- 
2.14.3


