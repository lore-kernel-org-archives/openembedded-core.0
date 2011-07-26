Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qld0B-00005I-6j
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 10:28:31 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jul 2011 01:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,268,1309762800"; d="scan'208";a="34539820"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2011 01:24:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 01:24:10 -0700
Message-Id: <d52c37c3456ce4d159a0e5795436eaf44a3716a5.1311668437.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311668437.git.sgw@linux.intel.com>
References: <cover.1311668437.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311668437.git.sgw@linux.intel.com>
References: <cover.1311668437.git.sgw@linux.intel.com>
Subject: [RFC-WIP 3/3] Remove -directdisk.bb recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jul 2011 08:28:31 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta-rt/images/core-image-minimal-rt-directdisk.bb |   15 ---------------
 meta/recipes-core/images/core-image-directdisk.inc |   11 -----------
 .../images/core-image-minimal-directdisk.bb        |   11 -----------
 .../images/core-image-sato-directdisk.bb           |    9 ---------
 .../images/core-image-sato-sdk-directdisk.bb       |    9 ---------
 5 files changed, 0 insertions(+), 55 deletions(-)
 delete mode 100644 meta-rt/images/core-image-minimal-rt-directdisk.bb
 delete mode 100644 meta/recipes-core/images/core-image-directdisk.inc
 delete mode 100644 meta/recipes-core/images/core-image-minimal-directdisk.bb
 delete mode 100644 meta/recipes-sato/images/core-image-sato-directdisk.bb
 delete mode 100644 meta/recipes-sato/images/core-image-sato-sdk-directdisk.bb

diff --git a/meta-rt/images/core-image-minimal-rt-directdisk.bb b/meta-rt/images/core-image-minimal-rt-directdisk.bb
deleted file mode 100644
index b3f3523..0000000
--- a/meta-rt/images/core-image-minimal-rt-directdisk.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-#
-# Copyright (C) 2010 Intel Corporation.
-#
-
-require recipes-core/images/core-image-directdisk.inc
-
-DESCRIPTION = "Bootable Minimal Real-Time Direct Disk Image"
-
-ROOTFS = "${DEPLOY_DIR_IMAGE}/core-image-minimal-rt-${MACHINE}.ext3"
-
-LICENSE = "MIT"
-
-do_bootdirectdisk[depends] += "core-image-minimal-rt:do_rootfs"
-
-
diff --git a/meta/recipes-core/images/core-image-directdisk.inc b/meta/recipes-core/images/core-image-directdisk.inc
deleted file mode 100644
index ef9e72d..0000000
--- a/meta/recipes-core/images/core-image-directdisk.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-inherit boot-directdisk
-
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-do_bootdirectdisk_prepend () {
-	import bb
-	fstypes = bb.data.getVar('IMAGE_FSTYPES', d, True)
-	if 'ext3' not in fstypes:
-		bb.msg.fatal(bb.msg.domain.Build, "ext3 not in IMAGE_FSTYPES")
-}
\ No newline at end of file
diff --git a/meta/recipes-core/images/core-image-minimal-directdisk.bb b/meta/recipes-core/images/core-image-minimal-directdisk.bb
deleted file mode 100644
index ed23e45..0000000
--- a/meta/recipes-core/images/core-image-minimal-directdisk.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require core-image-directdisk.inc
-
-DESCRIPTION = "Minimal Bootable Direct Disk Image"
-
-ROOTFS = "${DEPLOY_DIR_IMAGE}/core-image-minimal-${MACHINE}.ext3"
-
-LICENSE = "MIT"
-
-do_bootdirectdisk[depends] += "core-image-minimal:do_rootfs"
-
-
diff --git a/meta/recipes-sato/images/core-image-sato-directdisk.bb b/meta/recipes-sato/images/core-image-sato-directdisk.bb
deleted file mode 100644
index 1e6aa66..0000000
--- a/meta/recipes-sato/images/core-image-sato-directdisk.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require recipes-core/images/core-image-directdisk.inc
-
-DESCRIPTION = "Sato Direct Disk Image"
-
-LICENSE = "MIT"
-
-ROOTFS = "${DEPLOY_DIR_IMAGE}/core-image-sato-${MACHINE}.ext3"
-
-do_bootdirectdisk[depends] += "core-image-sato:do_rootfs"
diff --git a/meta/recipes-sato/images/core-image-sato-sdk-directdisk.bb b/meta/recipes-sato/images/core-image-sato-sdk-directdisk.bb
deleted file mode 100644
index 4c1535a..0000000
--- a/meta/recipes-sato/images/core-image-sato-sdk-directdisk.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require recipes-core/images/core-image-directdisk.inc
-
-DESCRIPTION = "Sato SDK Direct Disk Image"
-
-LICENSE = "MIT"
-
-ROOTFS = "${DEPLOY_DIR_IMAGE}/core-image-sato-sdk-${MACHINE}.ext3"
-
-do_bootdirectdisk[depends] += "core-image-sato-sdk:do_rootfs"
-- 
1.7.3.4



