Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web11.10526.1592494905640895576
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hKYDZTGh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.66, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f66.google.com with SMTP id s13so4870980otd.7
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BxubsiIbHUYLdmJU5qtJAkCHaS+V5Xw7Ovplw/9nHC0=;
        b=hKYDZTGhllSp8sZiNMg1+YfnqiaCuCHO7XS4oJHOhWyCGrsLGGOtbw/rjzSV920OPq
         OesC2C9QWHjMlloex+HOXRWXbGt+tE6REHEQtYVch6LYOV8u/ULGIuzAdxFV1CGP61Lv
         vabxpWSbP7Gt2DJPDCmkCPG9gDbhODB/+M/QVZxTY8Uh9QRhiveXHrex3IGlR/Qcd8P4
         tqmytu4w1Qj7+AKtd/O1FwjTt5nGjEPFFkux5aZ2qKbdLfWnrRWFbb3yV1W3GWWr0Zig
         24DGmrWVLrtR+Z1d9fqyYmji9dIjjpbiA/1HtzhfM7p0xhwmRX0NfycGzx5EyTQwB2rM
         Yakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BxubsiIbHUYLdmJU5qtJAkCHaS+V5Xw7Ovplw/9nHC0=;
        b=D9BSgKcvp6Z6yUiGVWnzgPbTJ1yGo5aG18V+ZYrg/+vNQvZGHzV1sYG/KNZbEFQgnc
         niALJ+bQY7sy0D6PyXZXWdL5Y24RNSKo1ix+bZrqxY8alX6N4JeDtjDO2d3YntN273ep
         7K+mjDZlXje9xkcezblJZbIFzHhDzUF12sJb6HJne+frZYjGfpCU0j+AXOaGfrlbZ9VB
         YfX0IhNzGk58zU0QR8gDztqMVBFqIlbvU7OaSqGLxgLZvQxbftHZkdDvt3aPdsC1JPJK
         3bMxeagvMQMZmRHKftG1vjxskC9it9FVCJEmEM8eoWuvgAnMufLTRDx2aozjaxhWitSo
         tsCQ==
X-Gm-Message-State: AOAM531D5DmZ6MT0vkiUYZo1SHkoNyqPVfgGHfDmIW6J9oXGYOnT7qGw
	xegOQ0CB54Og6oWQBmHzJF6Crep8nfIeKw==
X-Google-Smtp-Source: ABdhPJyEDMPrnLqUbisfalJ0uV8/pyKeRZdb/Qpqpsa9DWMvmoQhJnSIeYguXIvkw0TwRCFyqaaDJQ==
X-Received: by 2002:a05:6830:1218:: with SMTP id r24mr3874067otp.247.1592494904426;
        Thu, 18 Jun 2020 08:41:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.41.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:41:43 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/21] gdbm: add patch to fix link failure against gcc 10
Date: Thu, 18 Jun 2020 05:40:33 -1000
Message-Id: <b71ea7245a3d42ba96fb5a389f85049250bbc29e.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: Richard Leitner <richard.leitner@skidata.com>

This also makes appending "-fcommon" to CFLAGS obsolete and enables
native builds with a host gcc v10.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7717b35265e6ef8ef71a4eca4074294dfcc2110c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...gdbm-fix-link-failure-against-gcc-10.patch | 47 +++++++++++++++++++
 meta/recipes-support/gdbm/gdbm_1.18.1.bb      |  3 +-
 2 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/gdbm/files/gdbm-fix-link-failure-against-gcc-10.patch

diff --git a/meta/recipes-support/gdbm/files/gdbm-fix-link-failure-against-gcc-10.patch b/meta/recipes-support/gdbm/files/gdbm-fix-link-failure-against-gcc-10.patch
new file mode 100644
index 0000000000..c1580418dc
--- /dev/null
+++ b/meta/recipes-support/gdbm/files/gdbm-fix-link-failure-against-gcc-10.patch
@@ -0,0 +1,47 @@
+From f993697af81c37df9c55e0ebedeb1b8b880506ae Mon Sep 17 00:00:00 2001
+From: Richard Leitner <richard.leitner@skidata.com>
+Date: Tue, 5 May 2020 11:59:42 +0200
+Subject: [PATCH] gdbm: fix link failure against gcc-10
+
+Copied from gentoo's solution at https://bugs.gentoo.org/show_bug.cgi?id=705898
+Original patch by Sergei Trofimovich <slyfox@gentoo.org>
+
+Original description:
+
+Before the change on gcc-10 link failed as:
+```
+  CCLD     gdbmtool
+ld: ./libgdbmapp.a(parseopt.o):(.bss+0x8): multiple definition of `parseopt_program_args';
+  gdbmtool.o:(.data.rel.local+0x260): first defined here
+ld: ./libgdbmapp.a(parseopt.o):(.bss+0x10): multiple definition of `parseopt_program_doc';
+  gdbmtool.o:(.data.rel.local+0x268): first defined here
+```
+
+gcc-10 will change the default from -fcommon to fno-common:
+    https://gcc.gnu.org/PR85678.
+
+The fix is to avoid multiple definition and rely on
+declarations only.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ src/parseopt.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/parseopt.c b/src/parseopt.c
+index 268e080..a4c8576 100644
+--- a/src/parseopt.c
++++ b/src/parseopt.c
+@@ -255,8 +255,6 @@ print_option_descr (const char *descr, size_t lmargin, size_t rmargin)
+ }
+ 
+ char *parseopt_program_name;
+-char *parseopt_program_doc;
+-char *parseopt_program_args;
+ const char *program_bug_address = "<" PACKAGE_BUGREPORT ">";
+ void (*parseopt_help_hook) (FILE *stream);
+ 
+-- 
+2.26.2
+
diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
index 5cb7c558b8..fbb1fe72d7 100644
--- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=241da1b9fe42e642cbb2c24d5e0c4d24"
 SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
            file://run-ptest \
            file://ptest.patch \
+           file://gdbm-fix-link-failure-against-gcc-10.patch \
           "
 
 SRC_URI[md5sum] = "988dc82182121c7570e0cb8b4fcd5415"
@@ -23,8 +24,6 @@ CACHED_CONFIGUREVARS += "ac_cv_lib_ndbm_main=no ac_cv_lib_dbm_main=no"
 
 BBCLASSEXTEND = "native nativesdk"
 
-CFLAGS += "-fcommon"
-
 do_install_append () {
     # Create a symlink to ndbm.h and gdbm.h in include/gdbm to let other packages to find
     # these headers
-- 
2.17.1

