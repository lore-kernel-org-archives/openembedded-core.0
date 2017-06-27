Return-Path: <california.l.sullivan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3598B7760A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 00:52:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jun 2017 17:52:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,398,1493708400"; d="scan'208";a="985502999"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga003.jf.intel.com with ESMTP; 26 Jun 2017 17:52:17 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jun 2017 17:52:17 -0700
Message-Id: <20170627005217.10866-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH][pyro] systemd-boot.bbclass: Add configuration data to secondary EFI partition
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
X-List-Received-Date: Tue, 27 Jun 2017 00:52:19 -0000

The secondary EFI partition is used when booting in EFI mode, and
without the configuration data we don't get any boot targets.

Partial fix to [YOCTO #11503].

(From OE-Core master rev: 84aa7a00810e135fdad3f77bdb1da7d1f5fb8627)

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
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
2.9.4


