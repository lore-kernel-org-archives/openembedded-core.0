Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D5924716CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 09:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3T9en6N022323 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 10:40:49 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id f7OGvbLg24mL
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 10:40:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3T9ebxG022308
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 10:40:48 +0100
Message-ID: <1430300437.19130.10.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 10:40:37 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] split_and_strip_files: regroup hardlinks to make build deterministic
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
X-List-Received-Date: Wed, 29 Apr 2015 09:40:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

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

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f1b966d..5ece69e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -875,8 +875,8 @@ python split_and_strip_files () {
     #
     elffiles = {}
     symlinks = {}
-    hardlinks = {}
     kernmods = []
+    inodes = {}
     libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir", True))
     baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir", True))
     if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
@@ -914,6 +914,7 @@ python split_and_strip_files () {
                             #bb.note("Sym: %s (%d)" % (ltarget, isELF(ltarget)))
                             symlinks[file] = target
                         continue
+
                     # It's a file (or hardlink), not a link
                     # ...but is it ELF, and is it already stripped?
                     elf_file = isELF(file)
@@ -925,28 +926,30 @@ python split_and_strip_files () {
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
@@ -959,13 +962,14 @@ python split_and_strip_files () {
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
index 947a977..f176446 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -30,8 +30,7 @@ def runstrip(arg):
     elif elftype & 8 or elftype & 4:
         extraflags = "--remove-section=.comment --remove-section=.note"
 
-    # Use mv to break hardlinks
-    stripcmd = "'%s' %s '%s' -o '%s.tmp' && chown --reference='%s' '%s.tmp' && mv '%s.tmp' '%s'" % (strip, extraflags, file, file, file, file, file, file)
+    stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
     bb.debug(1, "runstrip: %s" % stripcmd)
 
     try:



