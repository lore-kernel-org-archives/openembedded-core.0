Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.12745.1587278160622243770
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 23:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZsFhfBS7;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id u127so6422637wmg.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2020 23:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m4Yl58OjyWzbRm5CxslKuL00I7NVFdx/GdANzLSiMJM=;
        b=ZsFhfBS7iSEnYZNZoW4FQ7c0VgoHuHIgBW1IKWKGH2ZyY3/hHm1+v21erAyz0zPrf5
         AEuOhNE4YqTrIcRgDLrALSIxnFX3TzzG4Vbwn/cb1Wc35mGph25ebBDemUirv6KvFsb2
         Dwfl8IM7uQyLRHKvZYINMYmrcJY77d8kZcYnLdw9KjIdDhRMOKxC9LOtG4WAfbZYMp8l
         KWb/7vqdiXQlE1alhkheLD2gMpw6YEqTJ2kyqdxTRi4cuQI4Ky0bGacQmB/O9h7RNZyO
         5QysE4eh+aIIRNW9XWw09nk/X3wf453LA/xZIKyB7FtibwvHBnd9C/4b2kpG5GeUlUF6
         HA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=m4Yl58OjyWzbRm5CxslKuL00I7NVFdx/GdANzLSiMJM=;
        b=lWdO97TZ4Cg8PBCMAk2WnvYrJNdsIGJXMZsAXCDbLpdmUs/a9soQF1+kOdYMQNAhbJ
         8adoyJVjzkTD0d84Z2ncK4LJIu4LysvjKJP62pDQqZfeCnnn+cLq2MsmK0M4u8RaXP0M
         09YULFMu7lGMzVOsbuaPnk8NDJ8ZkdRbuD5vaUs0ox76yaip+1y9J3Tr2jSBTIvhmXeA
         OXWwkLApE7/xS/juJFK5STouOUnPP9YPyw4c+xq1hBetkVxw6CyEraU3FcAKyQ7NENTd
         a/JAfbXG4Ovgdv/Ifr13xIx+Qh1q5tnFpQT0jOGhoGtaqx4U9WpUwa72rz7i9HeD86ES
         abfg==
X-Gm-Message-State: AGi0PubRJ0qKTPJH8vLku9B3VNR4L/mz1MRb6RTSRFiXQb72yp+JRZcp
	uCjBQJ3DZeA2caHFAC9k+phgjKlUGYg=
X-Google-Smtp-Source: APiQypJQrW4TMJ89TQqZzAuMK4SYgaAj7acGAYfMtDU9MaZprIJ1hwEkynQATl7Tyqmqv+SBofwTVQ==
X-Received: by 2002:a1c:1f09:: with SMTP id f9mr1111034wmf.31.1587278158605;
        Sat, 18 Apr 2020 23:35:58 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id n6sm13980266wmc.28.2020.04.18.23.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 23:35:56 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
	Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v7 10/10] oeqa: wic: Add more tests for include_path
Date: Sun, 19 Apr 2020 08:35:38 +0200
Message-Id: <20200419063539.1467641-11-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200419063539.1467641-1-ricardo@ribalda.com>
References: <20200419063539.1467641-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Make sure permissions are respected.

Add new test for orig/destination option.

Cc: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 63 ++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 41cf23f778..c8765e5330 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -486,15 +486,76 @@ part /part2 --source rootfs --ondisk mmcblk0 --fstype=ext4 --include-path %s"""
             res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part1))
             files = extract_files(res.output)
             self.assertNotIn('test-file', files)
+            self.assertEqual(True, files_own_by_root(res.output))
 
-            # Test partition 2, should not contain 'test-file'
+            # Test partition 2, should contain 'test-file'
             res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part2))
             files = extract_files(res.output)
             self.assertIn('test-file', files)
+            self.assertEqual(True, files_own_by_root(res.output))
 
         finally:
             os.environ['PATH'] = oldpath
 
+    def test_include_path_embeded(self):
+        """Test --include-path wks option."""
+
+        oldpath = os.environ['PATH']
+        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
+
+        try:
+            include_path = os.path.join(self.resultdir, 'test-include')
+            os.makedirs(include_path)
+            with open(os.path.join(include_path, 'test-file'), 'w') as t:
+                t.write("test\n")
+            wks_file = os.path.join(include_path, 'temp.wks')
+            with open(wks_file, 'w') as wks:
+                wks.write("""
+part / --source rootfs  --fstype=ext4 --include-path %s --include-path core-image-minimal-mtdutils export/"""
+                          % (include_path))
+            runCmd("wic create %s -e core-image-minimal -o %s" \
+                                       % (wks_file, self.resultdir))
+
+            part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
+
+            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part1))
+            files = extract_files(res.output)
+            self.assertIn('test-file', files)
+            self.assertEqual(True, files_own_by_root(res.output))
+
+            res = runCmd("debugfs -R 'ls -p /export/etc/' %s 2>/dev/null" % (part1))
+            files = extract_files(res.output)
+            self.assertIn('passwd', files)
+            self.assertEqual(True, files_own_by_root(res.output))
+
+        finally:
+            os.environ['PATH'] = oldpath
+
+    def test_include_path_errors(self):
+        """Test --include-path wks option error handling."""
+        wks_file = 'temp.wks'
+
+        # Absolute argument.
+        with open(wks_file, 'w') as wks:
+            wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils /export")
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        os.remove(wks_file)
+
+        # Argument pointing to parent directory.
+        with open(wks_file, 'w') as wks:
+            wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils ././..")
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        os.remove(wks_file)
+
+        # 3 Argument pointing to parent directory.
+        with open(wks_file, 'w') as wks:
+            wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils export/ dummy")
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        os.remove(wks_file)
+
     def test_exclude_path_errors(self):
         """Test --exclude-path wks option error handling."""
         wks_file = 'temp.wks'
-- 
2.25.1

