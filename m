Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D69C87FDB
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 13:49:06 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.48153.1754920145939390308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 06:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eJx6OOAB;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b7825e2775so3910828f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 06:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1754920144; x=1755524944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8wPUeMQ/zFyoR4lBL5PyvIqs+VtykJLkqDq0usdvvjQ=;
        b=eJx6OOABlF5lfdQTkZoTEob/zZAYeR/6R2587FSjz6E8X47NLgCE6bte+z5Fem+bvC
         YW+b1tpmpZNgIBYlrvCEDZxlP0J6zCbloR4EM5qGc7kpdUg4GhD8CSG/CuyRjtqvxAeH
         8ao7Ary11+vCSAF7qN0kxY/mP7tSleIntx4bU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920144; x=1755524944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wPUeMQ/zFyoR4lBL5PyvIqs+VtykJLkqDq0usdvvjQ=;
        b=rBnxAsX946btKToSBreAC9c0lOhAOxLN3NqS32bYy8gUNVrTeChi5GJAp4T4KmTzm/
         JumrLO+vU8MZOOZM2yvkjzO4V3Caz8BH2NlZZL56blX/0Ppf/gq9fc2YTNiE8V3NVN1W
         lezoSSod7WmUPKVOgrfH/3Mg5umostWF0jKQwupsmCVsg+a9CedfQlkDTgeateboUqPo
         iSZdG1jQ3m/XyiU6daCHOujJ51Zu69D7/KBhgLYgSjhhG7G7Xyz+mlVju0rwaD2cHgei
         IxmiGFYR8i3lRypZlpFJAw3hV5TE3j3hTG2IdYMgvGOj+4AtsNgnaW+vOYqI6Ot+og4H
         Dc9A==
X-Gm-Message-State: AOJu0YytApvVFywcInbynbBORF0oRkCJ+mxCCtGr1j8AOCvDaT0C4Ubf
	pRxiJaYoNnzGQRG5QISe6bf2O9cbRTuaPjBxukn+WGkzhWC6MNeW51ClGYmu5BW/PKWvjzvEKoj
	/HUHPUUs=
X-Gm-Gg: ASbGncuUDy5aL/JllurDirXZY1pVzLDQq4/o43WR4qI2RAfWeb2fG1paXBkCAtrdbES
	P7svoIRAsj3kS0f9ZgwsWqKamnBoWs1MjRk0JOzKFeJvgBBMrX9ZgItsLoLjwHieQ0RopxLHvuw
	xQammLLq6acinejrkTjvsIwwhDECDenjPs1qBhWr44RDxTzUMs24QdLStHXq2YkjxSvYQhECQHX
	wwqiB/P6khNf1RTDNobzOdZ35Cz/TwPXAO8Ar8guupKXZNfunwoV+xrZWW3EF83Uwwd7Ni20E3W
	Xj6rEbrdq1qapQDF7L+qv6iPh1r8keD+SFb5SI49LULn7PbzTcH2NyiNGUrl01RXAGjjZKlK+EA
	dxJDIibd0046JukQxRRHnPtbKvSGPUMDLCzcimaI9PjU=
X-Google-Smtp-Source: AGHT+IGjCkJOAfZGDaRhZDQLKMqncFkngQrPippu0i335jzSfOT11NgtwM2JLVEeafsIcUkmhH09/A==
X-Received: by 2002:a5d:5846:0:b0:3b4:9dbd:eee9 with SMTP id ffacd0b85a97d-3b900b72cfdmr9339577f8f.36.1754920144223;
        Mon, 11 Aug 2025 06:49:04 -0700 (PDT)
Received: from localhost.localdomain ([195.68.54.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0b2d2fasm30163276f8f.50.2025.08.11.06.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:49:03 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v3 1/2] wic: add --extra-partition-space option to set unused space
Date: Mon, 11 Aug 2025 15:48:03 +0200
Message-Id: <20250811134804.841937-1-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 13:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221740

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
---
 meta/lib/oeqa/selftest/cases/wic.py | 58 ++++++++++++++++++++++++++++-
 scripts/lib/wic/help.py             |  8 ++++
 scripts/lib/wic/ksparser.py         |  3 ++
 scripts/lib/wic/partition.py        | 38 +++++++++++--------
 4 files changed, 90 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 680f99d381..09257f2624 100644
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
@@ -1279,6 +1285,54 @@ run_wic_cmd() {
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
+        with NamedTemporaryFile("w", suffix=".wks") as tempf:
+            # Test that image creation fails if space left is too small for the rootfs
+            tempf.write("bootloader --ptable gpt\n" \
+                        "part --source rootfs --ondisk hda --fixed-size 200M --extra-partition-space 150M --fstype=ext4\n")
+            tempf.flush()
+
+            p, _ = self._get_wic(tempf.name, ignore_status=True)
+            self.assertNotEqual(p.status, 0, "wic exited successfully when an error was expected:\n%s" % p.output)
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
index b34691d313..e71052fd15 100644
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
@@ -91,17 +92,16 @@ class Partition():
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
-                               "allowed size %d kB" %
-                               (actual_rootfs_size, rootfs_size))
+                               "allowed size %d kB (including %d kB extra part space)" %
+                               (actual_rootfs_size, rootfs_size, self.extra_partition_space))
         else:
             extra_blocks = self.get_extra_block_count(actual_rootfs_size)
             if extra_blocks < self.extra_space:
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


