Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A6AB277D6D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 04:57:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 06 Apr 2017 21:57:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,162,1488873600"; d="scan'208";a="1132406894"
Received: from anatara2-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.141.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2017 21:57:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 16:57:20 +1200
Message-Id: <ce2575363730578ac0138017872c3fa4cb3977d0.1491540566.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1491540566.git.paul.eggleton@linux.intel.com>
References: <cover.1491540566.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/6] buildhistory-diff: add option to compare task signature list
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
X-List-Received-Date: Fri, 07 Apr 2017 04:57:34 -0000

Having added writing out of the task signature list to buildhistory
(when BUILDHISTORY_FEATURES includes "task"), we now need a way to
compare the list. This just shows which tasks have been added / changed
signature / removed.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py | 49 ++++++++++++++++++++++++++++++++++--
 meta/lib/oe/sstatesig.py             |  6 ++---
 scripts/buildhistory-diff            |  5 +++-
 3 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 19b3bc4..449446f 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -1,6 +1,6 @@
 # Report significant differences in the buildhistory repository since a specific revision
 #
-# Copyright (C) 2012 Intel Corporation
+# Copyright (C) 2012-2013, 2016-2017 Intel Corporation
 # Author: Paul Eggleton <paul.eggleton@linux.intel.com>
 #
 # Note: requires GitPython 0.3.1+
@@ -410,13 +410,58 @@ def compare_dict_blobs(path, ablob, bblob, report_all, report_ver):
     return changes
 
 
-def process_changes(repopath, revision1, revision2='HEAD', report_all=False, report_ver=False):
+def compare_siglists(a_blob, b_blob):
+    # FIXME collapse down a recipe's tasks?
+    alines = a_blob.data_stream.read().decode('utf-8').splitlines()
+    blines = b_blob.data_stream.read().decode('utf-8').splitlines()
+    keys = []
+    pnmap = {}
+    def readsigs(lines):
+        sigs = {}
+        for line in lines:
+            linesplit = line.split()
+            if len(linesplit) > 2:
+                sigs[linesplit[0]] = linesplit[2]
+                if not linesplit[0] in keys:
+                    keys.append(linesplit[0])
+                pnmap[linesplit[1]] = linesplit[0].rsplit('.', 1)[0]
+        return sigs
+    adict = readsigs(alines)
+    bdict = readsigs(blines)
+    out = []
+    changecount = 0
+    addcount = 0
+    removecount = 0
+    for key in keys:
+        siga = adict.get(key, None)
+        sigb = bdict.get(key, None)
+        if siga is not None and sigb is not None and siga != sigb:
+            out.append('%s changed from %s to %s' % (key, siga, sigb))
+            changecount += 1
+        elif siga is None:
+            out.append('%s was added' % key)
+            addcount += 1
+        elif sigb is None:
+            removecount += 1
+            out.append('%s was removed' % key)
+    out.append('Summary: %d tasks added, %d tasks removed, %d tasks modified (%.1f%%)' % (addcount, removecount, changecount, (changecount / float(len(bdict)) * 100)))
+    return '\n'.join(out)
+
+
+def process_changes(repopath, revision1, revision2='HEAD', report_all=False, report_ver=False, sigs=False):
     repo = git.Repo(repopath)
     assert repo.bare == False
     commit = repo.commit(revision1)
     diff = commit.diff(revision2)
 
     changes = []
+
+    if sigs:
+        for d in diff.iter_change_type('M'):
+            if d.a_blob.path == 'siglist.txt':
+                changes.append(compare_siglists(d.a_blob, d.b_blob))
+        return changes
+
     for d in diff.iter_change_type('M'):
         path = os.path.dirname(d.a_blob.path)
         if path.startswith('packages/'):
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 56b33ba..d5377db 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -217,9 +217,9 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
             for taskitem in self.taskhash:
                 (fn, task) = taskitem.rsplit(".", 1)
                 pn = self.lockedpnmap[fn]
-                tasks.append((pn, task, self.taskhash[taskitem]))
-            for (pn, task, taskhash) in sorted(tasks):
-                f.write('%s.%s %s\n' % (pn, task, taskhash))
+                tasks.append((pn, task, fn, self.taskhash[taskitem]))
+            for (pn, task, fn, taskhash) in sorted(tasks):
+                f.write('%s.%s %s %s\n' % (pn, task, fn, taskhash))
 
     def checkhashes(self, missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d):
         warn_msgs = []
diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index e03ccc5..e8e3e11 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -33,6 +33,9 @@ def main():
     parser.add_option("-a", "--report-all",
             help = "Report all changes, not just the default significant ones",
             action="store_true", dest="report_all", default=False)
+    parser.add_option("-s", "--signatures",
+            help = "Report on signature differences instead of output",
+            action="store_true", dest="sigs", default=False)
 
     options, args = parser.parse_args(sys.argv)
 
@@ -86,7 +89,7 @@ def main():
 
     import gitdb
     try:
-        changes = oe.buildhistory_analysis.process_changes(options.buildhistory_dir, fromrev, torev, options.report_all, options.report_ver)
+        changes = oe.buildhistory_analysis.process_changes(options.buildhistory_dir, fromrev, torev, options.report_all, options.report_ver, options.sigs)
     except gitdb.exc.BadObject as e:
         if len(args) == 1:
             sys.stderr.write("Unable to find previous build revision in buildhistory repository\n\n")
-- 
2.9.3


