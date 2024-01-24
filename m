Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC97C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:01:28 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.23130.1706104888342497267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 06:01:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RtEghuyy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d72f71f222so21875135ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 06:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706104887; x=1706709687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fvs0m2jiFAiWKq16paLPtlduAYBEa/U3xCCgDmFZvU=;
        b=RtEghuyy+JBUc+NkauZoBSBx8IBbXBGTVx75sGI0AuNQNsySBWRzz1ocArK4YBO18H
         0Gt6GSzshM8H2Qcu4De3D8ZjER/oiqIlFD1jWcPNxxEHP6g4JpbDGxOdXqp+XKffAA+7
         uAmTZlRSecRr90hgxomLTbaY8LzNT6V9EEOqD66gggmRd0xpwfA/9yRYYZ6mA35kOwF3
         UvXJEQ/kgNY0ZsdksXA4nSlBx3WnDNTxYYbQsM8vadjOtGDniPIZAhq8M2PJNjtcMaiJ
         nmn1HBt7y7ivn/zjsiIjCPaKOomG9nvOSHzsz9DZdUZmaquS5OWGL44vxvr3jUoB6IbS
         2Rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706104887; x=1706709687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fvs0m2jiFAiWKq16paLPtlduAYBEa/U3xCCgDmFZvU=;
        b=N9c5e5crZL7Fu9WOZgKIK19jn5ooN0XdzCoTPAJFhMDxGPE+JI8pn3tfFKM1iYAHDO
         G2DE5KODDbq/cQncWel4nLGTKe3iEpOT5sw+kPV/V+MjqpMy72MQOcNOK9Y3ybFC7T3w
         UixUC+2F9Vvf4RD43+VkzewoxPieddnp3OEV4lGDGLK5cfMcqDMIQs1SziB6E7U1FiIU
         egeePUoqWmc4f2sQiI7AYUFjQ0cyvXLUgtiyv/s8BmWcnaYCj+eOdFrG6AS1VKleW9ZH
         1ZJd4kXmwOHSpdrFlHYjRbVzmKHJY4YAD6lgwDib7kWvxxQoBp4SsMl+i0KjNK6QZuur
         Jjeg==
X-Gm-Message-State: AOJu0Ywocq050VCdKqzW1NWrdpk4k7Yxfw0IXP8qO642P9zm4PKO6b41
	vF09nqV4qr1E7c+7Q2mYX13e5fRZk7N6JF7FUl1KcrRarJXaqrCemoP8WQf030IRofG5dNZaQoJ
	F3RM=
X-Google-Smtp-Source: AGHT+IGhY7kPyIXhuzvjXRZneLgdk6rX/+a7PsngVrIo491oVvxRrPLceJq+MeoL8pE7o/JHlGo9vw==
X-Received: by 2002:a17:90b:1e02:b0:28e:7e95:b8f2 with SMTP id pg2-20020a17090b1e0200b0028e7e95b8f2mr4031104pjb.93.1706104886968;
        Wed, 24 Jan 2024 06:01:26 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 8-20020a631648000000b005ccf10e73b8sm11535739pgw.91.2024.01.24.06.01.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 06:01:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 02/12] nfs-utils: Upgrade 2.6.3 -> 2.6.4
Date: Wed, 24 Jan 2024 04:01:05 -1000
Message-Id: <fcd5623dbeb302b3f2e9043fd66cc000f81d206b.1706104658.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706104658.git.steve@sakoman.com>
References: <cover.1706104658.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 14:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194278

From: Robert Yang <liezhi.yang@windriver.com>

* Remove backported patch 0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch.
* Add 0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch to fix build with musl

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit ff416e9fd6a1a65cf59ecd662613581b6190e05e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...event-and-libsqlite3-checked-when-nf.patch | 80 -------------------
 ...nclude-unistd.h-to-compile-with-musl.patch | 34 ++++++++
 ...{nfs-utils_2.6.3.bb => nfs-utils_2.6.4.bb} |  8 +-
 3 files changed, 38 insertions(+), 84 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.6.3.bb => nfs-utils_2.6.4.bb} (94%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
deleted file mode 100644
index 5afc714f19..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From b62a3fe424026b73ec6b1934483b16863c7dff23 Mon Sep 17 00:00:00 2001
-From: Wiktor Jaskulski <wjaskulski@adva.com>
-Date: Thu, 11 May 2023 15:28:23 -0400
-Subject: [PATCH] configure.ac: libevent and libsqlite3 checked when nfsv4 is
- disabled
-
-Upstream-Status: Backport
-(http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=bc4a5deef9f820c55fdac3c0070364c17cd91cca)
-
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- configure.ac | 38 +++++++++++++++-----------------------
- 1 file changed, 15 insertions(+), 23 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4ade528d..519cacbf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -335,42 +335,34 @@ AC_CHECK_HEADER(rpc/rpc.h, ,
-                 AC_MSG_ERROR([Header file rpc/rpc.h not found - maybe try building with --enable-tirpc]))
- CPPFLAGS="${nfsutils_save_CPPFLAGS}"
- 
-+dnl check for libevent libraries and headers
-+AC_LIBEVENT
-+
-+dnl Check for sqlite3
-+AC_SQLITE3_VERS
-+
-+case $libsqlite3_cv_is_recent in
-+yes) ;;
-+unknown)
-+   dnl do not fail when cross-compiling
-+   AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
-+*)
-+   AC_MSG_ERROR([nfsdcld requires sqlite-devel]) ;;
-+esac
-+
- if test "$enable_nfsv4" = yes; then
--  dnl check for libevent libraries and headers
--  AC_LIBEVENT
- 
-   dnl check for the keyutils libraries and headers
-   AC_KEYUTILS
- 
--  dnl Check for sqlite3
--  AC_SQLITE3_VERS
--
-   if test "$enable_nfsdcld" = "yes"; then
- 	AC_CHECK_HEADERS([libgen.h sys/inotify.h], ,
- 		AC_MSG_ERROR([Cannot find header needed for nfsdcld]))
--
--    case $libsqlite3_cv_is_recent in
--    yes) ;;
--    unknown)
--      dnl do not fail when cross-compiling
--      AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
--    *)
--      AC_MSG_ERROR([nfsdcld requires sqlite-devel]) ;;
--    esac
-   fi
- 
-   if test "$enable_nfsdcltrack" = "yes"; then
- 	AC_CHECK_HEADERS([libgen.h sys/inotify.h], ,
- 		AC_MSG_ERROR([Cannot find header needed for nfsdcltrack]))
--
--    case $libsqlite3_cv_is_recent in
--    yes) ;;
--    unknown)
--      dnl do not fail when cross-compiling
--      AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
--    *)
--      AC_MSG_ERROR([nfsdcltrack requires sqlite-devel]) ;;
--    esac
-   fi
- 
- else
--- 
-2.41.0
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
new file mode 100644
index 0000000000..8607b64cb1
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
@@ -0,0 +1,34 @@
+From 45597a58e98f351b18db8444292b1cf6dd0cd810 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sat, 9 Dec 2023 23:34:08 -0800
+Subject: [PATCH] reexport.h: Include unistd.h to compile with musl
+
+Fixed error when compile with musl
+reexport.c: In function 'reexpdb_init':
+reexport.c:62:17: error: implicit declaration of function 'sleep' [-Werror=implicit-function-declaration]
+   62 |                 sleep(1);
+
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ support/reexport/reexport.h | 1 +
+ 1 files changed, 1 insertions(+)
+
+diff --git a/support/reexport/reexport.h b/support/reexport/reexport.h
+index 85fd59c..02f8684 100644
+--- a/support/reexport/reexport.h
++++ b/support/reexport/reexport.h
+@@ -1,6 +1,8 @@
+ #ifndef REEXPORT_H
+ #define REEXPORT_H
+ 
++#include <unistd.h>
++
+ #include "nfslib.h"
+ 
+ enum {
+-- 
+2.42.0
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
similarity index 94%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
index 35cf6af6d4..2f2644f9a8 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
@@ -30,11 +30,11 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://bugfix-adjust-statd-service-name.patch \
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
-           file://0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch \
-	   file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
-	   file://0001-tools-locktest-Use-intmax_t-to-print-off_t.patch \
+           file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
+           file://0001-tools-locktest-Use-intmax_t-to-print-off_t.patch \
+           file://0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch \
            "
-SRC_URI[sha256sum] = "38d89e853a71d3c560ff026af3d969d75e24f782ff68324e76261fe0344459e1"
+SRC_URI[sha256sum] = "01b3b0fb9c7d0bbabf5114c736542030748c788ec2fd9734744201e9b0a1119d"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.34.1


