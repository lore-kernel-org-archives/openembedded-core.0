Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.32965.1585212831047026777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ZlHcIwsNYv7NPPa5YGQRA4HTc+EUgqYeb1rXafX13WiPYOHpEbYfoPHljxqVBvQcBTqX1Ict+6
 ejM66zMLOqLw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 01:54:00 -0700
IronPort-SDR: UWIBPsrlCM+KZs3gbvlfaE6GbPH+dIWp4cGBhTJ+sT5wAo8ZkohuYElRTAVpxa6nmhYcbE1r7q
 XusIeRnO1HGw==
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; 
   d="scan'208";a="420621892"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA; 26 Mar 2020 01:53:59 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 9/9] wic/direct: reserve 2 sector for extended partition
Date: Thu, 26 Mar 2020 16:53:36 +0800
Message-Id: <0743dcd0cd70dee87a49d3bcd017168352e60982.1585211896.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1585211896.git.anuj.mittal@intel.com>
References: <cover.1585211896.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1585211896.git.anuj.mittal@intel.com>
References: <cover.1585211896.git.anuj.mittal@intel.com>

From: Chee Yang Lee <chee.yang.lee@intel.com>

extended partition should reserve at least 2 unallocated sectors
between the start of the extended partition and the start of a
logical partition.

[YOCTO #13658]

(From OE-Core rev: 884c8a0e50a49bdca5e048197a9dc0ff37cc8d1a)

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 590555e3b8ccbd94b628aa6778adea7f4538d966)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 2441cc3..5148df2 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -403,7 +403,7 @@ class PartitionedImage():
                 # Reserve a sector for EBR for every logical partition
                 # before alignment is performed.
                 if part.type == 'logical':
-                    self.offset += 1
+                    self.offset += 2
 
             align_sectors = 0
             if part.align:
@@ -446,7 +446,7 @@ class PartitionedImage():
                         self.extendedpart = part.num
                     else:
                         self.extended_size_sec += align_sectors
-                    self.extended_size_sec += part.size_sec + 1
+                    self.extended_size_sec += part.size_sec + 2
                 else:
                     self.primary_part_num += 1
                     part.num = self.primary_part_num
@@ -512,7 +512,7 @@ class PartitionedImage():
                 # add a sector at the back, so that there is enough
                 # room for all logical partitions.
                 self._create_partition(self.path, "extended",
-                                       None, part.start - 1,
+                                       None, part.start - 2,
                                        self.extended_size_sec)
 
             if part.fstype == "swap":
-- 
2.7.4

