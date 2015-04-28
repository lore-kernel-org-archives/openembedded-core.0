Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 62046716CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 06:22:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3S6Mtq4025635
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 23:22:55 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.142) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 27 Apr 2015 23:22:55 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Apr 2015 14:22:54 +0800
Message-ID: <1430202174-15571-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] elfutils: Security Advisory - CVE-2015-0255
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
X-List-Received-Date: Tue, 28 Apr 2015 06:22:55 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Directory traversal vulnerability in the read_long_names function in
libelf/elf_begin.c in elfutils 0.152 and 0.161 allows remote attackers
to write to arbitrary files to the root directory via a / (slash) in a
crafted archive, as demonstrated using the ar program.

https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9447

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...f-Fix-dir-traversal-vuln-in-ar-extraction.patch | 59 ++++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.161.bb   |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.161/0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch b/meta/recipes-devtools/elfutils/elfutils-0.161/0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch
new file mode 100644
index 0000000..7e4e492
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.161/0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch
@@ -0,0 +1,59 @@
+From 147018e729e7c22eeabf15b82d26e4bf68a0d18e Mon Sep 17 00:00:00 2001
+From: Alexander Cherepanov <cherepan@mccme.ru>
+Date: Sun, 28 Dec 2014 19:57:19 +0300
+Subject: [PATCH] libelf: Fix dir traversal vuln in ar extraction.
+
+Upstream-Status: Backport
+
+read_long_names terminates names at the first '/' found but then skips
+one character without checking (it's supposed to be '\n'). Hence the
+next name could start with any character including '/'. This leads to
+a directory traversal vulnerability at the time the contents of the
+archive is extracted.
+
+The danger is mitigated by the fact that only one '/' is possible in a
+resulting filename and only in the leading position. Hence only files
+in the root directory can be written via this vuln and only when ar is
+executed as root.
+
+The fix for the vuln is to not skip any characters while looking
+for '/'.
+
+Signed-off-by: Alexander Cherepanov <cherepan@mccme.ru>
+---
+ libelf/ChangeLog   | 5 +++++
+ libelf/elf_begin.c | 5 +----
+ 2 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/libelf/ChangeLog b/libelf/ChangeLog
+index 3b88d03..447c354 100644
+--- a/libelf/ChangeLog
++++ b/libelf/ChangeLog
+@@ -1,3 +1,8 @@
++2014-12-28  Alexander Cherepanov  <cherepan@mccme.ru>
++
++	* elf_begin.c (read_long_names): Don't miss '/' right after
++	another '/'. Fixes a dir traversal vuln in ar extraction.
++
+ 2014-12-18  Ulrich Drepper  <drepper@gmail.com>
+ 
+ 	* Makefile.am: Suppress output of textrel_check command.
+diff --git a/libelf/elf_begin.c b/libelf/elf_begin.c
+index 30abe0b..cd3756c 100644
+--- a/libelf/elf_begin.c
++++ b/libelf/elf_begin.c
+@@ -749,10 +749,7 @@ read_long_names (Elf *elf)
+ 	    }
+ 
+ 	  /* NUL-terminate the string.  */
+-	  *runp = '\0';
+-
+-	  /* Skip the NUL byte and the \012.  */
+-	  runp += 2;
++	  *runp++ = '\0';
+ 
+ 	  /* A sanity check.  Somebody might have generated invalid
+ 	     archive.  */
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.161.bb b/meta/recipes-devtools/elfutils/elfutils_0.161.bb
index 0dbe9f9..e111b34 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.161.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.161.bb
@@ -16,6 +16,7 @@ SRC_URI += "\
         file://Fix_elf_cvt_gunhash.patch \
         file://fixheadercheck.patch \
         file://0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch \
+        file://0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch \
 "
 
 # pick the patch from debian
-- 
2.1.0


