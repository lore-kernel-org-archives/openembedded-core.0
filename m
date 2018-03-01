Return-Path: <california.l.sullivan@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4C88378960
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 02:16:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2018 18:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,407,1515484800"; d="scan'208";a="178932823"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga004.jf.intel.com with ESMTP; 28 Feb 2018 18:16:13 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Feb 2018 18:15:10 -0800
Message-Id: <20180301021518.29564-14-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301021518.29564-1-california.l.sullivan@intel.com>
References: <20180301021518.29564-1-california.l.sullivan@intel.com>
Subject: [PATCH v3 13/21] systemd-boot*.bbclass: Don't use vmlinuz
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
X-List-Received-Date: Thu, 01 Mar 2018 02:16:15 -0000

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


