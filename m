Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969D3C5516F
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 15:28:29 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15.1785511704671809074
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 08:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kizPPecL;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: twoerner@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9618b8bdc51so269530241.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 08:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785511703; x=1786116503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y5Q7gJXvDV99uZdHnOw2+yMoew8tvXxSovnpkrTqZ3g=;
        b=kizPPecLnEaUA/AO2eoQC9UaaIHsajyHlTLtzm5Vqp5qHMh3+uHgJpcJLnQqNJDVuv
         yFj5KOVSEqFzfu2Ng6+JhlPiPGGhmAeUu6yCKK3UYGjGRI577lq6lSCqEwqbXlm2yScZ
         oxMxtHboXCiCR01x0hSUZohScxiBiTf9dejGgLCHkwD6wg0takh23z5+VPvkAlJNtbRb
         lChbEZ6zXS9uMOgAwYyQG/Tn1PWbmA7EO3vSYsp/xBhnUf72YoMKzk0PiUn1JtBfD2Yl
         Zb0BGerA33TebrVH1joQbO+y5tONc5NMXbjTPF7HSUPABwImUfaEyoxbzlj5YU9uOzhn
         orhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785511703; x=1786116503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=y5Q7gJXvDV99uZdHnOw2+yMoew8tvXxSovnpkrTqZ3g=;
        b=Ql7ARgEJ8M/vsaRZ4ypfPu6crqy6vMDjRNAEKwT3NGYVMzC/3lQUb+vO/EECYZMOcT
         KQZrSpseML4ix8Hcc16uxhzwW7pWofU6Sfahri8TiXKwLdce0ldxQb/JbSuDGZazfhU1
         WTYO+J9QpjgfsZxIb1YRQlEn403VCsv9MYVqSg47vDBCr3NhOFOXYJOIgkSQIcii/ueF
         kYSSFI38KZhNUElSSYBlY7cWbRUmceKzOwVpsX7yBQ556hyB+Q5/aoLKe4XgyvCSLIqs
         jf+Oxx3xx85tR/PLQUblX5q4cSzzHze59hoG1bylUDmKCk4vGTyGKztNJYw0o0vjm+Vv
         +OoA==
X-Gm-Message-State: AOJu0YyO2vN4x1FjQBvYAiTEGttP3fRzjeyppp+SulaoPR4LIQs+ijjm
	klUU32X6y7iHck/w89Wn3Xv+r5BefpQnb+yFCHbg4PZa/CG9cg/swE3tB/EhUw==
X-Gm-Gg: AR+sD10gxLg6ucXo2UY3ttmCNTipwKAMfKmfXBwqPlXMDz7yKWN3mHuELzGigAhCTFC
	LwFri3AVnvuLQsancy7dhmf3qAeiCF0/jgXOuEoxIyAPwHBUlwZNbuxei8+x9ybOgmDkBzSW31V
	PcxIvXqANaiBCzNG5mrcMY5OyHoYw+uYeGRIiVX7Jb9Pn7igaSdDGsdsVI4IPnyK5MFdXcAH6Fz
	a9h7BwWOq80VoYsLDnBiHnTizIx+pWh5j12kfbjbM3vom5nv0ArBe56rmtHrf9AAUKQjMeJAOZ3
	mlHQAUhq3It38jAZ0RjX6BJHVZNKzcTBafHGp6Ite2FqmDzrRUARGh5SJutw4fb3zhg0sj4MsFs
	bowLRfcpf1d/1x6hwTa/eN3xKzA8l9WK6+xYINsxp9WCAVZRbs+iw3D31ohD43Jp0ySK4Z5uknK
	9NWXTcU9QrJg3Hrq6w6x9g6t2ebD2vuyeytzr5vMze5IhRpiehHM1KsQr/8FV+7Zt+7bkwfJZsO
	7jSzXctD8kkifxwf61mCm0bdZEAF0SgTmSHZxbigQ==
X-Received: by 2002:a05:6102:4403:b0:744:cb59:d6e0 with SMTP id ada2fe7eead31-75b1e73c2d0mr520359137.0.1785511702967;
        Fri, 31 Jul 2026 08:28:22 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-759c9559116sm837007137.11.2026.07.31.08.28.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:28:19 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 5/6] oeqa/selftest/wic: drop redundant per-test PATH overrides
Date: Fri, 31 Jul 2026 11:28:09 -0400
Message-ID: <20260731152810.2641327-6-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260731152810.2641327-1-twoerner@gmail.com>
References: <20260731152810.2641327-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 15:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242451

setUpLocal() already puts wic and its tools on PATH for every test, so
the per-test "os.environ['PATH'] = get_bb_var('PATH', 'wic-tools')"
overrides and their try/finally wrappers add nothing. Drop them; the
resulting dedent makes the diff large, so review with git show -w.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v5:
- trimmed the commit message

changes in v4:
- new in v4
---
 meta/lib/oeqa/selftest/cases/wic.py | 792 +++++++++++++---------------
 1 file changed, 362 insertions(+), 430 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 8a39a4ddc603..5b90c64cfd6b 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -525,104 +525,97 @@ class Wic(WicTestCase):
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
@@ -661,75 +654,61 @@ part /mnt --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/whoa
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
@@ -780,9 +759,6 @@ part / --source rootfs  --fstype=ext4 --include-path %s --include-path core-imag
         # prepare wicenv and rootfs
         bitbake('core-image-minimal core-image-minimal-mtdutils -c do_rootfs_wicenv')
 
-        oldpath = os.environ['PATH']
-        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
-
         t_normal = """
 part / --source rootfs --fstype=ext4
 """
@@ -799,61 +775,50 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
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
@@ -876,41 +841,34 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
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
@@ -984,153 +942,139 @@ bootloader --ptable gpt""")
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
 
@@ -1472,47 +1416,41 @@ run_wic_cmd() {
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
@@ -1825,45 +1763,39 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
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


