Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C796EEC292
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 21:50:45 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6367.1771883437425134723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 13:50:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pfm8e/38;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-8947404b367so56349246d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 13:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771883436; x=1772488236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MaF9303L4M3TErsjrEnhkCN66JogbFNs00A98nfrq9I=;
        b=Pfm8e/38OZ/KDGhQN+P+33NSU/FJeah7sjJY4JpZebOV/Ii48dacVeRWh8ePrqTiFN
         tr7G7jk4Q8sKaSnPu1foqjgtXOhSJ8gG1fAbQ+N9qNnPecIkRCXMAejjpY38jQ8M1CcF
         +kRm4EOBJEXPKApVVBvmV41QgtICSeB07YcF5uMD+ljiNchX8Ia7Uy7wrXvh3bNbCl6U
         czK/23ddDQ/VWpFSMmR/3noWNPTiOIDxjgMUzCFL02u0N624Pc/oMQozHouzF8sisMo8
         Po/NjFzOoRi8gYsRClku/kLQqaUbCG8yOawO9YL4VFAVUYG0CxKrfBfo2WusAxIaqBLm
         51UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771883436; x=1772488236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MaF9303L4M3TErsjrEnhkCN66JogbFNs00A98nfrq9I=;
        b=NqKN9v9sPp4rWjELGwbC8c3bs3R1tmEYGzIsofjFv/QOJ3V5nDw/8JsxounsTukxZc
         Nw97guNawqDutZAAih67A0KwdoH5ZVaAHIS5nRi3dEsny00IfSkQ+MmDmt78N32CEKx0
         JVAoYqdvfmJiY29XFT+Glm+XGZX9iq3z7brvEG1XUxRJ2cNGqSRgXTp7A8QaP7k799SQ
         IopLmM9JEo5FV37yggC42XXh/uQLfpNpsWj39zeLuscH5G3PFH+IYu9OJobkNtY1XngK
         1Z2xdsKqvr1kasxUDaCNYH3q9iFcIVyhYhQpZSOKZhi/IHwrHO1UNi0ye0Ia5hhxxvM5
         mHCA==
X-Gm-Message-State: AOJu0YyxesV+L/IGdi+fFg8ffq3h6lNp8LHl6xxCEvcpsafjGNNKppdO
	bK/n8IV6GBXRXhraugKYr7put+CSzluJr/oa3CcL1S1j8MDr7CH/hLiInphaUbgUf90=
X-Gm-Gg: ATEYQzzdcP5YhOhW1DpwKeIvC87/7yRWmT4e20EV+roW/hmxu1P3IZPYkMY08Rf+pHB
	6H+SpsJ4yNJQp2P4XPzxyAY/cLyU4MjAfSae9lPuJ2B7sk8GRo6y4z5UPVH2wsLQ6/h3YGSD8wI
	wZ5Zh/ZUDU47ncpOmnM5U2BpUDYu+NVr4O7l6qqcE/Io5ew5RzehhMQXusIv7oKlOySMHD7PPcZ
	mFFriBjwrKaBOUpdiOrHoeNPJnli76DhRq135esg/odHlG0uvIxtqcl4b99Tv6sh9Zw040RblDj
	KkumSJs8E3p8/P9jJnuiB0cD2oBIl5ZvWAagTSg7Esv4bnlppRy08namAI5urvt5aMS4jWSFWFR
	Jx21LS3j02kb7F7HrctofCDYRwwjv423CPDlh7AZN+yGRFTGay8OiSzAT5CNSpQGBD/T8StgzuH
	2Ktx6NF+ejnauMKKOVxWPOeDWDjjFHM0QlGSTI8z1BmLi+2IYFsT8Opnvo7SZL/yTCAg==
X-Received: by 2002:a05:6214:27c9:b0:894:8211:b025 with SMTP id 6a1803df08f44-89979c71ac0mr157124656d6.18.1771883435749;
        Mon, 23 Feb 2026 13:50:35 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997c691113sm93811606d6.1.2026.02.23.13.50.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 13:50:35 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 10/10] oe-selftest/cases/wic.py: oe-selftest -r wic.Wic2 -> PASS
Date: Mon, 23 Feb 2026 16:50:08 -0500
Message-ID: <20260223215008.2062721-11-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223215008.2062721-1-twoerner@gmail.com>
References: <20260223215008.2062721-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 21:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231711

Changes for the wic.Wic2 oe-selftests to pass now that wic is a
stand-alone app and no longer part of oe-core.

NOTE: the wic.Wic2.test_sparse_copy test was deleted since it tests code
      that is internal to wic itself; which is no longer possible now
      that wic is not part of oe-core.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v5:
- rebase with master
- re-split up into multiple, smaller patches
- now that the sector-size re-implementation is ahead of this patch,
  various wic subcommands (ls, cp, rm) no longer need a --vars file
- combine qemu and non-qemu patches together (were separate patches)

v4: skipped to align/combine with other patch set

changes in v3:
- squashed into 1 large commit

changes in v2:
- none
---
 meta/lib/oeqa/selftest/cases/wic.py | 70 ++++++++++-------------------
 1 file changed, 24 insertions(+), 46 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 355c680f80ba..ea1742dab110 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1005,14 +1005,14 @@ class Wic2(WicTestCase):
 
     def test_bmap_short(self):
         """Test generation of .bmap file -m option"""
-        cmd = "wic create wictestdisk -e core-image-minimal -m -o %s" % self.resultdir
+        cmd = "wic create wictestdisk -e core-image-minimal -m -o %s -v %s" % (self.resultdir, self.envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*direct"))))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*direct.bmap"))))
 
     def test_bmap_long(self):
         """Test generation of .bmap file --bmap option"""
-        cmd = "wic create wictestdisk -e core-image-minimal --bmap -o %s" % self.resultdir
+        cmd = "wic create wictestdisk -e core-image-minimal --bmap -o %s -v %s" % (self.resultdir, self.envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*direct"))))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*direct.bmap"))))
@@ -1048,9 +1048,9 @@ class Wic2(WicTestCase):
         native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
 
         runCmd("wic create wictestdisk "
-                                   "--image-name=%s -v %s -n %s -o %s"
+                                   "--image-name=%s -v %s -n %s -o %s -v %s"
                                    % (image, imgenvdir, native_sysroot,
-                                      self.resultdir))
+                                      self.resultdir, self.envfile))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*direct"))))
 
     def test_image_vars_dir_long(self):
@@ -1063,9 +1063,10 @@ class Wic2(WicTestCase):
                                    "--image-name=%s "
                                    "--vars %s "
                                    "--native-sysroot %s "
-                                   "--outdir %s"
+                                   "--outdir %s "
+                                   "--vars %s"
                                    % (image, imgenvdir, native_sysroot,
-                                      self.resultdir))
+                                      self.resultdir, self.envfile))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*direct"))))
 
     # TODO this test could also work on aarch64
@@ -1075,6 +1076,7 @@ class Wic2(WicTestCase):
         config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "wic-image-minimal"\n'\
                  'MACHINE_FEATURES:append = " efi"\n'
         image_recipe_append = """
+DEPENDS:append = " wic-native"
 do_image_wic[postfuncs] += "run_wic_cmd"
 run_wic_cmd() {
     echo "test" >> ${WORKDIR}/test.wic-cp
@@ -1115,6 +1117,7 @@ run_wic_cmd() {
                  'MACHINE_FEATURES:append = " efi"\n'
         self.append_config(config)
         image_recipe_append = """
+DEPENDS:append = " wic-native"
 do_image_wic[postfuncs] += "run_wic_cmd"
 run_wic_cmd() {
     echo "test" >> ${WORKDIR}/test.wic-cp
@@ -1179,7 +1182,7 @@ run_wic_cmd() {
         return wkspath
 
     def _get_wic(self, wkspath, ignore_status=False):
-        p = runCmd("wic create %s -e core-image-minimal -o %s" % (wkspath, self.resultdir),
+        p = runCmd("wic create %s -e core-image-minimal -o %s -v %s" % (wkspath, self.resultdir, self.envfile),
                    ignore_status=ignore_status)
 
         if p.status:
@@ -1420,7 +1423,7 @@ run_wic_cmd() {
             wks.write('part / --source rawcopy --sourceparams="file=%s.%s%s"\n'\
                       % (bb_vars['IMAGE_LINK_NAME'], fstype, params))
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, image, self.resultdir)
+            cmd = "wic create %s -e %s -o %s -v %s" % (wks.name, image, self.resultdir, self.envfile)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
@@ -1513,7 +1516,7 @@ run_wic_cmd() {
                             'part / --source rootfs --fstype=ext4 --align 1024 --use-uuid\n'\
                             'bootloader --timeout=0 --append="console=ttyS0,115200n8"\n'])
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            cmd = "wic create %s -e %s -o %s -v %s" % (wks.name, img, self.resultdir, self.envfile)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(os.path.join(self.resultdir, "%s-*.direct" % wksname))
@@ -1525,6 +1528,7 @@ run_wic_cmd() {
         config = 'IMAGE_EFI_BOOT_FILES="/etc/fstab;testfile"\nIMAGE_FSTYPES = "wic"\nWKS_FILE = "test_uefikernel.wks"\nMACHINE_FEATURES:append = " efi"\n'
         self.append_config(config)
         bitbake('core-image-minimal')
+        envfile = self._create_image_env_file('core-image-minimal')
         self.remove_config(config)
 
         img = 'core-image-minimal'
@@ -1533,7 +1537,7 @@ run_wic_cmd() {
                             'part / --source rootfs --fstype=ext4 --align 1024 --use-uuid\n'\
                             'bootloader --timeout=0 --append="console=ttyS0,115200n8"\n'])
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            cmd = "wic create %s -e %s -o %s -v %s" % (wks.name, img, self.resultdir, envfile)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(os.path.join(self.resultdir, "%s-*.direct" % wksname))
@@ -1678,6 +1682,7 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
         "
         """)
         self.append_config(config)
+        self.envfile = self._create_image_env_file('core-image-minimal')
 
         deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
         sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
@@ -1748,7 +1753,7 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
                             'part emptyext2   --fstype ext2   --size 1M\n',
                             'part emptybtrfs  --fstype btrfs  --size 150M\n'])
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            cmd = "wic create %s -e %s -o %s -v %s" % (wks.name, img, self.resultdir, self.envfile)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
@@ -1760,7 +1765,7 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
             wks.writelines(['part / --fstype ext3 --source rootfs --system-id 0xFF '\
                             '--overhead-factor 1.2 --size 100k\n'])
             wks.flush()
-            cmd = "wic create %s -e core-image-minimal -o %s" % (wks.name, self.resultdir)
+            cmd = "wic create %s -e core-image-minimal -o %s -v %s" % (wks.name, self.resultdir, self.envfile)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
@@ -1769,41 +1774,14 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
     def test_image_bootpart_globbed(self):
         """Test globbed sources with image-bootpart plugin"""
         img = "core-image-minimal"
-        cmd = "wic create sdimage-bootpart -e %s -o %s" % (img, self.resultdir)
         config = 'IMAGE_BOOT_FILES = "%s*"' % get_bb_var('KERNEL_IMAGETYPE', img)
         self.append_config(config)
+        envfile = self._create_image_env_file(img)
+        cmd = "wic create sdimage-bootpart -e %s -o %s -v %s" % (img, self.resultdir, envfile)
         runCmd(cmd)
         self.remove_config(config)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "sdimage-bootpart-*direct"))))
 
-    def test_sparse_copy(self):
-        """Test sparse_copy with FIEMAP and SEEK_HOLE filemap APIs"""
-        libpath = os.path.join(self.td['COREBASE'], 'scripts', 'lib', 'wic')
-        sys.path.insert(0, libpath)
-        from  filemap import FilemapFiemap, FilemapSeek, sparse_copy, ErrorNotSupp
-        with NamedTemporaryFile("w", suffix=".wic-sparse") as sparse:
-            src_name = sparse.name
-            src_size = 1024 * 10
-            sparse.truncate(src_size)
-            # write one byte to the file
-            with open(src_name, 'r+b') as sfile:
-                sfile.seek(1024 * 4)
-                sfile.write(b'\x00')
-            dest = sparse.name + '.out'
-            # copy src file to dest using different filemap APIs
-            for api in (FilemapFiemap, FilemapSeek, None):
-                if os.path.exists(dest):
-                    os.unlink(dest)
-                try:
-                    sparse_copy(sparse.name, dest, api=api)
-                except ErrorNotSupp:
-                    continue # skip unsupported API
-                dest_stat = os.stat(dest)
-                self.assertEqual(dest_stat.st_size, src_size)
-                # 8 blocks is 4K (physical sector size)
-                self.assertEqual(dest_stat.st_blocks, 8)
-            os.unlink(dest)
-
     def test_mkfs_extraopts(self):
         """Test wks option --mkfs-extraopts for empty and not empty partitions"""
         img = 'core-image-minimal'
@@ -1817,7 +1795,7 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
                  'part emptyext2   --fstype ext2   --size 1M --mkfs-extraopts "-D -F -i 8192"\n',
                  'part emptybtrfs  --fstype btrfs  --size 100M --mkfs-extraopts "--mixed -K"\n'])
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            cmd = "wic create %s -e %s -o %s -v %s" % (wks.name, img, self.resultdir, self.envfile)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
@@ -1916,7 +1894,7 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
                  'part empty --source empty --sourceparams="size=2048k,bs=512K" --ondisk sda --size 4M --align 1024\n'
                  ])
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            cmd = "wic create %s -e %s -o %s -v %s" % (wks.name, img, self.resultdir, self.envfile)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             wicout = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
@@ -1934,7 +1912,7 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
         with NamedTemporaryFile("w", suffix=".wks") as wks:
             wks.writelines(['part empty --source empty --sourceparams="fill" --ondisk sda --size 1M\n'])
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            cmd = "wic create %s -e %s -o %s -v %s" % (wks.name, img, self.resultdir, self.envfile)
             result = runCmd(cmd, ignore_status=True)
             self.assertIn("Source parameter 'fill' only works with the '--fixed-size' option, exiting.", result.output)
             self.assertNotEqual(0, result.status)
@@ -1948,7 +1926,7 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
                             'part /boot --size=100M --active --fstype=ext4 --label boot\n'
                             'part /     --source rootfs      --fstype=ext4 --label root\n'])
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            cmd = "wic create %s -e %s -o %s -v %s" % (wks.name, img, self.resultdir, self.envfile)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
@@ -1966,7 +1944,7 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
                             'part /boot --size=100M --active --fstype=ext4 --label boot\n'
                             'part /     --source rootfs      --fstype=ext4 --label root\n'])
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            cmd = "wic create %s -e %s -o %s -v %s" % (wks.name, img, self.resultdir, self.envfile)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
-- 
2.51.0


