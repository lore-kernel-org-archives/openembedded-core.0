Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.10946.1591105339835486121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 06:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BdySU3pl;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id d6so1464280pjs.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 06:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I7K0Do1semFam0eCkS030tRYoBosGgMpActlL8m0XCE=;
        b=BdySU3plLZQ+EuIqi8tiyUyJGpNH4fMxbbIvdXzFXU32uXDyk4FjS/su91gPMfnkIh
         Dzex1BDkg0EjqKUkcz7ksOGINEJGBEJ+um7pegmUhEg5gTHjDGTvWdFv61oNiJLbTLhv
         Tlrv2AuaFNyObbToQ74+LEnCCHVCZHsyGIlWKlCAxc7CucOneQCecxelpnfaPwXPmr4F
         5Q8vGXBagQ4XqB60RG8d+i+Awi85RetHP+qm2v3wK/1cRceEqDvRFM9a6dX+Naz5h6gQ
         7qkKLIkMAie+sAx9ZWcs8NiGtIjgAUqMt9AJdSRX6Rhhome/IdkBRdDFHDuP0X+xXI0U
         gy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I7K0Do1semFam0eCkS030tRYoBosGgMpActlL8m0XCE=;
        b=Y0oy8CvpqKeKAT+4zqaUKLvkV/9QKs1vACpfuQhgaN2TrftXoiA13pmYPAoOoLMP49
         pwTgxPcwgnqWjXjHdPhZQ1cQpd5z9UAmGGCTgxt+HGw7S9toBBlWIywYslAPFSxMc6Sr
         SQ7lxV2JHMCT2g5siWjLUUCCy/2dsZyuLrFm+y5Eh2524UTTUOR54WHIhXILp1xptBsJ
         4OwWDKBkHDmZQeHt90UWupPTlfd+/ovwwauCOEWglTTSCv8yt7hf61zjAkqZCIiRfAQR
         VvVmHm3mIjJTL1KiQGYQtyLWYIWNME8qlSgqyJpOy7AGE5kMG+3qdw4ca53t44OhGYmn
         SU2w==
X-Gm-Message-State: AOAM532zKgrGlrl6dPeBrCpquCZb0C945DgbbchZPxVD1rN1JM91IoQT
	vqKJuwQAqaL2ZH4wztXcMR2Yk+I9p58=
X-Google-Smtp-Source: ABdhPJxl4lxLDnM5IkY51LWjR8uYbahkmvOYg+rRUTDy6YLIZdV9m62HbUf5auu4oMJUoUSOqTRKKw==
X-Received: by 2002:a17:90a:474c:: with SMTP id y12mr5512741pjg.111.1591105338845;
        Tue, 02 Jun 2020 06:42:18 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:b01b:daad:c850:7bb9])
        by smtp.gmail.com with ESMTPSA id w65sm2498525pfb.160.2020.06.02.06.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 06:42:18 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3] wic: Add --offset argument for partitions
Date: Tue,  2 Jun 2020 08:42:05 -0500
Message-Id: <20200602134205.17838-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511194835.20890-1-JPEWhacker@gmail.com>
References: <20200511194835.20890-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 meta/lib/oeqa/selftest/cases/wic.py      | 118 ++++++++++++++++++-----
 scripts/lib/wic/ksparser.py              |  46 +++++----
 scripts/lib/wic/partition.py             |   1 +
 scripts/lib/wic/plugins/imager/direct.py |  15 +++
 4 files changed, 135 insertions(+), 45 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index c8765e5330..9e7be6168e 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -790,41 +790,50 @@ class Wic2(WicTestCase):
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
@@ -832,13 +841,72 @@ class Wic2(WicTestCase):
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
index b8befe78e3..05ae292ef5 100644
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
         part.add_argument('--include-path', nargs='+', action='append')
         part.add_argument('--change-directory')
@@ -161,8 +167,8 @@ class KickStart():
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
index 7d9dd616a6..85eb15c8b8 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -40,6 +40,7 @@ class Partition():
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
2.26.2

