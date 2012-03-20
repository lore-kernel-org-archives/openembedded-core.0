Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SA1jh-0006ph-Oh
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 17:16:37 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Mar 2012 09:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141958513"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.195])
	by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2012 09:06:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2012 16:06:28 +0000
Message-Id: <c1eea8eb72559ef608a51e880bd3c9c4bacc860e.1332259383.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332259383.git.paul.eggleton@linux.intel.com>
References: <cover.1332259383.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1332259383.git.paul.eggleton@linux.intel.com>
References: <cover.1332259383.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/5] buildhistory_analysis: avoid printing PE/PV/PR more than once
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
X-List-Received-Date: Tue, 20 Mar 2012 16:16:38 -0000

Don't print PE/PV/PR changes as related field changes of related field
changes (i.e. only print them once at the top level).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 4f55d9a..313416c 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -49,8 +49,8 @@ class ChangeRecord:
     def __str__(self):
         return self._str_internal(True)
 
-    def _str_internal(self, pathprefix):
-        if pathprefix:
+    def _str_internal(self, outer):
+        if outer:
             prefix = '%s: ' % self.path
         else:
             prefix = ''
@@ -91,7 +91,7 @@ class ChangeRecord:
                 percentchg = 100
             out = '%s changed from %s to %s (%s%d%%)' % (self.fieldname, self.oldvalue or "''", self.newvalue or "''", '+' if percentchg > 0 else '', percentchg)
         elif self.fieldname in img_monitor_files:
-            if pathprefix:
+            if outer:
                 prefix = 'Changes to %s ' % self.path
             out = '(%s):\n  ' % self.fieldname
             if self.filechanges:
@@ -107,6 +107,8 @@ class ChangeRecord:
 
         if self.related:
             for chg in self.related:
+                if not outer and chg.fieldname in ['PE', 'PV', 'PR']:
+                    continue
                 for line in chg._str_internal(False).splitlines():
                     out += '\n  * %s' % line
 
-- 
1.7.5.4



