Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 9193265C5B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 12:26:55 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id u9ECQu6V016029
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 14:26:56 +0200
Received: from dev.sbt.siemens.com ([139.22.34.98])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id u9ECQtcS028916;
	Fri, 14 Oct 2016 14:26:56 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2016 14:26:44 +0200
Message-Id: <1476448004-2801-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [krogoth][PATCH] glibc: fix CVE-2016-1234, CVE-2016-3075, CVE-2016-5417
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
X-List-Received-Date: Fri, 14 Oct 2016 12:26:57 -0000

Only relevant for krogoth since version 2.24+ (master, morty) is not affected.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/recipes-core/glibc/glibc/CVE-2016-1234.patch | 427 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc/CVE-2016-3075.patch |  37 ++
 meta/recipes-core/glibc/glibc/CVE-2016-5417.patch |  28 ++
 meta/recipes-core/glibc/glibc_2.23.bb             |   3 +
 4 files changed, 495 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-1234.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-3075.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-5417.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2016-1234.patch b/meta/recipes-core/glibc/glibc/CVE-2016-1234.patch
new file mode 100644
index 0000000..e0d45c6
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2016-1234.patch
@@ -0,0 +1,427 @@
+glibc-2.23: Fix CVE-2016-1234
+
+[No upstream tracking] -- https://bugzilla.redhat.com/show_bug.cgi?id=1315647
+
+glob: Do not copy d_name field of struct dirent
+
+Instead, we store the data we need from the return value of
+readdir in an object of the new type struct readdir_result.
+This type is independent of the layout of struct dirent.
+
+Upstream-Status: Backport
+CVE: CVE-2016-1234
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+
+diff --git a/posix/bug-glob2.c b/posix/bug-glob2.c
+index ddf5ec9..22ea35f 100644
+--- a/posix/bug-glob2.c
++++ b/posix/bug-glob2.c
+@@ -40,6 +40,17 @@
+ # define PRINTF(fmt, args...)
+ #endif
+ 
++#define LONG_NAME \
++  "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" \
++  "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" \
++  "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" \
++  "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" \
++  "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" \
++  "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" \
++  "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" \
++  "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" \
++  "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" \
++  "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
+ 
+ static struct
+ {
+@@ -58,6 +69,7 @@ static struct
+       { ".", 3, DT_DIR, 0755 },
+       { "..", 3, DT_DIR, 0755 },
+       { "a", 3, DT_REG, 0644 },
++      { LONG_NAME, 3, DT_REG, 0644 },
+     { "unreadable", 2, DT_DIR, 0111 },
+       { ".", 3, DT_DIR, 0111 },
+       { "..", 3, DT_DIR, 0755 },
+@@ -75,7 +87,7 @@ typedef struct
+   int level;
+   int idx;
+   struct dirent d;
+-  char room_for_dirent[NAME_MAX];
++  char room_for_dirent[sizeof (LONG_NAME)];
+ } my_DIR;
+ 
+ 
+@@ -193,7 +205,7 @@ my_readdir (void *gdir)
+       return NULL;
+     }
+ 
+-  dir->d.d_ino = dir->idx;
++  dir->d.d_ino = 1; /* glob should not skip this entry.  */
+ 
+ #ifdef _DIRENT_HAVE_D_TYPE
+   dir->d.d_type = filesystem[dir->idx].type;
+diff --git a/posix/glob.c b/posix/glob.c
+index 0c04c3c..6c6612d 100644
+--- a/posix/glob.c
++++ b/posix/glob.c
+@@ -24,7 +24,9 @@
+ #include <errno.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <stdbool.h>
+ #include <stddef.h>
++#include <stdint.h>
+ 
+ /* Outcomment the following line for production quality code.  */
+ /* #define NDEBUG 1 */
+@@ -57,10 +59,8 @@
+ 
+ #if defined HAVE_DIRENT_H || defined __GNU_LIBRARY__
+ # include <dirent.h>
+-# define NAMLEN(dirent) strlen((dirent)->d_name)
+ #else
+ # define dirent direct
+-# define NAMLEN(dirent) (dirent)->d_namlen
+ # ifdef HAVE_SYS_NDIR_H
+ #  include <sys/ndir.h>
+ # endif
+@@ -75,82 +75,8 @@
+ # endif /* HAVE_VMSDIR_H */
+ #endif
+ 
+-
+-/* In GNU systems, <dirent.h> defines this macro for us.  */
+-#ifdef _D_NAMLEN
+-# undef NAMLEN
+-# define NAMLEN(d) _D_NAMLEN(d)
+-#endif
+-
+-/* When used in the GNU libc the symbol _DIRENT_HAVE_D_TYPE is available
+-   if the `d_type' member for `struct dirent' is available.
+-   HAVE_STRUCT_DIRENT_D_TYPE plays the same role in GNULIB.  */
+-#if defined _DIRENT_HAVE_D_TYPE || defined HAVE_STRUCT_DIRENT_D_TYPE
+-/* True if the directory entry D must be of type T.  */
+-# define DIRENT_MUST_BE(d, t)	((d)->d_type == (t))
+-
+-/* True if the directory entry D might be a symbolic link.  */
+-# define DIRENT_MIGHT_BE_SYMLINK(d) \
+-    ((d)->d_type == DT_UNKNOWN || (d)->d_type == DT_LNK)
+-
+-/* True if the directory entry D might be a directory.  */
+-# define DIRENT_MIGHT_BE_DIR(d)	 \
+-    ((d)->d_type == DT_DIR || DIRENT_MIGHT_BE_SYMLINK (d))
+-
+-#else /* !HAVE_D_TYPE */
+-# define DIRENT_MUST_BE(d, t)		false
+-# define DIRENT_MIGHT_BE_SYMLINK(d)	true
+-# define DIRENT_MIGHT_BE_DIR(d)		true
+-#endif /* HAVE_D_TYPE */
+-
+-/* If the system has the `struct dirent64' type we use it internally.  */
+-#if defined _LIBC && !defined COMPILE_GLOB64
+-# if defined HAVE_DIRENT_H || defined __GNU_LIBRARY__
+-#  define CONVERT_D_NAMLEN(d64, d32)
+-# else
+-#  define CONVERT_D_NAMLEN(d64, d32) \
+-  (d64)->d_namlen = (d32)->d_namlen;
+-# endif
+-
+-# if (defined POSIX || defined WINDOWS32) && !defined __GNU_LIBRARY__
+-#  define CONVERT_D_INO(d64, d32)
+-# else
+-#  define CONVERT_D_INO(d64, d32) \
+-  (d64)->d_ino = (d32)->d_ino;
+-# endif
+-
+-# ifdef _DIRENT_HAVE_D_TYPE
+-#  define CONVERT_D_TYPE(d64, d32) \
+-  (d64)->d_type = (d32)->d_type;
+-# else
+-#  define CONVERT_D_TYPE(d64, d32)
+-# endif
+-
+-# define CONVERT_DIRENT_DIRENT64(d64, d32) \
+-  memcpy ((d64)->d_name, (d32)->d_name, NAMLEN (d32) + 1);		      \
+-  CONVERT_D_NAMLEN (d64, d32)						      \
+-  CONVERT_D_INO (d64, d32)						      \
+-  CONVERT_D_TYPE (d64, d32)
+-#endif
+-
+-
+-#if (defined POSIX || defined WINDOWS32) && !defined __GNU_LIBRARY__
+-/* Posix does not require that the d_ino field be present, and some
+-   systems do not provide it. */
+-# define REAL_DIR_ENTRY(dp) 1
+-#else
+-# define REAL_DIR_ENTRY(dp) (dp->d_ino != 0)
+-#endif /* POSIX */
+-
+ #include <stdlib.h>
+ #include <string.h>
+-
+-/* NAME_MAX is usually defined in <dirent.h> or <limits.h>.  */
+-#include <limits.h>
+-#ifndef NAME_MAX
+-# define NAME_MAX (sizeof (((struct dirent *) 0)->d_name))
+-#endif
+-
+ #include <alloca.h>
+ 
+ #ifdef _LIBC
+@@ -195,8 +121,111 @@
+ 
+ static const char *next_brace_sub (const char *begin, int flags) __THROWNL;
+ 
++/* A representation of a directory entry which does not depend on the
++   layout of struct dirent, or the size of ino_t.  */
++struct readdir_result
++{
++	const char *name;
++# if defined _DIRENT_HAVE_D_TYPE || defined HAVE_STRUCT_DIRENT_D_TYPE
++	uint8_t type;
++# endif
++	bool skip_entry;
++};
++
++# if defined _DIRENT_HAVE_D_TYPE || defined HAVE_STRUCT_DIRENT_D_TYPE
++/* Initializer based on the d_type member of struct dirent.  */
++#  define D_TYPE_TO_RESULT(source) (source)->d_type,
++
++/* True if the directory entry D might be a symbolic link.  */
++static bool
++readdir_result_might_be_symlink (struct readdir_result d)
++{
++	return d.type == DT_UNKNOWN || d.type == DT_LNK;
++}
++
++/* True if the directory entry D might be a directory.  */
++static bool
++readdir_result_might_be_dir (struct readdir_result d)
++{
++  return d.type == DT_DIR || readdir_result_might_be_symlink (d);
++}
++# else /* defined _DIRENT_HAVE_D_TYPE || defined HAVE_STRUCT_DIRENT_D_TYPE */
++#  define D_TYPE_TO_RESULT(source)
++
++/* If we do not have type information, symbolic links and directories
++   are always a possibility.  */
++
++static bool
++readdir_result_might_be_symlink (struct readdir_result d)
++{
++	return true;
++}
++
++static bool
++eaddir_result_might_be_dir (struct readdir_result d)
++{
++	return true;
++}
++
++# endif /* defined _DIRENT_HAVE_D_TYPE || defined HAVE_STRUCT_DIRENT_D_TYPE */
++
++# if (defined POSIX || defined WINDOWS32) && !defined __GNU_LIBRARY__
++/* Initializer for skip_entry.  POSIX does not require that the d_ino
++   field be present, and some systems do not provide it. */
++#  define D_INO_TO_RESULT(source) false,
++# else
++#  define D_INO_TO_RESULT(source) (source)->d_ino == 0,
++# endif
++
++/* Construct an initializer for a struct readdir_result object from a
++   struct dirent *.  No copy of the name is made.  */
++#define READDIR_RESULT_INITIALIZER(source) \
++  {                                       \
++    source->d_name,                       \
++    D_TYPE_TO_RESULT (source)             \
++    D_INO_TO_RESULT (source)              \
++  }
++
+ #endif /* !defined _LIBC || !defined GLOB_ONLY_P */
+ 
++/* Call gl_readdir on STREAM.  This macro can be overridden to reduce
++   type safety if an old interface version needs to be supported.  */
++#ifndef GL_READDIR
++# define GL_READDIR(pglob, stream) ((pglob)->gl_readdir (stream))
++#endif
++
++/* Extract name and type from directory entry.  No copy of the name is
++   made.  If SOURCE is NULL, result name is NULL.  Keep in sync with
++   convert_dirent64 below.  */
++static struct readdir_result
++convert_dirent (const struct dirent *source)
++{
++	if (source == NULL)
++	  {
++		struct readdir_result result = { NULL, };
++		return result;
++	  }
++	struct readdir_result result = READDIR_RESULT_INITIALIZER (source);
++	return result;
++}
++
++#ifndef COMPILE_GLOB64
++/* Like convert_dirent, but works on struct dirent64 instead.  Keep in
++   sync with convert_dirent above.  */
++static struct readdir_result
++convert_dirent64 (const struct dirent64 *source)
++{
++	if (source == NULL)
++	  {
++		struct readdir_result result = { NULL, };
++		return result;
++	  }
++	struct readdir_result result = READDIR_RESULT_INITIALIZER (source);
++	return result;
++}
++#endif
++
++
+ #ifndef attribute_hidden
+ # define attribute_hidden
+ #endif
+@@ -1553,56 +1582,36 @@ glob_in_dir (const char *pattern, const char *directory, int flags,
+ 
+ 	  while (1)
+ 	    {
+-	      const char *name;
+-	      size_t len;
+-#if defined _LIBC && !defined COMPILE_GLOB64
+-	      struct dirent64 *d;
+-	      union
+-		{
+-		  struct dirent64 d64;
+-		  char room [offsetof (struct dirent64, d_name[0])
+-			     + NAME_MAX + 1];
+-		}
+-	      d64buf;
+-
+-	      if (__glibc_unlikely (flags & GLOB_ALTDIRFUNC))
++		  struct readdir_result d;
+ 		{
+-		  struct dirent *d32 = (*pglob->gl_readdir) (stream);
+-		  if (d32 != NULL)
+-		    {
+-		      CONVERT_DIRENT_DIRENT64 (&d64buf.d64, d32);
+-		      d = &d64buf.d64;
+-		    }
++		  if (__builtin_expect (flags & GLOB_ALTDIRFUNC, 0))
++			d = convert_dirent (GL_READDIR (pglob, stream));
+ 		  else
+-		    d = NULL;
+-		}
+-	      else
+-		d = __readdir64 (stream);
++			{
++#ifdef COMPILE_GLOB64
++			  d = convert_dirent (__readdir (stream));
+ #else
+-	      struct dirent *d = (__builtin_expect (flags & GLOB_ALTDIRFUNC, 0)
+-				  ? ((struct dirent *)
+-				     (*pglob->gl_readdir) (stream))
+-				  : __readdir (stream));
++			  d = convert_dirent64 (__readdir64 (stream));
+ #endif
+-	      if (d == NULL)
++			}
++		}
++		if (d.name == NULL)
+ 		break;
+-	      if (! REAL_DIR_ENTRY (d))
++	      if (d.skip_entry)
+ 		continue;
+ 
+ 	      /* If we shall match only directories use the information
+ 		 provided by the dirent call if possible.  */
+-	      if ((flags & GLOB_ONLYDIR) && !DIRENT_MIGHT_BE_DIR (d))
++	      if ((flags & GLOB_ONLYDIR) && !readdir_result_might_be_dir (d))
+ 		continue;
+ 
+-	      name = d->d_name;
+-
+-	      if (fnmatch (pattern, name, fnm_flags) == 0)
++	      if (fnmatch (pattern, d.name, fnm_flags) == 0)
+ 		{
+ 		  /* If the file we found is a symlink we have to
+ 		     make sure the target file exists.  */
+-		  if (!DIRENT_MIGHT_BE_SYMLINK (d)
+-		      || link_exists_p (dfd, directory, dirlen, name, pglob,
+-					flags))
++		  if (!readdir_result_might_be_symlink (d)
++			  || link_exists_p (dfd, directory, dirlen, d.name, 
++								pglob, flags))
+ 		    {
+ 		      if (cur == names->count)
+ 			{
+@@ -1622,12 +1631,10 @@ glob_in_dir (const char *pattern, const char *directory, int flags,
+ 			  names = newnames;
+ 			  cur = 0;
+ 			}
+-		      len = NAMLEN (d);
+-		      names->name[cur] = (char *) malloc (len + 1);
++		      names->name[cur] = strdup (d.name);
+ 		      if (names->name[cur] == NULL)
+-			goto memory_error;
+-		      *((char *) mempcpy (names->name[cur++], name, len))
+-			= '\0';
++				goto memory_error;
++			  ++cur;
+ 		      ++nfound;
+ 		    }
+ 		}
+diff --git a/posix/tst-gnuglob.c b/posix/tst-gnuglob.c
+index 992b997..3a27a06 100644
+--- a/posix/tst-gnuglob.c
++++ b/posix/tst-gnuglob.c
+@@ -211,7 +211,7 @@ my_readdir (void *gdir)
+       return NULL;
+     }
+ 
+-  dir->d.d_ino = dir->idx;
++  dir->d.d_ino = 1; /* glob should not skip this entry.  */
+ 
+ #ifdef _DIRENT_HAVE_D_TYPE
+   dir->d.d_type = filesystem[dir->idx].type;
+diff --git a/sysdeps/unix/sysv/linux/i386/glob64.c b/sysdeps/unix/sysv/linux/i386/glob64.c
+index b4fcd1a..4a2dfc1 100644
+--- a/sysdeps/unix/sysv/linux/i386/glob64.c
++++ b/sysdeps/unix/sysv/linux/i386/glob64.c
+@@ -1,3 +1,21 @@
++/* Two glob variants with 64-bit support, for dirent64 and __olddirent64.
++   Copyright (C) 1998-2016 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
+ #include <dirent.h>
+ #include <glob.h>
+ #include <sys/stat.h>
+@@ -38,11 +56,15 @@ int __old_glob64 (const char *__pattern, int __flags,
+ 
+ #undef dirent
+ #define dirent __old_dirent64
++#undef GL_READDIR
++#define GL_READDIR(pglob, stream) \
++  ((struct __old_dirent64 *) (pglob)->gl_readdir (stream))
+ #undef __readdir
+ #define __readdir(dirp) __old_readdir64 (dirp)
+ #undef glob
+ #define glob(pattern, flags, errfunc, pglob) \
+   __old_glob64 (pattern, flags, errfunc, pglob)
++#define convert_dirent __old_convert_dirent
+ #define glob_in_dir __old_glob_in_dir
+ #define GLOB_ATTRIBUTE attribute_compat_text_section
+ 
diff --git a/meta/recipes-core/glibc/glibc/CVE-2016-3075.patch b/meta/recipes-core/glibc/glibc/CVE-2016-3075.patch
new file mode 100644
index 0000000..7b9dc4f
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2016-3075.patch
@@ -0,0 +1,37 @@
+glibc-2.23: Fix CVE-2016-3075
+
+[No upstream tracking] -- https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2016-3075
+
+resolv/nss_dns/dns-network.c: Stack overflow in _nss_dns_getnetbyname_r
+
+The defensive copy is not needed because the name may not alias the
+output buffer.
+
+Upstream-Status: Backport
+CVE: CVE-2016-3075
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+
+diff --git a/resolv/nss_dns/dns-network.c b/resolv/nss_dns/dns-network.c
+index 2eb2f67..8f301a7 100644
+--- a/resolv/nss_dns/dns-network.c
++++ b/resolv/nss_dns/dns-network.c
+@@ -118,17 +118,14 @@ _nss_dns_getnetbyname_r (const char *name, struct netent *result,
+   } net_buffer;
+   querybuf *orig_net_buffer;
+   int anslen;
+-  char *qbuf;
+   enum nss_status status;
+ 
+   if (__res_maybe_init (&_res, 0) == -1)
+     return NSS_STATUS_UNAVAIL;
+ 
+-  qbuf = strdupa (name);
+-
+   net_buffer.buf = orig_net_buffer = (querybuf *) alloca (1024);
+ 
+-  anslen = __libc_res_nsearch (&_res, qbuf, C_IN, T_PTR, net_buffer.buf->buf,
++  anslen = __libc_res_nsearch (&_res, name, C_IN, T_PTR, net_buffer.buf->buf,
+ 			       1024, &net_buffer.ptr, NULL, NULL, NULL, NULL);
+   if (anslen < 0)
+     {
diff --git a/meta/recipes-core/glibc/glibc/CVE-2016-5417.patch b/meta/recipes-core/glibc/glibc/CVE-2016-5417.patch
new file mode 100644
index 0000000..8e0252b
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2016-5417.patch
@@ -0,0 +1,28 @@
+glibc-2.23: Fix CVE-2016-5417
+
+[No upstream tracking] -- https://bugzilla.redhat.com/show_bug.cgi?id=1362534
+
+resolv/res_init.c:Fix resource leak in resolver
+
+The number of currently defined nameservers is stored in ->nscount,
+whereas ->_u._ext.nscount is set by __libc_res_nsend only after local
+initializations.
+
+Upstream-Status: Backport
+CVE: CVE-2016-5417
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+
+diff --git a/resolv/res_init.c b/resolv/res_init.c
+index e0b6a80..6c951f5 100644
+--- a/resolv/res_init.c
++++ b/resolv/res_init.c
+@@ -594,7 +594,7 @@ __res_iclose(res_state statp, bool free_addr) {
+ 		statp->_vcsock = -1;
+ 		statp->_flags &= ~(RES_F_VC | RES_F_CONN);
+ 	}
+-	for (ns = 0; ns < statp->_u._ext.nscount; ns++)
++	for (ns = 0; ns < statp->nscount; ns++)
+ 		if (statp->_u._ext.nsaddrs[ns]) {
+ 			if (statp->_u._ext.nssocks[ns] != -1) {
+ 				close_not_cancel_no_status(statp->_u._ext.nssocks[ns]);
diff --git a/meta/recipes-core/glibc/glibc_2.23.bb b/meta/recipes-core/glibc/glibc_2.23.bb
index 63dc911..85b5215 100644
--- a/meta/recipes-core/glibc/glibc_2.23.bb
+++ b/meta/recipes-core/glibc/glibc_2.23.bb
@@ -38,6 +38,9 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-When-disabling-SSE-make-sure-fpmath-is-not-set-to-us.patch \
            file://CVE-2016-3706.patch \
            file://CVE-2016-4429.patch \
+           file://CVE-2016-1234.patch \
+           file://CVE-2016-3075.patch \
+           file://CVE-2016-5417.patch \
 "
 
 SRC_URI += "\
-- 
2.1.4


