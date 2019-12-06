Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id B38237F968
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 01:58:22 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b19so2510052pfo.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 17:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=sJhOQ2fgQ8cUHjzdBh6VUaP/bu7MFghG48G5C3hUmVw=;
	b=BcZA6m7EkIw9uJ0ZcyWe2wIdioSH2AGvjzqrV6bsQ61WeU0704CNtCi29pU3fZR6by
	zy5kbjhqoc+ZXhuOiZxMGekZc7HBBXImpePX0aEtcaoP6/2SEDVojwELawdy8dHYip69
	goFUERxtRv97ON1SsfhBeUKWAFNbEPiG3+FjxNQRqlWfYT0/wz5O/RAJc8dM8tiYGYkz
	g8tGxd107iHtRdquNENqwzpgUzskZYwGXAGlcbykTK9Or6CYo+eL+dw0S8LdquVJgdJu
	LWkQRFWj/nrSerTS9QjBh50tWZ1whxFGg4eU8ARQsaANMkCaugi4B3R9gsqVyYUAmmQ3
	I5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sJhOQ2fgQ8cUHjzdBh6VUaP/bu7MFghG48G5C3hUmVw=;
	b=dVFppZygZWEiOA0AO0/Kygj4QHMPPtEmhpR54VmLm4e9VHl2XsstDkRp4NCRH9aiXL
	3V+29dd8j/D4tPXAaq4+o/1XefUssxe7oHYCp0ao5mn0MbwL2d3sJI18MBmJ0qJB1xCl
	O17fUuzx3qpAmTHPAf71Lbif9sWOhLHQsqq0DzdaP1oPm7pHjeu+eQJF+Rl4E3/Vrh2I
	PFUzwLWbOx4zk1lEq7KDvvIXlGUxBv4gOm3FeTqvts8IFEm33CgFQeqkI+zsF+szPvPh
	Idj25tDVDkjgCu3uY0T+FlZB36USs8AYJa2hUWddHjcwjcl915GaQgFakdte0qjEp3pm
	1AxQ==
X-Gm-Message-State: APjAAAW7Wm3uEs5phaRVXXYUt+ELfhyWJEHXbs29PMiwFylPt6vy7+8k
	o+Idz+CurmL6QtLK+NOd3hQciQ56
X-Google-Smtp-Source: APXvYqzQpZuXNt9INUTRj9ES80EiBw72OaNcaaSYyB2RGZrJSKeXwqlvxlYwhJ+pkil+xhGhT+7Xjw==
X-Received: by 2002:a63:31d0:: with SMTP id x199mr824504pgx.286.1575597503100; 
	Thu, 05 Dec 2019 17:58:23 -0800 (PST)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	z19sm12894827pfn.49.2019.12.05.17.58.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 17:58:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 17:58:20 -0800
Message-Id: <20191206015820.1839-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] oeqa/selftest/runtime_test: split systemd and sysvinit tests out
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
X-List-Received-Date: Fri, 06 Dec 2019 01:58:22 -0000

This should help debug which part of this selftest is failing.
We can not tell which outloop is failing so split the tests into
systemd and sysvinit.

See [Yocto # 13650] for more details.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 102 ++++++++++++++-----
 1 file changed, 76 insertions(+), 26 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 4b56e5beca2..94dece621b1 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -232,7 +232,7 @@ class TestImage(OESelftestTestCase):
         bitbake('-c testimage core-image-minimal')
 
 class Postinst(OESelftestTestCase):
-    def test_postinst_rootfs_and_boot(self):
+    def test_postinst_rootfs_and_boot_sysvinit(self):
         """
         Summary:        The purpose of this test case is to verify Post-installation
                         scripts are called when rootfs is created and also test
@@ -246,7 +246,7 @@ class Postinst(OESelftestTestCase):
                            created by postinst_boot recipe is present on image.
         Expected:       The files are successfully created during rootfs and boot
                         time for 3 different package managers: rpm,ipk,deb and
-                        for initialization managers: sysvinit and systemd.
+                        for initialization managers: sysvinit.
 
         """
 
@@ -261,30 +261,80 @@ class Postinst(OESelftestTestCase):
         hosttestdir = oe.path.join(rootfs, sysconfdir, "postinst-test")
         targettestdir = os.path.join(sysconfdir, "postinst-test")
 
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
+        init_manager = "sysvinit"
+        for classes in ("package_rpm", "package_deb", "package_ipk"):
+            with self.subTest(init_manager=init_manager, package_class=classes):
+                features = 'CORE_IMAGE_EXTRA_INSTALL = "postinst-delayed-b"\n'
+                features += 'IMAGE_FEATURES += "package-management empty-root-password"\n'
+                features += 'PACKAGE_CLASSES = "%s"\n' % classes
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
+
+        """
+
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
+        init_manager = "systemd"
+        for classes in ("package_rpm", "package_deb", "package_ipk"):
+            with self.subTest(init_manager=init_manager, package_class=classes):
+                features = 'CORE_IMAGE_EXTRA_INSTALL = "postinst-delayed-b"\n'
+                features += 'IMAGE_FEATURES += "package-management empty-root-password"\n'
+                features += 'PACKAGE_CLASSES = "%s"\n' % classes
+                features += 'DISTRO_FEATURES_append = " systemd"\n'
+                features += 'VIRTUAL-RUNTIME_init_manager = "systemd"\n'
+                features += 'DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"\n'
+                features += 'VIRTUAL-RUNTIME_initscripts = ""\n'
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
 
 
 
-- 
2.17.1


