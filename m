Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D576C60053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 19:11:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 29 Jun 2015 12:11:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,371,1432623600"; d="scan'208";a="719797691"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2015 12:11:21 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id DE7CB6A4083;
	Mon, 29 Jun 2015 12:10:41 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 22:10:15 +0300
Message-Id: <1435605033-11509-3-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 02/20] wic: Test rootfs plugin using image recipes
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
X-List-Received-Date: Mon, 29 Jun 2015 19:11:22 -0000

Added canned wks and testcase to create multi-rootfs images referring
bitbake image recipes.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

 create mode 100644 scripts/lib/image/canned-wks/directdisk-multi-rootfs.wks

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 5385562..3cfc2ff 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -133,3 +133,13 @@ class Wic(oeSelfTest):
         self.assertEqual(2, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal "
                                    "-c wrong", ignore_status=True).status)
+
+    def test16_rootfs_indirect_recipes(self):
+        """Test usage of rootfs plugin with rootfs recipes"""
+        wks = "directdisk-multi-rootfs"
+        self.assertEqual(0, runCmd("wic create %s "
+                                   "--image-name core-image-minimal "
+                                   "--rootfs rootfs1=core-image-minimal "
+                                   "--rootfs rootfs2=core-image-minimal" \
+                                   % wks).status)
+        self.assertEqual(1, len(glob(self.resultdir + "%s*.direct" % wks)))
diff --git a/scripts/lib/image/canned-wks/directdisk-multi-rootfs.wks b/scripts/lib/image/canned-wks/directdisk-multi-rootfs.wks
new file mode 100644
index 0000000..f3c6df5
--- /dev/null
+++ b/scripts/lib/image/canned-wks/directdisk-multi-rootfs.wks
@@ -0,0 +1,23 @@
+# short-description: Create multi rootfs image using rootfs plugin
+# long-description: Creates a partitioned disk image with two rootfs partitions
+# using rootfs plugin.
+#
+# Partitions can use either
+#   - indirect rootfs references to image recipe(s):
+#     wic create directdisk-multi-indirect-recipes -e core-image-minimal \
+#         --rootfs-dir rootfs1=core-image-minimal
+#         --rootfs-dir rootfs2=core-image-minimal-dev
+#
+#   - or paths to rootfs directories:
+#     wic create directdisk-multi-rootfs \
+#         --rootfs-dir rootfs1=tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/
+#         --rootfs-dir rootfs2=tmp/work/qemux86_64-poky-linux/core-image-minimal-dev/1.0-r0/rootfs/
+#
+#   - or any combinations of -r and --rootfs command line options
+
+part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
+part / --source rootfs --rootfs-dir=rootfs1 --ondisk sda --fstype=ext3 --label platform --align 1024
+part /rescue --source rootfs --rootfs-dir=rootfs2 --ondisk sda --fstype=ext3 --label secondary --align 1024
+
+bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
+
-- 
2.1.4


