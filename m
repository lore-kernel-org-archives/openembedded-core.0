Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7FAE9787B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 20:12:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2018 12:12:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,397,1515484800"; d="scan'208";a="203914572"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga005.jf.intel.com with ESMTP; 26 Feb 2018 12:12:30 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 12:12:02 -0800
Message-Id: <20180226201216.33204-3-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180226201216.33204-1-california.l.sullivan@intel.com>
References: <20180226201216.33204-1-california.l.sullivan@intel.com>
Subject: [PATCH 02/16] grub: create recipe for configuration
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
X-List-Received-Date: Mon, 26 Feb 2018 20:12:28 -0000

This makes use of the grub-efi-cfg bbclass that was split out to create
a grub.cfg file just like the old one.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/recipes-bsp/grub/grub-bootconf_1.00.bb | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/grub-bootconf_1.00.bb

diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
new file mode 100644
index 00000000000..36a13311b91
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
@@ -0,0 +1,29 @@
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+SUMMARY = "Basic grub.cfg for use in EFI systems"
+
+RPROVIDES_${PN} += "virtual/grub-bootconf"
+
+inherit grub-efi-cfg
+
+S = "${WORKDIR}"
+
+GRUB_CFG = "${S}/grub-bootconf"
+LABELS = "boot"
+
+ROOT = "root=/dev/sda2"
+
+python do_configure() {
+    bb.build.exec_func('build_efi_cfg', d)
+}
+
+do_configure[vardeps] += "APPEND"
+
+do_install() {
+	install -d ${D}/boot
+	install -d ${D}/boot/EFI
+	install -d ${D}/boot/EFI/BOOT
+	install -m 0744 grub-bootconf ${D}/boot/EFI/BOOT/grub.cfg
+}
+
+FILES_${PN} = "/boot/EFI/BOOT/grub.cfg"
-- 
2.14.3


