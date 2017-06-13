Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CAC93782FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 13:13:40 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2017 06:13:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="97482067"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 13 Jun 2017 06:13:41 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 4BCDC5800CE;
	Tue, 13 Jun 2017 06:13:41 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 16:12:18 +0300
Message-Id: <1497359538-18146-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] buildhistory-diff: exclude paths from the output
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
X-List-Received-Date: Tue, 13 Jun 2017 13:13:42 -0000

Implemented -e/--exclude-path command line option to
exclude paths from buildhistory-diff output.

[YOCTO #11459]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py | 51 ++++++++++++++++++++++++------------
 scripts/buildhistory-diff            | 12 ++++++---
 2 files changed, 43 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 3a5b7b6..3e86a46 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -143,22 +143,25 @@ class ChangeRecord:
             out += '\n  '.join(list(diff)[2:])
             out += '\n  --'
         elif self.fieldname in img_monitor_files or '/image-files/' in self.path:
-            fieldname = self.fieldname
-            if '/image-files/' in self.path:
-                fieldname = os.path.join('/' + self.path.split('/image-files/')[1], self.fieldname)
-                out = 'Changes to %s:\n  ' % fieldname
-            else:
-                if outer:
-                    prefix = 'Changes to %s ' % self.path
-                out = '(%s):\n  ' % self.fieldname
-            if self.filechanges:
-                out += '\n  '.join(['%s' % i for i in self.filechanges])
+            if self.filechanges or (self.oldvalue and self.newvalue):
+                fieldname = self.fieldname
+                if '/image-files/' in self.path:
+                    fieldname = os.path.join('/' + self.path.split('/image-files/')[1], self.fieldname)
+                    out = 'Changes to %s:\n  ' % fieldname
+                else:
+                    if outer:
+                        prefix = 'Changes to %s ' % self.path
+                    out = '(%s):\n  ' % self.fieldname
+                if self.filechanges:
+                    out += '\n  '.join(['%s' % i for i in self.filechanges])
+                else:
+                    alines = self.oldvalue.splitlines()
+                    blines = self.newvalue.splitlines()
+                    diff = difflib.unified_diff(alines, blines, fieldname, fieldname, lineterm='')
+                    out += '\n  '.join(list(diff))
+                    out += '\n  --'
             else:
-                alines = self.oldvalue.splitlines()
-                blines = self.newvalue.splitlines()
-                diff = difflib.unified_diff(alines, blines, fieldname, fieldname, lineterm='')
-                out += '\n  '.join(list(diff))
-                out += '\n  --'
+                out = ''
         else:
             out = '%s changed from "%s" to "%s"' % (self.fieldname, self.oldvalue, self.newvalue)
 
@@ -169,7 +172,7 @@ class ChangeRecord:
                 for line in chg._str_internal(False).splitlines():
                     out += '\n  * %s' % line
 
-        return '%s%s' % (prefix, out)
+        return '%s%s' % (prefix, out) if out else ''
 
 class FileChange:
     changetype_add = 'A'
@@ -508,7 +511,8 @@ def compare_siglists(a_blob, b_blob, taskdiff=False):
     return '\n'.join(out)
 
 
-def process_changes(repopath, revision1, revision2='HEAD', report_all=False, report_ver=False, sigs=False, sigsdiff=False):
+def process_changes(repopath, revision1, revision2='HEAD', report_all=False, report_ver=False,
+                    sigs=False, sigsdiff=False, exclude_path=None):
     repo = git.Repo(repopath)
     assert repo.bare == False
     commit = repo.commit(revision1)
@@ -601,6 +605,19 @@ def process_changes(repopath, revision1, revision2='HEAD', report_all=False, rep
                     elif chg.path == chg2.path and chg.path.startswith('packages/') and chg2.fieldname in ['PE', 'PV', 'PR']:
                         chg.related.append(chg2)
 
+    # filter out unwanted paths
+    if exclude_path:
+        for chg in changes:
+            if chg.filechanges:
+                fchgs = []
+                for fchg in chg.filechanges:
+                    for epath in exclude_path:
+                        if fchg.path.startswith(epath):
+                           break
+                    else:
+                        fchgs.append(fchg)
+                chg.filechanges = fchgs
+
     if report_all:
         return changes
     else:
diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index dd9745e..1b2e0d1 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -39,6 +39,8 @@ def main():
     parser.add_option("-S", "--signatures-with-diff",
             help = "Report on actual signature differences instead of output (requires signature data to have been generated, either by running the actual tasks or using bitbake -S)",
             action="store_true", dest="sigsdiff", default=False)
+    parser.add_option("-e", "--exclude-path", action="append",
+            help = "exclude path from the output")
 
     options, args = parser.parse_args(sys.argv)
 
@@ -75,7 +77,7 @@ def main():
         sys.stderr.write("Unable to find bitbake by searching parent directory of this script or PATH\n")
         sys.exit(1)
 
-    import oe.buildhistory_analysis
+    from oe.buildhistory_analysis import process_changes
 
     fromrev = 'build-minus-1'
     torev = 'HEAD'
@@ -92,7 +94,9 @@ def main():
 
     import gitdb
     try:
-        changes = oe.buildhistory_analysis.process_changes(options.buildhistory_dir, fromrev, torev, options.report_all, options.report_ver, options.sigs, options.sigsdiff)
+        changes = process_changes(options.buildhistory_dir, fromrev, torev,
+                                  options.report_all, options.report_ver, options.sigs,
+                                  options.sigsdiff, options.exclude_path)
     except gitdb.exc.BadObject as e:
         if len(args) == 1:
             sys.stderr.write("Unable to find previous build revision in buildhistory repository\n\n")
@@ -102,7 +106,9 @@ def main():
         sys.exit(1)
 
     for chg in changes:
-        print('%s' % chg)
+        out = str(chg)
+        if out:
+            print(out)
 
     sys.exit(0)
 
-- 
2.1.4


