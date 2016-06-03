Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E23E6774AE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 08:17:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 03 Jun 2016 01:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="968070565"
Received: from jlock-mobl2.ger.corp.intel.com ([10.252.11.141])
	by orsmga001.jf.intel.com with ESMTP; 03 Jun 2016 01:17:50 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 09:17:47 +0100
Message-Id: <1464941867-29419-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH] lib/oe/buildhistory_analysis: fix for Python 3
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
X-List-Received-Date: Fri, 03 Jun 2016 08:17:52 -0000

The read method of the data_stream File object now returns bytes,
not a str, so we must decode it.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oe/buildhistory_analysis.py | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 16491a9..4353381 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -190,7 +190,7 @@ class FileChange:
 
 
 def blob_to_dict(blob):
-    alines = [line.decode() for line in blob.data_stream.read().splitlines()]
+    alines = [line for line in blob.data_stream.read().decode('utf-8').splitlines()]
     adict = {}
     for line in alines:
         splitv = [i.strip() for i in line.split('=',1)]
@@ -378,34 +378,34 @@ def process_changes(repopath, revision1, revision2='HEAD', report_all=False, rep
             if filename == 'latest':
                 changes.extend(compare_dict_blobs(path, d.a_blob, d.b_blob, report_all, report_ver))
             elif filename.startswith('latest.'):
-                chg = ChangeRecord(path, filename, d.a_blob.data_stream.read(), d.b_blob.data_stream.read(), True)
+                chg = ChangeRecord(path, filename, d.a_blob.data_stream.read().decode('utf-8'), d.b_blob.data_stream.read().decode('utf-8'), True)
                 changes.append(chg)
         elif path.startswith('images/'):
             filename = os.path.basename(d.a_blob.path)
             if filename in img_monitor_files:
                 if filename == 'files-in-image.txt':
-                    alines = d.a_blob.data_stream.read().splitlines()
-                    blines = d.b_blob.data_stream.read().splitlines()
+                    alines = d.a_blob.data_stream.read().decode('utf-8').splitlines()
+                    blines = d.b_blob.data_stream.read().decode('utf-8').splitlines()
                     filechanges = compare_file_lists(alines,blines)
                     if filechanges:
                         chg = ChangeRecord(path, filename, None, None, True)
                         chg.filechanges = filechanges
                         changes.append(chg)
                 elif filename == 'installed-package-names.txt':
-                    alines = d.a_blob.data_stream.read().splitlines()
-                    blines = d.b_blob.data_stream.read().splitlines()
+                    alines = d.a_blob.data_stream.read().decode('utf-8').splitlines()
+                    blines = d.b_blob.data_stream.read().decode('utf-8').splitlines()
                     filechanges = compare_lists(alines,blines)
                     if filechanges:
                         chg = ChangeRecord(path, filename, None, None, True)
                         chg.filechanges = filechanges
                         changes.append(chg)
                 else:
-                    chg = ChangeRecord(path, filename, d.a_blob.data_stream.read(), d.b_blob.data_stream.read(), True)
+                    chg = ChangeRecord(path, filename, d.a_blob.data_stream.read().decode('utf-8'), d.b_blob.data_stream.read().decode('utf-8'), True)
                     changes.append(chg)
             elif filename == 'image-info.txt':
                 changes.extend(compare_dict_blobs(path, d.a_blob, d.b_blob, report_all, report_ver))
             elif '/image-files/' in path:
-                chg = ChangeRecord(path, filename, d.a_blob.data_stream.read(), d.b_blob.data_stream.read(), True)
+                chg = ChangeRecord(path, filename, d.a_blob.data_stream.read().decode('utf-8'), d.b_blob.data_stream.read().decode('utf-8'), True)
                 changes.append(chg)
 
     # Look for added preinst/postinst/prerm/postrm
@@ -419,7 +419,7 @@ def process_changes(repopath, revision1, revision2='HEAD', report_all=False, rep
             if filename == 'latest':
                 addedpkgs.append(path)
             elif filename.startswith('latest.'):
-                chg = ChangeRecord(path, filename[7:], '', d.b_blob.data_stream.read(), True)
+                chg = ChangeRecord(path, filename[7:], '', d.b_blob.data_stream.read().decode('utf-8'), True)
                 addedchanges.append(chg)
     for chg in addedchanges:
         found = False
@@ -436,7 +436,7 @@ def process_changes(repopath, revision1, revision2='HEAD', report_all=False, rep
         if path.startswith('packages/'):
             filename = os.path.basename(d.a_blob.path)
             if filename != 'latest' and filename.startswith('latest.'):
-                chg = ChangeRecord(path, filename[7:], d.a_blob.data_stream.read(), '', True)
+                chg = ChangeRecord(path, filename[7:], d.a_blob.data_stream.read().decode('utf-8'), '', True)
                 changes.append(chg)
 
     # Link related changes
-- 
2.5.5


