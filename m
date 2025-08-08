Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1682FC87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 14:54:40 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.24453.1754664869542827737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 07:54:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=20fTy+LM;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so18760085e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 07:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1754664868; x=1755269668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy6vfgFftf0NIILJeTzKkIF6J0BIKqSWGwK3C8KvBLA=;
        b=20fTy+LMVikPCYBScCeHtRJNvjWcHekfJi349a9RBbWEWXTBHw3FHPUvBs/IFtEKn3
         Ho+7JYdJIsdWp+XGrdembqM7dluzyZ3WMKJx1cbooII53d9dDoLUxJTUpLul75BaLsf4
         b2w2QODpAaA9Us1ZZRMOiSzfBx4NlMSd2dONI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754664868; x=1755269668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vy6vfgFftf0NIILJeTzKkIF6J0BIKqSWGwK3C8KvBLA=;
        b=k8NyaySpARVQO14mtgq2obDd1YxWnkb6qu1HEemMCLozhQP8AcGKLHWJM2WztFEGc7
         PkPjul21vXuEoaUHy/cL5dpvZYxl6Kjk0G+cSx9ey2tmlZpLyuWfvp0D0UOZJ+j4IUUe
         QS1p09eJ9pWU5Y8XR8fjgtpc/blMg9K0+LN+cAGDiFhdZusJr+Y4d7+kWvqD6lg/aXGe
         LwR8SDcS+z2iXQfut3bIN5flXM6Y2nzEDDx4GJUktNt2jJEdnM9wnOH4eQ3+IYYrBNVz
         0CkxcdwTjIJCGc1hCoQ9zzzsWNhVkKT1MEXnmKedxNcEp0tKJbHTBeB6msUGB5UCd3+t
         VzTA==
X-Gm-Message-State: AOJu0Yz/2zC/aoGj0xXsDPjiYn/P61EiOJP620l8qWNoFqwVTsRkgDUP
	4aqcjitzd0JZPX7vq2sCf645276Mea7N25e66IbOsu5p+tDegSpXs9W4l8YpB+kugIYAfzroYbW
	bksZ5
X-Gm-Gg: ASbGncuXna5qfnLYUbfIhe8XSXHq3IRZWnQzM22a+mxJavR/EuJeqRscZao2GSxfFO2
	7LnX5XGpTBiZ/hS9SwpdV9xXaxV7bu7OWu8OV+wVm+tl2ZtbZWfSgvw8OyUq4fxjHqIFpmetJD4
	CbQNXQ6P8bSY8U6PalrMEUjrpy9dxVFIzCQj7IHN224DlsTwh0lm6o8eqK7TBhsPYD0USw2miZW
	4D8SeZWN6d4FEpu5AbL5GrnC0eA9mR3+qTYpJtl74X4mKlqVlnhkwR95sHUQZq1BpkqYNdiM700
	wdfe/Am5QT2TFGgEfSACiVNYIME5qi0E8FQczhfpw6cd9DE2aoDbRwXyhV7JzQBYOyd0sWqxAyW
	5p0Vcst3bLlgh/8DQ4/fYPdVJ/1hZuF/OlhhJAwyR7VxW4832iKJGlEwPVE17E9LRME/WBL62SF
	NHeTBG97EYTsiiBdhlS4Vl+g1vMQ==
X-Google-Smtp-Source: AGHT+IF6ZkNGhzQPsFnfawDknVCYTBn12dz6gHwR2kLThx09exkWO3hhLF8mX5A9MzZNBe1hL/fp4g==
X-Received: by 2002:a05:600c:1d16:b0:459:d667:1842 with SMTP id 5b1f17b1804b1-459faa96842mr9942265e9.12.1754664867834;
        Fri, 08 Aug 2025 07:54:27 -0700 (PDT)
Received: from FRSMI24-BLUE.home (2a01cb000301bd0006c9ce16548aa735.ipv6.abo.wanadoo.fr. [2a01:cb00:301:bd00:6c9:ce16:548a:a735])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459dd85f423sm201400905e9.18.2025.08.08.07.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 07:54:27 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v2] wic: add --extra-part-space option to set unused space
Date: Fri,  8 Aug 2025 16:49:58 +0200
Message-Id: <20250808144958.1005928-1-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 14:54:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221660

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

Currently, the content of the partition is filled by the filesystem
without leaving any unused free space. The --extra-space flag adds
extra space to the filesystem size, not to the partition.

Unused free space after the filesystem can be useful for some cases,
such as encrypting a partition at runtime. With --extra-part-space 32M,
we ensure that the last 32M of the partition is unused: this space does
not contain filesystem data and can store the LUKS2 header.

The implementation sets a difference between the partition and
filesystem size:
  - With --fixed-size, the extra part space is removed from the
    filesystem size.
  - Otherwise (with or without --size flags), the extra part space is
    added to the partition size.

Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

CC: Alexander Kanavin <alex.kanavin@gmail.com>
---
changes in v2:
- renaming the option to --extra-part-space
- adding tests
---
 meta/lib/oeqa/selftest/cases/wic.py | 55 +++++++++++++++++++++++++++--
 scripts/lib/wic/ksparser.py         |  3 ++
 scripts/lib/wic/partition.py        | 38 ++++++++++++--------
 3 files changed, 79 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 680f99d381..9cd1b8b151 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1125,7 +1125,7 @@ run_wic_cmd() {
 
         return wkspath
 
-    def _get_wic_partitions(self, wkspath, native_sysroot=None, ignore_status=False):
+    def _get_wic(self, wkspath, ignore_status=False):
         p = runCmd("wic create %s -e core-image-minimal -o %s" % (wkspath, self.resultdir),
                    ignore_status=ignore_status)
 
@@ -1139,7 +1139,10 @@ run_wic_cmd() {
         if not wicout:
             return (p, None)
 
-        wicimg = wicout[0]
+        return (p, wicout[0])
+
+    def _get_wic_partitions(self, wkspath, native_sysroot=None, ignore_status=False):
+        p, wicimg = self._get_wic(wkspath, ignore_status)
 
         if not native_sysroot:
             native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
@@ -1279,6 +1282,54 @@ run_wic_cmd() {
             size = int(size[:-3])
             self.assertGreaterEqual(size, 204800)
 
+    def test_extra_part_space(self):
+        native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
+
+        with NamedTemporaryFile("w", suffix=".wks") as tempf:
+            tempf.write("bootloader --ptable gpt\n" \
+                        "part                 --ondisk hda --size 10M        --extra-part-space 10M --fstype=ext4\n" \
+                        "part                 --ondisk hda --fixed-size 20M  --extra-part-space 10M --fstype=ext4\n" \
+                        "part --source rootfs --ondisk hda                   --extra-part-space 10M --fstype=ext4\n" \
+                        "part --source rootfs --ondisk hda --fixed-size 200M --extra-part-space 10M --fstype=ext4\n")
+            tempf.flush()
+
+            _, wicimg = self._get_wic(tempf.name)
+
+            res = runCmd("parted -m %s unit b p" % wicimg,
+                            native_sysroot=native_sysroot, stderr=subprocess.PIPE)
+
+            # parse parted output which looks like this:
+            # BYT;\n
+            # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
+            # 1:0.00MiB:200MiB:200MiB:ext4::;\n
+            partlns = res.output.splitlines()[2:]
+
+            self.assertEqual(4, len(partlns))
+
+            # Test for each partitions that the extra part space exists
+            for part in range(0, len(partlns)):
+                part_file = os.path.join(self.resultdir, "selftest_img.part%d" % (part + 1))
+                partln = partlns[part].split(":")
+                self.assertEqual(7, len(partln))
+                self.assertRegex(partln[3], r'^[0-9]+B$')
+                part_size = int(partln[3].rstrip("B"))
+                start = int(partln[1].rstrip("B")) / 512
+                length = part_size / 512
+                runCmd("dd if=%s of=%s skip=%d count=%d" %
+                                            (wicimg, part_file, start, length))
+                res = runCmd("dumpe2fs %s -h | grep \"^Block count\"" % part_file)
+                fs_size = int(res.output.split(":")[1].strip()) * 1024
+                self.assertLessEqual(fs_size + 10485760, part_size, "part file: %s" % part_file)
+
+        with NamedTemporaryFile("w", suffix=".wks") as tempf:
+            # Test that image creation fails if space left is too small for the rootfs
+            tempf.write("bootloader --ptable gpt\n" \
+                        "part --source rootfs --ondisk hda --fixed-size 200M --extra-part-space 150M --fstype=ext4\n")
+            tempf.flush()
+
+            p, _ = self._get_wic(tempf.name, ignore_status=True)
+            self.assertNotEqual(p.status, 0, "wic exited successfully when an error was expected:\n%s" % p.output)
+
     # TODO this test could also work on aarch64
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
     @OETestTag("runqemu")
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 7ef3dc83dd..527569ab97 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -154,6 +154,7 @@ class KickStart():
         part.add_argument('--include-path', nargs='+', action='append')
         part.add_argument('--change-directory')
         part.add_argument("--extra-space", type=sizetype("M"))
+        part.add_argument('--extra-part-space', type=sizetype("M"))
         part.add_argument('--fsoptions', dest='fsopts')
         part.add_argument('--fspassno', dest='fspassno')
         part.add_argument('--fstype', default='vfat',
@@ -259,6 +260,8 @@ class KickStart():
                             err = "%s:%d: Must set the label with --label" \
                                   % (confpath, lineno)
                             raise KickStartError(err)
+                        if not parsed.extra_part_space:
+                            parsed.extra_part_space = 0
                         # using ArgumentParser one cannot easily tell if option
                         # was passed as argument, if said option has a default
                         # value; --overhead-factor/--extra-space cannot be used
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index b34691d313..b560d6a2be 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -32,6 +32,7 @@ class Partition():
         self.exclude_path = args.exclude_path
         self.include_path = args.include_path
         self.change_directory = args.change_directory
+        self.extra_part_space = args.extra_part_space
         self.fsopts = args.fsopts
         self.fspassno = args.fspassno
         self.fstype = args.fstype
@@ -91,17 +92,16 @@ class Partition():
     def get_rootfs_size(self, actual_rootfs_size=0):
         """
         Calculate the required size of rootfs taking into consideration
-        --size/--fixed-size flags as well as overhead and extra space, as
-        specified in kickstart file. Raises an error if the
-        `actual_rootfs_size` is larger than fixed-size rootfs.
-
+        --size/--fixed-size and --extra-part-space flags as well as overhead
+        and extra space, as specified in kickstart file. Raises an error
+        if the `actual_rootfs_size` is larger than fixed-size rootfs.
         """
         if self.fixed_size:
-            rootfs_size = self.fixed_size
+            rootfs_size = self.fixed_size - self.extra_part_space
             if actual_rootfs_size > rootfs_size:
                 raise WicError("Actual rootfs size (%d kB) is larger than "
-                               "allowed size %d kB" %
-                               (actual_rootfs_size, rootfs_size))
+                               "allowed size %d kB (including %d kB extra part space)" %
+                               (actual_rootfs_size, rootfs_size, self.extra_part_space))
         else:
             extra_blocks = self.get_extra_block_count(actual_rootfs_size)
             if extra_blocks < self.extra_space:
@@ -119,10 +119,18 @@ class Partition():
     def disk_size(self):
         """
         Obtain on-disk size of partition taking into consideration
-        --size/--fixed-size options.
+        --size/--fixed-size and --extra-part-space options.
+
+        """
+        return self.fixed_size if self.fixed_size else self.size + self.extra_part_space
 
+    @property
+    def fs_size(self):
+        """
+        Obtain on-disk size of filesystem inside the partition taking into
+        consideration --size/--fixed-size and --extra-part-space options.
         """
-        return self.fixed_size if self.fixed_size else self.size
+        return self.fixed_size - self.extra_part_space if self.fixed_size else self.size
 
     def prepare(self, creator, cr_workdir, oe_builddir, rootfs_dir,
                 bootimg_dir, kernel_dir, native_sysroot, updated_fstab_path):
@@ -202,10 +210,10 @@ class Partition():
                            "This a bug in source plugin %s and needs to be fixed." %
                            (self.mountpoint, self.source))
 
-        if self.fixed_size and self.size > self.fixed_size:
+        if self.fixed_size and self.size + self.extra_part_space > self.fixed_size:
             raise WicError("File system image of partition %s is "
-                           "larger (%d kB) than its allowed size %d kB" %
-                           (self.mountpoint, self.size, self.fixed_size))
+                           "larger (%d kB + %d kB extra part space) than its allowed size %d kB" %
+                           (self.mountpoint, self.size, self.extra_part_space, self.fixed_size))
 
     def prepare_rootfs(self, cr_workdir, oe_builddir, rootfs_dir,
                        native_sysroot, real_rootfs = True, pseudo_dir = None):
@@ -440,7 +448,7 @@ class Partition():
         """
         Prepare an empty ext2/3/4 partition.
         """
-        size = self.disk_size
+        size = self.fs_size
         with open(rootfs, 'w') as sparse:
             os.ftruncate(sparse.fileno(), size * 1024)
 
@@ -464,7 +472,7 @@ class Partition():
         """
         Prepare an empty btrfs partition.
         """
-        size = self.disk_size
+        size = self.fs_size
         with open(rootfs, 'w') as sparse:
             os.ftruncate(sparse.fileno(), size * 1024)
 
@@ -482,7 +490,7 @@ class Partition():
         """
         Prepare an empty vfat partition.
         """
-        blocks = self.disk_size
+        blocks = self.fs_size
 
         label_str = "-n boot"
         if self.label:
-- 
2.34.1


