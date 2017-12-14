Return-Path: <tom.rini@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id DF8CA78880
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 03:20:34 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id r39so6339704qtr.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 19:20:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KfdVNI3ql/fT6LZPi233rAvjolnTx2magig+faW0Zg0=;
	b=uQnbeyAIbgdAU3IufHTPR2rJaaEuIc6GiURgs4TtqhwS8c6yzn1ki/NGIZkeCw0eY3
	nyNKeA7dRpRfQ/1yiPva2lR4mKkGzDRE2xxonFVvH5TztQ1zisgAx9TA4rifOQ/myd4s
	2TqrCzc5petsAMMwO+EuzQWisELDG9krkHLUCc74UufnA33LOUgclDosrJpAGMpCFot3
	jav9dIRg0KtCsjrIflRVUVOG371gzJLVDqKwUNew9BjyY8lyV3Xi6FimuvnNTZvQFYiz
	znjDbXV8xlZcz7ERDI6/bOdk8qUcIkmV2rnFLgftTpBghRL1LYIAYHAXYpOPR+bwgDu7
	VzLg==
X-Gm-Message-State: AKGB3mLDlR7JJ1skasTm2DPPh9krvSPQQcbnolKUUMhWlURCg+hEepM2
	j295hylLKvS9UXkXwdafkIyX
X-Google-Smtp-Source: ACJfBot1hZud3qFESz/iHymf9PwYrwOXNlRvnjr6yKCou2MdsPzSiGrZ5QDpvVx/Zh9zCzFXQRTF9g==
X-Received: by 10.200.40.189 with SMTP id i58mr14780796qti.128.1513221635373; 
	Wed, 13 Dec 2017 19:20:35 -0800 (PST)
Received: from localhost.localdomain (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	s43sm2001533qta.49.2017.12.13.19.20.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Dec 2017 19:20:34 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2017 22:20:25 -0500
Message-Id: <1513221626-18805-4-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513221626-18805-1-git-send-email-trini@konsulko.com>
References: <1513221626-18805-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv4 3/4] wic: Introduce --fsuuid and have --use-uuid make use of UUID too
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
X-List-Received-Date: Thu, 14 Dec 2017 03:20:35 -0000

First, allow for wic to be given a filesystem UUID to be used when
creating a filesystem.  When not provided, wic will generate the UUID to
be used.  Next, when --use-uuid is passed, we update the fstab to mount
things via UUID (and if not found, then use PARTUUID) as UUID is more
portable.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 scripts/lib/wic/help.py                          | 10 +++++++-
 scripts/lib/wic/ksparser.py                      |  1 +
 scripts/lib/wic/partition.py                     | 32 +++++++++++++-----------
 scripts/lib/wic/plugins/imager/direct.py         | 17 +++++++++++--
 scripts/lib/wic/plugins/source/bootimg-efi.py    |  3 ++-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py |  3 ++-
 6 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 2ac45e052ebe..bf658b94e34f 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -863,7 +863,10 @@ DESCRIPTION
        This is achieved by wic adding entries to the fstab during image
        generation. In order for a valid fstab to be generated one of the
        --ondrive, --ondisk or --use-uuid partition options must be used for
-       each partition that specifies a mountpoint.
+       each partition that specifies a mountpoint.  Note that with --use-uuid
+       and non-root <mountpoint>, including swap, the mount program must
+       understand the PARTUUID syntax.  This currently excludes the busybox
+       versions of these applications.
 
 
        The following are supported 'part' options:
@@ -986,6 +989,11 @@ DESCRIPTION
                  in bootloader configuration before running wic. In this case .wks file can
                  be generated or modified to set preconfigured parition UUID using this option.
 
+         --fsuuid: This option is specific to wic. It specifies filesystem UUID.
+                   It's useful if preconfigured filesystem UUID is added to kernel command line
+                   in bootloader configuration before running wic. In this case .wks file can
+                   be generated or modified to set preconfigured filesystem UUID using this option.
+
          --system-id: This option is specific to wic. It specifies partition system id. It's useful
                       for the harware that requires non-default partition system ids. The parameter
                       in one byte long hex number either with 0x prefix or without it.
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 4fb6868531df..e590b2fe3c0d 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -161,6 +161,7 @@ class KickStart():
         part.add_argument('--system-id', type=systemidtype)
         part.add_argument('--use-uuid', action='store_true')
         part.add_argument('--uuid')
+        part.add_argument('--fsuuid')
 
         bootloader = subparsers.add_parser('bootloader')
         bootloader.add_argument('--append')
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 87312383378a..c0b67d829f80 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -26,6 +26,7 @@
 
 import logging
 import os
+import uuid
 
 from wic import WicError
 from wic.misc import exec_cmd, exec_native_cmd, get_bitbake_var
@@ -61,6 +62,7 @@ class Partition():
         self.system_id = args.system_id
         self.use_uuid = args.use_uuid
         self.uuid = args.uuid
+        self.fsuuid = args.fsuuid
 
         self.lineno = lineno
         self.source_file = ""
@@ -264,8 +266,8 @@ class Partition():
         if self.label:
             label_str = "-L %s" % self.label
 
-        mkfs_cmd = "mkfs.%s %s %s %s -d %s" % \
-            (self.fstype, extraopts, rootfs, label_str, rootfs_dir)
+        mkfs_cmd = "mkfs.%s %s %s %s -U %s -d %s" % \
+            (self.fstype, extraopts, rootfs, label_str, self.fsuuid, rootfs_dir)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
         mkfs_cmd = "fsck.%s -pvfD %s" % (self.fstype, rootfs)
@@ -289,9 +291,9 @@ class Partition():
         if self.label:
             label_str = "-L %s" % self.label
 
-        mkfs_cmd = "mkfs.%s -b %d -r %s %s %s %s" % \
+        mkfs_cmd = "mkfs.%s -b %d -r %s %s %s -U %s %s" % \
             (self.fstype, rootfs_size * 1024, rootfs_dir, label_str,
-             self.mkfs_extraopts, rootfs)
+             self.mkfs_extraopts, self.fsuuid, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
     def prepare_rootfs_msdos(self, rootfs, oe_builddir, rootfs_dir,
@@ -315,8 +317,9 @@ class Partition():
 
         extraopts = self.mkfs_extraopts or '-S 512'
 
-        dosfs_cmd = "mkdosfs %s %s %s -C %s %d" % \
-                    (label_str, size_str, extraopts, rootfs, rootfs_size)
+        dosfs_cmd = "mkdosfs %s -i %s %s %s -C %s %d" % \
+                    (label_str, self.fsuuid, size_str, extraopts, rootfs,
+                     rootfs_size)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
@@ -352,8 +355,8 @@ class Partition():
         if self.label:
             label_str = "-L %s" % self.label
 
-        mkfs_cmd = "mkfs.%s -F %s %s %s" % \
-            (self.fstype, extraopts, label_str, rootfs)
+        mkfs_cmd = "mkfs.%s -F %s %s -U %s %s" % \
+            (self.fstype, extraopts, label_str, self.fsuuid, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot)
 
     def prepare_empty_partition_btrfs(self, rootfs, oe_builddir,
@@ -369,8 +372,8 @@ class Partition():
         if self.label:
             label_str = "-L %s" % self.label
 
-        mkfs_cmd = "mkfs.%s -b %d %s %s %s" % \
-                   (self.fstype, self.size * 1024, label_str,
+        mkfs_cmd = "mkfs.%s -b %d %s -U %s %s %s" % \
+                   (self.fstype, self.size * 1024, label_str, self.fsuuid,
                     self.mkfs_extraopts, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot)
 
@@ -391,8 +394,9 @@ class Partition():
 
         extraopts = self.mkfs_extraopts or '-S 512'
 
-        dosfs_cmd = "mkdosfs %s %s %s -C %s %d" % \
-                    (label_str, extraopts, size_str, rootfs, blocks)
+        dosfs_cmd = "mkdosfs %s -i %s %s %s -C %s %d" % \
+                    (label_str, self.fsuuid, extraopts, size_str, rootfs,
+                     blocks)
 
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
@@ -410,9 +414,9 @@ class Partition():
         with open(path, 'w') as sparse:
             os.ftruncate(sparse.fileno(), self.size * 1024)
 
-        import uuid
         label_str = ""
         if self.label:
             label_str = "-L %s" % self.label
-        mkswap_cmd = "mkswap %s -U %s %s" % (label_str, str(uuid.uuid1()), path)
+
+        mkswap_cmd = "mkswap %s -U %s %s" % (label_str, self.fsuuid, path)
         exec_native_cmd(mkswap_cmd, native_sysroot)
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index da1c061063d2..71c0b1c82bf3 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -141,7 +141,15 @@ class DirectPlugin(ImagerPlugin):
                 continue
 
             if part.use_uuid:
-                device_name = "PARTUUID=%s" % part.uuid
+                if part.fsuuid:
+                    # FAT UUID is different from others
+                    if len(part.fsuuid) == 10:
+                        device_name = "UUID=%s-%s" % \
+                                       (part.fsuuid[2:6], part.fsuuid[6:])
+                    else:
+                        device_name = "UUID=%s" % part.fsuuid
+                else:
+                    device_name = "PARTUUID=%s" % part.uuid
             else:
                 # mmc device partitions are named mmcblk0p1, mmcblk0p2..
                 prefix = 'p' if  part.disk.startswith('mmcblk') else ''
@@ -334,13 +342,18 @@ class PartitionedImage():
                     continue
                 part.realnum = realnum
 
-        # generate parition UUIDs
+        # generate parition and filesystem UUIDs
         for part in self.partitions:
             if not part.uuid and part.use_uuid:
                 if self.ptable_format == 'gpt':
                     part.uuid = str(uuid.uuid4())
                 else: # msdos partition table
                     part.uuid = '%08x-%02d' % (self.identifier, part.realnum)
+            if not part.fsuuid:
+                if part.fstype == 'vfat' or part.fstype == 'msdos':
+                    part.fsuuid = '0x' + str(uuid.uuid4())[:8].upper()
+                else:
+                    part.fsuuid = str(uuid.uuid4())
 
     def prepare(self, imager):
         """Prepare an image. Call prepare method of all image partitions."""
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 4c4f36a32f56..beb74d7a7121 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -240,7 +240,8 @@ class BootimgEFIPlugin(SourcePlugin):
         # dosfs image, created by mkdosfs
         bootimg = "%s/boot.img" % cr_workdir
 
-        dosfs_cmd = "mkdosfs -n efi -C %s %d" % (bootimg, blocks)
+        dosfs_cmd = "mkdosfs -n efi -i %s -C %s %d" % \
+                    (part.fsuuid, bootimg, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 56da468fb5cd..d599112dd759 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -186,7 +186,8 @@ class BootimgPcbiosPlugin(SourcePlugin):
         # dosfs image, created by mkdosfs
         bootimg = "%s/boot%s.img" % (cr_workdir, part.lineno)
 
-        dosfs_cmd = "mkdosfs -n boot -S 512 -C %s %d" % (bootimg, blocks)
+        dosfs_cmd = "mkdosfs -n boot -i %s -S 512 -C %s %d" % \
+                    (part.fsuuid, bootimg, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
-- 
2.7.4


