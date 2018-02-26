Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D8E4178784
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 20:12:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2018 12:12:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,397,1515484800"; d="scan'208";a="203914587"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga005.jf.intel.com with ESMTP; 26 Feb 2018 12:12:30 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 12:12:07 -0800
Message-Id: <20180226201216.33204-8-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180226201216.33204-1-california.l.sullivan@intel.com>
References: <20180226201216.33204-1-california.l.sullivan@intel.com>
Subject: [PATCH 07/16] grub-efi*.bbclass: don't reference vmlinuz
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
X-List-Received-Date: Mon, 26 Feb 2018 20:12:30 -0000

Rather than renaming the kernel to vmlinuz and assuming the name is
vmlinuz in the grub.cfg, copy to ${KERNEL_IMAGETYPE} and also use that
value in the grub.cfg file.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/classes/grub-efi-cfg.bbclass | 4 +++-
 meta/classes/grub-efi.bbclass     | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/grub-efi-cfg.bbclass b/meta/classes/grub-efi-cfg.bbclass
index 730323c72e6..85173c91fc3 100644
--- a/meta/classes/grub-efi-cfg.bbclass
+++ b/meta/classes/grub-efi-cfg.bbclass
@@ -22,6 +22,7 @@ GRUB_CFG_LIVE = "${S}/grub_live.cfg"
 GRUB_TIMEOUT ?= "10"
 #FIXME: build this from the machine config
 GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
+KERNEL_IMAGETYPE ??= "bzImage"
 
 EFIDIR = "/EFI/BOOT"
 GRUB_ROOT ?= "${ROOT}"
@@ -97,7 +98,8 @@ python build_efi_cfg() {
             lb = label
             if label == "install":
                 lb = "install-efi"
-            cfgfile.write('linux /vmlinuz LABEL=%s' % (lb))
+            kernel = localdata.getVar('KERNEL_IMAGETYPE')
+            cfgfile.write('linux /%s LABEL=%s' % (kernel, lb))
 
             cfgfile.write(' %s' % replace_rootfs_uuid(d, root))
 
diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 4b5704c19cc..90badc03a0e 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -26,7 +26,7 @@ efi_iso_populate() {
 	# Build a EFI directory to create efi.img
 	mkdir -p ${EFIIMGDIR}/${EFIDIR}
 	cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
-	cp $iso_dir/vmlinuz ${EFIIMGDIR}
+	cp $iso_dir/${KERNEL_IMAGETYPE} ${EFIIMGDIR}
 	EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
 	printf 'fs0:%s\%s\n' "$EFIPATH" "$GRUB_IMAGE" > ${EFIIMGDIR}/startup.nsh
 	if [ -f "$iso_dir/initrd" ] ; then
-- 
2.14.3


