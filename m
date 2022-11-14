Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9743C4167D
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 19:01:26 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.740.1668452479072026932
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 11:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZPkMNYsz;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id v1so19972420wrt.11
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 11:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FG+HNImxPL5Y9kahYeBQzxL5qKvC5Ydb59eYSppkz8=;
        b=ZPkMNYsz7dlwdjzciF0gq1/DERd7uTb8QnWd/JkXAd28DnJqiOVzHQjFknoablY4Pj
         6KfkdpK6sBwCy28kEueDFsI+VtfFw2cLiZ4aynFvzQ60BWZeAjRnY7DItd3wx+JQAp/w
         UYXlYqCxnmDmdnDV5xF2srKBspLL0h7yR44Mh+zqEShYSXtkPHadomULOgrj6WuQVns2
         m253JDafxwnGuYEjCnJGG+4YluPgv2d/Dhb54hYoSkCYmfWVihm9nurGBltQrIcHlmj7
         tLpPbzR3pZBcWZzGw6ExdmdTYRaT327QcystA0L05w88a8rP2B1ZGOPuNuUXErrhq8l5
         IIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FG+HNImxPL5Y9kahYeBQzxL5qKvC5Ydb59eYSppkz8=;
        b=D+lzALE0u7XBNA18j/W9uzDxE2OPc5XDbB4Ow3dapDxmLqoqxJoLqZftsrPYZ3W2p7
         kUOg9vcD17SofcYoeJpoZ230yjDkcEKABuLxVckhfe96OYlAojjUSS2ixki/C8K818U6
         KWNt4df+ov5JfELpy/iDpjkuI89hmNCQQvHePBVH7RACXgivoj5SkDXtMNAmOaXPacik
         9EqXJYjmH4GFwqIwIvFUe1/kIMSACH1VDhpK92ibBb5RRuB0cU9LJHcJ3iJLpkr0P+7I
         zFncb3kArPSft76TdNw0j5T882nuw+S0R+RnC8NssNuuLah2ZkKcPFpkT5xXHxkc6Vk8
         dBiw==
X-Gm-Message-State: ANoB5pnvbgvOEaXOL0H32M6N9ldeZPq1ntmJvgLKqCHhgWmFTG5pCp+C
	NmAAyf7+Dm/k/qkKDW6mdDyDWkYsxMo=
X-Google-Smtp-Source: AA0mqf7Wf+2W+mhLbUpBbZw8Bjvoml1+CDdg0tLPqM+6zi/9GY4+plLg9D5usqCmxm3MKyCyAm0cJQ==
X-Received: by 2002:a5d:4b90:0:b0:241:784b:666b with SMTP id b16-20020a5d4b90000000b00241784b666bmr6728847wrt.483.1668452477399;
        Mon, 14 Nov 2022 11:01:17 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id c7-20020a1c3507000000b003c6f1732f65sm18091811wma.38.2022.11.14.11.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 11:01:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/8] make: update 4.3 -> 4.4
Date: Mon, 14 Nov 2022 20:00:54 +0100
Message-Id: <20221114190056.2612669-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221114190056.2612669-1-alex@linutronix.de>
References: <20221114190056.2612669-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 19:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173259

Deleted patches:
make/0001-makeinst-Do-not-undef-POSIX-on-clang-arm.patch
(modified bit removed upstream)
make/0001-src-dir.c-fix-buffer-overflow-warning.patch
make/0002-w32-compat-dirent.c-follow-header.patch
make/0003-posixfcn-fcntl-gnulib-make-emulated.patch
(fixed upstream)
make/0002-modules-fcntl-allow-being-detected-by-importing-proj.patch
(code removed upstream)

License-update: formatting

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/git/git_2.38.1.bb       |  3 +-
 ...inst-Do-not-undef-POSIX-on-clang-arm.patch | 38 ---------
 ...rc-dir.c-fix-buffer-overflow-warning.patch | 41 ----------
 ...low-being-detected-by-importing-proj.patch | 33 --------
 ...02-w32-compat-dirent.c-follow-header.patch | 36 ---------
 ...-posixfcn-fcntl-gnulib-make-emulated.patch | 79 -------------------
 meta/recipes-devtools/make/make/sigpipe.patch | 42 ++++++++++
 meta/recipes-devtools/make/make_4.3.bb        | 18 -----
 meta/recipes-devtools/make/make_4.4.bb        | 14 ++++
 9 files changed, 58 insertions(+), 246 deletions(-)
 delete mode 100644 meta/recipes-devtools/make/make/0001-makeinst-Do-not-undef-POSIX-on-clang-arm.patch
 delete mode 100644 meta/recipes-devtools/make/make/0001-src-dir.c-fix-buffer-overflow-warning.patch
 delete mode 100644 meta/recipes-devtools/make/make/0002-modules-fcntl-allow-being-detected-by-importing-proj.patch
 delete mode 100644 meta/recipes-devtools/make/make/0002-w32-compat-dirent.c-follow-header.patch
 delete mode 100644 meta/recipes-devtools/make/make/0003-posixfcn-fcntl-gnulib-make-emulated.patch
 create mode 100644 meta/recipes-devtools/make/make/sigpipe.patch
 delete mode 100644 meta/recipes-devtools/make/make_4.3.bb
 create mode 100644 meta/recipes-devtools/make/make_4.4.bb

diff --git a/meta/recipes-devtools/git/git_2.38.1.bb b/meta/recipes-devtools/git/git_2.38.1.bb
index 033e36ae16..ef64dba7ac 100644
--- a/meta/recipes-devtools/git/git_2.38.1.bb
+++ b/meta/recipes-devtools/git/git_2.38.1.bb
@@ -71,7 +71,8 @@ do_install () {
 	install -m 644 ${S}/contrib/completion/git-completion.bash ${D}/${datadir}/bash-completion/completions/git
 
         if [ "${@bb.utils.filter('PACKAGECONFIG', 'manpages', d)}" ]; then
-            oe_runmake install-man DESTDIR="${D}"
+            # Needs to be serial with make 4.4 due to https://savannah.gnu.org/bugs/index.php?63362
+            make install-man DESTDIR="${D}"
         fi
 }
 
diff --git a/meta/recipes-devtools/make/make/0001-makeinst-Do-not-undef-POSIX-on-clang-arm.patch b/meta/recipes-devtools/make/make/0001-makeinst-Do-not-undef-POSIX-on-clang-arm.patch
deleted file mode 100644
index 2da7c983dc..0000000000
--- a/meta/recipes-devtools/make/make/0001-makeinst-Do-not-undef-POSIX-on-clang-arm.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 86b7947156a0c33e768d0a265e38f2881a70a7e2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 6 Mar 2020 23:19:37 -0800
-Subject: [PATCH] makeinst: Do not undef POSIX on clang/arm
-
-if __arm internal compiler macro is defined then make assumes that the
-system is not posix and goes ahead and undefs POSIX, which results in
-miscompiling make with clang, since clang does define __arm unlike gcc
-which does not, but they both support posix just fine, so here check for
-compiler not being clang when __arm is defined before undefining posix
-
-Fixes error like
-../make-4.3/src/job.c:507:27: error: too many arguments to function call, expected 0, have 1
-  sigsetmask (siggetmask (0) & ~fatal_signal_mask)
-              ~~~~~~~~~~  ^
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/makeint.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/makeint.h b/src/makeint.h
-index c428a36..fadf963 100644
---- a/src/makeint.h
-+++ b/src/makeint.h
-@@ -115,7 +115,7 @@ extern int errno;
- #endif
- 
- /* Some systems define _POSIX_VERSION but are not really POSIX.1.  */
--#if (defined (butterfly) || defined (__arm) || (defined (__mips) && defined (_SYSTYPE_SVR3)) || (defined (sequent) && defined (i386)))
-+#if (defined (butterfly) || (defined (__arm) && !defined(__clang__)) || (defined (__mips) && defined (_SYSTYPE_SVR3)) || (defined (sequent) && defined (i386)))
- # undef POSIX
- #endif
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/make/make/0001-src-dir.c-fix-buffer-overflow-warning.patch b/meta/recipes-devtools/make/make/0001-src-dir.c-fix-buffer-overflow-warning.patch
deleted file mode 100644
index 57970824f6..0000000000
--- a/meta/recipes-devtools/make/make/0001-src-dir.c-fix-buffer-overflow-warning.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From cd7091a7d88306004ca98c5dafcc40f44589b105 Mon Sep 17 00:00:00 2001
-From: Jens Rehsack <sno@netbsd.org>
-Date: Mon, 24 Feb 2020 10:52:21 +0100
-Subject: [PATCH 1/3] src/dir.c: fix buffer-overflow warning
-
-Fix compiler warning:
-	src/dir.c:1294:7: warning: 'strncpy' specified bound depends on the
-			  length of the source argument [-Wstringop-overflow=]
-
-The existing code assumes `path` will never exceed `MAXPATHLEN`. Also the
-size of the buffer is increased by 1 to hold a path with the length of
-`MAXPATHLEN` and trailing `0`.
-
-Signed-off-by: Jens Rehsack <sno@netbsd.org>
----
-Upstream-Status: Pending (https://savannah.gnu.org/bugs/?57888)
-
- src/dir.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/dir.c b/src/dir.c
-index 862a18e..cad4c4a 100644
---- a/src/dir.c
-+++ b/src/dir.c
-@@ -1289,10 +1289,10 @@ local_stat (const char *path, struct stat *buf)
-   if (plen > 1 && path[plen - 1] == '.'
-       && (path[plen - 2] == '/' || path[plen - 2] == '\\'))
-     {
--      char parent[MAXPATHLEN];
-+      char parent[MAXPATHLEN+1];
- 
--      strncpy (parent, path, plen - 2);
--      parent[plen - 2] = '\0';
-+      strncpy (parent, path, MAXPATHLEN);
-+      parent[MIN(plen - 2, MAXPATHLEN)] = '\0';
-       if (stat (parent, buf) < 0 || !_S_ISDIR (buf->st_mode))
-         return -1;
-     }
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/make/make/0002-modules-fcntl-allow-being-detected-by-importing-proj.patch b/meta/recipes-devtools/make/make/0002-modules-fcntl-allow-being-detected-by-importing-proj.patch
deleted file mode 100644
index b3d97f9a3a..0000000000
--- a/meta/recipes-devtools/make/make/0002-modules-fcntl-allow-being-detected-by-importing-proj.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From fb8aaed3b040e589cd880fd714dda5ec00687217 Mon Sep 17 00:00:00 2001
-From: Jens Rehsack <sno@netbsd.org>
-Date: Mon, 24 Feb 2020 12:10:06 +0100
-Subject: [PATCH 2/2] modules: fcntl: allow being detected by importing
- projects
-
-GNU project `make` relies on gnulib but provides some own compatibility
-functions - including an `fcntl`, which fails on mingw.
-The intension of gnulib is providing these functions and being wider tested,
-but silently injecting a function opens battle of compatibility layers.
-
-So adding a hint into target `config.h` to allow deciding whether using
-an own compatibility implementation or not.
-
-Signed-off-by: Jens Rehsack <sno@netbsd.org>
----
-Upstream-Status: Pending
-
- m4/gnulib-comp.m4 | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/m4/gnulib-comp.m4 b/m4/gnulib-comp.m4
-index 3ee0811..cf75541 100644
---- a/m4/gnulib-comp.m4
-+++ b/m4/gnulib-comp.m4
-@@ -147,6 +147,7 @@
-   gl_FUNC_FCNTL
-   if test $HAVE_FCNTL = 0 || test $REPLACE_FCNTL = 1; then
-     AC_LIBOBJ([fcntl])
-+    AC_DEFINE(HAVE_GNULIB_FCNTL, 1, [Define to 1 if you have the `fcntl' function via gnulib.])
-   fi
-   gl_FCNTL_MODULE_INDICATOR([fcntl])
-   gl_FCNTL_H
diff --git a/meta/recipes-devtools/make/make/0002-w32-compat-dirent.c-follow-header.patch b/meta/recipes-devtools/make/make/0002-w32-compat-dirent.c-follow-header.patch
deleted file mode 100644
index 9ecc44543e..0000000000
--- a/meta/recipes-devtools/make/make/0002-w32-compat-dirent.c-follow-header.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 4dd8b4f43aa0078707ad9a7932f4e137bc4383ed Mon Sep 17 00:00:00 2001
-From: Jens Rehsack <sno@netbsd.org>
-Date: Mon, 24 Feb 2020 11:12:43 +0100
-Subject: [PATCH 2/3] w32: compat: dirent.c: follow header
-
-src/w32/include/dirent.h completely delegates to mingw dirent implementation,
-gnulib detects it as fine and completely usable - trust in that.
-
-Signed-off-by: Jens Rehsack <sno@netbsd.org>
----
-Upstream-Status: Pending (https://savannah.gnu.org/bugs/?57888)
-
- src/w32/compat/dirent.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/w32/compat/dirent.c b/src/w32/compat/dirent.c
-index b8ec615..de80f72 100644
---- a/src/w32/compat/dirent.c
-+++ b/src/w32/compat/dirent.c
-@@ -23,7 +23,7 @@ this program.  If not, see <http://www.gnu.org/licenses/>.  */
- #include <stdlib.h>
- #include "dirent.h"
- 
--
-+#ifndef __MINGW32__
- DIR*
- opendir(const char* pDirName)
- {
-@@ -193,3 +193,4 @@ seekdir(DIR* pDir, long nPosition)
- 
-         return;
- }
-+#endif  /* !__MINGW32__ */
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/make/make/0003-posixfcn-fcntl-gnulib-make-emulated.patch b/meta/recipes-devtools/make/make/0003-posixfcn-fcntl-gnulib-make-emulated.patch
deleted file mode 100644
index 70414c51f4..0000000000
--- a/meta/recipes-devtools/make/make/0003-posixfcn-fcntl-gnulib-make-emulated.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 3d074c8fca5fcf3e6b83d33788f35a8f1b3a44a2 Mon Sep 17 00:00:00 2001
-From: Jens Rehsack <sno@netbsd.org>
-Date: Fri, 21 Feb 2020 19:29:49 +0100
-Subject: [PATCH 3/3] posixfcn: fcntl: gnulib > make-emulated
-
-Rate the fcntl emulation from gnulib higher than the own one.
-
-Signed-off-by: Jens Rehsack <sno@netbsd.org>
----
-Upstream-Status: Pending (https://savannah.gnu.org/bugs/?57888)
-
- src/output.h              | 19 ++++++++++++++-----
- src/w32/compat/posixfcn.c |  2 ++
- 2 files changed, 16 insertions(+), 5 deletions(-)
-
-diff --git a/src/output.h b/src/output.h
-index a506505..d3ce6b7 100644
---- a/src/output.h
-+++ b/src/output.h
-@@ -67,14 +67,21 @@ void output_dump (struct output *out);
- 
- # ifdef WINDOWS32
- /* For emulations in w32/compat/posixfcn.c.  */
--#  define F_GETFD 1
--#  define F_SETLKW 2
-+#  ifndef F_GETFD
-+#   define F_GETFD 1
-+#  endif
-+#  ifndef F_SETLKW
-+#   define F_SETLKW 2
-+#  endif
- /* Implementation note: None of the values of l_type below can be zero
-    -- they are compared with a static instance of the struct, so zero
-    means unknown/invalid, see w32/compat/posixfcn.c. */
--#  define F_WRLCK 1
--#  define F_UNLCK 2
--
-+#  ifndef F_WRLCK
-+#   define F_WRLCK 1
-+#  endif
-+#  ifndef F_UNLCK
-+#   define F_UNLCK 2
-+#  endif
- struct flock
-   {
-     short l_type;
-@@ -89,7 +96,9 @@ struct flock
- typedef intptr_t sync_handle_t;
- 
- /* Public functions emulated/provided in posixfcn.c.  */
-+#  ifndef HAVE_GNULIB_FCNTL
- int fcntl (intptr_t fd, int cmd, ...);
-+#  endif
- intptr_t create_mutex (void);
- int same_stream (FILE *f1, FILE *f2);
- 
-diff --git a/src/w32/compat/posixfcn.c b/src/w32/compat/posixfcn.c
-index 975dfb7..d337b9c 100644
---- a/src/w32/compat/posixfcn.c
-+++ b/src/w32/compat/posixfcn.c
-@@ -29,6 +29,7 @@ this program.  If not, see <http://www.gnu.org/licenses/>.  */
- #ifndef NO_OUTPUT_SYNC
- /* Support for OUTPUT_SYNC and related functionality.  */
- 
-+#ifndef HAVE_GNULIB_FCNTL
- /* Emulation of fcntl that supports only F_GETFD and F_SETLKW.  */
- int
- fcntl (intptr_t fd, int cmd, ...)
-@@ -142,6 +143,7 @@ fcntl (intptr_t fd, int cmd, ...)
-         return -1;
-     }
- }
-+#endif /* GNULIB_TEST_FCNTL */
- 
- static intptr_t mutex_handle = -1;
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/make/make/sigpipe.patch b/meta/recipes-devtools/make/make/sigpipe.patch
new file mode 100644
index 0000000000..a7270fdbda
--- /dev/null
+++ b/meta/recipes-devtools/make/make/sigpipe.patch
@@ -0,0 +1,42 @@
+From 92ab2e642d2c04b3dcb5a736ae6193680bfd5f74 Mon Sep 17 00:00:00 2001
+From: Paul Smith <psmith@gnu.org>
+Date: Sun, 6 Nov 2022 15:22:02 -0500
+Subject: * src/main.c (main): [SV 63307] Handle SIGPIPE as a fatal signal
+
+Always ignoring SIGPIPE is visible to child processes.
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/make.git/commit/?id=92ab2e642d2c04b3dcb5a736ae6193680bfd5f74]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/main.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/src/main.c b/src/main.c
+index eec9365..f2caf7a 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -1182,11 +1182,6 @@ main (int argc, char **argv, char **envp)
+   /* Useful for attaching debuggers, etc.  */
+   SPIN ("main-entry");
+ 
+-  /* Don't die if our stdout sends us SIGPIPE.  */
+-#ifdef SIGPIPE
+-  bsd_signal (SIGPIPE, SIG_IGN);
+-#endif
+-
+ #ifdef HAVE_ATEXIT
+   if (ANY_SET (check_io_state (), IO_STDOUT_OK))
+     atexit (close_stdout);
+@@ -1265,6 +1260,9 @@ main (int argc, char **argv, char **envp)
+ #ifdef SIGQUIT
+   FATAL_SIG (SIGQUIT);
+ #endif
++#ifdef SIGPIPE
++  FATAL_SIG (SIGPIPE);
++#endif
+   FATAL_SIG (SIGINT);
+   FATAL_SIG (SIGTERM);
+ 
+-- 
+cgit v1.1
+
diff --git a/meta/recipes-devtools/make/make_4.3.bb b/meta/recipes-devtools/make/make_4.3.bb
deleted file mode 100644
index 9350bed05a..0000000000
--- a/meta/recipes-devtools/make/make_4.3.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-require make.inc
-
-SRC_URI += "\
-	file://0001-m4-getloadavg.m4-restrict-AIX-specific-test-on-AIX.patch \
-	file://0002-modules-fcntl-allow-being-detected-by-importing-proj.patch \
-	file://0001-src-dir.c-fix-buffer-overflow-warning.patch \
-	file://0002-w32-compat-dirent.c-follow-header.patch \
-	file://0003-posixfcn-fcntl-gnulib-make-emulated.patch \
-	file://0001-makeinst-Do-not-undef-POSIX-on-clang-arm.patch \
-"
-
-EXTRA_OECONF += "--without-guile"
-
-SRC_URI[sha256sum] = "e05fdde47c5f7ca45cb697e973894ff4f5d79e13b750ed57d7b66d8defc78e19"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/make/make_4.4.bb b/meta/recipes-devtools/make/make_4.4.bb
new file mode 100644
index 0000000000..6642c708d8
--- /dev/null
+++ b/meta/recipes-devtools/make/make_4.4.bb
@@ -0,0 +1,14 @@
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
+require make.inc
+
+SRC_URI += " \
+           file://0001-m4-getloadavg.m4-restrict-AIX-specific-test-on-AIX.patch \
+           file://sigpipe.patch \
+           "
+
+EXTRA_OECONF += "--without-guile"
+
+SRC_URI[sha256sum] = "581f4d4e872da74b3941c874215898a7d35802f03732bdccee1d4a7979105d18"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


