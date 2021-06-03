Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web08.219.1622740938696868984
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 10:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BuG03kx8;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id r11so7986721edt.13
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 10:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZVciVGWwWOxRg6hpcw+o+R4gU7szakn27rmXCrqAu/s=;
        b=BuG03kx8lwxztCbVMc5NzvUd0davud2Ckk8ms7G1N0/2JLTz/YD0RCxqYHbVcsZGQB
         bbruCpvHGjfIUyT3A46g2agZ7XcJyenHo/N1Zzj9Pb4m6eo9hDz40BoVKQJlB5z13gDP
         n1A0vrz462O704EcHoIKvyHOkGL9v1n8/xbrIX6v9aBRLzj5VYc2OKxx6F6yY22KTZ1/
         DUtonv5TwRfEFfJ93H3Kf0Zes2s8ueRJ2R7nS9E28AVGLqIotvoO3dcmPi2kP5Fbxx3f
         bIU5Zf+mFE+FjnZbmmjkRXmb07dM0587cAgbKuek4ADXFcNKD4UKh0VDfTM2AB9QJ0a7
         jqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZVciVGWwWOxRg6hpcw+o+R4gU7szakn27rmXCrqAu/s=;
        b=PToZ1e1Tcb9x6bAFLRKIQGhUBqf6Mz1ARWVybB3IDSjiNpAN/OLE8TN/MdxvR4j1Bi
         NTIpmrFb5kKl9Yy7GNwmaG9G0WRUhXUdFCRh8SP5tI4F3G62oW7JTcjGE4q0ZQP9sWdf
         FfRlkG9T6fLknd51xun7PSECih/WWs4eIcbD60gdx5dynyMukXjM/pQPTdnJuCnKKJRS
         op18/SWcsfN5lTle89ACzeYAGGEGo1rhd+vwNar+0qHH2d6agUrmWA3aZ+Oz9QCfw+b5
         5GXeq6yU+SjH8t2b37dnj7AErtfrdmlDXuG1trzWw+Qr9O6avr8/zoNqITQCBMyJth37
         qv5A==
X-Gm-Message-State: AOAM531+oidj/lNRu931vutKfrlMTPhAbjNfmVy1zOapvi/acO2Ku3fz
	dPYByTTbFFn/Tzb658Cf1qoQGGFdJFAg4RbO
X-Google-Smtp-Source: ABdhPJxTXifdkKE+LRl6e7iFf+CbU043sDApHEtf2pjmJLP9tH2wchGDPMde95hCFbr4okpICu2M4A==
X-Received: by 2002:aa7:cb8d:: with SMTP id r13mr603203edt.184.1622740937108;
        Thu, 03 Jun 2021 10:22:17 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.lan.ffah.ch ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id g4sm2054187edw.8.2021.06.03.10.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 10:22:16 -0700 (PDT)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/3] runtime_test.py: add new testimage ptest test case
Date: Thu,  3 Jun 2021 19:21:49 +0200
Message-Id: <20210603172149.100248-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603172149.100248-1-adrian.freihofer@siemens.com>
References: <20210603172149.100248-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new selftest for the ptest imagetest. The new feature
TESTIMAGE_PTEST_REPORT_DIR is verified as well.
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 44 ++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 84c2cb77e8..2ef100f684 100644
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
+        features += 'IMAGE_INSTALL_append = " ptest-example-ptest"\n'
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
+        ptest_example_log = os.path.join(ptest_log_dir_link, report_subdir, 'ptest-example.xml')
+        self.assertTrue(os.path.isfile(ptest_example_log), "%s is not available." % ptest_example_log)
+
+
 class Postinst(OESelftestTestCase):
 
     def init_manager_loop(self, init_manager):
-- 
2.31.1

