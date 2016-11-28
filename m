Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DC49A71AB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 17:28:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2016 09:28:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,564,1473145200"; d="scan'208";a="1091599848"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 28 Nov 2016 09:28:24 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id A6D3C6A4080;
	Mon, 28 Nov 2016 09:27:40 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 19:28:03 +0200
Message-Id: <1480354083-1495-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] buildhistory-diff: report directory renames
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
X-List-Received-Date: Mon, 28 Nov 2016 17:28:24 -0000

The script detects directory renaming if two different
directories with the same set of files are added and removed.

[YOCTO #10691]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index b6c0265..19b3bc4 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -69,7 +69,22 @@ class ChangeRecord:
                     pkglist.append(k)
             return pkglist
 
+        def detect_renamed_dirs(aitems, bitems):
+            adirs = set(map(os.path.dirname, aitems))
+            bdirs = set(map(os.path.dirname, bitems))
+            files_ab = [(name, sorted(os.path.basename(item) for item in aitems if os.path.dirname(item) == name)) \
+                                for name in adirs - bdirs]
+            files_ba = [(name, sorted(os.path.basename(item) for item in bitems if os.path.dirname(item) == name)) \
+                                for name in bdirs - adirs]
+            renamed_dirs = [(dir1, dir2) for dir1, files1 in files_ab for dir2, files2 in files_ba if files1 == files2]
+            # remove files that belong to renamed dirs from aitems and bitems
+            for dir1, dir2 in renamed_dirs:
+                aitems = [item for item in aitems if os.path.dirname(item) not in (dir1, dir2)]
+                bitems = [item for item in bitems if os.path.dirname(item) not in (dir1, dir2)]
+            return renamed_dirs, aitems, bitems
+
         if self.fieldname in list_fields or self.fieldname in list_order_fields:
+            renamed_dirs = []
             if self.fieldname in ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RREPLACES', 'RCONFLICTS']:
                 (depvera, depverb) = compare_pkg_lists(self.oldvalue, self.newvalue)
                 aitems = pkglist_combine(depvera)
@@ -77,16 +92,29 @@ class ChangeRecord:
             else:
                 aitems = self.oldvalue.split()
                 bitems = self.newvalue.split()
+                if self.fieldname == 'FILELIST':
+                    renamed_dirs, aitems, bitems = detect_renamed_dirs(aitems, bitems)
+
             removed = list(set(aitems) - set(bitems))
             added = list(set(bitems) - set(aitems))
 
+            lines = []
+            if renamed_dirs:
+                for dfrom, dto in renamed_dirs:
+                    lines.append('directory renamed %s -> %s' % (dfrom, dto))
             if removed or added:
                 if removed and not bitems:
-                    out = '%s: removed all items "%s"' % (self.fieldname, ' '.join(removed))
+                    lines.append('removed all items "%s"' % ' '.join(removed))
                 else:
-                    out = '%s:%s%s' % (self.fieldname, ' removed "%s"' % ' '.join(removed) if removed else '', ' added "%s"' % ' '.join(added) if added else '')
+                    if removed:
+                        lines.append('removed "%s"' % ' '.join(removed))
+                    if added:
+                        lines.append('added "%s"' % ' '.join(added))
             else:
-                out = '%s changed order' % self.fieldname
+                lines.append('changed order')
+
+            out = '%s: %s' % (self.fieldname, ', '.join(lines))
+
         elif self.fieldname in numeric_fields:
             aval = int(self.oldvalue or 0)
             bval = int(self.newvalue or 0)
-- 
2.1.4


