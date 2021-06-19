Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.19665.1624096732949252350
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Jun 2021 02:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mZWa7AXD;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id z12so11997626edc.1
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Jun 2021 02:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xhk7+4nZDgjgY+97PVOuh60ns3mRBVA+6Ty6NaZfN18=;
        b=mZWa7AXDlSkq/0tutNry3v95/yQ1oTXQT7KS4NF1NVT0W+73lM17xaYAFWAOHJ5rW2
         OurE+AUCdInGXnrGATNjdKVZfL9XF3mZy4FwUyLuNzP2w5cFfJe8J3tGC33dkfjEdSTD
         9T/stVtJUXrtRryc00KzXhUmr7FfzabSJqQM61fvU6vqHf0W9rQzBE6N5x0NbQlBo5G7
         d6+0Zhjy7C80EWGJXq/Sp4iWeOIlLF+MnqnLd7AJ0eTg7P3XUBRFX5QhQUCh3LhDhs7f
         XIWOvVh3IAx28x40d5EQgIz7/ZkNzJoF+ffSMD54iUD1pCKwGpgdqnJZS49FZBX1AuZN
         DHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xhk7+4nZDgjgY+97PVOuh60ns3mRBVA+6Ty6NaZfN18=;
        b=plUtr5u3KCRHEvQjdlmya7h4ARspQURI7jzHc6M7AC9tUS+5by1xbk0Xo6F9/rdJ4x
         uulTOktPU/cOw678gQ0Q59JnYLozLA+D0lDD/rVK02uAIwEOB7nUfD2ZHUma2vOSu++g
         YtwtVPIRYi/ggEC5EcSWj6/YqUwYL4S2Ox5yVh5KV8tqyIEa79lkUPdhrWw9TdycWedC
         /aEp4DAqBuUgvkVMUoxqqPSDA+FQK88/830iyWwXXd6c17Z1SzvsbFILI6h8EBFp8oEa
         RJFR2SmK+WVJmlpypY9iD9+2ea3WGNikSZ8J6WDimQMrOkzukEWiAZdOkAXPpL1umXoH
         mKHw==
X-Gm-Message-State: AOAM533uPIb2Ax5w7myCJxMjqKZ1w3coP7rb87ms/Odzo5l9EJ7ZObzF
	akPbUvYK7ztGXc4eq3JgaJfXMZljaIE4DA==
X-Google-Smtp-Source: ABdhPJwCuRfcUo2dzorUtghqDs5y/FCc3p2X0n+JrCi5T8p3MCdzY19HK1Y1iByW+2lwBkyeXeFIzg==
X-Received: by 2002:a05:6402:2885:: with SMTP id eg5mr999919edb.73.1624096730978;
        Sat, 19 Jun 2021 02:58:50 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id l11sm7517542edb.3.2021.06.19.02.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 02:58:50 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/3] selftest: do not hardcode /tmp/sdk
Date: Sat, 19 Jun 2021 11:58:43 +0200
Message-Id: <20210619095845.1853470-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This races if there are several copies of the test running at the same
time.

[YOCTO #14438]

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 28 +++++++++-----------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 84c2cb77e8..d0c2440722 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -14,11 +14,6 @@ from oeqa.core.decorator.data import skipIfNotQemu
 
 class TestExport(OESelftestTestCase):
 
-    @classmethod
-    def tearDownClass(cls):
-        runCmd("rm -rf /tmp/sdk")
-        super(TestExport, cls).tearDownClass()
-
     def test_testexport_basic(self):
         """
         Summary: Check basic testexport functionality with only ping test enabled.
@@ -95,19 +90,20 @@ class TestExport(OESelftestTestCase):
         msg = "Couldn't find SDK tarball: %s" % tarball_path
         self.assertEqual(os.path.isfile(tarball_path), True, msg)
 
-        # Extract SDK and run tar from SDK
-        result = runCmd("%s -y -d /tmp/sdk" % tarball_path)
-        self.assertEqual(0, result.status, "Couldn't extract SDK")
+        with tempfile.TemporaryDirectory() as tmpdirname:
+            # Extract SDK and run tar from SDK
+            result = runCmd("%s -y -d %s" % (tarball_path, tmpdirname))
+            self.assertEqual(0, result.status, "Couldn't extract SDK")
 
-        env_script = result.output.split()[-1]
-        result = runCmd(". %s; which tar" % env_script, shell=True)
-        self.assertEqual(0, result.status, "Couldn't setup SDK environment")
-        is_sdk_tar = True if "/tmp/sdk" in result.output else False
-        self.assertTrue(is_sdk_tar, "Couldn't setup SDK environment")
+            env_script = result.output.split()[-1]
+            result = runCmd(". %s; which tar" % env_script, shell=True)
+            self.assertEqual(0, result.status, "Couldn't setup SDK environment")
+            is_sdk_tar = True if tmpdirname in result.output else False
+            self.assertTrue(is_sdk_tar, "Couldn't setup SDK environment")
 
-        tar_sdk = result.output
-        result = runCmd("%s --version" % tar_sdk)
-        self.assertEqual(0, result.status, "Couldn't run tar from SDK")
+            tar_sdk = result.output
+            result = runCmd("%s --version" % tar_sdk)
+            self.assertEqual(0, result.status, "Couldn't run tar from SDK")
 
 
 class TestImage(OESelftestTestCase):
-- 
2.31.1

