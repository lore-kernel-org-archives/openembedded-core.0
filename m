Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RxIkF-0004rp-LI
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 14:48:35 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Feb 2012 05:40:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="109851009"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.250])
	by orsmga002.jf.intel.com with ESMTP; 14 Feb 2012 05:40:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 13:40:17 +0000
Message-Id: <2d65e8dffd534a58514d0b6521961284000a047b.1329226672.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1329226672.git.paul.eggleton@linux.intel.com>
References: <cover.1329226672.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1329226672.git.paul.eggleton@linux.intel.com>
References: <cover.1329226672.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/7] buildhistory_analysis: correctly split RDEPENDS/RRECOMMENDS
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
X-List-Received-Date: Tue, 14 Feb 2012 13:48:36 -0000

Split RDEPENDS and RRECOMMENDS correctly (which may contain version
number specifications after each item).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index bef6cd4..4f3e635 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -12,6 +12,7 @@ import sys
 import os.path
 import difflib
 import git
+import re
 
 
 # How to display fields
@@ -53,9 +54,18 @@ class ChangeRecord:
         else:
             prefix = ''
 
+        def pkglist_split(pkgs):
+            pkgit = re.finditer(r'[a-zA-Z0-9.+-]+( \([><=]+ [^ )]+\))?', pkgs, 0)
+            pkglist = [p.group(0) for p in pkgit]
+            return pkglist
+
         if self.fieldname in list_fields or self.fieldname in list_order_fields:
-            aitems = self.oldvalue.split()
-            bitems = self.newvalue.split()
+            if self.fieldname in ['RDEPENDS', 'RRECOMMENDS']:
+                aitems = pkglist_split(self.oldvalue)
+                bitems = pkglist_split(self.newvalue)
+            else:
+                aitems = self.oldvalue.split()
+                bitems = self.newvalue.split()
             removed = list(set(aitems) - set(bitems))
             added = list(set(bitems) - set(aitems))
             if removed or added:
-- 
1.7.5.4



