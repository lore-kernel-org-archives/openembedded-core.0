Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2D5D66025F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 10:40:00 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id v14-v6so10860766wro.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 03:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/BrcP0ODiy4gF0fA4orxF7ljj4lCBXqjc5OpzHxWFOw=;
	b=BepX0pShYRFmuvkWbwMn8BjLVbEJNkCdCHqCV090LYuoJgm+XDXlAsLjbF4ELVAgnu
	m1rTpdGiuBEq2X2e6VUhz+4mwyfwtvfszR0AeZrawECMDNYUjTolXdrOc/yAghDPWdNV
	84R4BkB/eb7hZKNp23cauktx9icqftMJCVvKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/BrcP0ODiy4gF0fA4orxF7ljj4lCBXqjc5OpzHxWFOw=;
	b=PeJNgpnMvKfiNE6KXN0kC9APdSLRHvNOPViGy4eO3USy4t1jPdIMs4jwiyIboWXo5I
	F/wp3hFs/RqTSccmQWVD6MXhYE7JjTgSC4SqXWIh6R4TYnQp1lJrKdFsTrnJa6ZQUxbF
	XYP/Ow4Vysg3wRsJwVCMmSPUKKB11oNoV974xqvY3zzGh6xlBejuxptDWVxHtE0k6Mcj
	RuYo1g8eajk3JEqOqhiOm6Jx0JbLojVkAEu7tsZHGpYY+BxFVOSstJB2yPoW1JUBmnfi
	xE56ONgJ17cqGWSvM+nWZyVEPexgdTZei5fpzBc1JcygzsA4WgHkj9J4ZdVFa22MRTQb
	E0Yw==
X-Gm-Message-State: AOUpUlFde8f595OcxGpQYIA/FvRuJA366tzJ4HMJyJaLMD7qsFi1r9DM
	n1VrjqVWZo04OkJH4BELIKuUuxv/ze9Teg==
X-Google-Smtp-Source: AAOMgpdFdghTejhU0g5LOxRAq404PRjZcyFZ1UzoKSQZoOQ4jhtfexL4lebCl4AEVQB208/hUq7Nug==
X-Received: by 2002:adf:8385:: with SMTP id 5-v6mr1114653wre.13.1532083200606; 
	Fri, 20 Jul 2018 03:40:00 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t184-v6sm1204848wmf.18.2018.07.20.03.39.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jul 2018 03:39:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 11:39:46 +0100
Message-Id: <20180720103948.30044-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
References: <20180720103948.30044-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 08/10] package: Refactor to remove isElf/is_elf function duplication
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
X-List-Received-Date: Fri, 20 Jul 2018 10:40:00 -0000

There are probably further cleanups needed here but this at least removes
the major code duplication between these two similar funcitons, keeping the
kernel module ".ko" extension check for efficiency to avoid opening and
reading file contents in the general case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 40 ++------------------
 meta/lib/oe/package.py       | 73 +++++++++++++++++++++---------------
 2 files changed, 47 insertions(+), 66 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 74c96b9b725..222b78fe165 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -936,38 +936,6 @@ python split_and_strip_files () {
     sourcefile = d.expand("${WORKDIR}/debugsources.list")
     bb.utils.remove(sourcefile)
 
-    # Return type (bits):
-    # 0 - not elf
-    # 1 - ELF
-    # 2 - stripped
-    # 4 - executable
-    # 8 - shared library
-    # 16 - kernel module
-    def isELF(path):
-        type = 0
-        result = subprocess.check_output(["file", "-b", path], stderr=subprocess.STDOUT).decode("utf-8")
-
-        # Not stripped
-        if "ELF" in result:
-            type |= 1
-            if "not stripped" not in result:
-                type |= 2
-            if "executable" in result:
-                type |= 4
-            if "shared" in result:
-                type |= 8
-        return type
-
-    def isStaticLib(path):
-        if path.endswith('.a') and not os.path.islink(path):
-            with open(path, 'rb') as fh:
-                # The magic must include the first slash to avoid
-                # matching golang static libraries
-                magic = b'!<arch>\x0a/'
-                start = fh.read(len(magic))
-                return start == magic
-        return False
-
     #
     # First lets figure out all of the files we may have to process ... do this only once!
     #
@@ -987,7 +955,7 @@ python split_and_strip_files () {
                 if file.endswith(".ko") and file.find("/lib/modules/") != -1:
                     kernmods.append(file)
                     continue
-                if isStaticLib(file):
+                if oe.package.is_static_lib(file):
                     staticlibs.append(file)
                     continue
 
@@ -1017,14 +985,14 @@ python split_and_strip_files () {
                     # If it's a symlink, and points to an ELF file, we capture the readlink target
                     if cpath.islink(file):
                         target = os.readlink(file)
-                        if isELF(ltarget):
-                            #bb.note("Sym: %s (%d)" % (ltarget, isELF(ltarget)))
+                        if oe.package.is_elf(ltarget):
+                            #bb.note("Sym: %s (%d)" % (ltarget, oe.package.is_elf(ltarget)))
                             symlinks[file] = target
                         continue
 
                     # It's a file (or hardlink), not a link
                     # ...but is it ELF, and is it already stripped?
-                    elf_file = isELF(file)
+                    elf_file = oe.package.is_elf(file)
                     if elf_file & 1:
                         if elf_file & 2:
                             if 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn) or "").split():
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 8a303106a9f..a435d661a62 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1,8 +1,11 @@
+import mmap
+import subprocess
+
 def runstrip(arg):
     # Function to strip a single file, called from split_and_strip_files below
     # A working 'file' (one which works on the target architecture)
     #
-    # The elftype is a bit pattern (explained in split_and_strip_files) to tell
+    # The elftype is a bit pattern (explained in is_elf below) to tell
     # us what type of file we're processing...
     # 4 - executable
     # 8 - shared library
@@ -44,6 +47,44 @@ def runstrip(arg):
 
     return
 
+# Detect .ko module by searching for "vermagic=" string
+def is_kernel_module(path):
+    with open(path) as f:
+        return mmap.mmap(f.fileno(), 0, prot=mmap.PROT_READ).find(b"vermagic=") >= 0
+
+# Return type (bits):
+# 0 - not elf
+# 1 - ELF
+# 2 - stripped
+# 4 - executable
+# 8 - shared library
+# 16 - kernel module
+def is_elf(path):
+    exec_type = 0
+    result = subprocess.check_output(["file", "-b", path], stderr=subprocess.STDOUT).decode("utf-8")
+
+    if "ELF" in result:
+        exec_type |= 1
+        if "not stripped" not in result:
+            exec_type |= 2
+        if "executable" in result:
+            exec_type |= 4
+        if "shared" in result:
+            exec_type |= 8
+        if "relocatable" in result:
+            if path.endswith(".ko") and path.find("/lib/modules/") != -1 and is_kernel_module(path):
+                exec_type |= 16
+    return exec_type
+
+def is_static_lib(path):
+    if path.endswith('.a') and not os.path.islink(path):
+        with open(path, 'rb') as fh:
+            # The magic must include the first slash to avoid
+            # matching golang static libraries
+            magic = b'!<arch>\x0a/'
+            start = fh.read(len(magic))
+            return start == magic
+    return False
 
 def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=False):
     """
@@ -56,35 +97,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
     :param qa_already_stripped: Set to True if already-stripped' in ${INSANE_SKIP}
     This is for proper logging and messages only.
     """
-    import stat, errno, oe.path, oe.utils, mmap, subprocess
-
-    # Detect .ko module by searching for "vermagic=" string
-    def is_kernel_module(path):
-        with open(path) as f:
-            return mmap.mmap(f.fileno(), 0, prot=mmap.PROT_READ).find(b"vermagic=") >= 0
-
-    # Return type (bits):
-    # 0 - not elf
-    # 1 - ELF
-    # 2 - stripped
-    # 4 - executable
-    # 8 - shared library
-    # 16 - kernel module
-    def is_elf(path):
-        exec_type = 0
-        result = subprocess.check_output(["file", "-b", path], stderr=subprocess.STDOUT).decode("utf-8")
-
-        if "ELF" in result:
-            exec_type |= 1
-            if "not stripped" not in result:
-                exec_type |= 2
-            if "executable" in result:
-                exec_type |= 4
-            if "shared" in result:
-                exec_type |= 8
-            if "relocatable" in result and is_kernel_module(path):
-                exec_type |= 16
-        return exec_type
+    import stat, errno, oe.path, oe.utils
 
     elffiles = {}
     inodes = {}
-- 
2.17.1


