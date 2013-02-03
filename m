Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U29fG-0002bf-KC
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 01:12:07 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401FqH020478; Mon, 4 Feb 2013 00:01:18 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7T897fj4PrKY; Mon,  4 Feb 2013 00:01:18 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401CZi020457
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Feb 2013 00:01:13 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U29Pk-0000Xw-BJ; Sun, 03 Feb 2013 23:56:00 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 23:55:43 +0000
Message-Id: <11d3a4a06b141fc8b085baddb2195879fa7b8a03.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
References: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 13/22] package.bbclass: Rewrite split_and_strip_files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 00:12:40 -0000

The split_and_strip_files funciton was hard to follow and its usage of prefixes
to strings was unusual. This rewrites it to use a list of hardlinks, symlinks and
elffiles where each list is iterated over at the correct point.

This means we can avoid creating dandling symlinks for example so we can simply
delete the cleanup code for this.

The isfile() check is also removed which gives a significant improvement in speed.
Its uneeded since os.walk will have already checked things in files are files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |  205 ++++++++++++++++++++----------------------
 1 file changed, 97 insertions(+), 108 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index bee6548..7e45655 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -722,8 +722,9 @@ python split_and_strip_files () {
     #
     # First lets figure out all of the files we may have to process ... do this only once!
     #
-    file_list = {}
-    file_links = {}
+    elffiles = {}
+    symlinks = {}
+    hardlinks = {}
     kernmods = []
     if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', True) != '1') and \
             (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
@@ -734,119 +735,108 @@ python split_and_strip_files () {
                     kernmods.append(file)
                     continue
 
-                # Only process files (and symlinks)... Skip files that are obviously debug files
-                if not (debugappend != "" and file.endswith(debugappend)) and \
-                   not (debugdir != "" and debugdir in os.path.dirname(file[len(dvar):])) and \
-                   os.path.isfile(file):
-                    try:
-                        s = os.stat(file)
-                    except OSError, (err, strerror):
-                        if err != errno.ENOENT:
-                            raise
-                        # Skip broken symlinks
+                # Skip debug files
+                if debugappend and file.endswith(debugappend):
+                    continue
+                if debugdir and debugdir in os.path.dirname(file[len(dvar):]):
+                    continue
+
+                try:
+                    s = os.stat(file)
+                except OSError, (err, strerror):
+                    if err != errno.ENOENT:
+                        raise
+                    # Skip broken symlinks
+                    continue
+                # Check its an excutable
+                if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH):
+                    # If it's a symlink, and points to an ELF file, we capture the readlink target
+                    if os.path.islink(file):
+                        target = os.readlink(file)
+                        if not os.path.isabs(target):
+                            ltarget = os.path.join(os.path.dirname(file), target)
+                        else:
+                            ltarget = target
+
+                        if isELF(ltarget):
+                            #bb.note("Sym: %s (%d)" % (ltarget, isELF(ltarget)))
+                            symlinks[file] = target
                         continue
-                    # Is the item excutable?  Then we need to process it.
-                    if (s[stat.ST_MODE] & stat.S_IXUSR) or \
-                       (s[stat.ST_MODE] & stat.S_IXGRP) or \
-                       (s[stat.ST_MODE] & stat.S_IXOTH):
-                        # If it's a symlink, and points to an ELF file, we capture the readlink target
-                        if os.path.islink(file):
-                            target = os.readlink(file)
-                            if not os.path.isabs(target):
-                                ltarget = os.path.join(os.path.dirname(file), target)
-                            else:
-                                ltarget = target
-
-                            if isELF(ltarget):
-                                #bb.note("Sym: %s (%d)" % (ltarget, isELF(ltarget)))
-                                file_list[file] = "sym: " + target
+                    # It's a file (or hardlink), not a link
+                    # ...but is it ELF, and is it already stripped?
+                    elf_file = isELF(file)
+                    if elf_file & 1:
+                        if elf_file & 2:
+                            bb.warn("File '%s' from %s was already stripped, this will prevent future debugging!" % (src, pn))
                             continue
-                        # It's a file (or hardlink), not a link
-                        # ...but is it ELF, and is it already stripped?
-                        elf_file = isELF(file)
-                        if elf_file & 1:
-                            # Check if it's a hard link to something else
-                            if s.st_nlink > 1:
-                                file_reference = "%d_%d" % (s.st_dev, s.st_ino)
-                                # Hard link to something else
-                                file_list[file] = "hard: " + file_reference
-                                continue
-
-                            file_list[file] = "ELF: %d" % elf_file
-
+                        # Check if it's a hard link to something else
+                        if s.st_nlink > 1:
+                            file_reference = "%d_%d" % (s.st_dev, s.st_ino)
+                            # Hard link to something else
+                            hardlinks[file] = file_reference
+                            continue
+                        elffiles[file] = elf_file
 
     #
     # First lets process debug splitting
     #
     if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', True) != '1'):
-        for file in file_list:
+        hardlinkmap = {}
+        # For hardlinks, process only one of the files
+        for file in hardlinks:
+            file_reference = hardlinks[file]
+            if file_reference not in hardlinkmap:
+                # If this is a new file, add it as a reference, and
+                # update it's type, so we can fall through and split
+                elffiles[file] = isELF(file)
+                hardlinkmap[file_reference] = file
+
+        for file in elffiles:
             src = file[len(dvar):]
             dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
             fpath = dvar + dest
-            # Preserve symlinks in debug area...
-            if file_list[file].startswith("sym: "):
-                ltarget = file_list[file][5:]
-                lpath = os.path.dirname(ltarget)
-                lbase = os.path.basename(ltarget)
-                ftarget = ""
-                if lpath and lpath != ".":
-                    ftarget += lpath + debugdir + "/"
-                ftarget += lbase + debugappend
-                if lpath.startswith(".."):
-                    ftarget = os.path.join("..", ftarget)
-                bb.mkdirhier(os.path.dirname(fpath))
-                #bb.note("Symlink %s -> %s" % (fpath, ftarget))
-                os.symlink(ftarget, fpath)
-                continue
 
-            # Preserve hard links in debug area...
-            file_reference = ""
-            if file_list[file].startswith("hard: "):
-                file_reference = file_list[file][6:]
-                if file_reference not in file_links:
-                    # If this is a new file, add it as a reference, and
-                    # update it's type, so we can fall through and split
-                    file_list[file] = "ELF: %d" % (isELF(file))
-                else:
-                    target = file_links[file_reference][len(dvar):]
-                    ftarget = dvar + debuglibdir + os.path.dirname(target) + debugdir + "/" + os.path.basename(target) + debugappend
-                    bb.mkdirhier(os.path.dirname(fpath))
-                    #bb.note("Link %s -> %s" % (fpath, ftarget))
-                    os.link(ftarget, fpath)
-                    continue
-
-            # It's ELF...
-            if file_list[file].startswith("ELF: "):
-                elf_file = int(file_list[file][5:])
-                if elf_file & 2:
-                    bb.warn("File '%s' from %s was already stripped, this will prevent future debugging!" % (src, pn))
-                    continue
+            # Split the file...
+            bb.utils.mkdirhier(os.path.dirname(fpath))
+            #bb.note("Split %s -> %s" % (file, fpath))
+            # Only store off the hard link reference if we successfully split!
+            splitdebuginfo(file, fpath, debugsrcdir, d)
+
+        # Hardlink our debug symbols to the other hardlink copies
+        for file in hardlinks:
+            if file not in elffiles:
+                file_reference = hardlinks[file]
+                target = hardlinkmap[file_reference][len(dvar):]
+                ftarget = dvar + debuglibdir + os.path.dirname(target) + debugdir + "/" + os.path.basename(target) + debugappend
+                bb.utils.mkdirhier(os.path.dirname(fpath))
+                #bb.note("Link %s -> %s" % (fpath, ftarget))
+                os.link(ftarget, fpath)
+
+        # Create symlinks for all cases we were able to split symbols
+        for file in symlinks:
+            src = file[len(dvar):]
+            dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
+            fpath = dvar + dest
+            # Skip it if the target doesn't exist
+            try:
+                s = os.stat(fpath)
+            except OSError, (err, strerror):
+                if err != errno.ENOENT:
+                    raise
+                continue
 
-                # Split the file...
-                bb.mkdirhier(os.path.dirname(fpath))
-                #bb.note("Split %s -> %s" % (file, fpath))
-                # Only store off the hard link reference if we successfully split!
-                if splitdebuginfo(file, fpath, debugsrcdir, d) == 0 and file_reference != "":
-                    file_links[file_reference] = file
-
-        # The above may have generated dangling symlinks, remove them!
-        # Dangling symlinks are a result of something NOT being split, such as a stripped binary.
-        # This should be a rare occurance, but we want to clean up anyway.
-        for file in file_list:
-            if file_list[file].startswith("sym: "):
-                src = file[len(dvar):]
-                dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
-                fpath = dvar + dest
-                try:
-                    s = os.stat(fpath)
-                except OSError, (err, strerror):
-                    if err != errno.ENOENT:
-                        raise
-                    #bb.note("Remove dangling link %s -> %s" % (fpath, os.readlink(fpath)))
-                    os.unlink(fpath)
-                    # This could leave an empty debug directory laying around
-                    # take care of the obvious case...
-                    subprocess.call("rmdir %s 2>/dev/null" % os.path.dirname(fpath), shell=True)
+            ltarget = symlinks[file]
+            lpath = os.path.dirname(ltarget)
+            lbase = os.path.basename(ltarget)
+            ftarget = ""
+            if lpath and lpath != ".":
+                ftarget += lpath + debugdir + "/"
+            ftarget += lbase + debugappend
+            if lpath.startswith(".."):
+                ftarget = os.path.join("..", ftarget)
+            bb.utils.mkdirhier(os.path.dirname(fpath))
+            #bb.note("Symlink %s -> %s" % (fpath, ftarget))
+            os.symlink(ftarget, fpath)
 
         # Process the debugsrcdir if requested...
         # This copies and places the referenced sources for later debugging...
@@ -861,11 +851,10 @@ python split_and_strip_files () {
     if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
         strip = d.getVar("STRIP", True)
         sfiles = []
-        for file in file_list:
-            if file_list[file].startswith("ELF: "):
-                elf_file = int(file_list[file][5:])
-                #bb.note("Strip %s" % file)
-                sfiles.append((file, elf_file, strip))
+        for file in elffiles:
+            elf_file = int(elffiles[file])
+            #bb.note("Strip %s" % file)
+            sfiles.append((file, elf_file, strip))
         for f in kernmods:
             sfiles.append((f, 16, strip))
 
-- 
1.7.10.4



