Return-Path: <california.l.sullivan@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 663DE784C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 22:03:49 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 14:03:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,396,1505804400"; 
   d="scan'208";a="2303312"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga003.jf.intel.com with ESMTP; 14 Nov 2017 14:03:49 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 14:03:40 -0800
Message-Id: <20171114220340.28764-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171114212050.15881-1-california.l.sullivan@intel.com>
References: <20171114212050.15881-1-california.l.sullivan@intel.com>
Cc: henry.bruce@intel.com, saul.wold@intel.com
Subject: [PATCH 3/3 V2] initramfs-framework: add install module
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
X-List-Received-Date: Tue, 14 Nov 2017 22:03:51 -0000

The non-EFI counterpart for installation was previously missing for
initramfs-framework. This simply puts the normal install script in the
correct location for initramfs-framework to make use of it.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
V2 changes:
* Add the module's dependencies to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS, since
  its dependencies changing don't matter in regards building the package.
* PR = "r1" since its a new recipe.

 meta/conf/layer.conf                                 |  4 ++++
 .../initrdscripts/initramfs-module-install_1.0.bb    | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 0342324..6782058 100644
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
index 0000000..ce7f165
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
2.9.5


