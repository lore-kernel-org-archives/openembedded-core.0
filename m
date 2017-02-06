Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 437CD71993
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 16:17:10 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id x1so47579337lff.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 08:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Rt1snN9R2RTrvnnuMK6e/wcjOYdqnSQXvG9ugrUhM6I=;
	b=mJzU8BnPjuqjVWtKlBmLia25GAoqP5GWQF7YgJOkWCHBsvJQdBONKnKEmy5Z9b7kqn
	dbjYImtmIIBnVdpXPgi/Z5OXR0wv9D5PtXjiAjZwlm4G4a07vW8FmOEpewINVXmP9/6z
	srMt1MYgPkV4ddHo+9xREUaDyVbNmGYE6OgPKz4r+2bTYCtRRW6099LP1dBAGQDa4Kv7
	P/YP6nej8I9T6vtZF5U1GNlbsW0ullrusfmVikz/l4UchTAzIQhG7765ao94/NBj+1tb
	b5lBFkc5KdyAMjO3sdT1zyC0BCXUi5+UhdZiOmrJ48RU5Undgvh0se1OkUz8sFfQR+AL
	NPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Rt1snN9R2RTrvnnuMK6e/wcjOYdqnSQXvG9ugrUhM6I=;
	b=g7/jmO3bEf3F5iX0vX5GKozTL/iGNoiIuG6eHlDNyqr9hTxAgaODFVlRK2swnKc/zL
	7DKGd/UW5RB/SYpQ3WXbVUQaSnxUDe+LQ0MhgEHseIamRX+fGCc6HBbvFrYtoiW9x9p2
	3E9/xMq2LuDiO5oGtIbOA9N1kekk/QvpmOTw9iIEVXmw47vLXZtEKdxmtYhZfjcYKKwS
	55LMX8EdfDm55mfQFQuuK/z5x6MKFdMwGrSqbojWIcJ5CPal7N68FLI3aSVU//9XPNEu
	VSLgyvcMzqduYuqc3V8/AwZG4kh4XbvyYUCJmueTVN3IAZDypGJQH0BFJ3J4ptB6TT/q
	m9Yg==
X-Gm-Message-State: AIkVDXJaJPRceKFNAN0QjSllWX8gJoG1q53SrFtAWgd0DEHPYcFACNAgEWUxUtTPBPEVPQ==
X-Received: by 10.25.196.210 with SMTP id u201mr4057812lff.69.1486397830865;
	Mon, 06 Feb 2017 08:17:10 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	a138sm429619lfb.2.2017.02.06.08.17.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Feb 2017 08:17:09 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Date: Mon,  6 Feb 2017 17:16:47 +0100
Message-Id: <1486397807-11699-3-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486397807-11699-1-git-send-email-kristian.amlie@mender.io>
References: <f181ed99-ed09-59d9-96a8-cf5d77a179d7@mender.io>
	<1486397807-11699-1-git-send-email-kristian.amlie@mender.io>
Subject: [PATCH 2/2] selftest/wic: Add tests for --exclude-dir option.
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
X-List-Received-Date: Mon, 06 Feb 2017 16:17:11 -0000

Based partially on an earlier patch by Maciej Borzecki.

Note that because tools now reside in recipe specific sysroots, we
need to import the path from bitbake and apply it during the test.

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 meta/lib/oeqa/selftest/wic.py | 104 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 417ba3d..0144d77 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -339,6 +339,110 @@ class Wic(oeSelfTest):
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "%(wks)s-*.direct" % bbvars)))
 
+    def test_exclude_path(self):
+        """Test --exclude-path wks option."""
+
+        oldpath = os.environ['PATH']
+        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
+
+        try:
+            wks_file = 'temp.wks'
+            with open(wks_file, 'w') as wks:
+                rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
+                wks.write("""part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path usr
+part /usr --source rootfs --ondisk mmcblk0 --fstype=ext4 --rootfs-dir %s/usr
+part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --rootfs-dir %s/usr"""
+                          % (rootfs_dir, rootfs_dir))
+            self.assertEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+                                       % (wks_file, self.resultdir)).status)
+
+            os.remove(wks_file)
+            wicout = glob(self.resultdir + "%s-*direct" % 'temp')
+            self.assertEqual(1, len(wicout))
+
+            wicimg = wicout[0]
+
+            # verify partition size with wic
+            res = runCmd("parted -m %s unit b p 2>/dev/null" % wicimg)
+            self.assertEqual(0, res.status)
+
+            # parse parted output which looks like this:
+            # BYT;\n
+            # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
+            # 1:0.00MiB:200MiB:200MiB:ext4::;\n
+            partlns = res.output.splitlines()[2:]
+
+            self.assertEqual(3, len(partlns))
+
+            for part in [1, 2, 3]:
+                part_file = os.path.join(self.resultdir, "selftest_img.part%d" % part)
+                partln = partlns[part-1].split(":")
+                self.assertEqual(7, len(partln))
+                start = int(partln[1].rstrip("B")) / 512
+                length = int(partln[3].rstrip("B")) / 512
+                self.assertEqual(0, runCmd("dd if=%s of=%s skip=%d count=%d" %
+                                           (wicimg, part_file, start, length)).status)
+
+            # Test partition 1, should contain the normal root directories, except
+            # /usr.
+            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part1"))
+            self.assertEqual(0, res.status)
+            files = [line.split('/')[5] for line in res.output.split('\n')]
+            self.assertIn("etc", files)
+            self.assertNotIn("usr", files)
+
+            # Partition 2, should contain common directories for /usr, not root
+            # directories.
+            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part2"))
+            self.assertEqual(0, res.status)
+            files = [line.split('/')[5] for line in res.output.split('\n')]
+            self.assertNotIn("etc", files)
+            self.assertNotIn("usr", files)
+            self.assertIn("share", files)
+
+            # Partition 3, should contain the same as partition 2, including the bin
+            # directory, but not the files inside it.
+            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part3"))
+            self.assertEqual(0, res.status)
+            files = [line.split('/')[5] for line in res.output.split('\n')]
+            self.assertNotIn("etc", files)
+            self.assertNotIn("usr", files)
+            self.assertIn("share", files)
+            self.assertIn("bin", files)
+            res = runCmd("debugfs -R 'ls -p bin' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part3"))
+            self.assertEqual(0, res.status)
+            files = [line.split('/')[5] for line in res.output.split('\n')]
+            self.assertIn(".", files)
+            self.assertIn("..", files)
+            self.assertEqual(2, len(files))
+
+            for part in [1, 2, 3]:
+                part_file = os.path.join(self.resultdir, "selftest_img.part%d" % part)
+                os.remove(part_file)
+
+        finally:
+            os.environ['PATH'] = oldpath
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
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        os.remove(wks_file)
+
+        # Argument pointing to parent directory.
+        with open(wks_file, 'w') as wks:
+            wks.write("part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path ././..")
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        os.remove(wks_file)
+
     @testcase(1496)
     def test_bmap_short(self):
         """Test generation of .bmap file -m option"""
-- 
2.7.4


