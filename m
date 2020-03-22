Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.25073.1584860243365815657
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2020 23:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: rw40OlWS7hTIb0vb0JzJRFTQKnDiGU2Cbbv+k828pxC1U3NCIEcSBMVmzPN/qhkQWZu3gxDcbL
 E9FZO70U0nbg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2020 23:57:22 -0700
IronPort-SDR: cBQ+NayLdIyvVydRPKpZo6/vd3RWYZH5QDP83p3+SS17is+LXf0W3aKD+c2Y7OLXt7O4mNwdrz
 L7jTdjeG4Bjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,291,1580803200"; 
   d="scan'208";a="249294263"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga006.jf.intel.com with ESMTP; 21 Mar 2020 23:57:21 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic/direct: reserve 2 sector for extended partition
Date: Sun, 22 Mar 2020 14:57:20 +0800
Message-Id: <1584860240-64723-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Chee Yang Lee <chee.yang.lee@intel.com>

extended partition should reserve at least 2 unallocated sectors
between the start of the extended partition and the start of a
logical partition.

[YOCTO #13658]

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index c50645f..2d06c24 100644
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

