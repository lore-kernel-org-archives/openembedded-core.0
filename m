Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id B9EBE78702
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 16:04:19 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id u40so14966202wrf.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 08:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Q3EwFlWk0KN5ppym7kgRH+4C74A1826pw4Z9VX4Uyu4=;
	b=agrPAZgCefsZl6u/iM8Azi7VsD6mm5Ms6E9PwLD6jpA3FQJKOsY7VcvlLxEJyPekfr
	zlY5k15D7JTQy5Gr+7QJCO4bX3XJYlrnlmOt0S4LyhLUzTjXk4JnstfOTMhOOG2vkjvD
	gk6rcwa0QtQ4O2udjg9D4OQvxj1LWf4XU2MDgeqj5KrsL3Ulkmxi/sL5cdYpIW/TJl/n
	W0xqbhTTCZpQOr3H+YE31YXl3kHRNxj0Dyz0XHjvrMbYnoCNV+Wspj9WNkTW6lndb4VR
	8PhVOTlmQeg4R8aRZYBjp4n74HzYfEV9BnFC0jzOPllu0bkJcyWdyztgOjH49/t6snbG
	FZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Q3EwFlWk0KN5ppym7kgRH+4C74A1826pw4Z9VX4Uyu4=;
	b=g7e4oeyzbm2qbKo49+wlJnwdbOAeT6B/I7yNGa5a88H3dqg/0xf8K7eA/1TnOHSqP8
	VJNTdMWBqZslcj65BnTIoUEfVPWZLVkJt8rxgFFqUvXKdS2Q7K1oxmmTvEcZ5AA2AHTc
	PIK3+5mFKeP96pTrW2BKAlCW8u9b21+GvE0s2Kp5lB0yCeHkk49UGxkPAx0+iIyUY1xj
	LiQHZ3ipyQZsur8o89/s2NC87GSl/lBnOgwNpL4EqbllhBJBS6R3tpY6l5/WeY4EAZ1B
	YQo2ZWieSGIhLU6rkHCBH5+6/rCoXh4VB9CCMcG5HY0BXcv4SZ9D2cWXNYbSjpcnSg+S
	Rtgw==
X-Gm-Message-State: AJaThX4RbErX+hB5h14L3jDPG/rVs1G9cqhzWd/gwkKi9iZt/+jcQYBj
	k0ELI1en8oh6Lfl0kWMt6Pw+snBn
X-Google-Smtp-Source: AGs4zMbNJfMGOcVDP/kCc0VG6VqdeqrtCmsAIxZ5T26ZeWr86C/O43YawGer6vhBwXYrkmMDjxTIVQ==
X-Received: by 10.223.150.2 with SMTP id b2mr19694668wra.185.1511366660133;
	Wed, 22 Nov 2017 08:04:20 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	k30sm28923728wrf.63.2017.11.22.08.04.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Nov 2017 08:04:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 16:04:14 +0000
Message-Id: <20171122160414.14093-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171122160414.14093-1-ross.burton@intel.com>
References: <20171122160414.14093-1-ross.burton@intel.com>
Subject: [PATCH 3/3] oeqa/selftest/runtime_test: simplify postinst testing
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
X-List-Received-Date: Wed, 22 Nov 2017 16:04:20 -0000

Update the packages and file names to reflect the new postinst recipe.

Fix a sh syntax error in the run_serial file exists test which was hidden by a
logic problem in the status code.

Remove the older test_verify_postinst as it's effectively a subset of
test_postinst_rootfs_and_boot, and doesn't work: when booting under systemd the
strings it searches for are not output to the console, but the test still
passes.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 82 +++++++---------------------
 1 file changed, 19 insertions(+), 63 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 25270b7535b..1c69255b568 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -167,55 +167,6 @@ class TestImage(OESelftestTestCase):
 
 class Postinst(OESelftestTestCase):
     @OETestID(1540)
-    def test_verify_postinst(self):
-        """
-        Summary: The purpose of this test is to verify the execution order of postinst Bugzilla ID: [5319]
-        Expected :
-        1. Compile a minimal image.
-        2. The compiled image will add the created layer with the recipes postinst[ abdpt]
-        3. Run qemux86
-        4. Validate the task execution order
-        Author: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
-        """
-        features = 'INHERIT += "testimage"\n'
-        features += 'CORE_IMAGE_EXTRA_INSTALL += "postinst-at-rootfs \
-postinst-delayed-a \
-postinst-delayed-b \
-postinst-delayed-d \
-postinst-delayed-p \
-postinst-delayed-t \
-"\n'
-        self.write_config(features)
-
-        bitbake('core-image-minimal -f ')
-
-        postinst_list = ['100-postinst-at-rootfs',
-                         '101-postinst-delayed-a',
-                         '102-postinst-delayed-b',
-                         '103-postinst-delayed-d',
-                         '104-postinst-delayed-p',
-                         '105-postinst-delayed-t']
-        path_workdir = get_bb_var('WORKDIR','core-image-minimal')
-        workspacedir = 'testimage/qemu_boot_log'
-        workspacedir = os.path.join(path_workdir, workspacedir)
-        rexp = re.compile("^Running postinst .*/(?P<postinst>.*)\.\.\.$")
-        with runqemu('core-image-minimal') as qemu:
-            with open(workspacedir) as f:
-                found = False
-                idx = 0
-                for line in f.readlines():
-                    line = line.strip().replace("^M","")
-                    if not line: # To avoid empty lines
-                        continue
-                    m = rexp.search(line)
-                    if m:
-                        self.assertEqual(postinst_list[idx], m.group('postinst'), "Fail")
-                        idx = idx+1
-                        found = True
-                    elif found:
-                        self.assertEqual(idx, len(postinst_list), "Not found all postinsts")
-                        break
-
     @OETestID(1545)
     def test_postinst_rootfs_and_boot(self):
         """
@@ -234,16 +185,22 @@ postinst-delayed-t \
                         for initialization managers: sysvinit and systemd.
 
         """
-        file_rootfs_name = "this-was-created-at-rootfstime"
-        fileboot_name = "this-was-created-at-first-boot"
-        rootfs_pkg = 'postinst-at-rootfs'
-        boot_pkg = 'postinst-delayed-a'
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
 
         for init_manager in ("sysvinit", "systemd"):
             for classes in ("package_rpm", "package_deb", "package_ipk"):
                 with self.subTest(init_manager=init_manager, package_class=classes):
-                    features = 'MACHINE = "qemux86"\n'
-                    features += 'CORE_IMAGE_EXTRA_INSTALL += "%s %s "\n'% (rootfs_pkg, boot_pkg)
+                    features = 'CORE_IMAGE_EXTRA_INSTALL = "postinst-delayed-b"\n'
                     features += 'IMAGE_FEATURES += "package-management empty-root-password"\n'
                     features += 'PACKAGE_CLASSES = "%s"\n' % classes
                     if init_manager == "systemd":
@@ -255,13 +212,12 @@ postinst-delayed-t \
 
                     bitbake('core-image-minimal')
 
-                    file_rootfs_created = os.path.join(get_bb_var('IMAGE_ROOTFS', "core-image-minimal"),
-                                                       file_rootfs_name)
-                    found = os.path.isfile(file_rootfs_created)
-                    self.assertTrue(found, "File %s was not created at rootfs time by %s" % \
-                                    (file_rootfs_name, rootfs_pkg))
+                    self.assertTrue(os.path.isfile(os.path.join(hosttestdir, "rootfs")),
+                                    "rootfs state file was not created")
 
-                    testcommand = 'ls /etc/' + fileboot_name
                     with runqemu('core-image-minimal') as qemu:
-                        status, output = qemu.run_serial("-f /etc/" + fileboot_name)
-                        self.assertEqual(status, 0, 'File %s was not created at first boot (%s)' % (fileboot_name, output))
+                        # Make the test echo a string and search for that as
+                        # run_serial()'s status code is useless.'
+                        for filename in ("rootfs", "delayed-a", "delayed-b"):
+                            status, output = qemu.run_serial("test -f %s && echo found" % os.path.join(targettestdir, filename))
+                            self.assertEqual(output, "found", "%s was not present on boot" % filename)
-- 
2.11.0


