Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id BC523616EA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2013 16:03:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 03 Oct 2013 09:03:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1026,1371106800"; d="scan'208";a="404861771"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.147])
	by fmsmga001.fm.intel.com with ESMTP; 03 Oct 2013 09:03:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Oct 2013 17:02:48 +0100
Message-Id: <1380816168-18786-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] classes/package: handle filenames containing wildcards
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
X-List-Received-Date: Thu, 03 Oct 2013 16:03:47 -0000

It is uncommon, but it is possible for upstream sources to contain files
that have wildcard characters in their names (Webmin is an example).
Because we were running glob.glob() on every entry in the list of
entries in FILES and then adding the result to the files list to be
processed, the process would loop infinitely if files whose names
contained wildcard characters were present. Fix this by avoiding
re-processing the output of glob.glob() with itself, and also "escape"
wildcard characters in FILES entries added automatically from
do_split_packages().

Fixes [YOCTO #1676].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package.bbclass | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index c98c6ec..189d9fd 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -183,8 +183,13 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
             else:
                 packages.append(pkg)
         oldfiles = d.getVar('FILES_' + pkg, True)
+        newfile = os.path.join(root, o)
+        # These names will be passed through glob() so if the filename actually
+        # contains * or ? (rare, but possible) we need to handle that specially
+        newfile = newfile.replace('*', '[*]')
+        newfile = newfile.replace('?', '[?]')
         if not oldfiles:
-            the_files = [os.path.join(root, o)]
+            the_files = [newfile]
             if aux_files_pattern:
                 if type(aux_files_pattern) is list:
                     for fp in aux_files_pattern:
@@ -206,7 +211,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
             if postrm:
                 d.setVar('pkg_postrm_' + pkg, postrm)
         else:
-            d.setVar('FILES_' + pkg, oldfiles + " " + os.path.join(root, o))
+            d.setVar('FILES_' + pkg, oldfiles + " " + newfile)
         if callable(hook):
             hook(f, pkg, file_regex, output_pattern, m.group(1))
 
@@ -965,23 +970,28 @@ python populate_packages () {
             msg = "FILES variable for package %s contains '//' which is invalid. Attempting to fix this but you should correct the metadata.\n" % pkg
             package_qa_handle_error("files-invalid", msg, d)
             filesvar.replace("//", "/")
-        files = filesvar.split()
-        for file in files:
+
+        origfiles = filesvar.split()
+        files = []
+        for file in origfiles:
             if os.path.isabs(file):
                 file = '.' + file
             if not file.startswith("./"):
                 file = './' + file
+            globbed = glob.glob(file)
+            if globbed:
+                if [ file ] != globbed:
+                    files += globbed
+                    continue
+            files.append(file)
+
+        for file in files:
             if not cpath.islink(file):
                 if cpath.isdir(file):
                     newfiles =  [ os.path.join(file,x) for x in os.listdir(file) ]
                     if newfiles:
                         files += newfiles
                         continue
-            globbed = glob.glob(file)
-            if globbed:
-                if [ file ] != globbed:
-                    files += globbed
-                    continue
             if (not cpath.islink(file)) and (not cpath.exists(file)):
                 continue
             if file in seen:
-- 
1.8.1.2


