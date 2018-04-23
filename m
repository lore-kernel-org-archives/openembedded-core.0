Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id D006D60068
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 07:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id F204B183E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 09:49:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id CSNvF98IWisv
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 09:49:49 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 4FEBB18297
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 09:49:49 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 391E41A066
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 09:49:49 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DE411A065
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 09:49:49 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 09:49:49 +0200 (CEST)
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.130.9])
	by thoth.se.axis.com (Postfix) with ESMTP id 21C671C21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 09:49:49 +0200 (CEST)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 1DC1A409BD; Mon, 23 Apr 2018 09:49:49 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Apr 2018 09:49:49 +0200
Message-Id: <20180423074949.12390-1-olani@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Subject: [PATCH] package.bbclass: Make staticlib problems non-fatal
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
X-List-Received-Date: Mon, 23 Apr 2018 07:49:52 -0000

Allow debugsource listing using dwarfsourcefiles to fail for static
libraries when the archive content is not as expected.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/classes/package.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0436d919e7..d61b4ce8ca 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -344,12 +344,15 @@ def parse_debugsources_from_dwarfsrcfiles_output(dwarfsrcfiles_output):
 
     return debugfiles.keys()
 
-def append_source_info(file, sourcefile, d):
+def append_source_info(file, sourcefile, d, fatal=True):
     cmd = "'dwarfsrcfiles' '%s'" % (file)
     (retval, output) = oe.utils.getstatusoutput(cmd)
     # 255 means a specific file wasn't fully parsed to get the debug file list, which is not a fatal failure
     if retval != 0 and retval != 255:
-        bb.fatal("dwarfsrcfiles failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
+        msg = "dwarfsrcfiles failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else "")
+        if fatal:
+            bb.fatal(msg)
+        bb.note(msg)
 
     debugsources = parse_debugsources_from_dwarfsrcfiles_output(output)
     # filenames are null-separated - this is an artefact of the previous use
@@ -1052,7 +1055,7 @@ python split_and_strip_files () {
 
         if debugsrcdir and not targetos.startswith("mingw"):
             for file in staticlibs:
-                append_source_info(file, sourcefile, d)
+                append_source_info(file, sourcefile, d, fatal=False)
 
         # Hardlink our debug symbols to the other hardlink copies
         for ref in inodes:
-- 
2.11.0


