Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id D8E2360EE0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 21:03:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 2FD06A61C6;
	Thu, 17 Oct 2013 23:03:32 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: ross.burton@intel.com
Date: Thu, 17 Oct 2013 23:03:22 +0200
Message-Id: <1382043802-9245-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1382043802-9245-1-git-send-email-eric@eukrea.com>
References: <1382043802-9245-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH for danny - v2 3/3] elfutils-native: Fix build on distros with gcc 4.8
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
X-List-Received-Date: Thu, 17 Oct 2013 21:03:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

backport of : c1cbc57 5cc3b4f 6101097

Signed-of-by: Eric Bénard <eirc@eukrea.com>
---
 .../elfutils-ar-c-fix-num-passed-to-memset.patch   | 23 +++++++++++
 .../elfutils/elfutils/fix-build-gcc-4.8.patch      | 44 ++++++++++++++++++++++
 ...ssed-to-snprintf-for-invalid-sh_name-case.patch | 27 +++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |  3 ++
 4 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils/elfutils-ar-c-fix-num-passed-to-memset.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils/elfutils-ar-c-fix-num-passed-to-memset.patch b/meta/recipes-devtools/elfutils/elfutils/elfutils-ar-c-fix-num-passed-to-memset.patch
new file mode 100644
index 0000000..b619619
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils/elfutils-ar-c-fix-num-passed-to-memset.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Backport
+
+ar.c (do_oper_delete): Fix num passed to memset
+native build failed as following on Fedora18+: 
+ar.c: In function 'do_oper_delete':
+ar.c:918:31: error: argument to 'sizeof' in 'memset' call is the same expression as the destination; did you mean to dereference it? [-Werror=sizeof-pointer-memaccess]
+   memset (found, '\0', sizeof (found));
+                                ^
+The original commit is http://git.fedorahosted.org/cgit/elfutils.git/commit/src/ar.c?id=1a4d0668d18bf1090c5c08cdb5cb3ba2b8eb5410
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+
+--- elfutils-0.148/src/ar.c.org	2013-03-12 21:12:17.928281375 -0500
++++ elfutils-0.148/src/ar.c	2013-03-12 21:15:30.053285271 -0500
+@@ -915,7 +915,7 @@
+ 		long int instance)
+ {
+   bool *found = alloca (sizeof (bool) * argc);
+-  memset (found, '\0', sizeof (found));
++  memset (found, '\0', sizeof (bool) * argc);
+ 
+   /* List of the files we keep.  */
+   struct armem *to_copy = NULL;
diff --git a/meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch b/meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch
new file mode 100644
index 0000000..a7c3519
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch
@@ -0,0 +1,44 @@
+This patch fixes a warning seen with gcc 4.8 (especially on ubuntu 13.10)
+
+| addr2line.c: In function 'handle_address':
+| addr2line.c:450:7: error: format '%a' expects argument of type 'float *', but argument 3 has type 'char **' [-Werror=format=]
+|        if (sscanf (string, "(%a[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
+|        ^
+| addr2line.c:453:7: error: format '%a' expects argument of type 'float *', but argument 3 has type 'char **' [-Werror=format=]
+|        switch (sscanf (string, "%a[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
+|        ^
+| cc1: all warnings being treated as errors
+
+
+%a is old GNU style and should be abandoned in favor of %m
+
+Also see
+
+http://gcc.gnu.org/bugzilla/show_bug.cgi?id=54361
+
+to support this assertion
+
+This patch is added via redhat-compatibility patch so lets revert this part
+here.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [Caused by an earlier patch]
+
+Index: elfutils-0.155/src/addr2line.c
+===================================================================
+--- elfutils-0.155.orig/src/addr2line.c
++++ elfutils-0.155/src/addr2line.c
+@@ -447,10 +447,10 @@ handle_address (const char *string, Dwfl
+       bool parsed = false;
+       int i, j;
+       char *name = NULL;
+-      if (sscanf (string, "(%a[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
++      if (sscanf (string, "(%m[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
+ 	  && string[i] == '\0')
+ 	parsed = adjust_to_section (name, &addr, dwfl);
+-      switch (sscanf (string, "%a[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
++      switch (sscanf (string, "%m[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
+ 	{
+ 	default:
+ 	  break;
diff --git a/meta/recipes-devtools/elfutils/elfutils/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch b/meta/recipes-devtools/elfutils/elfutils/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch
new file mode 100644
index 0000000..2b5dad3
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Backport
+
+nm: Fix size passed to snprintf for invalid sh_name case.
+native build failed as following on Fedora18:
+nm.c: In function 'show_symbols_sysv':
+nm.c:756:27: error: argument to 'sizeof' in 'snprintf' call is the same expression as the destination; did you mean to provide an explicit length? [-Werror=sizeof-pointer-memaccess]
+    snprintf (name, sizeof name, "[invalid sh_name %#" PRIx32 "]",
+                           ^
+
+The original commit is http://git.fedorahosted.org/cgit/elfutils.git/commit/src/nm.c?id=57bd66cabf6e6b9ecf622cdbf350804897a8df58
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+
+--- elfutils-0.148/src/nm.c.org	2013-03-11 22:36:11.000000000 -0500
++++ elfutils-0.148/src/nm.c	2013-03-11 22:46:09.000000000 -0500
+@@ -752,8 +752,9 @@
+ 			       gelf_getshdr (scn, &shdr_mem)->sh_name);
+       if (unlikely (name == NULL))
+ 	{
+-	  name = alloca (sizeof "[invalid sh_name 0x12345678]");
+-	  snprintf (name, sizeof name, "[invalid sh_name %#" PRIx32 "]",
++	  const size_t bufsz = sizeof "[invalid sh_name 0x12345678]";
++	  name = alloca (bufsz);
++	  snprintf (name, bufsz, "[invalid sh_name %#" PRIx32 "]",
+ 		    gelf_getshdr (scn, &shdr_mem)->sh_name);
+ 	}
+       scnnames[elf_ndxscn (scn)] = name;
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 5d45f3a..a54657e 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -31,6 +31,9 @@ SRC_URI += "\
 	file://mempcpy.patch \
 	file://fix_for_gcc-4.7.patch \
 	file://dso-link-change.patch \
+	file://fix-build-gcc-4.8.patch \
+	file://nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch \
+	file://elfutils-ar-c-fix-num-passed-to-memset.patch \
 "
 # Only apply when building uclibc based target recipe
 SRC_URI_append_libc-uclibc = " file://uclibc-support.patch"
-- 
1.8.3.1


