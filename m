Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB236C0F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 23:26:42 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id q18so15820752wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 15:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=131YgH5X4083V741S8XiGMuKKimZFWkENgnuMu1MYTM=;
	b=kQwDG9u2wrxj4jYhwvUXBz08I8ZhmycWJ6LK4ZGPzMaoXtX1XUHv2kU1asLYoUzUi7
	tUTWGw0YcWkNBvixxWJ8TPn0VaIObo1aMyHv1VUFKnQB4zc5Ieq6Ci6qLsYjz462C7K8
	uyTBw+vPfeNKpqf+w6NMOIwPZwo8TxxVXxwmK8MPEf11cw2AGJ+PZ7OsJT3pAOx2az0s
	JQAGj4jryJv9BwbN3HQvwYTLuiSuRBFwnpjWlpX8i83m24kifs6QSfR3dNse2nwLH3sH
	tDHY6sqpOI+h3nQsMBa1IugQvK6yJHw0BT9Ym7MPhozEO4IyZZqFG0Q7Nc9pLSoGao9V
	BJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=131YgH5X4083V741S8XiGMuKKimZFWkENgnuMu1MYTM=;
	b=W6Cm6JbSxKbQX/i4ga69x3jZVEUHkG7eAuDom1RdCLYwJtS67r8sWia/6vBhfw/nb+
	S1SDTMaZZ8/DQ37B0W/GkWmZtZ6s2j8q73JpGee9O8xOiCe3LCqFFpkniX1ZnkZKupvP
	Kp2alWGT7z15MA0aJ7LTfVGiSxvKk+9gXEYBgIivFfzNJoiPReBxG7963j0/KBhPWmoY
	1mBHo9HIod/e2xxDgDYNWC6pHCzYT2P/kq52RxWQ14LCiyhGHAHqMje4tUfPS8NIMl9v
	6sdHLZleClWZ/3Q4VXCkYAtFEhNQZQ0p1dZH9qALBFELJBQXlZFj224eiJQCTAdQr2y6
	4gVw==
X-Gm-Message-State: AA+aEWbYRh7EdwXuMfbv2H2Z5yNpZEq35ScF5YV9VzwYI1Fl02do2Ww4
	mN+eT4y8N8dkshdQP9dEPHEoCREXy2w=
X-Google-Smtp-Source: AFSGD/UH9h8cF5qs4mvoY1kya5WnRfIF+MxZMnewJ4QwwuzdQ1KqRcjg4m7EqnSRYzw66rLPRqblDA==
X-Received: by 2002:adf:ea11:: with SMTP id q17mr14600302wrm.328.1544570802858;
	Tue, 11 Dec 2018 15:26:42 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v19sm30194595wrd.46.2018.12.11.15.26.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 15:26:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2018 23:26:35 +0000
Message-Id: <20181211232636.13113-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181211232636.13113-1-ross.burton@intel.com>
References: <20181211232636.13113-1-ross.burton@intel.com>
Subject: [PATCH V2 4/5] oeqa/sdk: rewrite lzip test
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Dec 2018 23:26:42 -0000

Don't use the helper class as it gets in the way more than it helps, exercise
the out-of-tree paths, and verify the installed files match the expected
architecture.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/cases/buildlzip.py | 61 +++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib/oeqa/sdk/cases/buildlzip.py
index b57fbbece7f..a7ca239fb49 100644
--- a/meta/lib/oeqa/sdk/cases/buildlzip.py
+++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
@@ -1,39 +1,34 @@
-import unittest
+import os, tempfile, subprocess, unittest
 from oeqa.sdk.case import OESDKTestCase
-from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
-
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
 
 class BuildLzipTest(OESDKTestCase):
-    td_vars = ['DATETIME']
-
-    @classmethod
-    def setUpClass(self):
-        dl_dir = self.td.get('DL_DIR', None)
-
-        self.project = SDKBuildProject(self.tc.sdk_dir + "/lzip/", self.tc.sdk_env,
-                        "http://downloads.yoctoproject.org/mirror/sources/lzip-1.19.tar.gz",
-                        self.tc.sdk_dir, self.td['DATETIME'], dl_dir=dl_dir)
-        self.project.download_archive()
-
-    def setUp(self):
-        machine = self.td.get("MACHINE")
-
-        if not (self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine) or
-                self.tc.hasHostPackage("^gcc-", regex=True)):
-            raise unittest.SkipTest("SDK doesn't contain a cross-canadian toolchain")
-
+    """
+    Test that "plain" compilation works, using just $CC $CFLAGS etc.
+    """
     def test_lzip(self):
-        self.assertEqual(self.project.run_configure(), 0,
-                        msg="Running configure failed")
-
-        self.assertEqual(self.project.run_make(), 0,
-                        msg="Running make failed")
-
-        self.assertEqual(self.project.run_install(), 0,
-                        msg="Running make install failed")
-
-    @classmethod
-    def tearDownClass(self):
-        self.project.clean()
+        with tempfile.TemporaryDirectory(prefix="lzip", dir=self.tc.sdk_dir) as testdir:
+            dl_dir = self.td.get('DL_DIR', None)
+            tarball = self.fetch(testdir, dl_dir, "http://downloads.yoctoproject.org/mirror/sources/lzip-1.19.tar.gz")
+
+            dirs = {}
+            dirs["source"] = os.path.join(testdir, "lzip-1.19")
+            dirs["build"] = os.path.join(testdir, "build")
+            dirs["install"] = os.path.join(testdir, "install")
+
+            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
+            self.assertTrue(os.path.isdir(dirs["source"]))
+            os.makedirs(dirs["build"])
+
+            cmd = """cd {build} && \
+                     {source}/configure --srcdir {source} \
+                     CXX="$CXX" \
+                     CPPFLAGS="$CPPFLAGS" \
+                     CXXFLAGS="$CXXFLAGS" \
+                     LDFLAGS="$LDFLAGS" \
+                  """
+            self._run(cmd.format(**dirs))
+            self._run("cd {build} && make -j".format(**dirs))
+            self._run("cd {build} && make install DESTDIR={install}".format(**dirs))
+            self.check_elf(os.path.join(dirs["install"], "usr", "local", "bin", "lzip"))
-- 
2.11.0


