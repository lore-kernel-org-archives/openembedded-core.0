Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B1FC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:41:26 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.41638.1745332879843359447
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MYoWZ0JM;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54298ec925bso7688802e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 07:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745332878; x=1745937678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zfyGfZtVCp0pRIVpSER0JHZUAr8IRbZx8Z/BGK1k+6Y=;
        b=MYoWZ0JM842TEzqDbq9bTxjYHuVKAXpqF0/MKHSQP6EunCetrWYJ9y8pcHvZo0zOMO
         aH4whaL5e/To572yy+jfanXXjsycr9mrhld8SM/qqxNTf6pav4XrdvcT+U4eA6YdjyWr
         Dm5wJSOt9v0frmHgnk3AJhXk7NJdaUrWb34M7REx4usHPvM0glehI0joT/fY2Tt3MH+R
         lWOYkWa2Ly2wBCPsSWQjl64h3CQhWHcxICErF8Y0yRNjcui3m5mzHotLKQm/+zYI61VX
         90Rd56G0mPzOduxjOSxvyhg6HPTcyhsgajVPXJY3h7A3WAI1BzH+TzJn+n9gWslngKCb
         QqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332878; x=1745937678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfyGfZtVCp0pRIVpSER0JHZUAr8IRbZx8Z/BGK1k+6Y=;
        b=R6mOaM+p6DIjnM4UiuKHATAEg+xNiQkELh+4a/5Sv0e6pT1gj/bIf9rD22kL0CoKUW
         aEHuK+/ah1Smc296aLsHUhhTLyvJUToeo/cF3/W89LxxmJNazMLqaEA+3fg13PZL50Ym
         Vwj08RYm2hxS5tLUlvsPZDcKIMW+wKRVVSpHScJLiXWe4XujoESPYOuj7a1tm0SaFqqt
         OGg9X6W8MFqER+S3C8GLIaQeEFL9TgUt/GspbpqPyaJJuH+0hW9RxQoKuWj22XtBrhQ2
         a/wFJbRyGBpfdiOxwDQE9xvuK4m2U/tAFp5NoT7/Blg4REF7dLxwS9cqPI1JhR3sp5rB
         Joww==
X-Gm-Message-State: AOJu0Yyb3rUqJx7/WvSYtOlPWAr0jUG2EeSD1Wz62Fufl/c/V88n2cqc
	FtlLXhn+Y68fSGP1CKQuKHiwMujdAHh6boiHEWwv5cwlZrqhw7ZfKcQuPdJaBUqv18zoMTwP3zd
	xi7A=
X-Gm-Gg: ASbGncsT7tW2QJbp5A+yzXfhkBym1kmqD6J/9uOG7wHdVujhB4lnyQpi++EEa94uODG
	mGA/uGlUAYHWh0jaVE5TYHSWNY3s57lvF5gLSWgqaZDm8tOJIamn04kTFOZHQilkLmBlejd1Awc
	azJShdgE9JGv1GIeVpIB7mdpYL4TvhT4IhvY+vkTWRbbBGyzVPovkyzJ0LQwp6cnujrZto1o59H
	zZghS8ZYdMpY0ruYQn+YvAtE197yAjiLoC+n4t+IpkSZDAMPU0Vw06r+AtauolNwYusneH/TW5e
	+XYztiqa5P3SqCGHLqckNgv922lEmuIq0+RjOPQnfE3sQJ7qH7W839BlScJBVahLDnS+wDKZexg
	b94g0bcyY5C0lyVvqhQ==
X-Google-Smtp-Source: AGHT+IHFPg6l2zvJg6vOJs8Uril+T3QbxtEJ2mbLVP0jtPWtTWjrzgMmzyjfWs0IB5IRGbqXeWgf2g==
X-Received: by 2002:a05:6512:b0f:b0:54d:65cb:6c28 with SMTP id 2adb3069b0e04-54d6e61a356mr4278341e87.9.1745332877820;
        Tue, 22 Apr 2025 07:41:17 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5cfdcesm1212582e87.139.2025.04.22.07.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:41:17 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] oeqa selftest: read qemu options from TEST_RUNQEMUPARAMS
Date: Tue, 22 Apr 2025 17:41:06 +0300
Message-ID: <20250422144106.100804-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215225

To support "slirp" userspace networking which works more easily
on various build machines, also without root and sudo rights
to setup loop interfaces.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/barebox.py       |  5 +++--
 meta/lib/oeqa/selftest/cases/debuginfod.py    |  4 +++-
 meta/lib/oeqa/selftest/cases/devtool.py       |  6 ++++--
 .../oeqa/selftest/cases/efibootpartition.py   |  3 ++-
 meta/lib/oeqa/selftest/cases/gcc.py           |  3 ++-
 meta/lib/oeqa/selftest/cases/gdbserver.py     |  3 ++-
 meta/lib/oeqa/selftest/cases/glibc.py         |  3 ++-
 meta/lib/oeqa/selftest/cases/imagefeatures.py |  3 ++-
 meta/lib/oeqa/selftest/cases/locales.py       |  5 +++--
 meta/lib/oeqa/selftest/cases/overlayfs.py     | 19 ++++++++++++-------
 meta/lib/oeqa/selftest/cases/package.py       |  6 ++++--
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  6 ++++--
 meta/lib/oeqa/selftest/cases/rust.py          |  3 ++-
 meta/lib/oeqa/selftest/cases/uboot.py         |  3 ++-
 14 files changed, 47 insertions(+), 25 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/barebox.py b/meta/lib/oeqa/selftest/cases/barebox.py
index 3f8f232432..b4d8310666 100644
--- a/meta/lib/oeqa/selftest/cases/barebox.py
+++ b/meta/lib/oeqa/selftest/cases/barebox.py
@@ -6,7 +6,7 @@
 #
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu
+from oeqa.utils.commands import bitbake, runqemu, get_bb_var
 from oeqa.core.decorator.data import skipIfNotArch
 from oeqa.core.decorator import OETestTag
 
@@ -34,7 +34,8 @@ QEMU_USE_KVM = "False"
 
         bitbake("virtual/bootloader core-image-minimal")
 
-        with runqemu('core-image-minimal', ssh=False, runqemuparams='nographic',
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+        with runqemu('core-image-minimal', ssh=False, runqemuparams='nographic %s' % (runqemu_params),
                      boot_patterns=barebox_boot_patterns) as qemu:
 
             # test if barebox console works
diff --git a/meta/lib/oeqa/selftest/cases/debuginfod.py b/meta/lib/oeqa/selftest/cases/debuginfod.py
index 46c0cd87bb..22d198b65b 100644
--- a/meta/lib/oeqa/selftest/cases/debuginfod.py
+++ b/meta/lib/oeqa/selftest/cases/debuginfod.py
@@ -147,10 +147,12 @@ CORE_IMAGE_EXTRA_INSTALL += "elfutils xz"
         """)
         bitbake("core-image-minimal elfutils-native:do_addto_recipe_sysroot xz:do_localpkgfeed")
 
+        runqemu_params = get_bb_var("TEST_RUNQEMUPARAMS", "core-image-minimal") or ""
+
         try:
             self.start_debuginfod(get_bb_var("LOCALPKGFEED_DIR", "xz"))
 
-            with runqemu("core-image-minimal", runqemuparams="nographic") as qemu:
+            with runqemu("core-image-minimal", runqemuparams="nographic %s" % runqemu_params) as qemu:
                 cmd = "DEBUGINFOD_URLS=http://%s:%d/ debuginfod-find debuginfo /usr/bin/xz" % (qemu.server_ip, self.port)
                 self.logger.info(f"Starting client {cmd}")
                 status, output = qemu.run_serial(cmd)
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 0155ee62ee..c9081264e8 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1836,8 +1836,9 @@ class DevtoolDeployTargetTests(DevtoolBase):
         # First try a dry-run of deploy-target
         result = runCmd('devtool deploy-target -n %s root@localhost' % testrecipe)
         self.assertIn('  %s' % testfile, result.output)
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', testimage) or ""
         # Boot the image
-        with runqemu(testimage) as qemu:
+        with runqemu(testimage, runqemuparams=runqemu_params) as qemu:
             # Now really test deploy-target
             result = runCmd('devtool deploy-target -c %s root@%s' % (testrecipe, qemu.ip))
             # Run a test command to see if it was installed properly
@@ -2810,7 +2811,8 @@ class DevtoolIdeSdkTests(DevtoolBase):
 
         # Verify deployment to Qemu (system mode) works
         bitbake(testimage)
-        with runqemu(testimage, runqemuparams="nographic") as qemu:
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+        with runqemu(testimage, runqemuparams="nographic %s" % runqemu_params) as qemu:
             # cmake-example recipe
             recipe_name = "cmake-example"
             example_exe = "cmake-example"
diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py b/meta/lib/oeqa/selftest/cases/efibootpartition.py
index fcfcdaf7e4..b831aec81a 100644
--- a/meta/lib/oeqa/selftest/cases/efibootpartition.py
+++ b/meta/lib/oeqa/selftest/cases/efibootpartition.py
@@ -30,5 +30,6 @@ IMAGE_INSTALL:append = " grub-efi kernel-image-bzimage"
 % (image))
 
         bitbake(image + " ovmf")
-        with runqemu(image, ssh=False, launch_cmd=cmd) as qemu:
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', image) or ""
+        with runqemu(image, ssh=False, launch_cmd=cmd, runqemuparams=runqemu_params) as qemu:
             self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 1bda29a72b..0d27e9b2e6 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -79,7 +79,8 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
         bitbake("core-image-minimal")
 
         # wrap the execution with a qemu instance
-        with runqemu("core-image-minimal", runqemuparams = "nographic") as qemu:
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+        with runqemu("core-image-minimal", runqemuparams = "nographic %s" % runqemu_params) as qemu:
             # validate that SSH is working
             status, _ = qemu.run("uname")
             self.assertEqual(status, 0)
diff --git a/meta/lib/oeqa/selftest/cases/gdbserver.py b/meta/lib/oeqa/selftest/cases/gdbserver.py
index b6b7c5c473..99c9e5ed59 100644
--- a/meta/lib/oeqa/selftest/cases/gdbserver.py
+++ b/meta/lib/oeqa/selftest/cases/gdbserver.py
@@ -42,7 +42,8 @@ CORE_IMAGE_EXTRA_INSTALL = "gdbserver"
             filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.tar.bz2" % bb_vars['IMAGE_LINK_NAME'])
             shutil.unpack_archive(filename, debugfs)
 
-            with runqemu("core-image-minimal", runqemuparams="nographic") as qemu:
+            runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+            with runqemu("core-image-minimal", runqemuparams="nographic %s" % runqemu_params) as qemu:
                 status, output = qemu.run_serial("kmod --help")
                 self.assertIn("modprobe", output)
 
diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index bd56b2f6e7..89114d72ba 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -70,7 +70,8 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             bitbake("core-image-minimal")
 
             # start runqemu
-            qemu = s.enter_context(runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams = "-m 1024"))
+            runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+            qemu = s.enter_context(runqemu("core-image-minimal", runqemuparams = "nographic %s" % runqemu_params, qemuparams = "-m 1024"))
 
             # validate that SSH is working
             status, _ = qemu.run("uname")
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 94d01ba116..c46022c49f 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -36,7 +36,8 @@ class ImageFeatures(OESelftestTestCase):
         # Build a core-image-minimal
         bitbake('core-image-minimal')
 
-        with runqemu("core-image-minimal") as qemu:
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+        with runqemu("core-image-minimal", runqemuparams=runqemu_params) as qemu:
             # Attempt to ssh with each user into qemu with empty password
             for user in [self.root_user, self.test_user]:
                 ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user=user)
diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/oeqa/selftest/cases/locales.py
index ac4888ef66..372421a3dc 100644
--- a/meta/lib/oeqa/selftest/cases/locales.py
+++ b/meta/lib/oeqa/selftest/cases/locales.py
@@ -4,7 +4,7 @@
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator import OETestTag
-from oeqa.utils.commands import bitbake, runqemu
+from oeqa.utils.commands import bitbake, runqemu, get_bb_var
 
 class LocalesTest(OESelftestTestCase):
 
@@ -25,7 +25,8 @@ class LocalesTest(OESelftestTestCase):
         # Build a core-image-minimal
         bitbake('core-image-minimal')
 
-        with runqemu("core-image-minimal", ssh=False, runqemuparams='nographic') as qemu:
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+        with runqemu("core-image-minimal", ssh=False, runqemuparams='nographic %s' % runqemu_params) as qemu:
             cmd = "locale -a"
             status, output = qemu.run_serial(cmd)
             # output must includes fr_FR or fr_FR.UTF-8
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index 580fbdcb9c..9601cbef4a 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -5,7 +5,7 @@
 #
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu, get_bb_vars
+from oeqa.utils.commands import bitbake, runqemu, get_bb_var, get_bb_vars
 from oeqa.core.decorator import OETestTag
 from oeqa.core.decorator.data import skipIfNotMachine
 
@@ -181,7 +181,8 @@ EOT
 
         bitbake('core-image-minimal')
 
-        with runqemu('core-image-minimal') as qemu:
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+        with runqemu('core-image-minimal', runqemuparams=runqemu_params) as qemu:
             # Check that application service started
             status, output = qemu.run_serial("systemctl status my-application")
             self.assertTrue("active (exited)" in output, msg=output)
@@ -360,7 +361,8 @@ OVERLAYFS_ROOTFS_TYPE = "ext4"
 
         bitbake('core-image-minimal')
 
-        with runqemu('core-image-minimal', image_fstype='wic') as qemu:
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+        with runqemu('core-image-minimal', runqemuparams=runqemu_params, image_fstype='wic') as qemu:
             status, output = qemu.run_serial("/bin/mount")
 
             line = getline_qemu(output, "upperdir=/data/overlay-etc/upper")
@@ -399,7 +401,8 @@ OVERLAYFS_ROOTFS_TYPE = "ext4"
         bitbake('core-image-minimal')
         testFile = "/etc/my-test-data"
 
-        with runqemu('core-image-minimal', image_fstype='wic', discard_writes=False) as qemu:
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+        with runqemu('core-image-minimal', runqemuparams=runqemu_params, image_fstype='wic', discard_writes=False) as qemu:
             status, output = qemu.run_serial("/bin/mount")
 
             line = getline_qemu(output, "/dev/sda3")
@@ -420,7 +423,7 @@ OVERLAYFS_ROOTFS_TYPE = "ext4"
             self.assertTrue(line and line.startswith(testFile), msg=output)
 
         # Check that file exists in /etc after reboot
-        with runqemu('core-image-minimal', image_fstype='wic') as qemu:
+        with runqemu('core-image-minimal', runqemuparams=runqemu_params, image_fstype='wic') as qemu:
             status, output = qemu.run_serial("ls -1 " + testFile)
             line = getline_qemu(output, testFile)
             self.assertTrue(line and line.startswith(testFile), msg=output)
@@ -454,7 +457,8 @@ IMAGE_INSTALL:append = " overlayfs-user"
         self.append_config(configLower)
         bitbake('core-image-minimal')
 
-        with runqemu('core-image-minimal', image_fstype='wic') as qemu:
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+        with runqemu('core-image-minimal', runqemuparams=runqemu_params, image_fstype='wic') as qemu:
             status, output = qemu.run_serial("echo \"Modified in upper\" > /etc/" + testFile)
             status, output = qemu.run_serial("diff /etc/" + testFile + " /data/overlay-etc/lower/" + testFile)
             line = getline_qemu(output, "Modified in upper")
@@ -500,7 +504,8 @@ IMAGE_INSTALL:append = " overlayfs-user"
 
         res = bitbake('core-image-minimal')
 
-        with runqemu('core-image-minimal', image_fstype='wic') as qemu:
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+        with runqemu('core-image-minimal', runqemuparams=runqemu_params, image_fstype='wic') as qemu:
             for filename in ("rootfs", "delayed-a", "delayed-b"):
                 status, output = qemu.run_serial("test -f %s && echo found" % os.path.join(targettestdir, filename))
                 self.assertIn("found", output, "%s was not present on boot" % filename)
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 38ed7173fe..44e30cec50 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -177,7 +177,8 @@ class PackageTests(OESelftestTestCase):
             self.logger.error("GDB result:\n%d: %s", status, output)
             return False
 
-        with runqemu('core-image-minimal') as qemu:
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+        with runqemu('core-image-minimal', runqemuparams=runqemu_params) as qemu:
             for binary in ['/usr/bin/hello1',
                            '/usr/bin/hello2',
                            '/usr/libexec/hello3',
@@ -202,7 +203,8 @@ class PackageTests(OESelftestTestCase):
                 self.fail("Cannot parse output: " + output)
 
         sysconfdir = get_bb_var('sysconfdir', 'selftest-chown')
-        with runqemu('core-image-minimal') as qemu:
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+        with runqemu('core-image-minimal', runqemuparams=runqemu_params) as qemu:
             for path in [ sysconfdir + "/selftest-chown/file",
                           sysconfdir + "/selftest-chown/dir",
                           sysconfdir + "/selftest-chown/symlink",
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 4843d810a2..8c9cfa0c54 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -42,7 +42,8 @@ class TestExport(OESelftestTestCase):
         isdir = os.path.isdir(testexport_dir)
         self.assertEqual(True, isdir, 'Failed to create testexport dir: %s' % testexport_dir)
 
-        with runqemu('core-image-minimal') as qemu:
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+        with runqemu('core-image-minimal', runqemuparams=runqemu_params) as qemu:
             # Attempt to run runexported.py to perform ping test
             test_path = os.path.join(testexport_dir, "oe-test")
             data_file = os.path.join(testexport_dir, 'data', 'testdata.json')
@@ -320,7 +321,8 @@ class Postinst(OESelftestTestCase):
                 self.assertTrue(os.path.isfile(os.path.join(hosttestdir, "rootfs")),
                                 "rootfs state file was not created")
 
-                with runqemu('core-image-minimal') as qemu:
+                runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+                with runqemu('core-image-minimal', runqemuparams=runqemu_params) as qemu:
                     # Make the test echo a string and search for that as
                     # run_serial()'s status code is useless.'
                     for filename in ("rootfs", "delayed-a", "delayed-b"):
diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 1098e902fc..f84b87d0f5 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -99,7 +99,8 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
 
         # wrap the execution with a qemu instance.
         # Tests are run with 512 tasks in parallel to execute all tests very quickly
-        with runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams = "-m 512") as qemu:
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+        with runqemu("core-image-minimal", runqemuparams = "nographic %s" % runqemu_params, qemuparams = "-m 512") as qemu:
             # Copy remote-test-server to image through scp
             host_sys = get_bb_var("RUST_BUILD_SYS", "rust")
             ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user="root")
diff --git a/meta/lib/oeqa/selftest/cases/uboot.py b/meta/lib/oeqa/selftest/cases/uboot.py
index 96da4efb06..de082fe266 100644
--- a/meta/lib/oeqa/selftest/cases/uboot.py
+++ b/meta/lib/oeqa/selftest/cases/uboot.py
@@ -33,7 +33,8 @@ QEMU_USE_KVM = "False"
 """)
         bitbake("virtual/bootloader core-image-minimal")
 
-        with runqemu('core-image-minimal', ssh=False, runqemuparams='nographic',
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
+        with runqemu('core-image-minimal', ssh=False, runqemuparams='nographic %s' % runqemu_params,
                      boot_patterns=uboot_boot_patterns) as qemu:
 
             # test if u-boot console works
-- 
2.43.0


