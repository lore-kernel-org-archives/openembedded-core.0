Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5D70B6C0ED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 23:26:43 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p4so15829062wrt.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 15:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DNYgDTooI6toGRXeXblb1adi6OCjcs1VdsZuUOnugso=;
	b=nlopY0R6iwPWTl7RAV3k/tQTwDS7ZRxfHToXkgb9vEZZ8BDBDcm4GnS70G3d2LIyNC
	V8QToX32wq/01wRPmGbY9fy8m0G7/Z60IYG/Y81c71o8nlyk/X8MjEjxMjCU37o3stvj
	MoEgLwOPEBIcd3EHOOdrjrJ+B4SJP6E1QyV/cZCxNYi4NHVZBDN3geEhwJJjGL3UHRe+
	pAYTAywi/TvUZN7znd/Djp5I2IJibDOFPbpudGtLut3V/Jdi+N08t3E1QDH4jqcsUsUn
	t6ZZsgZXQPXo6c91cjDmGw/O5a1dueA2kRLFskuYIP21R90dHJ8dYweODlELZAFnJN/n
	mxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DNYgDTooI6toGRXeXblb1adi6OCjcs1VdsZuUOnugso=;
	b=bfWCED33kBKqG0n3pIVAwt+ZYFsABv4YGepRKNoyfzbefTZRUWknyLU4MyurACD0Pa
	Y3kye5qpOjzpHYUMgx/KQ4Sb8gCg56OuHkn+7YzGeRBCgQs7sKuH1AvUJiPA62sxMugR
	mPaDmBx5IpNtikQ0qfhSrXzzQAZvu8Wps1YNxxQP+4powqOF7yDCnDQELsdTO3S95GAO
	CsOToAny+8Rv0oZWhnVHo27OZfAYCVxQVtYsayC2uMSKDp4ZGE68HbKFMvQvsqT8yKxC
	kJw932ybpo6f44D0uFDehgzuFQZccxDHKgo3bbgMpcAU7kidXyWUtQwZQhMfsyEWI6Hj
	pjRQ==
X-Gm-Message-State: AA+aEWZtuOtF5sTroieBYNkLVU/DypE9jmT2G+4oudQKmZqzOhToUdQ/
	u4NRT7psZd2phdIV+6RQNfW/ZfrQMOw=
X-Google-Smtp-Source: AFSGD/W4SxgnEQX1NZK2HSgqxzVXHImlvS+bGNmv60wU1c0MPRtCz8ZWLwQ5QUZQVV9W+0L51e3saw==
X-Received: by 2002:a05:6000:1287:: with SMTP id
	f7mr16062697wrx.302.1544570803783; 
	Tue, 11 Dec 2018 15:26:43 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v19sm30194595wrd.46.2018.12.11.15.26.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 15:26:43 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2018 23:26:36 +0000
Message-Id: <20181211232636.13113-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181211232636.13113-1-ross.burton@intel.com>
References: <20181211232636.13113-1-ross.burton@intel.com>
Subject: [PATCH V2 5/5] oeqa/sdk: rewrite cpio test
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
X-List-Received-Date: Tue, 11 Dec 2018 23:26:43 -0000

Don't use the helper class as it gets in the way more than it helps, exercise
the out-of-tree paths, and verify the installed files match the expected
architecture.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/cases/buildcpio.py | 49 ++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index 6697b12de29..ff3e1347d37 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -1,37 +1,32 @@
+import os
+import tempfile
+import subprocess
 import unittest
-from oeqa.sdk.case import OESDKTestCase
-from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
 
+from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
 
 class BuildCpioTest(OESDKTestCase):
-    td_vars = ['DATETIME']
-
-    @classmethod
-    def setUpClass(self):
-        dl_dir = self.td.get('DL_DIR', None)
-
-        self.project = SDKBuildProject(self.tc.sdk_dir + "/cpio/", self.tc.sdk_env,
-                        "https://ftp.gnu.org/gnu/cpio/cpio-2.12.tar.gz",
-                        self.tc.sdk_dir, self.td['DATETIME'], dl_dir=dl_dir)
-        self.project.download_archive()
-
-    def setUp(self):
-        machine = self.td.get("MACHINE")
-        if not self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine):
-            raise unittest.SkipTest("SDK doesn't contain a cross-canadian toolchain")
-
+    """
+    Check that autotools will cross-compile correctly.
+    """
     def test_cpio(self):
-        self.assertEqual(self.project.run_configure(), 0,
-                        msg="Running configure failed")
+        with tempfile.TemporaryDirectory(prefix="cpio-", dir=self.tc.sdk_dir) as testdir:
+            dl_dir = self.td.get('DL_DIR', None)
+            tarball = self.fetch(testdir, dl_dir, "https://ftp.gnu.org/gnu/cpio/cpio-2.12.tar.gz")
+
+            dirs = {}
+            dirs["source"] = os.path.join(testdir, "cpio-2.12")
+            dirs["build"] = os.path.join(testdir, "build")
+            dirs["install"] = os.path.join(testdir, "install")
 
-        self.assertEqual(self.project.run_make(), 0,
-                        msg="Running make failed")
+            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
+            self.assertTrue(os.path.isdir(dirs["source"]))
+            os.makedirs(dirs["build"])
 
-        self.assertEqual(self.project.run_install(), 0,
-                        msg="Running make install failed")
+            self._run("cd {build} && {source}/configure $CONFIGURE_FLAGS".format(**dirs))
+            self._run("cd {build} && make -j".format(**dirs))
+            self._run("cd {build} && make install DESTDIR={install}".format(**dirs))
 
-    @classmethod
-    def tearDownClass(self):
-        self.project.clean()
+            self.check_elf(os.path.join(dirs["install"], "usr", "local", "bin", "cpio"))
-- 
2.11.0


