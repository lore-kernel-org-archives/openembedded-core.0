Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 946B371E52
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 12:11:55 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 15 May 2017 05:11:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,344,1491289200"; d="scan'208";a="102225444"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 15 May 2017 05:11:56 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 1190B6A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 05:11:40 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 14:48:58 +0300
Message-Id: <5999a21ec11d1bb5750efef10ad4c54951ece94f.1494846385.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494846385.git.ed.bartosh@linux.intel.com>
References: <cover.1494846385.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 1/5] efi: add efi_bootfs_populate API
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
X-List-Received-Date: Mon, 15 May 2017 12:11:55 -0000

Added API to populate ${WORKDIR}/bootfs directory with EFI
artifacts to both EFI provider classes(grub-efi and systemd-boot).

This API will be used to prepare artifacts for the wic image
build.

[YOCTO #10073]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/grub-efi.bbclass     | 6 ++++++
 meta/classes/systemd-boot.bbclass | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index df7fe18..bacbeb4 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -71,6 +71,12 @@ efi_hddimg_populate() {
 	efi_populate $1
 }
 
+efi_bootfs_populate() {
+	bootfs_dir="${WORKDIR}/bootfs"
+	efi_populate $bootfs_dir
+	cp --dereference ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} $bootfs_dir/vmlinuz
+}
+
 python build_efi_cfg() {
     import sys
 
diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index 4e69a2c..7e842af 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -62,6 +62,12 @@ efi_hddimg_populate() {
         efi_populate $1
 }
 
+efi_bootfs_populate() {
+        bootfs_dir="${WORKDIR}/bootfs"
+        efi_populate $bootfs_dir
+        cp --dereference ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} $bootfs_dir/vmlinuz
+}
+
 python build_efi_cfg() {
     s = d.getVar("S")
     labels = d.getVar('LABELS')
-- 
2.1.4


