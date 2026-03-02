Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D8CD58E42
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 00:38:50 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.150143.1772411925859267851
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 16:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jC7xVg/v;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-899c3441177so67346406d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 16:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772411924; x=1773016724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vV8v6QpKR1ggXttitW2LPCVC+sENJo2VKpL7vblkTn8=;
        b=jC7xVg/vpZgS9Wq57nBt9Y33CMmSAfgE6UM3yqMg1t/bAh6ZFfK6GS6hqbOPRqvG/V
         R3CCjBFXqv254QUKx5R6nFgjyoiD3TP3+5d5bQiUTaTEGG0/BO3HF+/3fzFQ0BSeu81v
         TyQjxzDSP4qa3nknm6w8pc2t6oWlYBBrizP3ZX9DQVa4WA6wamEM6VECbi9Ix/Ke/rUK
         LpmZrCWIiElTwZryVkrohpj11DzPIRjMcPOyT2W5cazao7y0pTgRO3ePebCGRMyROS+R
         T9mUDbjucWg6KeV+2IixVX38BLRIe2OCizS7MjBve2P7SF6jmDZpra2LEB0xuqQocIs4
         wi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772411924; x=1773016724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vV8v6QpKR1ggXttitW2LPCVC+sENJo2VKpL7vblkTn8=;
        b=w42oIMJdG0k0D/Sz5GNNcl3GVWPBiqTFyUppc6Fsbnz0IRZ6UZZW8N595+AWaLFeMe
         VR+z8GXLzq5+xrvHHEQ4Em1lHQSLbl0fFjMXsksOanZiiJoQzsokfPHgCbhIXmgwAxqO
         wTOj3LILoBtRe3B5I87ZVcG1YD41wjalrWokA7j1AOflQWYa+xY8QjtllGmId2eG23E/
         xCMfT62/7H7aKSjQLO6JwtSkygdvhuLan1ico272Yb7mwFDR2EnABGdsmK1nni2Fzsxl
         7N3E9mrOSX1FrpzYgwQhaG33COQr3fOvS9Eql5Ig1Wac7PHSyVIMuccuZ3N0UnSqHwJc
         W8zA==
X-Gm-Message-State: AOJu0YyiojnHeX6jRFzJdYvq/PvAOlod8c6KDIrXP02eOdc441fNACsx
	YkbNnhK1snIVo+Rc8wgYVyAdx46XALryHCrolmQctHMLjafinHBQ1PHAmEX/h08j
X-Gm-Gg: ATEYQzwc9/hLnemsv6eysReSO21uKR3WtzVI/kA5GdXbMkbF56/IHY+rZn3pniOizZh
	bwS1boY/o1rVdM0SgQcp8zYh7N2dV4LZwEGyFkUDp0WEm/G5bbIJEB7lG161uOV3RjpnnlyoPfD
	RwCp0gQd9URcPDnLE2TmPyYEPpfEbA7ifE71V0N0SvxFNNs+/TaU7msx5Y4uMSfd+UIBlDHP6K6
	Lrgq3h1YCXukgJ2ATLf20GjTCErNEAI12d9w9cO+Hs1All9CslZ7qIs9PiAaHF4PWiHEPNsGC+H
	K0BDNLu6XQ7BQrFzEu/XsLOwqF6ADAvA4tgpv3p07h+kVrBtlsfaSui72w5Y8Ps1FWK1m9NE4Vz
	1MyKkiURCBKmIQpeEKSR0XAWbOBv73hZP6LIFRKtE4yD10e9J1lPa+/IfNCJXgPgFt0q8DofU2w
	3YwHgPMi4cuhcqodN9sj7FufCIsdTzyds9aaZZwYFtiji2/Jvp8+v3QjePUfNuFWUnqdWCDyH4F
	GeY
X-Received: by 2002:a05:6214:4011:b0:880:4ec0:4183 with SMTP id 6a1803df08f44-899d1e5c5d9mr154359686d6.46.1772411923771;
        Sun, 01 Mar 2026 16:38:43 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899ebb09772sm33710356d6.12.2026.03.01.16.38.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 16:38:43 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 8/9] oe-selftest/cases/wic.py: oe-selftest -r wic.Wic -> PASS
Date: Sun,  1 Mar 2026 19:38:25 -0500
Message-ID: <20260302003826.3995222-9-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260302003826.3995222-1-twoerner@gmail.com>
References: <20260302003826.3995222-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 00:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232154

Changes for the wic.Wic oe-selftests to pass now that wic is a
stand-alone app and no longer part of oe-core.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v7:
- none

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


