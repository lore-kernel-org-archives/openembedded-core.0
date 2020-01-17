Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E179F6B512
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 08:33:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00H8XIb3003812
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 17 Jan 2020 00:33:28 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 17 Jan 2020 00:33:07 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Fri, 17 Jan 2020 00:33:07 -0800
Message-ID: <20200117083307.93400-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] findutils: Upgrade to 4.7.0
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
X-List-Received-Date: Fri, 17 Jan 2020 08:33:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

* Upgrade to 4.7.0 since there are so many
  fixes in the new release such as below commit
  which used to fix Yocto Bug 13311
  5699fb7 xargs: use GNU_FINDUTILS_FD_LEAK_CHECK as for find

* Drop all patches as it is backported or
  useless in new release

* Licence-Update:
  - the link in the COPYING has been updated from
    http to https

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-extended/findutils/findutils.inc |   2 +-
 ...charset_alias-when-building-for-musl.patch |  31 ----
 ...-honour-the-ignore_readdir_race-opti.patch | 144 ------------------
 .../findutils-4.6.0-gnulib-fflush.patch       | 140 -----------------
 .../findutils-4.6.0-gnulib-makedev.patch      |  78 ----------
 .../findutils/findutils_4.6.0.bb              |  21 ---
 .../findutils/findutils_4.7.0.bb              |  15 ++
 7 files changed, 16 insertions(+), 415 deletions(-)
 delete mode 100644 meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_alias-when-building-for-musl.patch
 delete mode 100644 meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
 delete mode 100644 meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-fflush.patch
 delete mode 100644 meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-makedev.patch
 delete mode 100644 meta/recipes-extended/findutils/findutils_4.6.0.bb
 create mode 100644 meta/recipes-extended/findutils/findutils_4.7.0.bb

diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes-extended/findutils/findutils.inc
index ad3642923c..a0e1f8962c 100644
--- a/meta/recipes-extended/findutils/findutils.inc
+++ b/meta/recipes-extended/findutils/findutils.inc
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/findutils/"
 BUGTRACKER = "http://savannah.gnu.org/bugs/?group=findutils"
 SECTION = "console/utils"
 
-SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.xz"
 
 inherit autotools gettext texinfo update-alternatives upstream-version-is-even
 
diff --git a/meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_alias-when-building-for-musl.patch
deleted file mode 100644
index 6064d18854..0000000000
--- a/meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 86db2a5f3b7ef8113e5384b4e02d2b299c87a047 Mon Sep 17 00:00:00 2001
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
-
----
- gl/lib/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gl/lib/Makefile.am b/gl/lib/Makefile.am
-index a9e2fe4..1c6ea9c 100644
---- a/gl/lib/Makefile.am
-+++ b/gl/lib/Makefile.am
-@@ -1234,7 +1234,7 @@ install-exec-localcharset: all-local
- 	  case '$(host_os)' in \
- 	    darwin[56]*) \
- 	      need_charset_alias=true ;; \
--	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
-+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
- 	      need_charset_alias=false ;; \
- 	    *) \
- 	      need_charset_alias=true ;; \
diff --git a/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch b/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
deleted file mode 100644
index a570473ccb..0000000000
--- a/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From a3f4821c4a3f723d21c9298d54bee8a656bfd7fb Mon Sep 17 00:00:00 2001
-From: Bernhard Voelker <mail@bernhard-voelker.de>
-Date: Tue, 30 Jan 2018 23:30:09 +0100
-Subject: [PATCH] find: make -delete honour the -ignore_readdir_race option
-
-* find/pred.c (pred_delete): Return true when the -ignore_readdir_race
-option is active and unlinkat() came back with ENOENT.
-* doc/find.texi (Option -ignore_readdir_race): Document the change.
-(Action -delete): Likewise.
-* find/find.1: Likewise.
-* NEWS (Bug Fixes): Mention the fix.
-
-For now, it seems a bit hard to add a proper test for this,
-so the following shell snippet demonstrates the race:
-
-  $ seq 10 | xargs touch
-  $ env time -f 'find exit status: %x\nfind time: %e' \
-      find -ignore_readdir_race -type f \
-        -delete \
-        -exec sh -c 'sleep $(basename {})' \; \
-        -printf 'find deleted: %p\n' \
-        & \
-    sleep 20; \
-    seq 10 | xargs rm -fv; \
-    wait $!
-
-Reported by Alexander Golubev in
-https://savannah.gnu.org/bugs/?52981
-
-Upstream-Status: Backport
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
-
----
- NEWS          |  4 ++++
- doc/find.texi | 15 ++++++++++++++-
- find/find.1   | 22 ++++++++++++++++++++++
- find/pred.c   |  6 ++++++
- 4 files changed, 46 insertions(+), 1 deletion(-)
-
-diff --git a/NEWS b/NEWS
-index 660c241..b86ec1e 100644
---- a/NEWS
-+++ b/NEWS
-@@ -42,6 +42,10 @@ Updated the Danish translation.
- 
- ** Bug Fixes:
- 
-+#52981: find: the '-delete' action no longer complains about disappeared files
-+        when the '-ignore_readdir_race' option is given, too.  That action will
-+        also returns true in such a case now.
-+
- Applied patch #8688: Spelling fixes.
- 
- * Major changes in release 4.5.18, 2015-12-27
-diff --git a/doc/find.texi b/doc/find.texi
-index fdeb841..247c19a 100644
---- a/doc/find.texi
-+++ b/doc/find.texi
-@@ -1418,7 +1418,15 @@ gives a significant increase in search speed.
- If a file disappears after its name has been read from a directory but
- before @code{find} gets around to examining the file with @code{stat},
- don't issue an error message.  If you don't specify this option, an
--error message will be issued.  This option can be useful in system
-+error message will be issued.
-+
-+Furthermore, @code{find} with the @samp{-ignore_readdir_race} option
-+will ignore errors of the @samp{-delete} action in the case the file
-+has disappeared since the parent directory was read: it will not output
-+an error diagnostic, and the return code of the @samp{-delete} action
-+will be true.
-+
-+This option can be useful in system
- scripts (cron scripts, for example) that examine areas of the
- filesystem that change frequently (mail queues, temporary directories,
- and so forth), because this scenario is common for those sorts of
-@@ -2779,6 +2787,11 @@ explicitly.
- 
- If @samp{-delete} fails, @code{find}'s exit status will be nonzero
- (when it eventually exits).
-+
-+Together with the @samp{-ignore_readdir_race} option, @code{find} will
-+ignore errors of the @samp{-delete} action in the case the file has disappeared
-+since the parent directory was read: it will not output an error diagnostic, and
-+the return code of the @samp{-delete} action will be true.
- @end deffn
- 
- @node Adding Tests
-diff --git a/find/find.1 b/find/find.1
-index 7b141b8..0eec41c 100644
---- a/find/find.1
-+++ b/find/find.1
-@@ -479,6 +479,17 @@ one part of the filesystem with this option on and part of it with this option
- off (if you need to do that, you will need to issue two \fBfind\fR commands
- instead, one with the option and one without it).
- 
-+Furthermore,
-+.B find
-+with the
-+.B \-ignore_readdir_race
-+option will ignore errors of the
-+.B \-delete
-+action in the case the file has disappeared since the parent directory was read:
-+it will not output an error diagnostic, and the return code of the
-+.B \-delete
-+action will be true.
-+
- .IP "\-maxdepth \fIlevels\fR"
- Descend at most \fIlevels\fR (a non-negative integer) levels of
- directories below the starting-points.
-@@ -1030,6 +1041,17 @@ and
- .B \-delete
- together.
- 
-+Together with the
-+.B \-ignore_readdir_race
-+option,
-+.B find
-+will ignore errors of the
-+.B \-delete
-+action in the case the file has disappeared since the parent directory was
-+read: it will not output an error diagnostic, and the return code of the
-+.B \-delete
-+action will be true.
-+
- .IP "\-exec \fIcommand\fR ;"
- Execute \fIcommand\fR; true if 0 status is returned.  All following
- arguments to
-diff --git a/find/pred.c b/find/pred.c
-index 32938fb..431f065 100644
---- a/find/pred.c
-+++ b/find/pred.c
-@@ -324,6 +324,12 @@ pred_delete (const char *pathname, struct stat *stat_buf, struct predicate *pred
- 	}
-       else
- 	{
-+	  if (ENOENT == errno && options.ignore_readdir_race)
-+	    {
-+	      /* Ignore unlink() error for vanished files.  */
-+	      errno = 0;
-+	      return true;
-+	    }
- 	  if (EISDIR == errno)
- 	    {
- 	      if ((flags & AT_REMOVEDIR) == 0)
diff --git a/meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-fflush.patch b/meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-fflush.patch
deleted file mode 100644
index d13e8ed3cf..0000000000
--- a/meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-fflush.patch
+++ /dev/null
@@ -1,140 +0,0 @@
-From 80cdfba079627e15129a926a133825b961d41e36 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Mon, 5 Mar 2018 10:56:29 -0800
-Subject: [PATCH] fflush: adjust to glibc 2.28 libio.h removal
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Problem reported by Daniel P. Berrangé in:
-https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
-* lib/fflush.c (clear_ungetc_buffer_preserving_position)
-(disable_seek_optimization, rpl_fflush):
-* lib/fpurge.c (fpurge):
-* lib/freadahead.c (freadahead):
-* lib/freading.c (freading):
-* lib/fseeko.c (fseeko):
-* lib/stdio-impl.h (_IO_IN_BACKUP) [_IO_EOF_SEEN]:
-Define if not already defined.
-
-Upstream-commit: 4af4a4a71827c0bc5e0ec67af23edef4f15cee8e
-Signed-off-by: Kamil Dudka <kdudka@redhat.com>
-Upstream-Status: Backport [4af4a4a71827c0bc5e0ec67af23edef4f15cee8e]
----
- gl/lib/fflush.c     | 6 +++---
- gl/lib/fpurge.c     | 2 +-
- gl/lib/freadahead.c | 2 +-
- gl/lib/freading.c   | 2 +-
- gl/lib/fseeko.c     | 4 ++--
- gl/lib/stdio-impl.h | 6 ++++++
- 6 files changed, 14 insertions(+), 8 deletions(-)
-
-Index: findutils-4.6.0/gl/lib/fflush.c
-===================================================================
---- findutils-4.6.0.orig/gl/lib/fflush.c
-+++ findutils-4.6.0/gl/lib/fflush.c
-@@ -33,7 +33,7 @@
- #undef fflush
- 
- 
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
- 
- /* Clear the stream's ungetc buffer, preserving the value of ftello (fp).  */
- static void
-@@ -72,7 +72,7 @@ clear_ungetc_buffer (FILE *fp)
- 
- #endif
- 
--#if ! (defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
-+#if ! (defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
- 
- # if (defined __sferror || defined __DragonFly__ || defined __ANDROID__) && defined __SNPT
- /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Android */
-@@ -148,7 +148,7 @@ rpl_fflush (FILE *stream)
-   if (stream == NULL || ! freading (stream))
-     return fflush (stream);
- 
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
- 
-   clear_ungetc_buffer_preserving_position (stream);
- 
-Index: findutils-4.6.0/gl/lib/fpurge.c
-===================================================================
---- findutils-4.6.0.orig/gl/lib/fpurge.c
-+++ findutils-4.6.0/gl/lib/fpurge.c
-@@ -62,7 +62,7 @@ fpurge (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   fp->_IO_read_end = fp->_IO_read_ptr;
-   fp->_IO_write_ptr = fp->_IO_write_base;
-   /* Avoid memory leak when there is an active ungetc buffer.  */
-Index: findutils-4.6.0/gl/lib/freadahead.c
-===================================================================
---- findutils-4.6.0.orig/gl/lib/freadahead.c
-+++ findutils-4.6.0/gl/lib/freadahead.c
-@@ -25,7 +25,7 @@
- size_t
- freadahead (FILE *fp)
- {
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   if (fp->_IO_write_ptr > fp->_IO_write_base)
-     return 0;
-   return (fp->_IO_read_end - fp->_IO_read_ptr)
-Index: findutils-4.6.0/gl/lib/freading.c
-===================================================================
---- findutils-4.6.0.orig/gl/lib/freading.c
-+++ findutils-4.6.0/gl/lib/freading.c
-@@ -31,7 +31,7 @@ freading (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   return ((fp->_flags & _IO_NO_WRITES) != 0
-           || ((fp->_flags & (_IO_NO_READS | _IO_CURRENTLY_PUTTING)) == 0
-               && fp->_IO_read_base != NULL));
-Index: findutils-4.6.0/gl/lib/fseeko.c
-===================================================================
---- findutils-4.6.0.orig/gl/lib/fseeko.c
-+++ findutils-4.6.0/gl/lib/fseeko.c
-@@ -47,7 +47,7 @@ fseeko (FILE *fp, off_t offset, int when
- #endif
- 
-   /* These tests are based on fpurge.c.  */
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   if (fp->_IO_read_end == fp->_IO_read_ptr
-       && fp->_IO_write_ptr == fp->_IO_write_base
-       && fp->_IO_save_base == NULL)
-@@ -123,7 +123,7 @@ fseeko (FILE *fp, off_t offset, int when
-           return -1;
-         }
- 
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-       fp->_flags &= ~_IO_EOF_SEEN;
-       fp->_offset = pos;
- #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
-Index: findutils-4.6.0/gl/lib/stdio-impl.h
-===================================================================
---- findutils-4.6.0.orig/gl/lib/stdio-impl.h
-+++ findutils-4.6.0/gl/lib/stdio-impl.h
-@@ -18,6 +18,12 @@
-    the same implementation of stdio extension API, except that some fields
-    have different naming conventions, or their access requires some casts.  */
- 
-+/* Glibc 2.28 made _IO_IN_BACKUP private.  For now, work around this
-+   problem by defining it ourselves.  FIXME: Do not rely on glibc
-+   internals.  */
-+#if !defined _IO_IN_BACKUP && defined _IO_EOF_SEEN
-+# define _IO_IN_BACKUP 0x100
-+#endif
- 
- /* BSD stdio derived implementations.  */
- 
diff --git a/meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-makedev.patch b/meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-makedev.patch
deleted file mode 100644
index 0fb3953cf3..0000000000
--- a/meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-makedev.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 80628047a6cc83f82e0c410a82b8f7facd9d50f2 Mon Sep 17 00:00:00 2001
-From: Eric Blake <eblake@redhat.com>
-Date: Wed, 14 Sep 2016 19:21:42 -0500
-Subject: [PATCH] mountlist: include sysmacros.h for glibc
-
-On Fedora rawhide (glibc 2.25), './gnulib-tool --test mountlist'
-reports:
-../../gllib/mountlist.c: In function 'read_file_system_list':
-../../gllib/mountlist.c:534:13: warning: '__makedev_from_sys_types' is deprecated:
-  In the GNU C Library, `makedev' is defined by <sys/sysmacros.h>.
-  For historical compatibility, it is currently defined by
-  <sys/types.h> as well, but we plan to remove this soon.
-  To use `makedev', include <sys/sysmacros.h> directly.
-  If you did not intend to use a system-defined macro `makedev',
-  you should #undef it after including <sys/types.h>.
-  [-Wdeprecated-declarations]
-             me->me_dev = makedev (devmaj, devmin);
-             ^~
-In file included from /usr/include/features.h:397:0,
-                 from /usr/include/sys/types.h:25,
-                 from ./sys/types.h:28,
-                 from ../../gllib/mountlist.h:23,
-                 from ../../gllib/mountlist.c:20:
-/usr/include/sys/sysmacros.h:89:1: note: declared here
- __SYSMACROS_DEFINE_MAKEDEV (__SYSMACROS_FST_IMPL_TEMPL)
- ^
-
-Fix it by including the right headers.  We also need a fix to
-autoconf's AC_HEADER_MAJOR, but that's a separate patch.
-
-* m4/mountlist.m4 (gl_PREREQ_MOUTLIST_EXTRA): Include
-AC_HEADER_MAJOR.
-* lib/mountlist.c (includes): Use correct headers.
-
-Signed-off-by: Eric Blake <eblake@redhat.com>
-
-Upstream-commit: 4da63c5881f60f71999a943612da9112232b9161
-Signed-off-by: Kamil Dudka <kdudka@redhat.com>
-Upstream-Status: Backport [4da63c5881f60f71999a943612da9112232b9161]
----
- gl/lib/mountlist.c | 6 ++++++
- gl/m4/mountlist.m4 | 3 ++-
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-Index: findutils-4.6.0/gl/lib/mountlist.c
-===================================================================
---- findutils-4.6.0.orig/gl/lib/mountlist.c
-+++ findutils-4.6.0/gl/lib/mountlist.c
-@@ -37,6 +37,12 @@
- # include <sys/param.h>
- #endif
- 
-+#if MAJOR_IN_MKDEV
-+# include <sys/mkdev.h>
-+#elif MAJOR_IN_SYSMACROS
-+# include <sys/sysmacros.h>
-+#endif
-+
- #if defined MOUNTED_GETFSSTAT   /* OSF_1 and Darwin1.3.x */
- # if HAVE_SYS_UCRED_H
- #  include <grp.h> /* needed on OSF V4.0 for definition of NGROUPS,
-Index: findutils-4.6.0/gl/m4/mountlist.m4
-===================================================================
---- findutils-4.6.0.orig/gl/m4/mountlist.m4
-+++ findutils-4.6.0/gl/m4/mountlist.m4
-@@ -1,4 +1,4 @@
--# serial 11
-+# serial 12
- dnl Copyright (C) 2002-2006, 2009-2015 Free Software Foundation, Inc.
- dnl This file is free software; the Free Software Foundation
- dnl gives unlimited permission to copy and/or distribute it,
-@@ -15,5 +15,6 @@ AC_DEFUN([gl_PREREQ_MOUNTLIST_EXTRA],
- [
-   dnl Note gl_LIST_MOUNTED_FILE_SYSTEMS checks for mntent.h, not sys/mntent.h.
-   AC_CHECK_HEADERS([sys/mntent.h])
-+  AC_HEADER_MAJOR()dnl for use of makedev ()
-   gl_FSTYPENAME
- ])
diff --git a/meta/recipes-extended/findutils/findutils_4.6.0.bb b/meta/recipes-extended/findutils/findutils_4.6.0.bb
deleted file mode 100644
index 3b62ed9962..0000000000
--- a/meta/recipes-extended/findutils/findutils_4.6.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require findutils.inc
-
-# GPLv2+ (<< 4.2.32), GPLv3+ (>= 4.2.32)
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
-
-DEPENDS = "bison-native"
-
-SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
-            file://0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch \
-            file://findutils-4.6.0-gnulib-fflush.patch \
-            file://findutils-4.6.0-gnulib-makedev.patch \
-"
-
-SRC_URI[md5sum] = "9936aa8009438ce185bea2694a997fc1"
-SRC_URI[sha256sum] = "ded4c9f73731cd48fec3b6bdaccce896473b6d8e337e9612e16cf1431bb1169d"
-
-# http://savannah.gnu.org/bugs/?27299
-CACHED_CONFIGUREVARS += "gl_cv_func_wcwidth_works=yes"
-
-EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
diff --git a/meta/recipes-extended/findutils/findutils_4.7.0.bb b/meta/recipes-extended/findutils/findutils_4.7.0.bb
new file mode 100644
index 0000000000..59688e528a
--- /dev/null
+++ b/meta/recipes-extended/findutils/findutils_4.7.0.bb
@@ -0,0 +1,15 @@
+require findutils.inc
+
+# GPLv2+ (<< 4.2.32), GPLv3+ (>= 4.2.32)
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
+
+DEPENDS = "bison-native"
+
+SRC_URI[md5sum] = "731356dec4b1109b812fecfddfead6b2"
+SRC_URI[sha256sum] = "c5fefbdf9858f7e4feb86f036e1247a54c79fc2d8e4b7064d5aaa1f47dfa789a"
+
+# http://savannah.gnu.org/bugs/?27299
+CACHED_CONFIGUREVARS += "gl_cv_func_wcwidth_works=yes"
+
+EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
-- 
2.23.0


