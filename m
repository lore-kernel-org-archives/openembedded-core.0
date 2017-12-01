Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F137786D7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 15:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 63AFD187F4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id utXkEmVzeFzc
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:42 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 03F4518828
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:42 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E75BE1A0BA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:41 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCA181A0B9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:41 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:41 +0100 (CET)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by seth.se.axis.com (Postfix) with ESMTP id D047A2430;
	Fri,  1 Dec 2017 16:50:41 +0100 (CET)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id B7EEE9C0AE; Fri,  1 Dec 2017 16:50:41 +0100 (CET)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Dec 2017 16:50:21 +0100
Message-Id: <20171201155024.3002-3-olofjn@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171201155024.3002-1-olofjn@axis.com>
References: <20171201155024.3002-1-olofjn@axis.com>
X-TM-AS-GCONF: 00
Cc: Olof Johansson <olofjn@axis.com>
Subject: [PATCH 2/5] package.bbclass: Make use of common is_elf function
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
X-List-Received-Date: Fri, 01 Dec 2017 15:59:09 -0000

The isELF and is_elf function share a common ancestry, but have
diverged. Let's use the implementation from oe.package.

Signed-off-by: Olof Johansson <olofjn@axis.com>
---
 meta/classes/package.bbclass | 40 +++++++++-------------------------------
 1 file changed, 9 insertions(+), 31 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2053d46395..f65596126d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -857,6 +857,12 @@ python fixup_perms () {
 
 python split_and_strip_files () {
     import stat, errno
+    import oe.package
+
+    def is_elf(path):
+        return oe.package.is_elf(
+            path, lambda msg: package_qa_handle_error("split-strip", msg, d)
+        )
 
     dvar = d.getVar('PKGD')
     pn = d.getVar('PN')
@@ -892,34 +898,6 @@ python split_and_strip_files () {
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
-        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
-
-        if ret:
-            msg = "split_and_strip_files: 'file %s' failed" % path
-            package_qa_handle_error("split-strip", msg, d)
-            return type
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
-
     #
     # First lets figure out all of the files we may have to process ... do this only once!
     #
@@ -961,14 +939,14 @@ python split_and_strip_files () {
                     # If it's a symlink, and points to an ELF file, we capture the readlink target
                     if cpath.islink(file):
                         target = os.readlink(file)
-                        if isELF(ltarget):
-                            #bb.note("Sym: %s (%d)" % (ltarget, isELF(ltarget)))
+                        if is_elf(ltarget):
+                            #bb.note("Sym: %s (%d)" % (ltarget, is_elf(ltarget)))
                             symlinks[file] = target
                         continue
 
                     # It's a file (or hardlink), not a link
                     # ...but is it ELF, and is it already stripped?
-                    elf_file = isELF(file)
+                    elf_file = is_elf(file)
                     if elf_file & 1:
                         if elf_file & 2:
                             if 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn) or "").split():
-- 
2.11.0


