Return-Path: <Vijaikumar_Kanagarajan@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3296C433EF
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 06:36:37 +0000 (UTC)
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 by mx.groups.io with SMTP id smtpd.web12.14502.1652596592424030871
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 May 2022 23:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.137.180, mailfrom: vijaikumar_kanagarajan@mentor.com)
X-IronPort-AV: E=Sophos;i="5.91,227,1647331200";
   d="scan'208";a="75750141"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 14 May 2022 22:36:32 -0800
IronPort-SDR: 
 VyMFH/9MIPrVP5DZPZJ8gCMxmQUNdhiXvJ+77yiSXRCpj3j1hagQOeUA1S6rjHsUVs4tAVtiib
 r+WgmZJm+flQam07yRoY1ASYnKXXj3zGUIQTHEug/y0m7ee5lyFvpLjMZafdxxH+P6Je3AiBpl
 Y5zAquTPDiSToDYmO94l71WWl0udYpRfbMe9NtR51cdfVzY+fxFVSbn7tH8rDRa0jpW+dOQ/mT
 XCJtu2bDIyZ/Omh+WmJbkt8l2aXHyhId2ZWKxX56hKl6oTsM3ggotroX3aWLdlvbwcswj75d8b
 FCE=
From: Vijai Kumar K <Vijaikumar_Kanagarajan@mentor.com>
To: <openembedded-core@lists.openembedded.org>
CC: <henning.schild@siemens.com>, Claudius Heine <ch@denx.de>, Vijai Kumar K
	<Vijaikumar_Kanagarajan@mentor.com>
Subject: [PATCH v2] wic: added fspassno parameter to partition
Date: Sun, 15 May 2022 12:06:00 +0530
Message-ID: <20220515063600.777146-1-Vijaikumar_Kanagarajan@mentor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220513164044.4ad41b6b@md1za8fc.ad001.siemens.net>
References: <20220513164044.4ad41b6b@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: svr-orw-mbx-14.mgc.mentorg.com (147.34.90.214) To
 svr-orw-mbx-12.mgc.mentorg.com (147.34.90.212)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 06:36:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165597

From: Claudius Heine <ch@denx.de>

The `fspassno` parameter allows to overwrite the value of the last
column (`fs_passno`) in the /etc/fstab of the target root file system.
This allows to have periodic file system checks.

Signed-off-by: Claudius Heine <ch@denx.de>
Signed-off-by: Vijai Kumar K <Vijaikumar_Kanagarajan@mentor.com>
---
 scripts/lib/wic/help.py                  | 6 ++++++
 scripts/lib/wic/ksparser.py              | 1 +
 scripts/lib/wic/partition.py             | 1 +
 scripts/lib/wic/plugins/imager/direct.py | 3 ++-
 4 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 4ff7470a6a..73e3380cde 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -940,6 +940,12 @@ DESCRIPTION
                       quotes.  If not specified, the default string is
                       "defaults".
 
+         --fspassno: Specifies the order in which filesystem checks are done
+                     at boot time by fsck.  See fs_passno parameter of
+                     fstab(5).  This parameter will be copied into the
+                     /etc/fstab file of the installed system.  If not
+                     specified the default value of "0" will be used.
+
          --label label: Specifies the label to give to the filesystem
                         to be made on the partition. If the given
                         label is already in use by another filesystem,
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 0df9eb0d05..a49b7b97c4 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -155,6 +155,7 @@ class KickStart():
         part.add_argument('--change-directory')
         part.add_argument("--extra-space", type=sizetype("M"))
         part.add_argument('--fsoptions', dest='fsopts')
+        part.add_argument('--fspassno', dest='fspassno')
         part.add_argument('--fstype', default='vfat',
                           choices=('ext2', 'ext3', 'ext4', 'btrfs',
                                    'squashfs', 'vfat', 'msdos', 'erofs',
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 09e491dd49..e50871b8d7 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -33,6 +33,7 @@ class Partition():
         self.include_path = args.include_path
         self.change_directory = args.change_directory
         self.fsopts = args.fsopts
+        self.fspassno = args.fspassno
         self.fstype = args.fstype
         self.label = args.label
         self.use_label = args.use_label
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 4d0b836ef6..da483daed5 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -138,8 +138,9 @@ class DirectPlugin(ImagerPlugin):
                 device_name = "/dev/%s%s%d" % (part.disk, prefix, part.realnum)
 
             opts = part.fsopts if part.fsopts else "defaults"
+            passno = part.fspassno if part.fspassno else "0"
             line = "\t".join([device_name, part.mountpoint, part.fstype,
-                              opts, "0", "0"]) + "\n"
+                              opts, "0", passno]) + "\n"
 
             fstab_lines.append(line)
             updated = True
-- 
2.25.1


