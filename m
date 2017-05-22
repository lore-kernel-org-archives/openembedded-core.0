Return-Path: <california.l.sullivan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 0C54577E88
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 17:35:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 22 May 2017 10:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,378,1491289200"; d="scan'208";a="1133512980"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 22 May 2017 10:35:03 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 May 2017 10:35:01 -0700
Message-Id: <1495474501-10841-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH] systemd-boot.bbclass: Add configuration data to secondary EFI partition
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
X-List-Received-Date: Mon, 22 May 2017 17:35:03 -0000

The secondary EFI partition is used when booting in EFI mode, and
without the configuration data we don't get any boot targets.

Partial fix to [YOCTO #11503].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/classes/systemd-boot.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index 4e69a2c..9597759 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -50,6 +50,7 @@ efi_iso_populate() {
         efi_populate $iso_dir
         mkdir -p ${EFIIMGDIR}/${EFIDIR}
         cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
+        cp -r $iso_dir/loader ${EFIIMGDIR}
         cp $iso_dir/vmlinuz ${EFIIMGDIR}
         EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
         echo "fs0:${EFIPATH}\\${DEST_EFI_IMAGE}" > ${EFIIMGDIR}/startup.nsh
-- 
2.5.5


