Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6785AC433FE
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 06:42:05 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web08.6683.1651819322379966724
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 23:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fMsGqMDl;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id m20so12596589ejj.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 23:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WjyF0KnsGV9onrbGmtkJDVEGOFw2mAc0G5x20EIzClc=;
        b=fMsGqMDlsGO1xJoFdtVIJrosVWjaZC0dKXRYZFf3lEwDIe7r0bqsPHKuaILTP7yBl8
         G/o2XPfP+MC/7Jyje0pdCqAmNFpfRZ6SOR+li49+4wAiEg0gl+T7gSzPwO5OYlz8/WXS
         /B2MdGkQ810pjPgAtm3DxJJyNu1A6MFqNV0rqyXGVnydEOhL2GRj1o5iWqEgI9aLndr4
         0Otx65n0Ni3QGmdXirNkdPEUVUXd5dBrHDIjHoONiaLzHZmg7z/gDBTIaer4v+o7Q9ad
         M3pnU0yol2Em2uTEV792lUeC2DxHP+GXqyl74bqfvPhP2OR+z+JQkD/GiLD4kQwWWcKT
         uyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WjyF0KnsGV9onrbGmtkJDVEGOFw2mAc0G5x20EIzClc=;
        b=mnn3kcVqbte+lLA6GkQ3DqDwgNEjDwTJ0EYvisnegYuzDOJleP483ARztRfu1+1eKL
         359Pv/zr+JXqjZRIOhH0uFWPREtbqy4axPEIxhAf4fbHLRgGEPRNeyfndK24t93qsW5b
         VZcuIEc3YrcCsQ+AnNwsPFdOokal36ZP2mEyrnqwKjpxamXbPKW5MKuAx6NHmj0CYRRM
         IFjwaZhQ9mu42NKVFxe7ceiIZ3TLh97VId3ebJt0R4BbD27iFpHjNKVWFaK9wi7A3eia
         nqWc5EFsteiT28WbPp3QyZeBGaul5JlT32N04Ekr8R73CYkpwfRimg1RVG9XoAkTMv+D
         PVhw==
X-Gm-Message-State: AOAM5326hCiltIcyD70bbJffg1zt0/kWtKhM4lZJa+6t1ltFFjYfMPFP
	aRP6t7NKd/qJ8NN0H4Ejuo5QCnxxlyY=
X-Google-Smtp-Source: 
 ABdhPJxa4miAtYy9EkGAri9N6jzcFjPM11GnVx7Wx1QpVOHCFqzcE76o/7YUBlK8rJYpI1MTwInNVQ==
X-Received: by 2002:a17:907:7f1a:b0:6f4:6b52:adfd with SMTP id
 qf26-20020a1709077f1a00b006f46b52adfdmr1581212ejc.203.1651819320648;
        Thu, 05 May 2022 23:42:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 s19-20020aa7c553000000b0042617ba63c1sm1819560edr.75.2022.05.05.23.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 23:42:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] coreutils: update 9.0 -> 9.1
Date: Fri,  6 May 2022 08:41:53 +0200
Message-Id: <20220506064155.2106140-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 06:42:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165319

Drop patches:
fix-selinux-flask.patch
(upstream fixed the issue)

e8b56ebd536e82b15542a00c888109471936bfda.patch
(backport)

0001-uname-report-processor-and-hardware-correctly.patch
(upstream explicitly marks the options as non-portable and unreliable[1];
the patch is difficult to rebase, use case for oe unclear)

[1] https://git.savannah.gnu.org/gitweb/?p=coreutils.git;a=commitdiff;h=v8.24-7-g6d67649

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ort-processor-and-hardware-correctly.patch | 64 -------------
 ...6ebd536e82b15542a00c888109471936bfda.patch | 93 -------------------
 .../coreutils/fix-selinux-flask.patch         | 37 --------
 .../{coreutils_9.0.bb => coreutils_9.1.bb}    |  7 +-
 4 files changed, 2 insertions(+), 199 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils/0001-uname-report-processor-and-hardware-correctly.patch
 delete mode 100644 meta/recipes-core/coreutils/coreutils/e8b56ebd536e82b15542a00c888109471936bfda.patch
 delete mode 100644 meta/recipes-core/coreutils/coreutils/fix-selinux-flask.patch
 rename meta/recipes-core/coreutils/{coreutils_9.0.bb => coreutils_9.1.bb} (96%)

diff --git a/meta/recipes-core/coreutils/coreutils/0001-uname-report-processor-and-hardware-correctly.patch b/meta/recipes-core/coreutils/coreutils/0001-uname-report-processor-and-hardware-correctly.patch
deleted file mode 100644
index 3c43e1d5da..0000000000
--- a/meta/recipes-core/coreutils/coreutils/0001-uname-report-processor-and-hardware-correctly.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-Upstream-Status: Denied
-
-Subject: uname: report processor and hardware correctly
-
-This patch is rejected by coreutils upstream, but distros like debian and fedora
-uses this patch to make `uname -i' and `uname -p' to not report 'unknown'.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/uname.c | 18 ++++++++++++++++--
- 1 file changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/src/uname.c b/src/uname.c
-index 39bd28c..c84582d 100644
---- a/src/uname.c
-+++ b/src/uname.c
-@@ -299,13 +299,19 @@ main (int argc, char **argv)
- 
-   if (toprint & PRINT_PROCESSOR)
-     {
--      char const *element = unknown;
-+      char *element = unknown;
- #if HAVE_SYSINFO && defined SI_ARCHITECTURE
-       {
-         static char processor[257];
-         if (0 <= sysinfo (SI_ARCHITECTURE, processor, sizeof processor))
-           element = processor;
-       }
-+#else
-+      {
-+	static struct utsname u;
-+	uname(&u);
-+	element = u.machine;
-+      }
- #endif
- #ifdef UNAME_PROCESSOR
-       if (element == unknown)
-@@ -343,7 +349,7 @@ main (int argc, char **argv)
- 
-   if (toprint & PRINT_HARDWARE_PLATFORM)
-     {
--      char const *element = unknown;
-+      char *element = unknown;
- #if HAVE_SYSINFO && defined SI_PLATFORM
-       {
-         static char hardware_platform[257];
-@@ -361,6 +367,14 @@ main (int argc, char **argv)
-           if (sysctl (mib, 2, hardware_platform, &s, 0, 0) >= 0)
-             element = hardware_platform;
-         }
-+#else
-+      {
-+	static struct utsname u;
-+	uname(&u);
-+	element = u.machine;
-+	if(strlen(element)==4 && element[0]=='i' && element[2]=='8' && element[3]=='6')
-+	  element[1]='3';
-+      }
- #endif
-       if (! (toprint == UINT_MAX && element == unknown))
-         print_element (element);
--- 
-1.9.1
-
diff --git a/meta/recipes-core/coreutils/coreutils/e8b56ebd536e82b15542a00c888109471936bfda.patch b/meta/recipes-core/coreutils/coreutils/e8b56ebd536e82b15542a00c888109471936bfda.patch
deleted file mode 100644
index d69ee95e4a..0000000000
--- a/meta/recipes-core/coreutils/coreutils/e8b56ebd536e82b15542a00c888109471936bfda.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From e8b56ebd536e82b15542a00c888109471936bfda Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
-Date: Fri, 24 Sep 2021 20:57:41 +0100
-Subject: [PATCH] chmod: fix exit status when ignoring symlinks
-
-* src/chmod.c: Reorder enum so CH_NOT_APPLIED
-can be treated as a non error.
-* tests/chmod/ignore-symlink.sh: A new test.
-* tests/local.mk: Reference the new test.
-* NEWS: Mention the bug fix.
-Fixes https://bugs.gnu.org/50784
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/chmod.c                   |  4 ++--
- tests/chmod/ignore-symlink.sh | 31 +++++++++++++++++++++++++++++++
- tests/local.mk                |  1 +
- 4 files changed, 40 insertions(+), 2 deletions(-)
- create mode 100755 tests/chmod/ignore-symlink.sh
-
-diff --git a/src/chmod.c b/src/chmod.c
-index 37b04f500..57ac47f33 100644
---- a/src/chmod.c
-+++ b/src/chmod.c
-@@ -44,8 +44,8 @@ struct change_status
-   enum
-     {
-       CH_NO_STAT,
--      CH_NOT_APPLIED,
-       CH_FAILED,
-+      CH_NOT_APPLIED,
-       CH_NO_CHANGE_REQUESTED,
-       CH_SUCCEEDED
-     }
-@@ -322,7 +322,7 @@ process_file (FTS *fts, FTSENT *ent)
-   if ( ! recurse)
-     fts_set (fts, ent, FTS_SKIP);
- 
--  return CH_NO_CHANGE_REQUESTED <= ch.status;
-+  return CH_NOT_APPLIED <= ch.status;
- }
- 
- /* Recursively change the modes of the specified FILES (the last entry
-diff --git a/tests/chmod/ignore-symlink.sh b/tests/chmod/ignore-symlink.sh
-new file mode 100755
-index 000000000..5ce3de816
---- /dev/null
-+++ b/tests/chmod/ignore-symlink.sh
-@@ -0,0 +1,31 @@
-+#!/bin/sh
-+# Test for proper exit code of chmod on a processed symlink.
-+
-+# Copyright (C) 2021 Free Software Foundation, Inc.
-+
-+# This program is free software: you can redistribute it and/or modify
-+# it under the terms of the GNU General Public License as published by
-+# the Free Software Foundation, either version 3 of the License, or
-+# (at your option) any later version.
-+
-+# This program is distributed in the hope that it will be useful,
-+# but WITHOUT ANY WARRANTY; without even the implied warranty of
-+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+# GNU General Public License for more details.
-+
-+# You should have received a copy of the GNU General Public License
-+# along with this program.  If not, see <https://www.gnu.org/licenses/>.
-+
-+. "${srcdir=.}/tests/init.sh"; path_prepend_ ./src
-+print_ver_ chmod
-+
-+mkdir dir || framework_failure_
-+touch dir/f || framework_failure_
-+ln -s f dir/l || framework_failure_
-+
-+# This operation ignores symlinks but should succeed.
-+chmod u+w -R dir 2> out || fail=1
-+
-+compare /dev/null out || fail=1
-+
-+Exit $fail
-diff --git a/tests/local.mk b/tests/local.mk
-index 228d0e368..b5b893fb7 100644
---- a/tests/local.mk
-+++ b/tests/local.mk
-@@ -456,6 +456,7 @@ all_tests =					\
-   tests/chmod/c-option.sh			\
-   tests/chmod/equal-x.sh			\
-   tests/chmod/equals.sh				\
-+  tests/chmod/ignore-symlink.sh			\
-   tests/chmod/inaccessible.sh			\
-   tests/chmod/octal.sh				\
-   tests/chmod/setgid.sh				\
diff --git a/meta/recipes-core/coreutils/coreutils/fix-selinux-flask.patch b/meta/recipes-core/coreutils/coreutils/fix-selinux-flask.patch
deleted file mode 100644
index 4f126ad67c..0000000000
--- a/meta/recipes-core/coreutils/coreutils/fix-selinux-flask.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b04363018b4b9b45fdf23384f30d02caa5564602 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 16 Sep 2014 01:59:08 -0700
-Subject: [PATCH] gnulib-comp.m4: selinux/flask.h should respect to
- with_selinux
-
-Fixed when build with meta-selinux even when --without-selinux:
-runcon.c:49:28: fatal error: selinux/flask.h: No such file or directory
- # include <selinux/flask.h>
-                            ^
-compilation terminated.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
----
- m4/gnulib-comp.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/m4/gnulib-comp.m4 b/m4/gnulib-comp.m4
-index 3857233..c01fb30 100644
---- a/m4/gnulib-comp.m4
-+++ b/m4/gnulib-comp.m4
-@@ -1953,11 +1953,11 @@ AC_DEFUN([gl_INIT],
-     AC_LIBOBJ([select])
-   fi
-   gl_SYS_SELECT_MODULE_INDICATOR([select])
--  AC_CHECK_HEADERS([selinux/flask.h])
-   gl_HEADERS_SELINUX_SELINUX_H
-   gl_HEADERS_SELINUX_CONTEXT_H
-   gl_HEADERS_SELINUX_LABEL_H
-   if test "$with_selinux" != no && test "$ac_cv_header_selinux_selinux_h" = yes; then
-+    AC_CHECK_HEADERS([selinux/flask.h])
-     AC_LIBOBJ([getfilecon])
-   fi
-   gl_SERVENT
diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-core/coreutils/coreutils_9.1.bb
similarity index 96%
rename from meta/recipes-core/coreutils/coreutils_9.0.bb
rename to meta/recipes-core/coreutils/coreutils_9.1.bb
index e4a948c7e5..d57e147a7e 100644
--- a/meta/recipes-core/coreutils/coreutils_9.0.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://src/ls.c;beginline=1;endline=15;md5=3b8fbaee597c8a9bb88d30840d53048c \
+                    file://src/ls.c;beginline=1;endline=15;md5=1fe89f62614b5e1f5475ec04d5899bc1 \
                     "
 DEPENDS = "gmp libcap"
 DEPENDS:class-native = ""
@@ -15,14 +15,11 @@ inherit autotools gettext texinfo
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
-           file://fix-selinux-flask.patch \
-           file://0001-uname-report-processor-and-hardware-correctly.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
-           file://e8b56ebd536e82b15542a00c888109471936bfda.patch \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "ce30acdf4a41bc5bb30dd955e9eaa75fa216b4e3deb08889ed32433c7b3b97ce"
+SRC_URI[sha256sum] = "61a1f410d78ba7e7f37a5a4f50e6d1320aca33375484a3255eddf17a38580423"
 
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
 # runcon is not really a sandbox command, use `runcon ... setsid ...` to avoid this particular issue.
-- 
2.30.2


