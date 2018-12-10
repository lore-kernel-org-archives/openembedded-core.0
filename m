Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id AD9666C4CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 17:11:54 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a62so4338495wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 09:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Kwlv1BFfUX1VWvbsnTC/EZAvIB3z+sXSR2Ujq3xuwAA=;
	b=2CjxlzMowWBaumOrlZotW0xEUcDWRpWU6UygEo22vg8ySMiv33FhUVzxXCndQ25dQH
	/tuT8l2M9tEtZONjMQfXEdT4M0sZtZ0Uen7kl83d0vw+MdD0ozTQFio7yE/svvYJKIlJ
	9chdw62Ttsbcebtca74VYKZ3VLhfCqc+4BpIlpEbkFklhsLap0WcYHaBjYpTBITmfyUf
	z04cQ2SldeMEodH01Bf/GbUYXA2yM+eDUsn3hMqC9m1kfZiJfJA51XOMewjN9X4ETVnQ
	NuRoFPvkBy/l6oZQZQghynX6g9GtLtlHKlk9r3B0N7+vdif0zdgcgoVIbLSko/mlrWjk
	Eppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Kwlv1BFfUX1VWvbsnTC/EZAvIB3z+sXSR2Ujq3xuwAA=;
	b=K3zIIT78Q5FGgXtOUJdYi6nMUIPRkzL26xDDvYhG3RGzdVxwHZeSL60AIlsN+QSYVe
	oLkP95WlTDjaplNIQ5VdAqsi/YxDCS/ilrf/qB1eX+WEjTMkNGwcnv1VM/WlxICoEaOa
	9omj/gYo+1Ub8bNwqZB7AhN8bNTxs4F8aYORZMJS1Huua3Hk7NMLOSWxqTeieGhch0kM
	dNxT7EFUWJZhaIb1aKx5izRaEWZLWfZ1oO6+hyshLs0BwuSgsM80PUGGUvYNAxIocLqI
	quJop07fNc5xlY/PubfLlsuRk1Bo6N66B0VW0GSenNYg9S7SSCLjkZyCSyJ7XdoGgpof
	+GaA==
X-Gm-Message-State: AA+aEWbYnrlepQCqI/vyXDSuFda+3rKhWBqPM1lHg2Nk3adazplQjthk
	8fVqCM81mEQx1lIimCcIbf9cu+kr5rw=
X-Google-Smtp-Source: AFSGD/VQSVfl3qaBF07sblO/3ZQL8YwgpSWCncEh+1gAa8mGZqOP7YMmUkV8SnQ77pQXXMaglnJ7cw==
X-Received: by 2002:a1c:e1d5:: with SMTP id y204mr11192856wmg.65.1544461914959;
	Mon, 10 Dec 2018 09:11:54 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y13sm12343505wrn.73.2018.12.10.09.11.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 09:11:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2018 17:11:41 +0000
Message-Id: <20181210171141.10722-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181210171141.10722-1-ross.burton@intel.com>
References: <20181210171141.10722-1-ross.burton@intel.com>
Subject: [PATCH 4/4] oeqa/sdk: rewrite lzip test
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
X-List-Received-Date: Mon, 10 Dec 2018 17:11:55 -0000

Don't use the helper class as it gets in the way more than it helps, exercise
the out-of-tree paths, and verify the installed files match the expected
architecture.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/cases/buildlzip.py | 46 +++++++++++++-----------------------
 1 file changed, 16 insertions(+), 30 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib/oeqa/sdk/cases/buildlzip.py
index b57fbbece7f..d98e10fc37f 100644
--- a/meta/lib/oeqa/sdk/cases/buildlzip.py
+++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
@@ -1,39 +1,25 @@
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
     def test_lzip(self):
-        self.assertEqual(self.project.run_configure(), 0,
-                        msg="Running configure failed")
+        with tempfile.TemporaryDirectory(prefix="lzip", dir=self.tc.sdk_dir) as testdir:
+            dl_dir = self.td.get('DL_DIR', None)
+            tarball = self.fetch(testdir, dl_dir, "http://downloads.yoctoproject.org/mirror/sources/lzip-1.19.tar.gz")
+
+            dirs = {}
+            dirs["source"] = os.path.join(testdir, "lzip-1.19")
+            dirs["build"] = os.path.join(testdir, "build")
+            dirs["install"] = os.path.join(testdir, "install")
 
-        self.assertEqual(self.project.run_make(), 0,
-                        msg="Running make failed")
+            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
+            self.assertTrue(os.path.isdir(dirs["source"]))
+            os.makedirs(dirs["build"])
 
-        self.assertEqual(self.project.run_install(), 0,
-                        msg="Running make install failed")
+            self._run("cd {build} && {source}/configure --srcdir {source} $CONFIGURE_FLAGS".format(**dirs))
+            self._run("cd {build} && make -j".format(**dirs))
+            self._run("cd {build} && make install DESTDIR={install}".format(**dirs))
 
-    @classmethod
-    def tearDownClass(self):
-        self.project.clean()
+            self.check_elf(os.path.join(dirs["install"], "usr", "local", "bin", "lzip"))
-- 
2.11.0


