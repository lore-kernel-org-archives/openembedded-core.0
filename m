Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2335971A1A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 15:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 55CD11851A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 0Q3uHRweWmAl
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:42 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 37AAC18834
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:42 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2571A1E0A6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:42 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19F631E0AA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:42 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:42 +0100 (CET)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 0D7FC21EC;
	Fri,  1 Dec 2017 16:50:42 +0100 (CET)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id F34AD9C0AE; Fri,  1 Dec 2017 16:50:41 +0100 (CET)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Dec 2017 16:50:24 +0100
Message-Id: <20171201155024.3002-6-olofjn@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171201155024.3002-1-olofjn@axis.com>
References: <20171201155024.3002-1-olofjn@axis.com>
X-TM-AS-GCONF: 00
Cc: Olof Johansson <olofjn@axis.com>
Subject: [PATCH 5/5] lib/oe/package.py: is_elf: Make it less prone to false positives
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

Avoid matching substrings that are picked up from paths, for instance.
Do this by anchoring the tokens we look for (e.g "executable" or "not
stripped") with whitespace and punctuation.

Submitted with this patch series is a change that adds the use of
--brief to file. This removes the path prefix to the output, but the
path can still be included in shebang lines (which file will report as
something like "a /foo/bar/baz.py script").

Signed-off-by: Olof Johansson <olofjn@axis.com>
---
 meta/lib/oe/package.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 976d2ef36c..2bd771cfc5 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -84,17 +84,17 @@ def is_elf(path, on_error=_is_elf_error):
         error_cb('"file %s" failed')
         return
 
-    if not "ELF" in result:
+    if not result.startswith("ELF "):
         return 0
 
     exec_type = 1
-    if "not stripped" not in result:
+    if ", not stripped" not in result:
         exec_type |= 2
-    if "executable" in result:
+    if " executable, " in result:
         exec_type |= 4
-    if "shared" in result:
+    if " shared object, " in result:
         exec_type |= 8
-    if "relocatable" in result and is_kernel_module(path):
+    if "relocatable, " in result and is_kernel_module(path):
         exec_type |= 16
     return exec_type
 
-- 
2.11.0


