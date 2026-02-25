Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5727CEFD206
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 07:50:00 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40876.1772005793233351178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 23:49:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iiiU8jpS;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8cb7edbcde6so628890985a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 23:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772005792; x=1772610592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vp1P5Bz54Oi8EFLzVvK5Jr2FCwTCjY48580Uuc34eD0=;
        b=iiiU8jpSIIRDY/jgQGlIrkxz5tNkVeRqoStViFvnUZiUOkRfd4K0r0mvfyDaUmIbjF
         JWvqo8eHm99aAmi9jTaOT5b4HBjUU2DLjyEYHCa3hSSA0uuvLVrt4vWSlmVacGCrb/Zp
         BhPvx1ha3CUJeScWw96yQWi/TOzoyDWQumRgaNk+QqvQQnp+KS9BycD3oYILPru+YnuY
         RJz3kCp4OzsJt0EykedH3cugxNWnEu/j5fWOYcSHEOxjfL7VypZpUEUiv9D0YAm4tRiE
         l1AZJv69dNYjMDJFW6I3GTDp/RANEb0ejJFuM1XhcVvkbFp+jm+Ocjk0SdiL5H8UQp/o
         Gn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772005792; x=1772610592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vp1P5Bz54Oi8EFLzVvK5Jr2FCwTCjY48580Uuc34eD0=;
        b=q9KK4uII2l/F0+/z8sLbdlBqqZazzan5BVJKuv86IB7bTfVkcoqGzscjAb85JjsY++
         MRu6hgnx84kY/GOWjVuntPL4r6rRfjN6ewX5b/V53nmblJBTX53H7EtITfN12jMHa8iZ
         myQlkAkjuwz4qjIscu4zrKUBkGDX8pbxJXOZ2y9lguu1hM2/BO7yV7zr9QyiF8GGLXNB
         SrKWCYJDy3hM7zHiLTylcK53qY/nhlH2haYIE9aByNXIMs1iTUnhdFriU+3CHHwxBI1T
         plWOu/lJIEezfcOdgNMQsAD8HZHK4zdUwegY7zJmyszYU6wB3ocWkNtw3RL/vYMuQCKd
         +bbQ==
X-Gm-Message-State: AOJu0YwekSrgeeaaJpI8VWXQM0RyJ9KxNtGNng1vTGvz2h4WKdCFaW+f
	L576vSR1hp9RmBeceM+g7vzeoBclnY71QEOtiXyrbcrvzkvgFyf7t11GcWMyZUqym2g=
X-Gm-Gg: ATEYQzxVHKwr8DBPFnKH4pu/5mQGANGoScb2F+BhEf0318e/A6DTCdjl/tV3fftNmv9
	OJq1dIP4jX3M9xJIlwL3rbuRG0V9dWSbN1Nc+I+dJYLl0l0A+A4UN/r7SUNunzCnwMSS9w6cTCX
	8KqSCQT5j1GgRq77tEPrf0Q2crhaMSp+9dxiknLBJldCcQz3XdLYA1NTPJPClleqBseNK5fETfi
	HQuMmk5JA2dZvDGQVZ4BX/IrJqSBaK7ll6ybAIa3SOgIg2RZvJIwH86f1MkSI4/E01IHyXYGTeq
	TAepEOmjxdly7p2q5ZOWbMANbu/4Tf/cWzcBwAk5f4fKDhU/+tzd+fQw53oT9VoWrZSEGqNHn9Y
	Qcukx39634y7iD4GfT2fPeiF8jRdkPfmumb4t4rPLn8EJAsSXVANj6fk5+MUH+TperZusadXvwn
	dcBz5uxU6W4cbV2BNUivCgDjly6TmEGi0r2bRd8VZZTGHPOuNLbqXcQYt3A9xNbXXojg==
X-Received: by 2002:a05:620a:450b:b0:8b2:d26f:14b0 with SMTP id af79cd13be357-8cb8c9d2859mr1971213285a.3.1772005791326;
        Tue, 24 Feb 2026 23:49:51 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d0614fbsm1390089785a.17.2026.02.24.23.49.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:49:50 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 8/9] oe-selftest/cases/wic.py: oe-selftest -r wic.Wic -> PASS
Date: Wed, 25 Feb 2026 02:49:30 -0500
Message-ID: <20260225074931.1661345-9-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260225074931.1661345-1-twoerner@gmail.com>
References: <20260225074931.1661345-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 07:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231937

Changes for the wic.Wic oe-selftests to pass now that wic is a
stand-alone app and no longer part of oe-core.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v6:
- none

changes in v5:
- rebase with master
- split back out into multiple, smaller patches
- now that the sector-size re-implementation is ahead of this patch,
  several wic subcommands (ls, cp, rm) no longer need a --vars file

v4: skipped to align/combine with other patch set

changes in v3:
- squashed into 1 large, atomic commit

changes in v2:
- none
---
 meta/lib/oeqa/selftest/cases/wic.py | 136 ++++++++++++++++------------
 1 file changed, 76 insertions(+), 60 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 8a6e51abb968..355c680f80ba 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -99,6 +99,12 @@ class WicTestCase(OESelftestTestCase):
             WicTestCase.wicenv_cache[image] = os.path.join(stdir, machine, 'imgdata')
         return WicTestCase.wicenv_cache[image]
 
+    def _create_image_env_file(self, image):
+        bitbake('%s -c rootfs_wicenv' % image)
+        stagingdir = get_bb_var('STAGING_DIR', image)
+        machine = self.td['MACHINE']
+        return os.path.join(stagingdir, machine, 'imgdata', image) + '.env'
+
 class CLITests(WicTestCase):
     def test_version(self):
         """Test wic --version"""
@@ -175,8 +181,8 @@ class Wic(WicTestCase):
             with TemporaryDirectory() as tmpdir:
                 img = 'core-image-minimal'
                 # build the image using the WKS file
-                cmd = "wic create %s -e %s -o %s" % (
-                    wks.name, img, self.resultdir)
+                cmd = "wic create %s -e %s -o %s -v %s" % (
+                    wks.name, img, self.resultdir, self.envfile)
                 runCmd(cmd)
                 wksname = os.path.splitext(os.path.basename(wks.name))[0]
                 out = glob(os.path.join(
@@ -208,7 +214,7 @@ class Wic(WicTestCase):
             with TemporaryDirectory() as tmpdir:
                 img = 'core-image-minimal'
                 # build the image using the WKS file
-                cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+                cmd = "wic create %s -e %s -o %s -v %s" % (wks.name, img, self.resultdir, self.envfile)
                 runCmd(cmd)
                 wksname = os.path.splitext(os.path.basename(wks.name))[0]
                 out = glob(os.path.join(self.resultdir, "%s-*.direct" % wksname))
@@ -252,7 +258,7 @@ class Wic(WicTestCase):
                 bitbake(img)
                 self.remove_config(config)
 
-                cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+                cmd = "wic create %s -e %s -o %s -v %s" % (wks.name, img, self.resultdir, self.envfile)
                 runCmd(cmd)
 
                 wksname = os.path.splitext(os.path.basename(wks.name))[0]
@@ -271,14 +277,14 @@ class Wic(WicTestCase):
 
     def test_build_image_name(self):
         """Test wic create wictestdisk --image-name=core-image-minimal"""
-        cmd = "wic create wictestdisk --image-name=core-image-minimal -o %s" % self.resultdir
+        cmd = "wic create wictestdisk --image-name=core-image-minimal -o %s -v %s" % (self.resultdir, self.envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join (self.resultdir, "wictestdisk-*.direct"))))
 
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID boot"""
-        cmd = "wic create directdisk-gpt --image-name core-image-minimal -o %s" % self.resultdir
+        cmd = "wic create directdisk-gpt --image-name core-image-minimal -o %s -v %s" % (self.resultdir, self.envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "directdisk-*.direct"))))
 
@@ -291,7 +297,7 @@ class Wic(WicTestCase):
         self.append_config(config)
         bitbake('core-image-minimal core-image-minimal-initramfs')
         self.remove_config(config)
-        cmd = "wic create mkhybridiso --image-name core-image-minimal -o %s" % self.resultdir
+        cmd = "wic create mkhybridiso --image-name core-image-minimal -o %s -v %s" % (self.resultdir, self.envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "HYBRID_ISO_IMG-*.direct"))))
         self.assertEqual(1, len(glob(os.path.join (self.resultdir, "HYBRID_ISO_IMG-*.iso"))))
@@ -299,14 +305,14 @@ class Wic(WicTestCase):
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_qemux86_directdisk(self):
         """Test creation of qemux-86-directdisk image"""
-        cmd = "wic create qemux86-directdisk -e core-image-minimal -o %s" % self.resultdir
+        cmd = "wic create qemux86-directdisk -e core-image-minimal -o %s -v %s" % (self.resultdir, self.envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "qemux86-directdisk-*direct"))))
 
     @skipIfNotArch(['i586', 'i686', 'x86_64', 'aarch64'])
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
-        cmd = "wic create mkefidisk -e core-image-minimal -o %s" % self.resultdir
+        cmd = "wic create mkefidisk -e core-image-minimal -o %s -v %s" % (self.resultdir, self.envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "mkefidisk-*direct"))))
 
@@ -317,7 +323,7 @@ class Wic(WicTestCase):
         self.append_config(config)
         bitbake('core-image-minimal')
         self.remove_config(config)
-        cmd = "wic create directdisk-bootloader-config -e core-image-minimal -o %s" % self.resultdir
+        cmd = "wic create directdisk-bootloader-config -e core-image-minimal -o %s -v %s" % (self.resultdir, self.envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "directdisk-bootloader-config-*direct"))))
 
@@ -328,15 +334,16 @@ class Wic(WicTestCase):
         self.append_config(config)
         bitbake('core-image-minimal')
         self.remove_config(config)
-        cmd = "wic create systemd-bootdisk -e core-image-minimal -o %s" % self.resultdir
+        cmd = "wic create systemd-bootdisk -e core-image-minimal -o %s -v %s" % (self.resultdir, self.envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "systemd-bootdisk-*direct"))))
 
     def test_efi_bootpart(self):
         """Test creation of efi-bootpart image"""
-        cmd = "wic create mkefidisk -e core-image-minimal -o %s" % self.resultdir
         kimgtype = get_bb_var('KERNEL_IMAGETYPE', 'core-image-minimal')
         self.append_config('IMAGE_EFI_BOOT_FILES = "%s;kernel"\n' % kimgtype)
+        envfile = self._create_image_env_file('core-image-minimal')
+        cmd = "wic create mkefidisk -e core-image-minimal -o %s -v %s" % (self.resultdir, envfile)
         runCmd(cmd)
         sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
         images = glob(os.path.join(self.resultdir, "mkefidisk-*.direct"))
@@ -345,9 +352,10 @@ class Wic(WicTestCase):
 
     def test_sdimage_bootpart(self):
         """Test creation of sdimage-bootpart image"""
-        cmd = "wic create sdimage-bootpart -e core-image-minimal -o %s" % self.resultdir
         kimgtype = get_bb_var('KERNEL_IMAGETYPE', 'core-image-minimal')
-        self.write_config('IMAGE_BOOT_FILES = "%s"\n' % kimgtype)
+        self.append_config('IMAGE_BOOT_FILES = "%s"\n' % kimgtype)
+        envfile = self._create_image_env_file('core-image-minimal')
+        cmd = "wic create sdimage-bootpart -e core-image-minimal -o %s -v %s" % (self.resultdir, envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "sdimage-bootpart-*direct"))))
 
@@ -361,7 +369,7 @@ class Wic(WicTestCase):
         self.append_config(config)
         bitbake('core-image-minimal')
         self.remove_config(config)
-        cmd = "wic create directdisk -e core-image-minimal"
+        cmd = "wic create directdisk -e core-image-minimal -v %s" % self.envfile
         runCmd(cmd)
         self.assertEqual(1, len(glob("directdisk-*.direct")))
 
@@ -374,55 +382,58 @@ class Wic(WicTestCase):
                                    'core-image-minimal'))
         bbvars = {key.lower(): value for key, value in bb_vars.items()}
         bbvars['resultdir'] = self.resultdir
+        bbvars['envfile'] = self.envfile
         runCmd("wic create directdisk "
                         "-b %(staging_datadir)s "
                         "-k %(deploy_dir_image)s "
                         "-n %(recipe_sysroot_native)s "
                         "-r %(image_rootfs)s "
-                        "-o %(resultdir)s" % bbvars)
+                        "-o %(resultdir)s "
+                        "-v %(envfile)s" % bbvars)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "directdisk-*.direct"))))
 
     def test_compress_gzip(self):
         """Test compressing an image with gzip"""
         runCmd("wic create wictestdisk "
                                    "--image-name core-image-minimal "
-                                   "-c gzip -o %s" % self.resultdir)
+                                   "-c gzip -o %s -v %s" % (self.resultdir, self.envfile))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*.direct.gz"))))
 
     def test_compress_bzip2(self):
         """Test compressing an image with bzip2"""
         runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
-                                   "-c bzip2 -o %s" % self.resultdir)
+                                   "-c bzip2 -o %s -v %s" % (self.resultdir, self.envfile))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*.direct.bz2"))))
 
     def test_compress_xz(self):
         """Test compressing an image with xz"""
         runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
-                                   "--compress-with=xz -o %s" % self.resultdir)
+                                   "--compress-with=xz -o %s -v %s" % (self.resultdir, self.envfile))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*.direct.xz"))))
 
     def test_wrong_compressor(self):
         """Test how wic breaks if wrong compressor is provided"""
         self.assertEqual(2, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
-                                   "-c wrong -o %s" % self.resultdir,
+                                   "-c wrong -o %s -v %s" % (self.resultdir, self.envfile),
                                    ignore_status=True).status)
 
     def test_debug_short(self):
         """Test -D option"""
         runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir)
+                                   "-D -o %s -v %s" % (self.resultdir, self.envfile))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "tmp.wic*"))))
 
     def test_debug_long(self):
         """Test --debug option"""
         runCmd("wic create wictestdisk "
+                                   "--vars %s "
                                    "--image-name=core-image-minimal "
-                                   "--debug -o %s" % self.resultdir)
+                                   "--debug -o %s" % (self.envfile, self.resultdir))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "tmp.wic*"))))
 
@@ -430,30 +441,32 @@ class Wic(WicTestCase):
         """Test -s option"""
         runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
-                                   "-s -o %s" % self.resultdir)
+                                   "-s -o %s -v %s" % (self.resultdir, self.envfile))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))))
 
     def test_skip_build_check_long(self):
         """Test --skip-build-check option"""
         runCmd("wic create wictestdisk "
+                                   "--vars %s "
                                    "--image-name=core-image-minimal "
                                    "--skip-build-check "
-                                   "--outdir %s" % self.resultdir)
+                                   "--outdir %s" % (self.envfile, self.resultdir))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))))
 
     def test_build_rootfs_short(self):
         """Test -f option"""
         runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
-                                   "-f -o %s" % self.resultdir)
+                                   "-f -o %s -v %s" % (self.resultdir, self.envfile))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))))
 
     def test_build_rootfs_long(self):
         """Test --build-rootfs option"""
         runCmd("wic create wictestdisk "
+                                   "--vars %s "
                                    "--image-name=core-image-minimal "
                                    "--build-rootfs "
-                                   "--outdir %s" % self.resultdir)
+                                   "--outdir %s" % (self.envfile, self.resultdir))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))))
 
     # TODO this doesn't have to be x86-specific
@@ -461,10 +474,11 @@ class Wic(WicTestCase):
     def test_rootfs_indirect_recipes(self):
         """Test usage of rootfs plugin with rootfs recipes"""
         runCmd("wic create directdisk-multi-rootfs "
+                        "--vars %s "
                         "--image-name=core-image-minimal "
                         "--rootfs rootfs1=core-image-minimal "
                         "--rootfs rootfs2=core-image-minimal "
-                        "--outdir %s" % self.resultdir)
+                        "--outdir %s" % (self.envfile, self.resultdir))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "directdisk-multi-rootfs*.direct"))))
 
     # TODO this doesn't have to be x86-specific
@@ -478,7 +492,9 @@ class Wic(WicTestCase):
         bbvars = {key.lower(): value for key, value in bb_vars.items()}
         bbvars['wks'] = "directdisk-multi-rootfs"
         bbvars['resultdir'] = self.resultdir
+        bbvars['envfile'] = self.envfile
         runCmd("wic create %(wks)s "
+                        "--vars %(envfile)s "
                         "--bootimg-dir=%(staging_datadir)s "
                         "--kernel-dir=%(deploy_dir_image)s "
                         "--native-sysroot=%(recipe_sysroot_native)s "
@@ -503,8 +519,8 @@ part /usr --source rootfs --ondisk mmcblk0 --fstype=ext4 --rootfs-dir %s/usr
 part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --rootfs-dir %s/usr
 part /mnt --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/whoami --rootfs-dir %s/usr"""
                           % (rootfs_dir, rootfs_dir, rootfs_dir))
-            runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
+            runCmd("wic create %s -e core-image-minimal -o %s -v %s" \
+                                       % (wks_file, self.resultdir, self.envfile))
 
             os.remove(wks_file)
             wicout = glob(os.path.join(self.resultdir, "%s-*direct" % 'temp'))
@@ -641,8 +657,8 @@ part /mnt --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/whoa
 part /part1 --source rootfs --ondisk mmcblk0 --fstype=ext4
 part /part2 --source rootfs --ondisk mmcblk0 --fstype=ext4 --include-path %s"""
                           % (include_path))
-            runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
+            runCmd("wic create %s -e core-image-minimal -o %s -v %s" \
+                                       % (wks_file, self.resultdir, self.envfile))
 
             part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
             part2 = glob(os.path.join(self.resultdir, 'temp-*.direct.p2'))[0]
@@ -678,8 +694,8 @@ part /part2 --source rootfs --ondisk mmcblk0 --fstype=ext4 --include-path %s"""
                 wks.write("""
 part / --source rootfs  --fstype=ext4 --include-path %s --include-path core-image-minimal-mtdutils export/"""
                           % (include_path))
-            runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
+            runCmd("wic create %s -e core-image-minimal -o %s -v %s" \
+                                       % (wks_file, self.resultdir, self.envfile))
 
             part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
 
@@ -703,22 +719,22 @@ part / --source rootfs  --fstype=ext4 --include-path %s --include-path core-imag
         # Absolute argument.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils /export")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s -v %s" \
+                                      % (wks_file, self.resultdir, self.envfile), ignore_status=True).status)
         os.remove(wks_file)
 
         # Argument pointing to parent directory.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils ././..")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s -v %s" \
+                                      % (wks_file, self.resultdir, self.envfile), ignore_status=True).status)
         os.remove(wks_file)
 
         # 3 Argument pointing to parent directory.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils export/ dummy")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s -v %s" \
+                                      % (wks_file, self.resultdir, self.envfile), ignore_status=True).status)
         os.remove(wks_file)
 
     def test_exclude_path_errors(self):
@@ -728,15 +744,15 @@ part / --source rootfs  --fstype=ext4 --include-path %s --include-path core-imag
         # Absolute argument.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path /usr")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s -v %s" \
+                                      % (wks_file, self.resultdir, self.envfile), ignore_status=True).status)
         os.remove(wks_file)
 
         # Argument pointing to parent directory.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path ././..")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s -v %s" \
+                                      % (wks_file, self.resultdir, self.envfile), ignore_status=True).status)
         os.remove(wks_file)
 
     def test_permissions(self):
@@ -771,8 +787,8 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
                 wks_file = os.path.join(include_path, 'temp.wks')
                 with open(wks_file, 'w') as wks:
                     wks.write(test)
-                runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
+                runCmd("wic create %s -e core-image-minimal -o %s -v %s" \
+                                       % (wks_file, self.resultdir, self.envfile))
 
                 for part in glob(os.path.join(self.resultdir, 'temp-*.direct.p*')):
                     res = runCmd("debugfs -R 'ls -p' %s" % (part), stderr=subprocess.PIPE)
@@ -808,8 +824,8 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
             wks_file = os.path.join(include_path, 'temp.wks')
             with open(wks_file, 'w') as wks:
                 wks.write("part /etc --source rootfs --fstype=ext4 --change-directory=etc")
-            runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
+            runCmd("wic create %s -e core-image-minimal -o %s -v %s" \
+                                       % (wks_file, self.resultdir, self.envfile))
 
             part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
 
@@ -827,8 +843,8 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
         # Absolute argument.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --fstype=ext4 --change-directory /usr")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s -v %s" \
+                                      % (wks_file, self.resultdir, self.envfile), ignore_status=True).status)
         os.remove(wks_file)
 
         # Argument pointing to parent directory.
@@ -858,8 +874,8 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
                 wks.writelines(['part / --source rootfs --fstype=ext4 --label rootfs\n',
                                 'part /mnt/p2 --source rootfs --rootfs-dir=core-image-minimal ',
                                 '--fstype=ext4 --label p2 --no-fstab-update\n'])
-            runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
+            runCmd("wic create %s -e core-image-minimal -o %s -v %s" \
+                                       % (wks_file, self.resultdir, self.envfile))
 
             part_fstab_md5sum = []
             for i in range(1, 3):
@@ -884,15 +900,15 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
         # Absolute argument.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --fstype=ext4 --no-fstab-update /etc")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s -v %s" \
+                                      % (wks_file, self.resultdir, self.envfile), ignore_status=True).status)
         os.remove(wks_file)
 
         # Argument pointing to parent directory.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --fstype=ext4 --no-fstab-update ././..")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s -v %s" \
+                                      % (wks_file, self.resultdir, self.envfile), ignore_status=True).status)
         os.remove(wks_file)
 
     def test_extra_space(self):
@@ -900,7 +916,7 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
         extraspace = 1024**3
         runCmd("wic create wictestdisk "
                                    "--image-name core-image-minimal "
-                                   "--extra-space %i -o %s" % (extraspace ,self.resultdir))
+                                   "--extra-space %i -o %s -v %s" % (extraspace ,self.resultdir, self.envfile))
         wicout = glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))
         self.assertEqual(1, len(wicout))
         size = os.path.getsize(wicout[0])
@@ -913,7 +929,7 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
         # Absolute argument.
         with open(wks_file, 'w') as wks:
             wks.write("part testspace --no-table --fixed-size 16k --offset 4080k")
-        runCmd("wic create %s --image-name core-image-minimal -o %s" % (wks_file, self.resultdir))
+        runCmd("wic create %s --image-name core-image-minimal -o %s -v %s" % (wks_file, self.resultdir, self.envfile))
 
         wicout = glob(os.path.join(self.resultdir, "*.*"))
 
@@ -934,8 +950,8 @@ part / --source rootfs --fstype=ext4
 part / --source rootfs --fstype=ext4 --hidden
 bootloader --ptable gpt""")
 
-            runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
+            runCmd("wic create %s -e core-image-minimal -o %s -v %s" \
+                                       % (wks_file, self.resultdir, self.envfile))
             wicout = os.path.join(self.resultdir, "*.direct")
 
             result = runCmd("%s/usr/sbin/sfdisk --part-attrs %s 1" % (sysroot, wicout))
@@ -961,7 +977,7 @@ bootloader --ptable gpt""")
                      'part --fstype ext4 --source rootfs --label rofs-a\n',
                      'part --fstype ext4 --source rootfs --use-uuid\n'])
                 wks.flush()
-                cmd = "wic create %s -e core-image-minimal -o %s --sector-size 4096" % (wks.name, self.resultdir)
+                cmd = "wic create %s -e core-image-minimal -o %s --sector-size 4096 -v %s" % (wks.name, self.resultdir, self.envfile)
                 runCmd(cmd)
                 wksname = os.path.splitext(os.path.basename(wks.name))[0]
                 images = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
-- 
2.51.0


