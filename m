Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0DEC46CD2
	for <webhook@archiver.kernel.org>; Sun, 24 Dec 2023 08:33:36 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.23723.1703406807516889427
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Dec 2023 00:33:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h0oHGCbH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d557541e5so957515e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Dec 2023 00:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703406805; x=1704011605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pYOJXO1faAro+gY2q2LujTCsslrqZBSEPViHlYY9H9s=;
        b=h0oHGCbHFF1ytw4DVUcQ0cM10evL1wfiFU78zbmezkd1+aIQtDZdWreL+0bFNH6EJh
         sJFlPvUg98XQywyuCCsevAKZTVpHl0HkkYqSDm98NME4RjXganU8ql8olOEXBz3sG08x
         URQ0MVC0fCd4/VdZB9nuoNAoLPj0ENlkGFCOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703406805; x=1704011605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pYOJXO1faAro+gY2q2LujTCsslrqZBSEPViHlYY9H9s=;
        b=w1ToJMCkrmdLhLxdYa3M5CEyQ7sQbPRy0BE0QiTQRP5oG/2OUFlKPSvMTw5DRcCgJ7
         hu0X0h6fxULWsLVPCm1U+uUEKnCdTWWCgFMOsqysH47SA7ny0PTY/KSAoySGyb68rl2r
         ds96JEaBgDhl6nA7ANwiIGLlHxP9iXmZMlUp18PudgkMty8VDp+KxlhhopVfEEmn+HWG
         tT0j6SmfFDkT93EHmC3us1ycicn7bccNE19l4qsXVNkdQOyix8mJ8LbRLmc4RYqFHkfe
         moOpfltj0CCC+Ed93R6rXaXMbzpZmIyU93Dhs1/FW2WrdZB41naLG8kHAYCmynsx4Taf
         6y4g==
X-Gm-Message-State: AOJu0Yzgnje07pASaqRHakZFPowudTaSoTZLpPHMNAbEweVbXkj7uR0H
	OHKpZGC5/l4RLq1pwWOzsLbqATOzzePq7K95sndCO29eBHY=
X-Google-Smtp-Source: AGHT+IH1kUCr1OkF5mN6hM4U2U2TV9tQfzrKmEAAc4O9ViCk/hO9a/KguL37ldtHwnxjJLFjeV9PZA==
X-Received: by 2002:a7b:c8d0:0:b0:40d:3791:5992 with SMTP id f16-20020a7bc8d0000000b0040d37915992mr2592156wml.153.1703406805022;
        Sun, 24 Dec 2023 00:33:25 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1c79:d2f:79ae:73e3])
        by smtp.gmail.com with ESMTPSA id w20-20020a05600c475400b0040b4fca8620sm20900742wmo.37.2023.12.24.00.33.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 00:33:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/prservice: Improve test robustness
Date: Sun, 24 Dec 2023 08:33:23 +0000
Message-Id: <20231224083323.4184923-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Dec 2023 08:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192890

The tests were not cleaning up after themselves and making assumptions about
memory resident bitbake being stopped by the scripts.

Add cleanup logic to ensure the tests don't break other things and
clean up created files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/prservice.py | 31 +++++++++++++++++------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index 9fe3b80a31e..8da3739c57f 100644
--- a/meta/lib/oeqa/selftest/cases/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -14,6 +14,8 @@ from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.utils.network import get_free_port
 
+import bb.utils
+
 class BitbakePrTests(OESelftestTestCase):
 
     @classmethod
@@ -21,6 +23,16 @@ class BitbakePrTests(OESelftestTestCase):
         super(BitbakePrTests, cls).setUpClass()
         cls.pkgdata_dir = get_bb_var('PKGDATA_DIR')
 
+        cls.exported_db_path = os.path.join(cls.builddir, 'export.inc')
+        cls.current_db_path = os.path.join(get_bb_var('PERSISTENT_DIR'), 'prserv.sqlite3')
+
+    def cleanup(self):
+        # Ensure any memory resident bitbake is stopped
+        bitbake("-m")
+        # Remove any existing export file or prserv database
+        bb.utils.remove(self.exported_db_path)
+        bb.utils.remove(self.current_db_path + "*")
+
     def get_pr_version(self, package_name):
         package_data_file = os.path.join(self.pkgdata_dir, 'runtime', package_name)
         package_data = ftools.read_file(package_data_file)
@@ -49,6 +61,7 @@ class BitbakePrTests(OESelftestTestCase):
         self.assertEqual(res.status, 0, msg=res.output)
 
     def config_pr_tests(self, package_name, package_type='rpm', pr_socket='localhost:0'):
+        self.cleanup()
         config_package_data = 'PACKAGE_CLASSES = "package_%s"' % package_type
         self.write_config(config_package_data)
         config_server_data = 'PRSERV_HOST = "%s"' % pr_socket
@@ -68,24 +81,24 @@ class BitbakePrTests(OESelftestTestCase):
         self.assertTrue(pr_2 - pr_1 == 1, "New PR %s did not increment as expected (from %s), difference should be 1" % (pr_2, pr_1))
         self.assertTrue(stamp_1 != stamp_2, "Different pkg rev. but same stamp: %s" % stamp_1)
 
+        self.cleanup()
+
     def run_test_pr_export_import(self, package_name, replace_current_db=True):
         self.config_pr_tests(package_name)
 
         self.increment_package_pr(package_name)
         pr_1 = self.get_pr_version(package_name)
 
-        exported_db_path = os.path.join(self.builddir, 'export.inc')
-        export_result = runCmd("bitbake-prserv-tool export %s" % exported_db_path, ignore_status=True)
+        export_result = runCmd("bitbake-prserv-tool export %s" % self.exported_db_path, ignore_status=True)
         self.assertEqual(export_result.status, 0, msg="PR Service database export failed: %s" % export_result.output)
-        self.assertTrue(os.path.exists(exported_db_path), msg="%s didn't exist, tool output %s" % (exported_db_path, export_result.output))
+        self.assertTrue(os.path.exists(self.exported_db_path), msg="%s didn't exist, tool output %s" % (self.exported_db_path, export_result.output))
 
         if replace_current_db:
-            current_db_path = os.path.join(get_bb_var('PERSISTENT_DIR'), 'prserv.sqlite3')
-            self.assertTrue(os.path.exists(current_db_path), msg="Path to current PR Service database is invalid: %s" % current_db_path)
-            os.remove(current_db_path)
+            self.assertTrue(os.path.exists(self.current_db_path), msg="Path to current PR Service database is invalid: %s" % self.current_db_path)
+            os.remove(self.current_db_path)
 
-        import_result = runCmd("bitbake-prserv-tool import %s" % exported_db_path, ignore_status=True)
-        os.remove(exported_db_path)
+        import_result = runCmd("bitbake-prserv-tool import %s" % self.exported_db_path, ignore_status=True)
+        #os.remove(self.exported_db_path)
         self.assertEqual(import_result.status, 0, msg="PR Service database import failed: %s" % import_result.output)
 
         self.increment_package_pr(package_name)
@@ -93,6 +106,8 @@ class BitbakePrTests(OESelftestTestCase):
 
         self.assertTrue(pr_2 - pr_1 == 1, "New PR %s did not increment as expected (from %s), difference should be 1" % (pr_2, pr_1))
 
+        self.cleanup()
+
     def test_import_export_replace_db(self):
         self.run_test_pr_export_import('m4')
 
-- 
2.39.2


