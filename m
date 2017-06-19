Return-Path: <tobias.hagelborn@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0D13E77A63
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 13:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 5B2E62E32A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:19:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id IpMtPeOFGGgM
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:19:34 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 86C342E2E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:19:34 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 71AF61A080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:19:34 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66F9D1A067
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:19:34 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:19:34 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 5B45611DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:19:34 +0200 (CEST)
Received: from lnxtobiasha.se.axis.com (10.0.5.60) by XBOX02.axis.com
	(10.0.5.16) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Mon, 19 Jun 2017 15:19:34 +0200
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Jun 2017 15:19:14 +0200
Message-ID: <1497878357-27381-1-git-send-email-tobiasha@axis.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Cc: Tobias Hagelborn <tobiasha@axis.com>
Subject: [PATCH v2 1/4] package.py: Add function strip_execs
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
X-List-Received-Date: Mon, 19 Jun 2017 13:19:35 -0000
Content-Type: text/plain

Strip all executables in a directory.
Utility function  placed in oe-package together with run_strip.
strip_execs is based on strip_sysroot from staging.bbclass
Moving out datastore references in favor of function parameters.

Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>
---
 meta/lib/oe/package.py | 105 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 52c5f16..43748b2 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -45,6 +45,111 @@ def runstrip(arg):
     return
 
 
+def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=False):
+    """
+    Strip executable code (like executables, shared libraries) _in_place_
+    - Based on sysroot_strip in staging.bbclass
+    :param dstdir: directory in which to strip files
+    :param strip_cmd: Strip command (usually ${STRIP})
+    :param libdir: ${libdir} - strip .so files in this directory
+    :param base_libdir: ${base_libdir} - strip .so files in this directory
+    :param qa_already_stripped: Set to True if already-stripped' in ${INSANE_SKIP}
+    This is for proper logging and messages only.
+    """
+    import stat, errno, oe.path, oe.utils
+
+    os.chdir(dstdir)
+
+    # Return type (bits):
+    # 0 - not elf
+    # 1 - ELF
+    # 2 - stripped
+    # 4 - executable
+    # 8 - shared library
+    # 16 - kernel module
+    def isELF(path):
+        type = 0
+        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
+
+        if ret:
+            bb.error("split_and_strip_files: 'file %s' failed" % path)
+            return type
+
+        # Not stripped
+        if "ELF" in result:
+            type |= 1
+            if "not stripped" not in result:
+                type |= 2
+            if "executable" in result:
+                type |= 4
+            if "shared" in result:
+                type |= 8
+        return type
+
+
+    elffiles = {}
+    inodes = {}
+    libdir = os.path.abspath(dstdir + os.sep + libdir)
+    base_libdir = os.path.abspath(dstdir + os.sep + base_libdir)
+
+    #
+    # First lets figure out all of the files we may have to process
+    #
+    for root, dirs, files in os.walk(dstdir):
+        for f in files:
+            file = os.path.join(root, f)
+
+            try:
+                ltarget = oe.path.realpath(file, dstdir, False)
+                s = os.lstat(ltarget)
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
+                    or ((file.startswith(libdir) or file.startswith(base_libdir)) and ".so" in f):
+                # If it's a symlink, and points to an ELF file, we capture the readlink target
+                if os.path.islink(file):
+                    continue
+
+                # It's a file (or hardlink), not a link
+                # ...but is it ELF, and is it already stripped?
+                elf_file = isELF(file)
+                if elf_file & 1:
+                    if elf_file & 2:
+                        if qa_already_stripped:
+                            bb.note("Skipping file %s from %s for already-stripped QA test" % (file[len(dstdir):], pn))
+                        else:
+                            bb.warn("File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dstdir):], pn))
+                        continue
+
+                    if s.st_ino in inodes:
+                        os.unlink(file)
+                        os.link(inodes[s.st_ino], file)
+                    else:
+                        inodes[s.st_ino] = file
+                        # break hardlink
+                        bb.utils.copyfile(file, file)
+                        elffiles[file] = elf_file
+
+    #
+    # Now strip them (in parallel)
+    #
+    sfiles = []
+    for file in elffiles:
+        elf_file = int(elffiles[file])
+        #bb.note("Strip %s" % file)
+        sfiles.append((file, elf_file, strip_cmd))
+
+    oe.utils.multiprocess_exec(sfiles, runstrip)
+
+
+
 def file_translate(file):
     ft = file.replace("@", "@at@")
     ft = ft.replace(" ", "@space@")
-- 
2.1.4


