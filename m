Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.939.1595267802971882117
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 10:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SuXxHyEN;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id t27so14056037ill.9
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2020 10:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WwlBL3CCL3/mx0Q8BuBjvBAeVAdY28tcXcg1btOY14c=;
        b=SuXxHyENrhZnEqTMuKsklbqDTXCrbHFT1Cwkqyaqs/COLkPli5/j/12xbFC2hBdwvN
         5UP8wHFcNr3mfuveRO8OHV4BwvfBMacT8lkVI6ItETRsyY7fqvMcR+iCgASCnXEG8sBh
         3ZwEdR3Q5QNPJxyJGe0/k6B6Kzrsq6YfSpshLCJow39ajss43qZp2Ngwa/Ni6u/cnTcW
         ItYMQIB+30f+r+b2U/Tb7zKASl85zWrNTmb51dyVzgg18dwsvreGKAXdp0KKdeCNNBCI
         Ff3OJlJp41G4JsFH63J3RPEui395oWXPlQHsIw6akYIpWICudlKTHZ0vGU/C0BEhsY2F
         UNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WwlBL3CCL3/mx0Q8BuBjvBAeVAdY28tcXcg1btOY14c=;
        b=FpVI9+jwM0x7X+USlKWXOFRePlw9FBnBsBAK1nwtQCDY119MYdZpR6aaOzkB3u6TyF
         FwEVHZhSlCpHeysbWCHe4tGpiUMWBm/9/OwxMRAPzH+GILqj1gVYV5zxC+k/s83+rSr3
         4nyvLpD9MZ/YBmjblwTTvG0wHjPpgwlnOM878TTzQV5KDrm3znX+pTONVTXSMVojXza0
         5VJNjJTyTUfLHY2JpbL+GDna40FV8RasUMqIZELqK6zRlHzMpzSnSaT/C9nUX3VRGgH/
         NZWX2rvcDyb06jbw5mWuj6plt7L/hUioce74mBh77fzo+e8hS+Hdp63pvU8kTbxJpHBN
         xFog==
X-Gm-Message-State: AOAM533Gst32Y1U+pXd75XNikyEDVdPWOcHiBMGF34GZUXsSws3i6dZg
	t9/5lIETC4toDr5RP2RMFB2Nis2HXIc=
X-Google-Smtp-Source: ABdhPJxX3uKCYa4AyLv1SoEKt+5YbyZxU81nW1rxPrdUZD9EYOWVbEsXbCrJ6NAGe27y1kLIWPzZHQ==
X-Received: by 2002:a92:340d:: with SMTP id b13mr25354759ila.78.1595267802005;
        Mon, 20 Jul 2020 10:56:42 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:c488:d9d1:f30d:969e])
        by smtp.gmail.com with ESMTPSA id c7sm9400006ilo.85.2020.07.20.10.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 10:56:41 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/2] classes/reproducible: Move to library code
Date: Mon, 20 Jul 2020 12:56:31 -0500
Message-Id: <20200720175632.25568-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720175632.25568-1-JPEWhacker@gmail.com>
References: <20200720175632.25568-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moves most of the python code used for dealing with the source date
epoch to library code.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
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
2.27.0

