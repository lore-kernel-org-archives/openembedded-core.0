Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web11.211.1589226521310186899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 12:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xv4HHMuL;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id f3so11208572ioj.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PQ/e9yx1i47Z9VdycwRTsdIesTUGRyDlVeiElFrwTGs=;
        b=Xv4HHMuL66urx85/6CzVdsKXydEC+x1wy6vgE6pDiK54XAMo+ocT915EMp51YPdRCU
         VH4X2/j3Eeetdb8I50hDyCnb6gEXds5EOXCNZrjjzu426nx2yFXBZRqhE4QTYce6hANS
         kf00d7Vip2TFItJrdave2ySP3wApLsGKd4NL7iOGU56zHg0TxbaEC0PeqjYAf4d8wtx7
         7VdVDbZIu3AvpTaPrjGStHOyhmKirTL3/J5cnr0F+3IKdZqA43HsURWWgsMgLt1Zt5dO
         kft8mltYDVic78WwAqpD8+t1wVHqHuNrsoClfQlMh4BN6sde1HK9otlxYLnPpa4O5xKR
         dUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PQ/e9yx1i47Z9VdycwRTsdIesTUGRyDlVeiElFrwTGs=;
        b=FlCl84093SFfejxS8n1ENGvzWdjzmHJAwUjWtaVZGj5DsrdAwUj+9G5dVFzQSfgPR2
         m+BI4EG/RYwhHYomiCe7z8WCh/5XmSY8WjnMU1OF5SyoxI26w24KFsx3O4ZaWe6zowrE
         AQGyWpb2gfp0p1it5ao6gt2yw0mU8puItz0IZd3Q19p7ijH2fMYwJYXzQwv7SuVfIwT+
         ofYQUxXQ6vA/X624uqCtSkvTJOvwiES6cnhAGRvoJDZJJLyeMq0D+qrc42IsODV050RT
         WORtIQirXDjOFPuPFqxz7pktVD5k/NidEFgTSbh+XCQVRKqfiJCwy8JJKf9vG8op+8wi
         +T9w==
X-Gm-Message-State: AGi0PubftdBjHnPCzdoJ3cixb1GsdVyMgQp0+JRSc7SiupFeUybc2jfr
	qqBEo807lLY1WzUd2VgcTvfN1QrhsUE=
X-Google-Smtp-Source: APiQypITVjBd8D6VryoyOm7MBam/7D8LEJ7P+3qEKiUtkQ8nF3oOY79YMfghc8OSLvAyByi+v2EPGQ==
X-Received: by 2002:a02:c615:: with SMTP id i21mr7039422jan.30.1589226519798;
        Mon, 11 May 2020 12:48:39 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:ac13:ea07:8c16:df2d])
        by smtp.gmail.com with ESMTPSA id e11sm4957251ios.55.2020.05.11.12.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 12:48:39 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2] wic: Add --offset argument for partitions
Date: Mon, 11 May 2020 14:48:35 -0500
Message-Id: <20200511194835.20890-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511192646.16901-1-JPEWhacker@gmail.com>
References: <20200511192646.16901-1-JPEWhacker@gmail.com>

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
 meta/lib/oeqa/selftest/cases/wic.py      | 92 +++++++++++++++++-------
 scripts/lib/wic/ksparser.py              |  1 +
 scripts/lib/wic/partition.py             |  1 +
 scripts/lib/wic/plugins/imager/direct.py | 15 ++++
 4 files changed, 84 insertions(+), 25 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index c8765e5330..41b4f49a42 100644
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
@@ -832,13 +841,46 @@ class Wic2(WicTestCase):
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
+            # Test that partitions are placed at the correct offsets
+            tempf.write("bootloader --ptable gpt\n" \
+                        "part /    --source rootfs --ondisk hda --offset 32     --fixed-size 100M --fstype=ext4\n" \
+                        "part /bar                 --ondisk hda --offset 102432 --fixed-size 100M --fstype=ext4\n")
+            tempf.flush()
+
+            _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
+            self.assertEqual(partlns, [
+                "1:32.0kiB:102432kiB:102400kiB:ext4::;",
+                "2:102432kiB:204832kiB:102400kiB:ext4::;",
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
index b8befe78e3..1eaa447460 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -136,6 +136,7 @@ class KickStart():
         part.add_argument('mountpoint', nargs='?')
         part.add_argument('--active', action='store_true')
         part.add_argument('--align', type=int)
+        part.add_argument('--offset', type=int)
         part.add_argument('--exclude-path', nargs='+')
         part.add_argument('--include-path', nargs='+', action='append')
         part.add_argument('--change-directory')
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
2.17.1

