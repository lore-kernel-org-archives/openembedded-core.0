Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D50926013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 21:57:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2DLvsOs018945
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 14:57:54 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Fri, 13 Mar 2015 14:57:54 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Mar 2015 14:57:53 -0700
Message-ID: <1426283873-11784-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] package.bbclass: decouple splitting and stripping
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
X-List-Received-Date: Fri, 13 Mar 2015 21:57:54 -0000
Content-Type: text/plain

Fix logic in split_and_strip_files() to allow splitting or
stripping independently.  We also return quickly from this
function if we have nothing to do.  We seek the following behavior:

Strip / Split     Behavior
yes   / yes       binaries stripped; debug info and source in -dbg
no    / yes       debug info and source in -dbg
yes   / no        binaries stripped; -dbg packages empty
no    / no        -dbg packages empty (not a very useful case)

Currently, no/yes does not work and is the same as no/no.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/package.bbclass |  108 ++++++++++++++++++++++--------------------
 1 file changed, 57 insertions(+), 51 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 9f64ed7..ad8771f 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -812,6 +812,12 @@ python fixup_perms () {
 }
 
 python split_and_strip_files () {
+
+    stripping = d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'
+    splitting = d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', True) != '1'
+    if not (stripping or splitting):
+        return
+
     import stat, errno
 
     dvar = d.getVar('PKGD', True)
@@ -879,64 +885,64 @@ python split_and_strip_files () {
     kernmods = []
     libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir", True))
     baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir", True))
-    if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
-        for root, dirs, files in cpath.walk(dvar):
-            for f in files:
-                file = os.path.join(root, f)
-                if file.endswith(".ko") and file.find("/lib/modules/") != -1:
-                    kernmods.append(file)
-                    continue
 
-                # Skip debug files
-                if debugappend and file.endswith(debugappend):
-                    continue
-                if debugdir and debugdir in os.path.dirname(file[len(dvar):]):
-                    continue
+    for root, dirs, files in cpath.walk(dvar):
+        for f in files:
+            file = os.path.join(root, f)
+            if file.endswith(".ko") and file.find("/lib/modules/") != -1:
+                kernmods.append(file)
+                continue
 
-                try:
-                    ltarget = cpath.realpath(file, dvar, False)
-                    s = cpath.lstat(ltarget)
-                except OSError as e:
-                    (err, strerror) = e.args
-                    if err != errno.ENOENT:
-                        raise
-                    # Skip broken symlinks
-                    continue
-                if not s:
+            # Skip debug files
+            if debugappend and file.endswith(debugappend):
+                continue
+            if debugdir and debugdir in os.path.dirname(file[len(dvar):]):
+                continue
+
+            try:
+                ltarget = cpath.realpath(file, dvar, False)
+                s = cpath.lstat(ltarget)
+            except OSError as e:
+                (err, strerror) = e.args
+                if err != errno.ENOENT:
+                    raise
+                # Skip broken symlinks
+                continue
+            if not s:
+                continue
+            # Check its an excutable
+            if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
+                    or ((file.startswith(libdir) or file.startswith(baselibdir)) and ".so" in f):
+                # If it's a symlink, and points to an ELF file, we capture the readlink target
+                if cpath.islink(file):
+                    target = os.readlink(file)
+                    if isELF(ltarget):
+                        #bb.note("Sym: %s (%d)" % (ltarget, isELF(ltarget)))
+                        symlinks[file] = target
                     continue
-                # Check its an excutable
-                if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
-                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and ".so" in f):
-                    # If it's a symlink, and points to an ELF file, we capture the readlink target
-                    if cpath.islink(file):
-                        target = os.readlink(file)
-                        if isELF(ltarget):
-                            #bb.note("Sym: %s (%d)" % (ltarget, isELF(ltarget)))
-                            symlinks[file] = target
+                # It's a file (or hardlink), not a link
+                # ...but is it ELF, and is it already stripped?
+                elf_file = isELF(file)
+                if elf_file & 1:
+                    if elf_file & 2:
+                        if 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn, True) or "").split():
+                            bb.note("Skipping file %s from %s for already-stripped QA test" % (file[len(dvar):], pn))
+                        else:
+                            msg = "File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn)
+                            package_qa_handle_error("already-stripped", msg, d)
                         continue
-                    # It's a file (or hardlink), not a link
-                    # ...but is it ELF, and is it already stripped?
-                    elf_file = isELF(file)
-                    if elf_file & 1:
-                        if elf_file & 2:
-                            if 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn, True) or "").split():
-                                bb.note("Skipping file %s from %s for already-stripped QA test" % (file[len(dvar):], pn))
-                            else:
-                                msg = "File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn)
-                                package_qa_handle_error("already-stripped", msg, d)
-                            continue
-                        # Check if it's a hard link to something else
-                        if s.st_nlink > 1:
-                            file_reference = "%d_%d" % (s.st_dev, s.st_ino)
-                            # Hard link to something else
-                            hardlinks[file] = file_reference
-                            continue
-                        elffiles[file] = elf_file
+                    # Check if it's a hard link to something else
+                    if s.st_nlink > 1:
+                        file_reference = "%d_%d" % (s.st_dev, s.st_ino)
+                        # Hard link to something else
+                        hardlinks[file] = file_reference
+                        continue
+                    elffiles[file] = elf_file
 
     #
     # First lets process debug splitting
     #
-    if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', True) != '1'):
+    if splitting:
         hardlinkmap = {}
         # For hardlinks, process only one of the files
         for file in hardlinks:
@@ -1008,7 +1014,7 @@ python split_and_strip_files () {
     #
     # Now lets go back over things and strip them
     #
-    if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
+    if stripping:
         strip = d.getVar("STRIP", True)
         sfiles = []
         for file in elffiles:
-- 
1.7.9.5


