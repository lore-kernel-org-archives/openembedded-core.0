Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.12740.1587278152971186451
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 23:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mZz9C7EO;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id t14so7929683wrw.12
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2020 23:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/gKvv4UG22f2a0j4YUTGd9JF0HWNg7fQOc0FKfqEWZs=;
        b=mZz9C7EOgpE2PLvjpZSbT0juwwj72VArmTAmh7D0GxDcDmn9VEgirBYQNGety/31PP
         xl/5GuQntdwZO1n4EW/jjQEMnZN+zgZUIpmR+YwPL8ydU9N6D6y2CtZCjcw0lbp2hOuL
         QhdRb+YH6gimmSLf3WOcfbI7JwZ/VH3CBLLdxj1iH6jrwojjvkB3KaikR8T9Cy4muEYp
         w/fqm0AUbbcGzKus8A4itu3a/4+SJQNpr+VWYATaXYlX7GDs35ect0Y95UBW/cfjXhEz
         nnWpuajoCnFGCNw5dHQYILnbmLT7fZNRwygpCsp/5uXYlLz0nXGee8n2qy3vUiK3F9ZG
         Hehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=/gKvv4UG22f2a0j4YUTGd9JF0HWNg7fQOc0FKfqEWZs=;
        b=G4IsfjmSkiqCLX9NEfW/PyVlt/H6ixzoNFKQ6Bl+MszMxOBKkjiqUSPCD2XLrZnk5K
         DYisvYMfmfm811dwWkQRPb2OMhvSQflcfelFnbBCtH/KFkBdr75sDQrieITqmXpFglih
         hhy7fubX09gLfkz0mn+gyEpT1A77GTzW/Vh8OeJXr7vp8aDy7x+sleCNTgu3P9ABx6ki
         XxY1uq4VIM3i1ItTOi/PDptd1+UHfdV4S9YWjdFNII4TVvb09nSCCqpap8e6qRvZJ6z5
         9WApVhj8QSecBWA8BwaAkpPz5L4Ft1tN0NZ7ZLULZYf9SPA2ITUOs7oCfint7suTaBr1
         QEAw==
X-Gm-Message-State: AGi0PuY5ke8lEVD7WhusLHDoRgNUBOVcn2hF1wMJ8fJdPDBRuyigk2db
	Im5+MZFvIxtEdtBv7Efsnk4Psv/EpdA=
X-Google-Smtp-Source: APiQypLSGGvCxwE0K1iqpeh1t6xzeZ5V3urt/WKPJ9/WuBgOR5MIr6FZwukqMNCAEp458WMMFaoAVw==
X-Received: by 2002:a5d:6945:: with SMTP id r5mr13356535wrw.363.1587278151225;
        Sat, 18 Apr 2020 23:35:51 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id n6sm13980266wmc.28.2020.04.18.23.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 23:35:50 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
	Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v7 06/10] oeqa: wic: Add tests for permissions and change-directory
Date: Sun, 19 Apr 2020 08:35:34 +0200
Message-Id: <20200419063539.1467641-7-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200419063539.1467641-1-ricardo@ribalda.com>
References: <20200419063539.1467641-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Make sure that the permissions and username are respected when using all
the rootfs modifiers.

Add tests for change-directory command

Cc: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 90 +++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 626a217e69..41cf23f778 100644
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

