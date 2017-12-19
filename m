Return-Path: <california.l.sullivan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id EF81D78679
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:58:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2017 14:58:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,428,1508828400"; d="scan'208";a="17433596"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2017 14:58:36 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 14:58:29 -0800
Message-Id: <20171219225831.22587-17-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171219225831.22587-1-california.l.sullivan@intel.com>
References: <20171219225831.22587-1-california.l.sullivan@intel.com>
Subject: [PATCH RFC 16/18] systemd-boot*.bbclass: Don't use vmlinuz
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

We can't guarantee vmlinuz anymore. Use KERNEL_IMAGETYPE instead.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/classes/systemd-boot-cfg.bbclass | 6 +++++-
 meta/classes/systemd-boot.bbclass     | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/systemd-boot-cfg.bbclass b/meta/classes/systemd-boot-cfg.bbclass
index 46eeae126ae..360c86cbd34 100644
--- a/meta/classes/systemd-boot-cfg.bbclass
+++ b/meta/classes/systemd-boot-cfg.bbclass
@@ -1,3 +1,5 @@
+KERNEL_IMAGETYPE ??= "bzImage"
+
 SYSTEMD_BOOT_CFG ?= "${S}/loader.conf"
 SYSTEMD_BOOT_ENTRIES ?= ""
 SYSTEMD_BOOT_TIMEOUT ?= "10"
@@ -52,7 +54,9 @@ python build_efi_cfg() {
         localdata.setVar('OVERRIDES', label + ':' + overrides)
 
         entrycfg.write('title %s\n' % label)
-        entrycfg.write('linux /vmlinuz\n')
+
+        kernel = localdata.getVar("KERNEL_IMAGETYPE")
+        entrycfg.write('linux /%s\n' % kernel)
 
         append = localdata.getVar('APPEND')
         initrd = localdata.getVar('INITRD')
diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index 14538fe2d7a..3cd6811a6ce 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -45,7 +45,7 @@ efi_iso_populate() {
         mkdir -p ${EFIIMGDIR}/${EFIDIR}
         cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
         cp -r $iso_dir/loader ${EFIIMGDIR}
-        cp $iso_dir/vmlinuz ${EFIIMGDIR}
+        cp $iso_dir/${KERNEL_IMAGETYPE} ${EFIIMGDIR}
         EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
         echo "fs0:${EFIPATH}\\${DEST_EFI_IMAGE}" > ${EFIIMGDIR}/startup.nsh
         if [ -f "$iso_dir/initrd" ] ; then
-- 
2.14.3


