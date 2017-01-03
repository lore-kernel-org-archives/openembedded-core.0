Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2CCF971975
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 22:33:29 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 03 Jan 2017 14:33:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,457,1477983600"; d="scan'208";a="209315241"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga004.fm.intel.com with ESMTP; 03 Jan 2017 14:33:29 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2017 22:30:42 +0000
Message-Id: <5c0e4c3b4851df52c8df67a8990865f214d7cc7c.1482363237.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
References: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
References: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 6/6] core-image-tiny-initramfs: Fix error message shown after a successful initrd boot
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
X-List-Received-Date: Tue, 03 Jan 2017 22:33:30 -0000

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
index 216f3e0..a1a4f66 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -29,3 +29,15 @@ BAD_RECOMMENDATIONS += "busybox-syslog"
 
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


