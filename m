Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1F1C76C108
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 18:20:33 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a18so3346505wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 10:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HdnA52bXwf8T5p+D/o7SFkSh/SHU+EsoFo4dHv54gb0=;
	b=QUp0LOby+WJa/sf6YKqdPhMEvEGD2uYJNAD5ilK7KowMc3LPasvd98lnpIb4RFIYSb
	ieF05uV0b/FSOJFys6nCtdKPjR3F39DIlZ45wWXy9JoLOF410BvRCODN+eumXplw7Nmu
	ToGlKxD2wxuyKbEiTdUALM/8Hy41Ev+r28O3ee25W9Jb/hyd4Y64U9ixhK0tOozlPuf3
	mPoblcov60YrSOPQkN51WZLG+DTK7hHrIrvzBhlbwSYjebVxFmi9DJTJauWS5adGXuJ/
	Lc/e9rsBtL7oyihRzJ3H9yijImvpWt4s2Ir5OzCAGOQDzYzhodV4z3zqNoyaKcMUICIe
	jmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HdnA52bXwf8T5p+D/o7SFkSh/SHU+EsoFo4dHv54gb0=;
	b=JknfJAIanVA5TsaXxQvit4gL4+Q7h74QFVUFB2T0LougGEO3HdtF+Im1b4XVMvDkCJ
	ZOPCh61ofmKw+7qJ5Xa27WcppdmVimYXmiVuOCDJvx3KT5UPpVS83CxgmJll2B8IvcUd
	Tr5gfrdeuL0CK0hLTlo0hV+g+JaHCpqsaNR4Xf+hZnvS3/cEI0OKc7aGtJn0uGutdR6j
	OIfUV9mOeqbei22MSO6vQGoGV6cT7fuZBgKZYCkppuhpDcExU/Fcig/Mg2ZyqfOuaS1B
	r6dwQECCmEPu5MOYsGV/Id0rNJy3radwwQLCJdZxIYQl+8UGEtaUT6Qvzp5eMPKSNRW3
	POTg==
X-Gm-Message-State: AA+aEWbiQ9IS8QxZv5xdngNbrFVh4kdWRwtaNRbkIgVgS4uv3O3R4T7U
	zQjR1tGJlf9YZmFkQL35S0A8d0BKsgg=
X-Google-Smtp-Source: AFSGD/VrJ4hxfnPQbIwZdGlo05+77JyPhcVhwpNX3yp0p1ZZm/wgGNrdZoKEdFw4fhjf6xJO95mvxw==
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr3521513wmf.117.1544552434436; 
	Tue, 11 Dec 2018 10:20:34 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b18sm16253616wrw.83.2018.12.11.10.20.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 10:20:33 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2018 18:20:24 +0000
Message-Id: <20181211182025.20381-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181211182025.20381-1-ross.burton@intel.com>
References: <20181211182025.20381-1-ross.burton@intel.com>
Subject: [PATCH 4/5] oeqa/sdk: rewrite lzip test
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
X-List-Received-Date: Tue, 11 Dec 2018 18:20:34 -0000

Don't use the helper class as it gets in the way more than it helps, exercise
the out-of-tree paths, and verify the installed files match the expected
architecture.

(From OE-Core rev: ad7bb5d141165fc9e6ffee882adf709c0a76094f)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


