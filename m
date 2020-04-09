Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.11911.1586447586805735489
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 08:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B6KF3ZNi;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id a81so235199wmf.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 08:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DQOYuVJPTWch4okdI2DfwHlRxibA+EKTXe1ahwaTJPk=;
        b=B6KF3ZNitdIr114GJn0yr3fPK2E6t3dCPxf0lxCmvetYeOzhYv2s69T7hYNXEGsQeW
         tsCJKvfj2EXtR2RkEbSoEx6lT7sYfwUMk3gKPOh99ys39pwte6OgGPzPhoMqfv8WPIrz
         JnK2nv5qxS/maeea+h/1DA1An1NKZWw4K+3mYhaZkmLQ/2octBGZ+q2GKU3Ijv1xzR+k
         7Rmws7vXvcdsLRIczw6DCattkdlD7Q53Cg0s8w49TG2YzsRTWFcgerMMcj5v+lUH6jAH
         sPLllrk2HfjHpQRYqAuxhcdH4lN1kSpzdcW1WKl2OKs4Mj+q6jhpmXLFK8ZNJfTqLHfe
         oX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=DQOYuVJPTWch4okdI2DfwHlRxibA+EKTXe1ahwaTJPk=;
        b=e2xN/N/m9ppncrNvTzpizV6HOGaiKEFr2RMYcwVl0lSdUd3/l8AlpcIj8kWF5HTtYV
         lHIMDTdw3qEX9iqlqlflxGT8/IztqbbQB9rsIFXBw8llIeMt6PqIeRH4LmRkPL0mD2WF
         Sxi1LI2qx3PjTnyO1o6mRWAGHMx7ypTWB5bIUGObfitvqIASpgRvgZY2+UlxpEY+8xMu
         7FBoJt7oCcUp/4QingtZ9+IAuEFAdosvuzNB3iDnyVt7WRl46jXMuAmFMFtD6uX6ImHX
         cP4QOFBBpBOCZsbHXds9me6Yh7O2ZhKFtdWZJTRDfjBm/8PYt7EhJk/Q6Y9YjsPgdUeA
         gBlg==
X-Gm-Message-State: AGi0PuYmPMyRQ5yy2ZU/CRD6qOFiHeV3dzdTTsMVYgYVdirNVmEAg128
	eSl2Eil7iG6/WmY0ZGpgc1ZkVccF8as=
X-Google-Smtp-Source: APiQypLP/gs4ipJ4CDFq6BYQJTIVGIoVGW8zNdrotqODDnmpLm9uHm8Z6ZcYX68uowLCHEQO3ayYvA==
X-Received: by 2002:a1c:8106:: with SMTP id c6mr529097wmd.88.1586447585053;
        Thu, 09 Apr 2020 08:53:05 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id t67sm4253635wmt.48.2020.04.09.08.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 08:53:04 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v5 6/6] oeqa: wic: Add tests for permissions and change-directory
Date: Thu,  9 Apr 2020 17:52:51 +0200
Message-Id: <20200409155251.982424-7-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409155251.982424-1-ricardo@ribalda.com>
References: <20200409155251.982424-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make sure that the permissions and username are respected when using all
the rootfs modifiers.

Add tests for checnage-directory command

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 91 +++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 626a217e69..8ef08c3d77 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -62,6 +62,12 @@ def extract_files(debugfs_output):
     return [line.split('/')[5].strip() for line in \
             debugfs_output.strip().split('/\n')]
 
+def files_own_by_root(debugfs_output):
+    for line in debugfs_output.strip().split('/\n'):
+        if line.split('/')[3:5] != ['0', '0']:
+            print(debugfs_output)
+            return False
+    return True
 
 class WicTestCase(OESelftestTestCase):
     """Wic test class."""
@@ -84,6 +90,7 @@ class WicTestCase(OESelftestTestCase):
                 self.skipTest('wic-tools cannot be built due its (intltool|gettext)-native dependency and NLS disable')
 
             bitbake('core-image-minimal')
+            bitbake('core-image-minimal-mtdutils')
             WicTestCase.image_is_ready = True
 
         rmtree(self.resultdir, ignore_errors=True)
@@ -506,6 +513,90 @@ part /part2 --source rootfs --ondisk mmcblk0 --fstype=ext4 --include-path %s"""
                                       % (wks_file, self.resultdir), ignore_status=True).status)
         os.remove(wks_file)
 
+    def test_permissions(self):
+        """Test permissions are respected"""
+
+        oldpath = os.environ['PATH']
+        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
+
+        t_normal = """
+part / --source rootfs --fstype=ext4
+"""
+        t_exclude = """
+part / --source rootfs --fstype=ext4 --exclude-path=home
+"""
+        t_multi = """
+part / --source rootfs --ondisk sda --fstype=ext4
+part /export --source rootfs --rootfs=core-image-minimal-mtdutils --fstype=ext4
+"""
+        t_change = """
+part / --source rootfs --ondisk sda --fstype=ext4 --exclude-path=etc/   
+part /etc --source rootfs --fstype=ext4 --change-directory=etc
+"""
+        tests = [t_normal, t_exclude, t_multi, t_change]
+
+        try:
+            for test in tests:
+                include_path = os.path.join(self.resultdir, 'test-include')
+                os.makedirs(include_path)
+                wks_file = os.path.join(include_path, 'temp.wks')
+                with open(wks_file, 'w') as wks:
+                    wks.write(test)
+                runCmd("wic create %s -e core-image-minimal -o %s" \
+                                       % (wks_file, self.resultdir))
+
+                for part in glob(os.path.join(self.resultdir, 'temp-*.direct.p*')):
+                    res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part))
+                    self.assertEqual(True, files_own_by_root(res.output))
+
+                rmtree(self.resultdir, ignore_errors=True)
+
+        finally:
+            os.environ['PATH'] = oldpath
+
+    def test_change_directory(self):
+        """Test --change-directory wks option."""
+
+        oldpath = os.environ['PATH']
+        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
+
+        try:
+            include_path = os.path.join(self.resultdir, 'test-include')
+            os.makedirs(include_path)
+            wks_file = os.path.join(include_path, 'temp.wks')
+            with open(wks_file, 'w') as wks:
+                rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
+                wks.write("part /etc --source rootfs --fstype=ext4 --change-directory=etc")
+            runCmd("wic create %s -e core-image-minimal -o %s" \
+                                       % (wks_file, self.resultdir))
+
+            part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
+
+            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part1))
+            files = extract_files(res.output)
+            self.assertIn('shadow', files)
+
+        finally:
+            os.environ['PATH'] = oldpath
+
+    def test_change_directory_errors(self):
+        """Test --change-directory wks option error handling."""
+        wks_file = 'temp.wks'
+
+        # Absolute argument.
+        with open(wks_file, 'w') as wks:
+            wks.write("part / --source rootfs --fstype=ext4 --change-directory /usr")
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        os.remove(wks_file)
+
+        # Argument pointing to parent directory.
+        with open(wks_file, 'w') as wks:
+            wks.write("part / --source rootfs --fstype=ext4 --change-directory ././..")
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        os.remove(wks_file)
+
 class Wic2(WicTestCase):
 
     def test_bmap_short(self):
-- 
2.25.1

