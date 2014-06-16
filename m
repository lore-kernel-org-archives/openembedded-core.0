Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6972B6FD52
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 06:45:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5G6jwhw008339
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Jun 2014 23:45:58 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 15 Jun 2014 23:45:58 -0700
From: <rongqing.li@windriver.com>
To: <laurentiu.palcu@intel.com>, <Yanjun.Zhu@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 14:46:10 +0800
Message-ID: <1402901171-14424-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 1/2] relocating the elf file only if the file size is larger than 64 byte
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
X-List-Received-Date: Mon, 16 Jun 2014 06:46:00 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

When toolchain directory is changed to execute mode, some non-executable
files or empty files are sorted. This will lead to the below error:

	Extracting SDK...done
	Setting it up...Traceback (most recent call last):
	  File "..._SDK/relocate_sdk.py", line 208, in <module>
	    arch = get_arch()
	  File "..._SDK/relocate_sdk.py", line 39, in get_arch
	    ei_mag0,ei_mag1_3,ei_class = struct.unpack("<B3sB11x", e_ident)
	struct.error: unpack requires a string argument of length 16

To call get_arch and parse_elf_header, we should ensure the sorted file
is bigger than 64 byte.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 scripts/relocate_sdk.py |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index 05d9fd6..b2dd258 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -224,12 +224,12 @@ for e in executables_list:
 
     # Save old size and do a size check at the end. Just a safety measure.
     old_size = os.path.getsize(e)
-
-    arch = get_arch()
-    if arch:
-        parse_elf_header()
-        change_interpreter(e)
-        change_dl_sysdirs()
+    if old_size >= 64:
+        arch = get_arch()
+        if arch:
+            parse_elf_header()
+            change_interpreter(e)
+            change_dl_sysdirs()
 
     """ change permissions back """
     if perms:
-- 
1.7.10.4


