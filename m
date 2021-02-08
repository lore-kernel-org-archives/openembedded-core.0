Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.35376.1612792564351505415
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:56:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ClNVuwFl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id l23so2559691otn.10
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6LA9Z7vl9TIHSAHKKR0aYl7zqVFcz4u48X3GjNFAhIM=;
        b=ClNVuwFl64UyCwdOUz6z6EP5LR1qA4oXM1RWGSQnNSZxQftsQi3OAkzRXk+q8X1epD
         b8ApPVqjKvh1I3a1mktiRgrFOsfLcpgaoGxeIe4i6RZgeL5pfiIKGQ3CMadiJXPAIDhF
         NJNU9CBvLvOl1w0YxmtiGyzvDimuNVkqyujSFxfAWa0mC0KtmuByGUOfTGiPLKkJtrGZ
         BvmLsxK9Zn9bYsbEGE/VjmA15J2m38eYyFzXdT2ipcPPu4Rgl80Lnkrkykj+PP//TbyP
         KNqCQ5SEzjgINUMZnu9QW8TfIj7DsEL/ldZpYLSslhY/si/WzQ9VlRqYFAwe9Wi7QGy5
         5pVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6LA9Z7vl9TIHSAHKKR0aYl7zqVFcz4u48X3GjNFAhIM=;
        b=CrJNVcSEUJsTN12mE1jyzXaldRH+7Vf1lJ0s+RidGOFIoo8qyowndKGtVF+A3gDVUH
         wDxqlX3QAI3Qj3hJVeequ7U60IhoYAUI4KmY1/YvTbEIRnoDKFETzRfnbOz8bNoSrVoX
         MrlE5S2VWg7JMK6VjXWMdjTP1xG78S9SsKdJk522imoyC1QEX8rfelEllYTD/eWt+Nb8
         +Ojs5h9VXkpTjYVYgca+Wn2eSfm2ckLRnn0FOTxVynLer7YFRjEM3K/ey390bqJrQV4g
         TwbF5pgtm6Lph81r2kJKgMmmmq+n2ZRThe8PYgPrW7hP9XrhdJqqs/ouayUUtU3puqEh
         V+zw==
X-Gm-Message-State: AOAM532rZEv2fOum8u1eB6sWOlloKGd+X26ZNEhhUMxkNVW+iDB4IsXq
	Q2GgNHA0HStuYILw3JYcgk2qxDSD12cgd2lK2dM=
X-Google-Smtp-Source: ABdhPJxmBvQmZu311vlKv5XLVXrYAgpl1F28jxYIZPXTK/mEL8LHUHqCOHfqBngYQR0x0J9hBTIxag==
X-Received: by 2002:a05:6830:16cb:: with SMTP id l11mr4389677otr.83.1612792563241;
        Mon, 08 Feb 2021 05:56:03 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.55.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:56:02 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 27/28] oeqa: wic: Add tests for permissions and change-directory
Date: Mon,  8 Feb 2021 03:52:19 -1000
Message-Id: <9853e213090e3e658e5e91cf0bd7c7a0c7da3be2.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Make sure that the permissions and username are respected when using all
the rootfs modifiers.

Add tests for change-directory command

Cc: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4aad9531df44d1b0637bd559161702ad86861b46)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 90 +++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 13b6a0cc72..d4c0db8bda 100644
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
@@ -506,6 +513,89 @@ part /part2 --source rootfs --ondisk mmcblk0 --fstype=ext4 --include-path %s"""
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
+                wks.write("part /etc --source rootfs --fstype=ext4 --change-directory=etc")
+            runCmd("wic create %s -e core-image-minimal -o %s" \
+                                       % (wks_file, self.resultdir))
+
+            part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
+
+            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part1))
+            files = extract_files(res.output)
+            self.assertIn('passwd', files)
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

