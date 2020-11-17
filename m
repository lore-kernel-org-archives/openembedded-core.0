Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web08.16779.1605656895774892341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 15:48:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Htg8zRlc;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id c80so195444oib.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 15:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=p6U0pt995DSk/jSq2mL+vIAId1MGeybI9cYJvKjyieE=;
        b=Htg8zRlcl5VAZK7/Y9T62fbCORmwPkMbX69uLX/4bHkI4wWCGALinoKg9RHZ4JA8YQ
         w3iZ6WmazV3j7DetWzdhCOda5WDc6V4PWK3g/79GB2Doke87MtSIcL8TmcCygN1/b1Ox
         Oekz+Gun9kCjO7dZdbBADwlo21nyd3WazytIo4yQrQkM0YKlNPG4iWV5bnhRt+2QvNc/
         cVNeJgRmzJFEfxEOdnnSwg+7sTxz42aHqgAqIap1iLYdf4u6RNQdKLKFSg9MaATzX3J/
         BBvZGurdacGeg2aImHtu7mNIF4CwJyv6xI0DPddY0ditJhue3skv8bIAPxu3OyhHshNl
         Fokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=p6U0pt995DSk/jSq2mL+vIAId1MGeybI9cYJvKjyieE=;
        b=YN4jdmgFiIbyrDrImPZBlsNqAXon2FGKtYHz0BSTfFL+EwjQVLQwfgz2UOBmOqw/Ap
         EXy8NB/lw5GEJdDlTjmKJ49PBw+s3mrlmddavbeRbiuXUH+GYEn17IgjFsxSc8oG8IB6
         lxXip9XZQcFtilwsyBCXt63FShVQT2HztH6bdhTrtyHo5Q/miJOIHoMhmiFLSDWd0Pgb
         H1vRfBAr0/v0ox5gPll2t3q3D9sbU01IIxjvPdwm/nBtUoGTO57+SR3wP9U+RJ2NNFfa
         loln68SQ25dIfC6iL6U8KFI/iO7n4Q9U3bpbLY/SK1qHW/o1s2WzpJdD3XTBoeFg9HmW
         Tjsw==
X-Gm-Message-State: AOAM533ekZcMDcqtNhWn84+/sL2HcUqdVzUzt1cCmGMciRZWvVzVv5Io
	LQ3+LA7leQwCGzVujOAixy74KQYCvw9d87lT
X-Google-Smtp-Source: ABdhPJwg5XDJWZOEB0lfMUcLetXE2EPnQV6R4NL5lpo7dH2WRnxIkFhUW5XNGCxNMJVJGPHfjwtmQA==
X-Received: by 2002:aca:4257:: with SMTP id p84mr1065433oia.68.1605656894628;
        Tue, 17 Nov 2020 15:48:14 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id s131sm6715936oie.58.2020.11.17.15.48.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 15:48:13 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/9] classes/reproducible: Move to library code
Date: Tue, 17 Nov 2020 13:47:32 -1000
Message-Id: <bb957547fbd3f6670220706642b49fee560c6b75.1605656725.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605656725.git.steve@sakoman.com>
References: <cover.1605656725.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

Moves most of the python code used for dealing with the source date
epoch to library code.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a7ede90955bc0c8bec1cbb3cab498ef2583b2f4e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/reproducible_build.bbclass | 90 +----------------------
 meta/lib/oe/reproducible.py             | 95 +++++++++++++++++++++++++
 2 files changed, 98 insertions(+), 87 deletions(-)
 create mode 100644 meta/lib/oe/reproducible.py

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 8da40f656a..2f3bd90b07 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -70,100 +70,16 @@ do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DEPLOYDIR}"
 addtask do_deploy_source_date_epoch_setscene
 addtask do_deploy_source_date_epoch before do_configure after do_patch
 
-def get_source_date_epoch_from_known_files(d, sourcedir):
-    source_date_epoch = None
-    newest_file = None
-    known_files = set(["NEWS", "ChangeLog", "Changelog", "CHANGES"])
-    for file in known_files:
-        filepath = os.path.join(sourcedir, file)
-        if os.path.isfile(filepath):
-            mtime = int(os.lstat(filepath).st_mtime)
-            # There may be more than one "known_file" present, if so, use the youngest one
-            if not source_date_epoch or mtime > source_date_epoch:
-                source_date_epoch = mtime
-                newest_file = filepath
-    if newest_file:
-        bb.debug(1, "SOURCE_DATE_EPOCH taken from: %s" % newest_file)
-    return source_date_epoch
-
-def find_git_folder(d, sourcedir):
-    # First guess: WORKDIR/git
-    # This is the default git fetcher unpack path
-    workdir = d.getVar('WORKDIR')
-    gitpath = os.path.join(workdir, "git/.git")
-    if os.path.isdir(gitpath):
-        return gitpath
-
-    # Second guess: ${S}
-    gitpath = os.path.join(sourcedir, ".git")
-    if os.path.isdir(gitpath):
-        return gitpath
-
-    # Perhaps there was a subpath or destsuffix specified.
-    # Go looking in the WORKDIR
-    exclude = set(["build", "image", "license-destdir", "patches", "pseudo",
-                   "recipe-sysroot", "recipe-sysroot-native", "sysroot-destdir", "temp"])
-    for root, dirs, files in os.walk(workdir, topdown=True):
-        dirs[:] = [d for d in dirs if d not in exclude]
-        if '.git' in dirs:
-            return root
-
-    bb.warn("Failed to find a git repository in WORKDIR: %s" % workdir)
-    return None
-
-def get_source_date_epoch_from_git(d, sourcedir):
-    source_date_epoch = None
-    if "git://" in d.getVar('SRC_URI'):
-        gitpath = find_git_folder(d, sourcedir)
-        if gitpath:
-            import subprocess
-            source_date_epoch = int(subprocess.check_output(['git','log','-1','--pretty=%ct'], cwd=gitpath))
-            bb.debug(1, "git repository: %s" % gitpath)
-    return source_date_epoch
-
-def get_source_date_epoch_from_youngest_file(d, sourcedir):
-    if sourcedir == d.getVar('WORKDIR'):
-       # These sources are almost certainly not from a tarball
-       return None
-
-    # Do it the hard way: check all files and find the youngest one...
-    source_date_epoch = None
-    newest_file = None
-    for root, dirs, files in os.walk(sourcedir, topdown=True):
-        files = [f for f in files if not f[0] == '.']
-
-        for fname in files:
-            filename = os.path.join(root, fname)
-            try:
-                mtime = int(os.lstat(filename).st_mtime)
-            except ValueError:
-                mtime = 0
-            if not source_date_epoch or mtime > source_date_epoch:
-                source_date_epoch = mtime
-                newest_file = filename
-
-    if newest_file:
-        bb.debug(1, "Newest file found: %s" % newest_file)
-    return source_date_epoch
-
-def fixed_source_date_epoch():
-    bb.debug(1, "No tarball or git repo found to determine SOURCE_DATE_EPOCH")
-    return 0
-
 python create_source_date_epoch_stamp() {
+    import oe.reproducible
+
     epochfile = d.getVar('SDE_FILE')
     # If it exists we need to regenerate as the sources may have changed
     if os.path.isfile(epochfile):
         bb.debug(1, "Deleting existing SOURCE_DATE_EPOCH from: %s" % epochfile)
         os.remove(epochfile)
 
-    sourcedir = d.getVar('S')
-    source_date_epoch = (
-        get_source_date_epoch_from_git(d, sourcedir) or
-        get_source_date_epoch_from_known_files(d, sourcedir) or
-        get_source_date_epoch_from_youngest_file(d, sourcedir) or
-        fixed_source_date_epoch()       # Last resort
-    )
+    source_date_epoch = oe.reproducible.get_source_date_epoch(d, d.getVar('S'))
 
     bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
     bb.utils.mkdirhier(d.getVar('SDE_DIR'))
diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
new file mode 100644
index 0000000000..f80a85ddef
--- /dev/null
+++ b/meta/lib/oe/reproducible.py
@@ -0,0 +1,95 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+import os
+import subprocess
+import bb
+
+def get_source_date_epoch_from_known_files(d, sourcedir):
+    source_date_epoch = None
+    newest_file = None
+    known_files = set(["NEWS", "ChangeLog", "Changelog", "CHANGES"])
+    for file in known_files:
+        filepath = os.path.join(sourcedir, file)
+        if os.path.isfile(filepath):
+            mtime = int(os.lstat(filepath).st_mtime)
+            # There may be more than one "known_file" present, if so, use the youngest one
+            if not source_date_epoch or mtime > source_date_epoch:
+                source_date_epoch = mtime
+                newest_file = filepath
+    if newest_file:
+        bb.debug(1, "SOURCE_DATE_EPOCH taken from: %s" % newest_file)
+    return source_date_epoch
+
+def find_git_folder(d, sourcedir):
+    # First guess: WORKDIR/git
+    # This is the default git fetcher unpack path
+    workdir = d.getVar('WORKDIR')
+    gitpath = os.path.join(workdir, "git/.git")
+    if os.path.isdir(gitpath):
+        return gitpath
+
+    # Second guess: ${S}
+    gitpath = os.path.join(sourcedir, ".git")
+    if os.path.isdir(gitpath):
+        return gitpath
+
+    # Perhaps there was a subpath or destsuffix specified.
+    # Go looking in the WORKDIR
+    exclude = set(["build", "image", "license-destdir", "patches", "pseudo",
+                   "recipe-sysroot", "recipe-sysroot-native", "sysroot-destdir", "temp"])
+    for root, dirs, files in os.walk(workdir, topdown=True):
+        dirs[:] = [d for d in dirs if d not in exclude]
+        if '.git' in dirs:
+            return root
+
+    bb.warn("Failed to find a git repository in WORKDIR: %s" % workdir)
+    return None
+
+def get_source_date_epoch_from_git(d, sourcedir):
+    source_date_epoch = None
+    if "git://" in d.getVar('SRC_URI'):
+        gitpath = find_git_folder(d, sourcedir)
+        if gitpath:
+            import subprocess
+            source_date_epoch = int(subprocess.check_output(['git','log','-1','--pretty=%ct'], cwd=gitpath))
+            bb.debug(1, "git repository: %s" % gitpath)
+    return source_date_epoch
+
+def get_source_date_epoch_from_youngest_file(d, sourcedir):
+    if sourcedir == d.getVar('WORKDIR'):
+       # These sources are almost certainly not from a tarball
+       return None
+
+    # Do it the hard way: check all files and find the youngest one...
+    source_date_epoch = None
+    newest_file = None
+    for root, dirs, files in os.walk(sourcedir, topdown=True):
+        files = [f for f in files if not f[0] == '.']
+
+        for fname in files:
+            filename = os.path.join(root, fname)
+            try:
+                mtime = int(os.lstat(filename).st_mtime)
+            except ValueError:
+                mtime = 0
+            if not source_date_epoch or mtime > source_date_epoch:
+                source_date_epoch = mtime
+                newest_file = filename
+
+    if newest_file:
+        bb.debug(1, "Newest file found: %s" % newest_file)
+    return source_date_epoch
+
+def fixed_source_date_epoch():
+    bb.debug(1, "No tarball or git repo found to determine SOURCE_DATE_EPOCH")
+    return 0
+
+def get_source_date_epoch(d, sourcedir):
+    return (
+        get_source_date_epoch_from_git(d, sourcedir) or
+        get_source_date_epoch_from_known_files(d, sourcedir) or
+        get_source_date_epoch_from_youngest_file(d, sourcedir) or
+        fixed_source_date_epoch()       # Last resort
+    )
+
-- 
2.17.1

