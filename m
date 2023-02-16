Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D073AC636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 09:54:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.6587.1676541289026165228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 01:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=vEzQelEv;
 spf=pass (domain: baylibre.com, ip: 209.85.128.44, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f44.google.com with SMTP id he5so1122436wmb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 01:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5a38el69DWVfQcaxlso+JIfL4rVFN1mYi8ymAiVse3Q=;
        b=vEzQelEvp1Gln7kSW1JryQF4FsjTw014Zp7ArbMGgqRNxB6CLEdDb3srfZ3F4AlQM5
         pCpkEaMqd0WrtoRbRRC7SWY5pWPuF/yiaEWcX5W0+xmx9aiVKZs1pfHOYDoRvVU+pNVt
         oyGk7v0sx7JKmjawMOkh5bexlXPn2TqKKZIZrkCnGjGbWijbMwD1CYWrup6A49slCWFC
         ysFOPC/8FL09ksHlGmFLPjoGOVHumJVHT/PUxYQ3dmNMWsRJjorAN2FGabVbeaFC69qy
         rdhuM21Mz/aUaN9pGg5Cj9fmc89tndmTSdwTTFyQlxRESElnuWV75TXjlA3maCeM7+Oy
         dwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5a38el69DWVfQcaxlso+JIfL4rVFN1mYi8ymAiVse3Q=;
        b=LhnddHsEb3LNdNctdYQSoDdVWf37vAgKn7iHB1ru2gSXJTqJlmOrs8esvZQ1qsturF
         A66fEwf26YOGzrg3jfPjGJ838qu9WKmL2RFmw7fOIRodA4nWWXRrr/j3VWL2LXdggv1r
         VmPNS/fV2hREYK6LuZTDTFhlgSlKRDzRc4X1e8gcyOSaFKr4ZBU9iBGHKZSm9SLCDGTR
         TjrVXdJ51b6PKeBRi/2i3mNEFzactJ90HMTPm6aSBopu+Ino2y38GkJCGdhnKwNYSOvo
         qOwpt3SeFdc9nHM1St2V0oJONJ4vF8t0qEux+GJO+39KxEslo7hhAmylrT7I/5/5jakc
         3Cig==
X-Gm-Message-State: AO0yUKXjQiRZyjzBaucoeTpZTO4SNDpUoKeoQQC+MvF+c6AtwP1/HrCy
	U23Kot1kCpfJ97IqoihTxLDLOQO/C5vupN9Z
X-Google-Smtp-Source: AK7set9xW0Ps7Cag8DRfKqbJ8N0MRB/XFZlnnVfoUXTGd6zrP2vn7m3S/fQWPEmM2QExnynjd7TdFw==
X-Received: by 2002:a05:600c:318f:b0:3df:e468:17dc with SMTP id s15-20020a05600c318f00b003dfe46817dcmr4297075wmp.40.1676541287432;
        Thu, 16 Feb 2023 01:54:47 -0800 (PST)
Received: from midgar.. (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bca49000000b003c6bbe910fdsm4849560wml.9.2023.02.16.01.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:54:47 -0800 (PST)
From: Louis Rannou <lrannou@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: khilman@baylibre.com,
	Louis Rannou <lrannou@baylibre.com>
Subject: [PATCH 2/2] oeqa/utils/qemurunner: remove deprecated usage of run_serial
Date: Thu, 16 Feb 2023 10:54:40 +0100
Message-Id: <20230216095440.1990542-2-lrannou@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216095440.1990542-1-lrannou@baylibre.com>
References: <20230216095440.1990542-1-lrannou@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 09:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177281

change tests to use the new serial runner run_serial_socket instead of the
deprecated run_serial.

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
---
 meta/lib/oeqa/runtime/cases/_qemutiny.py     |  2 +-
 meta/lib/oeqa/selftest/cases/overlayfs.py    | 20 ++++----
 meta/lib/oeqa/selftest/cases/package.py      |  4 +-
 meta/lib/oeqa/selftest/cases/runqemu.py      |  2 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py |  4 +-
 meta/lib/oeqa/selftest/cases/wic.py          | 50 ++++++++++----------
 meta/lib/oeqa/utils/dump.py                  |  2 +-
 7 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/_qemutiny.py b/meta/lib/oeqa/runtime/cases/_qemutiny.py
index 6886e36502..a6be56b6f6 100644
--- a/meta/lib/oeqa/runtime/cases/_qemutiny.py
+++ b/meta/lib/oeqa/runtime/cases/_qemutiny.py
@@ -7,6 +7,6 @@ from oeqa.runtime.case import OERuntimeTestCase
 class QemuTinyTest(OERuntimeTestCase):
 
     def test_boot_tiny(self):
-        status, output = self.target.run_serial('uname -a')
+        status, output = self.target.run_serial_socket('uname -a')
         msg = "Cannot detect poky tiny boot!"
         self.assertTrue("yocto-tiny" in output, msg)
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index 96beb8b869..e5aece9f92 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -180,20 +180,20 @@ EOT
 
         with runqemu('core-image-minimal') as qemu:
             # Check that application service started
-            status, output = qemu.run_serial("systemctl status my-application")
+            status, output = qemu.run_serial_socket("systemctl status my-application")
             self.assertTrue("active (exited)" in output, msg=output)
 
             # Check that overlay mounts are dependencies of our application unit
-            status, output = qemu.run_serial("systemctl list-dependencies my-application")
+            status, output = qemu.run_serial_socket("systemctl list-dependencies my-application")
             self.assertTrue("overlayfs-user-overlays.service" in output, msg=output)
 
-            status, output = qemu.run_serial("systemctl list-dependencies overlayfs-user-overlays")
+            status, output = qemu.run_serial_socket("systemctl list-dependencies overlayfs-user-overlays")
             self.assertTrue("usr-share-another\\x2doverlay\\x2dmount.mount" in output, msg=output)
             self.assertTrue("usr-share-my\\x2dapplication.mount" in output, msg=output)
 
             # Check that we have /mnt/overlay fs mounted as tmpfs and
             # /usr/share/my-application as an overlay (see overlayfs-user recipe)
-            status, output = qemu.run_serial("/bin/mount -t tmpfs,overlay")
+            status, output = qemu.run_serial_socket("/bin/mount -t tmpfs,overlay")
 
             line = getline_qemu(output, "on /mnt/overlay")
             self.assertTrue(line and line.startswith("tmpfs"), msg=output)
@@ -372,7 +372,7 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
         bitbake('core-image-minimal')
 
         with runqemu('core-image-minimal', image_fstype='wic') as qemu:
-            status, output = qemu.run_serial("/bin/mount")
+            status, output = qemu.run_serial_socket("/bin/mount")
 
             line = getline_qemu(output, "upperdir=/data/overlay-etc/upper")
             self.assertFalse(line, msg=output)
@@ -424,7 +424,7 @@ OVERLAYFS_ETC_USE_ORIG_INIT_NAME = "{OVERLAYFS_ETC_USE_ORIG_INIT_NAME}"
         testFile = "/etc/my-test-data"
 
         with runqemu('core-image-minimal', image_fstype='wic', discard_writes=False) as qemu:
-            status, output = qemu.run_serial("/bin/mount")
+            status, output = qemu.run_serial_socket("/bin/mount")
 
             line = getline_qemu(output, "/dev/sda3")
             self.assertTrue("/data" in output, msg=output)
@@ -432,14 +432,14 @@ OVERLAYFS_ETC_USE_ORIG_INIT_NAME = "{OVERLAYFS_ETC_USE_ORIG_INIT_NAME}"
             line = getline_qemu(output, "upperdir=/data/overlay-etc/upper")
             self.assertTrue(line and line.startswith("/data/overlay-etc/upper on /etc type overlay"), msg=output)
 
-            status, output = qemu.run_serial("touch " + testFile)
-            status, output = qemu.run_serial("sync")
-            status, output = qemu.run_serial("ls -1 " + testFile)
+            status, output = qemu.run_serial_socket("touch " + testFile)
+            status, output = qemu.run_serial_socket("sync")
+            status, output = qemu.run_serial_socket("ls -1 " + testFile)
             line = getline_qemu(output, testFile)
             self.assertTrue(line and line.startswith(testFile), msg=output)
 
         # Check that file exists in /etc after reboot
         with runqemu('core-image-minimal', image_fstype='wic') as qemu:
-            status, output = qemu.run_serial("ls -1 " + testFile)
+            status, output = qemu.run_serial_socket("ls -1 " + testFile)
             line = getline_qemu(output, testFile)
             self.assertTrue(line and line.startswith(testFile), msg=output)
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 51d835259e..897bfcf321 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -126,7 +126,7 @@ class PackageTests(OESelftestTestCase):
             Check that gdb ``binary`` to read symbols from separated debug file
             """
             self.logger.info("gdbtest %s" % binary)
-            status, output = qemu.run_serial('/usr/bin/gdb.sh %s' % binary, timeout=60)
+            status, output = qemu.run_serial_socket('/usr/bin/gdb.sh %s' % binary, timeout=60)
             for l in output.split('\n'):
                 # Check debugging symbols exists
                 if '(no debugging symbols found)' in l:
@@ -157,7 +157,7 @@ class PackageTests(OESelftestTestCase):
         sysconfdir = get_bb_var('sysconfdir', 'selftest-chown')
         def check_ownership(qemu, gid, uid, path):
             self.logger.info("Check ownership of %s", path)
-            status, output = qemu.run_serial(r'/bin/stat -c "%U %G" ' + path, timeout=60)
+            status, output = qemu.run_serial_socket(r'/bin/stat -c "%U %G" ' + path, timeout=60)
             output = output.split(" ")
             if output[0] != uid or output[1] != gid :
                 self.logger.error("Incrrect ownership %s [%s:%s]", path, output[0], output[1])
diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index c1d277a095..7efbf6cbbd 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -169,7 +169,7 @@ class QemuTest(OESelftestTestCase):
         # (such as the exception "Console connection closed unexpectedly")
         # as qemu will disappear when we shut it down
         qemu.runner.allowexit()
-        qemu.run_serial("shutdown -h now")
+        qemu.run_serial_socket("shutdown -h now")
         time_track = 0
         try:
             while True:
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 858f12ec90..3ec845d6da 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -312,9 +312,9 @@ class Postinst(OESelftestTestCase):
 
                 with runqemu('core-image-minimal') as qemu:
                     # Make the test echo a string and search for that as
-                    # run_serial()'s status code is useless.'
+                    # run_serial_socket()'s status code is useless.'
                     for filename in ("rootfs", "delayed-a", "delayed-b"):
-                        status, output = qemu.run_serial("test -f %s && echo found" % os.path.join(targettestdir, filename))
+                        status, output = qemu.run_serial_socket("test -f %s && echo found" % os.path.join(targettestdir, filename))
                         self.assertIn("found", output, "%s was not present on boot" % filename)
 
 
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 49fb6fe52c..8442008d6b 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -850,12 +850,12 @@ class Wic2(WicTestCase):
         with runqemu('wic-image-minimal', ssh=False, runqemuparams='nographic') as qemu:
             cmd = "mount | grep '^/dev/' | cut -f1,3 -d ' ' | egrep -c -e '/dev/sda1 /boot' " \
                   "-e '/dev/root /|/dev/sda2 /' -e '/dev/sda3 /media' -e '/dev/sda4 /mnt'"
-            status, output = qemu.run_serial(cmd)
-            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            status, output = qemu.run_serial_socket(cmd)
+            self.assertEqual(0, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '4')
             cmd = "grep UUID= /etc/fstab"
-            status, output = qemu.run_serial(cmd)
-            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            status, output = qemu.run_serial_socket(cmd)
+            self.assertEqual(0, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, 'UUID=2c71ef06-a81d-4735-9d3a-379b69c6bdba\t/media\text4\tdefaults\t0\t0')
 
     @only_for_arch(['i586', 'i686', 'x86_64'])
@@ -870,8 +870,8 @@ class Wic2(WicTestCase):
         with runqemu('core-image-minimal', ssh=False,
                      runqemuparams='nographic ovmf', image_fstype='wic') as qemu:
             cmd = "grep sda. /proc/partitions  |wc -l"
-            status, output = qemu.run_serial(cmd)
-            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            status, output = qemu.run_serial_socket(cmd)
+            self.assertEqual(0, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '3')
 
     @staticmethod
@@ -1060,8 +1060,8 @@ class Wic2(WicTestCase):
         with runqemu('core-image-minimal-mtdutils', ssh=False,
                      runqemuparams='nographic', image_fstype='wic') as qemu:
             cmd = "grep sda. /proc/partitions  |wc -l"
-            status, output = qemu.run_serial(cmd)
-            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            status, output = qemu.run_serial_socket(cmd)
+            self.assertEqual(0, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '2')
 
     def _rawcopy_plugin(self, fstype):
@@ -1122,24 +1122,24 @@ class Wic2(WicTestCase):
                      runqemuparams='nographic', image_fstype='wic') as qemu:
             # Check that we have ONLY two /dev/sda* partitions (/boot and /)
             cmd = "grep sda. /proc/partitions | wc -l"
-            status, output = qemu.run_serial(cmd)
-            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            status, output = qemu.run_serial_socket(cmd)
+            self.assertEqual(0, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '2')
             # Check that /dev/sda1 is /boot and that either /dev/root OR /dev/sda2 is /
             cmd = "mount | grep '^/dev/' | cut -f1,3 -d ' ' | egrep -c -e '/dev/sda1 /boot' -e '/dev/root /|/dev/sda2 /'"
-            status, output = qemu.run_serial(cmd)
-            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            status, output = qemu.run_serial_socket(cmd)
+            self.assertEqual(0, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '2')
             # Check that /boot has EFI bootx64.efi (required for EFI)
             cmd = "ls /boot/EFI/BOOT/bootx64.efi | wc -l"
-            status, output = qemu.run_serial(cmd)
-            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            status, output = qemu.run_serial_socket(cmd)
+            self.assertEqual(0, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '1')
             # Check that "BOOTABLE" flag is set on boot partition (required for PC-Bios)
-            # Trailing "cat" seems to be required; otherwise run_serial() sends back echo of the input command
+            # Trailing "cat" seems to be required; otherwise run_serial_socket() sends back echo of the input command
             cmd = "fdisk -l /dev/sda | grep /dev/sda1 | awk {print'$2'} | cat"
-            status, output = qemu.run_serial(cmd)
-            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            status, output = qemu.run_serial_socket(cmd)
+            self.assertEqual(0, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '*')
 
     @only_for_arch(['i586', 'i686', 'x86_64'])
@@ -1185,18 +1185,18 @@ class Wic2(WicTestCase):
                      runqemuparams='nographic ovmf', image_fstype='wic') as qemu:
             # Check that /boot has EFI bootx64.efi (required for EFI)
             cmd = "ls /boot/EFI/BOOT/bootx64.efi | wc -l"
-            status, output = qemu.run_serial(cmd)
-            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            status, output = qemu.run_serial_socket(cmd)
+            self.assertEqual(0, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '1')
             # Check that /boot has EFI/Linux/linux.efi (required for Unified Kernel Images auto detection)
             cmd = "ls /boot/EFI/Linux/linux.efi | wc -l"
-            status, output = qemu.run_serial(cmd)
-            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            status, output = qemu.run_serial_socket(cmd)
+            self.assertEqual(0, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '1')
             # Check that /boot doesn't have loader/entries/boot.conf (Unified Kernel Images are auto detected by the bootloader)
             cmd = "ls /boot/loader/entries/boot.conf 2&>/dev/null | wc -l"
-            status, output = qemu.run_serial(cmd)
-            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            status, output = qemu.run_serial_socket(cmd)
+            self.assertEqual(0, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '0')
 
     def test_fs_types(self):
@@ -1333,8 +1333,8 @@ class Wic2(WicTestCase):
             # Check if it boots in qemu
             with runqemu('core-image-minimal', ssh=False, runqemuparams='nographic') as qemu:
                 cmd = "ls /etc/"
-                status, output = qemu.run_serial('true')
-                self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+                status, output = qemu.run_serial_socket('true')
+                self.assertEqual(0, status, 'Failed to run command "%s": %s' % (cmd, output))
         finally:
             if os.path.exists(new_image_path):
                 os.unlink(new_image_path)
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 95a79a571c..7e5cccb90c 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -103,7 +103,7 @@ class TargetDumper(BaseDumper):
         for cmd in self.cmds:
             # We can continue with the testing if serial commands fail
             try:
-                (status, output) = self.runner.run_serial(cmd)
+                (status, output) = self.runner.run_serial_socket(cmd)
                 self._write_dump(cmd.split()[0], output)
             except:
                 print("Tried to dump info from target but "
-- 
2.39.1


