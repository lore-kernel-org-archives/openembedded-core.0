Return-Path: <tobias.hagelborn@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA51C78304
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 14:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7B14118473
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 16:14:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id XOoxIbsUxfQb
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 16:14:21 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id D322918411
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 16:14:20 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFF5C1E083
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 16:14:20 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4DFC1E07C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 16:14:20 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 16:14:20 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id A8EA61C50
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 16:14:20 +0200 (CEST)
Received: from lnxtobiasha.se.axis.com (10.0.5.60) by XBOX02.axis.com
	(10.0.5.16) with Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Thu, 24 Aug 2017 16:14:20 +0200
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Aug 2017 16:13:53 +0200
Message-ID: <1503584034-20032-2-git-send-email-tobiasha@axis.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1503584034-20032-1-git-send-email-tobiasha@axis.com>
References: <1503584034-20032-1-git-send-email-tobiasha@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Cc: Tobias Hagelborn <tobiasha@axis.com>
Subject: [PATCH v4 1/2] package.py: strip_execs: Support for .ko modules
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
X-List-Received-Date: Thu, 24 Aug 2017 14:14:23 -0000
Content-Type: text/plain

* Support stripping of .ko modules verifying file extension and
  check of content "vermagic="
* Minor refactoring (removing lint errors)

Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>
---
 meta/lib/oe/package.py | 44 +++++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index a79c668..4daee59 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -56,9 +56,12 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
     :param qa_already_stripped: Set to True if already-stripped' in ${INSANE_SKIP}
     This is for proper logging and messages only.
     """
-    import stat, errno, oe.path, oe.utils
+    import stat, errno, oe.path, oe.utils, mmap
 
-    os.chdir(dstdir)
+    # Detect .ko module by searching for "vermagic=" string
+    def is_kernel_module(path):
+        with open(path) as f:
+            return mmap.mmap(f.fileno(), 0, prot=mmap.PROT_READ).find(b"vermagic=") >= 0
 
     # Return type (bits):
     # 0 - not elf
@@ -67,31 +70,33 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
     # 4 - executable
     # 8 - shared library
     # 16 - kernel module
-    def isELF(path):
-        type = 0
-        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
+    def is_elf(path):
+        exec_type = 0
+        ret, result = oe.utils.getstatusoutput(
+            "file \"%s\"" % path.replace("\"", "\\\""))
 
         if ret:
             bb.error("split_and_strip_files: 'file %s' failed" % path)
-            return type
+            return exec_type
 
         # Not stripped
         if "ELF" in result:
-            type |= 1
+            exec_type |= 1
             if "not stripped" not in result:
-                type |= 2
+                exec_type |= 2
             if "executable" in result:
-                type |= 4
+                exec_type |= 4
             if "shared" in result:
-                type |= 8
-        return type
-
+                exec_type |= 8
+            if "relocatable" in result and is_kernel_module(path):
+                exec_type |= 16
+        return exec_type
 
     elffiles = {}
     inodes = {}
-    libdir = os.path.abspath(dstdir + os.sep + libdir)
-    base_libdir = os.path.abspath(dstdir + os.sep + base_libdir)
-
+    libdir = os.path.abspath(os.path.join(dstdir, libdir.lstrip(os.sep)))
+    base_libdir = os.path.abspath(os.path.join(dstdir, base_libdir.lstrip(os.sep)))
+    exec_mask = stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH
     #
     # First lets figure out all of the files we may have to process
     #
@@ -111,15 +116,16 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
             if not s:
                 continue
             # Check its an excutable
-            if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
-                    or ((file.startswith(libdir) or file.startswith(base_libdir)) and ".so" in f):
+            if s[stat.ST_MODE] & exec_mask \
+                    or ((file.startswith(libdir) or file.startswith(base_libdir)) and ".so" in f) \
+                    or file.endswith('.ko'):
                 # If it's a symlink, and points to an ELF file, we capture the readlink target
                 if os.path.islink(file):
                     continue
 
                 # It's a file (or hardlink), not a link
                 # ...but is it ELF, and is it already stripped?
-                elf_file = isELF(file)
+                elf_file = is_elf(file)
                 if elf_file & 1:
                     if elf_file & 2:
                         if qa_already_stripped:
@@ -132,6 +138,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
                         os.unlink(file)
                         os.link(inodes[s.st_ino], file)
                     else:
+                        # break hardlinks so that we do not strip the original.
                         inodes[s.st_ino] = file
                         # break hardlink
                         bb.utils.copyfile(file, file)
@@ -143,7 +150,6 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
     sfiles = []
     for file in elffiles:
         elf_file = int(elffiles[file])
-        #bb.note("Strip %s" % file)
         sfiles.append((file, elf_file, strip_cmd))
 
     oe.utils.multiprocess_exec(sfiles, runstrip)
-- 
2.1.4


