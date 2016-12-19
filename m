Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD0A71B87
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 09:09:38 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id b14so49463635lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 01:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FIrXDfqplOq5ZG0969m9rwsDc3gxNOwrph5VSGIFZJo=;
	b=VkLT9shAenodyzDBBnSqeuTBtJF72YIW70EC2XgZMMuzBjwSKL2ORdBS0k4SBoWnVN
	kWqUGpoLBmN/x/HmFcKkxgBPSL6fnsWLN2N48H0fEqkSexctrYQB45UaICHUNcCfZNY9
	fjdLNEIKo249pkhsZGj73L6HuSM7qEQcbcjMEZTryontkqXrdqvCzBLOgkalooIS1upE
	oOWx8Uf41jBJ7BqRtWmMtojizQchfb11/JnEqtDUZi2/hS2p/BqoXtb8S7haUxfrIC1G
	GiYQiY+kCVbRcdgGtezihB7kzP/dVb9MTkgIVboG6qwxRebkw7tJLQUd/8dLZAh6WyNl
	eBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FIrXDfqplOq5ZG0969m9rwsDc3gxNOwrph5VSGIFZJo=;
	b=srjv6rW03AGf5gAz2ezpTzuLKAT8DzQGSSypROrRBFqAFPWdrsgQPnd4dPWWE+8FHI
	AabcmVZq5PC57/w9//m0jF8uRVrveFfHvrdnBkRYzznOWUPpGAwjhfuV2JP/PFABRmMW
	KK0Wr1SbhstFUkzP/AKf5mk3R935GsE1+/Vh5BAba06KSmxnudzYWwIwa+EMo/RpyzGA
	BxllgxhPzyJMhr2njtq4weiFgJ1rnkWeOcT54T2kH3k8I/ZKQq2opxHZ3zz2FunvGWBI
	+4fdR7ycMLKbxBWBm31oKLlMaD7JBl7JYTOQaxAHYCQ0R92Oq2ESmLGtFOXPdrO2eQT9
	mb6Q==
X-Gm-Message-State: AKaTC01LIr+wGMIDomO9FgK2e49SmmzMla2SryvlmTKVx1z8giEXieUMvn6rahZXDc1n9w==
X-Received: by 10.25.130.149 with SMTP id e143mr4960806lfd.87.1482138579618;
	Mon, 19 Dec 2016 01:09:39 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	18sm3629494ljj.7.2016.12.19.01.09.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Dec 2016 01:09:38 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Mon, 19 Dec 2016 10:09:25 +0100
Message-Id: <1482138565-4120-4-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1482138565-4120-1-git-send-email-kristian.amlie@mender.io>
References: <20161216144423.GB6398@linux.intel.com>
	<1482138565-4120-1-git-send-email-kristian.amlie@mender.io>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 3/3] selftest/wic: Add tests for --exclude-dir option.
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
X-List-Received-Date: Mon, 19 Dec 2016 09:09:39 -0000

Based partially on an earlier patch by Maciej Borzecki.

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 meta/lib/oeqa/selftest/wic.py | 103 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 102 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index faac11e..09f475c 100644
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
 
@@ -299,3 +300,103 @@ class Wic(oeSelfTest):
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
-- 
2.7.4


