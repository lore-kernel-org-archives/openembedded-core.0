Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rnpdp-0002Rf-On
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 11:54:50 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2012 02:32:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113934496"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.198])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2012 02:32:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 10:32:12 +0000
Message-Id: <d8c8d97b7059d829744ab59648bba66256e48e12.1326968802.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326968802.git.paul.eggleton@linux.intel.com>
References: <cover.1326968802.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1326968802.git.paul.eggleton@linux.intel.com>
References: <cover.1326968802.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] buildhistory_analysis: include related fields in output
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
X-List-Received-Date: Thu, 19 Jan 2012 10:54:50 -0000

Sometimes, when a value changes in the buildhistory it is useful to
know when a related (but not necessarily itself monitored) value
changes as it can help explain the change. For example, when the list
of installed packages for an image changes it could be caused by a
change to one of the image-related variables.

Related field changes are recorded as sub-items of each change.
Currently the only way to visualise these is via the buildhistory-diff
tool, so an example would be:

Changes to images/qemux86/eglibc/core-image-minimal (installed-package-names.txt):
  locale-base-de-de was added
  procps was added
  * IMAGE_LINGUAS: added "de-de"
  * IMAGE_INSTALL: added "procps"

Here we see that two additional packages have been added to the image,
and looking at the related changes to the two variables IMAGE_INSTALL
and IMAGE_LINGUAS we have the explanation as to why.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py |   89 ++++++++++++++++++++++++----------
 1 files changed, 64 insertions(+), 25 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 627467c..103cfb4 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -23,22 +23,41 @@ monitor_fields = ['RDEPENDS', 'RRECOMMENDS', 'PACKAGES', 'FILELIST', 'PKGSIZE',
 monitor_numeric_threshold = 20
 # Image files to monitor (note that image-info.txt is handled separately)
 img_monitor_files = ['installed-package-names.txt', 'files-in-image.txt']
+# Related context fields for reporting (note: PE, PV & PR are always reported for monitored package fields)
+related_fields = {}
+related_fields['RDEPENDS'] = ['DEPENDS']
+related_fields['RRECOMMENDS'] = ['DEPENDS']
+related_fields['FILELIST'] = ['FILES']
+related_fields['PKGSIZE'] = ['FILELIST']
+related_fields['files-in-image.txt'] = ['installed-package-names.txt', 'USER_CLASSES', 'IMAGE_CLASSES', 'ROOTFS_POSTPROCESS_COMMAND', 'IMAGE_POSTPROCESS_COMMAND']
+related_fields['installed-package-names.txt'] = ['IMAGE_FEATURES', 'IMAGE_LINGUAS', 'IMAGE_INSTALL', 'BAD_RECOMMENDATIONS']
+
 
 class ChangeRecord:
-    def __init__(self, path, fieldname, oldvalue, newvalue):
+    def __init__(self, path, fieldname, oldvalue, newvalue, monitored):
         self.path = path
         self.fieldname = fieldname
         self.oldvalue = oldvalue
         self.newvalue = newvalue
+        self.monitored = monitored
+        self.related = []
         self.filechanges = None
 
     def __str__(self):
+        return self._str_internal(True)
+
+    def _str_internal(self, pathprefix):
+        if pathprefix:
+            prefix = '%s: ' % self.path
+        else:
+            prefix = ''
+
         if self.fieldname in list_fields:
             aitems = self.oldvalue.split()
             bitems = self.newvalue.split()
             removed = list(set(aitems) - set(bitems))
             added = list(set(bitems) - set(aitems))
-            return '%s: %s:%s%s' % (self.path, self.fieldname, ' removed "%s"' % ' '.join(removed) if removed else '', ' added "%s"' % ' '.join(added) if added else '')
+            out = '%s:%s%s' % (self.fieldname, ' removed "%s"' % ' '.join(removed) if removed else '', ' added "%s"' % ' '.join(added) if added else '')
         elif self.fieldname in numeric_fields:
             aval = int(self.oldvalue or 0)
             bval = int(self.newvalue or 0)
@@ -46,9 +65,11 @@ class ChangeRecord:
                 percentchg = ((bval - aval) / float(aval)) * 100
             else:
                 percentchg = 100
-            return '%s: %s changed from %s to %s (%s%d%%)' % (self.path, self.fieldname, self.oldvalue or "''", self.newvalue or "''", '+' if percentchg > 0 else '', percentchg)
+            out = '%s changed from %s to %s (%s%d%%)' % (self.fieldname, self.oldvalue or "''", self.newvalue or "''", '+' if percentchg > 0 else '', percentchg)
         elif self.fieldname in img_monitor_files:
-            out = 'Changes to %s (%s):\n  ' % (self.path, self.fieldname)
+            if pathprefix:
+                prefix = 'Changes to %s ' % self.path
+            out = '(%s):\n  ' % self.fieldname
             if self.filechanges:
                 out += '\n  '.join(['%s' % i for i in self.filechanges])
             else:
@@ -57,10 +78,15 @@ class ChangeRecord:
                 diff = difflib.unified_diff(alines, blines, self.fieldname, self.fieldname, lineterm='')
                 out += '\n  '.join(list(diff))
                 out += '\n  --'
-            return out
         else:
-            return '%s: %s changed from "%s" to "%s"' % (self.path, self.self.fieldname, self.oldvalue, self.newvalue)
+            out = '%s changed from "%s" to "%s"' % (self.fieldname, self.oldvalue, self.newvalue)
 
+        if self.related:
+            for chg in self.related:
+                for line in chg._str_internal(False).splitlines():
+                    out += '\n  * %s' % line
+
+        return '%s%s' % (prefix, out)
 
 class FileChange:
     changetype_add = 'A'
@@ -199,21 +225,20 @@ def compare_dict_blobs(path, ablob, bblob, report_all):
     changes = []
     keys = list(set(adict.keys()) | set(bdict.keys()))
     for key in keys:
-        if report_all or key in monitor_fields:
-            astr = adict.get(key, '')
-            bstr = bdict.get(key, '')
-            if astr != bstr:
-                if (not report_all) and key in numeric_fields:
-                    aval = int(astr or 0)
-                    bval = int(bstr or 0)
-                    if aval != 0:
-                        percentchg = ((bval - aval) / float(aval)) * 100
-                    else:
-                        percentchg = 100
-                    if percentchg < monitor_numeric_threshold:
-                        continue
-                chg = ChangeRecord(path, key, astr, bstr)
-                changes.append(chg)
+        astr = adict.get(key, '')
+        bstr = bdict.get(key, '')
+        if astr != bstr:
+            if (not report_all) and key in numeric_fields:
+                aval = int(astr or 0)
+                bval = int(bstr or 0)
+                if aval != 0:
+                    percentchg = ((bval - aval) / float(aval)) * 100
+                else:
+                    percentchg = 100
+                if percentchg < monitor_numeric_threshold:
+                    continue
+            chg = ChangeRecord(path, key, astr, bstr, key in monitor_fields)
+            changes.append(chg)
     return changes
 
 
@@ -236,7 +261,7 @@ def process_changes(repopath, revision1, revision2 = 'HEAD', report_all = False)
                     blines = d.b_blob.data_stream.read().splitlines()
                     filechanges = compare_file_lists(alines,blines)
                     if filechanges:
-                        chg = ChangeRecord(path, filename, None, None)
+                        chg = ChangeRecord(path, filename, None, None, True)
                         chg.filechanges = filechanges
                         changes.append(chg)
                 elif filename == 'installed-package-names.txt':
@@ -244,13 +269,27 @@ def process_changes(repopath, revision1, revision2 = 'HEAD', report_all = False)
                     blines = d.b_blob.data_stream.read().splitlines()
                     filechanges = compare_lists(alines,blines)
                     if filechanges:
-                        chg = ChangeRecord(path, filename, None, None)
+                        chg = ChangeRecord(path, filename, None, None, True)
                         chg.filechanges = filechanges
                         changes.append(chg)
                 else:
-                    chg = ChangeRecord(path, filename, d.a_blob.data_stream.read(), d.b_blob.data_stream.read())
+                    chg = ChangeRecord(path, filename, d.a_blob.data_stream.read(), d.b_blob.data_stream.read(), True)
                     changes.append(chg)
             elif filename == 'image-info.txt':
                 changes.extend(compare_dict_blobs(path, d.a_blob, d.b_blob, report_all))
 
-    return changes
+    # Link related changes
+    for chg in changes:
+        if chg.monitored:
+            for chg2 in changes:
+                # (Check dirname in the case of fields from recipe info files)
+                if chg.path == chg2.path or os.path.dirname(chg.path) == chg2.path:
+                    if chg2.fieldname in related_fields.get(chg.fieldname, []):
+                        chg.related.append(chg2)
+                    elif chg.path.startswith('packages/') and chg2.fieldname in ['PE', 'PV', 'PR']:
+                        chg.related.append(chg2)
+
+    if report_all:
+        return changes
+    else:
+        return [chg for chg in changes if chg.monitored]
-- 
1.7.5.4



