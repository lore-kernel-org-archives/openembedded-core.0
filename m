Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C59C371AE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 19:58:23 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 11 Jan 2017 11:58:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="807758397"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2017 11:58:24 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2017 19:55:22 +0000
Message-Id: <cc94e0a34c22a4cc440a50efc83d0c91c2f23529.1484164023.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
References: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
References: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 5/7] core-image-tiny-initramfs: Fix error message shown after a successful initrd boot
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
X-List-Received-Date: Wed, 11 Jan 2017 19:58:24 -0000

When booting core-image-tiny-initramfs, since we want to live on initrd,
on purpose, we never find a rootfs image to switch root to,
this causes init to show an error as it would with other images,
this patch replaces the message shown to the user, avoiding confusion
when it was indeed a successful boot.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-core/images/core-image-tiny-initramfs.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
index 71b7488..6fcb6a9 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -28,3 +28,15 @@ BAD_RECOMMENDATIONS += "busybox-syslog"
 
 # Use the same restriction as initramfs-live-install
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+
+python tinyinitrd () {
+  # Modify our init file so the user knows we drop to shell prompt on purpose
+  newinit = None
+  with open(d.expand('${IMAGE_ROOTFS}/init'), 'r') as init:
+    newinit = init.read()
+    newinit = newinit.replace('Cannot find $ROOT_IMAGE file in /run/media/* , dropping to a shell ', 'Poky Tiny Reference Distribution:')
+  with open(d.expand('${IMAGE_ROOTFS}/init'), 'w') as init:
+    init.write(newinit)
+}
+
+IMAGE_PREPROCESS_COMMAND += "tinyinitrd;"
-- 
2.6.6


