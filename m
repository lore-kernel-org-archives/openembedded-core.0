Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B04C53215
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 09:02:18 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15482.1784883728488883398
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 02:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m4EEZ0C2;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51a868b6962so2008141cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 02:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784883727; x=1785488527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nxAjd064ZT0ayJvCvjMKgKjnVulBRppXkg1XREnxjv4=;
        b=m4EEZ0C24TRW6wlvqBvmeN5yDvNwZO0OdKJyY4nDicV1b/rCvOT4e0aVSEaVdEfjg9
         kBVg3wmg1CY+2ZbZg6yusQbxmK+Lh2Fh4zR9V+o8HpxDzKWh1pclLk2CqX3Meo0fAAJi
         YJnl/3NwWRpW+DWMHQagCYB0tQHq+NUGX7Qx+XkFAibenq9DmE3jencNa1klKQd6J/42
         qNRQZK7n8jNj2gz8g+ttgkx97dRq5Hk/fb7pLh+i8C8sCnU6M2mu8thbcPyonrbr4ihb
         xKotw1EeW/C6WnibYJjv3d3B6lWO1N/kar4SKyUDtBqRBxCMC9hBwXqaZvLms3j1yKNc
         p35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883727; x=1785488527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nxAjd064ZT0ayJvCvjMKgKjnVulBRppXkg1XREnxjv4=;
        b=iuID9c4fhH10hl0GZpjdkX0gBpN/h69ZfQ23zSE1Czb+F3l/270qrXh4LQm6oUMpTS
         dXPKgsrx0qSmCnOFMtSbb1IUKw6IzhrZNAVXzKM6UYCtGzqhoakxCu/aOLkWUJXPWwME
         f3Ps68cS4XReMbRJCtQTL/g49ll6BSVIjGT8wAe/HggjfppSzKr+IdXkr0+iYsZj8hsu
         pV/yptGJfpmZM8XZc4P1ndSzebwC+UhTt+WG/UKtyfue2z0Fn9Ys7ebxbKLOb2lJe38v
         S0ZUJ3DRAkLE9F083tp8JlmFKp9cPOFvlLTmLMIrnJHIT0qFFM68Qxe5snl5dDm6Fduj
         qO+A==
X-Gm-Message-State: AOJu0YzQqHJbakei6sE/Fm8YwApexC7UcMx0Q/h+c7DevevpJOd9K532
	urjGbtNtz5BxrvlHfSsMdoR2/3Nzd6Q2CnBhKCuxvq221GOKH+gBcxw+/i1pdA==
X-Gm-Gg: AR+sD12iuoDMKJ7MtAXzQdt0j5jgMW4eicZ99tR2dtsKKxudALOrDEyLd0QTn3sQ4Yk
	eoYl0Mv9COXCIJ5tMOhPEjJzsedvb/x2LxB8mT3nFzB17XqYlnFuNzQKL0zW4qUx+7P/bZrZqPR
	QGr/Pzo13lQzCD8gTkrJwl52+KTupdfJ6TvJGw9nrb+oAnH4GBu1kcKeAps9a4sHjSdVi2jPhLd
	zdzSfptJZQJpdwIsSD1LmTS+iUArXDQb753K8hED2lYf2fRM/NrBBGZTzDrAq6sKOvUQz74WDyF
	CRj3BlNDdXlU6NUuO54Oms6fjVwKswFRMk6xnanWIeYW1mRY83nl4Un7ZImxqQ1FNCbHXck/Wdj
	KUkpRNpQIyWrAl1C9P7fjb2qigVn2qNNSJVdUDWwi5G0KDxeWvbBe1LUFc9UK4SjhpADxCRG97V
	5zb+BlOqP7cqEdR92wBjrAFnxsDK06nYIF7Jg/7TA/jMsjFEkJ36bVJhI=
X-Received: by 2002:a05:622a:5145:b0:51b:60f1:689a with SMTP id d75a77b69052e-5283dda399amr18565351cf.7.1784883726394;
        Fri, 24 Jul 2026 02:02:06 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27cf1sm63968326d6.46.2026.07.24.02.02.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:02:05 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 04/10] oeqa/selftest/wic: drop redundant per-test PATH overrides
Date: Fri, 24 Jul 2026 05:01:40 -0400
Message-ID: <20260724090146.19924-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260724090146.19924-1-twoerner@gmail.com>
References: <20260724090146.19924-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241914

setUpLocal() already puts wic and its tools on PATH for every test: it
sets os.environ['PATH'] to the wic binary's directory followed by the
whole wic-tools native-sysroot PATH, and tearDownLocal() restores the
original. A number of individual tests then re-set

    os.environ['PATH'] = get_bb_var("PATH", "wic-tools")

inside a try/finally, which is a narrower subset of what setUpLocal
already established (it drops the wic bindir prepend and the original
PATH tail) and adds nothing: wic and every tool it runs are reachable
from the PATH setUpLocal installs.

Remove these per-test overrides and their try/finally wrappers. The
tests keep passing the explicit --native-sysroot / RECIPE_SYSROOT_NATIVE
that some of them build, which is a separate concern from PATH.

The diff looks large and noisy, but the change is mechanical: dropping
each try/finally means the whole test body dedents by one level, so
almost every line in the affected tests shows up as removed-and-re-added
with different leading whitespace. The test logic is otherwise
unchanged; reviewing with a whitespace-insensitive diff (git show -w)
shows only the removed override, try: and finally: lines.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v4:
- new in v4
---
 meta/lib/oeqa/selftest/cases/wic.py | 792 +++++++++++++---------------
 1 file changed, 362 insertions(+), 430 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 6a2706fc2c8f..37673392c271 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -536,104 +536,97 @@ class Wic(WicTestCase):
     def test_exclude_path(self):
         """Test --exclude-path wks option."""
 
-        oldpath = os.environ['PATH']
-        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
-
-        try:
-            wks_file = 'temp.wks'
-            with open(wks_file, 'w') as wks:
-                rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
-                wks.write("""
+        wks_file = 'temp.wks'
+        with open(wks_file, 'w') as wks:
+            rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
+            wks.write("""
 part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path usr
 part /usr --source rootfs --ondisk mmcblk0 --fstype=ext4 --rootfs-dir %s/usr
 part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --rootfs-dir %s/usr
 part /mnt --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/whoami --rootfs-dir %s/usr"""
-                          % (rootfs_dir, rootfs_dir, rootfs_dir))
-            runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
-
-            os.remove(wks_file)
-            wicout = glob(os.path.join(self.resultdir, "%s-*direct" % 'temp'))
-            self.assertEqual(1, len(wicout))
+                      % (rootfs_dir, rootfs_dir, rootfs_dir))
+        runCmd("wic create %s -e core-image-minimal -o %s" \
+                                   % (wks_file, self.resultdir))
 
-            wicimg = wicout[0]
-
-            # verify partition size with wic
-            res = runCmd("parted -m %s unit b p" % wicimg, stderr=subprocess.PIPE)
-
-            # parse parted output which looks like this:
-            # BYT;\n
-            # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
-            # 1:0.00MiB:200MiB:200MiB:ext4::;\n
-            partlns = res.output.splitlines()[2:]
+        os.remove(wks_file)
+        wicout = glob(os.path.join(self.resultdir, "%s-*direct" % 'temp'))
+        self.assertEqual(1, len(wicout))
 
-            self.assertEqual(4, len(partlns))
+        wicimg = wicout[0]
 
-            for part in [1, 2, 3, 4]:
-                part_file = os.path.join(self.resultdir, "selftest_img.part%d" % part)
-                partln = partlns[part-1].split(":")
-                self.assertEqual(7, len(partln))
-                start = int(partln[1].rstrip("B")) / 512
-                length = int(partln[3].rstrip("B")) / 512
-                runCmd("dd if=%s of=%s skip=%d count=%d" %
-                                           (wicimg, part_file, start, length))
-
-            # Test partition 1, should contain the normal root directories, except
-            # /usr.
-            res = runCmd("debugfs -R 'ls -p' %s" % \
-                             os.path.join(self.resultdir, "selftest_img.part1"), stderr=subprocess.PIPE)
-            files = extract_files(res.output)
-            self.assertIn("etc", files)
-            self.assertNotIn("usr", files)
-
-            # Partition 2, should contain common directories for /usr, not root
-            # directories.
-            res = runCmd("debugfs -R 'ls -p' %s" % \
-                             os.path.join(self.resultdir, "selftest_img.part2"), stderr=subprocess.PIPE)
-            files = extract_files(res.output)
-            self.assertNotIn("etc", files)
-            self.assertNotIn("usr", files)
-            self.assertIn("share", files)
-
-            # Partition 3, should contain the same as partition 2, including the bin
-            # directory, but not the files inside it.
-            res = runCmd("debugfs -R 'ls -p' %s" % \
-                             os.path.join(self.resultdir, "selftest_img.part3"), stderr=subprocess.PIPE)
-            files = extract_files(res.output)
-            self.assertNotIn("etc", files)
-            self.assertNotIn("usr", files)
-            self.assertIn("share", files)
-            self.assertIn("bin", files)
-            res = runCmd("debugfs -R 'ls -p bin' %s" % \
-                             os.path.join(self.resultdir, "selftest_img.part3"), stderr=subprocess.PIPE)
-            files = extract_files(res.output)
-            self.assertIn(".", files)
-            self.assertIn("..", files)
-            self.assertEqual(2, len(files))
-
-            # Partition 4, should contain the same as partition 2, including the bin
-            # directory, but not whoami (a symlink to busybox.nosuid) inside it.
-            res = runCmd("debugfs -R 'ls -p' %s" % \
-                             os.path.join(self.resultdir, "selftest_img.part4"), stderr=subprocess.PIPE)
-            files = extract_files(res.output)
-            self.assertNotIn("etc", files)
-            self.assertNotIn("usr", files)
-            self.assertIn("share", files)
-            self.assertIn("bin", files)
-            res = runCmd("debugfs -R 'ls -p bin' %s" % \
-                             os.path.join(self.resultdir, "selftest_img.part4"), stderr=subprocess.PIPE)
-            files = extract_files(res.output)
-            self.assertIn(".", files)
-            self.assertIn("..", files)
-            self.assertIn("who", files)
-            self.assertNotIn("whoami", files)
-
-            for part in [1, 2, 3, 4]:
-                part_file = os.path.join(self.resultdir, "selftest_img.part%d" % part)
-                os.remove(part_file)
+        # verify partition size with wic
+        res = runCmd("parted -m %s unit b p" % wicimg, stderr=subprocess.PIPE)
 
-        finally:
-            os.environ['PATH'] = oldpath
+        # parse parted output which looks like this:
+        # BYT;\n
+        # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
+        # 1:0.00MiB:200MiB:200MiB:ext4::;\n
+        partlns = res.output.splitlines()[2:]
+
+        self.assertEqual(4, len(partlns))
+
+        for part in [1, 2, 3, 4]:
+            part_file = os.path.join(self.resultdir, "selftest_img.part%d" % part)
+            partln = partlns[part-1].split(":")
+            self.assertEqual(7, len(partln))
+            start = int(partln[1].rstrip("B")) / 512
+            length = int(partln[3].rstrip("B")) / 512
+            runCmd("dd if=%s of=%s skip=%d count=%d" %
+                                       (wicimg, part_file, start, length))
+
+        # Test partition 1, should contain the normal root directories, except
+        # /usr.
+        res = runCmd("debugfs -R 'ls -p' %s" % \
+                         os.path.join(self.resultdir, "selftest_img.part1"), stderr=subprocess.PIPE)
+        files = extract_files(res.output)
+        self.assertIn("etc", files)
+        self.assertNotIn("usr", files)
+
+        # Partition 2, should contain common directories for /usr, not root
+        # directories.
+        res = runCmd("debugfs -R 'ls -p' %s" % \
+                         os.path.join(self.resultdir, "selftest_img.part2"), stderr=subprocess.PIPE)
+        files = extract_files(res.output)
+        self.assertNotIn("etc", files)
+        self.assertNotIn("usr", files)
+        self.assertIn("share", files)
+
+        # Partition 3, should contain the same as partition 2, including the bin
+        # directory, but not the files inside it.
+        res = runCmd("debugfs -R 'ls -p' %s" % \
+                         os.path.join(self.resultdir, "selftest_img.part3"), stderr=subprocess.PIPE)
+        files = extract_files(res.output)
+        self.assertNotIn("etc", files)
+        self.assertNotIn("usr", files)
+        self.assertIn("share", files)
+        self.assertIn("bin", files)
+        res = runCmd("debugfs -R 'ls -p bin' %s" % \
+                         os.path.join(self.resultdir, "selftest_img.part3"), stderr=subprocess.PIPE)
+        files = extract_files(res.output)
+        self.assertIn(".", files)
+        self.assertIn("..", files)
+        self.assertEqual(2, len(files))
+
+        # Partition 4, should contain the same as partition 2, including the bin
+        # directory, but not whoami (a symlink to busybox.nosuid) inside it.
+        res = runCmd("debugfs -R 'ls -p' %s" % \
+                         os.path.join(self.resultdir, "selftest_img.part4"), stderr=subprocess.PIPE)
+        files = extract_files(res.output)
+        self.assertNotIn("etc", files)
+        self.assertNotIn("usr", files)
+        self.assertIn("share", files)
+        self.assertIn("bin", files)
+        res = runCmd("debugfs -R 'ls -p bin' %s" % \
+                         os.path.join(self.resultdir, "selftest_img.part4"), stderr=subprocess.PIPE)
+        files = extract_files(res.output)
+        self.assertIn(".", files)
+        self.assertIn("..", files)
+        self.assertIn("who", files)
+        self.assertNotIn("whoami", files)
+
+        for part in [1, 2, 3, 4]:
+            part_file = os.path.join(self.resultdir, "selftest_img.part%d" % part)
+            os.remove(part_file)
 
     def test_exclude_path_with_extra_space(self):
         """Test having --exclude-path with IMAGE_ROOTFS_EXTRA_SPACE. [Yocto #15555]"""
@@ -672,75 +665,61 @@ part /mnt --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/whoa
     def test_include_path(self):
         """Test --include-path wks option."""
 
-        oldpath = os.environ['PATH']
-        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
-
-        try:
-            include_path = os.path.join(self.resultdir, 'test-include')
-            os.makedirs(include_path)
-            with open(os.path.join(include_path, 'test-file'), 'w') as t:
-                t.write("test\n")
-            wks_file = os.path.join(include_path, 'temp.wks')
-            with open(wks_file, 'w') as wks:
-                rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
-                wks.write("""
+        include_path = os.path.join(self.resultdir, 'test-include')
+        os.makedirs(include_path)
+        with open(os.path.join(include_path, 'test-file'), 'w') as t:
+            t.write("test\n")
+        wks_file = os.path.join(include_path, 'temp.wks')
+        with open(wks_file, 'w') as wks:
+            rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
+            wks.write("""
 part /part1 --source rootfs --ondisk mmcblk0 --fstype=ext4
 part /part2 --source rootfs --ondisk mmcblk0 --fstype=ext4 --include-path %s"""
-                          % (include_path))
-            runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
-
-            part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
-            part2 = glob(os.path.join(self.resultdir, 'temp-*.direct.p2'))[0]
+                      % (include_path))
+        runCmd("wic create %s -e core-image-minimal -o %s" \
+                                   % (wks_file, self.resultdir))
 
-            # Test partition 1, should not contain 'test-file'
-            res = runCmd("debugfs -R 'ls -p' %s" % (part1), stderr=subprocess.PIPE)
-            files = extract_files(res.output)
-            self.assertNotIn('test-file', files)
-            self.assertEqual(True, files_own_by_root(res.output))
+        part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
+        part2 = glob(os.path.join(self.resultdir, 'temp-*.direct.p2'))[0]
 
-            # Test partition 2, should contain 'test-file'
-            res = runCmd("debugfs -R 'ls -p' %s" % (part2), stderr=subprocess.PIPE)
-            files = extract_files(res.output)
-            self.assertIn('test-file', files)
-            self.assertEqual(True, files_own_by_root(res.output))
+        # Test partition 1, should not contain 'test-file'
+        res = runCmd("debugfs -R 'ls -p' %s" % (part1), stderr=subprocess.PIPE)
+        files = extract_files(res.output)
+        self.assertNotIn('test-file', files)
+        self.assertEqual(True, files_own_by_root(res.output))
 
-        finally:
-            os.environ['PATH'] = oldpath
+        # Test partition 2, should contain 'test-file'
+        res = runCmd("debugfs -R 'ls -p' %s" % (part2), stderr=subprocess.PIPE)
+        files = extract_files(res.output)
+        self.assertIn('test-file', files)
+        self.assertEqual(True, files_own_by_root(res.output))
 
     def test_include_path_embeded(self):
         """Test --include-path wks option."""
 
-        oldpath = os.environ['PATH']
-        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
-
-        try:
-            include_path = os.path.join(self.resultdir, 'test-include')
-            os.makedirs(include_path)
-            with open(os.path.join(include_path, 'test-file'), 'w') as t:
-                t.write("test\n")
-            wks_file = os.path.join(include_path, 'temp.wks')
-            with open(wks_file, 'w') as wks:
-                wks.write("""
+        include_path = os.path.join(self.resultdir, 'test-include')
+        os.makedirs(include_path)
+        with open(os.path.join(include_path, 'test-file'), 'w') as t:
+            t.write("test\n")
+        wks_file = os.path.join(include_path, 'temp.wks')
+        with open(wks_file, 'w') as wks:
+            wks.write("""
 part / --source rootfs  --fstype=ext4 --include-path %s --include-path core-image-minimal-mtdutils export/"""
-                          % (include_path))
-            runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
-
-            part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
+                      % (include_path))
+        runCmd("wic create %s -e core-image-minimal -o %s" \
+                                   % (wks_file, self.resultdir))
 
-            res = runCmd("debugfs -R 'ls -p' %s" % (part1), stderr=subprocess.PIPE)
-            files = extract_files(res.output)
-            self.assertIn('test-file', files)
-            self.assertEqual(True, files_own_by_root(res.output))
+        part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
 
-            res = runCmd("debugfs -R 'ls -p /export/etc/' %s" % (part1), stderr=subprocess.PIPE)
-            files = extract_files(res.output)
-            self.assertIn('passwd', files)
-            self.assertEqual(True, files_own_by_root(res.output))
+        res = runCmd("debugfs -R 'ls -p' %s" % (part1), stderr=subprocess.PIPE)
+        files = extract_files(res.output)
+        self.assertIn('test-file', files)
+        self.assertEqual(True, files_own_by_root(res.output))
 
-        finally:
-            os.environ['PATH'] = oldpath
+        res = runCmd("debugfs -R 'ls -p /export/etc/' %s" % (part1), stderr=subprocess.PIPE)
+        files = extract_files(res.output)
+        self.assertIn('passwd', files)
+        self.assertEqual(True, files_own_by_root(res.output))
 
     def test_include_path_errors(self):
         """Test --include-path wks option error handling."""
@@ -791,9 +770,6 @@ part / --source rootfs  --fstype=ext4 --include-path %s --include-path core-imag
         # prepare wicenv and rootfs
         bitbake('core-image-minimal core-image-minimal-mtdutils -c do_rootfs_wicenv')
 
-        oldpath = os.environ['PATH']
-        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
-
         t_normal = """
 part / --source rootfs --fstype=ext4
 """
@@ -810,61 +786,50 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
 """
         tests = [t_normal, t_exclude, t_multi, t_change]
 
-        try:
-            for test in tests:
-                include_path = os.path.join(self.resultdir, 'test-include')
-                os.makedirs(include_path)
-                wks_file = os.path.join(include_path, 'temp.wks')
-                with open(wks_file, 'w') as wks:
-                    wks.write(test)
-                runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
-
-                for part in glob(os.path.join(self.resultdir, 'temp-*.direct.p*')):
-                    res = runCmd("debugfs -R 'ls -p' %s" % (part), stderr=subprocess.PIPE)
-                    self.assertEqual(True, files_own_by_root(res.output))
+        for test in tests:
+            include_path = os.path.join(self.resultdir, 'test-include')
+            os.makedirs(include_path)
+            wks_file = os.path.join(include_path, 'temp.wks')
+            with open(wks_file, 'w') as wks:
+                wks.write(test)
+            runCmd("wic create %s -e core-image-minimal -o %s" \
+                                   % (wks_file, self.resultdir))
 
-                config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "%s"\n' % wks_file
-                self.append_config(config)
-                bitbake('core-image-minimal')
-                tmpdir = os.path.join(get_bb_var('WORKDIR', 'core-image-minimal'),'build-wic')
+            for part in glob(os.path.join(self.resultdir, 'temp-*.direct.p*')):
+                res = runCmd("debugfs -R 'ls -p' %s" % (part), stderr=subprocess.PIPE)
+                self.assertEqual(True, files_own_by_root(res.output))
 
-                # check each partition for permission
-                for part in glob(os.path.join(tmpdir, 'temp-*.direct.p*')):
-                    res = runCmd("debugfs -R 'ls -p' %s" % (part), stderr=subprocess.PIPE)
-                    self.assertTrue(files_own_by_root(res.output)
-                        ,msg='Files permission incorrect using wks set "%s"' % test)
+            config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "%s"\n' % wks_file
+            self.append_config(config)
+            bitbake('core-image-minimal')
+            tmpdir = os.path.join(get_bb_var('WORKDIR', 'core-image-minimal'),'build-wic')
 
-                # clean config and result directory for next cases
-                self.remove_config(config)
-                rmtree(self.resultdir, ignore_errors=True)
+            # check each partition for permission
+            for part in glob(os.path.join(tmpdir, 'temp-*.direct.p*')):
+                res = runCmd("debugfs -R 'ls -p' %s" % (part), stderr=subprocess.PIPE)
+                self.assertTrue(files_own_by_root(res.output)
+                    ,msg='Files permission incorrect using wks set "%s"' % test)
 
-        finally:
-            os.environ['PATH'] = oldpath
+            # clean config and result directory for next cases
+            self.remove_config(config)
+            rmtree(self.resultdir, ignore_errors=True)
 
     def test_change_directory(self):
         """Test --change-directory wks option."""
 
-        oldpath = os.environ['PATH']
-        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
-
-        try:
-            include_path = os.path.join(self.resultdir, 'test-include')
-            os.makedirs(include_path)
-            wks_file = os.path.join(include_path, 'temp.wks')
-            with open(wks_file, 'w') as wks:
-                wks.write("part /etc --source rootfs --fstype=ext4 --change-directory=etc")
-            runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
-
-            part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
+        include_path = os.path.join(self.resultdir, 'test-include')
+        os.makedirs(include_path)
+        wks_file = os.path.join(include_path, 'temp.wks')
+        with open(wks_file, 'w') as wks:
+            wks.write("part /etc --source rootfs --fstype=ext4 --change-directory=etc")
+        runCmd("wic create %s -e core-image-minimal -o %s" \
+                                   % (wks_file, self.resultdir))
 
-            res = runCmd("debugfs -R 'ls -p' %s" % (part1), stderr=subprocess.PIPE)
-            files = extract_files(res.output)
-            self.assertIn('passwd', files)
+        part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
 
-        finally:
-            os.environ['PATH'] = oldpath
+        res = runCmd("debugfs -R 'ls -p' %s" % (part1), stderr=subprocess.PIPE)
+        files = extract_files(res.output)
+        self.assertIn('passwd', files)
 
     def test_change_directory_errors(self):
         """Test --change-directory wks option error handling."""
@@ -887,41 +852,34 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
     def test_no_fstab_update(self):
         """Test --no-fstab-update wks option."""
 
-        oldpath = os.environ['PATH']
-        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
-
         # Get stock fstab from base-files recipe
         bitbake('base-files -c do_install')
         bf_fstab = os.path.join(get_bb_var('D', 'base-files'), 'etc', 'fstab')
         self.assertEqual(True, os.path.exists(bf_fstab))
         bf_fstab_md5sum = runCmd('md5sum %s ' % bf_fstab).output.split(" ")[0]
 
-        try:
-            no_fstab_update_path = os.path.join(self.resultdir, 'test-no-fstab-update')
-            os.makedirs(no_fstab_update_path)
-            wks_file = os.path.join(no_fstab_update_path, 'temp.wks')
-            with open(wks_file, 'w') as wks:
-                wks.writelines(['part / --source rootfs --fstype=ext4 --label rootfs\n',
-                                'part /mnt/p2 --source rootfs --rootfs-dir=core-image-minimal ',
-                                '--fstype=ext4 --label p2 --no-fstab-update\n'])
-            runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
-
-            part_fstab_md5sum = []
-            for i in range(1, 3):
-                part = glob(os.path.join(self.resultdir, 'temp-*.direct.p') + str(i))[0]
-                part_fstab = runCmd("debugfs -R 'cat etc/fstab' %s" % (part), stderr=subprocess.PIPE)
-                part_fstab_md5sum.append(hashlib.md5((part_fstab.output + "\n\n").encode('utf-8')).hexdigest())
+        no_fstab_update_path = os.path.join(self.resultdir, 'test-no-fstab-update')
+        os.makedirs(no_fstab_update_path)
+        wks_file = os.path.join(no_fstab_update_path, 'temp.wks')
+        with open(wks_file, 'w') as wks:
+            wks.writelines(['part / --source rootfs --fstype=ext4 --label rootfs\n',
+                            'part /mnt/p2 --source rootfs --rootfs-dir=core-image-minimal ',
+                            '--fstype=ext4 --label p2 --no-fstab-update\n'])
+        runCmd("wic create %s -e core-image-minimal -o %s" \
+                                   % (wks_file, self.resultdir))
 
-            # '/etc/fstab' in partition 2 should contain the same stock fstab file
-            # as the one installed by the base-file recipe.
-            self.assertEqual(bf_fstab_md5sum, part_fstab_md5sum[1])
+        part_fstab_md5sum = []
+        for i in range(1, 3):
+            part = glob(os.path.join(self.resultdir, 'temp-*.direct.p') + str(i))[0]
+            part_fstab = runCmd("debugfs -R 'cat etc/fstab' %s" % (part), stderr=subprocess.PIPE)
+            part_fstab_md5sum.append(hashlib.md5((part_fstab.output + "\n\n").encode('utf-8')).hexdigest())
 
-            # '/etc/fstab' in partition 1 should contain an updated fstab file.
-            self.assertNotEqual(bf_fstab_md5sum, part_fstab_md5sum[0])
+        # '/etc/fstab' in partition 2 should contain the same stock fstab file
+        # as the one installed by the base-file recipe.
+        self.assertEqual(bf_fstab_md5sum, part_fstab_md5sum[1])
 
-        finally:
-            os.environ['PATH'] = oldpath
+        # '/etc/fstab' in partition 1 should contain an updated fstab file.
+        self.assertNotEqual(bf_fstab_md5sum, part_fstab_md5sum[0])
 
     def test_no_fstab_update_errors(self):
         """Test --no-fstab-update wks option error handling."""
@@ -995,153 +953,139 @@ bootloader --ptable gpt""")
     def test_wic_sector_size_env(self):
         """Test generation image sector size via environment (obsolete)"""
  
-        oldpath = os.environ['PATH']
-        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
+        # Add WIC_SECTOR_SIZE into config
+        config = 'WIC_SECTOR_SIZE = "4096"\n'\
+                 'WICVARS:append = " WIC_SECTOR_SIZE"\n'
+        self.append_config(config)
+        bitbake('core-image-minimal')
 
-        try:
-            # Add WIC_SECTOR_SIZE into config
-            config = 'WIC_SECTOR_SIZE = "4096"\n'\
-                     'WICVARS:append = " WIC_SECTOR_SIZE"\n'
-            self.append_config(config)
-            bitbake('core-image-minimal')
+        # Check WIC_SECTOR_SIZE apply to bitbake variable
+        wic_sector_size_str = get_bb_var('WIC_SECTOR_SIZE', 'core-image-minimal')
+        wic_sector_size = int(wic_sector_size_str)
+        self.assertEqual(4096, wic_sector_size)
 
-            # Check WIC_SECTOR_SIZE apply to bitbake variable
-            wic_sector_size_str = get_bb_var('WIC_SECTOR_SIZE', 'core-image-minimal')
-            wic_sector_size = int(wic_sector_size_str)
-            self.assertEqual(4096, wic_sector_size)
-
-            self.logger.info("Test wic_sector_size: %d \n" % wic_sector_size)
-
-            with NamedTemporaryFile("w", suffix=".wks") as wks:
-                wks.writelines(
-                    ['bootloader --ptable gpt\n',
-                     'part --fstype vfat --fstype vfat --label emptyfat --size 1M --mkfs-extraopts "-S 4096"\n',
-                     'part --fstype ext4 --source rootfs --label rofs-a --mkfs-extraopts "-b 4096"\n',
-                     'part --fstype ext4 --source rootfs --use-uuid --mkfs-extraopts "-b 4096"\n'])
-                wks.flush()
-                cmd = "wic create %s -e core-image-minimal -o %s" % (wks.name, self.resultdir)
-                runCmd(cmd)
-                wksname = os.path.splitext(os.path.basename(wks.name))[0]
-                images = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
-                self.assertEqual(1, len(images))
+        self.logger.info("Test wic_sector_size: %d \n" % wic_sector_size)
 
-            sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
-            # list partitions
-            result = runCmd("wic ls %s -n %s" % (images[0], sysroot))
-            print(result.output)
-            # Deprecated message + 4 lines of output: header + 3 partitions
-            self.assertEqual(5, len(result.output.split('\n')))
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.writelines(
+                ['bootloader --ptable gpt\n',
+                 'part --fstype vfat --fstype vfat --label emptyfat --size 1M --mkfs-extraopts "-S 4096"\n',
+                 'part --fstype ext4 --source rootfs --label rofs-a --mkfs-extraopts "-b 4096"\n',
+                 'part --fstype ext4 --source rootfs --use-uuid --mkfs-extraopts "-b 4096"\n'])
+            wks.flush()
+            cmd = "wic create %s -e core-image-minimal -o %s" % (wks.name, self.resultdir)
+            runCmd(cmd)
+            wksname = os.path.splitext(os.path.basename(wks.name))[0]
+            images = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
+            self.assertEqual(1, len(images))
 
-            # verify partition size with wic
-            res = runCmd("export PARTED_SECTOR_SIZE=%d; parted -m %s unit b p" % (wic_sector_size, images[0]),
-                         stderr=subprocess.PIPE)
+        sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+        # list partitions
+        result = runCmd("wic ls %s -n %s" % (images[0], sysroot))
+        print(result.output)
+        # Deprecated message + 4 lines of output: header + 3 partitions
+        self.assertEqual(5, len(result.output.split('\n')))
 
-            print(res.output)
-            # parse parted output which looks like this:
-            # BYT;\n
-            # /var/tmp/wic/build/tmpgjzzefdd-202410281021-sda.direct:78569472B:file:4096:4096:gpt::;\n
-            # 1:139264B:1187839B:1048576B::emptyfat:msftdata;
-            # 2:1187840B:149270527B:148082688B:ext4:rofs-a:;
-            # 3:149270528B:297353215B:148082688B:ext4:primary:;
-            disk_info = res.output.splitlines()[1]
-            # Check sector sizes
-            sector_size_logical = int(disk_info.split(":")[3])
-            sector_size_physical = int(disk_info.split(":")[4])
-            self.assertEqual(wic_sector_size, sector_size_logical, "Logical sector size is not %d." % wic_sector_size)
-            self.assertEqual(wic_sector_size, sector_size_physical, "Physical sector size is not %d." % wic_sector_size)
-
-            # It is a known issue with parsed that a 4K FAT partition does
-            # not have a recognized filesystem type of *fat.
-            part_info = res.output.splitlines()[2]
-            partname = part_info.split(":")[5]
-            parttype = part_info.split(":")[6]
-            self.assertEqual('emptyfat', partname)
-            self.assertEqual('msftdata;', parttype)
-
-            part_info = res.output.splitlines()[3]
-            parttype = part_info.split(":")[4]
-            partname = part_info.split(":")[5]
-            self.assertEqual('ext4', parttype)
-            self.assertEqual('rofs-a', partname)
-
-            part_info = res.output.splitlines()[4]
-            parttype = part_info.split(":")[4]
-            partname = part_info.split(":")[5]
-            self.assertEqual('ext4', parttype)
-            self.assertEqual('primary', partname)
+        # verify partition size with wic
+        res = runCmd("export PARTED_SECTOR_SIZE=%d; parted -m %s unit b p" % (wic_sector_size, images[0]),
+                     stderr=subprocess.PIPE)
 
-        finally:
-            os.environ['PATH'] = oldpath
+        print(res.output)
+        # parse parted output which looks like this:
+        # BYT;\n
+        # /var/tmp/wic/build/tmpgjzzefdd-202410281021-sda.direct:78569472B:file:4096:4096:gpt::;\n
+        # 1:139264B:1187839B:1048576B::emptyfat:msftdata;
+        # 2:1187840B:149270527B:148082688B:ext4:rofs-a:;
+        # 3:149270528B:297353215B:148082688B:ext4:primary:;
+        disk_info = res.output.splitlines()[1]
+        # Check sector sizes
+        sector_size_logical = int(disk_info.split(":")[3])
+        sector_size_physical = int(disk_info.split(":")[4])
+        self.assertEqual(wic_sector_size, sector_size_logical, "Logical sector size is not %d." % wic_sector_size)
+        self.assertEqual(wic_sector_size, sector_size_physical, "Physical sector size is not %d." % wic_sector_size)
+
+        # It is a known issue with parsed that a 4K FAT partition does
+        # not have a recognized filesystem type of *fat.
+        part_info = res.output.splitlines()[2]
+        partname = part_info.split(":")[5]
+        parttype = part_info.split(":")[6]
+        self.assertEqual('emptyfat', partname)
+        self.assertEqual('msftdata;', parttype)
+
+        part_info = res.output.splitlines()[3]
+        parttype = part_info.split(":")[4]
+        partname = part_info.split(":")[5]
+        self.assertEqual('ext4', parttype)
+        self.assertEqual('rofs-a', partname)
+
+        part_info = res.output.splitlines()[4]
+        parttype = part_info.split(":")[4]
+        partname = part_info.split(":")[5]
+        self.assertEqual('ext4', parttype)
+        self.assertEqual('primary', partname)
 
     def test_wic_sector_size_cli(self):
         """Test sector size handling via CLI option."""
 
-        oldpath = os.environ['PATH']
-        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
-
-        try:
-            bitbake('core-image-minimal')
-
-            with NamedTemporaryFile("w", suffix=".wks") as wks:
-                wks.writelines(
-                    ['bootloader --ptable gpt\n',
-                     'part --fstype vfat --fstype vfat --label emptyfat --size 1M\n',
-                     'part --fstype ext4 --source rootfs --label rofs-a\n',
-                     'part --fstype ext4 --source rootfs --use-uuid\n'])
-                wks.flush()
-                cmd = "wic create %s -e core-image-minimal -o %s --sector-size 4096" % (wks.name, self.resultdir)
-                runCmd(cmd)
-                wksname = os.path.splitext(os.path.basename(wks.name))[0]
-                images = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
-                self.assertEqual(1, len(images))
+        bitbake('core-image-minimal')
 
-            sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
-            # list partitions
-            result = runCmd("wic ls %s -n %s --sector-size 4096" % (images[0], sysroot))
-            print(result.output)
-            # 4 lines of output: header + 3 partitions
-            self.assertEqual(4, len(result.output.split('\n')))
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.writelines(
+                ['bootloader --ptable gpt\n',
+                 'part --fstype vfat --fstype vfat --label emptyfat --size 1M\n',
+                 'part --fstype ext4 --source rootfs --label rofs-a\n',
+                 'part --fstype ext4 --source rootfs --use-uuid\n'])
+            wks.flush()
+            cmd = "wic create %s -e core-image-minimal -o %s --sector-size 4096" % (wks.name, self.resultdir)
+            runCmd(cmd)
+            wksname = os.path.splitext(os.path.basename(wks.name))[0]
+            images = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
+            self.assertEqual(1, len(images))
 
-            # verify partition size with parted output
-            res = runCmd("export PARTED_SECTOR_SIZE=%d; parted -m %s unit b p" % (4096, images[0]),
-                         stderr=subprocess.PIPE)
+        sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+        # list partitions
+        result = runCmd("wic ls %s -n %s --sector-size 4096" % (images[0], sysroot))
+        print(result.output)
+        # 4 lines of output: header + 3 partitions
+        self.assertEqual(4, len(result.output.split('\n')))
 
-            print(res.output)
-            # parse parted output which looks like this:
-            # BYT;\n
-            # /var/tmp/wic/build/tmpgjzzefdd-202410281021-sda.direct:78569472B:file:4096:4096:gpt::;\n
-            # 1:139264B:1187839B:1048576B::emptyfat:msftdata;
-            # 2:1187840B:149270527B:148082688B:ext4:rofs-a:;
-            # 3:149270528B:297353215B:148082688B:ext4:primary:;
-            disk_info = res.output.splitlines()[1]
-            # Check sector sizes
-            sector_size_logical = int(disk_info.split(":")[3])
-            sector_size_physical = int(disk_info.split(":")[4])
-            self.assertEqual(4096, sector_size_logical, "Logical sector size is not 4096.")
-            self.assertEqual(4096, sector_size_physical, "Physical sector size is not 4096.")
-
-            # It is a known issue with parsed that a 4K FAT partition does
-            # not have a recognized filesystem type of *fat.
-            part_info = res.output.splitlines()[2]
-            partname = part_info.split(":")[5]
-            parttype = part_info.split(":")[6]
-            self.assertEqual('emptyfat', partname)
-            self.assertEqual('msftdata;', parttype)
-
-            part_info = res.output.splitlines()[3]
-            parttype = part_info.split(":")[4]
-            partname = part_info.split(":")[5]
-            self.assertEqual('ext4', parttype)
-            self.assertEqual('rofs-a', partname)
-
-            part_info = res.output.splitlines()[4]
-            parttype = part_info.split(":")[4]
-            partname = part_info.split(":")[5]
-            self.assertEqual('ext4', parttype)
-            self.assertEqual('primary', partname)
+        # verify partition size with parted output
+        res = runCmd("export PARTED_SECTOR_SIZE=%d; parted -m %s unit b p" % (4096, images[0]),
+                     stderr=subprocess.PIPE)
 
-        finally:
-            os.environ['PATH'] = oldpath
+        print(res.output)
+        # parse parted output which looks like this:
+        # BYT;\n
+        # /var/tmp/wic/build/tmpgjzzefdd-202410281021-sda.direct:78569472B:file:4096:4096:gpt::;\n
+        # 1:139264B:1187839B:1048576B::emptyfat:msftdata;
+        # 2:1187840B:149270527B:148082688B:ext4:rofs-a:;
+        # 3:149270528B:297353215B:148082688B:ext4:primary:;
+        disk_info = res.output.splitlines()[1]
+        # Check sector sizes
+        sector_size_logical = int(disk_info.split(":")[3])
+        sector_size_physical = int(disk_info.split(":")[4])
+        self.assertEqual(4096, sector_size_logical, "Logical sector size is not 4096.")
+        self.assertEqual(4096, sector_size_physical, "Physical sector size is not 4096.")
+
+        # It is a known issue with parsed that a 4K FAT partition does
+        # not have a recognized filesystem type of *fat.
+        part_info = res.output.splitlines()[2]
+        partname = part_info.split(":")[5]
+        parttype = part_info.split(":")[6]
+        self.assertEqual('emptyfat', partname)
+        self.assertEqual('msftdata;', parttype)
+
+        part_info = res.output.splitlines()[3]
+        parttype = part_info.split(":")[4]
+        partname = part_info.split(":")[5]
+        self.assertEqual('ext4', parttype)
+        self.assertEqual('rofs-a', partname)
+
+        part_info = res.output.splitlines()[4]
+        parttype = part_info.split(":")[4]
+        partname = part_info.split(":")[5]
+        self.assertEqual('ext4', parttype)
+        self.assertEqual('primary', partname)
 
 class Wic2(WicTestCase):
 
@@ -1483,47 +1427,41 @@ run_wic_cmd() {
     def test_extra_partition_space(self):
         native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
 
-        oldpath = os.environ['PATH']
-        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
+        with NamedTemporaryFile("w", suffix=".wks") as tempf:
+            tempf.write("bootloader --ptable gpt\n" \
+                        "part                 --ondisk hda --size 10M        --extra-partition-space 10M --fstype=ext4\n" \
+                        "part                 --ondisk hda --fixed-size 20M  --extra-partition-space 10M --fstype=ext4\n" \
+                        "part --source rootfs --ondisk hda                   --extra-partition-space 10M --fstype=ext4\n" \
+                        "part --source rootfs --ondisk hda --fixed-size 200M --extra-partition-space 10M --fstype=ext4\n")
+            tempf.flush()
+
+            _, wicimg = self._get_wic(tempf.name)
 
-        try:
-            with NamedTemporaryFile("w", suffix=".wks") as tempf:
-                tempf.write("bootloader --ptable gpt\n" \
-                            "part                 --ondisk hda --size 10M        --extra-partition-space 10M --fstype=ext4\n" \
-                            "part                 --ondisk hda --fixed-size 20M  --extra-partition-space 10M --fstype=ext4\n" \
-                            "part --source rootfs --ondisk hda                   --extra-partition-space 10M --fstype=ext4\n" \
-                            "part --source rootfs --ondisk hda --fixed-size 200M --extra-partition-space 10M --fstype=ext4\n")
-                tempf.flush()
-
-                _, wicimg = self._get_wic(tempf.name)
-
-                res = runCmd("parted -m %s unit b p" % wicimg,
-                                native_sysroot=native_sysroot, stderr=subprocess.PIPE)
-
-                # parse parted output which looks like this:
-                # BYT;\n
-                # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
-                # 1:0.00MiB:200MiB:200MiB:ext4::;\n
-                partlns = res.output.splitlines()[2:]
-
-                self.assertEqual(4, len(partlns))
-
-                # Test for each partitions that the extra part space exists
-                for part in range(0, len(partlns)):
-                    part_file = os.path.join(self.resultdir, "selftest_img.part%d" % (part + 1))
-                    partln = partlns[part].split(":")
-                    self.assertEqual(7, len(partln))
-                    self.assertRegex(partln[3], r'^[0-9]+B$')
-                    part_size = int(partln[3].rstrip("B"))
-                    start = int(partln[1].rstrip("B")) / 512
-                    length = part_size / 512
-                    runCmd("dd if=%s of=%s skip=%d count=%d" %
-                                                (wicimg, part_file, start, length))
-                    res = runCmd("dumpe2fs %s -h | grep \"^Block count\"" % part_file)
-                    fs_size = int(res.output.split(":")[1].strip()) * 1024
-                    self.assertLessEqual(fs_size + 10485760, part_size, "part file: %s" % part_file)
-        finally:
-            os.environ['PATH'] = oldpath
+            res = runCmd("parted -m %s unit b p" % wicimg,
+                            native_sysroot=native_sysroot, stderr=subprocess.PIPE)
+
+            # parse parted output which looks like this:
+            # BYT;\n
+            # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
+            # 1:0.00MiB:200MiB:200MiB:ext4::;\n
+            partlns = res.output.splitlines()[2:]
+
+            self.assertEqual(4, len(partlns))
+
+            # Test for each partitions that the extra part space exists
+            for part in range(0, len(partlns)):
+                part_file = os.path.join(self.resultdir, "selftest_img.part%d" % (part + 1))
+                partln = partlns[part].split(":")
+                self.assertEqual(7, len(partln))
+                self.assertRegex(partln[3], r'^[0-9]+B$')
+                part_size = int(partln[3].rstrip("B"))
+                start = int(partln[1].rstrip("B")) / 512
+                length = part_size / 512
+                runCmd("dd if=%s of=%s skip=%d count=%d" %
+                                            (wicimg, part_file, start, length))
+                res = runCmd("dumpe2fs %s -h | grep \"^Block count\"" % part_file)
+                fs_size = int(res.output.split(":")[1].strip()) * 1024
+                self.assertLessEqual(fs_size + 10485760, part_size, "part file: %s" % part_file)
 
     # TODO this test could also work on aarch64
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
@@ -1836,45 +1774,39 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
             testfile.write("test %s" % testfilename)
             testfile.close()
 
-        oldpath = os.environ['PATH']
-        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.writelines([
+                'part / --source extra_partition --ondisk sda --sourceparams "name=foo" --align 4 --size 5M\n',
+                'part / --source extra_partition --ondisk sda --label foo --align 4 --size 5M\n',
+                'part / --source extra_partition --ondisk sda --fstype=vfat --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d --align 4 --size 5M\n',
+                'part / --source extra_partition --ondisk sda --fstype=ext4 --label bar --align 4 --size 5M\n',
+                'bootloader --ptable gpt\n',
+            ])
+            wks.flush()
+            _, wicimg = self._get_wic(wks.name)
 
-        try:
-            with NamedTemporaryFile("w", suffix=".wks") as wks:
-                wks.writelines([
-                    'part / --source extra_partition --ondisk sda --sourceparams "name=foo" --align 4 --size 5M\n',
-                    'part / --source extra_partition --ondisk sda --label foo --align 4 --size 5M\n',
-                    'part / --source extra_partition --ondisk sda --fstype=vfat --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d --align 4 --size 5M\n',
-                    'part / --source extra_partition --ondisk sda --fstype=ext4 --label bar --align 4 --size 5M\n',
-                    'bootloader --ptable gpt\n',
-                ])
-                wks.flush()
-                _, wicimg = self._get_wic(wks.name)
-
-            result = runCmd("wic ls %s -n %s" % (wicimg, sysroot))
-            partls = result.output.split('\n')[1:]
-
-            # Assert the number of partitions is correct
-            self.assertEqual(4, len(partls), msg="Expect 4 partitions, not %s" % result.output)
-
-            # Fstype column from 'wic ls' should be fstype as given in the part command
-            for part_id, part_fs in enumerate(["fat16", "fat16", "fat16", "ext4"]):
-                self.assertIn(part_fs, partls[part_id])
-
-            # For each partition, assert expected files exist
-            for part, part_glob in enumerate([
-                ["bar.conf"],
-                ["foo.conf"],
-                ["foobar.conf", "foobar2.conf", "bar3.conf", "bar4.conf"],
-                ["bar.conf", "bar2.conf"],
-            ]):
-                for part_file in part_glob:
-                    result = runCmd("wic ls %s:%d/%s -n %s" % (wicimg, part + 1, part_file, sysroot))
-                    self.assertEqual(0, result.status, msg="File '%s' not found in the partition #%d" % (part_file, part))
+        result = runCmd("wic ls %s -n %s" % (wicimg, sysroot))
+        partls = result.output.split('\n')[1:]
 
-            self.remove_config(config)
-        finally:
-            os.environ['PATH'] = oldpath
+        # Assert the number of partitions is correct
+        self.assertEqual(4, len(partls), msg="Expect 4 partitions, not %s" % result.output)
+
+        # Fstype column from 'wic ls' should be fstype as given in the part command
+        for part_id, part_fs in enumerate(["fat16", "fat16", "fat16", "ext4"]):
+            self.assertIn(part_fs, partls[part_id])
+
+        # For each partition, assert expected files exist
+        for part, part_glob in enumerate([
+            ["bar.conf"],
+            ["foo.conf"],
+            ["foobar.conf", "foobar2.conf", "bar3.conf", "bar4.conf"],
+            ["bar.conf", "bar2.conf"],
+        ]):
+            for part_file in part_glob:
+                result = runCmd("wic ls %s:%d/%s -n %s" % (wicimg, part + 1, part_file, sysroot))
+                self.assertEqual(0, result.status, msg="File '%s' not found in the partition #%d" % (part_file, part))
+
+        self.remove_config(config)
 
     def test_fs_types(self):
         """Test filesystem types for empty and not empty partitions"""
-- 
2.50.0.173.g8b6f19ccfc3a


