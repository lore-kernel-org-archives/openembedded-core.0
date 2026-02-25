Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3B0EFD204
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 07:50:00 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40877.1772005798519329794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 23:49:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CulbwI+V;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8cb40030be5so642532185a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 23:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772005796; x=1772610596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWssn/0uC4fIfAzqTTIJAz85TNg8Fi2mIr69k5r3Leo=;
        b=CulbwI+VF63xNtYILAORyGHBXbezT80V4tEp4hEF4+t2a10czamXQIOaOJwPVctaIn
         X6AaX59QzLWxuf5PQ3cZcUSpftlWQ9zuNrDE4YARcg/If+iYQsW8IQJ4mSn+wuuqqe52
         lS9HNHTG0aALB4CIOl/5Ni4N2yZ0EmDM5VWgUVlCfV2cjHrGvSNCat6d8Mtz+XnXSOYL
         pIigk6ryyFRMuWwzQkXKh8WX/pERBliScWsE+MZb4Q1Vaqth2kY6N6FYgoz+4JdZre1Y
         ffFdbIcHrwhun5wPpv/AOpsL3OJvtFKWOeXd/VYm9Fj42ZwB4863AobCqxIE+L4avBI1
         J8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772005796; x=1772610596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MWssn/0uC4fIfAzqTTIJAz85TNg8Fi2mIr69k5r3Leo=;
        b=ASf9vu67bXTOJVl1DGOZzwzKSDzTo2QaWmEhk0Mrx/koqETqSnu9XBF6yTcHvZzEmD
         ht8WAryMVwI7aiS/J0E7yxQKiIMHXsMKNT57gg3/gce13sz7jbo4o1yV5QAb4LKEhBZt
         JX9emBegMlQ+0rqI69EbjQp0wOlvJRU7RLJiDmoAxQ+Bgubr6mmLYwKnRBI0EmAE1p3D
         zI6rotVhEXmEpQWlvZm8YvJ7YLTW52+57sEa07GYb0ln9ilTOLjgQR90OL5pqKxRugQl
         UkpUgdn/10MTmhm/58t4wjvApXHvwl1Vh10l7ZYML9nLYjEeq2kvHNCjswmLePM97lVn
         IanA==
X-Gm-Message-State: AOJu0YzbU0qEnSYM6UiCjr8Kdpt62zkP2hL5vcX1oQ15u2LdHHYzO0fZ
	s2DPjwiQtAcrQG7aa+iDnsseRp+i7Js+8E7qtmO/gNrb7QXMz/RBLfFFGjJouke8HT4=
X-Gm-Gg: ATEYQzwqNpgDKdLd66aBNDn20nZ4SYEL2vBm5OflI1UCrnjUTNk2/oe9YVWe9mipmA0
	Rk2qX9OPvvlOXovUwZdDsJc96POohO4WVzZfl1cvn9335G26DXLN8gqqukNtQP1GzIocovvX9PY
	KuJj4wyI295bwX/16sxBaxo6Ua2UNl9FOxQ285FMrrD6so7ueUGPnAEcFCBRy+OyReQ0nZ45v/A
	QpUFLbZNYX4e5dfr3bRVp1y+9kdjDKGQcsRMOVGPQJ386O2cyRSBVeCU4iv7cEUdjU2rLA/xWGQ
	7q9xMDiExLzypChEy9SiA6zq96ykBL62gX8FkAQnmbqiwfqqIPpjzQF+crs+Z8x3AIxnsagzLfk
	mGkoDUi5SvNzRjhk/qHK9IcCbHpnrKBw3Cg5yHMERWu4uaQw1WuBJfNHXb0hcIshCHOplMSXhfZ
	9ahPwuKlDB9u6TfbusRujyju9altIzF2TCi0RfWD4xJBSHy1NvJbxhrrxaZGDIL2UauBz7BgZzU
	iMe
X-Received: by 2002:a05:620a:2844:b0:8c9:e8e9:9bf5 with SMTP id af79cd13be357-8cb8ca6e6efmr1935508485a.53.1772005792291;
        Tue, 24 Feb 2026 23:49:52 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d0614fbsm1390089785a.17.2026.02.24.23.49.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:49:51 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 9/9] oe-selftest/cases/wic.py: oe-selftest -r wic.Wic2 -> PASS
Date: Wed, 25 Feb 2026 02:49:31 -0500
Message-ID: <20260225074931.1661345-10-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260225074931.1661345-1-twoerner@gmail.com>
References: <20260225074931.1661345-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 07:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231938

Changes for the wic.Wic2 oe-selftests to pass now that wic is a
stand-alone app and no longer part of oe-core.

NOTE: the wic.Wic2.test_sparse_copy test was deleted since it tests code
      that is internal to wic itself; which is no longer possible now
      that wic is not part of oe-core.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v6:
- removed extraopts options that specify sector-size values for dos and
  ext* partition types

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
 meta/lib/oeqa/selftest/cases/wic.py | 74 ++++++++++-------------------
 1 file changed, 26 insertions(+), 48 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 355c680f80ba..d2bc4c065ccf 100644
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
@@ -1812,12 +1790,12 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
                 ['part ext2   --fstype ext2     --source rootfs --mkfs-extraopts "-D -F -i 8192"\n',
                  "part btrfs  --fstype btrfs    --source rootfs --size 40M --mkfs-extraopts='--quiet'\n",
                  'part squash --fstype squashfs --source rootfs --mkfs-extraopts "-no-sparse -b 4096"\n',
-                 'part emptyvfat   --fstype vfat   --size 1M --mkfs-extraopts "-S 1024 -s 64"\n',
-                 'part emptymsdos  --fstype msdos  --size 1M --mkfs-extraopts "-S 1024 -s 64"\n',
+                 'part emptyvfat   --fstype vfat   --size 1M --mkfs-extraopts "-s 64"\n',
+                 'part emptymsdos  --fstype msdos  --size 1M --mkfs-extraopts "-s 64"\n',
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


