Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 289D06013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 09:18:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2Q9IAm5026212
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 02:18:10 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Mar 2015 02:18:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Mar 2015 02:18:09 -0700
Message-ID: <c765b24f653bb5d9c871363648bbcbf95d52f514.1427361444.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1427361444.git.liezhi.yang@windriver.com>
References: <cover.1427361444.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cpio: fix CVE-2015-1197
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
X-List-Received-Date: Thu, 26 Mar 2015 09:18:11 -0000
Content-Type: text/plain

Additional directory traversal vulnerability via symlinks
cpio CVE-2015-1197

Initial report:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=774669
Upstream report:
https://lists.gnu.org/archive/html/bug-cpio/2015-01/msg00000.html

And fix the indent in SRC_URI.

[YOCTO #7182]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../cpio/cpio-2.11/cpio-CVE-2015-1197.patch        |  154 ++++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.11.bb            |    3 +-
 2 files changed, 156 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/cpio-CVE-2015-1197.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.11/cpio-CVE-2015-1197.patch b/meta/recipes-extended/cpio/cpio-2.11/cpio-CVE-2015-1197.patch
new file mode 100644
index 0000000..b54afb8
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.11/cpio-CVE-2015-1197.patch
@@ -0,0 +1,154 @@
+Description: CVE-2015-1197
+ Apply patch by Vitezslav Cizek of SuSE to fix CVE-2015-1197.
+ Upstream is dormant or no longer existing. To restore the old
+ behaviour use --extract-over-symlinks (Closes: #774669)
+ This issue has been discovered by Alexander Cherepanov.
+Author: Vitezslav Cizek <vcizek@suse.cz>
+Bug-Debian: https://bugs.debian.org/774669
+
+Upstream-Status: Backport
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+--- cpio-2.11+dfsg.orig/doc/cpio.1
++++ cpio-2.11+dfsg/doc/cpio.1
+@@ -22,6 +22,7 @@ cpio \- copy files to and from archives
+ [\-\-owner=[user][:.][group]] [\-\-no-preserve-owner] [\-\-message=message]
+ [\-\-force\-local] [\-\-no\-absolute\-filenames] [\-\-sparse]
+ [\-\-only\-verify\-crc] [\-\-to\-stdout] [\-\-quiet] [\-\-rsh-command=command]
++[\-\-extract\-over\-symlinks]
+ [\-\-help] [\-\-version] [pattern...] [< archive]
+ 
+ .B cpio
+--- cpio-2.11+dfsg.orig/src/copyin.c
++++ cpio-2.11+dfsg/src/copyin.c
+@@ -700,6 +700,51 @@ copyin_link (struct cpio_file_stat *file
+   free (link_name);
+ }
+ 
++
++static int
++path_contains_symlink(char *path)
++{
++  struct stat st;
++  char *slash;
++  char *nextslash;
++
++  /* we got NULL pointer or empty string */
++  if (!path || !*path) {
++    return false;
++  }
++
++  slash = path;
++
++  while ((nextslash = strchr(slash + 1, '/')) != NULL) {
++    slash = nextslash;
++    *slash = '\0';
++
++    if (lstat(path, &st) != 0) {
++      if (errno == ELOOP) {
++        /* ELOOP - too many symlinks */
++        *slash = '/';
++        return true;
++      } else if (errno == ENOMEM) {
++        /* No memory for lstat - terminate */
++        xalloc_die();
++      } else {
++        /* cannot lstat path - give up */
++        *slash = '/';
++        return false;
++      }
++    }
++
++    if (S_ISLNK(st.st_mode)) {
++      *slash = '/';
++      return true;
++    }
++
++    *slash = '/';
++  }
++
++  return false;
++}
++
+ static void
+ copyin_file (struct cpio_file_stat *file_hdr, int in_file_des)
+ {
+@@ -1471,6 +1516,23 @@ process_copy_in ()
+ 	{
+ 	  /* Copy the input file into the directory structure.  */
+ 
++          /* Can we write files over symlinks? */
++          if (!extract_over_symlinks)
++            {
++              if (path_contains_symlink(file_hdr.c_name))
++                {
++                  /* skip the file */
++                  /*
++                  fprintf(stderr, "Can't write over symlinks. Skipping %s\n", file_hdr.c_name);
++                  tape_toss_input (in_file_des, file_hdr.c_filesize);
++                  tape_skip_padding (in_file_des, file_hdr.c_filesize);
++                  continue;
++                  */
++                  /* terminate */
++	          error (1, 0, _("Can't write over symlinks: %s\n"), file_hdr.c_name);
++                }
++            }
++
+ 	  /* Do we need to rename the file? */
+ 	  if (rename_flag || rename_batch_file)
+ 	    {
+--- cpio-2.11+dfsg.orig/src/extern.h
++++ cpio-2.11+dfsg/src/extern.h
+@@ -95,6 +95,7 @@ extern char input_is_special;
+ extern char output_is_special;
+ extern char input_is_seekable;
+ extern char output_is_seekable;
++extern bool extract_over_symlinks;
+ extern int (*xstat) ();
+ extern void (*copy_function) ();
+ 
+--- cpio-2.11+dfsg.orig/src/global.c
++++ cpio-2.11+dfsg/src/global.c
+@@ -187,6 +187,9 @@ bool to_stdout_option = false;
+ /* The name this program was run with.  */
+ char *program_name;
+ 
++/* Extract files over symbolic links */
++bool extract_over_symlinks;
++
+ /* A pointer to either lstat or stat, depending on whether
+    dereferencing of symlinks is done for input files.  */
+ int (*xstat) ();
+--- cpio-2.11+dfsg.orig/src/main.c
++++ cpio-2.11+dfsg/src/main.c
+@@ -57,7 +57,8 @@ enum cpio_options {
+   FORCE_LOCAL_OPTION,            
+   DEBUG_OPTION,                  
+   BLOCK_SIZE_OPTION,             
+-  TO_STDOUT_OPTION
++  TO_STDOUT_OPTION,
++  EXTRACT_OVER_SYMLINKS
+ };
+ 
+ const char *program_authors[] =
+@@ -222,6 +223,8 @@ static struct argp_option options[] = {
+    N_("Create leading directories where needed"), GRID+1 },
+   {"no-preserve-owner", NO_PRESERVE_OWNER_OPTION, 0, 0,
+    N_("Do not change the ownership of the files"), GRID+1 },
++  {"extract-over-symlinks", EXTRACT_OVER_SYMLINKS, 0, 0,
++   N_("Force writing over symbolic links"), GRID+1 },
+   {"unconditional", 'u', NULL, 0,
+    N_("Replace all files unconditionally"), GRID+1 },
+   {"sparse", SPARSE_OPTION, NULL, 0,
+@@ -412,6 +415,10 @@ crc newc odc bin ustar tar (all-caps als
+       no_chown_flag = true;
+       break;
+ 
++    case EXTRACT_OVER_SYMLINKS:		        /* --extract-over-symlinks */
++      extract_over_symlinks = true;
++      break;
++
+     case 'o':		/* Copy-out mode.  */
+       if (copy_function != 0)
+ 	error (PAXEXIT_FAILURE, 0, _("Mode already defined"));
diff --git a/meta/recipes-extended/cpio/cpio_2.11.bb b/meta/recipes-extended/cpio/cpio_2.11.bb
index c42db6f..053888f 100644
--- a/meta/recipes-extended/cpio/cpio_2.11.bb
+++ b/meta/recipes-extended/cpio/cpio_2.11.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 PR = "r5"
 
 SRC_URI += "file://remove-gets.patch \
-	    file://fix-memory-overrun.patch \
+        file://fix-memory-overrun.patch \
+        file://cpio-CVE-2015-1197.patch \
            "
 
 SRC_URI[md5sum] = "1112bb6c45863468b5496ba128792f6c"
-- 
1.7.9.5


