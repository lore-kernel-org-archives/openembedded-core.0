Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id EF62877D6A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 04:57:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 06 Apr 2017 21:57:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,162,1488873600"; d="scan'208";a="1132406921"
Received: from anatara2-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.141.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2017 21:57:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 16:57:21 +1200
Message-Id: <bad4649d3e8a220ea5ed0e1f1addb9a0e07ecbc1.1491540566.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1491540566.git.paul.eggleton@linux.intel.com>
References: <cover.1491540566.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/6] buildhistory-diff: add option to compare actual signature differences
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
X-List-Received-Date: Fri, 07 Apr 2017 04:57:37 -0000

Use the code underpinning bitbake-diffsigs to add an option to
buildhistory-diff to determine and display the differences between the
actual signature inputs, with a twist - we collapse identical
changes across different tasks, showing only the most recent task to
have that difference, meaning that there's less noise to wade through
when you just want to know what changed in order to cause some
rebuilding you're seeing.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py | 92 +++++++++++++++++++++++++++++-------
 scripts/buildhistory-diff            |  7 ++-
 2 files changed, 81 insertions(+), 18 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 449446f..3a5b7b6 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -13,7 +13,10 @@ import os.path
 import difflib
 import git
 import re
+import hashlib
+import collections
 import bb.utils
+import bb.tinfoil
 
 
 # How to display fields
@@ -410,7 +413,7 @@ def compare_dict_blobs(path, ablob, bblob, report_all, report_ver):
     return changes
 
 
-def compare_siglists(a_blob, b_blob):
+def compare_siglists(a_blob, b_blob, taskdiff=False):
     # FIXME collapse down a recipe's tasks?
     alines = a_blob.data_stream.read().decode('utf-8').splitlines()
     blines = b_blob.data_stream.read().decode('utf-8').splitlines()
@@ -429,26 +432,83 @@ def compare_siglists(a_blob, b_blob):
     adict = readsigs(alines)
     bdict = readsigs(blines)
     out = []
+
     changecount = 0
     addcount = 0
     removecount = 0
-    for key in keys:
-        siga = adict.get(key, None)
-        sigb = bdict.get(key, None)
-        if siga is not None and sigb is not None and siga != sigb:
-            out.append('%s changed from %s to %s' % (key, siga, sigb))
-            changecount += 1
-        elif siga is None:
-            out.append('%s was added' % key)
-            addcount += 1
-        elif sigb is None:
-            removecount += 1
-            out.append('%s was removed' % key)
+    if taskdiff:
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=True)
+
+            changes = collections.OrderedDict()
+
+            def compare_hashfiles(pn, taskname, hash1, hash2):
+                hashes = [hash1, hash2]
+                hashfiles = bb.siggen.find_siginfo(pn, taskname, hashes, tinfoil.config_data)
+
+                if not taskname:
+                    (pn, taskname) = pn.rsplit('.', 1)
+                    pn = pnmap.get(pn, pn)
+                desc = '%s.%s' % (pn, taskname)
+
+                if len(hashfiles) == 0:
+                    out.append("Unable to find matching sigdata for %s with hashes %s or %s" % (desc, hash1, hash2))
+                elif not hash1 in hashfiles:
+                    out.append("Unable to find matching sigdata for %s with hash %s" % (desc, hash1))
+                elif not hash2 in hashfiles:
+                    out.append("Unable to find matching sigdata for %s with hash %s" % (desc, hash2))
+                else:
+                    out2 = bb.siggen.compare_sigfiles(hashfiles[hash1], hashfiles[hash2], recursecb, collapsed=True)
+                    for line in out2:
+                        m = hashlib.sha256()
+                        m.update(line.encode('utf-8'))
+                        entry = changes.get(m.hexdigest(), (line, []))
+                        if desc not in entry[1]:
+                            changes[m.hexdigest()] = (line, entry[1] + [desc])
+
+            # Define recursion callback
+            def recursecb(key, hash1, hash2):
+                compare_hashfiles(key, None, hash1, hash2)
+                return []
+
+            for key in keys:
+                siga = adict.get(key, None)
+                sigb = bdict.get(key, None)
+                if siga is not None and sigb is not None and siga != sigb:
+                    changecount += 1
+                    (pn, taskname) = key.rsplit('.', 1)
+                    compare_hashfiles(pn, taskname, siga, sigb)
+                elif siga is None:
+                    addcount += 1
+                elif sigb is None:
+                    removecount += 1
+        for key, item in changes.items():
+            line, tasks = item
+            if len(tasks) == 1:
+                desc = tasks[0]
+            elif len(tasks) == 2:
+                desc = '%s and %s' % (tasks[0], tasks[1])
+            else:
+                desc = '%s and %d others' % (tasks[-1], len(tasks)-1)
+            out.append('%s: %s' % (desc, line))
+    else:
+        for key in keys:
+            siga = adict.get(key, None)
+            sigb = bdict.get(key, None)
+            if siga is not None and sigb is not None and siga != sigb:
+                out.append('%s changed from %s to %s' % (key, siga, sigb))
+                changecount += 1
+            elif siga is None:
+                out.append('%s was added' % key)
+                addcount += 1
+            elif sigb is None:
+                out.append('%s was removed' % key)
+                removecount += 1
     out.append('Summary: %d tasks added, %d tasks removed, %d tasks modified (%.1f%%)' % (addcount, removecount, changecount, (changecount / float(len(bdict)) * 100)))
     return '\n'.join(out)
 
 
-def process_changes(repopath, revision1, revision2='HEAD', report_all=False, report_ver=False, sigs=False):
+def process_changes(repopath, revision1, revision2='HEAD', report_all=False, report_ver=False, sigs=False, sigsdiff=False):
     repo = git.Repo(repopath)
     assert repo.bare == False
     commit = repo.commit(revision1)
@@ -456,10 +516,10 @@ def process_changes(repopath, revision1, revision2='HEAD', report_all=False, rep
 
     changes = []
 
-    if sigs:
+    if sigs or sigsdiff:
         for d in diff.iter_change_type('M'):
             if d.a_blob.path == 'siglist.txt':
-                changes.append(compare_siglists(d.a_blob, d.b_blob))
+                changes.append(compare_siglists(d.a_blob, d.b_blob, taskdiff=sigsdiff))
         return changes
 
     for d in diff.iter_change_type('M'):
diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index e8e3e11..dd9745e 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -34,8 +34,11 @@ def main():
             help = "Report all changes, not just the default significant ones",
             action="store_true", dest="report_all", default=False)
     parser.add_option("-s", "--signatures",
-            help = "Report on signature differences instead of output",
+            help = "Report list of signatures differing instead of output",
             action="store_true", dest="sigs", default=False)
+    parser.add_option("-S", "--signatures-with-diff",
+            help = "Report on actual signature differences instead of output (requires signature data to have been generated, either by running the actual tasks or using bitbake -S)",
+            action="store_true", dest="sigsdiff", default=False)
 
     options, args = parser.parse_args(sys.argv)
 
@@ -89,7 +92,7 @@ def main():
 
     import gitdb
     try:
-        changes = oe.buildhistory_analysis.process_changes(options.buildhistory_dir, fromrev, torev, options.report_all, options.report_ver, options.sigs)
+        changes = oe.buildhistory_analysis.process_changes(options.buildhistory_dir, fromrev, torev, options.report_all, options.report_ver, options.sigs, options.sigsdiff)
     except gitdb.exc.BadObject as e:
         if len(args) == 1:
             sys.stderr.write("Unable to find previous build revision in buildhistory repository\n\n")
-- 
2.9.3


