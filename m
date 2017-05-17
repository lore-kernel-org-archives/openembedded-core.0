Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 104EC77E0E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 13:48:29 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2017 06:48:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,354,1491289200"; d="scan'208";a="101718257"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 17 May 2017 06:48:30 -0700
Received: from vmed.fi.intel.com (crosswalk-testmaster.fi.intel.com
	[10.237.72.36])
	by linux.intel.com (Postfix) with ESMTP id 2F4CB6A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 06:48:14 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 13:47:45 +0000
Message-Id: <ab38484d5565e46fffc3fd6a594e27be48202b54.1495028624.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1495028624.git.ed.bartosh@linux.intel.com>
References: <cover.1495028624.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v4 2/7] efi: add efi_bootfs_populate API
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
X-List-Received-Date: Wed, 17 May 2017 13:48:30 -0000

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
index df7fe18a79..bacbeb4b66 100644
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
index 4412fb1ef7..c97adce584 100644
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
2.12.0


