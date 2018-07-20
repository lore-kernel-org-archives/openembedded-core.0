Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 22E93745ED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 10:40:01 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id t13-v6so1429292wrv.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 03:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FBNpRT9CXdFcygGVDqHGw/018cEnVCeafR5ngz8u+Kg=;
	b=ZM+y/R9qV1c0Eet5cGsw9n+DEc8xOJcDHmVwVgIPSobgKnKGq0fQAMV9wNQJLTUcws
	LP9WwfLAGE6Ss6vzkYDKEo8S603t/4xm68+La6tqtC1KjSNdIS9lQMpr5yPsv8Vp6MS5
	mDv7q1i5hMXc44O+A27r0uKiXAtY3VW3UTRqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FBNpRT9CXdFcygGVDqHGw/018cEnVCeafR5ngz8u+Kg=;
	b=IL1Fb1I18lCMsdroABNuEuAfkbxbbUzrAOG34JKlZb9qyXmvFsvYhwy9MS0a8GoAvI
	+AcQ8K2Gz1oqdQPjfNwQsJI40XtXtGR4gpCIruj9QjK1lVX5YRHal0kxPZShoDhqEoqd
	EW1jIl7Y+LWRmb2EiJwyaiwkiB/uFBWNSs9pKLVFiB+CUahKkjhUqd4cFczsCUvqI/Bv
	qEAOqhdvj6le5NdYJek0e15jEyhrxUc6/BLsAPyflMICoHwa80RH28HX7TaRcdt+akEg
	KRW8Sbr6r6D53JZCywqH0ySEYn8AmL69MN+d9B7iQDnETWJssOWXJg+8CeB7H3906lV+
	WA/w==
X-Gm-Message-State: AOUpUlFIG2CnCeIm/no4DLc0Tn+dEq49SH3HQs9TYDP3k7rP8I4MXl9R
	Tf5y5uyee6dGxVwiyvCAQGc4Np0Z2uESgw==
X-Google-Smtp-Source: AAOMgpc4PN2AUVFgDpMl2qb11TV8rxn2gJ6g3hwx6woXdAozxg1wBKiT/2C5iDg4D8WoQ0ZJEWcy2g==
X-Received: by 2002:adf:8481:: with SMTP id 1-v6mr1161147wrg.34.1532083202178; 
	Fri, 20 Jul 2018 03:40:02 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t184-v6sm1204848wmf.18.2018.07.20.03.40.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jul 2018 03:40:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 11:39:47 +0100
Message-Id: <20180720103948.30044-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
References: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 09/10] package: Call file to determine elf status in parallel
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
X-List-Received-Date: Fri, 20 Jul 2018 10:40:02 -0000

This allows the calls to is_elf (which calls file) to happen in parallel
allowing a speedup of do_package and do_populate_sysroot for native
recipes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 85 +++++++++++++++++++++---------------
 meta/lib/oe/package.py       |  8 +++-
 2 files changed, 56 insertions(+), 37 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 222b78fe165..978a8fbeb57 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -949,6 +949,8 @@ python split_and_strip_files () {
     skipfiles = (d.getVar("INHIBIT_PACKAGE_STRIP_FILES") or "").split()
     if (d.getVar('INHIBIT_PACKAGE_STRIP') != '1' or \
             d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT') != '1'):
+        checkelf = {}
+        checkelflinks = {}
         for root, dirs, files in cpath.walk(dvar):
             for f in files:
                 file = os.path.join(root, f)
@@ -982,44 +984,57 @@ python split_and_strip_files () {
                 # Check its an executable
                 if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
                         or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)):
-                    # If it's a symlink, and points to an ELF file, we capture the readlink target
+
                     if cpath.islink(file):
-                        target = os.readlink(file)
-                        if oe.package.is_elf(ltarget):
-                            #bb.note("Sym: %s (%d)" % (ltarget, oe.package.is_elf(ltarget)))
-                            symlinks[file] = target
+                        checkelflinks[file] = ltarget
                         continue
+                    # Use a reference of device ID and inode number to identify files
+                    file_reference = "%d_%d" % (s.st_dev, s.st_ino)
+                    checkelf[file] = (file, file_reference)
+
+        results = oe.utils.multiprocess_launch(oe.package.is_elf, checkelflinks.values(), d)
+        results_map = {}
+        for (ltarget, elf_file) in results:
+            results_map[ltarget] = elf_file
+        for file in checkelflinks:
+            ltarget = checkelflinks[file]
+            # If it's a symlink, and points to an ELF file, we capture the readlink target
+            if results_map[ltarget]:
+                target = os.readlink(file)
+                #bb.note("Sym: %s (%d)" % (ltarget, results_map[ltarget]))
+                symlinks[file] = target
+
+        results = oe.utils.multiprocess_launch(oe.package.is_elf, checkelf.keys(), d)
+        for (file, elf_file) in results:
+            # It's a file (or hardlink), not a link
+            # ...but is it ELF, and is it already stripped?
+            if elf_file & 1:
+                if elf_file & 2:
+                    if 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn) or "").split():
+                        bb.note("Skipping file %s from %s for already-stripped QA test" % (file[len(dvar):], pn))
+                    else:
+                        msg = "File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn)
+                        package_qa_handle_error("already-stripped", msg, d)
+                    continue
 
-                    # It's a file (or hardlink), not a link
-                    # ...but is it ELF, and is it already stripped?
-                    elf_file = oe.package.is_elf(file)
-                    if elf_file & 1:
-                        if elf_file & 2:
-                            if 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn) or "").split():
-                                bb.note("Skipping file %s from %s for already-stripped QA test" % (file[len(dvar):], pn))
-                            else:
-                                msg = "File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn)
-                                package_qa_handle_error("already-stripped", msg, d)
-                            continue
-
-                        # At this point we have an unstripped elf file. We need to:
-                        #  a) Make sure any file we strip is not hardlinked to anything else outside this tree
-                        #  b) Only strip any hardlinked file once (no races)
-                        #  c) Track any hardlinks between files so that we can reconstruct matching debug file hardlinks
-
-                        # Use a reference of device ID and inode number to identify files
-                        file_reference = "%d_%d" % (s.st_dev, s.st_ino)
-                        if file_reference in inodes:
-                            os.unlink(file)
-                            os.link(inodes[file_reference][0], file)
-                            inodes[file_reference].append(file)
-                        else:
-                            inodes[file_reference] = [file]
-                            # break hardlink
-                            bb.utils.copyfile(file, file)
-                            elffiles[file] = elf_file
-                        # Modified the file so clear the cache
-                        cpath.updatecache(file)
+                # At this point we have an unstripped elf file. We need to:
+                #  a) Make sure any file we strip is not hardlinked to anything else outside this tree
+                #  b) Only strip any hardlinked file once (no races)
+                #  c) Track any hardlinks between files so that we can reconstruct matching debug file hardlinks
+
+                # Use a reference of device ID and inode number to identify files
+                file_reference = checkelf[file]
+                if file_reference in inodes:
+                    os.unlink(file)
+                    os.link(inodes[file_reference][0], file)
+                    inodes[file_reference].append(file)
+                else:
+                    inodes[file_reference] = [file]
+                    # break hardlink
+                    bb.utils.copyfile(file, file)
+                    elffiles[file] = elf_file
+                # Modified the file so clear the cache
+                cpath.updatecache(file)
 
     #
     # First lets process debug splitting
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index a435d661a62..ac0f44efda1 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -74,7 +74,7 @@ def is_elf(path):
         if "relocatable" in result:
             if path.endswith(".ko") and path.find("/lib/modules/") != -1 and is_kernel_module(path):
                 exec_type |= 16
-    return exec_type
+    return (path, exec_type)
 
 def is_static_lib(path):
     if path.endswith('.a') and not os.path.islink(path):
@@ -107,6 +107,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
     #
     # First lets figure out all of the files we may have to process
     #
+    checkelf = []
     for root, dirs, files in os.walk(dstdir):
         for f in files:
             file = os.path.join(root, f)
@@ -132,7 +133,10 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
 
                 # It's a file (or hardlink), not a link
                 # ...but is it ELF, and is it already stripped?
-                elf_file = is_elf(file)
+                checkelf.append(file)
+    results = oe.utils.multiprocess_launch(is_elf, checkelf, d)
+    for (file, elf_file) in results:
+                #elf_file = is_elf(file)
                 if elf_file & 1:
                     if elf_file & 2:
                         if qa_already_stripped:
-- 
2.17.1


