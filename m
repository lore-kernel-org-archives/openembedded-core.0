Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9ECFC47422
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:38:29 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.8504.1706323100235443119
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:38:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=C4I5rTiL;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.174, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc226dca91aso1005884276.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323099; x=1706927899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVjhpG/Sekxv77xLjJl/SjzHd9C8WsceJ5/tsK909Og=;
        b=C4I5rTiLQrRipFU2rD0HSf8Xup7HzEtP3hheFugIZx5xAtYdmExtCs384cBqqxnLVz
         EG4NXmzAZMrcScdvWyyukf98jYcTTOXkSUx8oRUa6aOvHVWHQxoad6HH80Z97zxkxyE1
         ch8+Q3cmpRUt6xxl8NatHPPT7X/n6zENg/OVa9OaQNFMjHc8nslwuhvmlxRMjgW18j/n
         whY0baW9gCTfj9Z/cvZ4ZbbAWUdLoKoJFjld9ry5prkjAhPHt/QkPWynW25bl8XAsMbZ
         WjeLcCVk4AKaOtSfzUdHSfHaH/PqaX9Ik8TnhWfNJNjoesQ2M/E6qKNNtD5OIY0LVxEU
         YaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323099; x=1706927899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVjhpG/Sekxv77xLjJl/SjzHd9C8WsceJ5/tsK909Og=;
        b=cP6pZK9De8vJuDW27XUVsNHnx6QASKBTK2OHaDscXc9lu3Wywh8rOFYPU1WyXu2tkO
         navg9JEsnqfiJC1u1kKCxS+18nN3CZtwzjT+cc0lEZqtmS4/OdDHOkbxzTe/Z+WW6cGj
         wyY0y99E7bx5dFRRmnmE+3bYRsXfWtuJ++1RegY0Z+P68S5dXSmNtSAOYO3DHchMP7UP
         nUfNb/+LwJ0NdHGloIOdy0nd94lBkIS0us0dLIKx+Peu3n4HWBGsBeG4MP9lt7W4Sd0b
         CAcKcBjSnXD9CUeJg/t/glkVEfpfVgahi0lixuXPSKzoLki5rew5af9AgPwnfkKA9Fdq
         Ai+w==
X-Gm-Message-State: AOJu0YzEQRfkzIZ7Squ5Prq8Do2zmH/DfdOw//ErVPura67DQ0S5qF17
	MDS9o3YbSWN7rGr2+wI33PzQrH8N7e8mWzZMJObEsy63Dankzjtk9O9+kQuG4VxlwLuMbw8Wvjr
	B2osl/g==
X-Google-Smtp-Source: AGHT+IGjmh1iUwt3dw+apC6uO9HiGVO31R/J/vk14uL28KIFsvJzomME9jeOylyaZe/2+l8/6jEdxg==
X-Received: by 2002:a81:6dcb:0:b0:602:9c0a:3289 with SMTP id i194-20020a816dcb000000b006029c0a3289mr874005ywc.54.1706323099097;
        Fri, 26 Jan 2024 18:38:19 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.38.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:38:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 22/23] oeqa/selftest/prservice: Improve test robustness
Date: Fri, 26 Jan 2024 16:37:30 -1000
Message-Id: <81d7011a793de2548c573ebb84f60fb80a357bed.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194431

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The tests were not cleaning up after themselves and making assumptions about
memory resident bitbake being stopped by the scripts.

Add cleanup logic to ensure the tests don't break other things and
clean up created files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 692dd762a0c817797c28381c6169205fbaeb2705)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/prservice.py | 31 +++++++++++++++++------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index 9fe3b80a31..8da3739c57 100644
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
2.34.1


