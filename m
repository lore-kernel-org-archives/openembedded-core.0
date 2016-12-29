Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4275265CC2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 10:05:48 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id b14so218444509lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 02:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9tvjLr3FrdNyk7g58I8vtrF5DG/gRYjxVbrUU+13Hf4=;
	b=gpiswhkebJFFiwlp4c5eQlwUKXMEYlya54wzDLaYrrgffquGYXL3SJvTALJ41eVqRF
	6UtEzNalE79Nw7rwvpfSQ9dzr/9d2HPIBGTZSdDilk6LncWb40Lc6VQqE86j6kZhrY/W
	hpe56se7AcJYj4CHG6J9U/S5PLtKHcICBkM+twwiI+Xo5MJlwhOxzszYV6Z2qtHLjtiY
	FpBspDKoGrWCcSD5ywDLN+wVB6u8SP8CGxL35v4Zl+IJ5tAWeLeW1hwKbDSVjm8dLZVh
	2+FcmzTZfzwKWZX/Kew8tkbumijwBkPf5XACVLz0h0aO+1ft2kMhVzlqzXLXRHWgp54s
	njYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9tvjLr3FrdNyk7g58I8vtrF5DG/gRYjxVbrUU+13Hf4=;
	b=mHYfXnMeuC5+WyjoXmDtrM6BXbQt6apaOK/Sis8g4a1OYd47JajPmr4BIOHo+yp9MW
	XjIOTOLqK1mCOnBk3XL4NjswbYivZmV4T6AyHZblf0dOmdbWSIXIXQ0GBUWJQloF9eGP
	7ORpD7WWmVvXtUVGEzZR21MXGqRn9JkoiAsJrG4cf8DRWFv6rmsNcgfqXlJe5Q6lnWdN
	8IaNDl7IbdiVfx5rAlmrqJck//qqDSXEdPkahLZPCfBAVhsfPznBwmhM0CV+Prk1p9ev
	5ycSBvBLxSc2OVsriUOnI678nL1TmOW4pyAxtvGEr99IfCc/ureY3ypeu5qH+WibVKa+
	mwsQ==
X-Gm-Message-State: AIkVDXJkBbK3NkDJ07X9GU41uOl31Twk/oemKcHK2qloR1FOCIRKVSOSp2lyKplusq3mGw==
X-Received: by 10.25.211.134 with SMTP id k128mr15040050lfg.118.1483005949698; 
	Thu, 29 Dec 2016 02:05:49 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	c25sm12913685ljb.32.2016.12.29.02.05.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Dec 2016 02:05:48 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Dec 2016 11:05:29 +0100
Message-Id: <1483005929-8231-3-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1483005929-8231-1-git-send-email-kristian.amlie@mender.io>
References: <CAJTo0LZ4S6FWzR6u2Kek_KjcXD48qTWbVLn5Vm2j20fJtyts9A@mail.gmail.com>
	<1483005929-8231-1-git-send-email-kristian.amlie@mender.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: [PATCH v4 2/2] selftest/wic: Add tests for --exclude-dir option.
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
X-List-Received-Date: Thu, 29 Dec 2016 10:05:49 -0000

Based partially on an earlier patch by Maciej Borzecki.

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 meta/lib/oeqa/selftest/wic.py | 97 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index faac11e..9afa696 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -299,3 +299,100 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
                                    % image).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
+
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
-- 
2.7.4


