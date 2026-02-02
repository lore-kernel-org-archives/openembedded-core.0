Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EF6D172B4
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 13:54:38 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52591.1770040477804212402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 05:54:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kfwDRHQF;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-8947ddce09fso35633006d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 05:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770040476; x=1770645276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jKjW2oPqfDzN66/VYZdT+dJq2HWrtB5x+WgYQpQh1E=;
        b=kfwDRHQFmC7fZDRhoA6g+YyOkEKEaeEFzAYEo2+/iZ9bFb1dCmI31rV8oQSrHNCM8p
         QqanpbDLnZ1+YugeGIQXhI1DSoMvrGayEzre/26PDW9aqRaiYaiYnafjh+1IfkTwCBU/
         CB2HvDBBuY8dQVyEy8L84eFnF3fPogaMBIaA4Mf2Ye3wrfAvIdTAosNcXnYqju8hk2pI
         Ucr1Rwu0hKYI6zITbZTJtEBdj7/RZs8jQK7xjC775+I9qG5VBe61vbRL9FAxklHQhcKN
         vkQyMxIOHX5SmstQCKOnJ372QmfUuI7LevBr8dXzVd+/dtsaA1/cZJSO6Hki50xd6ffq
         dguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770040476; x=1770645276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4jKjW2oPqfDzN66/VYZdT+dJq2HWrtB5x+WgYQpQh1E=;
        b=dicS3M/cDnZb/7Mk+pm/P6XMGPedjrnCOy689NVESRttOqdopA7OqHp4emaFFpFzPA
         z1N7gzZDb88C6WXzQbl9+MKRxqj5VYcW7MXeMithoOEGJdrz96uASpWG17LDd6/zjSS1
         Ov8wYMqa1F9cQTYNi86EWFUPTO/YezSlAnaEEI6OwDc99SMJXUcXFFydXQqRVXD6AAQN
         5L9ifXHnE4ADgPN6GDLwiJ+wYN5rw1RB6xgqa07fOo8M4aFYH80ZUCCR/yD2tJEw03vm
         R3rZaeRUxVPGqdLU17AeDv6HAkcS6DNRaysv4umtBgONfCqBMxoxrfOBcN4medM56maw
         ko8g==
X-Gm-Message-State: AOJu0Yxb18f4UEneZaxwgCFNTvXKzNpzrugTTBR0odajyHeOqm8h/8e2
	wrIjtW7QxQ4FEUwsxQ2fgg3X07lCY4PSj45JHNFPcU6JJj5noX2iqI4iQNnkVnLZ
X-Gm-Gg: AZuq6aJoHsOZP8ESBDufbmvt8PwftzDcT3sO1jmPWRJsi1+z/qX5qQycSKK5L26WH0q
	miCjfClw1oLqqVLvQlK3Rhetmi7vDzGls9u9bzkeujrisRGxNZGThAvR9+ICiTQiJAHP77f9HFA
	O+iDcnW34TD5Kd2dV84yJ8dXo/Rd3rVhwpUrNXzqc6fvPjliFCV2XwUvEL0n3p0tqe1N1AMbqnd
	01CAiVLDZn762rttZCRvoe+K10O4oPbOWN4eV0jRwsnivIQ16t1hwuEaRuCO9QimMfhNZu5/p03
	loacdL9uDl+1EmAQfvE13jQZhy8rhesOaew9ynrbJvYZdZJJVtMCn58XUhjxcB0w0B8awSwx490
	/ati7QEwlpFo819PybnRbsfSuMef1enCb8apMtvCV/HrJ57q89Ul3YCYOIJYnUBqiS4GMwaJmoV
	tnoGQM4hu/SxZHxz5UJ/KSlpSqTNsFWL8GJnpwboBUUpIiXD94Wf3PkA==
X-Received: by 2002:a05:6214:d66:b0:890:8252:96dc with SMTP id 6a1803df08f44-894e9f8369dmr133808876d6.15.1770040475744;
        Mon, 02 Feb 2026 05:54:35 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d2845fsm1248654585a.31.2026.02.02.05.54.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:54:33 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH 7/9] oe-selftest -r wic.Wic -> PASS
Date: Mon,  2 Feb 2026 08:54:12 -0500
Message-ID: <20260202135414.682558-7-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202135414.682558-1-twoerner@gmail.com>
References: <20260202135414.682558-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 13:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230359

Changes for the wic.Wic oe-selftests to pass now that wic is a
stand-alone app and no longer part of oe-core.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 176 +++++++++++++++-------------
 1 file changed, 94 insertions(+), 82 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 0dc17dcd5614..3b24d0a5a645 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -101,6 +101,12 @@ class WicTestCase(OESelftestTestCase):
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
@@ -177,8 +183,8 @@ class Wic(WicTestCase):
             with TemporaryDirectory() as tmpdir:
                 img = 'core-image-minimal'
                 # build the image using the WKS file
-                cmd = "wic create %s -e %s -o %s" % (
-                    wks.name, img, self.resultdir)
+                cmd = "wic create %s -e %s -o %s --vars %s" % (
+                    wks.name, img, self.resultdir, self.envfile)
                 runCmd(cmd)
                 wksname = os.path.splitext(os.path.basename(wks.name))[0]
                 out = glob(os.path.join(
@@ -186,7 +192,7 @@ class Wic(WicTestCase):
                 self.assertEqual(1, len(out))
                 sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
                 # extract the content of the disk image to the temporary directory
-                cmd = "wic cp %s:1 %s -n %s" % (out[0], tmpdir, sysroot)
+                cmd = "wic cp %s:1 %s -n %s --vars %s" % (out[0], tmpdir, sysroot, self.envfile)
                 runCmd(cmd)
                 # check if the kernel is installed or not
                 kimgtype = get_bb_var('KERNEL_IMAGETYPE', img)
@@ -210,14 +216,14 @@ class Wic(WicTestCase):
             with TemporaryDirectory() as tmpdir:
                 img = 'core-image-minimal'
                 # build the image using the WKS file
-                cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+                cmd = "wic create %s -e %s -o %s --vars %s" % (wks.name, img, self.resultdir, self.envfile)
                 runCmd(cmd)
                 wksname = os.path.splitext(os.path.basename(wks.name))[0]
                 out = glob(os.path.join(self.resultdir, "%s-*.direct" % wksname))
                 self.assertEqual(1, len(out))
                 sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
                 # extract the content of the disk image to the temporary directory
-                cmd = "wic cp %s:1 %s -n %s" % (out[0], tmpdir, sysroot)
+                cmd = "wic cp %s:1 %s -n %s --vars %s" % (out[0], tmpdir, sysroot, self.envfile)
                 runCmd(cmd)
                 # check if the kernel is installed or not
                 kimgtype = get_bb_var('KERNEL_IMAGETYPE', img)
@@ -254,7 +260,7 @@ class Wic(WicTestCase):
                 bitbake(img)
                 self.remove_config(config)
 
-                cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+                cmd = "wic create %s -e %s -o %s --vars %s" % (wks.name, img, self.resultdir, self.envfile)
                 runCmd(cmd)
 
                 wksname = os.path.splitext(os.path.basename(wks.name))[0]
@@ -264,23 +270,23 @@ class Wic(WicTestCase):
                 sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
 
                 # Check if grub.cfg is installed
-                result = runCmd("wic ls %s:1/boot/grub -n %s" % (out[0], sysroot))
+                result = runCmd("wic ls %s:1/boot/grub -n %s --vars %s" % (out[0], sysroot, self.envfile))
                 self.assertIn('grub', result.output)
 
                 # Check if normal.mod is installed
-                result = runCmd("wic ls %s:1/boot/grub/i386-pc -n %s" % (out[0], sysroot))
+                result = runCmd("wic ls %s:1/boot/grub/i386-pc -n %s --vars %s" % (out[0], sysroot, self.envfile))
                 self.assertIn('normal', result.output)
 
     def test_build_image_name(self):
         """Test wic create wictestdisk --image-name=core-image-minimal"""
-        cmd = "wic create wictestdisk --image-name=core-image-minimal -o %s" % self.resultdir
+        cmd = "wic create wictestdisk --image-name=core-image-minimal -o %s --vars %s" % (self.resultdir, self.envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join (self.resultdir, "wictestdisk-*.direct"))))
 
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID boot"""
-        cmd = "wic create directdisk-gpt --image-name core-image-minimal -o %s" % self.resultdir
+        cmd = "wic create directdisk-gpt --image-name core-image-minimal -o %s --vars %s" % (self.resultdir, self.envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "directdisk-*.direct"))))
 
@@ -293,7 +299,7 @@ class Wic(WicTestCase):
         self.append_config(config)
         bitbake('core-image-minimal core-image-minimal-initramfs')
         self.remove_config(config)
-        cmd = "wic create mkhybridiso --image-name core-image-minimal -o %s" % self.resultdir
+        cmd = "wic create mkhybridiso --image-name core-image-minimal -o %s --vars %s" % (self.resultdir, self.envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "HYBRID_ISO_IMG-*.direct"))))
         self.assertEqual(1, len(glob(os.path.join (self.resultdir, "HYBRID_ISO_IMG-*.iso"))))
@@ -301,14 +307,14 @@ class Wic(WicTestCase):
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_qemux86_directdisk(self):
         """Test creation of qemux-86-directdisk image"""
-        cmd = "wic create qemux86-directdisk -e core-image-minimal -o %s" % self.resultdir
+        cmd = "wic create qemux86-directdisk -e core-image-minimal -o %s --vars %s" % (self.resultdir, self.envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "qemux86-directdisk-*direct"))))
 
     @skipIfNotArch(['i586', 'i686', 'x86_64', 'aarch64'])
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
-        cmd = "wic create mkefidisk -e core-image-minimal -o %s" % self.resultdir
+        cmd = "wic create mkefidisk -e core-image-minimal -o %s --vars %s" % (self.resultdir, self.envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "mkefidisk-*direct"))))
 
@@ -319,7 +325,7 @@ class Wic(WicTestCase):
         self.append_config(config)
         bitbake('core-image-minimal')
         self.remove_config(config)
-        cmd = "wic create directdisk-bootloader-config -e core-image-minimal -o %s" % self.resultdir
+        cmd = "wic create directdisk-bootloader-config -e core-image-minimal -o %s --vars %s" % (self.resultdir, self.envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "directdisk-bootloader-config-*direct"))))
 
@@ -330,26 +336,28 @@ class Wic(WicTestCase):
         self.append_config(config)
         bitbake('core-image-minimal')
         self.remove_config(config)
-        cmd = "wic create systemd-bootdisk -e core-image-minimal -o %s" % self.resultdir
+        cmd = "wic create systemd-bootdisk -e core-image-minimal -o %s --vars %s" % (self.resultdir, self.envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "systemd-bootdisk-*direct"))))
 
     def test_efi_bootpart(self):
         """Test creation of efi-bootpart image"""
-        cmd = "wic create mkefidisk -e core-image-minimal -o %s" % self.resultdir
         kimgtype = get_bb_var('KERNEL_IMAGETYPE', 'core-image-minimal')
         self.append_config('IMAGE_EFI_BOOT_FILES = "%s;kernel"\n' % kimgtype)
+        envvars = self._create_image_env_file('core-image-minimal')
+        cmd = "wic create mkefidisk -e core-image-minimal -o %s --vars %s" % (self.resultdir, envvars)
         runCmd(cmd)
         sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
         images = glob(os.path.join(self.resultdir, "mkefidisk-*.direct"))
-        result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))       
+        result = runCmd("wic ls %s:1/ -n %s --vars %s" % (images[0], sysroot, envvars))
         self.assertIn("kernel",result.output)
 
     def test_sdimage_bootpart(self):
         """Test creation of sdimage-bootpart image"""
-        cmd = "wic create sdimage-bootpart -e core-image-minimal -o %s" % self.resultdir
         kimgtype = get_bb_var('KERNEL_IMAGETYPE', 'core-image-minimal')
-        self.write_config('IMAGE_BOOT_FILES = "%s"\n' % kimgtype)
+        self.append_config('IMAGE_BOOT_FILES = "%s"\n' % kimgtype)
+        envvars = self._create_image_env_file('core-image-minimal')
+        cmd = "wic create sdimage-bootpart -e core-image-minimal -o %s --vars %s" % (self.resultdir, envvars)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "sdimage-bootpart-*direct"))))
 
@@ -363,7 +371,7 @@ class Wic(WicTestCase):
         self.append_config(config)
         bitbake('core-image-minimal')
         self.remove_config(config)
-        cmd = "wic create directdisk -e core-image-minimal"
+        cmd = "wic create directdisk -e core-image-minimal --vars %s" % self.envfile
         runCmd(cmd)
         self.assertEqual(1, len(glob("directdisk-*.direct")))
 
@@ -376,97 +384,99 @@ class Wic(WicTestCase):
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
-        runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk --vars %s "
                                    "--image-name core-image-minimal "
-                                   "-c gzip -o %s" % self.resultdir)
+                                   "-c gzip -o %s" % (self.envfile, self.resultdir))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*.direct.gz"))))
 
     def test_compress_bzip2(self):
         """Test compressing an image with bzip2"""
-        runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk --vars %s "
                                    "--image-name=core-image-minimal "
-                                   "-c bzip2 -o %s" % self.resultdir)
+                                   "-c bzip2 -o %s" % (self.envfile, self.resultdir))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*.direct.bz2"))))
 
     def test_compress_xz(self):
         """Test compressing an image with xz"""
-        runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk --vars %s "
                                    "--image-name=core-image-minimal "
-                                   "--compress-with=xz -o %s" % self.resultdir)
+                                   "--compress-with=xz -o %s" % (self.envfile, self.resultdir))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*.direct.xz"))))
 
     def test_wrong_compressor(self):
         """Test how wic breaks if wrong compressor is provided"""
-        self.assertEqual(2, runCmd("wic create wictestdisk "
+        self.assertEqual(2, runCmd("wic create wictestdisk --vars %s "
                                    "--image-name=core-image-minimal "
-                                   "-c wrong -o %s" % self.resultdir,
+                                   "-c wrong -o %s" % (self.envfile, self.resultdir),
                                    ignore_status=True).status)
 
     def test_debug_short(self):
         """Test -D option"""
-        runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk --vars %s "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir)
+                                   "-D -o %s" % (self.envfile, self.resultdir))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "tmp.wic*"))))
 
     def test_debug_long(self):
         """Test --debug option"""
-        runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk --vars %s "
                                    "--image-name=core-image-minimal "
-                                   "--debug -o %s" % self.resultdir)
+                                   "--debug -o %s" % (self.envfile, self.resultdir))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "tmp.wic*"))))
 
     def test_skip_build_check_short(self):
         """Test -s option"""
-        runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk --vars %s "
                                    "--image-name=core-image-minimal "
-                                   "-s -o %s" % self.resultdir)
+                                   "-s -o %s" % (self.envfile, self.resultdir))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))))
 
     def test_skip_build_check_long(self):
         """Test --skip-build-check option"""
-        runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk --vars %s "
                                    "--image-name=core-image-minimal "
                                    "--skip-build-check "
-                                   "--outdir %s" % self.resultdir)
+                                   "--outdir %s" % (self.envfile, self.resultdir))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))))
 
     def test_build_rootfs_short(self):
         """Test -f option"""
-        runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk -v %s "
                                    "--image-name=core-image-minimal "
-                                   "-f -o %s" % self.resultdir)
+                                   "-f -o %s" % (self.envfile, self.resultdir))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))))
 
     def test_build_rootfs_long(self):
         """Test --build-rootfs option"""
-        runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk --vars %s "
                                    "--image-name=core-image-minimal "
                                    "--build-rootfs "
-                                   "--outdir %s" % self.resultdir)
+                                   "--outdir %s" % (self.envfile, self.resultdir))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))))
 
     # TODO this doesn't have to be x86-specific
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_rootfs_indirect_recipes(self):
         """Test usage of rootfs plugin with rootfs recipes"""
-        runCmd("wic create directdisk-multi-rootfs "
+        runCmd("wic create directdisk-multi-rootfs --vars %s "
                         "--image-name=core-image-minimal "
                         "--rootfs rootfs1=core-image-minimal "
                         "--rootfs rootfs2=core-image-minimal "
-                        "--outdir %s" % self.resultdir)
+                        "--outdir %s" % (self.envfile, self.resultdir))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "directdisk-multi-rootfs*.direct"))))
 
     # TODO this doesn't have to be x86-specific
@@ -480,7 +490,8 @@ class Wic(WicTestCase):
         bbvars = {key.lower(): value for key, value in bb_vars.items()}
         bbvars['wks'] = "directdisk-multi-rootfs"
         bbvars['resultdir'] = self.resultdir
-        runCmd("wic create %(wks)s "
+        bbvars['envfile'] = self.envfile
+        runCmd("wic create %(wks)s --vars %(envfile)s "
                         "--bootimg-dir=%(staging_datadir)s "
                         "--kernel-dir=%(deploy_dir_image)s "
                         "--native-sysroot=%(recipe_sysroot_native)s "
@@ -505,8 +516,8 @@ part /usr --source rootfs --ondisk mmcblk0 --fstype=ext4 --rootfs-dir %s/usr
 part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --rootfs-dir %s/usr
 part /mnt --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/whoami --rootfs-dir %s/usr"""
                           % (rootfs_dir, rootfs_dir, rootfs_dir))
-            runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
+            runCmd("wic create %s -e core-image-minimal -o %s --vars %s" \
+                                       % (wks_file, self.resultdir, self.envfile))
 
             os.remove(wks_file)
             wicout = glob(os.path.join(self.resultdir, "%s-*direct" % 'temp'))
@@ -622,7 +633,7 @@ part /mnt --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/whoa
         machine = bb_vars['MACHINE']
         nativesysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
         wicout = glob(os.path.join(deploy_dir, "core-image-minimal-%s.rootfs-*.wic" % machine))[0]
-        size_of_root_partition = int(runCmd("wic ls %s --native-sysroot %s" % (wicout, nativesysroot)).output.split('\n')[2].split()[3])
+        size_of_root_partition = int(runCmd("wic ls %s --native-sysroot %s --vars %s" % (wicout, nativesysroot, self.envfile)).output.split('\n')[2].split()[3])
         self.assertGreater(size_of_root_partition, 500000000)
 
     def test_include_path(self):
@@ -643,8 +654,8 @@ part /mnt --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/whoa
 part /part1 --source rootfs --ondisk mmcblk0 --fstype=ext4
 part /part2 --source rootfs --ondisk mmcblk0 --fstype=ext4 --include-path %s"""
                           % (include_path))
-            runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
+            runCmd("wic create %s -e core-image-minimal -o %s --vars %s" \
+                                       % (wks_file, self.resultdir, self.envfile))
 
             part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
             part2 = glob(os.path.join(self.resultdir, 'temp-*.direct.p2'))[0]
@@ -680,8 +691,8 @@ part /part2 --source rootfs --ondisk mmcblk0 --fstype=ext4 --include-path %s"""
                 wks.write("""
 part / --source rootfs  --fstype=ext4 --include-path %s --include-path core-image-minimal-mtdutils export/"""
                           % (include_path))
-            runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
+            runCmd("wic create %s -e core-image-minimal -o %s --vars %s" \
+                                       % (wks_file, self.resultdir, self.envfile))
 
             part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
 
@@ -705,22 +716,22 @@ part / --source rootfs  --fstype=ext4 --include-path %s --include-path core-imag
         # Absolute argument.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils /export")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s --vars %s" \
+                                      % (wks_file, self.resultdir, self.envfile), ignore_status=True).status)
         os.remove(wks_file)
 
         # Argument pointing to parent directory.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils ././..")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s --vars %s" \
+                                      % (wks_file, self.resultdir, self.envfile), ignore_status=True).status)
         os.remove(wks_file)
 
         # 3 Argument pointing to parent directory.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils export/ dummy")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s --vars %s" \
+                                      % (wks_file, self.resultdir, self.envfile), ignore_status=True).status)
         os.remove(wks_file)
 
     def test_exclude_path_errors(self):
@@ -730,15 +741,15 @@ part / --source rootfs  --fstype=ext4 --include-path %s --include-path core-imag
         # Absolute argument.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path /usr")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s --vars %s" \
+                                      % (wks_file, self.resultdir, self.envfile), ignore_status=True).status)
         os.remove(wks_file)
 
         # Argument pointing to parent directory.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path ././..")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s --vars %s" \
+                                      % (wks_file, self.resultdir, self.envfile), ignore_status=True).status)
         os.remove(wks_file)
 
     def test_permissions(self):
@@ -773,8 +784,8 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
                 wks_file = os.path.join(include_path, 'temp.wks')
                 with open(wks_file, 'w') as wks:
                     wks.write(test)
-                runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
+                runCmd("wic create %s -e core-image-minimal -o %s --vars %s" \
+                                       % (wks_file, self.resultdir, self.envfile))
 
                 for part in glob(os.path.join(self.resultdir, 'temp-*.direct.p*')):
                     res = runCmd("debugfs -R 'ls -p' %s" % (part), stderr=subprocess.PIPE)
@@ -810,8 +821,8 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
             wks_file = os.path.join(include_path, 'temp.wks')
             with open(wks_file, 'w') as wks:
                 wks.write("part /etc --source rootfs --fstype=ext4 --change-directory=etc")
-            runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
+            runCmd("wic create %s -e core-image-minimal -o %s --vars %s" \
+                                       % (wks_file, self.resultdir, self.envfile))
 
             part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
 
@@ -829,15 +840,15 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
         # Absolute argument.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --fstype=ext4 --change-directory /usr")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s --vars %s" \
+                                      % (wks_file, self.resultdir, self.envfile), ignore_status=True).status)
         os.remove(wks_file)
 
         # Argument pointing to parent directory.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --fstype=ext4 --change-directory ././..")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s --vars %s" \
+                                      % (wks_file, self.resultdir, self.envfile), ignore_status=True).status)
         os.remove(wks_file)
 
     def test_no_fstab_update(self):
@@ -860,8 +871,8 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
                 wks.writelines(['part / --source rootfs --fstype=ext4 --label rootfs\n',
                                 'part /mnt/p2 --source rootfs --rootfs-dir=core-image-minimal ',
                                 '--fstype=ext4 --label p2 --no-fstab-update\n'])
-            runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
+            runCmd("wic create %s -e core-image-minimal -o %s --vars %s" \
+                                       % (wks_file, self.resultdir, self.envfile))
 
             part_fstab_md5sum = []
             for i in range(1, 3):
@@ -886,23 +897,23 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
         # Absolute argument.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --fstype=ext4 --no-fstab-update /etc")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s --vars %s" \
+                                      % (wks_file, self.resultdir, self.envfile), ignore_status=True).status)
         os.remove(wks_file)
 
         # Argument pointing to parent directory.
         with open(wks_file, 'w') as wks:
             wks.write("part / --source rootfs --fstype=ext4 --no-fstab-update ././..")
-        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s --vars %s" \
+                                      % (wks_file, self.resultdir, self.envfile), ignore_status=True).status)
         os.remove(wks_file)
 
     def test_extra_space(self):
         """Test --extra-space wks option."""
         extraspace = 1024**3
-        runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk --vars %s "
                                    "--image-name core-image-minimal "
-                                   "--extra-space %i -o %s" % (extraspace ,self.resultdir))
+                                   "--extra-space %i -o %s" % (self.envfile, extraspace ,self.resultdir))
         wicout = glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))
         self.assertEqual(1, len(wicout))
         size = os.path.getsize(wicout[0])
@@ -915,7 +926,7 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
         # Absolute argument.
         with open(wks_file, 'w') as wks:
             wks.write("part testspace --no-table --fixed-size 16k --offset 4080k")
-        runCmd("wic create %s --image-name core-image-minimal -o %s" % (wks_file, self.resultdir))
+        runCmd("wic create %s --image-name core-image-minimal -o %s --vars %s" % (wks_file, self.resultdir, self.envfile))
 
         wicout = glob(os.path.join(self.resultdir, "*.*"))
 
@@ -936,8 +947,8 @@ part / --source rootfs --fstype=ext4
 part / --source rootfs --fstype=ext4 --hidden
 bootloader --ptable gpt""")
 
-            runCmd("wic create %s -e core-image-minimal -o %s" \
-                                       % (wks_file, self.resultdir))
+            runCmd("wic create %s -e core-image-minimal -o %s --vars %s" \
+                                       % (wks_file, self.resultdir, self.envfile))
             wicout = os.path.join(self.resultdir, "*.direct")
 
             result = runCmd("%s/usr/sbin/sfdisk --part-attrs %s 1" % (sysroot, wicout))
@@ -960,6 +971,7 @@ bootloader --ptable gpt""")
                      'WICVARS:append = " WIC_SECTOR_SIZE"\n'
             self.append_config(config)
             bitbake('core-image-minimal')
+            envvars = self._create_image_env_file('core-image-minimal')
 
             # Check WIC_SECTOR_SIZE apply to bitbake variable
             wic_sector_size_str = get_bb_var('WIC_SECTOR_SIZE', 'core-image-minimal')
@@ -974,7 +986,7 @@ bootloader --ptable gpt""")
                      'part --fstype ext4 --source rootfs --label rofs-a --mkfs-extraopts "-b 4096"\n',
                      'part --fstype ext4 --source rootfs --use-uuid --mkfs-extraopts "-b 4096"\n'])
                 wks.flush()
-                cmd = "wic create %s -e core-image-minimal -o %s" % (wks.name, self.resultdir)
+                cmd = "wic create %s -e core-image-minimal -o %s --vars %s" % (wks.name, self.resultdir, envvars)
                 runCmd(cmd)
                 wksname = os.path.splitext(os.path.basename(wks.name))[0]
                 images = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
@@ -982,7 +994,7 @@ bootloader --ptable gpt""")
 
             sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
             # list partitions
-            result = runCmd("wic ls %s -n %s" % (images[0], sysroot))
+            result = runCmd("wic ls %s -n %s --vars %s" % (images[0], sysroot, envvars))
             self.assertEqual(3, len(result.output.split('\n')))
 
             # verify partition size with wic
-- 
2.51.0


