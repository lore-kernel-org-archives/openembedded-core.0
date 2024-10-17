Return-Path: <vince_chang@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A53D21249
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:40:13 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web11.44552.1729154403810974911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 01:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: vince_chang@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 17 Oct
 2024 16:40:02 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 17 Oct 2024 16:40:02 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 1/2] wic: add WIC_SECTOR_SIZE variable
Date: Thu, 17 Oct 2024 16:40:01 +0800
Message-ID: <20241017084002.4093919-2-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241017084002.4093919-1-vince_chang@aspeedtech.com>
References: <20241017084002.4093919-1-vince_chang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205992

Currently WIC is unable to generate images that requires a sector
size different of 512. Add WIC_SECTOR_SIZE variable to handle
the sector size of 4096 for UFS.

Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 56 ++++++++++++++----------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plu=
gins/imager/direct.py
index a1d152659b..0901105a4f 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -321,7 +321,15 @@ class PartitionedImage():
         self.partitions =3D partitions
         self.partimages =3D []
         # Size of a sector used in calculations
-        self.sector_size =3D SECTOR_SIZE
+        sector_size_str =3D get_bitbake_var('WIC_SECTOR_SIZE')
+        if sector_size_str is not None:
+            try:
+                self.sector_size =3D int(sector_size_str)
+            except ValueError:
+                self.sector_size =3D SECTOR_SIZE
+        else:
+            self.sector_size =3D SECTOR_SIZE
+
         self.native_sysroot =3D native_sysroot
         num_real_partitions =3D len([p for p in self.partitions if not p.n=
o_table])
         self.extra_space =3D extra_space
@@ -508,7 +516,8 @@ class PartitionedImage():
         logger.debug("Added '%s' partition, sectors %d-%d, size %d sectors=
",
                      parttype, start, end, size)
=20
-        cmd =3D "parted -s %s unit s mkpart %s" % (device, parttype)
+        cmd =3D "export PARTED_SECTOR_SIZE=3D%d; parted -s %s unit s mkpar=
t %s" % \
+            (self.sector_size, device, parttype)
         if fstype:
             cmd +=3D " %s" % fstype
         cmd +=3D " %d %d" % (start, end)
@@ -527,8 +536,8 @@ class PartitionedImage():
             os.ftruncate(sparse.fileno(), min_size)
=20
         logger.debug("Initializing partition table for %s", device)
-        exec_native_cmd("parted -s %s mklabel %s" % (device, ptable_format=
),
-                        self.native_sysroot)
+        exec_native_cmd("export PARTED_SECTOR_SIZE=3D%d; parted -s %s mkla=
bel %s" %
+                        (self.sector_size, device, ptable_format), self.na=
tive_sysroot)
=20
     def _write_disk_guid(self):
         if self.ptable_format in ('gpt', 'gpt-hybrid'):
@@ -538,7 +547,8 @@ class PartitionedImage():
                 self.disk_guid =3D uuid.uuid4()
=20
             logger.debug("Set disk guid %s", self.disk_guid)
-            sfdisk_cmd =3D "sfdisk --disk-id %s %s" % (self.path, self.dis=
k_guid)
+            sfdisk_cmd =3D "sfdisk --sector-size %s --disk-id %s %s" % \
+                        (self.sector_size, self.path, self.disk_guid)
             exec_native_cmd(sfdisk_cmd, self.native_sysroot)
=20
     def create(self):
@@ -613,45 +623,44 @@ class PartitionedImage():
                 partition_label =3D part.part_name if part.part_name else =
part.label
                 logger.debug("partition %d: set name to %s",
                              part.num, partition_label)
-                exec_native_cmd("sgdisk --change-name=3D%d:%s %s" % \
-                                         (part.num, partition_label,
-                                          self.path), self.native_sysroot)
-
+                exec_native_cmd("sfdisk --sector-size %s --part-label %s %=
d %s" % \
+                                         (self.sector_size, self.path, par=
t.num,
+                                          partition_label), self.native_sy=
sroot)
             if part.part_type:
                 logger.debug("partition %d: set type UID to %s",
                              part.num, part.part_type)
-                exec_native_cmd("sgdisk --typecode=3D%d:%s %s" % \
-                                         (part.num, part.part_type,
-                                          self.path), self.native_sysroot)
+                exec_native_cmd("sfdisk --sector-size %s --part-type %s %d=
 %s" % \
+                                         (self.sector_size, self.path, par=
t.num,
+                                          part.part_type), self.native_sys=
root)
=20
             if part.uuid and self.ptable_format in ("gpt", "gpt-hybrid"):
                 logger.debug("partition %d: set UUID to %s",
                              part.num, part.uuid)
-                exec_native_cmd("sgdisk --partition-guid=3D%d:%s %s" % \
-                                (part.num, part.uuid, self.path),
+                exec_native_cmd("sfdisk --sector-size %s --part-uuid %s %d=
 %s" % \
+                                (self.sector_size, self.path, part.num, pa=
rt.uuid),
                                 self.native_sysroot)
=20
             if part.active:
                 flag_name =3D "legacy_boot" if self.ptable_format in ('gpt=
', 'gpt-hybrid') else "boot"
                 logger.debug("Set '%s' flag for partition '%s' on disk '%s=
'",
                              flag_name, part.num, self.path)
-                exec_native_cmd("parted -s %s set %d %s on" % \
-                                (self.path, part.num, flag_name),
+                exec_native_cmd("export PARTED_SECTOR_SIZE=3D%d; parted -s=
 %s set %d %s on" % \
+                                (self.sector_size, self.path, part.num, fl=
ag_name),
                                 self.native_sysroot)
                 if self.ptable_format =3D=3D 'gpt-hybrid' and part.mbr:
-                    exec_native_cmd("parted -s %s set %d %s on" % \
-                                    (mbr_path, hybrid_mbr_part_num, "boot"=
),
+                    exec_native_cmd("export PARTED_SECTOR_SIZE=3D%d; parte=
d -s %s set %d %s on" % \
+                                    (self.sector_size, mbr_path, hybrid_mb=
r_part_num, "boot"),
                                     self.native_sysroot)
             if part.system_id:
-                exec_native_cmd("sfdisk --part-type %s %s %s" % \
-                                (self.path, part.num, part.system_id),
+                exec_native_cmd("sfdisk --sector-size %s --part-type %s %s=
 %s" % \
+                                (self.sector_size, self.path, part.num, pa=
rt.system_id),
                                 self.native_sysroot)
=20
             if part.hidden and self.ptable_format =3D=3D "gpt":
                 logger.debug("Set hidden attribute for partition '%s' on d=
isk '%s'",
                              part.num, self.path)
-                exec_native_cmd("sfdisk --part-attrs %s %s RequiredPartiti=
on" % \
-                                (self.path, part.num),
+                exec_native_cmd("sfdisk --sector-size %s --part-attrs %s %=
s RequiredPartition" % \
+                                (self.sector_size, self.path, part.num),
                                 self.native_sysroot)
=20
         if self.ptable_format =3D=3D "gpt-hybrid":
@@ -664,7 +673,8 @@ class PartitionedImage():
             # create with an arbitrary type, then change it to the correct=
 type
             # with sfdisk
             self._create_partition(mbr_path, "primary", "fat32", 1, GPT_OV=
ERHEAD)
-            exec_native_cmd("sfdisk --part-type %s %d 0xee" % (mbr_path, h=
ybrid_mbr_part_num),
+            exec_native_cmd("sfdisk --sector-size %s --part-type %s %d 0xe=
e" % \
+                            (self.sector_size, mbr_path, hybrid_mbr_part_n=
um),
                             self.native_sysroot)
=20
             # Copy hybrid MBR
--=20
2.25.1


