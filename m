Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web11.11181.1586871398236894901
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 06:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YtwG+Vsw;
 spf=pass (domain: gmail.com, ip: 209.85.208.195, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f195.google.com with SMTP id v9so5864269ljk.12
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 06:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QXDdhPA2/i40XhE+qJ/JeBt4ieNhsTot3o+bWRnknWY=;
        b=YtwG+VswK2W0SW9g+UICIP6IyK6qEXcZpz6gJcpxvst5KPeZROueYAGI6GNL70MGpz
         2lKQpglYkpNQzVeKfvOtLpi8MAZ+L0u4WtG+r4ltZARmNob2SnECDj5mCuyl5cr7BQ1J
         haYffXa9/9jiCp/WV0+4OWWHdSTU0H/gHbNX/33G+HlmUd/MgQ6nLxt9aoMIqjJ5a74u
         wR0AXgin8Hnq/2jwD/vF3fDVY/NjkfbqQ8cDgVAnJpNpcYcqF5/d/uFEAKkD0wHZiQOS
         aPsK+3nKZUkT2vPJRNm5nbf0S4TF6WQT3yzzrkxhKWxMxlmYdk+uvQTM4et45qN5NPAI
         o4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=QXDdhPA2/i40XhE+qJ/JeBt4ieNhsTot3o+bWRnknWY=;
        b=NdReOrZDzQR//ToVSmkz3PTHvAolsS6F01iAhoIfWqNJe00T8DIzYXZrzuXZnbmabd
         WqawOpvcKWhxewpxydyPbvvk792tJIgHKGdG6DqtgoYHfA3iM2xcMvY6cjoCrhtrkfCx
         xyQMIGJjMo7A8AEMJuBaMWUzi9Wp518GFpkCzh/+oKv8eRFCHrQTo4ZgaGimpugr8liN
         BhInDNXq+hMtjnjSIQ6eHhDbBBNRsfUmiE3jzOJzFGlpk9vja+NFNUcaYoXry6ZsUPwD
         TxCttWe2WO1oRVfSwU4DEPNzNP1T5YbaXqx1+AR2TKPUMF6P26fPas2IkTpJy5T6LKRw
         PrRw==
X-Gm-Message-State: AGi0PuZG4pbuC0R9Evq75QxdKnK4shQLp0nV9sV49tXNowD4wseDvdH3
	wR4uwTJIMyo8iscNm+jwCpwT/P2je8k=
X-Google-Smtp-Source: APiQypIXHf/WO5OveVvF0rIN3VQHUMICRwOEdCVpyC0l3D3w1QgxlX13GlGWqCyD/CpczMuTtLO8TA==
X-Received: by 2002:a2e:900c:: with SMTP id h12mr139758ljg.290.1586871396019;
        Tue, 14 Apr 2020 06:36:36 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id o6sm9218344lji.15.2020.04.14.06.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 06:36:34 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v6 10/10] oeqa: wic: Add more tests for include_path
Date: Tue, 14 Apr 2020 15:36:14 +0200
Message-Id: <20200414133614.1830058-11-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414133614.1830058-1-ricardo@ribalda.com>
References: <20200414133614.1830058-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure permissions are respected.

Add new test for orig/destination option.

Cc: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 64 ++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 8ef08c3d77..1036269b64 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -486,15 +486,77 @@ part /part2 --source rootfs --ondisk mmcblk0 --fstype=ext4 --include-path %s"""
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
+                rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
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
+            self.assertIn('shadow', files)
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

