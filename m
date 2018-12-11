Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0DD996C108
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 18:20:34 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id u3so15145584wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 10:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8kPsVTbtq9kr8qC8QcKyyw67ovCDCdzVWJ+Lbd7nVvs=;
	b=XW1d+mLFSIaoZfVffg0P2hsSmrq5gDNaihJv/cqKez2lFgx/Fw5ZZuWExEuzvXxptD
	xiLO9dkTIGweuDD+0mv2q7hy4TWvpbv8Ym/jyhcVsQcn8bcmYPlSzQNNcATSz5+2XCzy
	pn8Y9ByYexZl31ZKJ6/GTs/22x34nF/zXE9ABIcvIUZYrrjRyG4TmIKVdo53Z4Zb2xNR
	6A0O0lBHSUnC0kpIeeDSEssRln1JVd0xTpCfC/B+xFWUNJxQdWdLdCQ5K4JcGDi8e8PM
	wNFEYpyppJEMUb11eBvYaGMsJCYsgOOJ2E7JSSFEgIbFmC11nUlOfPJ7sr8Nq3EdjD1X
	0wMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8kPsVTbtq9kr8qC8QcKyyw67ovCDCdzVWJ+Lbd7nVvs=;
	b=N5Wz3aUq5kJ8MojEP0hNODcqB3eO/iQUpOkP4FvubjGf2rn+cqP57kjfb2k7/y93ZI
	emSaojjoLReY1fXBBickr3bywMXpgoo15/t3S9pbfbcoDonTCXSM0kZVqhabVmIpfjYn
	LgFdpxX+Y/jFr8L5uaZbiej/EpBwr8IaxG7N2e8dNuboCOGvHE9qYvjNn8weuVxj8Au2
	5NqDujJc/m70XfIXOqTU+M03s83W5Y08qzKWdlMV6GQPjaU/Khb9RHWQifEgjzjsHfHJ
	7e637PVlKUKR4gVth1p5JSoKbaLGjYwEpsM65dw+LYxoHs5J9Z4pXnTbdymBOTEG0gwU
	44ag==
X-Gm-Message-State: AA+aEWZXB3RUPH4eXVQ12KmIXvtCeQ0wFKoQh9NxM4hqrFirX8581inI
	V7+GNsuDzJLjaWBpABRwUBz9ZF4TMkw=
X-Google-Smtp-Source: AFSGD/V0BwBUql3tWRmbW3+PYRJoZCo+72Hqlz2/qKg4VFosT+g3nEMaeArW516A96PtMA5V8Of3IQ==
X-Received: by 2002:adf:f691:: with SMTP id v17mr13881838wrp.114.1544552435450;
	Tue, 11 Dec 2018 10:20:35 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b18sm16253616wrw.83.2018.12.11.10.20.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 10:20:34 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2018 18:20:25 +0000
Message-Id: <20181211182025.20381-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181211182025.20381-1-ross.burton@intel.com>
References: <20181211182025.20381-1-ross.burton@intel.com>
Subject: [PATCH 5/5] oeqa/sdk: rewrite cpio test
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
X-List-Received-Date: Tue, 11 Dec 2018 18:20:35 -0000

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


