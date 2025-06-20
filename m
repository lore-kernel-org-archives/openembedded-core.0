Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E266C71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 14:31:45 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.1619.1750429897979096849
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 07:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I+nLLQuX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so19997125e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 07:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750429895; x=1751034695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vM8wWXKNKcz2C++gQIgcUOh+EkaCrUQghyhFIyniblY=;
        b=I+nLLQuX/BLrw3afQsYKdsU8dUVlspBLLdgVldAc7SORkT6zCHHsrZ/7K/OceEyjE2
         A/AJkN5KpnVs1V6jRtNJKU/UnXQHd3PPuWeNLwE4UStZKtRIxoyMagfxMwS+yOIsZ95m
         Yh3Islog5f6I/e8DHhlMVWbvfnGOJKbyeQ8Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750429895; x=1751034695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vM8wWXKNKcz2C++gQIgcUOh+EkaCrUQghyhFIyniblY=;
        b=QOT61ek+4ObwrbIaCT+mBJ7o/qBqrbdUbtylzCeIjs3kkwmUv9tEMQ+oE1qBcMrBds
         k8N+TsNZ20x6ErV7hun+OPtJMTCqvt8Aj3teU2G1gKkFd4s1P7ye1gSDZNdJ0AfiWkG8
         aSKeoX8UP0HQXvvoMVbo0GehT2kIyDAWbM13JCo45yOY1nfjfxf+guyVVKl92dmxj3My
         DM2cBlPCmzc3F49SF1sGuMaUxlO5bSbh+X/ebBu0e/VyvpDW4Ee8b52ZPmBd6+S4I79G
         pAwlOClbsn3+KYpRAyiOl3VVMYZu05S4NVAVMBIYzQRntnq9j+mhG7b6TiuFbo5PBbXC
         K7HQ==
X-Gm-Message-State: AOJu0YybAltD12e9vSFglphZKz2IWmcEu+I6PrNMZRNDkM0fwJZhuLUT
	vXzDsftrNZx5MC1TgLtNWuHtuTm0TKv6odh91ChqfwH1W3Z1FcTnZLCLlGcQPkiIKQq91SMqQp9
	c30ieuzk=
X-Gm-Gg: ASbGncsel8mkeTZzqhcefjZAioSDfvIIise1w6HjAgnJn50wo7U+0Rr/ZlnpLOrfPhX
	xgTfNPPUWH25h8Vz395OTkO6JSbtWQCu+YCts+DsJ+t32AdRsxK3OzfdTqau+br4ScJB8+v4YRT
	K0IARsjV9xS5ijFqWiGpjJ7mcAH9lSCL/h3r0xsVHROpJ4X8/9w71bTSXuBe8pDxLqG9Vpf93kn
	4PyqDMK0XF6dWjxDkD5zxGDwhRW1jx70T1060coKrW3Qh5qyBHGMRNbCDzgv1ZG3259s/+/efH5
	QOhBxFnrwzA4ZgFV4wzWotGPqmHmP4kCMt9nbzjmRusZRRP7YeJUEv+iZF9O5vQO5x3V67+fU+0
	xnpn6E5PCfu3r35I=
X-Google-Smtp-Source: AGHT+IFpL17C9R5y3gU25kTNuYatevbngFiQqCcuGwigVx4Jfbj3eiRxiBIVq2UoLq4nr/WnOydaQQ==
X-Received: by 2002:a05:6000:5c2:b0:3a5:298a:3214 with SMTP id ffacd0b85a97d-3a6d27cf386mr2451873f8f.13.1750429895289;
        Fri, 20 Jun 2025 07:31:35 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b606:370e:6752:7b3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f104bbsm2261291f8f.4.2025.06.20.07.31.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 07:31:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/buildhistory: Move test cases to common location
Date: Fri, 20 Jun 2025 15:31:33 +0100
Message-ID: <20250620143133.2515209-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 14:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219127

Having the test cases split in different places makes no sense. Move them
all to the place you'd expect to find them. Drop the base class as it
is no longer needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/buildhistory.py | 61 ++++++++++++++++++--
 meta/lib/oeqa/selftest/cases/buildoptions.py | 38 ------------
 meta/lib/oeqa/selftest/cases/oescripts.py    | 24 --------
 3 files changed, 57 insertions(+), 66 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildhistory.py b/meta/lib/oeqa/selftest/cases/buildhistory.py
index 2d559949160..511c666554f 100644
--- a/meta/lib/oeqa/selftest/cases/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/buildhistory.py
@@ -9,10 +9,10 @@ import re
 import datetime
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, get_bb_vars
+from oeqa.utils.commands import bitbake, get_bb_vars, get_bb_var, runCmd
 
 
-class BuildhistoryBase(OESelftestTestCase):
+class BuildhistoryTests(OESelftestTestCase):
 
     def config_buildhistory(self, tmp_bh_location=False):
         bb_vars = get_bb_vars(['USER_CLASSES', 'INHERIT'])
@@ -48,5 +48,58 @@ class BuildhistoryBase(OESelftestTestCase):
         else:
             self.assertEqual(result.status, 0, msg="Command 'bitbake %s' has failed unexpectedly: %s" % (target, result.output))
 
-    # No tests should be added to the base class.
-    # Please create a new class that inherit this one, or use one of those already available for adding tests.
+
+    def test_buildhistory_basic(self):
+        self.run_buildhistory_operation('xcursor-transparent-theme')
+        self.assertTrue(os.path.isdir(get_bb_var('BUILDHISTORY_DIR')), "buildhistory dir was not created.")
+
+    def test_buildhistory_buildtime_pr_backwards(self):
+        target = 'xcursor-transparent-theme'
+        error = "ERROR:.*QA Issue: Package version for package %s went backwards which would break package feeds \(from .*-r1.* to .*-r0.*\)" % target
+        self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
+        self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True, error_regex=error)
+
+    def test_fileinfo(self):
+        self.config_buildhistory()
+        bitbake('hicolor-icon-theme')
+        history_dir = get_bb_var('BUILDHISTORY_DIR_PACKAGE', 'hicolor-icon-theme')
+        self.assertTrue(os.path.isdir(history_dir), 'buildhistory dir was not created.')
+
+        def load_bh(f):
+            d = {}
+            for line in open(f):
+                split = [s.strip() for s in line.split('=', 1)]
+                if len(split) > 1:
+                    d[split[0]] = split[1]
+            return d
+
+        data = load_bh(os.path.join(history_dir, 'hicolor-icon-theme', 'latest'))
+        self.assertIn('FILELIST', data)
+        self.assertEqual(data['FILELIST'], '/usr/share/icons/hicolor/index.theme')
+        self.assertGreater(int(data['PKGSIZE']), 0)
+
+        data = load_bh(os.path.join(history_dir, 'hicolor-icon-theme-dev', 'latest'))
+        if 'FILELIST' in data:
+            self.assertEqual(data['FILELIST'], '/usr/share/pkgconfig/default-icon-theme.pc')
+        self.assertGreater(int(data['PKGSIZE']), 0)
+
+    def test_buildhistory_diff(self):
+        target = 'xcursor-transparent-theme'
+        self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
+        self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True)
+        result = runCmd("oe-pkgdata-util read-value PKGV %s" % target)
+        pkgv = result.output.rstrip()
+        result = runCmd("buildhistory-diff -p %s" % get_bb_var('BUILDHISTORY_DIR'))
+        expected_endlines = [
+            "xcursor-transparent-theme-dev: RRECOMMENDS: removed \"xcursor-transparent-theme (['= %s-r1'])\", added \"xcursor-transparent-theme (['= %s-r0'])\"" % (pkgv, pkgv),
+            "xcursor-transparent-theme-staticdev: RDEPENDS: removed \"xcursor-transparent-theme-dev (['= %s-r1'])\", added \"xcursor-transparent-theme-dev (['= %s-r0'])\"" % (pkgv, pkgv)
+        ]
+        for line in result.output.splitlines():
+            for el in expected_endlines:
+                if line.endswith(el):
+                    expected_endlines.remove(el)
+                    break
+            else:
+                self.fail('Unexpected line:\n%s\nExpected line endings:\n  %s' % (line, '\n  '.join(expected_endlines)))
+        if expected_endlines:
+            self.fail('Missing expected line endings:\n  %s' % '\n  '.join(expected_endlines))
\ No newline at end of file
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index b509bcf951c..767e19bd887 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -10,7 +10,6 @@ import glob as g
 import shutil
 import tempfile
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.selftest.cases.buildhistory import BuildhistoryBase
 from oeqa.core.decorator.data import skipIfMachine
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
 import oeqa.utils.ftools as ftools
@@ -139,43 +138,6 @@ class SanityOptionsTest(OESelftestTestCase):
 
         self.assertNotIn(err, ret.output)
 
-
-class BuildhistoryTests(BuildhistoryBase):
-
-    def test_buildhistory_basic(self):
-        self.run_buildhistory_operation('xcursor-transparent-theme')
-        self.assertTrue(os.path.isdir(get_bb_var('BUILDHISTORY_DIR')), "buildhistory dir was not created.")
-
-    def test_buildhistory_buildtime_pr_backwards(self):
-        target = 'xcursor-transparent-theme'
-        error = "ERROR:.*QA Issue: Package version for package %s went backwards which would break package feeds \(from .*-r1.* to .*-r0.*\)" % target
-        self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
-        self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True, error_regex=error)
-
-    def test_fileinfo(self):
-        self.config_buildhistory()
-        bitbake('hicolor-icon-theme')
-        history_dir = get_bb_var('BUILDHISTORY_DIR_PACKAGE', 'hicolor-icon-theme')
-        self.assertTrue(os.path.isdir(history_dir), 'buildhistory dir was not created.')
-
-        def load_bh(f):
-            d = {}
-            for line in open(f):
-                split = [s.strip() for s in line.split('=', 1)]
-                if len(split) > 1:
-                    d[split[0]] = split[1]
-            return d
-
-        data = load_bh(os.path.join(history_dir, 'hicolor-icon-theme', 'latest'))
-        self.assertIn('FILELIST', data)
-        self.assertEqual(data['FILELIST'], '/usr/share/icons/hicolor/index.theme')
-        self.assertGreater(int(data['PKGSIZE']), 0)
-
-        data = load_bh(os.path.join(history_dir, 'hicolor-icon-theme-dev', 'latest'))
-        if 'FILELIST' in data:
-            self.assertEqual(data['FILELIST'], '/usr/share/pkgconfig/default-icon-theme.pc')
-        self.assertGreater(int(data['PKGSIZE']), 0)
-
 class ArchiverTest(OESelftestTestCase):
     def test_arch_work_dir_and_export_source(self):
         """
diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index bfbc33b08d1..3f9899b2894 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -9,33 +9,9 @@ import shutil
 import importlib
 import unittest
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.selftest.cases.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.utils import CommandError
 
-class BuildhistoryDiffTests(BuildhistoryBase):
-
-    def test_buildhistory_diff(self):
-        target = 'xcursor-transparent-theme'
-        self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
-        self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True)
-        result = runCmd("oe-pkgdata-util read-value PKGV %s" % target)
-        pkgv = result.output.rstrip()
-        result = runCmd("buildhistory-diff -p %s" % get_bb_var('BUILDHISTORY_DIR'))
-        expected_endlines = [
-            "xcursor-transparent-theme-dev: RRECOMMENDS: removed \"xcursor-transparent-theme (['= %s-r1'])\", added \"xcursor-transparent-theme (['= %s-r0'])\"" % (pkgv, pkgv),
-            "xcursor-transparent-theme-staticdev: RDEPENDS: removed \"xcursor-transparent-theme-dev (['= %s-r1'])\", added \"xcursor-transparent-theme-dev (['= %s-r0'])\"" % (pkgv, pkgv)
-        ]
-        for line in result.output.splitlines():
-            for el in expected_endlines:
-                if line.endswith(el):
-                    expected_endlines.remove(el)
-                    break
-            else:
-                self.fail('Unexpected line:\n%s\nExpected line endings:\n  %s' % (line, '\n  '.join(expected_endlines)))
-        if expected_endlines:
-            self.fail('Missing expected line endings:\n  %s' % '\n  '.join(expected_endlines))
-
 @unittest.skipUnless(importlib.util.find_spec("cairo"), "Python cairo module is not present")
 class OEPybootchartguyTests(OESelftestTestCase):
 

