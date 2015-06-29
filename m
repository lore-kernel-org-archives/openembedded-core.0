Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4431765CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 19:11:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jun 2015 12:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,371,1432623600"; d="scan'208";a="752711624"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2015 12:11:32 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id E67FC6A4083;
	Mon, 29 Jun 2015 12:10:51 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 22:10:22 +0300
Message-Id: <1435605033-11509-10-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 09/20] wic: Rename partition images
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
X-List-Received-Date: Mon, 29 Jun 2015 19:11:30 -0000

Renamed partition images into <final image>.p<partition number>
This should make output directory look more organized and easier
to understand.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index e093ec5..d61087a 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -18,6 +18,7 @@
 # with this program; if not, write to the Free Software Foundation, Inc., 59
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
+import os
 from wic import msger
 from wic.utils.errors import ImageError
 from wic.utils.oe.misc import exec_cmd, exec_native_cmd
@@ -356,6 +357,7 @@ class Image(object):
         for p in self.partitions:
             self.__write_partition(p['num'], p['source_file'],
                                    p['start'], p['size'], image_file)
+            os.rename(p['source_file'], image_file + '.p%d' % p['num'])
 
     def create(self):
         for dev in self.disks.keys():
-- 
2.1.4


