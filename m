Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 262B9786D7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 15:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7080418832
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id jwp7cI-qeaGB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:42 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id F014E187F4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:41 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBCA61E0A7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:41 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0A851E0A6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:41 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:41 +0100 (CET)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id B9B8B21EC;
	Fri,  1 Dec 2017 16:50:41 +0100 (CET)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id A0ADD9C051; Fri,  1 Dec 2017 16:50:41 +0100 (CET)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Dec 2017 16:50:20 +0100
Message-Id: <20171201155024.3002-2-olofjn@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171201155024.3002-1-olofjn@axis.com>
References: <20171201155024.3002-1-olofjn@axis.com>
X-TM-AS-GCONF: 00
Cc: Olof Johansson <olofjn@axis.com>
Subject: [PATCH 1/5] lib/oe/package.py: Expose is_elf
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
X-List-Received-Date: Fri, 01 Dec 2017 15:59:08 -0000

is_elf/isELF had copies in both staging.bbclass and package.bbclass.
After recent refactoring in staging.bbclass (involving breaking out the
isELF function to is_elf in lib/oe/package.py), the implementions
diverged. It would be beneficial to make everybody use this one
implementation, so let's expose it here for others to use.

Signed-off-by: Olof Johansson <olofjn@axis.com>
---
 meta/lib/oe/package.py | 88 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 34 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 1e5c3aa8e1..f1f9333e0f 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1,3 +1,6 @@
+import mmap
+import oe.utils
+
 def runstrip(arg):
     # Function to strip a single file, called from split_and_strip_files below
     # A working 'file' (one which works on the target architecture)
@@ -44,6 +47,56 @@ def runstrip(arg):
 
     return
 
+# Detect .ko module by searching for "vermagic=" string
+def is_kernel_module(path):
+    with open(path) as f:
+        return mmap.mmap(f.fileno(), 0, prot=mmap.PROT_READ).find(b"vermagic=") >= 0
+
+def _is_elf_error(msg):
+    bb.error('is_elf: %s' % msg)
+
+def is_elf(path, on_error=_is_elf_error):
+    """
+    Determine if a given file is an ELF archive (and other attributes),
+    using the file utility.
+
+    :param path: str, path of potential ELF file
+    :param on_error: callable, gets called when an error occurs.
+                     the callback takes a message parameter. A
+                     default error handler is provided that prints
+                     the message with 'bb.error'.
+
+    is_elf returns a bitstring of flags, corresponding to various
+    properties:
+
+    *  1: ELF
+    *  2: stripped
+    *  4: executable
+    *  8: shared library
+    * 16: kernel module
+
+    A return value of 0 means that the file is not an ELF file.
+    """
+    ret, result = oe.utils.getstatusoutput(
+        "file \"%s\"" % path.replace("\"", "\\\""))
+
+    if ret:
+        error_cb('"file %s" failed')
+        return
+
+    if not "ELF" in result:
+        return 0
+
+    exec_type = 1
+    if "not stripped" not in result:
+        exec_type |= 2
+    if "executable" in result:
+        exec_type |= 4
+    if "shared" in result:
+        exec_type |= 8
+    if "relocatable" in result and is_kernel_module(path):
+        exec_type |= 16
+    return exec_type
 
 def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=False):
     """
@@ -56,40 +109,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
     :param qa_already_stripped: Set to True if already-stripped' in ${INSANE_SKIP}
     This is for proper logging and messages only.
     """
-    import stat, errno, oe.path, oe.utils, mmap
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
-        ret, result = oe.utils.getstatusoutput(
-            "file \"%s\"" % path.replace("\"", "\\\""))
-
-        if ret:
-            bb.error("split_and_strip_files: 'file %s' failed" % path)
-            return exec_type
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
2.11.0


