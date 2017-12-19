Return-Path: <california.l.sullivan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id ED19778698
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:58:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2017 14:58:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,428,1508828400"; d="scan'208";a="17433581"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2017 14:58:36 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 14:58:24 -0800
Message-Id: <20171219225831.22587-12-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171219225831.22587-1-california.l.sullivan@intel.com>
References: <20171219225831.22587-1-california.l.sullivan@intel.com>
Subject: [PATCH RFC 11/18] wic: add wks file to make use of new bootfs functionality
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

With the postprocess command and installation into /boot/ in place, we
can use wic to create an EFI-compatible image without it having any
knowledge of the kernel or bootloader.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 scripts/lib/wic/canned-wks/efi-bootdisk.wks.in | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 scripts/lib/wic/canned-wks/efi-bootdisk.wks.in

diff --git a/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in b/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
new file mode 100644
index 00000000000..c9d7aa5761e
--- /dev/null
+++ b/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
@@ -0,0 +1,6 @@
+# based off of refkit's refkit-directdisk.wks.in kickstart template
+# uses the image's boot directory to populate a vfat boot partition,
+# which works with EFI.
+bootloader --ptable gpt
+part /boot --source rootfs --rootfs-dir=${IMAGE_BOOTFS} --fstype=vfat --label msdos --active --align 1024 --use-uuid
+part / --source rootfs --fstype=ext4 --label root --align 1024 --uuid ${DISK_SIGNATURE_UUID}
-- 
2.14.3


