Return-Path: <tobias.hagelborn@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 29A717841C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 11:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0D24018A0A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id zHva1rjvsUYx
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:52 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 3A25618970
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:52 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 22FB61E070
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:52 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17C7E1E057
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:52 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:52 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 0BC9B1DA6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:52 +0200 (CEST)
Received: from lnxtobiasha.se.axis.com (10.0.5.60) by XBOX02.axis.com
	(10.0.5.16) with Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 25 Aug 2017 13:32:52 +0200
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Aug 2017 13:32:37 +0200
Message-ID: <1503660758-10687-2-git-send-email-tobiasha@axis.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1503660758-10687-1-git-send-email-tobiasha@axis.com>
References: <1503660758-10687-1-git-send-email-tobiasha@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Cc: Tobias Hagelborn <tobiasha@axis.com>
Subject: [PATCH v6 2/3] package.py: strip_execs: Support for .ko modules
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
X-List-Received-Date: Fri, 25 Aug 2017 11:32:52 -0000
Content-Type: text/plain

* Support stripping of .ko modules verifying file extension and
  check of content "vermagic="

Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>
---
 meta/lib/oe/package.py | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 839e9a2..fcee389 100644
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
@@ -69,7 +72,8 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
     # 16 - kernel module
     def is_elf(path):
         exec_type = 0
-        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
+        ret, result = oe.utils.getstatusoutput(
+            "file \"%s\"" % path.replace("\"", "\\\""))
 
         if ret:
             bb.error("split_and_strip_files: 'file %s' failed" % path)
@@ -83,14 +87,15 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
                 exec_type |= 4
             if "shared" in result:
                 exec_type |= 8
+            if "relocatable" in result and is_kernel_module(path):
+                exec_type |= 16
         return exec_type
 
-
     elffiles = {}
     inodes = {}
     libdir = os.path.abspath(dstdir + os.sep + libdir)
     base_libdir = os.path.abspath(dstdir + os.sep + base_libdir)
-
+    exec_mask = stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH
     #
     # First lets figure out all of the files we may have to process
     #
@@ -110,8 +115,9 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
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
@@ -131,8 +137,8 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
                         os.unlink(file)
                         os.link(inodes[s.st_ino], file)
                     else:
+                        # break hardlinks so that we do not strip the original.
                         inodes[s.st_ino] = file
-                        # break hardlink
                         bb.utils.copyfile(file, file)
                         elffiles[file] = elf_file
 
@@ -142,7 +148,6 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
     sfiles = []
     for file in elffiles:
         elf_file = int(elffiles[file])
-        #bb.note("Strip %s" % file)
         sfiles.append((file, elf_file, strip_cmd))
 
     oe.utils.multiprocess_exec(sfiles, runstrip)
-- 
2.1.4


