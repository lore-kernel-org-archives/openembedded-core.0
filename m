Return-Path: <california.l.sullivan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 27EDC7867B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 00:56:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Dec 2017 16:56:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,434,1508828400"; 
   d="scan'208";a="4472571"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga008.jf.intel.com with ESMTP; 20 Dec 2017 16:56:41 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Dec 2017 16:56:34 -0800
Message-Id: <20171221005637.34163-4-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171221005637.34163-1-california.l.sullivan@intel.com>
References: <20171221005637.34163-1-california.l.sullivan@intel.com>
Cc: akuster@mvista.com
Subject: [rocko][PATCH 3/6] initramfs-framework: add install module
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
X-List-Received-Date: Thu, 21 Dec 2017 00:56:40 -0000

The non-EFI counterpart for installation was previously missing for
initramfs-framework. This simply puts the normal install script in the
correct location for initramfs-framework to make use of it.

Partial fix for [YOCTO #12346].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit f9d7cf30b12cbc5f642a11c0511dc1dc3ccf1aa5)
Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/conf/layer.conf                                 |  4 ++++
 .../initrdscripts/initramfs-module-install_1.0.bb    | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 6be2a57a70..4ba0b9378e 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -57,6 +57,10 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   initramfs-module-install-efi->e2fsprogs \
   initramfs-module-install-efi->parted \
   initramfs-module-install-efi->util-linux \
+  initramfs-module-install->e2fsprogs \
+  initramfs-module-install->grub \
+  initramfs-module-install->parted \
+  initramfs-module-install->util-linux \
   liberation-fonts->fontconfig \
   cantarell-fonts->fontconfig \
   gnome-icon-theme->librsvg \
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
new file mode 100644
index 0000000000..ce7f165bfe
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "initramfs-framework module for installation option"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+RDEPENDS_${PN} = "initramfs-framework-base grub parted e2fsprogs-mke2fs util-linux-blkid"
+
+PR = "r1"
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
2.14.3


