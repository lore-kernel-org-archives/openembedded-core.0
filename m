Return-Path: <california.l.sullivan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C42CD7868C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:58:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2017 14:58:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,428,1508828400"; d="scan'208";a="17433558"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2017 14:58:36 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 14:58:17 -0800
Message-Id: <20171219225831.22587-5-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171219225831.22587-1-california.l.sullivan@intel.com>
References: <20171219225831.22587-1-california.l.sullivan@intel.com>
Subject: [PATCH RFC 04/18] grub: create recipe for configuration
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

This makes use of the grub-efi-cfg bbclass that was split out to create
a grub.cfg file just like the old one.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/recipes-bsp/grub/grub-bootconf_1.00.bb | 30 +++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/grub-bootconf_1.00.bb

diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
new file mode 100644
index 00000000000..3dd897c3501
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
@@ -0,0 +1,30 @@
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+RPROVIDES_${PN} += "virtual/grub-bootconf"
+
+inherit allarch
+
+S = "${WORKDIR}"
+
+GRUB_CFG = "${S}/grub-bootconf"
+LABELS = "boot install"
+
+ROOT = "root=PARTUUID=${DISK_SIGNATURE_UUID}"
+
+do_configure[vardeps] += "ROOT APPEND DISK_SIGNATURE_UUID"
+
+python do_configure() {
+    bb.build.exec_func('build_efi_cfg', d)
+}
+
+do_install() {
+	install -d ${D}/boot
+	install -d ${D}/boot/EFI
+	install -d ${D}/boot/EFI/BOOT
+	install -m 0744 grub-bootconf ${D}/boot/EFI/BOOT/grub.cfg
+}
+
+FILES_${PN} = "/boot/EFI/BOOT/grub.cfg"
+
+inherit grub-efi-cfg
-- 
2.14.3


