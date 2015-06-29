Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C0C9765CCD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 19:11:41 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 29 Jun 2015 12:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,371,1432623600"; d="scan'208";a="516109110"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Jun 2015 12:11:42 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 5EB856A4083;
	Mon, 29 Jun 2015 12:11:03 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 22:10:30 +0300
Message-Id: <1435605033-11509-18-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 17/20] wic: Remove __write_partition method
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
X-List-Received-Date: Mon, 29 Jun 2015 19:11:42 -0000

Moved code of __write_partition to 'assemble' method.
This way it should be more readable.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index d61087a..ca4b1f0 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -334,30 +334,24 @@ class Image(object):
                 except:
                     pass
 
-    def __write_partition(self, num, source_file, start, size, image_file):
-        """
-        Install source_file contents into a partition.
-        """
-        if not source_file: # nothing to write
-            return
-
-        # Start is included in the size so need to substract one from the end.
-        end = start + size - 1
-        msger.debug("Installed %s in partition %d, sectors %d-%d, "
-                    "size %d sectors" % (source_file, num, start, end, size))
-
-        dd_cmd = "dd if=%s of=%s bs=%d seek=%d count=%d conv=notrunc" % \
-            (source_file, image_file, self.sector_size, start, size)
-        exec_cmd(dd_cmd)
-
-
     def assemble(self, image_file):
         msger.debug("Installing partitions")
 
-        for p in self.partitions:
-            self.__write_partition(p['num'], p['source_file'],
-                                   p['start'], p['size'], image_file)
-            os.rename(p['source_file'], image_file + '.p%d' % p['num'])
+        for part in self.partitions:
+            source = part['source_file']
+            if source:
+                # install source_file contents into a partition
+                cmd = "dd if=%s of=%s bs=%d seek=%d count=%d conv=notrunc" % \
+                      (source, image_file, self.sector_size,
+                       part['start'], part['size'])
+                exec_cmd(cmd)
+
+                msger.debug("Installed %s in partition %d, sectors %d-%d, "
+                            "size %d sectors" % \
+                            (source, part['num'], part['start'],
+                             part['start'] + part['size'] - 1, part['size']))
+
+                os.rename(source, image_file + '.p%d' % part['num'])
 
     def create(self):
         for dev in self.disks.keys():
-- 
2.1.4


