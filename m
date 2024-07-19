Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62733C3DA70
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 18:58:27 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.25840.1721415502922870427
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 11:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46JIwJ5s006175;
	Fri, 19 Jul 2024 13:58:20 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com
Subject: [PATCH v3 2/3] package.py: Fix static library processing
Date: Fri, 19 Jul 2024 13:58:17 -0500
Message-Id: <1721415498-29682-3-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721415498-29682-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1721415498-29682-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 18:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202274

From: Mark Hatle <mark.hatle@amd.com>

When PACKAGE_STRIP_STATIC is enabled the system did not pay attention to
hardlinks.  This could trigger a race condition during stripping of static
libraries where multiple strips (through hardlinks) could run at the same
time triggering a truncated or modified file error.

The hardlink breaking code is based on the existing code for elf files, but
due to the nature of the symlinks needed to be done in a separate block of
code.

Add support for static-library debugfs hardlinking through the existing
inode processing code.

Print a note to the logs if the link target can't be found.  This isn't
strictly an error, but may be useful for debugging an issue where a file
isn't present.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/lib/oe/package.py | 56 ++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 235f2d6..c213a9a 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1079,6 +1079,7 @@ def process_split_and_strip_files(d):
             d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT') != '1'):
         checkelf = {}
         checkelflinks = {}
+        checkstatic = {}
         for root, dirs, files in cpath.walk(dvar):
             for f in files:
                 file = os.path.join(root, f)
@@ -1092,10 +1093,6 @@ def process_split_and_strip_files(d):
                 if file in skipfiles:
                     continue
 
-                if oe.package.is_static_lib(file):
-                    staticlibs.append(file)
-                    continue
-
                 try:
                     ltarget = cpath.realpath(file, dvar, False)
                     s = cpath.lstat(ltarget)
@@ -1107,6 +1104,13 @@ def process_split_and_strip_files(d):
                     continue
                 if not s:
                     continue
+
+                if oe.package.is_static_lib(file):
+                    # Use a reference of device ID and inode number to identify files
+                    file_reference = "%d_%d" % (s.st_dev, s.st_ino)
+                    checkstatic[file] = (file, file_reference)
+                    continue
+
                 # Check its an executable
                 if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) \
                         or (s[stat.ST_MODE] & stat.S_IXOTH) \
@@ -1171,6 +1175,27 @@ def process_split_and_strip_files(d):
                 # Modified the file so clear the cache
                 cpath.updatecache(file)
 
+        # Do the same hardlink processing as above, but for static libraries
+        results = list(checkstatic.keys())
+
+        # As above, sort the results.
+        results.sort(key=lambda x: x[0])
+
+        for file in results:
+            # Use a reference of device ID and inode number to identify files
+            file_reference = checkstatic[file][1]
+            if file_reference in inodes:
+                os.unlink(file)
+                os.link(inodes[file_reference][0], file)
+                inodes[file_reference].append(file)
+            else:
+                inodes[file_reference] = [file]
+                # break hardlink
+                bb.utils.break_hardlinks(file)
+                staticlibs.append(file)
+            # Modified the file so clear the cache
+            cpath.updatecache(file)
+
     def strip_pkgd_prefix(f):
         nonlocal dvar
 
@@ -1209,11 +1234,24 @@ def process_split_and_strip_files(d):
                 dest = dv["libdir"] + os.path.dirname(src) + dv["dir"] + "/" + os.path.basename(target) + dv["append"]
                 fpath = dvar + dest
                 ftarget = dvar + dv["libdir"] + os.path.dirname(target) + dv["dir"] + "/" + os.path.basename(target) + dv["append"]
-                bb.utils.mkdirhier(os.path.dirname(fpath))
-                # Only one hardlink of separated debug info file in each directory
-                if not os.access(fpath, os.R_OK):
-                    #bb.note("Link %s -> %s" % (fpath, ftarget))
-                    os.link(ftarget, fpath)
+                if os.access(ftarget, os.R_OK):
+                    bb.utils.mkdirhier(os.path.dirname(fpath))
+                    # Only one hardlink of separated debug info file in each directory
+                    if not os.access(fpath, os.R_OK):
+                        #bb.note("Link %s -> %s" % (fpath, ftarget))
+                        os.link(ftarget, fpath)
+                elif (d.getVar('PACKAGE_DEBUG_STATIC_SPLIT') == '1'):
+                    deststatic = dv["staticlibdir"] + os.path.dirname(src) + dv["staticdir"] + "/" + os.path.basename(file) + dv["staticappend"]
+                    fpath = dvar + deststatic
+                    ftarget = dvar + dv["staticlibdir"] + os.path.dirname(target) + dv["staticdir"] + "/" + os.path.basename(target) + dv["staticappend"]
+                    if os.access(ftarget, os.R_OK):
+                        bb.utils.mkdirhier(os.path.dirname(fpath))
+                        # Only one hardlink of separated debug info file in each directory
+                        if not os.access(fpath, os.R_OK):
+                            #bb.note("Link %s -> %s" % (fpath, ftarget))
+                            os.link(ftarget, fpath)
+                else:
+                    bb.note("Unable to find inode link target %s" % (target))
 
         # Create symlinks for all cases we were able to split symbols
         for file in symlinks:
-- 
1.8.3.1


