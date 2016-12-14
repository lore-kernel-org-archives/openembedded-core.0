Return-Path: <kristian.amlie@mender.io>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 62B4177267
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 16:29:16 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id g23so121233522wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 08:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=y3oBMl76ztvzkSKjk9uA4eXuw+XRFpP9vQgv/SjThqs=;
	b=jF/xmgEH9Q6+75/akUlfDj3CMVIYtgdn2hxnvL7HkEqOdRAXlJl7Bh2nksuO3c3XTe
	N5iv5CuUrvLcJ/ZjiaQLbeNKWq9l+TJprHKJBJducMj76oXOnSPx8hm4sh0CfmsMnb7O
	RFiBhNEcrJ9jymNYHS9ZbzkqJQ/GuxL2QIEQSydlYYSzJ3XqmJ0RgpR//2Z9BQaJMr3D
	61PR6Rr6TixHf+pLKZVf5D5LB798M4C4lisIx3dwzRC04SwDIHQnoa+xTs2SQvQicRB3
	DQYs+uBlkYvgCaDBj4x8eJbtXr2/UFs4eunJCPIv05dbCw5ZXVc1SAB99H9frLE58EQv
	JqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=y3oBMl76ztvzkSKjk9uA4eXuw+XRFpP9vQgv/SjThqs=;
	b=ROlk+DERPgfchpvZCqQSqr+/LGvIw3gYZsO9vRq92AWlsFozorPOyEYTHyuynpoMfj
	bPeqNN2TZr3CrCTYWInQLvt1dqduh3yTLufBM1sRr5pwtoisMpf243iFYOoOWUtNi2Cd
	7pwSPOtLaUKmBrP0ol9xd6CWyhSrKq++oilzfrd+1PIr2NF7EJJDrRsyWJKJ6eHznshm
	AfV7icWSCfJFukjLm/vjdo4nd5rclJ2CDmKZ0g13nkAbPiFWB3hDDfCJTuTR8gCZot6T
	0rVXv1UZFsSSQStePYAQiIVPX0RcsI4jXhaPUiEAFtOCjX3q6s1ibYZJIYBGjsiuEH5c
	H5QQ==
X-Gm-Message-State: AKaTC00zfoJR6wQbk7z+mhgIjkfykh5ExUdy7CmeMvcBUNFrsg1FieA5MBTOcAX8hcH+3A==
X-Received: by 10.25.15.39 with SMTP id e39mr10508017lfi.117.1481732957132;
	Wed, 14 Dec 2016 08:29:17 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	9sm10891875ljn.20.2016.12.14.08.29.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Dec 2016 08:29:16 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2016 17:28:54 +0100
Message-Id: <1481732934-5128-4-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481732934-5128-1-git-send-email-kristian.amlie@mender.io>
References: <20161128111825.GA16035@linux.intel.com>
	<1481732934-5128-1-git-send-email-kristian.amlie@mender.io>
Subject: [PATCH v2 3/3] selftest/wic: Add tests for --exclude-dir option.
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
X-List-Received-Date: Wed, 14 Dec 2016 16:29:16 -0000

Based partially on an earlier patch by Maciej Borzecki.

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 meta/lib/oeqa/selftest/wic.py | 106 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 105 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index faac11e..b2b0fe8 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -49,7 +49,8 @@ class Wic(oeSelfTest):
         # setUpClass being unavailable.
         if not Wic.image_is_ready:
             bitbake('syslinux syslinux-native parted-native gptfdisk-native '
-                    'dosfstools-native mtools-native bmap-tools-native')
+                    'dosfstools-native mtools-native bmap-tools-native '
+                    'e2tools-native')
             bitbake('core-image-minimal')
             Wic.image_is_ready = True
 
@@ -299,3 +300,106 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
                                    % image).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
+
+    def test_exclude_path(self):
+        """Test --exclude-path wks option."""
+
+        # For using 'e2ls'.
+        old_path = os.environ['PATH']
+        os.environ['PATH'] = get_bb_var('PATH', 'core-image-minimal')
+
+        wks_file = 'temp.wks'
+        ks = open(wks_file, 'w')
+        rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
+        ks.write("""part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path usr
+part /usr --source rootfs --ondisk mmcblk0 --fstype=ext4 --rootfs-dir %s/usr
+part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --rootfs-dir %s/usr"""
+                 % (rootfs_dir, rootfs_dir))
+        ks.close()
+        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
+                                   % wks_file).status)
+
+        os.remove(wks_file)
+        wicout = glob(self.resultdir + "%s-*direct" % 'temp')
+        self.assertEqual(1, len(wicout))
+
+        wicimg = wicout[0]
+
+        # verify partition size with wic
+        res = runCmd("parted -m %s unit b p 2>/dev/null" % wicimg)
+        self.assertEqual(0, res.status)
+
+        # parse parted output which looks like this:
+        # BYT;\n
+        # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
+        # 1:0.00MiB:200MiB:200MiB:ext4::;\n
+        partlns = res.output.splitlines()[2:]
+
+        self.assertEqual(3, len(partlns))
+
+        for part in [1, 2, 3]:
+            part_file = os.path.join(self.resultdir, "selftest_img.part%d" % part)
+            partln = partlns[part-1].split(":")
+            self.assertEqual(7, len(partln))
+            start = int(partln[1].rstrip("B")) / 512
+            length = int(partln[3].rstrip("B")) / 512
+            self.assertEqual(0, runCmd("dd if=%s of=%s skip=%d count=%d" %
+                                       (wicimg, part_file, start, length)).status)
+
+        # Test partition 1, should contain the normal root directories, except
+        # /usr.
+        res = runCmd("e2ls %s" % os.path.join(self.resultdir, "selftest_img.part1"))
+        self.assertEqual(0, res.status)
+        files = res.output.split()
+        self.assertIn("etc", files)
+        self.assertNotIn("usr", files)
+
+        # Partition 2, should contain common directories for /usr, not root
+        # directories.
+        res = runCmd("e2ls %s" % os.path.join(self.resultdir, "selftest_img.part2"))
+        self.assertEqual(0, res.status)
+        files = res.output.split()
+        self.assertNotIn("etc", files)
+        self.assertNotIn("usr", files)
+        self.assertIn("share", files)
+
+        # Partition 3, should contain the same as partition 2, including the bin
+        # directory, but not the files inside it.
+        res = runCmd("e2ls %s" % os.path.join(self.resultdir, "selftest_img.part3"))
+        self.assertEqual(0, res.status)
+        files = res.output.split()
+        self.assertNotIn("etc", files)
+        self.assertNotIn("usr", files)
+        self.assertIn("share", files)
+        self.assertIn("bin", files)
+        res = runCmd("e2ls %s:bin" % os.path.join(self.resultdir, "selftest_img.part3"))
+        self.assertEqual(0, res.status)
+        self.assertEqual("No files found!", res.output.strip())
+
+        for part in [1, 2, 3]:
+            part_file = os.path.join(self.resultdir, "selftest_img.part%d" % part)
+            os.remove(part_file)
+
+        os.environ['PATH'] = old_path
+
+    def test_exclude_path_errors(self):
+        """Test --exclude-path wks option error handling."""
+        wks_file = 'temp.wks'
+
+        rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
+
+        # Absolute argument.
+        ks = open(wks_file, 'w')
+        ks.write("part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path /usr")
+        ks.close()
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal" \
+                                      % wks_file, ignore_status=True).status)
+        os.remove(wks_file)
+
+        # Argument pointing to parent directory.
+        ks = open(wks_file, 'w')
+        ks.write("part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path ././..")
+        ks.close()
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal" \
+                                      % wks_file, ignore_status=True).status)
+        os.remove(wks_file)
-- 
2.7.4


