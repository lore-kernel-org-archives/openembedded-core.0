Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36672C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 14:20:33 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.15215.1693405228712641977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 07:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FZPV+vyV;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6bd0a0a6766so4079670a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 07:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693405227; x=1694010027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n+lE2W960zw5Z3tLCdxJ802qJ16QpI5Igs/5e6dc2/E=;
        b=FZPV+vyV7COT+vzWumAU1WLm9l69QBZNl4H9DjolUJuhMW5KBptA1BHi5f9k6xQ36I
         DDY0s3Ld2DzyjikqNAhPQXIx4dwdvAaM7zoOIbD7vj1me20ROu02tSRZUyHXbwvdsE52
         8IHt9HUlHlTsJgALps3i1awtAe81o64rjH2gtgAVMwhEdRtvkKPfDzrS8EMrEQ7zyD8L
         16xjUZRJVXCyQypCghO7wO0LUgjf4J7iQwwsVFtLzKn1XOphuMTohqMSq/n9+sKubV9b
         2SAhaW5Txa2+nh9ppoIsXUilgt/d6VmHQ4Km2oaH0ZT+lbkGsVe2rGjRlFDK+y6Zz6Gr
         KcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693405227; x=1694010027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+lE2W960zw5Z3tLCdxJ802qJ16QpI5Igs/5e6dc2/E=;
        b=T2smp+q2A5glDTHupuJSNYg7wsnUEe5Ak9yO8AFkuUoglM3BEtcDWKwQjcPQpfg/wi
         HWeuH8ZeEzXdfR5yow5Scdoea9LyHgcigldbq2792fwg+36TBy5TsSbtGER5/Ne6enJu
         Wjn0QbmkZvqH+vARfqpQvnr5yJ2mFM1YTIRRM5AodPHHPOHq37pbs9GCQ0St+38Afpy6
         wjfwfzf+MWlQ7RnYlI4RQFRg4RHBHLzsJgIGq9WyBI2X+KjAosuDiT5SXGWgDzN/A/Mi
         I/XhzRy106aTaNKpJUmR3SM8G8TVyfd73b/+5NA6EFcTbrnB7U/ssdGyksF6a9kIC38f
         D1xQ==
X-Gm-Message-State: AOJu0YwzXSn1nxO5kt5bas25/xNazZum07I3KA9WUzVvFCE5exlOKxgB
	2Xo/XHZOcHUzTv5t3NZcV8eHmeHnaqc=
X-Google-Smtp-Source: AGHT+IFsY+OAmm6hQs/f7F8PGiD4NVE+b8u3z1/HQ/A9x+rQcPhfdQUQ36/d/EFyL7ytgKtGiIr4dQ==
X-Received: by 2002:a05:6808:2a44:b0:3a7:9e15:fbfb with SMTP id fa4-20020a0568082a4400b003a79e15fbfbmr2196286oib.9.1693405226902;
        Wed, 30 Aug 2023 07:20:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::b66b])
        by smtp.gmail.com with ESMTPSA id x11-20020a056808144b00b003a1ec14d8c6sm5620493oiv.23.2023.08.30.07.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 07:20:26 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] wic: Add gpt-hybrid partition layout
Date: Wed, 30 Aug 2023 08:20:17 -0600
Message-Id: <20230830142017.702133-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 14:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186892

Add support for formatting a disk with a hybrid MBR & GPT partition
scheme. In this scheme, the primary partitioning method is GPT, but a
valid MBR header is also written than can point to a subset of the GPT
partitions on the disk (any partitions marked with the `--mbr` flag will
be included in this MBR). The primary purpose of this method is to allow
for SoCs that can only find a bootloader in an MBR partition to use GPT
once the bootloader is running. As an example, older versions of the
Raspberry Pi firmware can only parse MBR partitions to find a kernel (or
other bootloader like u-boot), but once those have booted GPT partitions
can be used.

In addition to the partitions annotated with the `--mbr`, a "protective"
GPT partition of type 0xEE is added, as the existence of such a
partition is the indication to tooling that this a hybrid MBR and that
the GPT partition table should be parsed instead.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/lib/wic/ksparser.py              |  3 +-
 scripts/lib/wic/partition.py             |  1 +
 scripts/lib/wic/plugins/imager/direct.py | 82 +++++++++++++++++++-----
 3 files changed, 69 insertions(+), 17 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 667b2ff9c33..7ef3dc83ddc 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -188,11 +188,12 @@ class KickStart():
         part.add_argument('--uuid')
         part.add_argument('--fsuuid')
         part.add_argument('--no-fstab-update', action='store_true')
+        part.add_argument('--mbr', action='store_true')
 
         bootloader = subparsers.add_parser('bootloader')
         bootloader.add_argument('--append')
         bootloader.add_argument('--configfile')
-        bootloader.add_argument('--ptable', choices=('msdos', 'gpt'),
+        bootloader.add_argument('--ptable', choices=('msdos', 'gpt', 'gpt-hybrid'),
                                 default='msdos')
         bootloader.add_argument('--timeout', type=int)
         bootloader.add_argument('--source')
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index f11c393df51..b1a2306dd12 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -60,6 +60,7 @@ class Partition():
         self.has_fstab = False
         self.update_fstab_in_rootfs = False
         self.hidden = args.hidden
+        self.mbr = args.mbr
 
         self.lineno = lineno
         self.source_file = ""
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 55347f5480a..9b619e41c11 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -342,7 +342,7 @@ class PartitionedImage():
         # generate parition and filesystem UUIDs
         for part in self.partitions:
             if not part.uuid and part.use_uuid:
-                if self.ptable_format == 'gpt':
+                if self.ptable_format in ('gpt', 'gpt-hybrid'):
                     part.uuid = str(uuid.uuid4())
                 else: # msdos partition table
                     part.uuid = '%08x-%02d' % (self.identifier, part.realnum)
@@ -398,6 +398,10 @@ class PartitionedImage():
                 raise WicError("setting custom partition type is not " \
                                "implemented for msdos partitions")
 
+            if part.mbr and self.ptable_format != 'gpt-hybrid':
+                raise WicError("Partition may only be included in MBR with " \
+                               "a gpt-hybrid partition table")
+
             # Get the disk where the partition is located
             self.numpart += 1
             if not part.no_table:
@@ -406,7 +410,7 @@ class PartitionedImage():
             if self.numpart == 1:
                 if self.ptable_format == "msdos":
                     overhead = MBR_OVERHEAD
-                elif self.ptable_format == "gpt":
+                elif self.ptable_format in ("gpt", "gpt-hybrid"):
                     overhead = GPT_OVERHEAD
 
                 # Skip one sector required for the partitioning scheme overhead
@@ -490,7 +494,7 @@ class PartitionedImage():
         # Once all the partitions have been layed out, we can calculate the
         # minumim disk size
         self.min_size = self.offset
-        if self.ptable_format == "gpt":
+        if self.ptable_format in ("gpt", "gpt-hybrid"):
             self.min_size += GPT_OVERHEAD
 
         self.min_size *= self.sector_size
@@ -511,22 +515,38 @@ class PartitionedImage():
 
         return exec_native_cmd(cmd, self.native_sysroot)
 
+    def _write_identifier(self, device, identifier):
+        logger.debug("Set disk identifier %x", identifier)
+        with open(device, 'r+b') as img:
+            img.seek(0x1B8)
+            img.write(identifier.to_bytes(4, 'little'))
+
+    def _make_disk(self, device, ptable_format, min_size):
+        logger.debug("Creating sparse file %s", device)
+        with open(device, 'w') as sparse:
+            os.ftruncate(sparse.fileno(), min_size)
+
+        logger.debug("Initializing partition table for %s", device)
+        exec_native_cmd("parted -s %s mklabel %s" % (device, ptable_format),
+                        self.native_sysroot)
+
+
     def create(self):
-        logger.debug("Creating sparse file %s", self.path)
-        with open(self.path, 'w') as sparse:
-            os.ftruncate(sparse.fileno(), self.min_size)
+        self._make_disk(self.path,
+                        "gpt" if self.ptable_format == "gpt-hybrid" else self.ptable_format,
+                        self.min_size)
 
-        logger.debug("Initializing partition table for %s", self.path)
-        exec_native_cmd("parted -s %s mklabel %s" %
-                        (self.path, self.ptable_format), self.native_sysroot)
+        self._write_identifier(self.path, self.identifier)
 
-        logger.debug("Set disk identifier %x", self.identifier)
-        with open(self.path, 'r+b') as img:
-            img.seek(0x1B8)
-            img.write(self.identifier.to_bytes(4, 'little'))
+        if self.ptable_format == "gpt-hybrid":
+            mbr_path = self.path + ".mbr"
+            self._make_disk(mbr_path, "msdos", self.min_size)
+            self._write_identifier(mbr_path, self.identifier)
 
         logger.debug("Creating partitions")
 
+        hybrid_mbr_part_num = 0
+
         for part in self.partitions:
             if part.num == 0:
                 continue
@@ -571,7 +591,14 @@ class PartitionedImage():
             self._create_partition(self.path, part.type,
                                    parted_fs_type, part.start, part.size_sec)
 
-            if self.ptable_format == "gpt" and (part.part_name or part.label):
+            if self.ptable_format == "gpt-hybrid" and part.mbr:
+                hybrid_mbr_part_num += 1
+                if hybrid_mbr_part_num > 4:
+                    raise WicError("Extended MBR partitions are not supported in hybrid MBR")
+                self._create_partition(mbr_path, "primary",
+                                       parted_fs_type, part.start, part.size_sec)
+
+            if self.ptable_format in ("gpt", "gpt-hybrid") and (part.part_name or part.label):
                 partition_label = part.part_name if part.part_name else part.label
                 logger.debug("partition %d: set name to %s",
                              part.num, partition_label)
@@ -586,7 +613,7 @@ class PartitionedImage():
                                          (part.num, part.part_type,
                                           self.path), self.native_sysroot)
 
-            if part.uuid and self.ptable_format == "gpt":
+            if part.uuid and self.ptable_format in ("gpt", "gpt-hybrid"):
                 logger.debug("partition %d: set UUID to %s",
                              part.num, part.uuid)
                 exec_native_cmd("sgdisk --partition-guid=%d:%s %s" % \
@@ -594,12 +621,16 @@ class PartitionedImage():
                                 self.native_sysroot)
 
             if part.active:
-                flag_name = "legacy_boot" if self.ptable_format == 'gpt' else "boot"
+                flag_name = "legacy_boot" if self.ptable_format in ('gpt', 'gpt-hybrid') else "boot"
                 logger.debug("Set '%s' flag for partition '%s' on disk '%s'",
                              flag_name, part.num, self.path)
                 exec_native_cmd("parted -s %s set %d %s on" % \
                                 (self.path, part.num, flag_name),
                                 self.native_sysroot)
+                if self.ptable_format == 'gpt-hybrid' and part.mbr:
+                    exec_native_cmd("parted -s %s set %d %s on" % \
+                                    (mbr_path, hybrid_mbr_part_num, "boot"),
+                                    self.native_sysroot)
             if part.system_id:
                 exec_native_cmd("sfdisk --part-type %s %s %s" % \
                                 (self.path, part.num, part.system_id),
@@ -612,6 +643,25 @@ class PartitionedImage():
                                 (self.path, part.num),
                                 self.native_sysroot)
 
+        if self.ptable_format == "gpt-hybrid":
+            # Write a protective GPT partition
+            hybrid_mbr_part_num += 1
+            if hybrid_mbr_part_num > 4:
+                raise WicError("Extended MBR partitions are not supported in hybrid MBR")
+
+            # parted cannot directly create a protective GPT partition, so
+            # create with an arbitrary type, then change it to the correct type
+            # with sfdisk
+            self._create_partition(mbr_path, "primary", "fat32", 1, GPT_OVERHEAD)
+            exec_native_cmd("sfdisk --part-type %s %d 0xee" % (mbr_path, hybrid_mbr_part_num),
+                            self.native_sysroot)
+
+            # Copy hybrid MBR
+            with open(mbr_path, "rb") as mbr_file:
+                with open(self.path, "r+b") as image_file:
+                    mbr = mbr_file.read(512)
+                    image_file.write(mbr)
+
     def cleanup(self):
         pass
 
-- 
2.34.1


