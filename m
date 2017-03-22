Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9A36177B84
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 13:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490190253; x=1521726253;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=57n0NkeJvFRiDL/eJwaIwekvbvBpTg7oR1/x+1pZy3c=;
	b=KZUy3dom3ymjxtyG1VL1HlxCQ+N9p+bYsjOqWj6dk7WzNXLYnFcPaxFn
	twO/6wfJgQxqrggSnju+AcbbVQ7kWA==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2017 06:44:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,205,1486454400"; d="scan'208";a="63642021"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 22 Mar 2017 06:44:08 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 83CA22C8001
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 06:44:02 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 15:42:32 +0200
Message-Id: <b1db91d4e83c4630afa3346b97beb08b0ceb5da3.1490188583.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490188583.git.ed.bartosh@linux.intel.com>
References: <cover.1490188583.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 08/10] oe-selftest: test wic rawcopy plugin
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
X-List-Received-Date: Wed, 22 Mar 2017 13:44:12 -0000

Added test_rawcopy_plugin_qemu test case and wks template.

This test builds ext4 rootfs image, copies it to the root
partition of the wic image using rawcopy plugin and
boots wic image in qemu.

[YOCTO #10618]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta-selftest/wic/test_rawcopy_plugin.wks.in |  6 ++++++
 meta/lib/oeqa/selftest/wic.py                | 16 ++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta-selftest/wic/test_rawcopy_plugin.wks.in

diff --git a/meta-selftest/wic/test_rawcopy_plugin.wks.in b/meta-selftest/wic/test_rawcopy_plugin.wks.in
new file mode 100644
index 0000000..83be4be
--- /dev/null
+++ b/meta-selftest/wic/test_rawcopy_plugin.wks.in
@@ -0,0 +1,6 @@
+# short-description: This file is used in oe-selftest wic module to test rawcopy plugin
+
+part /boot --active --source bootimg-pcbios
+part / --source rawcopy --sourceparams="file=core-image-minimal-${MACHINE}.ext4" --use-uuid
+
+bootloader  --timeout=0 --append="console=ttyS0,115200n8"
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 4aacd86..2e22362 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -681,3 +681,19 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         os.remove(wkspath)
         wicout = glob(self.resultdir + "%s-*direct" % wksname)
         self.assertEqual(0, len(wicout))
+
+    @only_for_arch(['i586', 'i686', 'x86_64'])
+    def test_rawcopy_plugin_qemu(self):
+        """Test rawcopy plugin in qemu"""
+        # build ext4 and wic images
+        for fstype in ("ext4", "wic"):
+            config = 'IMAGE_FSTYPES = "%s"\nWKS_FILE = "test_rawcopy_plugin.wks.in"\n' % fstype
+            self.append_config(config)
+            self.assertEqual(0, bitbake('core-image-minimal').status)
+            self.remove_config(config)
+
+        with runqemu('core-image-minimal', ssh=False, image_fstype='wic') as qemu:
+            cmd = "grep vda. /proc/partitions  |wc -l"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            self.assertEqual(output, '2')
-- 
2.1.4


