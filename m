Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id BE5D87F9E4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2019 01:55:49 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 6so5293519pgk.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Dec 2019 17:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=aeloBEud1pQVBVtdLLhlCjk9EUIXDhd+X4H+MzAYQj0=;
	b=fTaUvUE8pQwrxeRR1YjVugXIHolfn3k48Nx723TFgCYh9leSuezzv2hGpFVAa1lWpZ
	mtntheS/TEcrYU4nnNMZ3IhAD8wfirnojOabnaQ7bqaHaSwDWRy9nRXlUKIFiM8R1BMj
	OgqUMTZ2uAq1HPFxjAObyrjgtbRDRlI9thV7sKMsWkM3W5ibw4dWbVb+yRzDwav7k+LB
	MjIeBMnRvuh751UXM4o3RV4Aff98h1D3wdJ13dUtIK22njbarriKQiTJpHS97UsP4gu1
	3ii2Q1xnst0h6RNZM5WP5lXVDelOLEcvdskfSCEjtXfzDQ9xRvxenknXkAUdFc4npLAN
	CqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aeloBEud1pQVBVtdLLhlCjk9EUIXDhd+X4H+MzAYQj0=;
	b=R8wUgaDHK6k+WqMAODHsHzy0HLSrMyfw2RdGuR8D45wLiFF0jV9fSYpTX2Gs6XgDxH
	aARtPXrcGZZPwpr0zBSKUKqSeMtvfpVYhkx5UpgtNDdCrk3+mSJAAX9fH9sVs84lZdXP
	nn5Zno7HFyE1M20g/zjte1NTHWVHo5YozvaoYpTw5QGtGEMOhi9Y1YDmrn/KRRRJBLPV
	tQiGYlg7JQyngNvnAfe/XqKSpyP6cv4XUBq2JRbMEnakPBFh4Q9zkyKDbdKPi/xkFad+
	mP/ooN2APi88E9Cec0QuqFGXpY3tKs1awWl3ZzwD+nxxCbLJWr1fW7XLkz/mYSCaQgwH
	wYZw==
X-Gm-Message-State: APjAAAW6VcIxDQs+jcBrmu3FclA5REtJ2tQJx8BCr4NlQ2jk0hPVYRKz
	FVb8GnEyzz9LN36UDXEyf3Y5Oxy67vs=
X-Google-Smtp-Source: APXvYqzdwZriRtpad7lm//BzTMUtBDW0qE8DrbWAoE6Zk36LWUGhuHTNRKAD1WkoUpyKCd37aUCPbw==
X-Received: by 2002:a63:4f64:: with SMTP id p36mr12218821pgl.271.1575770150484;
	Sat, 07 Dec 2019 17:55:50 -0800 (PST)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	e9sm20286062pgn.49.2019.12.07.17.55.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Dec 2019 17:55:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Dec 2019 17:55:48 -0800
Message-Id: <20191208015548.6419-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [V2]PATCH] oeqa/selftest/runtime_test: split systemd and sysvinit tests out
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
X-List-Received-Date: Sun, 08 Dec 2019 01:55:49 -0000

This should help debug which part of this selftest is failing.
We can not tell which outloop is failing so split the tests into
systemd and sysvinit.

See [Yocto # 13650] for more details.

[v2]
consolidate common code into one function
Add ifNotQemu check too

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 97 +++++++++++++-------
 1 file changed, 62 insertions(+), 35 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index ccd2c40aa3..8b96a313f9 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -10,6 +10,7 @@ import re
 import tempfile
 import shutil
 import oe.lsb
+from oeqa.core.decorator.data import skipIfNotQemu
 
 class TestExport(OESelftestTestCase):
 
@@ -241,7 +242,47 @@ class TestImage(OESelftestTestCase):
         bitbake('-c testimage core-image-minimal')
 
 class Postinst(OESelftestTestCase):
-    def test_postinst_rootfs_and_boot(self):
+
+    def init_manager_loop(self, init_manager):
+        import oe.path
+
+        vars = get_bb_vars(("IMAGE_ROOTFS", "sysconfdir"), "core-image-minimal")
+        rootfs = vars["IMAGE_ROOTFS"]
+        self.assertIsNotNone(rootfs)
+        sysconfdir = vars["sysconfdir"]
+        self.assertIsNotNone(sysconfdir)
+        # Need to use oe.path here as sysconfdir starts with /
+        hosttestdir = oe.path.join(rootfs, sysconfdir, "postinst-test")
+        targettestdir = os.path.join(sysconfdir, "postinst-test")
+
+        for classes in ("package_rpm", "package_deb", "package_ipk"):
+            with self.subTest(init_manager=init_manager, package_class=classes):
+                features = 'CORE_IMAGE_EXTRA_INSTALL = "postinst-delayed-b"\n'
+                features += 'IMAGE_FEATURES += "package-management empty-root-password"\n'
+                features += 'PACKAGE_CLASSES = "%s"\n' % classes
+                if init_manager == "systemd":
+                    features += 'DISTRO_FEATURES_append = " systemd"\n'
+                    features += 'VIRTUAL-RUNTIME_init_manager = "systemd"\n'
+                    features += 'DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"\n'
+                    features += 'VIRTUAL-RUNTIME_initscripts = ""\n'
+                self.write_config(features)
+
+                bitbake('core-image-minimal')
+
+                self.assertTrue(os.path.isfile(os.path.join(hosttestdir, "rootfs")),
+                                "rootfs state file was not created")
+
+                with runqemu('core-image-minimal') as qemu:
+                    # Make the test echo a string and search for that as
+                    # run_serial()'s status code is useless.'
+                    for filename in ("rootfs", "delayed-a", "delayed-b"):
+                        status, output = qemu.run_serial("test -f %s && echo found" % os.path.join(targettestdir, filename))
+                        self.assertEqual(output, "found", "%s was not present on boot" % filename)
+
+
+
+    @skipIfNotQemu('qemuall', 'Test only runs in qemu')
+    def test_postinst_rootfs_and_boot_sysvinit(self):
         """
         Summary:        The purpose of this test case is to verify Post-installation
                         scripts are called when rootfs is created and also test
@@ -255,46 +296,32 @@ class Postinst(OESelftestTestCase):
                            created by postinst_boot recipe is present on image.
         Expected:       The files are successfully created during rootfs and boot
                         time for 3 different package managers: rpm,ipk,deb and
-                        for initialization managers: sysvinit and systemd.
+                        for initialization managers: sysvinit.
 
         """
+        self.init_manager_loop("sysvinit")
 
-        import oe.path
 
-        vars = get_bb_vars(("IMAGE_ROOTFS", "sysconfdir"), "core-image-minimal")
-        rootfs = vars["IMAGE_ROOTFS"]
-        self.assertIsNotNone(rootfs)
-        sysconfdir = vars["sysconfdir"]
-        self.assertIsNotNone(sysconfdir)
-        # Need to use oe.path here as sysconfdir starts with /
-        hosttestdir = oe.path.join(rootfs, sysconfdir, "postinst-test")
-        targettestdir = os.path.join(sysconfdir, "postinst-test")
+    @skipIfNotQemu('qemuall', 'Test only runs in qemu')
+    def test_postinst_rootfs_and_boot_systemd(self):
+        """
+        Summary:        The purpose of this test case is to verify Post-installation
+                        scripts are called when rootfs is created and also test
+                        that script can be delayed to run at first boot.
+        Dependencies:   NA
+        Steps:          1. Add proper configuration to local.conf file
+                        2. Build a "core-image-minimal" image
+                        3. Verify that file created by postinst_rootfs recipe is
+                           present on rootfs dir.
+                        4. Boot the image created on qemu and verify that the file
+                           created by postinst_boot recipe is present on image.
+        Expected:       The files are successfully created during rootfs and boot
+                        time for 3 different package managers: rpm,ipk,deb and
+                        for initialization managers: systemd.
 
-        for init_manager in ("sysvinit", "systemd"):
-            for classes in ("package_rpm", "package_deb", "package_ipk"):
-                with self.subTest(init_manager=init_manager, package_class=classes):
-                    features = 'CORE_IMAGE_EXTRA_INSTALL = "postinst-delayed-b"\n'
-                    features += 'IMAGE_FEATURES += "package-management empty-root-password"\n'
-                    features += 'PACKAGE_CLASSES = "%s"\n' % classes
-                    if init_manager == "systemd":
-                        features += 'DISTRO_FEATURES_append = " systemd"\n'
-                        features += 'VIRTUAL-RUNTIME_init_manager = "systemd"\n'
-                        features += 'DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"\n'
-                        features += 'VIRTUAL-RUNTIME_initscripts = ""\n'
-                    self.write_config(features)
-
-                    bitbake('core-image-minimal')
-
-                    self.assertTrue(os.path.isfile(os.path.join(hosttestdir, "rootfs")),
-                                    "rootfs state file was not created")
-
-                    with runqemu('core-image-minimal') as qemu:
-                        # Make the test echo a string and search for that as
-                        # run_serial()'s status code is useless.'
-                        for filename in ("rootfs", "delayed-a", "delayed-b"):
-                            status, output = qemu.run_serial("test -f %s && echo found" % os.path.join(targettestdir, filename))
-                            self.assertEqual(output, "found", "%s was not present on boot" % filename)
+        """
 
+        self.init_manager_loop("systemd")
 
 
     def test_failing_postinst(self):
-- 
2.17.1


