Return-Path: <anna-lena.marx@inovex.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466A3C6FA8E
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 15:01:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.25543.1677596474119302384
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 07:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@inovex.de header.s=google header.b=GsKYAxBf;
 spf=pass (domain: inovex.de, ip: 209.85.128.53, mailfrom: anna-lena.marx@inovex.de)
Received: by mail-wm1-f53.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so5552097wmq.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 07:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inovex.de; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCu5QBXsJ94uSiERTzQH5cTDQcUynO2h7bwP0fKGK0E=;
        b=GsKYAxBfMoEJdKuQ/fEm1MdkO2xsdn5BP4Q2CbA7cCX/37W0dYeV36MDm0A0v15viH
         fcBtkSvmWuyk8+fk6C0b3s/dk83ijDpSFlH60Z3s5C+MjS8/+D62SdM4cKwJzZYGujSW
         fp0ggLY/IpfbSdqm4L0O8g5kwxc/dE/Iz56KihgFUFYEdhnLQ8oh+nW7CxIWMMySaeWp
         38dXfPRCezD+a7WVpyIqXZYKu5lYQiJjILrMynIiwQsdFPZfZb+SxFOJqAW2HymofPp+
         Vf9pcTU8ZEltAZZbJD6kUWVlRC8J7gf3gPMP0ytrqryTBdqPkVMlVN6+KjQmuvyt829c
         ZICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCu5QBXsJ94uSiERTzQH5cTDQcUynO2h7bwP0fKGK0E=;
        b=KvV5eCc9G3AiTeMcbvJFnS/jEOec1qO8vjlZvam7Hr0vWvdrU7E+e+BT3DuVnScxoJ
         jWwvz/dEwPsEKBBq9WgLihN0DBfaYieMy3onke1KsYsuTK901YTfRQjWikP/r5suzF3G
         voPxf6UmTcFGEQmbowYINj/qN3XQam1ip++jAZkiXu+fSRfjtQHsf4JWSsYq/God4THU
         7GjnsAihBecz/w8KmLGzQZGbpgF6wxys77bFe2j9JtIQAFzB+2Da/YZ/vZFX5sKktteD
         cmRE8hIMrJlxuDEGrHmFnmPFYoCLp6Hjv/bVlBLQ6aQzq8xzWql0PYqio1FGLiAWmnC8
         COEg==
X-Gm-Message-State: AO0yUKXlgo6fJOHcrRQg/4XSv/8X3hWBEtvnK/sGRH2CfOcWNQJmAvCW
	tuudxo89MvxwWkeZ1QaURWs0MuCdFTUY+e9T6Fml41JdTT6EiI+qZDZmfOgBc+Az7VadNjN9zd0
	AJLrmUdFCjfJaz//6rG1HuN9DRmyXxGWVnfG4JFUaNGcCigDw8TcIGAkMYlJLBVzCjcqHVT4RqY
	kBClwyDOsLxP0Auybelk+xlSEC6as=
X-Google-Smtp-Source: AK7set8QRoBol5XByH9+xl2UmsnJ9I0f+6AYfAD6HD2g/tr4kVbnxm270iKU+EribeztQLpOgRjL3g==
X-Received: by 2002:a05:600c:4fcb:b0:3db:3e8:feca with SMTP id o11-20020a05600c4fcb00b003db03e8fecamr2521982wmq.15.1677596471749;
        Tue, 28 Feb 2023 07:01:11 -0800 (PST)
Received: from Dell.fritz.box ([2001:9e8:3860:6700:ca25:e36:4786:4ec8])
        by smtp.gmail.com with ESMTPSA id l8-20020a05600c1d0800b003de2fc8214esm13846688wms.20.2023.02.28.07.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 07:01:11 -0800 (PST)
From: Anna-Lena Marx <anna-lena.marx@inovex.de>
To: openembedded-core@lists.openembedded.org
Cc: Anna-Lena Marx <anna-lena.marx@inovex.de>
Subject: [oe-core][PATCH 1/1] wic: Add support for F2FS in WIC rootfs plugin
Date: Tue, 28 Feb 2023 16:00:58 +0100
Message-Id: <d6eaaa6541a496112bfbd82401bf94d031741e59.1677593618.git.anna-lena.marx@inovex.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1677593618.git.anna-lena.marx@inovex.de>
References: <cover.1677593618.git.anna-lena.marx@inovex.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 15:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177839

Building F2FS rootfs is supported in Yocto/OpenEmbedded - 
see image_types.bbclass, but not in WIC.
This adds it as a nice convenience feature.

F2FS needs a minimum size of ~500M to operate correctly due to
an overprovision functionality.

Signed-off-by: Anna-Lena Marx <anna-lena.marx@inovex.de>
---
 meta/classes-recipe/image_types_wic.bbclass |  2 +-
 meta/lib/oeqa/selftest/cases/wic.py         |  2 ++
 meta/recipes-core/meta/wic-tools.bb         |  2 +-
 scripts/lib/wic/help.py                     |  1 +
 scripts/lib/wic/ksparser.py                 |  2 +-
 scripts/lib/wic/misc.py                     |  1 +
 scripts/lib/wic/partition.py                | 32 ++++++++++++++++++++-
 7 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index c339b9bdfb..8ae5ecca4d 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -89,7 +89,7 @@ do_image_wic[recrdeptask] += "do_deploy"
 do_image_wic[deptask] += "do_image_complete"
 
 WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
-WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
+WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native f2fs-tools-native"
 # Unified kernel images need objcopy
 WKS_FILE_DEPENDS_DEFAULT += "virtual/${MLPREFIX}${TARGET_PREFIX}binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index ca1abb970a..5e255e35c7 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1188,6 +1188,7 @@ class Wic2(WicTestCase):
         with NamedTemporaryFile("w", suffix=".wks") as wks:
             wks.writelines(['part ext2   --fstype ext2     --source rootfs\n',
                             'part btrfs  --fstype btrfs    --source rootfs --size 40M\n',
+                            'part f2fs   --fstype f2fs     --source rootfs --size 50M\n',
                             'part squash --fstype squashfs --source rootfs\n',
                             'part swap   --fstype swap --size 1M\n',
                             'part emptyvfat   --fstype vfat   --size 1M\n',
@@ -1258,6 +1259,7 @@ class Wic2(WicTestCase):
             wks.writelines(
                 ['part ext2   --fstype ext2     --source rootfs --mkfs-extraopts "-D -F -i 8192"\n',
                  "part btrfs  --fstype btrfs    --source rootfs --size 40M --mkfs-extraopts='--quiet'\n",
+                 "part f2fs   --fstype f2fs     --source rootfs --size 50M --mkfs-extraopts='-O extra_attr -o 20'\n",
                  'part squash --fstype squashfs --source rootfs --mkfs-extraopts "-no-sparse -b 4096"\n',
                  'part emptyvfat   --fstype vfat   --size 1M --mkfs-extraopts "-S 1024 -s 64"\n',
                  'part emptymsdos  --fstype msdos  --size 1M --mkfs-extraopts "-S 1024 -s 64"\n',
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index 9282d36a4d..d30ce66b56 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -7,7 +7,7 @@ DEPENDS = "\
            mtools-native bmap-tools-native grub-native cdrtools-native \
            btrfs-tools-native squashfs-tools-native pseudo-native \
            e2fsprogs-native util-linux-native tar-native erofs-utils-native \
-           virtual/${TARGET_PREFIX}binutils \
+           f2fs-tools-native virtual/${TARGET_PREFIX}binutils \
            "
 DEPENDS:append:x86 = " syslinux-native syslinux grub-efi systemd-boot"
 DEPENDS:append:x86-64 = " syslinux-native syslinux grub-efi systemd-boot"
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 73e3380cde..0094065931 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -931,6 +931,7 @@ DESCRIPTION
              btrfs
              squashfs
              erofs
+             f2fs
              swap
 
          --fsoptions: Specifies a free-form string of options to be
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index d1e546b12d..e10ce6581d 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -159,7 +159,7 @@ class KickStart():
         part.add_argument('--fstype', default='vfat',
                           choices=('ext2', 'ext3', 'ext4', 'btrfs',
                                    'squashfs', 'vfat', 'msdos', 'erofs',
-                                   'swap', 'none'))
+                                   'f2fs', 'swap', 'none'))
         part.add_argument('--mkfs-extraopts', default='')
         part.add_argument('--label')
         part.add_argument('--use-label', action='store_true')
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 2b90821b30..dc84a37423 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -41,6 +41,7 @@ NATIVE_RECIPES = {"bmaptool": "bmap-tools",
                   "mkfs.ext3": "e2fsprogs",
                   "mkfs.ext4": "e2fsprogs",
                   "mkfs.vfat": "dosfstools",
+                  "mkfs.f2fs": "f2fs-tools",
                   "mksquashfs": "squashfs-tools",
                   "mkswap": "util-linux",
                   "mmd": "mtools",
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 382afa44bc..6adcaa041f 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -208,7 +208,7 @@ class Partition():
         Prepare content for a rootfs partition i.e. create a partition
         and fill it from a /rootfs dir.
 
-        Currently handles ext2/3/4, btrfs, vfat and squashfs.
+        Currently handles ext2/3/4, btrfs, vfat, squashfs and f2fs.
         """
 
         rootfs = "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
@@ -351,6 +351,36 @@ class Partition():
              self.mkfs_extraopts, self.fsuuid, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
+    def prepare_rootfs_f2fs(self, rootfs, cr_workdir, oe_builddir, rootfs_dir,
+                            native_sysroot, pseudo):
+        """
+        Prepare content for a f2fs rootfs partition.
+        """
+        du_cmd = "du -ks %s" % rootfs_dir
+        out = exec_cmd(du_cmd)
+        actual_rootfs_size = int(out.split()[0])
+
+        min_f2fs_size = 524288
+        rootfs_size = self.get_rootfs_size(actual_rootfs_size)
+        if rootfs_size < min_f2fs_size:
+            rootfs_size = min_f2fs_size
+
+        with open(rootfs, 'w') as sparse:
+            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
+
+        extraopts = self.mkfs_extraopts or "-O extra_attr,compression"
+
+        label_str = ""
+        if self.label:
+            label_str = "-l %s" % self.label
+
+        mkfs_f2fs_cmd = "mkfs.f2fs %s %s %s" % \
+                        (label_str, extraopts, rootfs)
+        exec_native_cmd(mkfs_f2fs_cmd, native_sysroot, pseudo=pseudo)
+
+        sload_f2fs_cmd = "sload.f2fs -f %s %s" % (rootfs_dir, rootfs)
+        exec_native_cmd(sload_f2fs_cmd, native_sysroot, pseudo=pseudo)
+
     def prepare_rootfs_msdos(self, rootfs, cr_workdir, oe_builddir, rootfs_dir,
                              native_sysroot, pseudo):
         """
-- 
2.39.2


