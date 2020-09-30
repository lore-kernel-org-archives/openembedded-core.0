Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.6603.1601504140078261956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:15:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hbL3ixRk;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 5so2126305pgf.5
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wpwJi4i94H7+LCN8Mk/Go9HU7PfGiFnxTTtmO5IxqRY=;
        b=hbL3ixRkj9GeGrXTPO9pCQcDxUAT7JOEV0M0cbuGF6hRNG3uAmZN4SLxMDiNMbvM4i
         cjJkgy2wvIJdJHxW/ilTzmEDdM0rhWzs9V9OK/8LO5HYenijWq5TpmvnuLIYrz5lRQ9D
         kQwLdFNWXIIDa+hcybMCtP86bwwfUQIOiOKuS3y0rIZLNxRgIMJioIrBOat3tK77Jw/z
         DsH6E7QiWbVGPgqpSR5CIgrjjLDd1H0/V2cyo7e8Kroemg2z1ahBUZorkpYcQgeKeEVg
         AaycTqikyIYj/vP8jdJ42SQqI0P2DyfX592YO58Ec4zi0/rjF+v+FQGe10LgiZ+mauSv
         IA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wpwJi4i94H7+LCN8Mk/Go9HU7PfGiFnxTTtmO5IxqRY=;
        b=fsl2jj1CQoAD61zeXhBPEFdt/2YXJTDWyHyIf2OgFRSM20zsYzQ2zzef/zW/BB8+2o
         QwZhidHWcLluTHgIsQShsAFVsrKiN8OwVY0YyAeYXYxwaOghTo3YaVlOIXdOnaVHBCnr
         njZjJ8dB6yBlqliF/H7g19ojN/Rfi7Fe5GAOq68ST47SmbD5D3sGB8FCWyNL45gb+gUM
         IcVkLhm9asR2h7IWXASFM3puheXKP/au5EkI1AdGVCAly75HNcvZKizWquEM5ffxUXxp
         z4qy/cZBwaE0UwJbn3hVNvB3TblaKUlsHj6Aee8DAaLarsLJN+C9EXoX9M5PioG27Lw/
         FJ5A==
X-Gm-Message-State: AOAM533s33cE4hUqZYJ1gmPcEWJFRau9g0Yxj5sGtqhi1GW0SxeME2BU
	QlC8aePEk/5izPVYsCO3amx7K9/fPg+nM4D2PWM=
X-Google-Smtp-Source: ABdhPJyJuN0Js+hQEsTHTvOZq6fShZ3g64iLXYPWmDiS6EBc1VlCQGc9fpo0qh3gHHo6Hdqg17iXsQ==
X-Received: by 2002:a17:902:6f08:b029:d2:ab80:4ac4 with SMTP id w8-20020a1709026f08b02900d2ab804ac4mr4135968plk.72.1601504139025;
        Wed, 30 Sep 2020 15:15:39 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.15.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:15:38 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 38/41] wic: Add --offset argument for partitions
Date: Wed, 30 Sep 2020 12:11:40 -1000
Message-Id: <897aaff8961f7fe83634a3b0b94e19b43aea5857.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

Add support for an --offset argument when defining a partition. Many
SoCs require that boot partitions be located at specific offsets. Prior
to this argument, most WKS files were using the --align attribute to
specify the location of these fixed partitions but this is not ideal
because in the event that the partition couldn't be placed in the
specified location, wic would move it to the next sector with that
alignment, often preventing the device from booting. Unlike the --align
argument, wic will fail if a partition cannot be placed at the exact
offset specified with --offset.

Changes in V2:
* Fixed a small typo that prevented test_fixed_size_error from passing

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 467f84e12b96bc977d57575023517dd6f8ef7f29)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/wic.py      | 118 ++++++++++++++++++-----
 scripts/lib/wic/ksparser.py              |  46 +++++----
 scripts/lib/wic/partition.py             |   1 +
 scripts/lib/wic/plugins/imager/direct.py |  15 +++
 4 files changed, 135 insertions(+), 45 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 626a217e69..6d4068a527 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -639,41 +639,50 @@ class Wic2(WicTestCase):
             tempf.write("part " \
                      "--source rootfs --ondisk hda --align 4 --fixed-size %d "
                      "--fstype=ext4\n" % size)
-        wksname = os.path.splitext(os.path.basename(wkspath))[0]
 
-        return wkspath, wksname
+        return wkspath
 
-    def test_fixed_size(self):
-        """
-        Test creation of a simple image with partition size controlled through
-        --fixed-size flag
-        """
-        wkspath, wksname = Wic2._make_fixed_size_wks(200)
+    def _get_wic_partitions(self, wkspath, native_sysroot=None, ignore_status=False):
+        p = runCmd("wic create %s -e core-image-minimal -o %s" % (wkspath, self.resultdir),
+                   ignore_status=ignore_status)
+
+        if p.status:
+            return (p, None)
+
+        wksname = os.path.splitext(os.path.basename(wkspath))[0]
 
-        runCmd("wic create %s -e core-image-minimal -o %s" \
-                                   % (wkspath, self.resultdir))
-        os.remove(wkspath)
         wicout = glob(self.resultdir + "%s-*direct" % wksname)
-        self.assertEqual(1, len(wicout))
+
+        if not wicout:
+            return (p, None)
 
         wicimg = wicout[0]
 
-        native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
+        if not native_sysroot:
+            native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
 
         # verify partition size with wic
-        res = runCmd("parted -m %s unit mib p 2>/dev/null" % wicimg,
+        res = runCmd("parted -m %s unit kib p 2>/dev/null" % wicimg,
                      native_sysroot=native_sysroot)
 
         # parse parted output which looks like this:
         # BYT;\n
         # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
         # 1:0.00MiB:200MiB:200MiB:ext4::;\n
-        partlns = res.output.splitlines()[2:]
+        return (p, res.output.splitlines()[2:])
 
-        self.assertEqual(1, len(partlns),
-                         msg="Partition list '%s'" % res.output)
-        self.assertEqual("1:0.00MiB:200MiB:200MiB:ext4::;", partlns[0],
-                         msg="Partition list '%s'" % res.output)
+    def test_fixed_size(self):
+        """
+        Test creation of a simple image with partition size controlled through
+        --fixed-size flag
+        """
+        wkspath = Wic2._make_fixed_size_wks(200)
+        _, partlns = self._get_wic_partitions(wkspath)
+        os.remove(wkspath)
+
+        self.assertEqual(partlns, [
+                        "1:4.00kiB:204804kiB:204800kiB:ext4::;",
+                        ])
 
     def test_fixed_size_error(self):
         """
@@ -681,13 +690,72 @@ class Wic2(WicTestCase):
         --fixed-size flag. The size of partition is intentionally set to 1MiB
         in order to trigger an error in wic.
         """
-        wkspath, wksname = Wic2._make_fixed_size_wks(1)
-
-        self.assertEqual(1, runCmd("wic create %s -e core-image-minimal -o %s" \
-                                   % (wkspath, self.resultdir), ignore_status=True).status)
+        wkspath = Wic2._make_fixed_size_wks(1)
+        p, _ = self._get_wic_partitions(wkspath, ignore_status=True)
         os.remove(wkspath)
-        wicout = glob(self.resultdir + "%s-*direct" % wksname)
-        self.assertEqual(0, len(wicout))
+
+        self.assertNotEqual(p.status, 0, "wic exited successfully when an error was expected:\n%s" % p.output)
+
+    def test_offset(self):
+        native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
+
+        with NamedTemporaryFile("w", suffix=".wks") as tempf:
+            # Test that partitions are placed at the correct offsets, default KB
+            tempf.write("bootloader --ptable gpt\n" \
+                        "part /    --source rootfs --ondisk hda --offset 32     --fixed-size 100M --fstype=ext4\n" \
+                        "part /bar                 --ondisk hda --offset 102432 --fixed-size 100M --fstype=ext4\n")
+            tempf.flush()
+
+            _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
+            self.assertEqual(partlns, [
+                "1:32.0kiB:102432kiB:102400kiB:ext4:primary:;",
+                "2:102432kiB:204832kiB:102400kiB:ext4:primary:;",
+                ])
+
+        with NamedTemporaryFile("w", suffix=".wks") as tempf:
+            # Test that partitions are placed at the correct offsets, same with explicit KB
+            tempf.write("bootloader --ptable gpt\n" \
+                        "part /    --source rootfs --ondisk hda --offset 32K     --fixed-size 100M --fstype=ext4\n" \
+                        "part /bar                 --ondisk hda --offset 102432K --fixed-size 100M --fstype=ext4\n")
+            tempf.flush()
+
+            _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
+            self.assertEqual(partlns, [
+                "1:32.0kiB:102432kiB:102400kiB:ext4:primary:;",
+                "2:102432kiB:204832kiB:102400kiB:ext4:primary:;",
+                ])
+
+        with NamedTemporaryFile("w", suffix=".wks") as tempf:
+            # Test that partitions are placed at the correct offsets using MB
+            tempf.write("bootloader --ptable gpt\n" \
+                        "part /    --source rootfs --ondisk hda --offset 32K  --fixed-size 100M --fstype=ext4\n" \
+                        "part /bar                 --ondisk hda --offset 101M --fixed-size 100M --fstype=ext4\n")
+            tempf.flush()
+
+            _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
+            self.assertEqual(partlns, [
+                "1:32.0kiB:102432kiB:102400kiB:ext4:primary:;",
+                "2:103424kiB:205824kiB:102400kiB:ext4:primary:;",
+                ])
+
+        with NamedTemporaryFile("w", suffix=".wks") as tempf:
+            # Test that image creation fails if the partitions would overlap
+            tempf.write("bootloader --ptable gpt\n" \
+                        "part /    --source rootfs --ondisk hda --offset 32     --fixed-size 100M --fstype=ext4\n" \
+                        "part /bar                 --ondisk hda --offset 102431 --fixed-size 100M --fstype=ext4\n")
+            tempf.flush()
+
+            p, _ = self._get_wic_partitions(tempf.name, ignore_status=True)
+            self.assertNotEqual(p.status, 0, "wic exited successfully when an error was expected:\n%s" % p.output)
+
+        with NamedTemporaryFile("w", suffix=".wks") as tempf:
+            # Test that partitions are not allowed to overlap with the booloader
+            tempf.write("bootloader --ptable gpt\n" \
+                        "part /    --source rootfs --ondisk hda --offset 8 --fixed-size 100M --fstype=ext4\n")
+            tempf.flush()
+
+            p, _ = self._get_wic_partitions(tempf.name, ignore_status=True)
+            self.assertNotEqual(p.status, 0, "wic exited successfully when an error was expected:\n%s" % p.output)
 
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_rawcopy_plugin_qemu(self):
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 650b976223..f32315c631 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -51,26 +51,31 @@ class KickStartParser(ArgumentParser):
     def error(self, message):
         raise ArgumentError(None, message)
 
-def sizetype(arg):
-    """
-    Custom type for ArgumentParser
-    Converts size string in <num>[K|k|M|G] format into the integer value
-    """
-    if arg.isdigit():
-        return int(arg) * 1024
+def sizetype(default):
+    def f(arg):
+        """
+        Custom type for ArgumentParser
+        Converts size string in <num>[K|k|M|G] format into the integer value
+        """
+        try:
+            suffix = default
+            size = int(arg)
+        except ValueError:
+            try:
+                suffix = arg[-1:]
+                size = int(arg[:-1])
+            except ValueError:
+                raise ArgumentTypeError("Invalid size: %r" % arg)
+
+        if suffix == "k" or suffix == "K":
+            return size
+        if suffix == "M":
+            return size * 1024
+        if suffix == "G":
+            return size * 1024 * 1024
 
-    if not arg[:-1].isdigit():
         raise ArgumentTypeError("Invalid size: %r" % arg)
-
-    size = int(arg[:-1])
-    if arg.endswith("k") or arg.endswith("K"):
-        return size
-    if arg.endswith("M"):
-        return size * 1024
-    if arg.endswith("G"):
-        return size * 1024 * 1024
-
-    raise ArgumentTypeError("Invalid size: %r" % arg)
+    return f
 
 def overheadtype(arg):
     """
@@ -136,6 +141,7 @@ class KickStart():
         part.add_argument('mountpoint', nargs='?')
         part.add_argument('--active', action='store_true')
         part.add_argument('--align', type=int)
+        part.add_argument('--offset', type=sizetype("K"))
         part.add_argument('--exclude-path', nargs='+')
         part.add_argument('--include-path', nargs='+')
         part.add_argument("--extra-space", type=sizetype)
@@ -160,8 +166,8 @@ class KickStart():
         # --error, but since nesting mutually exclusive groups does not work,
         # ----extra-space/--overhead-factor are handled later
         sizeexcl = part.add_mutually_exclusive_group()
-        sizeexcl.add_argument('--size', type=sizetype, default=0)
-        sizeexcl.add_argument('--fixed-size', type=sizetype, default=0)
+        sizeexcl.add_argument('--size', type=sizetype("M"), default=0)
+        sizeexcl.add_argument('--fixed-size', type=sizetype("M"), default=0)
 
         part.add_argument('--source')
         part.add_argument('--sourceparams')
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 2d95f78439..3490b4e75d 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -39,6 +39,7 @@ class Partition():
         self.mountpoint = args.mountpoint
         self.no_table = args.no_table
         self.num = None
+        self.offset = args.offset
         self.overhead_factor = args.overhead_factor
         self.part_name = args.part_name
         self.part_type = args.part_type
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 2d06c242b6..1f65a7afe5 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -428,6 +428,21 @@ class PartitionedImage():
                     # increase the offset so we actually start the partition on right alignment
                     self.offset += align_sectors
 
+            if part.offset is not None:
+                offset = (part.offset * 1024) // self.sector_size
+
+                if offset * self.sector_size != part.offset * 1024:
+                    raise WicError("Could not place %s%s at offset %dK with sector size %d" % (part.disk, self.numpart, part.offset, self.sector_size))
+
+                delta = offset - self.offset
+                if delta < 0:
+                    raise WicError("Could not place %s%s at offset %dK: next free sector is %d (delta: %d)" % (part.disk, self.numpart, part.offset, offset, delta))
+
+                logger.debug("Skipping %d sectors to place %s%s at offset %dK",
+                             delta, part.disk, self.numpart, part.offset)
+
+                self.offset = offset
+
             part.start = self.offset
             self.offset += part.size_sec
 
-- 
2.17.1

