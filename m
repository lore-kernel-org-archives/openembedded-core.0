Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.5462.1619695880064306141
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 04:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XqqTW/+e;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id c17so11255673pfn.6
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 04:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=gaMQg18/Vl0kNKV0EP2iJK8inC60dMZKfSQMs2AfSfk=;
        b=XqqTW/+e5vfuPHTAd1yuLJLLGG8uADxYVnXFmX8g+yVQrKQYJ34ixdSE25kHZxxtFu
         iFSpnnBxVtM49WGQmRWA/8OV/bzVNF0E7mjMKN9R/93ns27Z1JvMijSnyVr3deKzHX6h
         KuNgiaY3ljEughqsMMtur01LTxuhcFv/uF/gKJlt4WGlRm41MlNBGbREC0sgqcqynb0u
         K3lw1gGk21aHu1G9QZygLMGYn1/K3E6hx4Gg0xGoOylhFWu9O91WDvCV8hFGp7tHwTIw
         FVGG25f+Bl2+FHqrhvpyZF5pTqMiZWg/JDJm91jkNSupE8b97J5UahLKh7mCca7rFQOX
         Yk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gaMQg18/Vl0kNKV0EP2iJK8inC60dMZKfSQMs2AfSfk=;
        b=UNh1LHWSdnTVWF1ipNi+mefQOLUjwxIiYo8X6eDrlDnQFqZBLeNct49GrDNWnSjXej
         5sHiEsfwsM3o+mU6oZUeq9IUbi9FRlF+GSH46yDvJAbfcBvz73LNbJd8kNNo53WBtb+s
         YBMQRfiE/7r4oB0zA/SZM7qoRTx82kqiRF1/uGsEtF/PFVMGz4do1uWhTg/ku9c4pT9o
         yUq0kiHNri+mTa3fBUBEcKtOVm5rrGVzvUJdhFGTC8jDIvQCj4KXqqRsLBjuKZGzEeqV
         5U2szrAOaNJmpQ4iQN+FK+FmjFcpR0kw9pPK8OIT95bXqK8YjNAufU5aoWBwkDjOrvsa
         I1yA==
X-Gm-Message-State: AOAM530HEWuQ3+r352dVQ/tiS/NVT9WJ/maQTS8PAZvh8Z2WKoLNr1Bi
	1Rwaqk+xSwIqI34p9kTn1gS4ZflzsfLo8KGX+zQ=
X-Google-Smtp-Source: ABdhPJxEPYQIRzN2Y4r9sXAVUjj3wQRrFa2v0fQALQB/3Fo/6HPV1N6Im2ziUwoqT0sxHHsAo9xd9w==
X-Received: by 2002:a65:5a8f:: with SMTP id c15mr20657235pgt.0.1619695878913;
        Thu, 29 Apr 2021 04:31:18 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id e10sm2294012pfc.40.2021.04.29.04.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 04:31:18 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: vinay.kumar@blackfigtech.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [hardknott][PATCH] Binutils: Fix CVE-2021-20197
Date: Thu, 29 Apr 2021 04:30:46 -0700
Message-Id: <20210429113046.172473-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1

Source: git://sourceware.org/git/binutils-gdb.git
Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=26945

Backported upstream commit d3edaa91d4cf7202ec14342410194841e2f67f12 to
binutils-2.36 source along with commit id dependencies
(8e03235147a9e774d3ba084e93c2da1aa94d1cec and 8b69e61d4be276bb862698aaafddc3e779d23c8f).

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=d3edaa91d4cf7202ec14342410194841e2f67f12]

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
This patch is verified by building both Linux and Mingw toolchains for ARM target, and executed "binutils" regresssion testing.

 .../binutils/binutils-2.36.inc                |   1 +
 .../binutils/binutils/CVE-2021-20197.patch    | 388 ++++++++++++++++++
 2 files changed, 389 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2021-20197.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.36.inc b/meta/recipes-devtools/binutils/binutils-2.36.inc
index beddf601fd..66080dfcee 100644
--- a/meta/recipes-devtools/binutils/binutils-2.36.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.36.inc
@@ -36,5 +36,6 @@ SRC_URI = "\
      file://0015-sync-with-OE-libtool-changes.patch \
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
      file://0017-Add-support-for-the-DW_FORM_strx-forms-to-the-BFD-li.patch \
+     file://CVE-2021-20197.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2021-20197.patch b/meta/recipes-devtools/binutils/binutils/CVE-2021-20197.patch
new file mode 100644
index 0000000000..d6117b65a4
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2021-20197.patch
@@ -0,0 +1,388 @@
+From d3edaa91d4cf7202ec14342410194841e2f67f12 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 26 Feb 2021 11:30:32 +1030
+Subject: [PATCH] Reinstate various pieces backed out from smart_rename changes
+
+In the interests of a stable release various last minute smart_rename
+patches were backed out of the 2.36 branch.  The main reason to
+reinstate some of those backed out changes here is to make necessary
+followup fixes to commit 8e03235147a9 simple cherry-picks from
+mainline.  A secondary reason is that ar -M support isn't fixed for
+pr26945 without this patch.
+
+        PR 26945
+        * ar.c: Don't include libbfd.h.
+        (write_archive): Replace xmalloc+strcpy with xstrdup.
+        * arsup.c (temp_name, real_ofd): New static variables.
+        (ar_open): Use make_tempname and bfd_fdopenw.
+        (ar_save): Adjust to suit ar_open changes.
+        * objcopy.c: Don't include libbfd.h.
+        * rename.c: Rename and reorder variables.
+
+(cherry picked from commit 95b91a043aeaeb546d2fea556d84a2de1e917770)
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=d3edaa91d4cf7202ec14342410194841e2f67f12]
+CVE: CVE-2021-20197
+Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
+---
+ binutils/ar.c      |   6 +-
+ binutils/arsup.c   |  37 ++++++++----
+ binutils/bucomm.h  |   3 +-
+ binutils/objcopy.c |   9 +--
+ binutils/rename.c  | 148 +++++++++++----------------------------------
+ 5 files changed, 67 insertions(+), 136 deletions(-)
+
+diff --git a/binutils/ar.c b/binutils/ar.c
+index 45a34e3a6cf..44df48c5c67 100644
+--- a/binutils/ar.c
++++ b/binutils/ar.c
+@@ -25,7 +25,6 @@
+ 
+ #include "sysdep.h"
+ #include "bfd.h"
+-#include "libbfd.h"
+ #include "libiberty.h"
+ #include "progress.h"
+ #include "getopt.h"
+@@ -1255,8 +1254,7 @@ write_archive (bfd *iarch)
+   bfd *contents_head = iarch->archive_next;
+   int ofd = -1;
+ 
+-  old_name = (char *) xmalloc (strlen (bfd_get_filename (iarch)) + 1);
+-  strcpy (old_name, bfd_get_filename (iarch));
++  old_name = xstrdup (bfd_get_filename (iarch));
+   new_name = make_tempname (old_name, &ofd);
+ 
+   if (new_name == NULL)
+@@ -1308,7 +1306,7 @@ write_archive (bfd *iarch)
+   /* We don't care if this fails; we might be creating the archive.  */
+   bfd_close (iarch);
+ 
+-  if (smart_rename (new_name, old_name, 0) != 0)
++  if (smart_rename (new_name, old_name, NULL) != 0)
+     xexit (1);
+   free (old_name);
+   free (new_name);
+diff --git a/binutils/arsup.c b/binutils/arsup.c
+index 5403a0c5d74..f7ce8f0bc82 100644
+--- a/binutils/arsup.c
++++ b/binutils/arsup.c
+@@ -42,6 +42,8 @@ extern int deterministic;
+ 
+ static bfd *obfd;
+ static char *real_name;
++static char *temp_name;
++static int real_ofd;
+ static FILE *outfile;
+ 
+ static void
+@@ -149,27 +151,24 @@ maybequit (void)
+ void
+ ar_open (char *name, int t)
+ {
+-  char *tname;
+-  const char *bname = lbasename (name);
+-  real_name = name;
++  real_name = xstrdup (name);
++  temp_name = make_tempname (real_name, &real_ofd);
+ 
+-  /* Prepend tmp- to the beginning, to avoid file-name clashes after
+-     truncation on filesystems with limited namespaces (DOS).  */
+-  if (asprintf (&tname, "%.*stmp-%s", (int) (bname - name), name, bname) == -1)
++  if (temp_name == NULL)
+     {
+-      fprintf (stderr, _("%s: Can't allocate memory for temp name (%s)\n"),
++      fprintf (stderr, _("%s: Can't open temporary file (%s)\n"),
+ 	       program_name, strerror(errno));
+       maybequit ();
+       return;
+     }
+ 
+-  obfd = bfd_openw (tname, NULL);
++  obfd = bfd_fdopenw (temp_name, NULL, real_ofd);
+ 
+   if (!obfd)
+     {
+       fprintf (stderr,
+ 	       _("%s: Can't open output archive %s\n"),
+-	       program_name,  tname);
++	       program_name, temp_name);
+ 
+       maybequit ();
+     }
+@@ -344,16 +343,30 @@ ar_save (void)
+     }
+   else
+     {
+-      char *ofilename = xstrdup (bfd_get_filename (obfd));
++      struct stat target_stat;
+ 
+       if (deterministic > 0)
+         obfd->flags |= BFD_DETERMINISTIC_OUTPUT;
+ 
+       bfd_close (obfd);
+ 
+-      smart_rename (ofilename, real_name, 0);
++      if (stat (real_name, &target_stat) != 0)
++	{
++	  /* The temp file created in ar_open has mode 0600 as per mkstemp.
++	     Create the real empty output file here so smart_rename will
++	     update the mode according to the process umask.  */
++	  obfd = bfd_openw (real_name, NULL);
++	  if (obfd != NULL)
++	    {
++	      bfd_set_format (obfd, bfd_archive);
++	      bfd_close (obfd);
++	    }
++	}
++
++      smart_rename (temp_name, real_name, NULL);
+       obfd = 0;
+-      free (ofilename);
++      free (temp_name);
++      free (real_name);
+     }
+ }
+ 
+diff --git a/binutils/bucomm.h b/binutils/bucomm.h
+index 91f6a5b228f..aa7e33d8cd1 100644
+--- a/binutils/bucomm.h
++++ b/binutils/bucomm.h
+@@ -71,7 +71,8 @@ extern void print_version (const char *);
+ /* In rename.c.  */
+ extern void set_times (const char *, const struct stat *);
+ 
+-extern int smart_rename (const char *, const char *, int);
++extern int smart_rename (const char *, const char *, struct stat *);
++
+ 
+ /* In libiberty.  */
+ void *xmalloc (size_t);
+diff --git a/binutils/objcopy.c b/binutils/objcopy.c
+index eab3b6db585..73aa8bc2514 100644
+--- a/binutils/objcopy.c
++++ b/binutils/objcopy.c
+@@ -20,7 +20,6 @@
+ 
+ #include "sysdep.h"
+ #include "bfd.h"
+-#include "libbfd.h"
+ #include "progress.h"
+ #include "getopt.h"
+ #include "libiberty.h"
+@@ -4861,12 +4860,10 @@ strip_main (int argc, char *argv[])
+ 		 output_target, NULL);
+       if (status == 0)
+ 	{
+-	  if (preserve_dates)
+-	    set_times (tmpname, &statbuf);
+ 	  if (output_file != tmpname)
+ 	    status = (smart_rename (tmpname,
+ 				    output_file ? output_file : argv[i],
+-				    preserve_dates) != 0);
++				    preserve_dates ? &statbuf : NULL) != 0);
+ 	  if (status == 0)
+ 	    status = hold_status;
+ 	}
+@@ -5931,11 +5928,9 @@ copy_main (int argc, char *argv[])
+ 	     output_target, input_arch);
+   if (status == 0)
+     {
+-      if (preserve_dates)
+-	set_times (tmpname, &statbuf);
+       if (tmpname != output_filename)
+ 	status = (smart_rename (tmpname, input_filename,
+-				preserve_dates) != 0);
++				preserve_dates ? &statbuf : NULL) != 0);
+     }
+   else
+     unlink_if_ordinary (tmpname);
+diff --git a/binutils/rename.c b/binutils/rename.c
+index 65ad5bf52c4..72a9323d72c 100644
+--- a/binutils/rename.c
++++ b/binutils/rename.c
+@@ -24,14 +24,9 @@
+ 
+ #ifdef HAVE_GOOD_UTIME_H
+ #include <utime.h>
+-#else /* ! HAVE_GOOD_UTIME_H */
+-#ifdef HAVE_UTIMES
++#elif defined HAVE_UTIMES
+ #include <sys/time.h>
+-#endif /* HAVE_UTIMES */
+-#endif /* ! HAVE_GOOD_UTIME_H */
+-
+-#if ! defined (_WIN32) || defined (__CYGWIN32__)
+-static int simple_copy (const char *, const char *);
++#endif
+ 
+ /* The number of bytes to copy at once.  */
+ #define COPY_BUF 8192
+@@ -82,7 +77,6 @@ simple_copy (const char *from, const char *to)
+     }
+   return 0;
+ }
+-#endif /* __CYGWIN32__ or not _WIN32 */
+ 
+ /* Set the times of the file DESTINATION to be the same as those in
+    STATBUF.  */
+@@ -91,122 +85,52 @@ void
+ set_times (const char *destination, const struct stat *statbuf)
+ {
+   int result;
+-
+-  {
+ #ifdef HAVE_GOOD_UTIME_H
+-    struct utimbuf tb;
+-
+-    tb.actime = statbuf->st_atime;
+-    tb.modtime = statbuf->st_mtime;
+-    result = utime (destination, &tb);
+-#else /* ! HAVE_GOOD_UTIME_H */
+-#ifndef HAVE_UTIMES
+-    long tb[2];
+-
+-    tb[0] = statbuf->st_atime;
+-    tb[1] = statbuf->st_mtime;
+-    result = utime (destination, tb);
+-#else /* HAVE_UTIMES */
+-    struct timeval tv[2];
+-
+-    tv[0].tv_sec = statbuf->st_atime;
+-    tv[0].tv_usec = 0;
+-    tv[1].tv_sec = statbuf->st_mtime;
+-    tv[1].tv_usec = 0;
+-    result = utimes (destination, tv);
+-#endif /* HAVE_UTIMES */
+-#endif /* ! HAVE_GOOD_UTIME_H */
+-  }
++  struct utimbuf tb;
++
++  tb.actime = statbuf->st_atime;
++  tb.modtime = statbuf->st_mtime;
++  result = utime (destination, &tb);
++#elif defined HAVE_UTIMES
++  struct timeval tv[2];
++
++  tv[0].tv_sec = statbuf->st_atime;
++  tv[0].tv_usec = 0;
++  tv[1].tv_sec = statbuf->st_mtime;
++  tv[1].tv_usec = 0;
++  result = utimes (destination, tv);
++#else
++  long tb[2];
++
++  tb[0] = statbuf->st_atime;
++  tb[1] = statbuf->st_mtime;
++  result = utime (destination, tb);
++#endif
+ 
+   if (result != 0)
+     non_fatal (_("%s: cannot set time: %s"), destination, strerror (errno));
+ }
+ 
+-#ifndef S_ISLNK
+-#ifdef S_IFLNK
+-#define S_ISLNK(m) (((m) & S_IFMT) == S_IFLNK)
+-#else
+-#define S_ISLNK(m) 0
+-#define lstat stat
+-#endif
+-#endif
+-
+-/* Rename FROM to TO, copying if TO is a link.
+-   Return 0 if ok, -1 if error.  */
++/* Copy FROM to TO.  TARGET_STAT has the file status that, if non-NULL,
++   is used to fix up timestamps.  Return 0 if ok, -1 if error.
++   At one time this function renamed files, but file permissions are
++   tricky to update given the number of different schemes used by
++   various systems.  So now we just copy.  */
+ 
+ int
+-smart_rename (const char *from, const char *to, int preserve_dates ATTRIBUTE_UNUSED)
++smart_rename (const char *from, const char *to,
++	      struct stat *target_stat)
+ {
+-  bfd_boolean exists;
+-  struct stat s;
+-  int ret = 0;
+-
+-  exists = lstat (to, &s) == 0;
+-
+-#if defined (_WIN32) && !defined (__CYGWIN32__)
+-  /* Win32, unlike unix, will not erase `to' in `rename(from, to)' but
+-     fail instead.  Also, chown is not present.  */
++  int ret;
+ 
+-  if (exists)
+-    remove (to);
+-
+-  ret = rename (from, to);
++  ret = simple_copy (from, to);
+   if (ret != 0)
+-    {
+-      /* We have to clean up here.  */
+-      non_fatal (_("unable to rename '%s'; reason: %s"), to, strerror (errno));
+-      unlink (from);
+-    }
+-#else
+-  /* Use rename only if TO is not a symbolic link and has
+-     only one hard link, and we have permission to write to it.  */
+-  if (! exists
+-      || (!S_ISLNK (s.st_mode)
+-	  && S_ISREG (s.st_mode)
+-	  && (s.st_mode & S_IWUSR)
+-	  && s.st_nlink == 1)
+-      )
+-    {
+-      ret = rename (from, to);
+-      if (ret == 0)
+-	{
+-	  if (exists)
+-	    {
+-	      /* Try to preserve the permission bits and ownership of
+-		 TO.  First get the mode right except for the setuid
+-		 bit.  Then change the ownership.  Then fix the setuid
+-		 bit.  We do the chmod before the chown because if the
+-		 chown succeeds, and we are a normal user, we won't be
+-		 able to do the chmod afterward.  We don't bother to
+-		 fix the setuid bit first because that might introduce
+-		 a fleeting security problem, and because the chown
+-		 will clear the setuid bit anyhow.  We only fix the
+-		 setuid bit if the chown succeeds, because we don't
+-		 want to introduce an unexpected setuid file owned by
+-		 the user running objcopy.  */
+-	      chmod (to, s.st_mode & 0777);
+-	      if (chown (to, s.st_uid, s.st_gid) >= 0)
+-		chmod (to, s.st_mode & 07777);
+-	    }
+-	}
+-      else
+-	{
+-	  /* We have to clean up here.  */
+-	  non_fatal (_("unable to rename '%s'; reason: %s"), to, strerror (errno));
+-	  unlink (from);
+-	}
+-    }
+-  else
+-    {
+-      ret = simple_copy (from, to);
+-      if (ret != 0)
+-	non_fatal (_("unable to copy file '%s'; reason: %s"), to, strerror (errno));
++    non_fatal (_("unable to copy file '%s'; reason: %s"),
++	       to, strerror (errno));
+ 
+-      if (preserve_dates)
+-	set_times (to, &s);
+-      unlink (from);
+-    }
+-#endif /* _WIN32 && !__CYGWIN32__ */
++  if (target_stat != NULL)
++    set_times (to, target_stat);
++  unlink (from);
+ 
+   return ret;
+ }
+-- 
+2.17.1
+
-- 
2.17.1

