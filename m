Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2EA1067058
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 00:29:28 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5306.1773361761633739853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 17:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 62D0SkjD2351651;
	Thu, 12 Mar 2026 19:28:47 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org, twoerner@gmail.com
Cc: mark.hatle@amd.com
Subject: [PATCH 1/2] oeqa/selftest: wic: Add vfat to test_wic_sector_size
Date: Thu, 12 Mar 2026 19:28:45 -0500
Message-Id: <1773361726-30192-2-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1773361726-30192-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1773361726-30192-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 00:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233016

Add an empty vfat partition to the 4k sector size test.  This ensures that
the -S 4096 option is passed to mkfs.vfat, and the resulting filesystem is
generated.

We also now verify that the requested partitions, and names were created
as expected.  Size does not matter, only the partition type and name.

Note, there is a known issue in parted that 4096 fat partitions are not
recognized by fstype, so report themselves as empty in the regular output.
Both wic ls and parted p show an unknown filesytem type.  However, the type
of the partition (last field) is set to msftdata, so we can use that
instead.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index ecaee5a..c4bc5a4 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -958,6 +958,7 @@ bootloader --ptable gpt""")
             with NamedTemporaryFile("w", suffix=".wks") as wks:
                 wks.writelines(
                     ['bootloader --ptable gpt\n',
+                     'part --fstype vfat --fstype vfat --label emptyfat --size 1M --mkfs-extraopts "-S 4096"\n',
                      'part --fstype ext4 --source rootfs --label rofs-a --mkfs-extraopts "-b 4096"\n',
                      'part --fstype ext4 --source rootfs --use-uuid --mkfs-extraopts "-b 4096"\n'])
                 wks.flush()
@@ -970,17 +971,21 @@ bootloader --ptable gpt""")
             sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
             # list partitions
             result = runCmd("wic ls %s -n %s" % (images[0], sysroot))
-            self.assertEqual(3, len(result.output.split('\n')))
+            print(result.output)
+            # 4 lines of output: header + 3 partition
+            self.assertEqual(4, len(result.output.split('\n')))
 
             # verify partition size with wic
             res = runCmd("export PARTED_SECTOR_SIZE=%d; parted -m %s unit b p" % (wic_sector_size, images[0]),
                          stderr=subprocess.PIPE)
 
+            print(res.output)
             # parse parted output which looks like this:
             # BYT;\n
             # /var/tmp/wic/build/tmpgjzzefdd-202410281021-sda.direct:78569472B:file:4096:4096:gpt::;\n
-            # 1:139264B:39284735B:39145472B:ext4:rofs-a:;\n
-            # 2:39284736B:78430207B:39145472B:ext4:primary:;\n
+            # 1:139264B:1187839B:1048576B::emptyfat:msftdata;
+            # 2:1187840B:149270527B:148082688B:ext4:rofs-a:;
+            # 3:149270528B:297353215B:148082688B:ext4:primary:;
             disk_info = res.output.splitlines()[1]
             # Check sector sizes
             sector_size_logical = int(disk_info.split(":")[3])
@@ -988,6 +993,26 @@ bootloader --ptable gpt""")
             self.assertEqual(wic_sector_size, sector_size_logical, "Logical sector size is not %d." % wic_sector_size)
             self.assertEqual(wic_sector_size, sector_size_physical, "Physical sector size is not %d." % wic_sector_size)
 
+            # It is a known issue with parsed that a 4K FAT partition does
+            # not have a recognized filesystem type of *fat.
+            part_info = res.output.splitlines()[2]
+            partname = part_info.split(":")[5]
+            parttype = part_info.split(":")[6]
+            self.assertEqual('emptyfat', partname)
+            self.assertEqual('msftdata;', parttype)
+
+            part_info = res.output.splitlines()[3]
+            parttype = part_info.split(":")[4]
+            partname = part_info.split(":")[5]
+            self.assertEqual('ext4', parttype)
+            self.assertEqual('rofs-a', partname)
+
+            part_info = res.output.splitlines()[4]
+            parttype = part_info.split(":")[4]
+            partname = part_info.split(":")[5]
+            self.assertEqual('ext4', parttype)
+            self.assertEqual('primary', partname)
+
         finally:
             os.environ['PATH'] = oldpath
 
-- 
1.8.3.1


