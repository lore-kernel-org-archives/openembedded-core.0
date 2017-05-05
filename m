Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4B50177D67
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 10:25:13 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id u65so19769469wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 May 2017 03:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=2LXDT+/TXJghc9/qet+CiJeJJdnec8KbPAXibNkgSr4=;
	b=0DDxn8I/std6Z/3i/DwJBskgw8moHyXKw+vqx3TgpcDld40a2JsMJAdk5x6un9DqJ9
	1CK8TBGnlS9VIFt0RtMUR+WWgBIQXnDl7aI+XPyTMChoJtnqBZSxqy6hF/7+DejIb7N0
	A26V1wtmTmXNVvj5gPMBo2xFn+faCLvWC20FMe4HozyJJaYuGQLrpxmKctEw8ko0UjGM
	XQ/5ul0w2l7IX0FbrSTzC10b7NlRWZB14Bk2ONQxOzmL3ehOrAUhHvhl8QJtXsiCIO/c
	HxOqr950V5KEpQL+lXhDPbC74jJ9R5l5mzC2bj7hSdlaAFJoHT82XxaXFRdz0Ha77lfX
	tQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2LXDT+/TXJghc9/qet+CiJeJJdnec8KbPAXibNkgSr4=;
	b=GrWRcBdZ629mAy3L64LKVTRPuTZ0PwXLx3lthrDs9C6nUGjO9HqmF1E3rgkcbRsyP+
	lyvTrkhecAIGcYOyEXYqod+6MoUMy8u/vF3Em6cfmBbg/dLoPDM+vRId1tMqjCOHUDBO
	BVxLx0UTSoDAQ1KnIC03LDkjXTtP/5CYiJnHMln49vpDNHrHNO39m10UIog8bu+ufiJJ
	x8MUbYkNDHtQi+BWDL6Bvp9ErgfXUjLuKGbeE5yqjgSqCOsIi6OMISTaJao+QUkx7+Pi
	P49CrcFN2FnysswZTKZGCK0Rbldb8NjylRjZ18cos3dJ889GY5KapQ3zfK86GPjzr4cT
	QU8Q==
X-Gm-Message-State: AN3rC/46QU0glMpQaOVeByjEM/I7RH9TbQfvIL5OkNFbb4Iikpz/gU0Z
	GlVjVSIMGokTszhjb2M=
X-Received: by 10.28.13.66 with SMTP id 63mr4760060wmn.2.1493979914719;
	Fri, 05 May 2017 03:25:14 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	x17sm4213524wrd.63.2017.05.05.03.25.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 May 2017 03:25:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 May 2017 11:25:12 +0100
Message-Id: <1493979912-9339-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] oeqa/selftest: add test for package manager version comparison
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
X-List-Received-Date: Fri, 05 May 2017 10:25:14 -0000

This test case verifies that opkg, dpkg, and rpm all have the same behaviour for
version ordering, specifically the behaviour of ~ which should be sorting
*before* nothing:

  1.0 < 2.0~pre < 2.0 < 2.0-fix

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/package.py | 80 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/package.py

diff --git a/meta/lib/oeqa/selftest/package.py b/meta/lib/oeqa/selftest/package.py
new file mode 100644
index 0000000..95125f2
--- /dev/null
+++ b/meta/lib/oeqa/selftest/package.py
@@ -0,0 +1,80 @@
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import bitbake, get_bb_vars
+import subprocess, os
+import oe.path
+
+class VersionOrdering(oeSelfTest):
+    # version1, version2, sort order
+    tests = (
+        ("1.0", "1.0", 0),
+        ("1.0", "2.0", -1),
+        ("2.0", "1.0", 1),
+        ("2.0-rc", "2.0", 1),
+        ("2.0~rc", "2.0", -1),
+        ("1.2rc2", "1.2.0", -1)
+        )
+
+    @classmethod
+    def setUpClass(cls):
+        # Build the tools we need and populate a sysroot
+        bitbake("dpkg-native opkg-native rpm-native python3-native")
+        bitbake("build-sysroots -c build_native_sysroot")
+
+        # Get the paths so we can point into the sysroot correctly
+        vars = get_bb_vars(["STAGING_DIR", "BUILD_ARCH", "bindir_native", "libdir_native"])
+        cls.staging = oe.path.join(vars["STAGING_DIR"], vars["BUILD_ARCH"])
+        cls.bindir = oe.path.join(cls.staging, vars["bindir_native"])
+        cls.libdir = oe.path.join(cls.staging, vars["libdir_native"])
+
+    def setUp(self):
+        # Just for convenience
+        self.staging = type(self).staging
+        self.bindir = type(self).bindir
+        self.libdir = type(self).libdir
+
+    def test_dpkg(self):
+        for ver1, ver2, sort in self.tests:
+            op = { -1: "<<", 0: "=", 1: ">>" }[sort]
+            status = subprocess.call((oe.path.join(self.bindir, "dpkg"), "--compare-versions", ver1, op, ver2))
+            self.assertEqual(status, 0, "%s %s %s failed" % (ver1, op, ver2))
+
+            # Now do it again but with incorrect operations
+            op = { -1: ">>", 0: ">>", 1: "<<" }[sort]
+            status = subprocess.call((oe.path.join(self.bindir, "dpkg"), "--compare-versions", ver1, op, ver2))
+            self.assertNotEqual(status, 0, "%s %s %s failed" % (ver1, op, ver2))
+
+            # Now do it again but with incorrect operations
+            op = { -1: "=", 0: "<<", 1: "=" }[sort]
+            status = subprocess.call((oe.path.join(self.bindir, "dpkg"), "--compare-versions", ver1, op, ver2))
+            self.assertNotEqual(status, 0, "%s %s %s failed" % (ver1, op, ver2))
+
+    def test_opkg(self):
+        for ver1, ver2, sort in self.tests:
+            op = { -1: "<<", 0: "=", 1: ">>" }[sort]
+            status = subprocess.call((oe.path.join(self.bindir, "opkg"), "compare-versions", ver1, op, ver2))
+            self.assertEqual(status, 0, "%s %s %s failed" % (ver1, op, ver2))
+
+            # Now do it again but with incorrect operations
+            op = { -1: ">>", 0: ">>", 1: "<<" }[sort]
+            status = subprocess.call((oe.path.join(self.bindir, "opkg"), "compare-versions", ver1, op, ver2))
+            self.assertNotEqual(status, 0, "%s %s %s failed" % (ver1, op, ver2))
+
+            # Now do it again but with incorrect operations
+            op = { -1: "=", 0: "<<", 1: "=" }[sort]
+            status = subprocess.call((oe.path.join(self.bindir, "opkg"), "compare-versions", ver1, op, ver2))
+            self.assertNotEqual(status, 0, "%s %s %s failed" % (ver1, op, ver2))
+
+    def test_rpm(self):
+        # Need to tell the Python bindings where to find its configuration
+        env = os.environ.copy()
+        env["RPM_CONFIGDIR"] = oe.path.join(self.libdir, "rpm")
+
+        for ver1, ver2, sort in self.tests:
+            # The only way to test rpm is via the Python module, so we need to
+            # execute python3-native.  labelCompare returns -1/0/1 (like strcmp)
+            # so add 100 and use that as the exit code.
+            command = (oe.path.join(self.bindir, "python3-native", "python3"), "-c",
+                       "import sys, rpm; v1=(None, \"%s\", None); v2=(None, \"%s\", None); sys.exit(rpm.labelCompare(v1, v2) + 100)" % (ver1, ver2))
+            status = subprocess.call(command, env=env)
+            self.assertIn(status, (99, 100, 101))
+            self.assertEqual(status - 100, sort, "%s %s (%d) failed" % (ver1, ver2, sort))
-- 
2.8.1


