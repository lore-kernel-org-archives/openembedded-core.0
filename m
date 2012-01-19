Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rnpdo-0002GJ-2b
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 11:54:49 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2012 02:32:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113934480"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.198])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2012 02:32:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 10:32:11 +0000
Message-Id: <450aed411ccbc07fc52203df8053135d9f1cacc0.1326968802.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326968802.git.paul.eggleton@linux.intel.com>
References: <cover.1326968802.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1326968802.git.paul.eggleton@linux.intel.com>
References: <cover.1326968802.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] buildhistory_analysis: improve field handling robustness
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
X-List-Received-Date: Thu, 19 Jan 2012 10:54:49 -0000

Avoid errors when comparing changes for KEY = value files (package info
files and image-info.txt):

* Handle keys appearing and disappearing - this will help to handle PE
  in package info files (which is only written when it is not blank) and
  when we add additional fields in future.
* Handle when old value is 0 for numeric field (avoid division by zero)
* Report when numeric field was empty or missing rather than 0 (but
  still treat it as 0 for comparison purposes)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py |   29 +++++++++++++++++++----------
 1 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index a2fa643..627467c 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -40,10 +40,13 @@ class ChangeRecord:
             added = list(set(bitems) - set(aitems))
             return '%s: %s:%s%s' % (self.path, self.fieldname, ' removed "%s"' % ' '.join(removed) if removed else '', ' added "%s"' % ' '.join(added) if added else '')
         elif self.fieldname in numeric_fields:
-            aval = int(self.oldvalue)
-            bval = int(self.newvalue)
-            percentchg = ((bval - aval) / float(aval)) * 100
-            return '%s: %s changed from %d to %d (%s%d%%)' % (self.path, self.fieldname, aval, bval, '+' if percentchg > 0 else '', percentchg)
+            aval = int(self.oldvalue or 0)
+            bval = int(self.newvalue or 0)
+            if aval != 0:
+                percentchg = ((bval - aval) / float(aval)) * 100
+            else:
+                percentchg = 100
+            return '%s: %s changed from %s to %s (%s%d%%)' % (self.path, self.fieldname, self.oldvalue or "''", self.newvalue or "''", '+' if percentchg > 0 else '', percentchg)
         elif self.fieldname in img_monitor_files:
             out = 'Changes to %s (%s):\n  ' % (self.path, self.fieldname)
             if self.filechanges:
@@ -194,16 +197,22 @@ def compare_dict_blobs(path, ablob, bblob, report_all):
     bdict = blob_to_dict(bblob)
 
     changes = []
-    for key in adict:
+    keys = list(set(adict.keys()) | set(bdict.keys()))
+    for key in keys:
         if report_all or key in monitor_fields:
-            if adict[key] != bdict[key]:
+            astr = adict.get(key, '')
+            bstr = bdict.get(key, '')
+            if astr != bstr:
                 if (not report_all) and key in numeric_fields:
-                    aval = int(adict[key])
-                    bval = int(bdict[key])
-                    percentchg = ((bval - aval) / float(aval)) * 100
+                    aval = int(astr or 0)
+                    bval = int(bstr or 0)
+                    if aval != 0:
+                        percentchg = ((bval - aval) / float(aval)) * 100
+                    else:
+                        percentchg = 100
                     if percentchg < monitor_numeric_threshold:
                         continue
-                chg = ChangeRecord(path, key, adict[key], bdict[key])
+                chg = ChangeRecord(path, key, astr, bstr)
                 changes.append(chg)
     return changes
 
-- 
1.7.5.4



