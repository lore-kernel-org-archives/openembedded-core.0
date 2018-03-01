Return-Path: <california.l.sullivan@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6316A7894E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 02:16:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2018 18:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,407,1515484800"; d="scan'208";a="178932808"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga004.jf.intel.com with ESMTP; 28 Feb 2018 18:16:13 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Feb 2018 18:15:05 -0800
Message-Id: <20180301021518.29564-9-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301021518.29564-1-california.l.sullivan@intel.com>
References: <20180301021518.29564-1-california.l.sullivan@intel.com>
Subject: [PATCH v3 08/21] wic: add wks file to make use of exclude-path functionality
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

Using --exclude-path and a wks.in file we can create an image that takes
the /boot/ directory for the boot partition, has an empty /boot/
directory in the rootfs partition. The boot partition gets mounted to
/boot/ after startup.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 scripts/lib/wic/canned-wks/efi-bootdisk.wks.in | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 scripts/lib/wic/canned-wks/efi-bootdisk.wks.in

diff --git a/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in b/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
new file mode 100644
index 00000000000..7300e65e32d
--- /dev/null
+++ b/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
@@ -0,0 +1,3 @@
+bootloader --ptable gpt
+part /boot --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/boot --fstype=vfat --label boot --active --align 1024 --use-uuid --overhead-factor 1.0
+part / --source rootfs --fstype=ext4 --label root --align 1024 --exclude-path boot/
-- 
2.14.3


