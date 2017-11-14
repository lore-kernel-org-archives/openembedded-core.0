Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B4409784F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 21:20:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 13:21:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,396,1505804400"; 
   d="scan'208";a="2290809"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga003.jf.intel.com with ESMTP; 14 Nov 2017 13:21:00 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 13:20:50 -0800
Message-Id: <20171114212050.15881-4-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171114212050.15881-1-california.l.sullivan@intel.com>
References: <20171114212050.15881-1-california.l.sullivan@intel.com>
Cc: henry.bruce@intel.com, saul.wold@intel.com
Subject: [PATCH 3/3] initramfs-framework: add install module
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
X-List-Received-Date: Tue, 14 Nov 2017 21:20:58 -0000

The non-EFI counterpart for installation was previously missing for
initramfs-framework. This simply puts the normal install script in the
correct location for initramfs-framework to make use of it.

Partial fix for [YOCTO #12346].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 .../initrdscripts/initramfs-module-install_1.0.bb    | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb

diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
new file mode 100644
index 0000000..76f8fda
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "initramfs-framework module for installation option"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+RDEPENDS_${PN} = "initramfs-framework-base grub parted e2fsprogs-mke2fs util-linux-blkid"
+
+PR = "r4"
+
+inherit allarch
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+SRC_URI = "file://init-install.sh"
+
+S = "${WORKDIR}"
+
+do_install() {
+    install -d ${D}/init.d
+    install -m 0755 ${WORKDIR}/init-install.sh ${D}/init.d/install.sh
+}
+
+FILES_${PN} = "/init.d/install.sh"
-- 
2.9.5


