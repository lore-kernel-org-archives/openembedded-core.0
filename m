Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 33BBF71A30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 18:31:57 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2017 10:31:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,250,1477983600"; d="scan'208";a="54537364"
Received: from bitbang.jf.intel.com ([10.7.199.68])
	by orsmga005.jf.intel.com with ESMTP; 18 Jan 2017 10:31:56 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jan 2017 10:31:50 -0800
Message-Id: <023e14ed9eb107b5487e142049eb1c74c898cb2b.1484764234.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1484764234.git.randy.e.witt@linux.intel.com>
References: <cover.1484764234.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 1/3] image-container.bbclass: Add the "container" IMAGE_FSTYPES
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
X-List-Received-Date: Wed, 18 Jan 2017 18:31:57 -0000

The "container" fstype does very little other than pick tar.bz2 as the
actual image type and disable installation of ROOTFS_BOOTSTRAP_INSTALL.

[YOCTO #9502]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/image-container.bbclass | 3 +++
 meta/classes/image.bbclass           | 3 +++
 meta/classes/image_types.bbclass     | 1 +
 3 files changed, 7 insertions(+)
 create mode 100644 meta/classes/image-container.bbclass

diff --git a/meta/classes/image-container.bbclass b/meta/classes/image-container.bbclass
new file mode 100644
index 0000000..a10ee32
--- /dev/null
+++ b/meta/classes/image-container.bbclass
@@ -0,0 +1,3 @@
+ROOTFS_BOOTSTRAP_INSTALL = ""
+IMAGE_TYPES_MASKED += "container"
+IMAGE_TYPEDEP_container = "tar.bz2"
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 04fd5f9..b2c2a28 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -144,6 +144,9 @@ inherit ${IMAGE_TYPE_live}
 IMAGE_TYPE_vm = '${@bb.utils.contains_any("IMAGE_FSTYPES", ["vmdk", "vdi", "qcow2", "hdddirect"], "image-vm", "", d)}'
 inherit ${IMAGE_TYPE_vm}
 
+IMAGE_TYPE_container = '${@bb.utils.contains("IMAGE_FSTYPES", "container", "image-container", "", d)}'
+inherit ${IMAGE_TYPE_container}
+
 def build_uboot(d):
     if 'u-boot' in (d.getVar('IMAGE_FSTYPES') or ''):
         return "image_types_uboot"
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 7748dee..727a87e 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -328,6 +328,7 @@ IMAGE_TYPES = " \
     hdddirect \
     elf \
     wic wic.gz wic.bz2 wic.lzma \
+    container \
 "
 
 # Compression is a special case of conversion. The old variable
-- 
2.9.3


