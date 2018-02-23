Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5E8DF787DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 07:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 187751847E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 08:46:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 9iHLds-jSy1D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 08:46:19 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id BD8E1184E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 08:46:18 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8997B1A08A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 08:46:18 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EC9A1A082
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 08:46:18 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 08:46:18 +0100 (CET)
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.130.9])
	by thoth.se.axis.com (Postfix) with ESMTP id 72FFF1E3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 08:46:18 +0100 (CET)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 6E0B8409B5; Fri, 23 Feb 2018 08:46:18 +0100 (CET)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Feb 2018 08:46:18 +0100
Message-Id: <20180223074618.24928-1-olani@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Subject: [PATCH] package.bbclass: Include dbgsrc for static libs
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
X-List-Received-Date: Fri, 23 Feb 2018 07:46:19 -0000

The debugsource must be added from the package providing the static
lib, because any package using that lib does not have access to the
source code.

Fixes [YOCTO #12558]

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/classes/package.bbclass | 42 ++++++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e7e93a067a..ec6fca87b5 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -344,6 +344,20 @@ def parse_debugsources_from_dwarfsrcfiles_output(dwarfsrcfiles_output):
 
     return debugfiles.keys()
 
+def append_source_info(file, sourcefile, d):
+    cmd = "'dwarfsrcfiles' '%s'" % (file)
+    (retval, output) = oe.utils.getstatusoutput(cmd)
+    # 255 means a specific file wasn't fully parsed to get the debug file list, which is not a fatal failure
+    if retval != 0 and retval != 255:
+        bb.fatal("dwarfsrcfiles failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
+
+    debugsources = parse_debugsources_from_dwarfsrcfiles_output(output)
+    # filenames are null-separated - this is an artefact of the previous use
+    # of rpm's debugedit, which was writing them out that way, and the code elsewhere
+    # is still assuming that.
+    debuglistoutput = '\0'.join(debugsources) + '\0'
+    open(sourcefile, 'a').write(debuglistoutput)
+
 
 def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
     # Function to split a single file into two components, one is the stripped
@@ -369,18 +383,7 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
 
     # We need to extract the debug src information here...
     if debugsrcdir:
-        cmd = "'dwarfsrcfiles' '%s'" % (file)
-        (retval, output) = oe.utils.getstatusoutput(cmd)
-        # 255 means a specific file wasn't fully parsed to get the debug file list, which is not a fatal failure
-        if retval != 0 and retval != 255:
-            bb.fatal("dwarfsrcfiles failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
-
-        debugsources = parse_debugsources_from_dwarfsrcfiles_output(output)
-        # filenames are null-separated - this is an artefact of the previous use
-        # of rpm's debugedit, which was writing them out that way, and the code elsewhere
-        # is still assuming that.
-        debuglistoutput = '\0'.join(debugsources) + '\0'
-        open(sourcefile, 'a').write(debuglistoutput)
+        append_source_info(file, sourcefile, d)
 
     bb.utils.mkdirhier(os.path.dirname(debugfile))
 
@@ -936,6 +939,13 @@ python split_and_strip_files () {
                 type |= 8
         return type
 
+    def isStaticLib(path):
+        if file.endswith('.a'):
+            with open(path, 'rb') as fh:
+                magic = b'!<arch>\n'
+                start = fh.read(len(magic))
+                return start == magic
+        return False
 
     #
     # First lets figure out all of the files we may have to process ... do this only once!
@@ -943,6 +953,7 @@ python split_and_strip_files () {
     elffiles = {}
     symlinks = {}
     kernmods = []
+    staticlibs = []
     inodes = {}
     libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir"))
     baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir"))
@@ -955,6 +966,9 @@ python split_and_strip_files () {
                 if file.endswith(".ko") and file.find("/lib/modules/") != -1:
                     kernmods.append(file)
                     continue
+                if isStaticLib(file):
+                    staticlibs.append(file)
+                    continue
 
                 # Skip debug files
                 if debugappend and file.endswith(debugappend):
@@ -1033,6 +1047,10 @@ python split_and_strip_files () {
             # Only store off the hard link reference if we successfully split!
             splitdebuginfo(file, fpath, debugsrcdir, sourcefile, d)
 
+        if debugsrcdir:
+            for file in staticlibs:
+                append_source_info(file, sourcefile, d)
+
         # Hardlink our debug symbols to the other hardlink copies
         for ref in inodes:
             if len(inodes[ref]) == 1:
-- 
2.11.0


