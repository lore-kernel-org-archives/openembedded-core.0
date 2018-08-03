Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id E369D78E44
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 14:01:33 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id o11-v6so6365981wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 07:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TazkE46S03FCSS2T3yNjD7nBkFlWlQuoklXODmLoMJc=;
	b=GMJ1DgU+Mh3mYXa7T2o2Zizus4d1FjL+G2aYrl7wsg2NP6C5YaSMfsAP5McBMWGHmf
	Li75/mBPE3fMJUsfrk7Ydg7e+ocmDQCOh6h5+Xnvm4AfZU8osg8Bt4OqHnQ5lOoO5P1t
	of8rsdJiDQpdoJC+bvZ5ralsRsB9JmVHttr2yG8WIYimEMl/by0+mW0qzgPOeA0UoFXR
	sQcsNA4WCAopf4zGDHTIb68L64VRNYtecrJi2Mg168857N2WXo4MGHo1+QUqBoUFEDGT
	SmtNtAKK45Z2ed8N/ZCis8lO8vx6buKI0sCpk7kbxaXLoOENO7B+ftJtynO79sHyCtiT
	SyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TazkE46S03FCSS2T3yNjD7nBkFlWlQuoklXODmLoMJc=;
	b=rBDWv9ENwDhi+r9/2plIXBs30P0/cB91UiODZX8kjrdVUi5q1++NSJv5wzU9x4HylT
	id5rAeA5FB/Nk74cY01IjcE+itUt53wKzZvG51KlF/wn6jvxflqjUvboR9r12UZj8lUj
	tK4TkbBZvkDGYqMGK2uqWL1eyS36STgV+UB5nFBYSarqGBi/6gbr3QQREzo16TQwK+bD
	JUXjQB6+G74I2Rki1U21jpurKikk9wHLZ7jqIgPXjuwkJV2jXizAnAN4TPG+YwkWPaW1
	N2HY8KFUO3sxpBbbPw37/2BXb91LzTDVONzpM4HN4BeJ3xQ8RBhGASkkldwNeu99CdFW
	eZgw==
X-Gm-Message-State: AOUpUlET3JpOFvw+kW5GVc/7YRxq5aOuPL2BbTG445AlRUSQwuJySFFK
	wcGDw8OZkqKnr70BNLRWmF0stb0OhB0=
X-Google-Smtp-Source: AAOMgpciVxEW2+5gr5nvrCIiH+2BHD8XSgiCnpTcP3bMQx8GRqUbYciYBvmeBYRDH1HsbZxv20bhug==
X-Received: by 2002:a1c:415:: with SMTP id 21-v6mr5316448wme.128.1533304893940;
	Fri, 03 Aug 2018 07:01:33 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e141-v6sm7753757wmd.32.2018.08.03.07.01.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Aug 2018 07:01:33 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Aug 2018 15:01:14 +0100
Message-Id: <20180803140115.25450-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180803140115.25450-1-ross.burton@intel.com>
References: <20180803140115.25450-1-ross.burton@intel.com>
Subject: [PATCH 3/4] oeqa/sdk: add test that CMake works
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
X-List-Received-Date: Fri, 03 Aug 2018 14:01:34 -0000

Add a new SDK testcase that builds assimp, a project that uses cmake.

Using TARGET_ARCH and TARGET_OS which is now exported into the environment,
check that the generated binaries match the ELF headers we expect.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/cases/assimp.py | 68 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/cases/assimp.py

diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/assimp.py
new file mode 100644
index 00000000000..7251bdf34e7
--- /dev/null
+++ b/meta/lib/oeqa/sdk/cases/assimp.py
@@ -0,0 +1,68 @@
+import os, subprocess, unittest
+import bb
+from oeqa.sdk.case import OESDKTestCase
+from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
+
+from oeqa.utils.subprocesstweak import errors_have_output
+errors_have_output()
+
+class BuildAssimp(OESDKTestCase):
+    """
+    Test case to build a project using cmake.
+    """
+
+    td_vars = ['DATETIME', 'TARGET_OS', 'TARGET_ARCH']
+
+    @classmethod
+    def setUpClass(self):
+        if not (self.tc.hasHostPackage("nativesdk-cmake") or
+                self.tc.hasHostPackage("cmake-native")):
+            raise unittest.SkipTest("Needs cmake")
+
+    def fetch(self, workdir, dl_dir, url, archive=None):
+        if not archive:
+            from urllib.parse import urlparse
+            archive = os.path.basename(urlparse(url).path)
+
+        if dl_dir:
+            tarball = os.path.join(dl_dir, archive)
+            if os.path.exists(tarball):
+                return tarball
+
+        tarball = os.path.join(workdir, archive)
+        subprocess.check_output(["wget", "-O", tarball, url])
+        return tarball
+
+    def test_assimp(self):
+        import tempfile
+        import oe.qa, oe.elf
+
+        with tempfile.TemporaryDirectory(prefix="assimp", dir=self.tc.sdk_dir) as testdir:
+            dl_dir = self.td.get('DL_DIR', None)
+            tarball = self.fetch(testdir, dl_dir, "https://github.com/assimp/assimp/archive/v4.1.0.tar.gz")
+            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
+
+            sourcedir = os.path.join(testdir, "assimp-4.1.0") 
+            builddir = os.path.join(testdir, "build")
+            installdir = os.path.join(testdir, "install")
+            bb.utils.mkdirhier(builddir)
+
+            self._run("cd %s && cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON %s " % (builddir, sourcedir))
+            self._run("cmake --build %s -- -j" % builddir)
+            self._run("cmake --build %s --target install -- DESTDIR=%s" % (builddir, installdir))
+
+            elf = oe.qa.ELFFile(os.path.join(installdir, "usr", "local", "lib", "libassimp.so.4.1.0"))
+            elf.open()
+
+            output = self._run("echo $OECORE_TARGET_OS:$OECORE_TARGET_ARCH")
+            target_os, target_arch = output.strip().split(":")
+            machine_data = oe.elf.machine_dict(None)[target_os][target_arch]
+            (machine, osabi, abiversion, endian, bits) = machine_data
+
+            self.assertEqual(machine, elf.machine())
+            self.assertEqual(bits, elf.abiSize())
+            self.assertEqual(endian, elf.isLittleEndian())
+
+    @classmethod
+    def tearDownClass(self):
+        self.project.clean()
-- 
2.11.0


