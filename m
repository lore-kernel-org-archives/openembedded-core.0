Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJC-0001h3-QV
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 May 2011 16:44:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="741892602"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by orsmga001.jf.intel.com with ESMTP; 03 May 2011 16:44:37 -0700
Message-Id: <0aec9536b80fa6d170e9a62ca1cffe2bc46b92bb.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Thu, 21 Apr 2011 14:10:45 +0800
Date: Tue, 03 May 2011 16:44:36 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 12/33] attr: upgrade to version 2.4.46
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 May 2011 23:47:15 -0000

From: Qing He <qing.he@intel.com>

from 2.4.44
 - remove the backported patch that is now in the tarball
 - prog path issue has also been fixed in the upstream

Signed-off-by: Qing He <qing.he@intel.com>
---
 .../attr/attr-2.4.44/double-free.patch             |   18 ----
 .../attr/attr-2.4.44/memory-leak-in-copy.patch     |   50 ----------
 .../attr/attr-2.4.44/memory-leak2.patch            |   18 ----
 .../attr/attr-2.4.44/pull-in-string.h.patch        |   21 ----
 .../attr/attr-2.4.44/thinko-in-restore.patch       |   19 ----
 meta/recipes-support/attr/attr_2.4.44.bb           |   12 ---
 meta/recipes-support/attr/attr_2.4.46.bb           |    6 +
 meta/recipes-support/attr/ea-acl.inc               |    2 +-
 .../attr/files/no-fixed-prog-path.patch            |   99 --------------------
 9 files changed, 7 insertions(+), 238 deletions(-)
 delete mode 100644 meta/recipes-support/attr/attr-2.4.44/double-free.patch
 delete mode 100644 meta/recipes-support/attr/attr-2.4.44/memory-leak-in-copy.patch
 delete mode 100644 meta/recipes-support/attr/attr-2.4.44/memory-leak2.patch
 delete mode 100644 meta/recipes-support/attr/attr-2.4.44/pull-in-string.h.patch
 delete mode 100644 meta/recipes-support/attr/attr-2.4.44/thinko-in-restore.patch
 delete mode 100644 meta/recipes-support/attr/attr_2.4.44.bb
 create mode 100644 meta/recipes-support/attr/attr_2.4.46.bb
 delete mode 100644 meta/recipes-support/attr/files/no-fixed-prog-path.patch

diff --git a/meta/recipes-support/attr/attr-2.4.44/double-free.patch b/meta/recipes-support/attr/attr-2.4.44/double-free.patch
deleted file mode 100644
index 6fc684f..0000000
--- a/meta/recipes-support/attr/attr-2.4.44/double-free.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-commit 5b28eb3b0e0430ce6af28edc9100ca23299d1218
-Author: Kamil Dudka <kdudka@redhat.com>
-Date:   Thu Jun 3 15:29:54 2010 +0200
-
-    attr_parse_attr_conf: eliminate a double free
-
-diff --git a/libattr/attr_copy_action.c b/libattr/attr_copy_action.c
-index 030bbf5..2697328 100644
---- a/libattr/attr_copy_action.c
-+++ b/libattr/attr_copy_action.c
-@@ -81,6 +81,7 @@ repeat:
- 		fclose(file);
- 		file = NULL;
- 		free(text);
-+		text = NULL;
- 		size_guess *= 2;
- 		goto repeat;
- 	}
diff --git a/meta/recipes-support/attr/attr-2.4.44/memory-leak-in-copy.patch b/meta/recipes-support/attr/attr-2.4.44/memory-leak-in-copy.patch
deleted file mode 100644
index 966632d..0000000
--- a/meta/recipes-support/attr/attr-2.4.44/memory-leak-in-copy.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-commit 972b42a67393f762936e74d3ce929914181f5f28
-Author: Brandon Philips <brandon@ifup.org>
-Date:   Thu Dec 17 17:15:57 2009 -0800
-
-    libattr: fix memory leak in attr_copy_action()
-    
-    stanse found that attr_copy_action returns before freeing the memory
-    allocated for text.
-    
-    Move fopen() above the malloc so this is not a problem.
-    
-    Fixes this bug:
-     https://bugzilla.novell.com/show_bug.cgi?id=564735
-    
-    Signed-off-by: Brandon Philips <bphilips@suse.de>
-
-diff --git a/libattr/attr_copy_action.c b/libattr/attr_copy_action.c
-index 0d7aca5..dc94224 100644
---- a/libattr/attr_copy_action.c
-+++ b/libattr/attr_copy_action.c
-@@ -53,7 +53,7 @@ free_attr_actions(void)
- static int
- attr_parse_attr_conf(struct error_context *ctx)
- {
--	char *text, *t;
-+	char *text = NULL, *t;
- 	size_t size_guess = 4096, len;
- 	FILE *file;
- 	char *pattern = NULL;
-@@ -64,15 +64,16 @@ attr_parse_attr_conf(struct error_context *ctx)
- 		return 0;
- 
- repeat:
--	text = malloc(size_guess + 1);
--	if (!text)
--		goto fail;
--
- 	if ((file = fopen(ATTR_CONF, "r")) == NULL) {
- 		if (errno == ENOENT)
- 			return 0;
- 		goto fail;
- 	}
-+
-+	text = malloc(size_guess + 1);
-+	if (!text)
-+		goto fail;
-+
- 	len = fread(text, 1, size_guess, file);
- 	if (ferror(file))
- 		goto fail;
diff --git a/meta/recipes-support/attr/attr-2.4.44/memory-leak2.patch b/meta/recipes-support/attr/attr-2.4.44/memory-leak2.patch
deleted file mode 100644
index 0339542..0000000
--- a/meta/recipes-support/attr/attr-2.4.44/memory-leak2.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-commit 42f50a130d144ffbc01738f15da9d4f1b57505bd
-Author: Kamil Dudka <kdudka@redhat.com>
-Date:   Thu Jun 3 15:23:04 2010 +0200
-
-    attr_parse_attr_conf: eliminate a memory leak
-
-diff --git a/libattr/attr_copy_action.c b/libattr/attr_copy_action.c
-index dc94224..030bbf5 100644
---- a/libattr/attr_copy_action.c
-+++ b/libattr/attr_copy_action.c
-@@ -129,6 +129,7 @@ repeat:
- 
- 		t += strcspn(t, "\n");
- 	}
-+	free(text);
- 	return 0;
- 
- parse_error:
diff --git a/meta/recipes-support/attr/attr-2.4.44/pull-in-string.h.patch b/meta/recipes-support/attr/attr-2.4.44/pull-in-string.h.patch
deleted file mode 100644
index ccbc236..0000000
--- a/meta/recipes-support/attr/attr-2.4.44/pull-in-string.h.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-commit 235cdd2af498d288f1af1142e7a23fbd16dff907
-Author: Mike Frysinger <vapier@gentoo.org>
-Date:   Fri Jan 8 21:53:19 2010 -0500
-
-    quote: pull in string.h for strchr prototype
-    
-    Signed-off-by: Mike Frysinger <vapier@gentoo.org>
-    Signed-off-by: Brandon Philips <brandon@ifup.org>
-
-diff --git a/libmisc/quote.c b/libmisc/quote.c
-index f98c887..bf8f9eb 100644
---- a/libmisc/quote.c
-+++ b/libmisc/quote.c
-@@ -20,6 +20,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <ctype.h>
-+#include <string.h>
- #include "misc.h"
- 
- const char *quote(const char *str, const char *quote_chars)
diff --git a/meta/recipes-support/attr/attr-2.4.44/thinko-in-restore.patch b/meta/recipes-support/attr/attr-2.4.44/thinko-in-restore.patch
deleted file mode 100644
index a84de94..0000000
--- a/meta/recipes-support/attr/attr-2.4.44/thinko-in-restore.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-commit e8d568c696692eed5c92d5a35498e1c26e13d6b3
-Author: Kamil Dudka <kdudka@redhat.com>
-Date:   Thu Jun 3 15:30:19 2010 +0200
-
-    setfattr.c: fix thinko in restore()
-
-diff --git a/setfattr/setfattr.c b/setfattr/setfattr.c
-index 491c25a..0a14cfa 100644
---- a/setfattr/setfattr.c
-+++ b/setfattr/setfattr.c
-@@ -120,7 +120,7 @@ int restore(const char *filename)
- 			break;
- 		line++;
- 		if (strncmp(l, "# file: ", 8) != 0) {
--			if (filename) {
-+			if (file != stdin) {
- 				fprintf(stderr, _("%s: %s: No filename found "
- 				                  "in line %d, aborting\n"),
- 					progname, filename, backup_line);
diff --git a/meta/recipes-support/attr/attr_2.4.44.bb b/meta/recipes-support/attr/attr_2.4.44.bb
deleted file mode 100644
index a0945f1..0000000
--- a/meta/recipes-support/attr/attr_2.4.44.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require attr.inc
-
-PR = "r3"
-
-SRC_URI += "file://memory-leak-in-copy.patch \
-            file://memory-leak2.patch \
-            file://double-free.patch \
-            file://pull-in-string.h.patch \
-            file://thinko-in-restore.patch"
-
-SRC_URI[md5sum] = "d132c119831c27350e10b9f885711adc"
-SRC_URI[sha256sum] = "9f6214b8e53f4bba651ac5a72c0f6193b12aa21fbf1d675d89a7b4bc45264498"
diff --git a/meta/recipes-support/attr/attr_2.4.46.bb b/meta/recipes-support/attr/attr_2.4.46.bb
new file mode 100644
index 0000000..9fef41b
--- /dev/null
+++ b/meta/recipes-support/attr/attr_2.4.46.bb
@@ -0,0 +1,6 @@
+require attr.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "db557c17fdfa4f785333ecda08654010"
+SRC_URI[sha256sum] = "dcd69bdca7ff166bc45141eddbcf21967999a6b66b0544be12a1cc2fd6340e1f"
diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index a09c31c..afe2f1c 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -1,7 +1,7 @@
 # this build system is mostly shared by attr and acl
 
 SRC_URI += "file://relative-libdir.patch;striplevel=0 \
-            file://no-fixed-prog-path.patch"
+           "
 
 inherit autotools gettext
 
diff --git a/meta/recipes-support/attr/files/no-fixed-prog-path.patch b/meta/recipes-support/attr/files/no-fixed-prog-path.patch
deleted file mode 100644
index 88d9c0e..0000000
--- a/meta/recipes-support/attr/files/no-fixed-prog-path.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-Not using fixed utility path, but respect $PATH
-
-10/09/2010 - created by Qing He <qing.he@intel.com>
-
-diff --git a/m4/package_utilies.m4 b/m4/package_utilies.m4
-index 165db35..0afe578 100644
---- a/m4/package_utilies.m4
-+++ b/m4/package_utilies.m4
-@@ -37,22 +37,22 @@ AC_DEFUN([AC_PACKAGE_UTILITIES],
-     AC_PACKAGE_NEED_UTILITY($1, "$cc", cc, [C compiler])
- 
-     if test -z "$MAKE"; then
--        AC_PATH_PROG(MAKE, gmake,, /usr/bin:/usr/local/bin:/usr/freeware/bin)
-+        AC_PATH_PROG(MAKE, gmake)
-     fi
-     if test -z "$MAKE"; then
--        AC_PATH_PROG(MAKE, make,, /usr/bin)
-+        AC_PATH_PROG(MAKE, make)
-     fi
-     make=$MAKE
-     AC_SUBST(make)
-     AC_PACKAGE_NEED_UTILITY($1, "$make", make, [GNU make])
- 
-     if test -z "$TAR"; then
--        AC_PATH_PROG(TAR, tar,, /usr/freeware/bin:/bin:/usr/local/bin:/usr/bin)
-+        AC_PATH_PROG(TAR, tar)
-     fi
-     tar=$TAR
-     AC_SUBST(tar)
-     if test -z "$ZIP"; then
--        AC_PATH_PROG(ZIP, gzip,, /bin:/usr/bin:/usr/local/bin:/usr/freeware/bin)
-+        AC_PATH_PROG(ZIP, gzip)
-     fi
- 
-     zip=$ZIP
-@@ -65,25 +65,25 @@ AC_DEFUN([AC_PACKAGE_UTILITIES],
-     AC_SUBST(makedepend)
- 
-     if test -z "$AWK"; then
--        AC_PATH_PROG(AWK, awk,, /bin:/usr/bin)
-+        AC_PATH_PROG(AWK, awk)
-     fi
-     awk=$AWK
-     AC_SUBST(awk)
- 
-     if test -z "$SED"; then
--        AC_PATH_PROG(SED, sed,, /bin:/usr/bin)
-+        AC_PATH_PROG(SED, sed)
-     fi
-     sed=$SED
-     AC_SUBST(sed)
- 
-     if test -z "$ECHO"; then
--        AC_PATH_PROG(ECHO, echo,, /bin:/usr/bin)
-+        AC_PATH_PROG(ECHO, echo)
-     fi
-     echo=$ECHO
-     AC_SUBST(echo)
- 
-     if test -z "$SORT"; then
--        AC_PATH_PROG(SORT, sort,, /bin:/usr/bin)
-+        AC_PATH_PROG(SORT, sort)
-     fi
-     sort=$SORT
-     AC_SUBST(sort)
-@@ -93,21 +93,21 @@ AC_DEFUN([AC_PACKAGE_UTILITIES],
- 
-     if test "$enable_gettext" = yes; then
-         if test -z "$MSGFMT"; then
--                AC_PATH_PROG(MSGFMT, msgfmt,, /usr/bin:/usr/local/bin:/usr/freeware/bin)
-+                AC_PATH_PROG(MSGFMT, msgfmt)
-         fi
-         msgfmt=$MSGFMT
-         AC_SUBST(msgfmt)
-         AC_PACKAGE_NEED_UTILITY($1, "$msgfmt", msgfmt, gettext)
- 
-         if test -z "$MSGMERGE"; then
--                AC_PATH_PROG(MSGMERGE, msgmerge,, /usr/bin:/usr/local/bin:/usr/freeware/bin)
-+                AC_PATH_PROG(MSGMERGE, msgmerge)
-         fi
-         msgmerge=$MSGMERGE
-         AC_SUBST(msgmerge)
-         AC_PACKAGE_NEED_UTILITY($1, "$msgmerge", msgmerge, gettext)
- 
-         if test -z "$XGETTEXT"; then
--                AC_PATH_PROG(XGETTEXT, xgettext,, /usr/bin:/usr/local/bin:/usr/freeware/bin)
-+                AC_PATH_PROG(XGETTEXT, xgettext)
-         fi
-         xgettext=$XGETTEXT
-         AC_SUBST(xgettext)
-@@ -117,7 +117,7 @@ AC_DEFUN([AC_PACKAGE_UTILITIES],
-     fi
- 
-     if test -z "$RPM"; then
--        AC_PATH_PROG(RPM, rpm,, /bin:/usr/bin:/usr/freeware/bin)
-+        AC_PATH_PROG(RPM, rpm)
-     fi
-     rpm=$RPM
-     AC_SUBST(rpm)
-- 
1.7.4.1



