Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.810.1622821049980700205
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 08:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ug6NS3Da;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id u24so11619341edy.11
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CPufSZ/5NQwAhSO/HnNri+oUmUr50eB2gWRkT7Ki//0=;
        b=ug6NS3DajgSPGQBhYtnUnjOd/xYKufe/yMKXhFxGRATorDSuvrbzXAxVq0EphE/2Bm
         TKCHX5ZjLEaXosULA64+x0CLC0g25Ig//Bosc6tcWJrnrb/rFil4kN5oy/XY/P07rYoa
         jkRJ7vU4k8X/PtCiuTDSYwI/EOCe7qfbZaBH60bqaStphkwFEINVb31ISarSLkCQw70D
         gK+tpDbjY+GuSjTOuCNT5XfTt5O9//A4IumiBsZOphF+HYULUnrm8UEwIAagvoYlLBy3
         ggjMXA67RwimNHHKmM/80WjkiGju1aBBIH48TcI3tyLREzNlydvBc6ir49absXVfANDC
         kMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CPufSZ/5NQwAhSO/HnNri+oUmUr50eB2gWRkT7Ki//0=;
        b=MhsPxZ9SFkrToVS1U6qjlC23xY8EcqduJiIAW2FND2aaYXj27R1mhRKepyhDAQmn1R
         z1PxV6OK7BEDQis46aeBQzjd8CLxAA4skdjWqPsArfyeDoRuLXt/O/yypjv5MRbXxMVp
         rynJKzC8x3zVfgXbvtOJQRh/mlKsv0MBWEDK3IHcWgflBJGv4FtDZOU1+08HKEx9AbE5
         iV5SJdtk/XI1RFLS4xZF8ou246sO1jEIOtfYXZSr2utralYgzgTwHspSLGSFrLKPvBpT
         VZyxxoqdiAUKEQgbzthYBPEiqXDSlUBGwDyetflVFaLZTc3k+u6IqWmkpr5ZWygmHhsF
         Gx0w==
X-Gm-Message-State: AOAM5320IFh5aDJV9yplGDItCKMefq4jP7fRJbR3yG1+Cq+d6uxr9WtD
	f3DHeoYSWvRoVorrDWoKart0XfICSRcVWu3K
X-Google-Smtp-Source: ABdhPJya8vIhc+g059AmiVpc4orvdi5yej+YzqWMqNCoqcKuF/gF1cePmuftx+PiLsNufWds1uME5g==
X-Received: by 2002:a50:bf0f:: with SMTP id f15mr5166034edk.205.1622821048293;
        Fri, 04 Jun 2021 08:37:28 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id dy19sm3402511edb.68.2021.06.04.08.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 08:37:27 -0700 (PDT)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 3/3] runtime_test.py: add new testimage ptest test case
Date: Fri,  4 Jun 2021 17:37:15 +0200
Message-Id: <20210604153715.1651762-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604153715.1651762-1-adrian.freihofer@siemens.com>
References: <20210604153715.1651762-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new selftest for the ptest imagetest. The new feature
TESTIMAGE_PTEST_REPORT_DIR is verified as well.
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 44 ++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 84c2cb77e8..d85900b2fd 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -238,6 +238,50 @@ class TestImage(OESelftestTestCase):
         bitbake('core-image-minimal')
         bitbake('-c testimage core-image-minimal')
 
+    def test_testimage_ptest(self):
+        """
+        Summary: Verify ptest runtime test
+        Expected: 1. Verify the ptest imagetest executes the ptest-example-ptest.
+                  2. Verify the xml test report is downloaded to the ptest log files.
+        Product: oe-core
+        Author: Adrian Freihofer <adrian.freihofer@siemens.com>
+        """
+        report_subdir = ""
+
+        features = 'DISTRO_FEATURES_append = " ptest"\n'
+        features += 'IMAGE_CLASSES += "testimage"\n'
+        features += 'IMAGE_INSTALL_append = " service-ptest"\n'
+        features += 'IMAGE_FEATURES_append = " ssh-server-dropbear"\n'
+        features += 'TESTIMAGE_PTEST_REPORT_DIR = "/tmp/ptest-xml/*.xml'
+        if report_subdir:
+            features += ':' + report_subdir
+        features += '"\n'
+        features += 'TEST_SUITES = "ping ssh ptest"\n'
+        self.write_config(features)
+
+        self.append_bblayers_config('BBLAYERS_append = " ${TOPDIR}/../meta-skeleton"')
+
+        bitbake('core-image-minimal')
+        bitbake('-c testimage core-image-minimal')
+
+        vars = get_bb_vars(("TEST_LOG_DIR", "WORKDIR", "TOPDIR", "TESTIMAGE_PTEST_REPORT_DIR"), "core-image-minimal")
+
+        test_log_dir = vars["TEST_LOG_DIR"]
+        if not test_log_dir:
+            test_log_dir = os.path.join(vars["WORKDIR"], 'testimage')
+        if not os.path.isabs(test_log_dir):
+            test_log_dir = os.path.join(vars["TOPDIR"], test_log_dir)
+        ptest_log_dir_link = os.path.join(test_log_dir, 'ptest_log')
+
+        ptest_runner_log = os.path.join(ptest_log_dir_link, 'ptest-runner.log')
+        self.assertTrue(os.path.isfile(ptest_runner_log), "%s is not available." % ptest_runner_log)
+
+        if not report_subdir:
+            report_subdir = 'reports'
+        ptest_example_log = os.path.join(ptest_log_dir_link, report_subdir, 'skeleton-test.xml')
+        self.assertTrue(os.path.isfile(ptest_example_log), "%s is not available." % ptest_example_log)
+
+
 class Postinst(OESelftestTestCase):
 
     def init_manager_loop(self, init_manager):
-- 
2.31.1

