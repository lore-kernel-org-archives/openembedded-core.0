Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id BC7216025E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 13:06:34 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id l131so242101444lfl.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 06:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=bnlm+UroJJouJK/GIdoT4td80xMzm5Qf+ERxCJ5fskg=;
	b=Cn7u4Fq4E8n+OuQXN/CmcBxdxKW3rXeWuQaWytt2QNSBFVUGUTZ/EAI6WcnQcV5ebs
	2c2NJXc8Txc4AlW+6cR0x4SNoy4cBo0Rdo1uWvOA3kplcMF2QhOjwKCsO63BF/Pjl5Dg
	yXO8l91eMSMKY+CnCq+4lpojVebGIzHX9UVA6LMlPpE/5MjecbTyvdf/y1KVrXSHdb0D
	jce6bLT33TvqXeUPULlKqZh7H5RkJ3ceHl4ZjGsl4p9q8LKnhQq2BqfmuPnujNa7Mo+1
	104mAX8ig3kHaKlgLW00MiYeBMJqkBUn1+w0HDjcp7ShcbmPlFOZpy33pbc6d9M9hDYf
	q/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bnlm+UroJJouJK/GIdoT4td80xMzm5Qf+ERxCJ5fskg=;
	b=lsLsjfRxlit6BB89eWUXVy+npj0enUbLyflZZIg2gUcWrMg9C6oSmIyy6sZUanXqaG
	dS2UIIks260M7RtnCEGXaIBAZVsRgL9A3E0yFqKjnfdm2ktQ1Euh7NEBQ2jrjIGLAp4+
	McAWy2kSvMnX/yLIPzcK1lYxqyCKxvejBGkUv4A73Yq0MFIE2W5AOz6UHC7hlyvE8sWP
	QqabFaB7VP0o8v7PFYcqhYbukJOj1sXO+Md5ulAWLYuFRmee1iySK/o2LbBaN1LKAnTD
	48/OCXHXOVozsh2gK7V7eS2b0QqEM9U7N6R0a7DKvC1gNofVbRqFa8VsQGq9t1kzmoRw
	C9Vw==
X-Gm-Message-State: AA6/9RlVsaPdG1foPPIP4pqZrCgAsoen6pu6xGgrANnjrgB9+WoNWaCOKVSFxfJt0RxYYQ==
X-Received: by 10.25.167.209 with SMTP id q200mr15318226lfe.168.1476709592639; 
	Mon, 17 Oct 2016 06:06:32 -0700 (PDT)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	r16sm7777156lfe.38.2016.10.17.06.06.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Oct 2016 06:06:31 -0700 (PDT)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2016 15:06:18 +0200
Message-Id: <30a5ef699fb1b575baf95b986a755f509e9e747e.1476706733.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH] wic: add --reserved-size wks option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Oct 2016 13:06:36 -0000

Added new option --reserved-size to wks. The option can be used to
indicate how much space should be reserved for a partition. This is
useful if the disk will be a subject to full filesystem image updates
and puts an upper limit of the size of filesystem images.

The actual filesystem image may be smaller than the reserved space, thus
leaving some room for growth. If it is larger, an error will be raised.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 scripts/lib/wic/help.py                | 11 ++++++++++
 scripts/lib/wic/imager/direct.py       |  3 ++-
 scripts/lib/wic/ksparser.py            |  1 +
 scripts/lib/wic/partition.py           |  1 +
 scripts/lib/wic/utils/partitionedfs.py | 37 +++++++++++++++++++++++++---------
 5 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index e5347ec4b7c900c68fc64351a5293e75de0672b3..1a5c7020ba0cdc5ef2e477a2b14360e09098a896 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -646,6 +646,17 @@ DESCRIPTION
                  not specified, the size is in MB.
                  You do not need this option if you use --source.
 
+         --reserved-size: This option specifies that there should be
+                          at least that many bytes reserved for
+                          the partition during layout. This is useful
+                          when the target disk will be a subject
+                          to full system image updates in the future.
+                          Specifying --reserved-size ensures that
+                          there is extra space in the partition allowing
+                          for future growth of the file system stored
+                          inside. Value format is the same as for
+                          --size option.
+
          --source: This option is a wic-specific option that names the
                    source of the data that will populate the
                    partition.  The most common value for this option
diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index edf5e5d2214f8e78b6c2a98d7f6cd45fcc0065c4..02e293b9d744b760fcdf17610505dafef3e164ad 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -301,7 +301,8 @@ class DirectImageCreator(BaseImageCreator):
                                        no_table=part.no_table,
                                        part_type=part.part_type,
                                        uuid=part.uuid,
-                                       system_id=part.system_id)
+                                       system_id=part.system_id,
+                                       reserved_size=part.reserved_size)
 
         if fstab_path:
             shutil.move(fstab_path + ".orig", fstab_path)
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 0894e2b199a299fbbed272f2e1c95e9d692e3ab1..4118bffdf4337f2d2d393d7e096632cd7aa37402 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -137,6 +137,7 @@ class KickStart():
         part.add_argument('--part-type')
         part.add_argument('--rootfs-dir')
         part.add_argument('--size', type=sizetype, default=0)
+        part.add_argument('--reserved-size', type=sizetype, default=0)
         part.add_argument('--source')
         part.add_argument('--sourceparams')
         part.add_argument('--system-id', type=systemidtype)
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 90f65a1e3976a5460cd1b265b238168cce22781f..162a3a289de891ccf81437876c1f7a6f3c797b3b 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -54,6 +54,7 @@ class Partition():
         self.part_type = args.part_type
         self.rootfs_dir = args.rootfs_dir
         self.size = args.size
+        self.reserved_size = args.reserved_size
         self.source = args.source
         self.sourceparams = args.sourceparams
         self.system_id = args.system_id
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index cb03009fc7e3c97305079629ded7d2ff01eba4c4..5d3b1588231459dedf0142f807114736f0bb28ea 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -91,7 +91,7 @@ class Image():
 
     def add_partition(self, size, disk_name, mountpoint, source_file=None, fstype=None,
                       label=None, fsopts=None, boot=False, align=None, no_table=False,
-                      part_type=None, uuid=None, system_id=None):
+                      part_type=None, uuid=None, system_id=None, reserved_size=0):
         """ Add the next partition. Prtitions have to be added in the
         first-to-last order. """
 
@@ -99,9 +99,11 @@ class Image():
 
         # Converting kB to sectors for parted
         size = size * 1024 // self.sector_size
+        reserved_size = reserved_size * 1024 // self.sector_size
 
         part = {'ks_pnum': ks_pnum, # Partition number in the KS file
                 'size': size, # In sectors
+                'reserved_size': reserved_size, # space on disk reserved for partition
                 'mountpoint': mountpoint, # Mount relative to chroot
                 'source_file': source_file, # partition contents
                 'fstype': fstype, # Filesystem type
@@ -192,7 +194,19 @@ class Image():
                     disk['offset'] += align_sectors
 
             part['start'] = disk['offset']
-            disk['offset'] += part['size']
+
+            if part['reserved_size']:
+                if part['size'] > part['reserved_size']:
+                    msger.error("Partition %d on disk %s is larger (%s bytes) than its"
+                                " reserved space %s bytes" %
+                                (disk['numpart'], part['disk_name'],
+                                 part['size'] * self.sector_size,
+                                 part['reserved_size'] * self.sector_size))
+                # next partition starts after the space reserved for the
+                # current one
+                disk['offset'] += part['reserved_size']
+            else:
+                disk['offset'] += part['size']
 
             part['type'] = 'primary'
             if not part['no_table']:
@@ -207,10 +221,11 @@ class Image():
 
             disk['partitions'].append(num)
             msger.debug("Assigned %s to %s%d, sectors range %d-%d size %d "
-                        "sectors (%d bytes)." \
+                        "sectors (%d bytes), reserved %d bytes." \
                             % (part['mountpoint'], part['disk_name'], part['num'],
-                               part['start'], part['start'] + part['size'] - 1,
-                               part['size'], part['size'] * self.sector_size))
+                               part['start'], disk['offset'] - 1,
+                               part['size'], part['size'] * self.sector_size,
+                               part['reserved_size'] * self.sector_size))
 
         # Once all the partitions have been layed out, we can calculate the
         # minumim disk sizes.
@@ -288,17 +303,21 @@ class Image():
                 # Type for ext2/ext3/ext4/btrfs
                 parted_fs_type = "ext2"
 
+            psize = part['size']
+            if part['reserved_size']:
+                psize = part['reserved_size']
+
             # Boot ROM of OMAP boards require vfat boot partition to have an
             # even number of sectors.
             if part['mountpoint'] == "/boot" and part['fstype'] in ["vfat", "msdos"] \
-               and part['size'] % 2:
-                msger.debug("Substracting one sector from '%s' partition to " \
+               and psize % 2:
+                msger.debug("Subtracting one sector from '%s' partition to " \
                             "get even number of sectors for the partition" % \
                             part['mountpoint'])
-                part['size'] -= 1
+                psize -= 1
 
             self.__create_partition(disk['disk'].device, part['type'],
-                                    parted_fs_type, part['start'], part['size'])
+                                    parted_fs_type, part['start'], psize)
 
             if part['part_type']:
                 msger.debug("partition %d: set type UID to %s" % \
-- 
2.5.0


