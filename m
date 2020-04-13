Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.12960.1586775656692601428
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2020 04:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: +GlYhcMMKzsEKadoe+aC8YPnX7fuGTAWYkolmEcWqmtQTilMX9iZmE8IyYGAHWghXojWdW62/W
 vamiUP7JO63w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2020 04:00:55 -0700
IronPort-SDR: 9G6a1Rv0GGjMr7JCYHqkJGPG8gACGOiHnWCxVRpiaykfqPo596AkLBEv9IgRv3kff3eGvjRQyP
 D47Qzh4n3H4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; 
   d="scan'208";a="276866423"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga004.fm.intel.com with ESMTP; 13 Apr 2020 04:00:55 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic: use Filesystem UUID when expand swap partition
Date: Mon, 13 Apr 2020 19:00:54 +0800
Message-Id: <1586775654-29453-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Lee Chee Yang <chee.yang.lee@intel.com>

part.get("uuid") return the Partition UUID from the partition
table instead of Filesystem UUID. This lead to swap partition
UUID not match/change when wic write expand swap partition.

change it to read the filesystem UUID using blkid. The output
from blkid should looks like this:
wic-partvzhiwq3s: LABEL="swap1" UUID="04e55c19-3f3f-4491-9e32-44eea8daa827" VERSION="1" TYPE="swap" USAGE="other"

[YOCTO #13313]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 scripts/lib/wic/engine.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 9ff4394..018815b 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -280,7 +280,7 @@ class Disk:
     def __getattr__(self, name):
         """Get path to the executable in a lazy way."""
         if name in ("mdir", "mcopy", "mdel", "mdeltree", "sfdisk", "e2fsck",
-                    "resize2fs", "mkswap", "mkdosfs", "debugfs"):
+                    "resize2fs", "mkswap", "mkdosfs", "debugfs","blkid"):
             aname = "_%s" % name
             if aname not in self.__dict__:
                 setattr(self, aname, find_executable(name, self.paths))
@@ -543,7 +543,8 @@ class Disk:
                         logger.info("creating swap partition {}".format(pnum))
                         label = part.get("name")
                         label_str = "-L {}".format(label) if label else ''
-                        uuid = part.get("uuid")
+                        out = exec_cmd("{} --probe {}".format(self.blkid, self._get_part_image(pnum)))
+                        uuid = out[out.index("UUID=\"")+6:out.index("UUID=\"")+42]
                         uuid_str = "-U {}".format(uuid) if uuid else ''
                         with open(partfname, 'w') as sparse:
                             os.ftruncate(sparse.fileno(), part['size'] * self._lsector_size)
-- 
2.7.4

