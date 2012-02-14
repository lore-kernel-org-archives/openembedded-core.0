Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RxIkF-0004rw-04
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 14:48:35 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Feb 2012 05:40:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="109851004"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.250])
	by orsmga002.jf.intel.com with ESMTP; 14 Feb 2012 05:40:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 13:40:16 +0000
Message-Id: <3ab6946429176340d7eb6f9f0ebd461c8d4265cc.1329226672.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1329226672.git.paul.eggleton@linux.intel.com>
References: <cover.1329226672.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1329226672.git.paul.eggleton@linux.intel.com>
References: <cover.1329226672.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/7] buildhistory_analysis: avoid noise due to reordering
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Feb 2012 13:48:35 -0000

Avoid noise in the output due to reordering of list variables (except
for PACKAGES where we just report that the order changed). Recent
changes to the buildhistory class itself will avoid this reordering
from occurring but this allows us to examine the results before and
after those changes.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py |   17 ++++++++++++++---
 1 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 103cfb4..bef6cd4 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -15,7 +15,8 @@ import git
 
 
 # How to display fields
-list_fields = ['DEPENDS', 'RDEPENDS', 'RRECOMMENDS', 'PACKAGES', 'FILES', 'FILELIST', 'USER_CLASSES', 'IMAGE_CLASSES', 'IMAGE_FEATURES', 'IMAGE_LINGUAS', 'IMAGE_INSTALL', 'BAD_RECOMMENDATIONS']
+list_fields = ['DEPENDS', 'RDEPENDS', 'RRECOMMENDS', 'FILES', 'FILELIST', 'USER_CLASSES', 'IMAGE_CLASSES', 'IMAGE_FEATURES', 'IMAGE_LINGUAS', 'IMAGE_INSTALL', 'BAD_RECOMMENDATIONS']
+list_order_fields = ['PACKAGES']
 numeric_fields = ['PKGSIZE', 'IMAGESIZE']
 # Fields to monitor
 monitor_fields = ['RDEPENDS', 'RRECOMMENDS', 'PACKAGES', 'FILELIST', 'PKGSIZE', 'IMAGESIZE']
@@ -52,12 +53,15 @@ class ChangeRecord:
         else:
             prefix = ''
 
-        if self.fieldname in list_fields:
+        if self.fieldname in list_fields or self.fieldname in list_order_fields:
             aitems = self.oldvalue.split()
             bitems = self.newvalue.split()
             removed = list(set(aitems) - set(bitems))
             added = list(set(bitems) - set(aitems))
-            out = '%s:%s%s' % (self.fieldname, ' removed "%s"' % ' '.join(removed) if removed else '', ' added "%s"' % ' '.join(added) if added else '')
+            if removed or added:
+                out = '%s:%s%s' % (self.fieldname, ' removed "%s"' % ' '.join(removed) if removed else '', ' added "%s"' % ' '.join(added) if added else '')
+            else:
+                out = '%s changed order' % self.fieldname
         elif self.fieldname in numeric_fields:
             aval = int(self.oldvalue or 0)
             bval = int(self.newvalue or 0)
@@ -237,6 +241,13 @@ def compare_dict_blobs(path, ablob, bblob, report_all):
                     percentchg = 100
                 if percentchg < monitor_numeric_threshold:
                     continue
+            elif (not report_all) and key in list_fields:
+                alist = astr.split()
+                alist.sort()
+                blist = bstr.split()
+                blist.sort()
+                if ' '.join(alist) == ' '.join(blist):
+                    continue
             chg = ChangeRecord(path, key, astr, bstr, key in monitor_fields)
             changes.append(chg)
     return changes
-- 
1.7.5.4



