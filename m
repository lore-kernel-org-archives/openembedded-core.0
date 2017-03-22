Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E286177B74
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 13:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490190250; x=1521726250;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qM/et7K84Rb0Ag1c0YH+L3ZWlkiaJmWZEDR+jtd7tRQ=;
	b=N3UUdm4CIC5u0Y3YfN9SXPnXi6GlhfFU0dMKm71GUgYuv8fd1qWhTABh
	XWcHjLd4kpUCU9BFMkbCWYcUxKja+A==;
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2017 06:44:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,205,1486454400"; d="scan'208";a="78187220"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 22 Mar 2017 06:44:10 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 972362C8001
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 06:44:04 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 15:42:34 +0200
Message-Id: <e9985040ca4dad1706cea5567a2875b5813877bc.1490188583.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490188583.git.ed.bartosh@linux.intel.com>
References: <cover.1490188583.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 10/10] oe-selftest: add test_rawcopy_plugin test case
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
X-List-Received-Date: Wed, 22 Mar 2017 13:44:09 -0000

This test case builds wic image using rawcopy plugin
running wic directly.

[YOCTO #10618]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 327dd07..ee633f8 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -701,3 +701,19 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '2')
+
+    def test_rawcopy_plugin(self):
+        """Test rawcopy plugin"""
+        img = 'core-image-minimal'
+        machine = get_bb_var('MACHINE', img)
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.writelines(['part /boot --active --source bootimg-pcbios\n',
+                            'part / --source rawcopy --sourceparams="file=%s-%s.ext4" --use-uuid\n'\
+                             % (img, machine),
+                            'bootloader --timeout=0 --append="console=ttyS0,115200n8"\n'])
+            wks.flush()
+            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            self.assertEqual(0, runCmd(cmd).status)
+            wksname = os.path.splitext(os.path.basename(wks.name))[0]
+            out = glob(self.resultdir + "%s-*direct" % wksname)
+            self.assertEqual(1, len(out))
-- 
2.1.4


