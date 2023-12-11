Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BECC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 03:51:30 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.955.1702266680246080506
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 19:51:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ehE8mMMR;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6d9dbe224bbso2882877a34.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 19:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702266679; x=1702871479; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yWniLj4bNiDXPu9oxLPwBxJniBfKiou6qB5jro6Cp/U=;
        b=ehE8mMMRCgkUwiVQXruFcJI37cGE+O8Ulhii8PW9PniTzm+Tb3NLkRSwHHdJa9fXVp
         gV+5tRUbL9hfYW0VpHlQeXEtVgsRTOeWKG/Dqzu9y2Ai0BkETSERFmAi09dSNd8VGm1S
         3Pg3QvRXV3cRp9ATIazdkXlt2QHPyVWaHAr3AKaMxzwhlCVQ3NfqKNXGDYvGptxJMibw
         EQVGtp7AVlL9wSN4r/1AQwZGmAtgmI4sqcQLDTqsXSguJ0VW3mjZzFvw0vJTbUOcLXHp
         ConWuuzxHunDkhmsznTMD7HTJHP9zUzlTIgvWI/cd8R5yh4aqJa+zVSCG5aIkBaEUsIU
         +dVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702266679; x=1702871479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWniLj4bNiDXPu9oxLPwBxJniBfKiou6qB5jro6Cp/U=;
        b=jW68lLXOOAjHuoJbkkMWne2as0yWAvoLG3DkOTsN2MkBM11QSr9dWheo0gDBhsuyNc
         C6YFiquR0QbgqAa7+2KaN3//Th//pbM9klJS7baSB5Z0AnQh88yLvzV3QAXuOwECOi6y
         wIZzmZn9b4CkGQz6Oy8mwUjMDUiJQiUgG2Lz6RLcuttLUVMVgLeRDY6daSr+Ol4j4Sha
         tmr/58ZarGvbBMD8BnkLheISbszwXlPRf32GeYWq8B8foQ6NHfcC3QfSI6kZ+MvExvVt
         pkITu7rFQkeLma8KM+N+7XFoQk4XYWoHpUmfDr7kp/OYgqKePU9WS1HkW1Q5TQlj08OS
         BFag==
X-Gm-Message-State: AOJu0YwLuz1cGnE8WMcoPlfMMXvOwP3DwytxAtf9ppNym7x3Ncv2YmOu
	nOWUwZNBeCXlR/WkRoUdQcjNy8WQx+E=
X-Google-Smtp-Source: AGHT+IHwABl4tcEMl+ym70bo7b5WfIzDm39yaje/0oVOIvEn5PIzyWEp/oB7/IzhgXRnZB2zRhIytA==
X-Received: by 2002:a05:6808:14d5:b0:3b9:dbc5:2fda with SMTP id f21-20020a05680814d500b003b9dbc52fdamr5562034oiw.49.1702266679071;
        Sun, 10 Dec 2023 19:51:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:3d00::76f0])
        by smtp.gmail.com with ESMTPSA id a4-20020aa78644000000b006ce36ffb0cfsm5205105pfo.33.2023.12.10.19.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 19:51:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] opkg: Use own version of portable basename function
Date: Sun, 10 Dec 2023 19:51:16 -0800
Message-ID: <20231211035116.2278394-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 03:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192142

Fixes build with upcoming musl release.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use the v2 of upstream patch

 ...Use-libgen.h-to-provide-basename-API.patch | 62 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.6.2.bb      |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-libopkg-Use-libgen.h-to-provide-basename-API.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0001-libopkg-Use-libgen.h-to-provide-basename-API.patch b/meta/recipes-devtools/opkg/opkg/0001-libopkg-Use-libgen.h-to-provide-basename-API.patch
new file mode 100644
index 00000000000..cff091fabf9
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-libopkg-Use-libgen.h-to-provide-basename-API.patch
@@ -0,0 +1,62 @@
+From 7a1c13a48cf020c40dda1721d5c2ffd95e8e669a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 10 Dec 2023 19:39:29 -0800
+Subject: [PATCH v2] libopkg: Use libgen.h to provide basename API
+
+Also ensure that copy of filename is passed into archive_entry_set_pathname
+so it can be operated upon by posix basename which expect non-const
+character pointer as input.
+
+This became evident with latest musl where basename declaration was
+dropped from string.h [1]
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Submitted [https://lists.yoctoproject.org/g/opkg/message/12]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+v2: Do not override basename wholesale
+
+ libopkg/opkg_archive.c | 6 ++++--
+ libopkg/opkg_remove.c  | 1 +
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
+index 03a4afb..b099f5b 100644
+--- a/libopkg/opkg_archive.c
++++ b/libopkg/opkg_archive.c
+@@ -20,6 +20,7 @@
+ 
+ #include <archive.h>
+ #include <archive_entry.h>
++#include <libgen.h>
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -797,8 +798,9 @@ int gz_write_archive(const char *filename, const char *gz_filename)
+     }
+ 
+     /* Remove path hierarchy, as we are only compressing a single file */
+-    archive_entry_set_pathname(entry, basename(filename));
+-
++    char* tmp = xstrdup(filename);
++    archive_entry_set_pathname(entry, basename(tmp));
++    free(tmp);
+     r = archive_write_header(a, entry);
+     if (r != ARCHIVE_OK) {
+         opkg_msg(ERROR, "Failed to create compressed file: '%s' : %s (errno=%d)",
+diff --git a/libopkg/opkg_remove.c b/libopkg/opkg_remove.c
+index 889c672..5254388 100644
+--- a/libopkg/opkg_remove.c
++++ b/libopkg/opkg_remove.c
+@@ -20,6 +20,7 @@
+ 
+ #include "config.h"
+ 
++#include <libgen.h>
+ #include <stdio.h>
+ #include <glob.h>
+ #include <unistd.h>
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.2.bb b/meta/recipes-devtools/opkg/opkg_0.6.2.bb
index 46be137354c..b2e675ae48b 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.2.bb
@@ -15,6 +15,7 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://0001-libopkg-Use-libgen.h-to-provide-basename-API.patch \
            file://run-ptest \
            "
 
-- 
2.43.0


