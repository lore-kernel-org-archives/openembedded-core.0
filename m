Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 9E63C6017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 12:35:49 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Fri, 6 Mar 2015
	13:35:49 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Mar 2015 13:35:47 +0100
Message-ID: <1425645347-16348-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [daisy][PATCH] elfutils: CVE-2014-9447
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
X-List-Received-Date: Fri, 06 Mar 2015 12:35:51 -0000
Content-Type: text/plain

Fixes directory traversal vulnerability in elfutils 'ar' utility

Reference
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-9447

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../elfutils/elfutils/CVE-2014-9447.patch          | 51 ++++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils/CVE-2014-9447.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils/CVE-2014-9447.patch b/meta/recipes-devtools/elfutils/elfutils/CVE-2014-9447.patch
new file mode 100644
index 0000000..8edec1b
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils/CVE-2014-9447.patch
@@ -0,0 +1,51 @@
+libelf: Fix dir traversal vuln in ar extraction.
+
+read_long_names terminates names at the first '/' found but
+then skips one character without checking (it's supposed to
+be '\n'). Hence the next name could start with any character
+including '/'. This leads to a directory traversal vulnerability
+at the time the contents of the archive is extracted.
+
+The danger is mitigated by the fact that only one '/' is
+possible in a resulting filename and only in the leading position.
+Hence only files in the root directory can be written via this vuln
+and only when ar is executed as root. The fix for the vuln is to not
+skip any characters while looking for '/'.
+
+Upstream commit:
+https://git.fedorahosted.org/cgit/elfutils.git/commit/
+?id=147018e729e7c22eeabf15b82d26e4bf68a0d18e
+
+Fixes CVE-2014-9447
+Upstream-Status: Backport
+
+Signed-off-by: Alexander Cherepanov <cherepan@mccme.ru>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+diff -ruN a/libelf/ChangeLog b/libelf/ChangeLog
+--- a/libelf/ChangeLog	2015-03-03 10:45:03.586045753 +0100
++++ b/libelf/ChangeLog	2015-03-03 10:47:14.052545814 +0100
+@@ -1,3 +1,8 @@
++2014-12-28  Alexander Cherepanov  <cherepan@mccme.ru>
++
++       * elf_begin.c (read_long_names): Don't miss '/' right after
++       another '/'. Fixes a dir traversal vuln in ar extraction.
++
+ 2010-06-14  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* gelf_update_shdr.c: Implicitly set ELF_F_DIRTY bit.
+diff -ruN a/libelf/elf_begin.c b/libelf/elf_begin.c
+--- a/libelf/elf_begin.c	2015-03-03 10:45:04.414010849 +0100
++++ b/libelf/elf_begin.c	2015-03-03 10:45:46.736226750 +0100
+@@ -765,10 +765,7 @@
+ 	    break;
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
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 1106242..d65867e 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -32,6 +32,7 @@ SRC_URI += "\
 	file://dso-link-change.patch \
 	file://nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch \
 	file://elfutils-ar-c-fix-num-passed-to-memset.patch \
+        file://CVE-2014-9447.patch \
 "
 # Only apply when building uclibc based target recipe
 SRC_URI_append_libc-uclibc = " file://uclibc-support.patch"
-- 
1.9.1


