Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id DE291775F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 12:44:50 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id z15so19688438lfd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 05:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Ip72tSPYiq5O6uq3o2iPeHUSIc+QXSXMYQU9Vg+Gjs0=;
	b=jq/BorWLJulVSvzI1K5oZHCjEGsl4dtIq/SmzakM32eq45SeLbZ9XCLmyr9vKLbw+C
	L1CC1ESJYKhv2/0f4B3Y4gy/cF5pIIFFM5VOHxKJjRWIqd4ImGcjrO6pE36Qt8FvBmpp
	SWkHSwzC7roRbaSd9MZ78TrAh0mXmRJ/oJt+rsDS7GNxEQDJmGlcM5hSP63kUDEeZG+4
	M6YUuHCTnJrsgd57ZqU4gyveoJbG4PwXyIBiq2Z241NqUajf48b/sHoO794TCqR7+RtP
	YmsEedjd1y3EM9DenR7qr4igu/6FcbsJdbkclT+AULUt2ydsbRJ411WwjKR1agcFtbim
	POuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Ip72tSPYiq5O6uq3o2iPeHUSIc+QXSXMYQU9Vg+Gjs0=;
	b=kk3Z3SIWRy1LC5U4++roxLlHHdCzghaK0fsMEICmKIplqQB1K3n25DK5wVhB4IPieB
	ACRtHq6+kQeYffLPNN+ZBm4deIrbpJF+954WiunZBLBeuDEYWcwE76zhm3q2HGUHH+IS
	JTFcDH0VPMw58bMf/d0kr2vSqfhWB2Htv9KI3hdAILQrSfZO+9KBnLLI+us0G8PKZmxr
	mLKvb3rIM4w92lEg4X/A58Zc4M/fENFpBiFNgNFhO+GS13ubanM3r9gqb8sNBvR5Ru39
	1J04EgdIyLRUGQoooGhrjKRRn0Z+8bhku0RjKIWM4NLtHTGrLE8qT8FHEWgDHbkYGU5N
	Wbfg==
X-Gm-Message-State: AFeK/H3o59QCHrOcMkYk3mFZkcOFn2nYMotJNY3Qh7kgjB+8OSQN8NPWQMltPhvN0VVuHg==
X-Received: by 10.25.76.85 with SMTP id z82mr2370661lfa.181.1489668291275;
	Thu, 16 Mar 2017 05:44:51 -0700 (PDT)
Received: from localhost.localdomain (staticline-31-182-60-238.toya.net.pl.
	[31.182.60.238])
	by smtp.gmail.com with ESMTPSA id n20sm893148lfb.53.2017.03.16.05.44.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Mar 2017 05:44:50 -0700 (PDT)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 13:44:36 +0100
Message-Id: <985a09fd4d92969bc1a2db4f8bf52956483fb9e0.1489668133.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1489668133.git.maciej.borzecki@rndity.com>
References: <cover.1489668133.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1489668133.git.maciej.borzecki@rndity.com>
References: <cover.1489668133.git.maciej.borzecki@rndity.com>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v3 5/5] wic: selftest: add tests for --fixed-size partition flags
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
X-List-Received-Date: Thu, 16 Mar 2017 12:44:51 -0000

wic has a new flag for setting a fixed parition size --fixed-size. Add
tests that verify if partition is indeed sized properly and that errors
are signaled when there is not enough space to fit partition data.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 62 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index b9c06e56adb70376b6f6a4893026223077b708fd..f83d4a1b51367de42043bb0b840792f1bfddeaf6 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -29,6 +29,7 @@ import unittest
 from glob import glob
 from shutil import rmtree
 from functools import wraps, lru_cache
+from tempfile import NamedTemporaryFile
 
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu
@@ -61,10 +62,13 @@ class Wic(oeSelfTest):
 
     resultdir = "/var/tmp/wic.oe-selftest/"
     image_is_ready = False
+    native_sysroot = None
     wicenv_cache = {}
 
     def setUpLocal(self):
         """This code is executed before each test method."""
+        if not self.native_sysroot:
+            Wic.native_sysroot = get_bb_var('STAGING_DIR_NATIVE', 'wic-tools')
 
         # Do this here instead of in setUpClass as the base setUp does some
         # clean up which can result in the native tools built earlier in
@@ -615,3 +619,61 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '3')
+
+    def _make_fixed_size_wks(self, size):
+        """
+        Create a wks of an image with a single partition. Size of the partition is set
+        using --fixed-size flag. Returns a tuple: (path to wks file, wks image name)
+        """
+        with NamedTemporaryFile("w", suffix=".wks", delete=False) as tf:
+            wkspath = tf.name
+            tf.write("part " \
+                     "--source rootfs --ondisk hda --align 4 --fixed-size %d "
+                     "--fstype=ext4\n" % size)
+        wksname = os.path.splitext(os.path.basename(wkspath))[0]
+
+        return wkspath, wksname
+
+    def test_fixed_size(self):
+        """
+        Test creation of a simple image with partition size controlled through
+        --fixed-size flag
+        """
+        wkspath, wksname = self._make_fixed_size_wks(200)
+
+        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+                                   % (wkspath, self.resultdir)).status)
+        os.remove(wkspath)
+        wicout = glob(self.resultdir + "%s-*direct" % wksname)
+        self.assertEqual(1, len(wicout))
+
+        wicimg = wicout[0]
+
+        # verify partition size with wic
+        res = runCmd("parted -m %s unit mib p 2>/dev/null" % wicimg,
+                     ignore_status=True,
+                     native_sysroot=self.native_sysroot)
+        self.assertEqual(0, res.status)
+
+        # parse parted output which looks like this:
+        # BYT;\n
+        # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
+        # 1:0.00MiB:200MiB:200MiB:ext4::;\n
+        partlns = res.output.splitlines()[2:]
+
+        self.assertEqual(1, len(partlns))
+        self.assertEqual("1:0.00MiB:200MiB:200MiB:ext4::;", partlns[0])
+
+    def test_fixed_size_error(self):
+        """
+        Test creation of a simple image with partition size controlled through
+        --fixed-size flag. The size of partition is intentionally set to 1MiB
+        in order to trigger an error in wic.
+        """
+        wkspath, wksname = self._make_fixed_size_wks(1)
+
+        self.assertEqual(1, runCmd("wic create %s -e core-image-minimal -o %s" \
+                                   % (wkspath, self.resultdir), ignore_status=True).status)
+        os.remove(wkspath)
+        wicout = glob(self.resultdir + "%s-*direct" % wksname)
+        self.assertEqual(0, len(wicout))
-- 
2.9.3


