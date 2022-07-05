Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FA1C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 14:23:49 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web08.84652.1657031019413102954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 07:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YIROwpYe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.177,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-qt1-f177.google.com with SMTP id bs20so13847789qtb.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 07:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ikypYSaYaXgcnYytKBXdvXwnN3t0EMArRjbWAFK050s=;
        b=YIROwpYeud/sAgGFbRiwiSatlbe8Du2Ii7Dj+Ck0zhog9xRr58jYu7UYVSuDgRmh1N
         UmDqLX46GZCkZHabgqw/vS+s5Z1Jvth1yX7h6CMwZKNWUh2GRc7oPPpcNZZuGhow/Ay/
         VoMBlzDpiqwGmlc2Y6x4mmedX3KX0+hicJJC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ikypYSaYaXgcnYytKBXdvXwnN3t0EMArRjbWAFK050s=;
        b=qScIKVptGtgy2PW+3FMojd3fPkPzxphUObX65Z/a472bufgxowhiJsIO4zDxIttgTX
         JDAqjE3pOnaxjfvyOnsDj4a++L3N9KS3RqAjhbIJhnoGJP4CHNfri1MJPw/qofcVQIBW
         00XoGo/Hlhl8NSMMuMWR3gyNWNkrk1NTBTt0Kj4MLNd5hIAWtLgRNZXzyhGF+o86RH6U
         IRB1FtofOZ0qj3djh5A5T9LDkf9VSEdLBibqtQ24fR9PSrqf7KC0FB1/NlUGV0lMQ9OB
         noDxc2yqnVKhcCDOXAzOPkoad/4Q9w0D0ZSHUacc02p+RO2A+07TiQfAc+Ik19/zwHtv
         Q4wA==
X-Gm-Message-State: AJIora+LZUgyxWuGVaAfZZLqHLVDItdkGb/Yg797uuUHrnWKCyudGZpf
	AilcKDbBW9kp8G8U+JuZCX+eaXUtui2rYw==
X-Google-Smtp-Source: 
 AGRyM1sO74XnqwzU9yr7wbJ0XBVlub/4z1xCNz880jLQT+dinR4vHtr2u2f3WVPl/nnebI/G7005PQ==
X-Received: by 2002:ac8:5783:0:b0:31a:fb7a:db5d with SMTP id
 v3-20020ac85783000000b0031afb7adb5dmr27735912qta.53.1657031016394;
        Tue, 05 Jul 2022 07:23:36 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7dad:6fff:75bd:1ad8])
        by smtp.gmail.com with ESMTPSA id
 196-20020a3704cd000000b006a6ae9150fesm26658103qke.41.2022.07.05.07.23.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 07:23:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gperf: Switch to upstream patch
Date: Tue,  5 Jul 2022 15:23:33 +0100
Message-Id: <20220705142333.961221-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 14:23:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167658

Upstream merged a patch to handle the reproducibility issue, switch to
their patch which is functionally equivalent.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...c6e57a308a05889c80c048dbc58bdc378dcb.patch | 203 ++++++++++++++++++
 .../gperf/gperf/reproducibility.patch         |  26 ---
 meta/recipes-extended/gperf/gperf_3.1.bb      |   2 +-
 3 files changed, 204 insertions(+), 27 deletions(-)
 create mode 100644 meta/recipes-extended/gperf/gperf/1862c6e57a308a05889c80c048dbc58bdc378dcb.patch
 delete mode 100644 meta/recipes-extended/gperf/gperf/reproducibility.patch

diff --git a/meta/recipes-extended/gperf/gperf/1862c6e57a308a05889c80c048dbc58bdc378dcb.patch b/meta/recipes-extended/gperf/gperf/1862c6e57a308a05889c80c048dbc58bdc378dcb.patch
new file mode 100644
index 00000000000..6d1c1ad5d51
--- /dev/null
+++ b/meta/recipes-extended/gperf/gperf/1862c6e57a308a05889c80c048dbc58bdc378dcb.patch
@@ -0,0 +1,203 @@
+From 1862c6e57a308a05889c80c048dbc58bdc378dcb Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Tue, 5 Jul 2022 07:51:46 +0200
+Subject: [PATCH] Add support for reproducible builds.
+
+Suggested by Richard Purdie <richard.purdie@linuxfoundation.org> in
+<https://lists.gnu.org/archive/html/bug-gperf/2022-07/msg00000.html>.
+
+* autogen.sh: Import also lib/filename.h.
+* Makefile.in (IMPORTED_FILES): Add lib/filename.h.
+* src/options.cc: Include filename.h.
+(Options::print_options): Print only the base name of the program name.
+* tests/*.exp: Update.
+
+Upstream-Status: Backport
+
+---
+ ChangeLog            | 11 +++++++++++
+ Makefile.in          |  3 ++-
+ autogen.sh           |  5 +++--
+ lib/.gitignore       |  3 +++
+ src/options.cc       | 11 +++++++++++
+ tests/c-parse.exp    |  2 +-
+ tests/charsets.exp   |  2 +-
+ tests/chill.exp      |  2 +-
+ tests/cplusplus.exp  |  2 +-
+ tests/gpc.exp        |  2 +-
+ tests/incomplete.exp |  2 +-
+ tests/java.exp       |  2 +-
+ tests/languages.exp  |  2 +-
+ tests/modula2.exp    |  2 +-
+ tests/objc.exp       |  2 +-
+ tests/permut2.exp    |  2 +-
+ tests/permut3.exp    |  2 +-
+ tests/permutc2.exp   |  2 +-
+ tests/test-4.exp     |  2 +-
+ 19 files changed, 44 insertions(+), 17 deletions(-)
+
+Index: gperf-3.1/ChangeLog
+===================================================================
+--- gperf-3.1.orig/ChangeLog
++++ gperf-3.1/ChangeLog
+@@ -1,3 +1,14 @@
++2022-07-05  Bruno Haible  <bruno@clisp.org>
++
++	Add support for reproducible builds.
++	Suggested by Richard Purdie <richard.purdie@linuxfoundation.org> in
++	<https://lists.gnu.org/archive/html/bug-gperf/2022-07/msg00000.html>.
++	* autogen.sh: Import also lib/filename.h.
++	* Makefile.in (IMPORTED_FILES): Add lib/filename.h.
++	* src/options.cc: Include filename.h.
++	(Options::print_options): Print only the base name of the program name.
++	* tests/*.exp: Update.
++
+ 2017-01-02  Marcel Schaible <marcel.schaible@studium.fernuni-hagen.de>
+ 	
+ 	* gperf-3.1 released.
+Index: gperf-3.1/src/options.cc
+===================================================================
+--- gperf-3.1.orig/src/options.cc
++++ gperf-3.1/src/options.cc
+@@ -26,6 +26,7 @@
+ #include <string.h> /* declares strcmp() */
+ #include <ctype.h>  /* declares isdigit() */
+ #include <limits.h> /* defines CHAR_MAX */
++#include "filename.h"
+ #include "getopt.h"
+ #include "version.h"
+ 
+@@ -280,6 +281,16 @@ Options::print_options () const
+     {
+       const char *arg = _argument_vector[i];
+ 
++      if (i == 0)
++        {
++          /* _argument_vector[0] is the program name.  Print only its base name.
++             This is useful for reproducible builds.  */
++          const char *p = arg + strlen (arg);
++          while (p > arg && ! ISSLASH (p[-1]))
++            p--;
++          arg = p;
++        }
++
+       /* Escape arg if it contains shell metacharacters.  */
+       if (*arg == '-')
+         {
+Index: gperf-3.1/lib/filename.h
+===================================================================
+--- /dev/null
++++ gperf-3.1/lib/filename.h
+@@ -0,0 +1,112 @@
++/* Basic filename support macros.
++   Copyright (C) 2001-2022 Free Software Foundation, Inc.
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
++   <https://www.gnu.org/licenses/>.  */
++
++/* From Paul Eggert and Jim Meyering.  */
++
++#ifndef _FILENAME_H
++#define _FILENAME_H
++
++#include <string.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++
++/* Filename support.
++   ISSLASH(C)                  tests whether C is a directory separator
++                               character.
++   HAS_DEVICE(Filename)        tests whether Filename contains a device
++                               specification.
++   FILE_SYSTEM_PREFIX_LEN(Filename)  length of the device specification
++                                     at the beginning of Filename,
++                                     index of the part consisting of
++                                     alternating components and slashes.
++   FILE_SYSTEM_DRIVE_PREFIX_CAN_BE_RELATIVE
++                               1 when a non-empty device specification
++                               can be followed by an empty or relative
++                               part,
++                               0 when a non-empty device specification
++                               must be followed by a slash,
++                               0 when device specification don't exist.
++   IS_ABSOLUTE_FILE_NAME(Filename)
++                               tests whether Filename is independent of
++                               any notion of "current directory".
++   IS_RELATIVE_FILE_NAME(Filename)
++                               tests whether Filename may be concatenated
++                               to a directory filename.
++   Note: On native Windows, OS/2, DOS, "c:" is neither an absolute nor a
++   relative file name!
++   IS_FILE_NAME_WITH_DIR(Filename)  tests whether Filename contains a device
++                                    or directory specification.
++ */
++#if defined _WIN32 || defined __CYGWIN__ \
++    || defined __EMX__ || defined __MSDOS__ || defined __DJGPP__
++  /* Native Windows, Cygwin, OS/2, DOS */
++# define ISSLASH(C) ((C) == '/' || (C) == '\\')
++  /* Internal macro: Tests whether a character is a drive letter.  */
++# define _IS_DRIVE_LETTER(C) \
++    (((C) >= 'A' && (C) <= 'Z') || ((C) >= 'a' && (C) <= 'z'))
++  /* Help the compiler optimizing it.  This assumes ASCII.  */
++# undef _IS_DRIVE_LETTER
++# define _IS_DRIVE_LETTER(C) \
++    (((unsigned int) (C) | ('a' - 'A')) - 'a' <= 'z' - 'a')
++# define HAS_DEVICE(Filename) \
++    (_IS_DRIVE_LETTER ((Filename)[0]) && (Filename)[1] == ':')
++# define FILE_SYSTEM_PREFIX_LEN(Filename) (HAS_DEVICE (Filename) ? 2 : 0)
++# ifdef __CYGWIN__
++#  define FILE_SYSTEM_DRIVE_PREFIX_CAN_BE_RELATIVE 0
++# else
++   /* On native Windows, OS/2, DOS, the system has the notion of a
++      "current directory" on each drive.  */
++#  define FILE_SYSTEM_DRIVE_PREFIX_CAN_BE_RELATIVE 1
++# endif
++# if FILE_SYSTEM_DRIVE_PREFIX_CAN_BE_RELATIVE
++#  define IS_ABSOLUTE_FILE_NAME(Filename) \
++     ISSLASH ((Filename)[FILE_SYSTEM_PREFIX_LEN (Filename)])
++# else
++#  define IS_ABSOLUTE_FILE_NAME(Filename) \
++     (ISSLASH ((Filename)[0]) || HAS_DEVICE (Filename))
++# endif
++# define IS_RELATIVE_FILE_NAME(Filename) \
++    (! (ISSLASH ((Filename)[0]) || HAS_DEVICE (Filename)))
++# define IS_FILE_NAME_WITH_DIR(Filename) \
++    (strchr ((Filename), '/') != NULL || strchr ((Filename), '\\') != NULL \
++     || HAS_DEVICE (Filename))
++#else
++  /* Unix */
++# define ISSLASH(C) ((C) == '/')
++# define HAS_DEVICE(Filename) ((void) (Filename), 0)
++# define FILE_SYSTEM_PREFIX_LEN(Filename) ((void) (Filename), 0)
++# define FILE_SYSTEM_DRIVE_PREFIX_CAN_BE_RELATIVE 0
++# define IS_ABSOLUTE_FILE_NAME(Filename) ISSLASH ((Filename)[0])
++# define IS_RELATIVE_FILE_NAME(Filename) (! ISSLASH ((Filename)[0]))
++# define IS_FILE_NAME_WITH_DIR(Filename) (strchr ((Filename), '/') != NULL)
++#endif
++
++/* Deprecated macros.  For backward compatibility with old users of the
++   'filename' module.  */
++#define IS_ABSOLUTE_PATH IS_ABSOLUTE_FILE_NAME
++#define IS_PATH_WITH_DIR IS_FILE_NAME_WITH_DIR
++
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* _FILENAME_H */
diff --git a/meta/recipes-extended/gperf/gperf/reproducibility.patch b/meta/recipes-extended/gperf/gperf/reproducibility.patch
deleted file mode 100644
index 9f80828dbd7..00000000000
--- a/meta/recipes-extended/gperf/gperf/reproducibility.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-By default gperf puts a header into generated files with the full path to
-the tool along with the commandline used. This patch removes the path to
-the binary, allowing reproducible source files (which can be included in
-debug source packages).
-
-Upstream-Status: Pending
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: gperf-3.1/src/options.cc
-===================================================================
---- gperf-3.1.orig/src/options.cc
-+++ gperf-3.1/src/options.cc
-@@ -280,6 +280,13 @@ Options::print_options () const
-     {
-       const char *arg = _argument_vector[i];
- 
-+      if (i == 0) {
-+          const char *shortarg = strrchr(arg, '/');
-+          if (shortarg) {
-+              arg = shortarg + 1;
-+          }
-+      }
-+
-       /* Escape arg if it contains shell metacharacters.  */
-       if (*arg == '-')
-         {
diff --git a/meta/recipes-extended/gperf/gperf_3.1.bb b/meta/recipes-extended/gperf/gperf_3.1.bb
index 3564ac0805b..c9f09c7931b 100644
--- a/meta/recipes-extended/gperf/gperf_3.1.bb
+++ b/meta/recipes-extended/gperf/gperf_3.1.bb
@@ -9,7 +9,7 @@ SRC_URI  = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
 SRC_URI[md5sum] = "9e251c0a618ad0824b51117d5d9db87e"
 SRC_URI[sha256sum] = "588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2"
 
-SRC_URI:append = " file://reproducibility.patch"
+SRC_URI += "file://1862c6e57a308a05889c80c048dbc58bdc378dcb.patch"
 
 inherit autotools
 
-- 
2.34.1


