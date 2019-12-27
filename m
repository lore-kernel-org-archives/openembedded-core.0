Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5A6756C37E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2019 08:08:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xBR887AA016346
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2019 00:08:07 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 27 Dec 2019 00:08:06 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Dec 2019 16:08:05 +0800
Message-ID: <1577434085-16539-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] cpio: remove unused CVE patch
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
X-List-Received-Date: Fri, 27 Dec 2019 08:08:06 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

According to the home page, https://www.gnu.org/software/cpio/,
CVE-2015-1197 have been fix in version 2.13, so removed
this patch get from SUSE

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../cpio/cpio-2.13/0001-Fix-CVE-2015-1197.patch    | 178 ---------------------
 meta/recipes-extended/cpio/cpio_2.13.bb            |   1 -
 2 files changed, 179 deletions(-)
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Fix-CVE-2015-1197.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.13/0001-Fix-CVE-2015-1197.patch b/meta/recipes-extended/cpio/cpio-2.13/0001-Fix-CVE-2015-1197.patch
deleted file mode 100644
index 5c99919..0000000
--- a/meta/recipes-extended/cpio/cpio-2.13/0001-Fix-CVE-2015-1197.patch
+++ /dev/null
@@ -1,178 +0,0 @@
-From dcee489f821c1260a0136fcdfdb6ff4dd11086ac Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 9 Dec 2015 17:58:03 +0200
-Subject: [PATCH] Fix CVE-2015-1197
-
-Apply patch by Vitezslav Cizek of SuSE to fix CVE-2015-1197.
-Upstream is dormant or no longer existing. To restore the old
-behaviour use --extract-over-symlinks (Closes: #774669)
-This issue has been discovered by Alexander Cherepanov.
-Author: Vitezslav Cizek <vcizek@suse.cz>
-Bug-Debian: https://bugs.debian.org/774669
-
-Upstream-Status: Pending
-CVE: CVE-2015-1197
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- doc/cpio.1   |  1 +
- src/copyin.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- src/extern.h |  1 +
- src/global.c |  3 +++
- src/main.c   |  7 +++++++
- 5 files changed, 74 insertions(+)
-
-diff --git a/doc/cpio.1 b/doc/cpio.1
-index 2a68241..dc4676c 100644
---- a/doc/cpio.1
-+++ b/doc/cpio.1
-@@ -49,6 +49,7 @@ cpio \- copy files to and from archives
- [\fB\-\-no\-preserve\-owner\fR] [\fB\-\-message=\fIMESSAGE\fR]
- [\fB\-\-force\-local\fR] [\fB\-\-no\-absolute\-filenames\fR] [\fB\-\-sparse\fR]
- [\fB\-\-only\-verify\-crc\fR] [\fB\-\-to\-stdout\fR] [\fB\-\-quiet\fR]
-+[\fB\-\-extract\-over\-symlinks\fR]
- [\fB\-\-rsh\-command=\fICOMMAND\fR]
- [\fIpattern\fR...] [\fB<\fR \fIarchive\fR]
- 
-diff --git a/src/copyin.c b/src/copyin.c
-index cde911e..053afe7 100644
---- a/src/copyin.c
-+++ b/src/copyin.c
-@@ -695,6 +695,51 @@ copyin_link (struct cpio_file_stat *file_hdr, int in_file_des)
-   free (link_name);
- }
- 
-+
-+static int
-+path_contains_symlink(char *path)
-+{
-+  struct stat st;
-+  char *slash;
-+  char *nextslash;
-+
-+  /* we got NULL pointer or empty string */
-+  if (!path || !*path) {
-+    return false;
-+  }
-+
-+  slash = path;
-+
-+  while ((nextslash = strchr(slash + 1, '/')) != NULL) {
-+    slash = nextslash;
-+    *slash = '\0';
-+
-+    if (lstat(path, &st) != 0) {
-+      if (errno == ELOOP) {
-+        /* ELOOP - too many symlinks */
-+        *slash = '/';
-+        return true;
-+      } else if (errno == ENOMEM) {
-+        /* No memory for lstat - terminate */
-+        xalloc_die();
-+      } else {
-+        /* cannot lstat path - give up */
-+        *slash = '/';
-+        return false;
-+      }
-+    }
-+
-+    if (S_ISLNK(st.st_mode)) {
-+      *slash = '/';
-+      return true;
-+    }
-+
-+    *slash = '/';
-+  }
-+
-+  return false;
-+}
-+
- static void
- copyin_file (struct cpio_file_stat *file_hdr, int in_file_des)
- {
-@@ -1468,6 +1513,23 @@ process_copy_in ()
- 	{
- 	  /* Copy the input file into the directory structure.  */
- 
-+          /* Can we write files over symlinks? */
-+          if (!extract_over_symlinks)
-+            {
-+              if (path_contains_symlink(file_hdr.c_name))
-+                {
-+                  /* skip the file */
-+                  /*
-+                  fprintf(stderr, "Can't write over symlinks. Skipping %s\n", file_hdr.c_name);
-+                  tape_toss_input (in_file_des, file_hdr.c_filesize);
-+                  tape_skip_padding (in_file_des, file_hdr.c_filesize);
-+                  continue;
-+                  */
-+                  /* terminate */
-+	          error (1, 0, _("Can't write over symlinks: %s\n"), file_hdr.c_name);
-+                }
-+            }
-+
- 	  /* Do we need to rename the file? */
- 	  if (rename_flag || rename_batch_file)
- 	    {
-diff --git a/src/extern.h b/src/extern.h
-index e27d662..d864bde 100644
---- a/src/extern.h
-+++ b/src/extern.h
-@@ -96,6 +96,7 @@ extern char input_is_special;
- extern char output_is_special;
- extern char input_is_seekable;
- extern char output_is_seekable;
-+extern bool extract_over_symlinks;
- extern int (*xstat) ();
- extern void (*copy_function) ();
- extern char *change_directory_option;
-diff --git a/src/global.c b/src/global.c
-index 57e505a..336fce4 100644
---- a/src/global.c
-+++ b/src/global.c
-@@ -187,6 +187,9 @@ bool to_stdout_option = false;
- /* The name this program was run with.  */
- char *program_name;
- 
-+/* Extract files over symbolic links */
-+bool extract_over_symlinks;
-+
- /* A pointer to either lstat or stat, depending on whether
-    dereferencing of symlinks is done for input files.  */
- int (*xstat) ();
-diff --git a/src/main.c b/src/main.c
-index a13861f..87cb309 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -59,6 +59,7 @@ enum cpio_options {
-   DEBUG_OPTION,                  
-   BLOCK_SIZE_OPTION,             
-   TO_STDOUT_OPTION,
-+  EXTRACT_OVER_SYMLINKS,
-   RENUMBER_INODES_OPTION,
-   IGNORE_DEVNO_OPTION,
-   DEVICE_INDEPENDENT_OPTION
-@@ -243,6 +244,8 @@ static struct argp_option options[] = {
-    N_("Create leading directories where needed"), GRID+1 },
-   {"no-preserve-owner", NO_PRESERVE_OWNER_OPTION, 0, 0,
-    N_("Do not change the ownership of the files"), GRID+1 },
-+  {"extract-over-symlinks", EXTRACT_OVER_SYMLINKS, 0, 0,
-+   N_("Force writing over symbolic links"), GRID+1 },
-   {"unconditional", 'u', NULL, 0,
-    N_("Replace all files unconditionally"), GRID+1 },
-   {"sparse", SPARSE_OPTION, NULL, 0,
-@@ -432,6 +435,10 @@ crc newc odc bin ustar tar (all-caps also recognized)"), arg));
-       no_chown_flag = true;
-       break;
- 
-+    case EXTRACT_OVER_SYMLINKS:                        /* --extract-over-symlinks */
-+      extract_over_symlinks = true;
-+      break;
-+
-     case 'o':		/* Copy-out mode.  */
-       if (copy_function != 0)
- 	USAGE_ERROR ((0, 0, _("Mode already defined")));
--- 
-2.6.2
-
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
index 69615a9..ecea8c6 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
-           file://0001-Fix-CVE-2015-1197.patch \
            "
 
 SRC_URI[md5sum] = "389c5452d667c23b5eceb206f5000810"
-- 
2.7.4


