Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6939A740AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 18:01:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 May 2015 11:01:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,430,1427785200"; d="scan'208";a="694972262"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.30.48])
	by orsmga001.jf.intel.com with ESMTP; 14 May 2015 11:01:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2015 19:01:41 +0100
Message-Id: <ed6b0fdb2867ce67836990bc6d12a7269ef1cd69.1431626401.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431626401.git.paul.eggleton@linux.intel.com>
References: <cover.1431626401.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1431626401.git.paul.eggleton@linux.intel.com>
References: <cover.1431626401.git.paul.eggleton@linux.intel.com>
Subject: [dizzy][PATCH 2/2] split_and_strip_files: regroup hardlinks to make build deterministic
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
X-List-Received-Date: Thu, 14 May 2015 18:01:56 -0000

From: Ed Bartosh <ed.bartosh@linux.intel.com>

Reverted 7c0fd561bad0250a00cef63e3d787573112a59cf

Created separate group of hardlinks for the files inside
the same package. This should prevent stripped files to be
populated outside of package directories.

This turns out not to be straightforward and has overlap with the
other hardlink handling code in this area. The code is condensed
into a more concise and documented form.

[Original patch from Ed with tweaks from RP]

[YOCTO #7586]

(From OE-Core master rev: 82d00f7254b7d3bb6a167d675d798134884d1b19)

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 48 ++++++++++++++++++++++++--------------------
 meta/lib/oe/package.py       |  3 +--
 2 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4cddbef..b81f4f9 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -815,8 +815,8 @@ python split_and_strip_files () {
     #
     elffiles = {}
     symlinks = {}
-    hardlinks = {}
     kernmods = []
+    inodes = {}
     libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir", True))
     baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir", True))
     if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
@@ -854,6 +854,7 @@ python split_and_strip_files () {
                             #bb.note("Sym: %s (%d)" % (ltarget, isELF(ltarget)))
                             symlinks[file] = target
                         continue
+
                     # It's a file (or hardlink), not a link
                     # ...but is it ELF, and is it already stripped?
                     elf_file = isELF(file)
@@ -865,28 +866,30 @@ python split_and_strip_files () {
                                 msg = "File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn)
                                 package_qa_handle_error("already-stripped", msg, d)
                             continue
-                        # Check if it's a hard link to something else
-                        if s.st_nlink > 1:
-                            file_reference = "%d_%d" % (s.st_dev, s.st_ino)
-                            # Hard link to something else
-                            hardlinks[file] = file_reference
-                            continue
-                        elffiles[file] = elf_file
+
+                        # At this point we have an unstripped elf file. We need to:
+                        #  a) Make sure any file we strip is not hardlinked to anything else outside this tree
+                        #  b) Only strip any hardlinked file once (no races)
+                        #  c) Track any hardlinks between files so that we can reconstruct matching debug file hardlinks
+
+                        # Use a reference of device ID and inode number to indentify files
+                        file_reference = "%d_%d" % (s.st_dev, s.st_ino)
+                        if file_reference in inodes:
+                            os.unlink(file)
+                            os.link(inodes[file_reference][0], file)
+                            inodes[file_reference].append(file)
+                        else:
+                            inodes[file_reference] = [file]
+                            # break hardlink
+                            bb.utils.copyfile(file, file)
+                            elffiles[file] = elf_file
+                        # Modified the file so clear the cache
+                        cpath.updatecache(file)
 
     #
     # First lets process debug splitting
     #
     if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', True) != '1'):
-        hardlinkmap = {}
-        # For hardlinks, process only one of the files
-        for file in hardlinks:
-            file_reference = hardlinks[file]
-            if file_reference not in hardlinkmap:
-                # If this is a new file, add it as a reference, and
-                # update it's type, so we can fall through and split
-                elffiles[file] = isELF(file)
-                hardlinkmap[file_reference] = file
-
         for file in elffiles:
             src = file[len(dvar):]
             dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
@@ -899,13 +902,14 @@ python split_and_strip_files () {
             splitdebuginfo(file, fpath, debugsrcdir, sourcefile, d)
 
         # Hardlink our debug symbols to the other hardlink copies
-        for file in hardlinks:
-            if file not in elffiles:
+        for ref in inodes:
+            if len(inodes[ref]) == 1:
+                continue
+            for file in inodes[ref][1:]:
                 src = file[len(dvar):]
                 dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
                 fpath = dvar + dest
-                file_reference = hardlinks[file]
-                target = hardlinkmap[file_reference][len(dvar):]
+                target = inodes[ref][0][len(dvar):]
                 ftarget = dvar + debuglibdir + os.path.dirname(target) + debugdir + "/" + os.path.basename(target) + debugappend
                 bb.utils.mkdirhier(os.path.dirname(fpath))
                 #bb.note("Link %s -> %s" % (fpath, ftarget))
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index db8dc28..f8b5322 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -30,8 +30,7 @@ def runstrip(arg):
     elif elftype & 8 or elftype & 4:
         extraflags = "--remove-section=.comment --remove-section=.note"
 
-    # Use mv to break hardlinks
-    stripcmd = "'%s' %s '%s' -o '%s.tmp' && chown --reference='%s' '%s.tmp' && mv '%s.tmp' '%s'" % (strip, extraflags, file, file, file, file, file, file)
+    stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
     bb.debug(1, "runstrip: %s" % stripcmd)
 
     ret = subprocess.call(stripcmd, shell=True)
-- 
2.1.0


