Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.11171.1586871391573150087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 06:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tbOdWQo+;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id j14so4036740lfg.9
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 06:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j8k9Al53uEltVGOfdTCMCYXLZJFmbJ8CpZKGpkPczkw=;
        b=tbOdWQo+SHLACQXpeU9pTe1bQfxnRyKyNrhT+U5xtTR7mIar4etdpEyUvsy9RtIpp/
         UOq9vjgnk+j7N7SDN8A4iZMvw7OmrMp6IilNrE8XyCubfepql3ZsvbHHOV7VGylGriWc
         S4CMmwj0AIMpC0/6OYj9uxyKnTztZkWKKqbcCT5eJUhugbKLZA+iSaPeaFRVQ6+KYHzk
         YwxeVRCozEAIQg5Lq6f9418yT4mt2rLHoUvh4sUq6rDLVs8jOiUZH56KrRhq4lDilyar
         Zn7AlXi+Hs6+9mIdqYwKa/YaJAB0Schc8Zg3A3qzzSl0VvuMWyVuIGWiC2FlFESf1GWj
         LSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=j8k9Al53uEltVGOfdTCMCYXLZJFmbJ8CpZKGpkPczkw=;
        b=I/mJXBuPbqy6CA4N1NfOF1ipfD9FQwfNzsuixJGer71Ou0aQ0G8sT0GcEobyLB55w3
         z7gx/vfUaHPWFwm5KGUSI2Ht3WKDubPrBxBi4xm5446roxL2M1kjiBdZfbmXe6vYyG2n
         Nrz3qybrY/nsELukpqU+tB+etfVSbytojolGsdzg8uaeu83jxRIJc4QjsrhHPpof2a9j
         f/yHcE3X4QW91MTcW5k07t0vBavyqFQN1KXsSuYFzm8nmXJiBUMLORefOfl/jgT371O+
         R4s2tofD6zmG47cP9fBdUh8KL9tzRlZtgDQ7JkqxarIDT1juFlhOmWx2VLjgMM4O7Mo5
         0hbg==
X-Gm-Message-State: AGi0PubU82SRDDaWQ2dr6QLW1VtFZhcz7RcTo8cdcfuo4raP2gU5MWR8
	eWR9jl3mzVhq9YFTBx4XGEtTNaBZvWQ=
X-Google-Smtp-Source: APiQypKs9yaOaIkXgfdZvBCDd7aElyY+1C4beeGs7kC2R9OKGQpfTD4vzT7LAffzryHApH5XcU3RjA==
X-Received: by 2002:a19:e04a:: with SMTP id g10mr5214124lfj.164.1586871389452;
        Tue, 14 Apr 2020 06:36:29 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id o6sm9218344lji.15.2020.04.14.06.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 06:36:28 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v6 06/10] oeqa: wic: Add tests for permissions and change-directory
Date: Tue, 14 Apr 2020 15:36:10 +0200
Message-Id: <20200414133614.1830058-7-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414133614.1830058-1-ricardo@ribalda.com>
References: <20200414133614.1830058-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make sure that the permissions and username are respected when using all
the rootfs modifiers.

Add tests for change-directory command

Cc: Paul Barker <pbarker@konsulko.com>
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

