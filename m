Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0B206FD30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 10:45:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5GAjJeQ003038
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 03:45:19 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 16 Jun 2014 03:45:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 18:46:23 +0800
Message-ID: <a05167c5bf0877dc40887e9040f3f386bf4b1263.1402915083.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402915083.git.Qi.Chen@windriver.com>
References: <cover.1402915083.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/9] initramfs-image-minimal.bb: add recipe
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
X-List-Received-Date: Mon, 16 Jun 2014 10:45:25 -0000
Content-Type: text/plain

Add a recipe for a minimal initramfs image.

Note that the purpose of this recipe is totally different from that
of core-image-minimal-initramfs.bb. The latter is supposed to be used
in the live image to "boot" or "install". The former is more like a
traditional initramfs whose responsibility is to deal with the kernel
parameters and then bring up the real root file system.

After adding this recipe, we could specify INITRAMFS_IMAGE to be
"initramfs-image-minimal". Note that in OE, we didn't have a reference
image recipe for INITRAMFS_IMAGE.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-core/images/initramfs-image-minimal.bb |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-core/images/initramfs-image-minimal.bb

diff --git a/meta/recipes-core/images/initramfs-image-minimal.bb b/meta/recipes-core/images/initramfs-image-minimal.bb
new file mode 100644
index 0000000..24501e0
--- /dev/null
+++ b/meta/recipes-core/images/initramfs-image-minimal.bb
@@ -0,0 +1,19 @@
+# Minimal initramfs image
+DESCRIPTION = "Minimal initramfs image used to bring up the system."
+LICENSE = "MIT"
+
+PACKAGE_INSTALL = "initramfs-framework-base initramfs-module-udev busybox udev base-passwd"
+
+# Do not pollute the initramfs image with rootfs features
+IMAGE_FEATURES = ""
+IMAGE_LINGUAS = ""
+
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+inherit image
+
+BAD_RECOMMENDATIONS += "busybox-syslog"
+
+# We need to set USE_DEVFS to "0" here to trigger creation of device nodes at rootfs time.
+# The reason here is that, when this initramfs is bundled into kernel, we need /dev/console
+# to be there before init is run.
+USE_DEVFS = "0"
-- 
1.7.9.5


