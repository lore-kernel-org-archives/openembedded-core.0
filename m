Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 684CB6E5FB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 14:04:02 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id c13so221805415lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 06:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UbC2hX+CxG9cL61X6TriS0VYNK34s+BwUkr4KUvWRv8=;
	b=kyOv3nk+DZ0SzKQfT7yxGcFdCl3lRhOqqaJqmCfX58ZIQs8k4YL7Rc1pKlbc1BV4na
	5eE1XS4Ht3KWGS+Zvxi5t5ykPptC7nhumVq2lO4ZQbFwz1JrsDILKvtsHVmNzI/2nrPL
	bRz0pvTX5OmrJytYXMmqGCVTDTDcW1wEKRep16Z1+a2Ubde7O52n/Mr7OKYs6P+0/GnW
	FgqxejtRRdyLXSmBESCawD4q9i8olIQrxPGeqKlGxDvvF+E7OrssHJdNd4PC6EgcCN3h
	S2AsJBvsKzRY84ODisRCG+wsZfBnAeeT7m4jyguJHXifHx4uY/pRcnvMV1nHals5dU/c
	X/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UbC2hX+CxG9cL61X6TriS0VYNK34s+BwUkr4KUvWRv8=;
	b=UW2umAY34I7JmxlsI65h5zibXG8rlQcAFqBBaZad4tOTqrsv5Q1utEj8vqVfN1kalE
	1gzk/Bong6JOi9EuKMfCPe0NIMBQC5aPolR77WWMH7D0XEUFAdKjYtLeJOfac8FWDPzA
	1N/7/Xq6qQfstF4AYEQtFgJSNeO4iGMxd2Z1CLdIMFvKgLcBFfiSvj/NPcfJcSmOeahc
	Py3vhlr4frRkz9bLrGdfG7NipOK9177MLeSb3l1Hy4GvCFUb7prnm1OSiwjyTx7HEfWs
	BKWrMosbeEHOH/BC3JmjgncAYAFc3v0a9mq7gfabu8PoZfww1T3ibjk8adGfPv9WcmEV
	koGA==
X-Gm-Message-State: AIkVDXIvgVMRpkfR1+KugjO9Imu313pLA1Gqd/MkBiokM6QCLiDXq0sAT01RTr5TzSjt3Q==
X-Received: by 10.25.216.35 with SMTP id p35mr11693696lfg.16.1483020243028;
	Thu, 29 Dec 2016 06:04:03 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	y131sm12961910lfd.36.2016.12.29.06.04.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Dec 2016 06:04:01 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Dec 2016 15:03:48 +0100
Message-Id: <1483020228-1267-3-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1483020228-1267-1-git-send-email-kristian.amlie@mender.io>
References: <b7a30224-1198-ac92-7f70-708196ca7814@mender.io>
	<1483020228-1267-1-git-send-email-kristian.amlie@mender.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: [PATCH v5 2/2] selftest/wic: Add tests for --exclude-dir option.
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
X-List-Received-Date: Thu, 29 Dec 2016 14:04:02 -0000

Based partially on an earlier patch by Maciej Borzecki.

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 meta/lib/oeqa/selftest/wic.py | 97 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 3db00a6..cfe7d30 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -322,6 +322,103 @@ class Wic(oeSelfTest):
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "%(wks)s-*.direct" % bbvars)))
 
+    def test_exclude_path(self):
+        """Test --exclude-path wks option."""
+
+        wks_file = 'temp.wks'
+        with open(wks_file, 'w') as wks:
+            rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
+            wks.write("""part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path usr
+part /usr --source rootfs --ondisk mmcblk0 --fstype=ext4 --rootfs-dir %s/usr
+part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --rootfs-dir %s/usr"""
+                      % (rootfs_dir, rootfs_dir))
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
+        res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part1"))
+        self.assertEqual(0, res.status)
+        files = [line.split('/')[5] for line in res.output.split('\n')]
+        self.assertIn("etc", files)
+        self.assertNotIn("usr", files)
+
+        # Partition 2, should contain common directories for /usr, not root
+        # directories.
+        res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part2"))
+        self.assertEqual(0, res.status)
+        files = [line.split('/')[5] for line in res.output.split('\n')]
+        self.assertNotIn("etc", files)
+        self.assertNotIn("usr", files)
+        self.assertIn("share", files)
+
+        # Partition 3, should contain the same as partition 2, including the bin
+        # directory, but not the files inside it.
+        res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part3"))
+        self.assertEqual(0, res.status)
+        files = [line.split('/')[5] for line in res.output.split('\n')]
+        self.assertNotIn("etc", files)
+        self.assertNotIn("usr", files)
+        self.assertIn("share", files)
+        self.assertIn("bin", files)
+        res = runCmd("debugfs -R 'ls -p bin' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part3"))
+        self.assertEqual(0, res.status)
+        files = [line.split('/')[5] for line in res.output.split('\n')]
+        self.assertIn(".", files)
+        self.assertIn("..", files)
+        self.assertEqual(2, len(files))
+
+        for part in [1, 2, 3]:
+            part_file = os.path.join(self.resultdir, "selftest_img.part%d" % part)
+            os.remove(part_file)
+
+    def test_exclude_path_errors(self):
+        """Test --exclude-path wks option error handling."""
+        wks_file = 'temp.wks'
+
+        rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
+
+        # Absolute argument.
+        with open(wks_file, 'w') as wks:
+            wks.write("part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path /usr")
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal" \
+                                      % wks_file, ignore_status=True).status)
+        os.remove(wks_file)
+
+        # Argument pointing to parent directory.
+        with open(wks_file, 'w') as wks:
+            wks.write("part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path ././..")
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal" \
+                                      % wks_file, ignore_status=True).status)
+        os.remove(wks_file)
+
     @testcase(1496)
     def test_bmap(self):
         """Test generation of .bmap file"""
-- 
2.7.4


