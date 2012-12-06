Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TgZay-0004uc-Mt
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 12:26:24 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Dec 2012 03:11:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,229,1355126400"; d="scan'208";a="259859724"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.5])
	by fmsmga002.fm.intel.com with ESMTP; 06 Dec 2012 03:11:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 11:11:51 +0000
Message-Id: <1354792311-17216-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] buildhistory_analysis: fix broken list length checks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2012 11:26:24 -0000

Fix erroneous use of .count instead of len(), which unfortunately is not
reported by Python as an error in a numeric comparison.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index ad57f00..7b5ee45 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -185,7 +185,7 @@ def blob_to_dict(blob):
     adict = {}
     for line in alines:
         splitv = [i.strip() for i in line.split('=',1)]
-        if splitv.count > 1:
+        if len(splitv) > 1:
             adict[splitv[0]] = splitv[1]
     return adict
 
@@ -231,7 +231,7 @@ def compare_file_lists(alines, blines):
                 filechanges.append(FileChange(path, FileChange.changetype_ownergroup, oldvalue, newvalue))
             # Check symlink target
             if newsplitv[0][0] == 'l':
-                if splitv.count > 3:
+                if len(splitv) > 3:
                     oldvalue = splitv[3]
                 else:
                     oldvalue = None
-- 
1.7.10.4



