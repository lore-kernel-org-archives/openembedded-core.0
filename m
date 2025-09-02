Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13892CA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 07:59:27 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.72006.1756799959572081497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 00:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bGzhE07+;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b9814efbcso2914925e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 00:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1756799958; x=1757404758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AdjL2DMgAYNmD4NnSezRLdg2DabdNZbKZf9rDkkwBZg=;
        b=bGzhE07+CAUAhw7fRqVUTaQp7xn3ovAiwwAWHeZOYoTGEJ43u490ovhsC5KdtGsNTE
         0TQfg1llWv6kdKZwak5VxIMm0kCJiDgXvxwIA5ZeUCSzXbWHBqSTnsNB483bfe2mY/zd
         5zMUIl4RkyytV3lvQRbNEc/lRtfGPjsbMhTmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756799958; x=1757404758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdjL2DMgAYNmD4NnSezRLdg2DabdNZbKZf9rDkkwBZg=;
        b=RCwkgdOOP7dFrieI+Wbu0qSycIOy9sAz8/2nK/AYv+071YyDdJuSp5KcRDZj6xUatH
         6jZMu8DZ1y3eP0EL4HtOk0G7kCPf8pRnj5kD8QXVsx3W/WkCW/JcEpHkWfnG5GAGTCxD
         LfBmzVVIeyPZoxdDd+0iJMFRjcNZADIp3h8YDhLA+F3w4GARxf2GOXPnU7p00PM8yeSS
         XCA0xUCXoO7p6ATzpvKFLOsopYog5bi1iLxH5vLy6zQJlNfc01fR6Q7qX/7OswvhzHax
         y3ejyrlsHKCbTG0e+RsjiuLWmBr+/Qt6zjPE+aezzTgzvsFDNFB6tnuKF5GgJD/m3U3W
         bkKg==
X-Gm-Message-State: AOJu0YztFTVs/6HeBLEP6htixaqbRjyR23A+gc3J5aXvkwpLUfRHZ0Bb
	a+pweSME6qVYZy7uOUbdYKD2QFvewz2acJsxFsgS1J/9P11QNmK7UJknJaJmj48/npL2nYskOrp
	DjjmSZr8=
X-Gm-Gg: ASbGncsk5Jo5nafr9SMc+jG1FrB3LgBRQNr6NtcYFq+jrOKqmZf7pGBIM8mOUFJPitq
	X0jCbB4Wo4gu2uAwCoEpH72tiuzJpoHBUAk4MsvalOahzl2XsIFjMONlOK/5wiXxpytyFOJnFrV
	tZ48JWa7DgzA1PRyq6oa0/QwAeKSky3OvboG5X/7oidcDXjU84AcK0cYkPuSKoQEJRcsiPNFmpm
	8iUoE/U3/Vma4qurnkyflbg/zqdJ43lxIHCn/oTbtFt/2hb2cPjKXjASTMBoGBZvsWuYfnOvp2R
	8NsRqbH5HJ8qHGGTYg/+qV6bmxaxyIh55YbzwLw0WcA+6KICH2hJ6PArVWICS4IzGxGQV9eYbDB
	hwqXPLYvobbBDZg5fdv1j7SnW2MEL2mm89IdVIVZp5xYRYkbI3YSKOQ==
X-Google-Smtp-Source: AGHT+IGOmk56Ki0fOIuNC1ncYLWBVGyd6Pt062bLo27Bb/9y15sEvmq3AteVtBnlFv7O0ky3ksaHeg==
X-Received: by 2002:a05:6000:4013:b0:3cb:fee1:de33 with SMTP id ffacd0b85a97d-3d1dcb75f4cmr10656071f8f.7.1756799957875;
        Tue, 02 Sep 2025 00:59:17 -0700 (PDT)
Received: from localhost.localdomain ([195.68.54.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3db72983560sm12052f8f.1.2025.09.02.00.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 00:59:17 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v4 1/2] wic: add --extra-partition-space option to set unused space
Date: Tue,  2 Sep 2025 09:59:00 +0200
Message-Id: <20250902075901.1550357-1-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 07:59:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222713

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

By default, the content of the partition is filled by the filesystem
without leaving any unused free space. The --extra-space flag adds
extra space to the filesystem size, not to the partition.

Unused free space after the filesystem can be useful for some cases,
such as encrypting a partition at runtime.
With --extra-partition-space 32M, we ensure that the last 32M of the
partition is unused: this space does not contain filesystem data and
can store the LUKS2 header.

The implementation sets a difference between the partition and
filesystem size:
  - With --fixed-size, the extra part space is removed from the
    filesystem size.
  - Otherwise (with or without --size flag), the extra part space is
    added to the partition size.

Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

CC: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
changes in v2:
- renaming the option to --extra-part-space
- adding tests

changes in v3:
- renaming the option to --extra-partition-space
- fixing the tests
- adding --extra-partition-space help description

changes in v4:
- removing an irrelevant test
---
 meta/lib/oeqa/selftest/cases/wic.py | 49 +++++++++++++++++++++++++++--
 scripts/lib/wic/help.py             |  8 +++++
 scripts/lib/wic/ksparser.py         |  3 ++
 scripts/lib/wic/partition.py        | 34 ++++++++++++--------
 4 files changed, 79 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 680f99d381..c9c9ceb0f2 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1125,7 +1125,7 @@ run_wic_cmd() {
 
         return wkspath
 
-    def _get_wic_partitions(self, wkspath, native_sysroot=None, ignore_status=False):
+    def _get_wic(self, wkspath, ignore_status=False):
         p = runCmd("wic create %s -e core-image-minimal -o %s" % (wkspath, self.resultdir),
                    ignore_status=ignore_status)
 
@@ -1139,7 +1139,13 @@ run_wic_cmd() {
         if not wicout:
             return (p, None)
 
-        wicimg = wicout[0]
+        return (p, wicout[0])
+
+    def _get_wic_partitions(self, wkspath, native_sysroot=None, ignore_status=False):
+        p, wicimg = self._get_wic(wkspath, ignore_status)
+
+        if wicimg is None:
+            return (p, None)
 
         if not native_sysroot:
             native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
@@ -1279,6 +1285,45 @@ run_wic_cmd() {
             size = int(size[:-3])
             self.assertGreaterEqual(size, 204800)
 
+    def test_extra_partition_space(self):
+        native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
+
+        with NamedTemporaryFile("w", suffix=".wks") as tempf:
+            tempf.write("bootloader --ptable gpt\n" \
+                        "part                 --ondisk hda --size 10M        --extra-partition-space 10M --fstype=ext4\n" \
+                        "part                 --ondisk hda --fixed-size 20M  --extra-partition-space 10M --fstype=ext4\n" \
+                        "part --source rootfs --ondisk hda                   --extra-partition-space 10M --fstype=ext4\n" \
+                        "part --source rootfs --ondisk hda --fixed-size 200M --extra-partition-space 10M --fstype=ext4\n")
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
     # TODO this test could also work on aarch64
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
     @OETestTag("runqemu")
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 2e3061f343..800c0abf0f 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -1020,6 +1020,14 @@ DESCRIPTION
                         By default, 10MB. This option cannot be used
                         with --fixed-size option.
 
+         --extra-partition-space: This option is specific to wic. It adds extra
+                                  empty space after the space filled by the
+                                  filesystem. With --fixed-size, the extra
+                                  partition space is removed from the filesystem
+                                  size. Otherwise (with or without --size flag),
+                                  the extra partition space is added to the final
+                                  paritition size. The default value is 0MB.
+
          --overhead-factor: This option is specific to wic. The
                             size of the partition is multiplied by
                             this factor. It has to be greater than or
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 7ef3dc83dd..e86e1069f5 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -154,6 +154,7 @@ class KickStart():
         part.add_argument('--include-path', nargs='+', action='append')
         part.add_argument('--change-directory')
         part.add_argument("--extra-space", type=sizetype("M"))
+        part.add_argument('--extra-partition-space', type=sizetype("M"))
         part.add_argument('--fsoptions', dest='fsopts')
         part.add_argument('--fspassno', dest='fspassno')
         part.add_argument('--fstype', default='vfat',
@@ -259,6 +260,8 @@ class KickStart():
                             err = "%s:%d: Must set the label with --label" \
                                   % (confpath, lineno)
                             raise KickStartError(err)
+                        if not parsed.extra_partition_space:
+                            parsed.extra_partition_space = 0
                         # using ArgumentParser one cannot easily tell if option
                         # was passed as argument, if said option has a default
                         # value; --overhead-factor/--extra-space cannot be used
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index b34691d313..d358aabbd6 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -29,6 +29,7 @@ class Partition():
         self.disk = args.disk
         self.device = None
         self.extra_space = args.extra_space
+        self.extra_partition_space = args.extra_partition_space
         self.exclude_path = args.exclude_path
         self.include_path = args.include_path
         self.change_directory = args.change_directory
@@ -91,13 +92,12 @@ class Partition():
     def get_rootfs_size(self, actual_rootfs_size=0):
         """
         Calculate the required size of rootfs taking into consideration
-        --size/--fixed-size flags as well as overhead and extra space, as
-        specified in kickstart file. Raises an error if the
-        `actual_rootfs_size` is larger than fixed-size rootfs.
-
+        --size/--fixed-size and --extra-partition-space flags as well as overhead
+        and extra space, as specified in kickstart file. Raises an error
+        if the `actual_rootfs_size` is larger than fixed-size rootfs.
         """
         if self.fixed_size:
-            rootfs_size = self.fixed_size
+            rootfs_size = self.fixed_size - self.extra_partition_space
             if actual_rootfs_size > rootfs_size:
                 raise WicError("Actual rootfs size (%d kB) is larger than "
                                "allowed size %d kB" %
@@ -119,10 +119,18 @@ class Partition():
     def disk_size(self):
         """
         Obtain on-disk size of partition taking into consideration
-        --size/--fixed-size options.
+        --size/--fixed-size and --extra-partition-space options.
+
+        """
+        return self.fixed_size if self.fixed_size else self.size + self.extra_partition_space
 
+    @property
+    def fs_size(self):
+        """
+        Obtain on-disk size of filesystem inside the partition taking into
+        consideration --size/--fixed-size and --extra-partition-space options.
         """
-        return self.fixed_size if self.fixed_size else self.size
+        return self.fixed_size - self.extra_partition_space if self.fixed_size else self.size
 
     def prepare(self, creator, cr_workdir, oe_builddir, rootfs_dir,
                 bootimg_dir, kernel_dir, native_sysroot, updated_fstab_path):
@@ -202,10 +210,10 @@ class Partition():
                            "This a bug in source plugin %s and needs to be fixed." %
                            (self.mountpoint, self.source))
 
-        if self.fixed_size and self.size > self.fixed_size:
+        if self.fixed_size and self.size + self.extra_partition_space > self.fixed_size:
             raise WicError("File system image of partition %s is "
-                           "larger (%d kB) than its allowed size %d kB" %
-                           (self.mountpoint, self.size, self.fixed_size))
+                           "larger (%d kB + %d kB extra part space) than its allowed size %d kB" %
+                           (self.mountpoint, self.size, self.extra_partition_space, self.fixed_size))
 
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


