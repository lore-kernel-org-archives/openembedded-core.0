Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.2419.1609185894298692642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QxLJpyta;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id dk8so10784303edb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6BQxg8qskv9NBNd5F9alP+i4cXYegFA6lgJYkDRm/hE=;
        b=QxLJpytaKqkwnm17/bsAgGMV42e/pfJ9KxB2+C+7aT6R+hlOBDbTYqct4cRkqw4Z0L
         dDKiVfBeVQuFuFrUD4I0HcE/a1xtRMa9iY3wnRSLFIWBSs0E0rPU0+r6YyAsIAOBdo97
         c523I/rZ9i6rdi0dpCxCGJqZpAOR6qmECi2X2HkVvrwvQ+CfFLOVDlL98yy1McwAAsZ9
         vPZ13u5pB5q7959P3lJVmjrpxkvTPPU1iVlx23AkuweOXcqNSkQw5lbpG8QGa5Y7SaLo
         Z7QPKwY88Hjmw9w8riAS05Ny+HQ3Vl0VhAE3h+oeMSOYiNzeCABsaWB6cVMcFgGbDky6
         v0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6BQxg8qskv9NBNd5F9alP+i4cXYegFA6lgJYkDRm/hE=;
        b=CNmmlKcJxnDxsa46sVnjo0Xxr8+2b3teowlppsgzR2nJu52pYickdwlp8rxHJdff5m
         0ecWKYMEsm07YTvYNpyE/DCgi2WY0SoroOLE2cFGZ4MEU089AE1uzeaqMYgIyaNpAQRd
         wSxYD+T3graXqvc65XhWk0KPRlOs79Bn8XiwpxkJ8HREwMvXydF8kUE/6zk3MpSAc3p8
         chV0DPiQFghTQNCJwxS7P/HK0xZk+qAph3l2qbjHtXw+Z5nGCqV3Awfaw8yBW8MX3WcO
         jc44X4ZMhbTwz0hw9K7od+6PxRR4QkX38x4YqJJF0h5VMLlQ/3waZzN6xgyaa3HHHgzp
         IuWA==
X-Gm-Message-State: AOAM530UItiugRIrQjZoYYf6AGeZsjHkxvv0k0vlEQJXmdVyBytiWc5+
	sfqKr14wmIdRPhMYbqfuIfcIuyr/nd0=
X-Google-Smtp-Source: ABdhPJxtqwZ5U3CoyqIjUq2GZD2Ib3pkGEXI2eKSx02qPPwvOsKfeYtb/LdZt9Q2n8AIhRaOAVUj6A==
X-Received: by 2002:a05:6402:895:: with SMTP id e21mr43811715edy.284.1609185892702;
        Mon, 28 Dec 2020 12:04:52 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:52 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/22] bash: update 5.0 -> 5.1
Date: Mon, 28 Dec 2020 21:04:27 +0100
Message-Id: <20201228200436.78130-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/bash/bash.inc           |   1 +
 .../bash/bash/CVE-2019-18276.patch            | 386 ------------------
 .../bash/bash/build-tests.patch               |  16 +-
 meta/recipes-extended/bash/bash_5.0.bb        |  80 ----
 meta/recipes-extended/bash/bash_5.1.bb        |  30 ++
 5 files changed, 40 insertions(+), 473 deletions(-)
 delete mode 100644 meta/recipes-extended/bash/bash/CVE-2019-18276.patch
 delete mode 100644 meta/recipes-extended/bash/bash_5.0.bb
 create mode 100644 meta/recipes-extended/bash/bash_5.1.bb

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 1ebb33bdcd..feb7483dc3 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -8,6 +8,7 @@ inherit autotools gettext texinfo update-alternatives ptest
 
 EXTRA_AUTORECONF += "--exclude=autoheader --exclude=aclocal"
 EXTRA_OECONF = "--enable-job-control --without-bash-malloc bash_cv_wexitstatus_offset=8"
+INHIBIT_PRUNE_M4 = "1"
 
 # If NON_INTERACTIVE_LOGIN_SHELLS is defined, all login shells read the
 # startup files, even if they are not interactive.
diff --git a/meta/recipes-extended/bash/bash/CVE-2019-18276.patch b/meta/recipes-extended/bash/bash/CVE-2019-18276.patch
deleted file mode 100644
index 7b2073201e..0000000000
--- a/meta/recipes-extended/bash/bash/CVE-2019-18276.patch
+++ /dev/null
@@ -1,386 +0,0 @@
-From 951bdaad7a18cc0dc1036bba86b18b90874d39ff Mon Sep 17 00:00:00 2001
-From: Chet Ramey <chet.ramey@case.edu>
-Date: Mon, 1 Jul 2019 09:03:53 -0400
-Subject: [PATCH] commit bash-20190628 snapshot
-
-An issue was discovered in disable_priv_mode in shell.c in GNU Bash through 5.0 patch 11.
-By default, if Bash is run with its effective UID not equal to its real UID,
-it will drop privileges by setting its effective UID to its real UID.
-However, it does so incorrectly. On Linux and other systems that support "saved UID" functionality,
-the saved UID is not dropped. An attacker with command execution in the shell can use "enable -f" for
-runtime loading of a new builtin, which can be a shared object that calls setuid() and therefore
-regains privileges. However, binaries running with an effective UID of 0 are unaffected.
-
-Get the patch from [1] to fix the issue.
-
-Upstream-Status: Inappropriate [the upstream thinks it doesn't increase the credibility of CVEs in general]
-CVE: CVE-2019-18276
-
-[1] https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=951bdaa
-
-Signed-off-by: De Huo <De.Huo@windriver.com>
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- MANIFEST          |  2 ++
- bashline.c        | 50 +-------------------------------------------------
- builtins/help.def |  2 +-
- config.h.in       | 10 +++++++++-
- configure.ac      |  1 +
- doc/bash.1        |  3 ++-
- doc/bashref.texi  |  3 ++-
- lib/glob/glob.c   |  5 ++++-
- pathexp.c         | 16 ++++++++++++++--
- shell.c           |  8 ++++++++
- tests/glob.tests  |  2 ++
- tests/glob6.sub   | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
- tests/glob7.sub   | 11 +++++++++++
- 14 files changed, 122 insertions(+), 56 deletions(-)
- create mode 100644 tests/glob6.sub
- create mode 100644 tests/glob7.sub
-
-diff --git a/MANIFEST b/MANIFEST
-index 03de221..f9ccad7 100644
---- a/MANIFEST
-+++ b/MANIFEST
-@@ -1037,6 +1037,8 @@ tests/extglob3.tests	f
- tests/extglob3.right	f
- tests/extglob4.sub	f
- tests/extglob5.sub	f
-+tests/glob6.sub		f
-+tests/glob7.sub		f
- tests/func.tests	f
- tests/func.right	f
- tests/func1.sub		f
-diff --git a/bashline.c b/bashline.c
-index 824ea9d..d86b47d 100644
---- a/bashline.c
-+++ b/bashline.c
-@@ -3718,55 +3718,7 @@ static int
- completion_glob_pattern (string)
-      char *string;
- {
--  register int c;
--  char *send;
--  int open;
--
--  DECLARE_MBSTATE;
--
--  open = 0;
--  send = string + strlen (string);
--
--  while (c = *string++)
--    {
--      switch (c)
--	{
--	case '?':
--	case '*':
--	  return (1);
--
--	case '[':
--	  open++;
--	  continue;
--
--	case ']':
--	  if (open)
--	    return (1);
--	  continue;
--
--	case '+':
--	case '@':
--	case '!':
--	  if (*string == '(')	/*)*/
--	    return (1);
--	  continue;
--
--	case '\\':
--	  if (*string++ == 0)
--	    return (0);	 	  
--	}
--
--      /* Advance one fewer byte than an entire multibyte character to
--	 account for the auto-increment in the loop above. */
--#ifdef HANDLE_MULTIBYTE
--      string--;
--      ADVANCE_CHAR_P (string, send - string);
--      string++;
--#else
--      ADVANCE_CHAR_P (string, send - string);
--#endif
--    }
--  return (0);
-+  return (glob_pattern_p (string) == 1);
- }
- 
- static char *globtext;
-diff --git a/builtins/help.def b/builtins/help.def
-index 006c4b5..92f9b38 100644
---- a/builtins/help.def
-+++ b/builtins/help.def
-@@ -128,7 +128,7 @@ help_builtin (list)
- 
-   /* We should consider making `help bash' do something. */
- 
--  if (glob_pattern_p (list->word->word))
-+  if (glob_pattern_p (list->word->word) == 1)
-     {
-       printf ("%s", ngettext ("Shell commands matching keyword `", "Shell commands matching keywords `", (list->next ? 2 : 1)));
-       print_word_list (list, ", ");
-diff --git a/config.h.in b/config.h.in
-index 8554aec..ad4b1e8 100644
---- a/config.h.in
-+++ b/config.h.in
-@@ -1,6 +1,6 @@
- /* config.h -- Configuration file for bash. */
- 
--/* Copyright (C) 1987-2009,2011-2012 Free Software Foundation, Inc.
-+/* Copyright (C) 1987-2009,2011-2012,2013-2019 Free Software Foundation, Inc.
- 
-    This file is part of GNU Bash, the Bourne Again SHell.
- 
-@@ -807,6 +807,14 @@
- #undef HAVE_SETREGID
- #undef HAVE_DECL_SETREGID
- 
-+/* Define if you have the setregid function.  */
-+#undef HAVE_SETRESGID
-+#undef HAVE_DECL_SETRESGID
-+
-+/* Define if you have the setresuid function.  */
-+#undef HAVE_SETRESUID
-+#undef HAVE_DECL_SETRESUID
-+
- /* Define if you have the setvbuf function.  */
- #undef HAVE_SETVBUF
- 
-diff --git a/configure.ac b/configure.ac
-index 52b4cdb..549adef 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -810,6 +810,7 @@ AC_CHECK_DECLS([confstr])
- AC_CHECK_DECLS([printf])
- AC_CHECK_DECLS([sbrk])
- AC_CHECK_DECLS([setregid])
-+AC_CHECK_DECLS[(setresuid, setresgid])
- AC_CHECK_DECLS([strcpy])
- AC_CHECK_DECLS([strsignal])
- 
-diff --git a/doc/bash.1 b/doc/bash.1
-index e6cd08d..9e58a0b 100644
---- a/doc/bash.1
-+++ b/doc/bash.1
-@@ -4681,7 +4681,8 @@ above).
- .PD
- .SH "SIMPLE COMMAND EXPANSION"
- When a simple command is executed, the shell performs the following
--expansions, assignments, and redirections, from left to right.
-+expansions, assignments, and redirections, from left to right, in
-+the following order.
- .IP 1.
- The words that the parser has marked as variable assignments (those
- preceding the command name) and redirections are saved for later
-diff --git a/doc/bashref.texi b/doc/bashref.texi
-index d33cd57..3065126 100644
---- a/doc/bashref.texi
-+++ b/doc/bashref.texi
-@@ -2964,7 +2964,8 @@ is not specified.  If the file does not exist, it is created.
- @cindex command expansion
- 
- When a simple command is executed, the shell performs the following
--expansions, assignments, and redirections, from left to right.
-+expansions, assignments, and redirections, from left to right, in
-+the following order.
- 
- @enumerate
- @item
-diff --git a/lib/glob/glob.c b/lib/glob/glob.c
-index 398253b..2eaa33e 100644
---- a/lib/glob/glob.c
-+++ b/lib/glob/glob.c
-@@ -607,6 +607,7 @@ glob_vector (pat, dir, flags)
-   register unsigned int i;
-   int mflags;		/* Flags passed to strmatch (). */
-   int pflags;		/* flags passed to sh_makepath () */
-+  int hasglob;		/* return value from glob_pattern_p */
-   int nalloca;
-   struct globval *firstmalloc, *tmplink;
-   char *convfn;
-@@ -648,10 +649,12 @@ glob_vector (pat, dir, flags)
-   patlen = (pat && *pat) ? strlen (pat) : 0;
- 
-   /* If the filename pattern (PAT) does not contain any globbing characters,
-+     or contains a pattern with only backslash escapes (hasglob == 2),
-      we can dispense with reading the directory, and just see if there is
-      a filename `DIR/PAT'.  If there is, and we can access it, just make the
-      vector to return and bail immediately. */
--  if (skip == 0 && glob_pattern_p (pat) == 0)
-+  hasglob = 0;
-+  if (skip == 0 && (hasglob = glob_pattern_p (pat)) == 0 || hasglob == 2)
-     {
-       int dirlen;
-       struct stat finfo;
-diff --git a/pathexp.c b/pathexp.c
-index c1bf2d8..e6c5392 100644
---- a/pathexp.c
-+++ b/pathexp.c
-@@ -58,7 +58,10 @@ int extended_glob = EXTGLOB_DEFAULT;
- /* Control enabling special handling of `**' */
- int glob_star = 0;
- 
--/* Return nonzero if STRING has any unquoted special globbing chars in it.  */
-+/* Return nonzero if STRING has any unquoted special globbing chars in it.
-+   This is supposed to be called when pathname expansion is performed, so
-+   it implements the rules in Posix 2.13.3, specifically that an unquoted
-+   slash cannot appear in a bracket expression. */
- int
- unquoted_glob_pattern_p (string)
-      register char *string;
-@@ -85,10 +88,14 @@ unquoted_glob_pattern_p (string)
- 	  continue;
- 
- 	case ']':
--	  if (open)
-+	  if (open)		/* XXX - if --open == 0? */
- 	    return (1);
- 	  continue;
- 
-+	case '/':
-+	  if (open)
-+	    open = 0;
-+
- 	case '+':
- 	case '@':
- 	case '!':
-@@ -106,6 +113,11 @@ unquoted_glob_pattern_p (string)
- 	      string++;
- 	      continue;
- 	    }
-+	  else if (open && *string == '/')
-+	    {
-+	      string++;		/* quoted slashes in bracket expressions are ok */
-+	      continue;
-+	    }
- 	  else if (*string == 0)
- 	    return (0);
- 	 	  
-diff --git a/shell.c b/shell.c
-index a2b2a55..6adabc8 100644
---- a/shell.c
-+++ b/shell.c
-@@ -1293,7 +1293,11 @@ disable_priv_mode ()
- {
-   int e;
- 
-+#if HAVE_DECL_SETRESUID
-+  if (setresuid (current_user.uid, current_user.uid, current_user.uid) < 0)
-+#else
-   if (setuid (current_user.uid) < 0)
-+#endif
-     {
-       e = errno;
-       sys_error (_("cannot set uid to %d: effective uid %d"), current_user.uid, current_user.euid);
-@@ -1302,7 +1306,11 @@ disable_priv_mode ()
- 	exit (e);
- #endif
-     }
-+#if HAVE_DECL_SETRESGID
-+  if (setresgid (current_user.gid, current_user.gid, current_user.gid) < 0)
-+#else
-   if (setgid (current_user.gid) < 0)
-+#endif
-     sys_error (_("cannot set gid to %d: effective gid %d"), current_user.gid, current_user.egid);
- 
-   current_user.euid = current_user.uid;
-diff --git a/tests/glob.tests b/tests/glob.tests
-index 01913bb..fb012f7 100644
---- a/tests/glob.tests
-+++ b/tests/glob.tests
-@@ -12,6 +12,8 @@ ${THIS_SH} ./glob1.sub
- ${THIS_SH} ./glob2.sub
- ${THIS_SH} ./glob3.sub
- ${THIS_SH} ./glob4.sub
-+${THIS_SH} ./glob6.sub
-+${THIS_SH} ./glob7.sub
- 
- MYDIR=$PWD	# save where we are
- 
-diff --git a/tests/glob6.sub b/tests/glob6.sub
-new file mode 100644
-index 0000000..b099811
---- /dev/null
-+++ b/tests/glob6.sub
-@@ -0,0 +1,54 @@
-+# tests of the backslash-in-glob-patterns discussion on the austin-group ML
-+
-+: ${TMPDIR:=/var/tmp}
-+
-+ORIG=$PWD
-+GLOBDIR=$TMPDIR/bash-glob-$$
-+mkdir $GLOBDIR && cd $GLOBDIR
-+
-+# does the pattern matcher allow backslashes as escape characters and remove
-+# them as part of matching?
-+touch abcdefg
-+pat='ab\cd*'
-+printf '<%s>\n' $pat
-+pat='\.'
-+printf '<%s>\n' $pat
-+rm abcdefg
-+
-+# how about when escaping pattern characters?
-+touch '*abc.c'
-+a='\**.c'
-+printf '%s\n' $a
-+rm -f '*abc.c'
-+
-+# how about when making the distinction between readable and searchable path
-+# components?
-+mkdir -m a=x searchable
-+mkdir -m a=r readable
-+
-+p='searchable/\.'
-+printf "%s\n" $p
-+
-+p='searchable/\./.'
-+printf "%s\n" $p
-+
-+p='readable/\.'
-+printf "%s\n" $p
-+
-+p='readable/\./.'
-+printf "%s\n" $p
-+
-+printf "%s\n" 'searchable/\.'
-+printf "%s\n" 'readable/\.'
-+
-+echo */.
-+
-+p='*/\.'
-+echo $p
-+
-+echo */'.'
-+
-+rmdir searchable readable
-+
-+cd $ORIG
-+rmdir $GLOBDIR
-diff --git a/tests/glob7.sub b/tests/glob7.sub
-new file mode 100644
-index 0000000..0212b8e
---- /dev/null
-+++ b/tests/glob7.sub
-@@ -0,0 +1,11 @@
-+# according to Posix 2.13.3, a slash in a bracket expression renders that
-+# bracket expression invalid
-+shopt -s nullglob
-+
-+echo 1: [qwe/qwe]
-+echo 2: [qwe/
-+echo 3: [qwe/]
-+
-+echo 4: [qwe\/qwe]
-+echo 5: [qwe\/
-+echo 6: [qwe\/]
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/bash/bash/build-tests.patch b/meta/recipes-extended/bash/bash/build-tests.patch
index 5f2dae94a1..ea38bace9b 100644
--- a/meta/recipes-extended/bash/bash/build-tests.patch
+++ b/meta/recipes-extended/bash/bash/build-tests.patch
@@ -1,19 +1,24 @@
-Add 'ptest' target to Makefile, to run tests without checking dependencies.
+From 318b762837c2ad25319caeaf0320eff613b64daf Mon Sep 17 00:00:00 2001
+From: Anders Roxell <anders.roxell@enea.com>
+Date: Wed, 19 Dec 2012 17:18:31 +0100
+Subject: [PATCH] Add 'ptest' target to Makefile, to run tests without checking
+ dependencies.
 
 Upstream-Status: Pending
 Signed-off-by: Anders Roxell <anders.roxell@enea.com>
 
 Rebase to 5.0
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  Makefile.in | 24 +++++++++++++++++++-----
  1 file changed, 19 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 5fcb44b..de1c255 100644
+index bc97049..937ce39 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -932,20 +932,34 @@ maybe-clean:
+@@ -943,20 +943,34 @@ maybe-clean:
  	fi
  
  recho$(EXEEXT):		$(SUPPORT_SRC)recho.c
@@ -51,8 +56,5 @@ index 5fcb44b..de1c255 100644
 +
 +runtest:
  	@( cd $(srcdir)/tests && \
- 		PATH=$(BUILD_DIR)/tests:$$PATH THIS_SH=$(THIS_SH) $(SHELL) ${TESTSCRIPT} )
+ 		BUILD_DIR=$(BUILD_DIR) PATH=$(BUILD_DIR)/tests:$$PATH THIS_SH=$(THIS_SH) $(SHELL) ${TESTSCRIPT} )
  
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/bash/bash_5.0.bb b/meta/recipes-extended/bash/bash_5.0.bb
deleted file mode 100644
index 53e05869ce..0000000000
--- a/meta/recipes-extended/bash/bash_5.0.bb
+++ /dev/null
@@ -1,80 +0,0 @@
-require bash.inc
-
-# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-001;apply=yes;striplevel=0;name=patch001 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-002;apply=yes;striplevel=0;name=patch002 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-003;apply=yes;striplevel=0;name=patch003 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-004;apply=yes;striplevel=0;name=patch004 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-005;apply=yes;striplevel=0;name=patch005 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-006;apply=yes;striplevel=0;name=patch006 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-007;apply=yes;striplevel=0;name=patch007 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-008;apply=yes;striplevel=0;name=patch008 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-009;apply=yes;striplevel=0;name=patch009 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-010;apply=yes;striplevel=0;name=patch010 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-011;apply=yes;striplevel=0;name=patch011 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-012;apply=yes;striplevel=0;name=patch012 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-013;apply=yes;striplevel=0;name=patch013 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-014;apply=yes;striplevel=0;name=patch014 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-015;apply=yes;striplevel=0;name=patch015 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-016;apply=yes;striplevel=0;name=patch016 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-017;apply=yes;striplevel=0;name=patch017 \
-           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-018;apply=yes;striplevel=0;name=patch018 \
-           file://execute_cmd.patch \
-           file://mkbuiltins_have_stringize.patch \
-           file://build-tests.patch \
-           file://test-output.patch \
-           file://run-ptest \
-           file://run-bash-ptests \
-           file://fix-run-builtins.patch \
-           file://CVE-2019-18276.patch \
-           "
-
-SRC_URI[tarball.md5sum] = "2b44b47b905be16f45709648f671820b"
-SRC_URI[tarball.sha256sum] = "b4a80f2ac66170b2913efbfb9f2594f1f76c7b1afd11f799e22035d63077fb4d"
-
-SRC_URI[patch001.md5sum] = "b026862ab596a5883bb4f0d1077a3819"
-SRC_URI[patch001.sha256sum] = "f2fe9e1f0faddf14ab9bfa88d450a75e5d028fedafad23b88716bd657c737289"
-SRC_URI[patch002.md5sum] = "2f4a7787365790ae57f36b311701ea7e"
-SRC_URI[patch002.sha256sum] = "87e87d3542e598799adb3e7e01c8165bc743e136a400ed0de015845f7ff68707"
-SRC_URI[patch003.md5sum] = "af7f2dd93fd5429fb5e9a642ff74f87d"
-SRC_URI[patch003.sha256sum] = "4eebcdc37b13793a232c5f2f498a5fcbf7da0ecb3da2059391c096db620ec85b"
-SRC_URI[patch004.md5sum] = "b60545b273bfa4e00a760f2c648bed9c"
-SRC_URI[patch004.sha256sum] = "14447ad832add8ecfafdce5384badd933697b559c4688d6b9e3d36ff36c62f08"
-SRC_URI[patch005.md5sum] = "875a0bedf48b74e453e3997c84b5d8a4"
-SRC_URI[patch005.sha256sum] = "5bf54dd9bd2c211d2bfb34a49e2c741f2ed5e338767e9ce9f4d41254bf9f8276"
-SRC_URI[patch006.md5sum] = "4a8ee95adb72c3aba03d9e8c9f96ece6"
-SRC_URI[patch006.sha256sum] = "d68529a6ff201b6ff5915318ab12fc16b8a0ebb77fda3308303fcc1e13398420"
-SRC_URI[patch007.md5sum] = "411560d81fde2dc5b17b83c3f3b58c6f"
-SRC_URI[patch007.sha256sum] = "17b41e7ee3673d8887dd25992417a398677533ab8827938aa41fad70df19af9b"
-SRC_URI[patch008.md5sum] = "dd7cf7a784d1838822cad8d419315991"
-SRC_URI[patch008.sha256sum] = "eec64588622a82a5029b2776e218a75a3640bef4953f09d6ee1f4199670ad7e3"
-SRC_URI[patch009.md5sum] = "c1b3e937cd6dccbb7fd772f32812a0da"
-SRC_URI[patch009.sha256sum] = "ed3ca21767303fc3de93934aa524c2e920787c506b601cc40a4897d4b094d903"
-SRC_URI[patch010.md5sum] = "19b41e73b03602d0e261c471b53e670c"
-SRC_URI[patch010.sha256sum] = "d6fbc325f0b5dc54ddbe8ee43020bced8bd589ddffea59d128db14b2e52a8a11"
-SRC_URI[patch011.md5sum] = "414339330a3634137081a97f2c8615a8"
-SRC_URI[patch011.sha256sum] = "2c4de332b91eaf797abbbd6c79709690b5cbd48b12e8dfe748096dbd7bf474ea"
-SRC_URI[patch012.md5sum] = "1870268f62b907221b078ad109e1fa94"
-SRC_URI[patch012.sha256sum] = "2943ee19688018296f2a04dbfe30b7138b889700efa8ff1c0524af271e0ee233"
-SRC_URI[patch013.md5sum] = "40d923af4b952b01983ed4c889ae2653"
-SRC_URI[patch013.sha256sum] = "f5d7178d8da30799e01b83a0802018d913d6aa972dd2ddad3b927f3f3eb7099a"
-SRC_URI[patch014.md5sum] = "57857b22053c8167677e5e5ac5c6669b"
-SRC_URI[patch014.sha256sum] = "5d6eee6514ee6e22a87bba8d22be0a8621a0ae119246f1c5a9a35db1f72af589"
-SRC_URI[patch015.md5sum] = "c4c6ea23d09a74eaa9385438e48fdf02"
-SRC_URI[patch015.sha256sum] = "a517df2dda93b26d5cbf00effefea93e3a4ccd6652f152f4109170544ebfa05e"
-SRC_URI[patch016.md5sum] = "a682ed6fa2c2e7a7c3ba6bdeada07fb5"
-SRC_URI[patch016.sha256sum] = "ffd1d7a54a99fa7f5b1825e4f7e95d8c8876bc2ca151f150e751d429c650b06d"
-SRC_URI[patch017.md5sum] = "d9dcaa1d8e7a24850449a1aac43a12a9"
-SRC_URI[patch017.sha256sum] = "4cf3b9fafb8a66d411dd5fc9120032533a4012df1dc6ee024c7833373e2ddc31"
-SRC_URI[patch018.md5sum] = "a64d950d5de72ae590455b13e6afefcb"
-SRC_URI[patch018.sha256sum] = "7c314e375a105a6642e8ed44f3808b9def89d15f7492fe2029a21ba9c0de81d3"
-
-
-DEBUG_OPTIMIZATION_append_armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-DEBUG_OPTIMIZATION_append_armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-extended/bash/bash_5.1.bb b/meta/recipes-extended/bash/bash_5.1.bb
new file mode 100644
index 0000000000..f403b26fc4
--- /dev/null
+++ b/meta/recipes-extended/bash/bash_5.1.bb
@@ -0,0 +1,30 @@
+require bash.inc
+
+# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash51-001;apply=yes;striplevel=0;name=patch001 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash51-002;apply=yes;striplevel=0;name=patch002 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash51-003;apply=yes;striplevel=0;name=patch003 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash51-004;apply=yes;striplevel=0;name=patch004 \
+           file://execute_cmd.patch \
+           file://mkbuiltins_have_stringize.patch \
+           file://build-tests.patch \
+           file://test-output.patch \
+           file://run-ptest \
+           file://run-bash-ptests \
+           file://fix-run-builtins.patch \
+           "
+
+SRC_URI[tarball.sha256sum] = "cc012bc860406dcf42f64431bcd3d2fa7560c02915a601aba9cd597a39329baa"
+SRC_URI[patch001.sha256sum] = "ebb07b3dbadd98598f078125d0ae0d699295978a5cdaef6282fe19adef45b5fa"
+SRC_URI[patch002.sha256sum] = "15ea6121a801e48e658ceee712ea9b88d4ded022046a6147550790caf04f5dbe"
+SRC_URI[patch003.sha256sum] = "22f2cc262f056b22966281babf4b0a2f84cb7dd2223422e5dcd013c3dcbab6b1"
+SRC_URI[patch004.sha256sum] = "9aaeb65664ef0d28c0067e47ba5652b518298b3b92d33327d84b98b28d873c86"
+
+DEBUG_OPTIMIZATION_append_armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+DEBUG_OPTIMIZATION_append_armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.29.2

