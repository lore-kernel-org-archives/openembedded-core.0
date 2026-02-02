Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85599E73179
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 13:54:48 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52980.1770040479308144753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 05:54:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cceC/iX0;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8c6d8751c88so466353085a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 05:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770040477; x=1770645277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSmM8GMPzfAADO+mdqPSzD5XFKdrCP7WKV8QDVIYGDg=;
        b=cceC/iX0LbCBtOTE9Ueorn1gZRyE6ZfKQ2u7PFHqQsJ8PKAkQlRQ71JLOghzyaMwyN
         xbfIIAlCKXCCGa5gEYF7H6IiXdI9d91ahAIqnEDWW48TThaQOcnu4dBE3zaA5k+awXdN
         QqL6TWcGYv8Fha/i/AItw51S2yBM0Dgtfto2nYf8ul2FYxK2rtUNxUH9p2I9Ee7TxH1a
         bG0QFBn5bZ66P/YYtlCJOFHtAhPC89pUdIwlg75i0F45we02rDltQQGdwaX2DNyso7dG
         CbbQ/Bd6a7ERBMC2uLxxdAWszZy2Y5YYABDvJfafPoJ5XH1mU4sZTyL+k5E2iMitkNmH
         3a5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770040477; x=1770645277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OSmM8GMPzfAADO+mdqPSzD5XFKdrCP7WKV8QDVIYGDg=;
        b=bTlV441e3gANrhdDskpLKiM+08oT35qifKD6eCxl2GrSpIdSdsMTGfzp4ED3qJ9RI8
         IX43Uz2JymC+X1siI5fH2KXMjSyEskZDxyTEa9ikWzEfMp+oqgjoKw0MMEhkCRwioBhr
         KddRcffJ8bGxhHpIceMaLjAIJPbGrdSyZ2Zi5wKESPMvvNrlDTQSurjXuQYlTgvSWY1y
         3/iclv0pjRp8TMhbAlsBI5KpepthNewm6IokYaa53gspqCHpxnJDmSjDgURkniZkH9FD
         NnFafZwaf+AMigH1J26jCyZAavZbfAau1+v9Pk/LTMkx+LfALcHOh/eyBh889lK3Vc9q
         hyxQ==
X-Gm-Message-State: AOJu0Yw78iWd4SIOMSHhXwTVfDmaKAxbGqgYYpoyiP/L2GXXHGzW7OPq
	dtnn7AobjswWUb9n88CWQ6rZbYT9a8isuro/QHAhn+ehLRbHf/mEDlfLPj66BcyR
X-Gm-Gg: AZuq6aLvULCYfJg/aKjrHAYfzhzZSVb/oSzFJ3L3PI9Y6E5QglSzEXetSGwp3ZlTrfU
	hJ4bnCmLcUloSJM1kYZagsMmtn4NCgy89jLVZMlXF4SQb4cLkMJ1BQ7qLLueaYDMFbvwZcdRs/m
	f4Vsqg0fFqywFdlnWGAOC57rvImMJMbLB1IuKjvHzCmE1HBCyUTLZ5kRW8WTAZ7HO3vXu80HUDK
	X02jkeDncEbuMBH/d9NTghbkCGi3cxlPcqQEtuClBGO/scg717jnj6JO93pFRaL/B/W1RrcbV3w
	4uDO4ZWGLMYPP+AdL3Ht3wsuZ4luAhvMx65S+lZQWAsazrGVbynJTkPz0oZX+xpvbDc2nHkH8kr
	6uh657d9od08evtxRZ2LSbJBuzUSn2zJR9D8So6A9xdQdU8zNHWuNxUANzBKZXFmOkqF5vWjHRh
	KKF8QX1YHgOU434lHFaH00CefylPv54AHK+KExtN4RCcqaVaBnLF+KSg==
X-Received: by 2002:a05:620a:3195:b0:8c6:6e2b:ac1a with SMTP id af79cd13be357-8c9eb270195mr1361454985a.28.1770040476835;
        Mon, 02 Feb 2026 05:54:36 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d2845fsm1248654585a.31.2026.02.02.05.54.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:54:36 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH 8/9] oe-selftest -r wic.Wic2 (non-runqemu) -> PASS
Date: Mon,  2 Feb 2026 08:54:13 -0500
Message-ID: <20260202135414.682558-8-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202135414.682558-1-twoerner@gmail.com>
References: <20260202135414.682558-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 13:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230360

Changes for the wic.Wic2 non-runqemu oe-selftests to pass now that wic
is a stand-alone app and no longer part of oe-core.

NOTE: the wic.Wic2.test_sparse_copy test was deleted since it tests a
      submodule of the wic project itself and therefore should be tested
      in the wic project itself, instead of in oe-core

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 70 ++++++++++-------------------
 1 file changed, 23 insertions(+), 47 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 3b24d0a5a645..b35dbd9fb348 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1020,14 +1020,14 @@ class Wic2(WicTestCase):
 
     def test_bmap_short(self):
         """Test generation of .bmap file -m option"""
-        cmd = "wic create wictestdisk -e core-image-minimal -m -o %s" % self.resultdir
+        cmd = "wic create wictestdisk -e core-image-minimal -m -o %s --vars %s" % (self.resultdir, self.envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*direct"))))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*direct.bmap"))))
 
     def test_bmap_long(self):
         """Test generation of .bmap file --bmap option"""
-        cmd = "wic create wictestdisk -e core-image-minimal --bmap -o %s" % self.resultdir
+        cmd = "wic create wictestdisk -e core-image-minimal --bmap -o %s --vars %s" % (self.resultdir, self.envfile)
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*direct"))))
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "wictestdisk-*direct.bmap"))))
@@ -1045,7 +1045,7 @@ class Wic2(WicTestCase):
 
         wicvars = set(bb_vars['WICVARS'].split())
         # filter out optional variables
-        wicvars = wicvars.difference(('DEPLOY_DIR_IMAGE', 'IMAGE_BOOT_FILES',
+        wicvars = wicvars.difference(('DEPLOY_DIR_IMAGE', 'IMAGE_BOOT_FILES', 'WIC_SECTOR_SIZE',
                                       'INITRD', 'INITRD_LIVE', 'ISODIR','INITRAMFS_IMAGE',
                                       'INITRAMFS_IMAGE_BUNDLE', 'INITRAMFS_LINK_NAME',
                                       'APPEND', 'IMAGE_EFI_BOOT_FILES', 'IMAGE_EXTRA_PARTITION_FILES'))
@@ -1090,6 +1090,7 @@ class Wic2(WicTestCase):
         config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "wic-image-minimal"\n'\
                  'MACHINE_FEATURES:append = " efi"\n'
         image_recipe_append = """
+DEPENDS:append = " wic-native"
 do_image_wic[postfuncs] += "run_wic_cmd"
 run_wic_cmd() {
     echo "test" >> ${WORKDIR}/test.wic-cp
@@ -1111,7 +1112,7 @@ run_wic_cmd() {
 
         sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
         # check if file is there
-        result = runCmd("wic ls %s:1/ -n %s" % (prefix+"wic", sysroot))
+        result = runCmd("wic ls %s:1/ -n %s --vars %s" % (prefix+"wic", sysroot, self.envfile))
         self.assertIn("test.wic-cp", result.output)
 
         # check if we have result image and manifests symlinks
@@ -1194,7 +1195,7 @@ run_wic_cmd() {
         return wkspath
 
     def _get_wic(self, wkspath, ignore_status=False):
-        p = runCmd("wic create %s -e core-image-minimal -o %s" % (wkspath, self.resultdir),
+        p = runCmd("wic create %s -e core-image-minimal -o %s --vars %s" % (wkspath, self.resultdir, self.envfile),
                    ignore_status=ignore_status)
 
         if p.status:
@@ -1435,7 +1436,7 @@ run_wic_cmd() {
             wks.write('part / --source rawcopy --sourceparams="file=%s.%s%s"\n'\
                       % (bb_vars['IMAGE_LINK_NAME'], fstype, params))
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, image, self.resultdir)
+            cmd = "wic create %s -e %s -o %s --vars %s" % (wks.name, image, self.resultdir, self.envfile)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
@@ -1471,7 +1472,7 @@ run_wic_cmd() {
 
         # Fstype column from 'wic ls' should be empty for the second partition
         # as listed in test_empty_plugin.wks
-        result = runCmd("wic ls %s -n %s | awk -F ' ' '{print $1 \" \" $5}' | grep '^2' | wc -w" % (image_path, sysroot))
+        result = runCmd("wic ls %s -n %s -v %s| awk -F ' ' '{print $1 \" \" $5}' | grep '^2' | wc -w" % (image_path, sysroot, self.envfile))
         self.assertEqual('1', result.output)
 
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
@@ -1528,7 +1529,7 @@ run_wic_cmd() {
                             'part / --source rootfs --fstype=ext4 --align 1024 --use-uuid\n'\
                             'bootloader --timeout=0 --append="console=ttyS0,115200n8"\n'])
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            cmd = "wic create %s -e %s -o %s --vars %s" % (wks.name, img, self.resultdir, self.envfile)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(os.path.join(self.resultdir, "%s-*.direct" % wksname))
@@ -1540,6 +1541,7 @@ run_wic_cmd() {
         config = 'IMAGE_EFI_BOOT_FILES="/etc/fstab;testfile"\nIMAGE_FSTYPES = "wic"\nWKS_FILE = "test_uefikernel.wks"\nMACHINE_FEATURES:append = " efi"\n'
         self.append_config(config)
         bitbake('core-image-minimal')
+        envvars = self._create_image_env_file('core-image-minimal')
         self.remove_config(config)
 
         img = 'core-image-minimal'
@@ -1548,7 +1550,7 @@ run_wic_cmd() {
                             'part / --source rootfs --fstype=ext4 --align 1024 --use-uuid\n'\
                             'bootloader --timeout=0 --append="console=ttyS0,115200n8"\n'])
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            cmd = "wic create %s -e %s -o %s --vars %s" % (wks.name, img, self.resultdir, envvars)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(os.path.join(self.resultdir, "%s-*.direct" % wksname))
@@ -1692,6 +1694,7 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
         "
         """)
         self.append_config(config)
+        self.envfile = self._create_image_env_file('core-image-minimal')
 
         deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
 
@@ -1715,11 +1718,11 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
                 wks.flush()
                 _, wicimg = self._get_wic(wks.name)
 
-                result = runCmd("wic ls %s | wc -l" % wicimg)
+                result = runCmd("wic ls %s -v %s | wc -l" % (wicimg, self.envfile))
                 self.assertEqual('4', result.output, msg="Expect 3 partitions, not %s" % result.output)
 
                 for part, file in enumerate(["foo.conf", "foobar.conf", "bar.conf"]):
-                    result = runCmd("wic ls %s:%d | grep -q \"%s\"" % (wicimg, part + 1, file))
+                    result = runCmd("wic ls %s:%d -v %s| grep -q \"%s\"" % (wicimg, part + 1, self.envfile, file))
                     self.assertEqual(0, result.status, msg="File '%s' not found in the partition #%d" % (file, part))
 
             self.remove_config(config)
@@ -1740,7 +1743,7 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
                             'part emptyext2   --fstype ext2   --size 1M\n',
                             'part emptybtrfs  --fstype btrfs  --size 150M\n'])
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            cmd = "wic create %s -e %s -o %s --vars %s" % (wks.name, img, self.resultdir, self.envfile)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
@@ -1752,7 +1755,7 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
             wks.writelines(['part / --fstype ext3 --source rootfs --system-id 0xFF '\
                             '--overhead-factor 1.2 --size 100k\n'])
             wks.flush()
-            cmd = "wic create %s -e core-image-minimal -o %s" % (wks.name, self.resultdir)
+            cmd = "wic create %s -e core-image-minimal -o %s --vars %s" % (wks.name, self.resultdir, self.envfile)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
@@ -1761,41 +1764,14 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
     def test_image_bootpart_globbed(self):
         """Test globbed sources with image-bootpart plugin"""
         img = "core-image-minimal"
-        cmd = "wic create sdimage-bootpart -e %s -o %s" % (img, self.resultdir)
         config = 'IMAGE_BOOT_FILES = "%s*"' % get_bb_var('KERNEL_IMAGETYPE', img)
         self.append_config(config)
+        envvars = self._create_image_env_file('core-image-minimal')
+        cmd = "wic create sdimage-bootpart -e %s -o %s --vars %s" % (img, self.resultdir, envvars)
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
@@ -1809,7 +1785,7 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
                  'part emptyext2   --fstype ext2   --size 1M --mkfs-extraopts "-D -F -i 8192"\n',
                  'part emptybtrfs  --fstype btrfs  --size 100M --mkfs-extraopts "--mixed -K"\n'])
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            cmd = "wic create %s -e %s -o %s --vars %s" % (wks.name, img, self.resultdir, self.envfile)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
@@ -1908,7 +1884,7 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
                  'part empty --source empty --sourceparams="size=2048k,bs=512K" --ondisk sda --size 4M --align 1024\n'
                  ])
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            cmd = "wic create %s -e %s -o %s --vars %s" % (wks.name, img, self.resultdir, self.envfile)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             wicout = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
@@ -1926,7 +1902,7 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
         with NamedTemporaryFile("w", suffix=".wks") as wks:
             wks.writelines(['part empty --source empty --sourceparams="fill" --ondisk sda --size 1M\n'])
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            cmd = "wic create %s -e %s -o %s --vars %s" % (wks.name, img, self.resultdir, self.envfile)
             result = runCmd(cmd, ignore_status=True)
             self.assertIn("Source parameter 'fill' only works with the '--fixed-size' option, exiting.", result.output)
             self.assertNotEqual(0, result.status)
@@ -1940,7 +1916,7 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
                             'part /boot --size=100M --active --fstype=ext4 --label boot\n'
                             'part /     --source rootfs      --fstype=ext4 --label root\n'])
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            cmd = "wic create %s -e %s -o %s --vars %s" % (wks.name, img, self.resultdir, self.envfile)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
@@ -1958,7 +1934,7 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
                             'part /boot --size=100M --active --fstype=ext4 --label boot\n'
                             'part /     --source rootfs      --fstype=ext4 --label root\n'])
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            cmd = "wic create %s -e %s -o %s --vars %s" % (wks.name, img, self.resultdir, self.envfile)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
-- 
2.51.0


