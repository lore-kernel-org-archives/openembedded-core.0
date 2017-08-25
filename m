Return-Path: <tobias.hagelborn@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3FC08783E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 11:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id CD98D2E5FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id dnVzVNoUib_C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:49 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 420882E5FB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:49 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C9671A06B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:49 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21DBE1A067
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:49 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:49 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 15ECD1DA6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:49 +0200 (CEST)
Received: from lnxtobiasha.se.axis.com (10.0.5.60) by XBOX02.axis.com
	(10.0.5.16) with Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 25 Aug 2017 13:32:49 +0200
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Aug 2017 13:32:36 +0200
Message-ID: <1503660758-10687-1-git-send-email-tobiasha@axis.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Cc: Tobias Hagelborn <tobiasha@axis.com>
Subject: [PATCH v6 1/3] package.py: Fix some lint errors
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
X-List-Received-Date: Fri, 25 Aug 2017 11:32:50 -0000
Content-Type: text/plain

- rename type to exec_type not to shadow type
- rename isELF is_elf

Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>
---
 meta/lib/oe/package.py | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index a79c668..839e9a2 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -67,24 +67,23 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
     # 4 - executable
     # 8 - shared library
     # 16 - kernel module
-    def isELF(path):
-        type = 0
+    def is_elf(path):
+        exec_type = 0
         ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
 
         if ret:
             bb.error("split_and_strip_files: 'file %s' failed" % path)
-            return type
+            return exec_type
 
-        # Not stripped
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
+                exec_type |= 8
+        return exec_type
 
 
     elffiles = {}
@@ -119,7 +118,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
 
                 # It's a file (or hardlink), not a link
                 # ...but is it ELF, and is it already stripped?
-                elf_file = isELF(file)
+                elf_file = is_elf(file)
                 if elf_file & 1:
                     if elf_file & 2:
                         if qa_already_stripped:
-- 
2.1.4


