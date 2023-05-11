Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A57C77B7F
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 17:16:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2535.1683825371689130436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 10:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5F00113E;
	Thu, 11 May 2023 10:16:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 925C03F67D;
	Thu, 11 May 2023 10:16:10 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] cpio: upgrade to 2.14
Date: Thu, 11 May 2023 18:16:09 +0100
Message-Id: <20230511171609.2000501-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 17:16:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181139

From: Ross Burton <ross.burton@arm.com>

Specifically this includes the commit "Fix appending to archives bigger
than 2G".

Drop all submitted patches.

Apply a patch from git to fix the build with clang.

[ YOCTO #11674 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...charset_alias-when-building-for-musl.patch |  30 -
 .../0001-Use-__alignof__-with-clang.patch     |  42 --
 ...g-CRC-with-ASCII-CRC-for-large-files.patch |  39 --
 .../0001-obstack-Fix-a-clang-warning.patch    |  27 -
 ...ove-superfluous-declaration-of-progr.patch |  28 -
 .../cpio/cpio-2.13/CVE-2021-38185.patch       | 581 ------------------
 .../cpio/{cpio_2.13.bb =3D> cpio_2.14.bb}       |  10 +-
 ...e-needed-header-for-major-minor-macr.patch |  48 ++
 .../cpio/{cpio-2.13 =3D> files}/run-ptest       |   0
 .../cpio/{cpio-2.13 =3D> files}/test.sh         |   0
 10 files changed, 50 insertions(+), 755 deletions(-)
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Unset-need_=
charset_alias-when-building-for-musl.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Use-__align=
of__-with-clang.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-w=
ith-ASCII-CRC-for-large-files.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-obstack-Fix=
-a-clang-warning.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/0002-src-global.=
c-Remove-superfluous-declaration-of-progr.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/CVE-2021-38185.p=
atch
 rename meta/recipes-extended/cpio/{cpio_2.13.bb =3D> cpio_2.14.bb} (84%)
 create mode 100644 meta/recipes-extended/cpio/files/0001-configure-Inclu=
de-needed-header-for-major-minor-macr.patch
 rename meta/recipes-extended/cpio/{cpio-2.13 =3D> files}/run-ptest (100%=
)
 rename meta/recipes-extended/cpio/{cpio-2.13 =3D> files}/test.sh (100%)

diff --git a/meta/recipes-extended/cpio/cpio-2.13/0001-Unset-need_charset=
_alias-when-building-for-musl.patch b/meta/recipes-extended/cpio/cpio-2.1=
3/0001-Unset-need_charset_alias-when-building-for-musl.patch
deleted file mode 100644
index 6ae213942c2..00000000000
--- a/meta/recipes-extended/cpio/cpio-2.13/0001-Unset-need_charset_alias-=
when-building-for-musl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 17:02:13 -0700
-Subject: [PATCH] Unset need_charset_alias when building for musl
-
-localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
-which actually shoudl be fixed in gnulib and then all downstream
-projects will get it eventually. For now we apply the fix to
-coreutils
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/gnulib.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: cpio-2.11/gnu/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- cpio-2.11.orig/gnu/Makefile.am
-+++ cpio-2.11/gnu/Makefile.am
-@@ -734,7 +734,7 @@ install-exec-localcharset: all-local
- 	  case '$(host_os)' in \
- 	    darwin[56]*) \
- 	      need_charset_alias=3Dtrue ;; \
--	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
-+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
- 	      need_charset_alias=3Dfalse ;; \
- 	    *) \
- 	      need_charset_alias=3Dtrue ;; \
diff --git a/meta/recipes-extended/cpio/cpio-2.13/0001-Use-__alignof__-wi=
th-clang.patch b/meta/recipes-extended/cpio/cpio-2.13/0001-Use-__alignof_=
_-with-clang.patch
deleted file mode 100644
index d637e70395f..00000000000
--- a/meta/recipes-extended/cpio/cpio-2.13/0001-Use-__alignof__-with-clan=
g.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 6e169bb5fadb73b4dd300b28e9cae1e1772855e8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Jan 2023 02:05:23 -0800
-Subject: [PATCH] Use __alignof__ with clang.
-
-For clang versions < 8, use the same
-workaround as for GCC versions < 4.9.
-
-Backport couple of gnulib patches squashed
-
-[1] https://git.savannah.gnu.org/cgit/gnulib.git/commit/lib/stdalign.in.=
h?id=3D57caf9541d98314102a55dd1cd0b8dc2be747471
-[2] https://git.savannah.gnu.org/cgit/gnulib.git/commit/lib/stdalign.in.=
h?id=3D2af490a4c4ce85567296e27be6a9528964ca851e
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gnulib.git/=
commit/lib/stdalign.in.h?id=3D57caf9541d98314102a55dd1cd0b8dc2be747471]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gnu/stdalign.in.h | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/gnu/stdalign.in.h b/gnu/stdalign.in.h
-index 5f56eee..e6e6a65 100644
---- a/gnu/stdalign.in.h
-+++ b/gnu/stdalign.in.h
-@@ -53,9 +53,12 @@
- #undef _Alignof
-=20
- /* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 5202=
3
--   <http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D52023>.  */
-+   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D52023>.
-+   clang versions < 8.0.0 have the same bug.  */
- #if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
--     || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9)))
-+     || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
-+         && !defined __clang__) \
-+     || (defined __clang__ && __clang_major__ < 8))
- # ifdef __cplusplus
- #  if 201103 <=3D __cplusplus
- #   define _Alignof(type) alignof (type)
---=20
-2.39.0
-
diff --git a/meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-with-ASC=
II-CRC-for-large-files.patch b/meta/recipes-extended/cpio/cpio-2.13/0001-=
Wrong-CRC-with-ASCII-CRC-for-large-files.patch
deleted file mode 100644
index 4b96e4316c2..00000000000
--- a/meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-with-ASCII-CRC-=
for-large-files.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 77ff5f1be394eb2c786df561ff37dde7f982ec76 Mon Sep 17 00:00:00 2001
-From: Stefano Babic <sbabic@denx.de>
-Date: Fri, 28 Jul 2017 13:20:52 +0200
-Subject: [PATCH] Wrong CRC with ASCII CRC for large files
-
-Due to signedness, the checksum is not computed when filesize is bigger
-a 2GB.
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-cpio/=
2017-07/msg00004.html]
-Signed-off-by: Stefano Babic <sbabic@denx.de>
----
- src/copyout.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/copyout.c b/src/copyout.c
-index 1f0987a..727aeca 100644
---- a/src/copyout.c
-+++ b/src/copyout.c
-@@ -34,13 +34,13 @@
-    compute and return a checksum for them.  */
-=20
- static uint32_t
--read_for_checksum (int in_file_des, int file_size, char *file_name)
-+read_for_checksum (int in_file_des, unsigned int file_size, char *file_=
name)
- {
-   uint32_t crc;
-   char buf[BUFSIZ];
--  int bytes_left;
--  int bytes_read;
--  int i;
-+  unsigned int bytes_left;
-+  unsigned int bytes_read;
-+  unsigned int i;
-=20
-   crc =3D 0;
-=20
---=20
-2.7.4
-
diff --git a/meta/recipes-extended/cpio/cpio-2.13/0001-obstack-Fix-a-clan=
g-warning.patch b/meta/recipes-extended/cpio/cpio-2.13/0001-obstack-Fix-a=
-clang-warning.patch
deleted file mode 100644
index 6f6e396ef38..00000000000
--- a/meta/recipes-extended/cpio/cpio-2.13/0001-obstack-Fix-a-clang-warni=
ng.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 02f1f63d3ff58f3473f1689a0322a234ce10b659 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 13 Jan 2023 22:13:45 -0800
-Subject: [PATCH] obstack: Fix a clang warning
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gnulib.git/=
commit/?id=3D0cc39712803ade7b2d4b89c36b143dad72404063]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gnu/obstack.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gnu/obstack.c b/gnu/obstack.c
-index 54b675d..4d6a1d5 100644
---- a/gnu/obstack.c
-+++ b/gnu/obstack.c
-@@ -326,7 +326,7 @@ int obstack_exit_failure =3D EXIT_FAILURE;
- #   include <libio/iolibio.h>
- #  endif
-=20
--static _Noreturn void
-+static __attribute_noreturn__ void
- print_and_abort (void)
- {
-   /* Don't change any of these strings.  Yes, it would be possible to a=
dd
---=20
-2.39.0
-
diff --git a/meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remov=
e-superfluous-declaration-of-progr.patch b/meta/recipes-extended/cpio/cpi=
o-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch
deleted file mode 100644
index 478324c1c48..00000000000
--- a/meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-super=
fluous-declaration-of-progr.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 33e6cb5a28fab3d99bd6818f8c01e6f33805390f Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Mon, 20 Jan 2020 07:45:39 +0200
-Subject: [PATCH] src/global.c: Remove superfluous declaration of program=
_name
-
-Upstream-Status: Backport (commit 641d3f4)
-Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
----
- src/global.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/global.c b/src/global.c
-index fb3abe9..acf92bc 100644
---- a/src/global.c
-+++ b/src/global.c
-@@ -184,9 +184,6 @@ unsigned int warn_option =3D 0;
- /* Extract to standard output? */
- bool to_stdout_option =3D false;
-=20
--/* The name this program was run with.  */
--char *program_name;
--
- /* A pointer to either lstat or stat, depending on whether
-    dereferencing of symlinks is done for input files.  */
- int (*xstat) ();
---=20
-2.26.2
-
diff --git a/meta/recipes-extended/cpio/cpio-2.13/CVE-2021-38185.patch b/=
meta/recipes-extended/cpio/cpio-2.13/CVE-2021-38185.patch
deleted file mode 100644
index 6ceafeee497..00000000000
--- a/meta/recipes-extended/cpio/cpio-2.13/CVE-2021-38185.patch
+++ /dev/null
@@ -1,581 +0,0 @@
-GNU cpio through 2.13 allows attackers to execute arbitrary code via a c=
rafted
-pattern file, because of a dstring.c ds_fgetstr integer overflow that tr=
iggers
-an out-of-bounds heap write.
-
-CVE: CVE-2021-38185
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From e494c68a3a0951b1eaba77e2db93f71a890e15d8 Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Sat, 7 Aug 2021 12:52:21 +0300
-Subject: [PATCH 1/3] Rewrite dynamic string support.
-
-* src/dstring.c (ds_init): Take a single argument.
-(ds_free): New function.
-(ds_resize): Take a single argument.  Use x2nrealloc to expand
-the storage.
-(ds_reset,ds_append,ds_concat,ds_endswith): New function.
-(ds_fgetstr): Rewrite.  In particular, this fixes integer overflow.
-* src/dstring.h (dynamic_string): Keep both the allocated length
-(ds_size) and index of the next free byte in the string (ds_idx).
-(ds_init,ds_resize): Change signature.
-(ds_len): New macro.
-(ds_free,ds_reset,ds_append,ds_concat,ds_endswith): New protos.
-* src/copyin.c: Use new ds_ functions.
-* src/copyout.c: Likewise.
-* src/copypass.c: Likewise.
-* src/util.c: Likewise.
----
- src/copyin.c   | 40 +++++++++++------------
- src/copyout.c  | 16 ++++-----
- src/copypass.c | 34 +++++++++----------
- src/dstring.c  | 88 ++++++++++++++++++++++++++++++++++++--------------
- src/dstring.h  | 31 +++++++++---------
- src/util.c     |  6 ++--
- 6 files changed, 123 insertions(+), 92 deletions(-)
-
-diff --git a/src/copyin.c b/src/copyin.c
-index b29f348..37e503a 100644
---- a/src/copyin.c
-+++ b/src/copyin.c
-@@ -55,11 +55,12 @@ query_rename(struct cpio_file_stat* file_hdr, FILE *=
tty_in, FILE *tty_out,
-   char *str_res;		/* Result for string function.  */
-   static dynamic_string new_name;	/* New file name for rename option.  =
*/
-   static int initialized_new_name =3D false;
-+
-   if (!initialized_new_name)
--  {
--    ds_init (&new_name, 128);
--    initialized_new_name =3D true;
--  }
-+    {
-+      ds_init (&new_name);
-+      initialized_new_name =3D true;
-+    }
-=20
-   if (rename_flag)
-     {
-@@ -779,37 +780,36 @@ long_format (struct cpio_file_stat *file_hdr, char=
 const *link_name)
-    already in `save_patterns' (from the command line) are preserved.  *=
/
-=20
- static void
--read_pattern_file ()
-+read_pattern_file (void)
- {
--  int max_new_patterns;
--  char **new_save_patterns;
--  int new_num_patterns;
-+  char **new_save_patterns =3D NULL;
-+  size_t max_new_patterns;
-+  size_t new_num_patterns;
-   int i;
--  dynamic_string pattern_name;
-+  dynamic_string pattern_name =3D DYNAMIC_STRING_INITIALIZER;
-   FILE *pattern_fp;
-=20
-   if (num_patterns < 0)
-     num_patterns =3D 0;
--  max_new_patterns =3D 1 + num_patterns;
--  new_save_patterns =3D (char **) xmalloc (max_new_patterns * sizeof (c=
har *));
-   new_num_patterns =3D num_patterns;
--  ds_init (&pattern_name, 128);
-+  max_new_patterns =3D num_patterns;
-+  new_save_patterns =3D xcalloc (max_new_patterns, sizeof (new_save_pat=
terns[0]));
-=20
-   pattern_fp =3D fopen (pattern_file_name, "r");
-   if (pattern_fp =3D=3D NULL)
-     open_fatal (pattern_file_name);
-   while (ds_fgetstr (pattern_fp, &pattern_name, '\n') !=3D NULL)
-     {
--      if (new_num_patterns >=3D max_new_patterns)
--	{
--	  max_new_patterns +=3D 1;
--	  new_save_patterns =3D (char **)
--	    xrealloc ((char *) new_save_patterns,
--		      max_new_patterns * sizeof (char *));
--	}
-+      if (new_num_patterns =3D=3D max_new_patterns)
-+	new_save_patterns =3D x2nrealloc (new_save_patterns,
-+					&max_new_patterns,
-+					sizeof (new_save_patterns[0]));
-       new_save_patterns[new_num_patterns] =3D xstrdup (pattern_name.ds_=
string);
-       ++new_num_patterns;
-     }
-+
-+  ds_free (&pattern_name);
-+ =20
-   if (ferror (pattern_fp) || fclose (pattern_fp) =3D=3D EOF)
-     close_error (pattern_file_name);
-=20
-@@ -1196,7 +1196,7 @@ swab_array (char *ptr, int count)
-    in the file system.  */
-=20
- void
--process_copy_in ()
-+process_copy_in (void)
- {
-   char done =3D false;		/* True if trailer reached.  */
-   FILE *tty_in =3D NULL;		/* Interactive file for rename option.  */
-diff --git a/src/copyout.c b/src/copyout.c
-index 8b0beb6..26e3dda 100644
---- a/src/copyout.c
-+++ b/src/copyout.c
-@@ -594,9 +594,10 @@ assign_string (char **pvar, char *value)
-    The format of the header depends on the compatibility (-c) flag.  */
-=20
- void
--process_copy_out ()
-+process_copy_out (void)
- {
--  dynamic_string input_name;	/* Name of file read from stdin.  */
-+  dynamic_string input_name =3D DYNAMIC_STRING_INITIALIZER;
-+                                /* Name of file read from stdin.  */
-   struct stat file_stat;	/* Stat record for file.  */
-   struct cpio_file_stat file_hdr =3D CPIO_FILE_STAT_INITIALIZER;
-                                 /* Output header information.  */
-@@ -605,7 +606,6 @@ process_copy_out ()
-   char *orig_file_name =3D NULL;
-=20
-   /* Initialize the copy out.  */
--  ds_init (&input_name, 128);
-   file_hdr.c_magic =3D 070707;
-=20
-   /* Check whether the output file might be a tape.  */
-@@ -657,14 +657,9 @@ process_copy_out ()
- 	    {
- 	      if (file_hdr.c_mode & CP_IFDIR)
- 		{
--		  int len =3D strlen (input_name.ds_string);
- 		  /* Make sure the name ends with a slash */
--		  if (input_name.ds_string[len-1] !=3D '/')
--		    {
--		      ds_resize (&input_name, len + 2);
--		      input_name.ds_string[len] =3D '/';
--		      input_name.ds_string[len+1] =3D 0;
--		    }
-+		  if (!ds_endswith (&input_name, '/'))
-+		    ds_append (&input_name, '/');
- 		}
- 	    }
- 	 =20
-@@ -875,6 +870,7 @@ process_copy_out ()
- 			 (unsigned long) blocks), (unsigned long) blocks);
-     }
-   cpio_file_stat_free (&file_hdr);
-+  ds_free (&input_name);
- }
-=20
-=20
-diff --git a/src/copypass.c b/src/copypass.c
-index dc13b5b..62f31c6 100644
---- a/src/copypass.c
-+++ b/src/copypass.c
-@@ -48,10 +48,12 @@ set_copypass_perms (int fd, const char *name, struct=
 stat *st)
-    If `link_flag', link instead of copying.  */
-=20
- void
--process_copy_pass ()
-+process_copy_pass (void)
- {
--  dynamic_string input_name;	/* Name of file from stdin.  */
--  dynamic_string output_name;	/* Name of new file.  */
-+  dynamic_string input_name =3D DYNAMIC_STRING_INITIALIZER;
-+                                /* Name of file from stdin.  */
-+  dynamic_string output_name =3D DYNAMIC_STRING_INITIALIZER;
-+                                /* Name of new file.  */
-   size_t dirname_len;		/* Length of `directory_name'.  */
-   int res;			/* Result of functions.  */
-   char *slash;			/* For moving past slashes in input name.  */
-@@ -65,25 +67,18 @@ process_copy_pass ()
- 				   created files  */
-=20
-   /* Initialize the copy pass.  */
--  ds_init (&input_name, 128);
-  =20
-   dirname_len =3D strlen (directory_name);
-   if (change_directory_option && !ISSLASH (directory_name[0]))
-     {
-       char *pwd =3D xgetcwd ();
--
--      dirname_len +=3D strlen (pwd) + 1;
--      ds_init (&output_name, dirname_len + 2);
--      strcpy (output_name.ds_string, pwd);
--      strcat (output_name.ds_string, "/");
--      strcat (output_name.ds_string, directory_name);
-+     =20
-+      ds_concat (&output_name, pwd);
-+      ds_append (&output_name, '/');
-     }
--  else
--    {
--      ds_init (&output_name, dirname_len + 2);
--      strcpy (output_name.ds_string, directory_name);
--    }
--  output_name.ds_string[dirname_len] =3D '/';
-+  ds_concat (&output_name, directory_name);
-+  ds_append (&output_name, '/');
-+  dirname_len =3D ds_len (&output_name);
-   output_is_seekable =3D true;
-=20
-   change_dir ();
-@@ -116,8 +111,8 @@ process_copy_pass ()
-       /* Make the name of the new file.  */
-       for (slash =3D input_name.ds_string; *slash =3D=3D '/'; ++slash)
- 	;
--      ds_resize (&output_name, dirname_len + strlen (slash) + 2);
--      strcpy (output_name.ds_string + dirname_len + 1, slash);
-+      ds_reset (&output_name, dirname_len);
-+      ds_concat (&output_name, slash);
-=20
-       existing_dir =3D false;
-       if (lstat (output_name.ds_string, &out_file_stat) =3D=3D 0)
-@@ -333,6 +328,9 @@ process_copy_pass ()
- 			 (unsigned long) blocks),
- 	       (unsigned long) blocks);
-     }
-+
-+  ds_free (&input_name);
-+  ds_free (&output_name);
- }
- =0C
- /* Try and create a hard link from FILE_NAME to another file=20
-diff --git a/src/dstring.c b/src/dstring.c
-index e9c063f..358f356 100644
---- a/src/dstring.c
-+++ b/src/dstring.c
-@@ -20,8 +20,8 @@
- #if defined(HAVE_CONFIG_H)
- # include <config.h>
- #endif
--
- #include <stdio.h>
-+#include <stdlib.h>
- #if defined(HAVE_STRING_H) || defined(STDC_HEADERS)
- #include <string.h>
- #else
-@@ -33,24 +33,41 @@
- /* Initialiaze dynamic string STRING with space for SIZE characters.  *=
/
-=20
- void
--ds_init (dynamic_string *string, int size)
-+ds_init (dynamic_string *string)
-+{
-+  memset (string, 0, sizeof *string);
-+}
-+
-+/* Free the dynamic string storage. */
-+
-+void
-+ds_free (dynamic_string *string)
- {
--  string->ds_length =3D size;
--  string->ds_string =3D (char *) xmalloc (size);
-+  free (string->ds_string);
- }
-=20
--/* Expand dynamic string STRING, if necessary, to hold SIZE characters.=
  */
-+/* Expand dynamic string STRING, if necessary.  */
-=20
- void
--ds_resize (dynamic_string *string, int size)
-+ds_resize (dynamic_string *string)
- {
--  if (size > string->ds_length)
-+  if (string->ds_idx =3D=3D string->ds_size)
-     {
--      string->ds_length =3D size;
--      string->ds_string =3D (char *) xrealloc ((char *) string->ds_stri=
ng, size);
-+      string->ds_string =3D x2nrealloc (string->ds_string, &string->ds_=
size,
-+				      1);
-     }
- }
-=20
-+/* Reset the index of the dynamic string S to LEN. */
-+
-+void
-+ds_reset (dynamic_string *s, size_t len)
-+{
-+  while (len > s->ds_size)
-+    ds_resize (s);
-+  s->ds_idx =3D len;
-+}
-+
- /* Dynamic string S gets a string terminated by the EOS character
-    (which is removed) from file F.  S will increase
-    in size during the function if the string from F is longer than
-@@ -61,34 +78,50 @@ ds_resize (dynamic_string *string, int size)
- char *
- ds_fgetstr (FILE *f, dynamic_string *s, char eos)
- {
--  int insize;			/* Amount needed for line.  */
--  int strsize;			/* Amount allocated for S.  */
-   int next_ch;
-=20
-   /* Initialize.  */
--  insize =3D 0;
--  strsize =3D s->ds_length;
-+  s->ds_idx =3D 0;
-=20
-   /* Read the input string.  */
--  next_ch =3D getc (f);
--  while (next_ch !=3D eos && next_ch !=3D EOF)
-+  while ((next_ch =3D getc (f)) !=3D eos && next_ch !=3D EOF)
-     {
--      if (insize >=3D strsize - 1)
--	{
--	  ds_resize (s, strsize * 2 + 2);
--	  strsize =3D s->ds_length;
--	}
--      s->ds_string[insize++] =3D next_ch;
--      next_ch =3D getc (f);
-+      ds_resize (s);
-+      s->ds_string[s->ds_idx++] =3D next_ch;
-     }
--  s->ds_string[insize++] =3D '\0';
-+  ds_resize (s);
-+  s->ds_string[s->ds_idx] =3D '\0';
-=20
--  if (insize =3D=3D 1 && next_ch =3D=3D EOF)
-+  if (s->ds_idx =3D=3D 0 && next_ch =3D=3D EOF)
-     return NULL;
-   else
-     return s->ds_string;
- }
-=20
-+void
-+ds_append (dynamic_string *s, int c)
-+{
-+  ds_resize (s);
-+  s->ds_string[s->ds_idx] =3D c;
-+  if (c)
-+    {
-+      s->ds_idx++;
-+      ds_resize (s);
-+      s->ds_string[s->ds_idx] =3D 0;
-+    }     =20
-+}
-+
-+void
-+ds_concat (dynamic_string *s, char const *str)
-+{
-+  size_t len =3D strlen (str);
-+  while (len + 1 > s->ds_size)
-+    ds_resize (s);
-+  memcpy (s->ds_string + s->ds_idx, str, len);
-+  s->ds_idx +=3D len;
-+  s->ds_string[s->ds_idx] =3D 0;
-+}
-+
- char *
- ds_fgets (FILE *f, dynamic_string *s)
- {
-@@ -100,3 +133,10 @@ ds_fgetname (FILE *f, dynamic_string *s)
- {
-   return ds_fgetstr (f, s, '\0');
- }
-+
-+/* Return true if the dynamic string S ends with character C. */
-+int
-+ds_endswith (dynamic_string *s, int c)
-+{
-+  return (s->ds_idx > 0 && s->ds_string[s->ds_idx - 1] =3D=3D c);
-+}
-diff --git a/src/dstring.h b/src/dstring.h
-index b5135fe..f5b04ef 100644
---- a/src/dstring.h
-+++ b/src/dstring.h
-@@ -17,10 +17,6 @@
-    Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
-    Boston, MA 02110-1301 USA.  */
-=20
--#ifndef NULL
--#define NULL 0
--#endif
--
- /* A dynamic string consists of record that records the size of an
-    allocated string and the pointer to that string.  The actual string
-    is a normal zero byte terminated string that can be used with the
-@@ -30,22 +26,25 @@
-=20
- typedef struct
- {
--  int ds_length;		/* Actual amount of storage allocated.  */
--  char *ds_string;		/* String.  */
-+  size_t ds_size;   /* Actual amount of storage allocated.  */
-+  size_t ds_idx;    /* Index of the next free byte in the string. */
-+  char *ds_string;  /* String storage. */
- } dynamic_string;
-=20
-+#define DYNAMIC_STRING_INITIALIZER { 0, 0, NULL }
-=20
--/* Macros that look similar to the original string functions.
--   WARNING:  These macros work only on pointers to dynamic string recor=
ds.
--   If used with a real record, an "&" must be used to get the pointer. =
 */
--#define ds_strlen(s)		strlen ((s)->ds_string)
--#define ds_strcmp(s1, s2)	strcmp ((s1)->ds_string, (s2)->ds_string)
--#define ds_strncmp(s1, s2, n)	strncmp ((s1)->ds_string, (s2)->ds_string=
, n)
--#define ds_index(s, c)		index ((s)->ds_string, c)
--#define ds_rindex(s, c)		rindex ((s)->ds_string, c)
-+void ds_init (dynamic_string *string);
-+void ds_free (dynamic_string *string);
-+void ds_reset (dynamic_string *s, size_t len);
-=20
--void ds_init (dynamic_string *string, int size);
--void ds_resize (dynamic_string *string, int size);
-+/* All functions below guarantee that s->ds_string[s->ds_idx] =3D=3D '\=
0' */
- char *ds_fgetname (FILE *f, dynamic_string *s);
- char *ds_fgets (FILE *f, dynamic_string *s);
- char *ds_fgetstr (FILE *f, dynamic_string *s, char eos);
-+void ds_append (dynamic_string *s, int c);
-+void ds_concat (dynamic_string *s, char const *str);
-+
-+#define ds_len(s) ((s)->ds_idx)
-+
-+int ds_endswith (dynamic_string *s, int c);
-+
-diff --git a/src/util.c b/src/util.c
-index 4421b20..6d6bbaa 100644
---- a/src/util.c
-+++ b/src/util.c
-@@ -846,11 +846,9 @@ get_next_reel (int tape_des)
-   FILE *tty_out;		/* File for interacting with user.  */
-   int old_tape_des;
-   char *next_archive_name;
--  dynamic_string new_name;
-+  dynamic_string new_name =3D DYNAMIC_STRING_INITIALIZER;
-   char *str_res;
-=20
--  ds_init (&new_name, 128);
--
-   /* Open files for interactive communication.  */
-   tty_in =3D fopen (TTY_NAME, "r");
-   if (tty_in =3D=3D NULL)
-@@ -925,7 +923,7 @@ get_next_reel (int tape_des)
-     error (PAXEXIT_FAILURE, 0, _("internal error: tape descriptor chang=
ed from %d to %d"),
- 	   old_tape_des, tape_des);
-=20
--  free (new_name.ds_string);
-+  ds_free (&new_name);
-   fclose (tty_in);
-   fclose (tty_out);
- }
---=20
-2.25.1
-
-
-From fb7a51bf85b8e6f045cacb4fb783db4a414741bf Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Wed, 11 Aug 2021 18:10:38 +0300
-Subject: [PATCH 2/3] Fix previous commit
-
-* src/dstring.c (ds_reset,ds_concat): Don't call ds_resize in a
-loop.
----
- src/dstring.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/dstring.c b/src/dstring.c
-index 358f356..90c691c 100644
---- a/src/dstring.c
-+++ b/src/dstring.c
-@@ -64,7 +64,7 @@ void
- ds_reset (dynamic_string *s, size_t len)
- {
-   while (len > s->ds_size)
--    ds_resize (s);
-+    s->ds_string =3D x2nrealloc (s->ds_string, &s->ds_size, 1);
-   s->ds_idx =3D len;
- }
-=20
-@@ -116,7 +116,7 @@ ds_concat (dynamic_string *s, char const *str)
- {
-   size_t len =3D strlen (str);
-   while (len + 1 > s->ds_size)
--    ds_resize (s);
-+    s->ds_string =3D x2nrealloc (s->ds_string, &s->ds_size, 1);
-   memcpy (s->ds_string + s->ds_idx, str, len);
-   s->ds_idx +=3D len;
-   s->ds_string[s->ds_idx] =3D 0;
---=20
-2.25.1
-
-
-From 86b37d74b15f9bb5fe62fd1642cc126d3ace0189 Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Wed, 18 Aug 2021 09:41:39 +0300
-Subject: [PATCH 3/3] Fix dynamic string reallocations
-
-* src/dstring.c (ds_resize): Take additional argument: number of
-bytes to leave available after ds_idx.  All uses changed.
----
- src/dstring.c | 18 ++++++++----------
- 1 file changed, 8 insertions(+), 10 deletions(-)
-
-diff --git a/src/dstring.c b/src/dstring.c
-index 90c691c..0f597cc 100644
---- a/src/dstring.c
-+++ b/src/dstring.c
-@@ -49,9 +49,9 @@ ds_free (dynamic_string *string)
- /* Expand dynamic string STRING, if necessary.  */
-=20
- void
--ds_resize (dynamic_string *string)
-+ds_resize (dynamic_string *string, size_t len)
- {
--  if (string->ds_idx =3D=3D string->ds_size)
-+  while (len + string->ds_idx >=3D string->ds_size)
-     {
-       string->ds_string =3D x2nrealloc (string->ds_string, &string->ds_=
size,
- 				      1);
-@@ -63,8 +63,7 @@ ds_resize (dynamic_string *string)
- void
- ds_reset (dynamic_string *s, size_t len)
- {
--  while (len > s->ds_size)
--    s->ds_string =3D x2nrealloc (s->ds_string, &s->ds_size, 1);
-+  ds_resize (s, len);
-   s->ds_idx =3D len;
- }
-=20
-@@ -86,10 +85,10 @@ ds_fgetstr (FILE *f, dynamic_string *s, char eos)
-   /* Read the input string.  */
-   while ((next_ch =3D getc (f)) !=3D eos && next_ch !=3D EOF)
-     {
--      ds_resize (s);
-+      ds_resize (s, 0);
-       s->ds_string[s->ds_idx++] =3D next_ch;
-     }
--  ds_resize (s);
-+  ds_resize (s, 0);
-   s->ds_string[s->ds_idx] =3D '\0';
-=20
-   if (s->ds_idx =3D=3D 0 && next_ch =3D=3D EOF)
-@@ -101,12 +100,12 @@ ds_fgetstr (FILE *f, dynamic_string *s, char eos)
- void
- ds_append (dynamic_string *s, int c)
- {
--  ds_resize (s);
-+  ds_resize (s, 0);
-   s->ds_string[s->ds_idx] =3D c;
-   if (c)
-     {
-       s->ds_idx++;
--      ds_resize (s);
-+      ds_resize (s, 0);
-       s->ds_string[s->ds_idx] =3D 0;
-     }     =20
- }
-@@ -115,8 +114,7 @@ void
- ds_concat (dynamic_string *s, char const *str)
- {
-   size_t len =3D strlen (str);
--  while (len + 1 > s->ds_size)
--    s->ds_string =3D x2nrealloc (s->ds_string, &s->ds_size, 1);
-+  ds_resize (s, len);
-   memcpy (s->ds_string + s->ds_idx, str, len);
-   s->ds_idx +=3D len;
-   s->ds_string[s->ds_idx] =3D 0;
---=20
-2.25.1
-
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-exten=
ded/cpio/cpio_2.14.bb
similarity index 84%
rename from meta/recipes-extended/cpio/cpio_2.13.bb
rename to meta/recipes-extended/cpio/cpio_2.14.bb
index 55bcc606b37..e55fb70cb1c 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.14.bb
@@ -7,18 +7,12 @@ LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be8967=
949"
=20
 SRC_URI =3D "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
-           file://0001-Unset-need_charset_alias-when-building-for-musl.p=
atch \
-           file://0002-src-global.c-Remove-superfluous-declaration-of-pr=
ogr.patch \
-           file://0001-obstack-Fix-a-clang-warning.patch \
-           file://CVE-2021-38185.patch \
-           file://0001-Use-__alignof__-with-clang.patch \
-           file://0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch \
+           file://0001-configure-Include-needed-header-for-major-minor-m=
acr.patch \
            file://run-ptest \
            file://test.sh \
            "
=20
-SRC_URI[md5sum] =3D "389c5452d667c23b5eceb206f5000810"
-SRC_URI[sha256sum] =3D "e87470d9c984317f658567c03bfefb6b0c829ff17dbf6b0d=
e48d71a4c8f3db88"
+SRC_URI[sha256sum] =3D "145a340fd9d55f0b84779a44a12d5f79d77c99663967f8cf=
a168d7905ca52454"
=20
 inherit autotools gettext texinfo ptest
=20
diff --git a/meta/recipes-extended/cpio/files/0001-configure-Include-need=
ed-header-for-major-minor-macr.patch b/meta/recipes-extended/cpio/files/0=
001-configure-Include-needed-header-for-major-minor-macr.patch
new file mode 100644
index 00000000000..95ece0bbf37
--- /dev/null
+++ b/meta/recipes-extended/cpio/files/0001-configure-Include-needed-head=
er-for-major-minor-macr.patch
@@ -0,0 +1,48 @@
+From 8179be21e664cedb2e9d238cc2f6d04965e97275 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Thu, 11 May 2023 10:18:44 +0300
+Subject: [PATCH] configure: Include needed header for major/minor macros
+
+This helps in avoiding the warning about implicit function declaration
+which is elevated as error with newer compilers e.g. clang 16
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ configure.ac | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index de479e7..c601029 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -43,8 +43,22 @@ AC_TYPE_UID_T
+ AC_CHECK_TYPE(gid_t, int)
+=20
+ AC_HEADER_DIRENT
+-AX_COMPILE_CHECK_RETTYPE([major], [0])
+-AX_COMPILE_CHECK_RETTYPE([minor], [0])
++AX_COMPILE_CHECK_RETTYPE([major], [0], [
++#include <sys/types.h>
++#ifdef MAJOR_IN_MKDEV
++# include <sys/mkdev.h>
++#endif
++#ifdef MAJOR_IN_SYSMACROS
++# include <sys/sysmacros.h>
++#endif])
++AX_COMPILE_CHECK_RETTYPE([minor], [0], [
++#include <sys/types.h>
++#ifdef MAJOR_IN_MKDEV
++# include <sys/mkdev.h>
++#endif
++#ifdef MAJOR_IN_SYSMACROS
++# include <sys/sysmacros.h>
++#endif])
+=20
+ AC_CHECK_FUNCS([fchmod fchown])
+ # This is needed for mingw build
+--=20
+2.34.1
+
diff --git a/meta/recipes-extended/cpio/cpio-2.13/run-ptest b/meta/recipe=
s-extended/cpio/files/run-ptest
similarity index 100%
rename from meta/recipes-extended/cpio/cpio-2.13/run-ptest
rename to meta/recipes-extended/cpio/files/run-ptest
diff --git a/meta/recipes-extended/cpio/cpio-2.13/test.sh b/meta/recipes-=
extended/cpio/files/test.sh
similarity index 100%
rename from meta/recipes-extended/cpio/cpio-2.13/test.sh
rename to meta/recipes-extended/cpio/files/test.sh
--=20
2.34.1


