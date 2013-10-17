Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 08D6B6CF14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 13:21:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 17 Oct 2013 06:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,514,1378882800"; d="scan'208";a="412594595"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.25])
	by fmsmga001.fm.intel.com with ESMTP; 17 Oct 2013 06:15:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 14:15:15 +0100
Message-Id: <1382015715-15696-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH v2] buildhistory-diff: add ability to report version changes
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
X-List-Received-Date: Thu, 17 Oct 2013 13:21:26 -0000

Add a -v/--report-ver option to report changes in PKGE/PKGV/PKGR even
if the value is the same as the default from PE/PV/PR.

Also add a -a/--report-all option to report all changes instead of just
the default significant ones.

Addresses [YOCTO #5263].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py | 41 +++++++++++++++++++-----------------
 scripts/buildhistory-diff            |  8 ++++++-
 2 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 86b5a12..dd17dd5 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -19,10 +19,11 @@ import bb.utils
 # How to display fields
 list_fields = ['DEPENDS', 'RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RREPLACES', 'RCONFLICTS', 'FILES', 'FILELIST', 'USER_CLASSES', 'IMAGE_CLASSES', 'IMAGE_FEATURES', 'IMAGE_LINGUAS', 'IMAGE_INSTALL', 'BAD_RECOMMENDATIONS']
 list_order_fields = ['PACKAGES']
-defaultval_fields = ['PKG', 'PKGE', 'PKGV', 'PKGR']
+defaultval_map = {'PKG': 'PKG', 'PKGE': 'PE', 'PKGV': 'PV', 'PKGR': 'PR'}
 numeric_fields = ['PKGSIZE', 'IMAGESIZE']
 # Fields to monitor
-monitor_fields = ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RREPLACES', 'RCONFLICTS', 'PACKAGES', 'FILELIST', 'PKGSIZE', 'IMAGESIZE', 'PKG', 'PKGE', 'PKGV', 'PKGR']
+monitor_fields = ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RREPLACES', 'RCONFLICTS', 'PACKAGES', 'FILELIST', 'PKGSIZE', 'IMAGESIZE', 'PKG']
+ver_monitor_fields = ['PKGE', 'PKGV', 'PKGR']
 # Percentage change to alert for numeric fields
 monitor_numeric_threshold = 10
 # Image files to monitor (note that image-info.txt is handled separately)
@@ -94,7 +95,7 @@ class ChangeRecord:
             else:
                 percentchg = 100
             out = '%s changed from %s to %s (%s%d%%)' % (self.fieldname, self.oldvalue or "''", self.newvalue or "''", '+' if percentchg > 0 else '', percentchg)
-        elif self.fieldname in defaultval_fields:
+        elif self.fieldname in defaultval_map:
             out = '%s changed from %s to %s' % (self.fieldname, self.oldvalue, self.newvalue)
             if self.fieldname == 'PKG' and '[default]' in self.newvalue:
                 out += ' - may indicate debian renaming failure'
@@ -305,24 +306,32 @@ def compare_pkg_lists(astr, bstr):
     return (depvera, depverb)
 
 
-def compare_dict_blobs(path, ablob, bblob, report_all):
+def compare_dict_blobs(path, ablob, bblob, report_all, report_ver):
     adict = blob_to_dict(ablob)
     bdict = blob_to_dict(bblob)
 
     pkgname = os.path.basename(path)
+
     defaultvals = {}
     defaultvals['PKG'] = pkgname
-    defaultvals['PKGE'] = adict.get('PE', '0')
-    defaultvals['PKGV'] = adict.get('PV', '')
-    defaultvals['PKGR'] = adict.get('PR', '')
-    for key in defaultvals:
-        defaultvals[key] = '%s [default]' % defaultvals[key]
+    defaultvals['PKGE'] = '0'
 
     changes = []
-    keys = list(set(adict.keys()) | set(bdict.keys()))
+    keys = list(set(adict.keys()) | set(bdict.keys()) | set(defaultval_map.keys()))
     for key in keys:
         astr = adict.get(key, '')
         bstr = bdict.get(key, '')
+        if key in ver_monitor_fields:
+            monitored = report_ver or astr or bstr
+        else:
+            monitored = key in monitor_fields
+        mapped_key = defaultval_map.get(key, '')
+        if mapped_key:
+            if not astr:
+                astr = '%s [default]' % adict.get(mapped_key, defaultvals.get(key, ''))
+            if not bstr:
+                bstr = '%s [default]' % bdict.get(mapped_key, defaultvals.get(key, ''))
+
         if astr != bstr:
             if (not report_all) and key in numeric_fields:
                 aval = int(astr or 0)
@@ -350,18 +359,12 @@ def compare_dict_blobs(path, ablob, bblob, report_all):
                 if ' '.join(alist) == ' '.join(blist):
                     continue
 
-            if key in defaultval_fields:
-                if not astr:
-                    astr = defaultvals[key]
-                elif not bstr:
-                    bstr = defaultvals[key]
-
-            chg = ChangeRecord(path, key, astr, bstr, key in monitor_fields)
+            chg = ChangeRecord(path, key, astr, bstr, monitored)
             changes.append(chg)
     return changes
 
 
-def process_changes(repopath, revision1, revision2 = 'HEAD', report_all = False):
+def process_changes(repopath, revision1, revision2='HEAD', report_all=False, report_ver=False):
     repo = git.Repo(repopath)
     assert repo.bare == False
     commit = repo.commit(revision1)
@@ -373,7 +376,7 @@ def process_changes(repopath, revision1, revision2 = 'HEAD', report_all = False)
         if path.startswith('packages/'):
             filename = os.path.basename(d.a_blob.path)
             if filename == 'latest':
-                changes.extend(compare_dict_blobs(path, d.a_blob, d.b_blob, report_all))
+                changes.extend(compare_dict_blobs(path, d.a_blob, d.b_blob, report_all, report_ver))
             elif filename.startswith('latest.'):
                 chg = ChangeRecord(path, filename, d.a_blob.data_stream.read(), d.b_blob.data_stream.read(), True)
                 changes.append(chg)
diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index b82240d..ad50414 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -27,6 +27,12 @@ def main():
     parser.add_option("-p", "--buildhistory-dir",
             help = "Specify path to buildhistory directory (defaults to buildhistory/ under cwd)",
             action="store", dest="buildhistory_dir", default='buildhistory/')
+    parser.add_option("-v", "--report-version",
+            help = "Report changes in PKGE/PKGV/PKGR even when the values are still the default (PE/PV/PR)",
+            action="store_true", dest="report_ver", default=False)
+    parser.add_option("-a", "--report-all",
+            help = "Report all changes, not just the default significant ones",
+            action="store_true", dest="report_all", default=False)
 
     options, args = parser.parse_args(sys.argv)
 
@@ -79,7 +85,7 @@ def main():
 
     import gitdb
     try:
-        changes = oe.buildhistory_analysis.process_changes(options.buildhistory_dir, fromrev, torev)
+        changes = oe.buildhistory_analysis.process_changes(options.buildhistory_dir, fromrev, torev, options.report_all, options.report_ver)
     except gitdb.exc.BadObject as e:
         if len(args) == 1:
             sys.stderr.write("Unable to find previous build revision in buildhistory repository\n\n")
-- 
1.8.1.2


