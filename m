Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.12325.1613499694523824504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 10:21:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PSTxJBnY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id w4so9846358wmi.4
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 10:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=98Hm5So4pReWFEAgf5Q4mmW81bx6/lvkHPWreX0H7aw=;
        b=PSTxJBnYHBIkV4x7AUhqmJ/USCbIfpG/xPnrEvaomc2GjriOEbZzdsRMzL5JNVQmHb
         YDgPnzkN1yT1noxd9LAT6DJca3UfWb6JjMvwDPLvxhFxwS3rvOTkUKbnUH6ae5IYrIsF
         f5DW5MFY/3ixHtSAmgRAoh2YBhJLMY8Jp5/Vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=98Hm5So4pReWFEAgf5Q4mmW81bx6/lvkHPWreX0H7aw=;
        b=EfMQIJ8GHvq5ncSV20FG+vc+mwngYWwvhnt0YZKfVE6Dz7MP0XzAl4VKIHAUeXONrI
         8rkM+tXvr1/0O7hOrj2izqJcsBpsviKtC0feJ/c1EfFGoAiNMhnetodN3ECiL5H86LkL
         UdWPh3F8vxByfaHBgVXb8+1uIqbzxXHnGeiITMdckwS5XZcCR1WAcFdqprqVwRaHjB32
         PrCHYtIdLDIsuxVtIPFDVDXOwhR0k8gTEkH07XqoLch7JugzQnBSokRKlc0Q2xc9/zQW
         JITQ8v8u+wQ8sfMndhKoBezKq/0s+V/OEJWvKoOQ5M5s2yTCKq3fmhTZOklbI8OsxhEf
         gxSA==
X-Gm-Message-State: AOAM531XoTGzU/l9D/SIYzGrsGYlYCo1Wsui7b1xPSAFUJBJV2a86fzw
	b8KU3bEFcMe8+mliWgLc66fjahI338RX0g==
X-Google-Smtp-Source: ABdhPJwzjUDCvrOdbghjlvGXITQPrmO4QtRQBcpztwS0BEWxiLDfj1VSU5ppDn+t0O/fngSPHbSbjA==
X-Received: by 2002:a1c:6a02:: with SMTP id f2mr4340930wmc.36.1613499690357;
        Tue, 16 Feb 2021 10:21:30 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3cdf:51ac:3008:b3cc])
        by smtp.gmail.com with ESMTPSA id m24sm6542037wml.36.2021.02.16.10.21.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 10:21:30 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: Drop unneeded musl patches
Date: Tue, 16 Feb 2021 18:21:29 +0000
Message-Id: <20210216182129.2036033-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two header fixes are not needed with the current source as the
headers are there through other header files. Drop the patches.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../systemd/0023-Include-sys-wait.h.patch     | 31 -----------------
 .../systemd/0024-Include-signal.h.patch       | 33 -------------------
 meta/recipes-core/systemd/systemd_247.3.bb    |  2 --
 3 files changed, 66 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0023-Include-sys-wait.h.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0024-Include-signal.h.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-Include-sys-wait.h.patch b/meta/recipes-core/systemd/systemd/0023-Include-sys-wait.h.patch
deleted file mode 100644
index ea4a024b82b..00000000000
--- a/meta/recipes-core/systemd/systemd/0023-Include-sys-wait.h.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 359e7a38824a906b0a24f5775f41a2ae3358bf06 Mon Sep 17 00:00:00 2001
-From: Scott Murray <scott.murray@konsulko.com>
-Date: Fri, 13 Sep 2019 19:26:27 -0400
-Subject: [PATCH 23/26] Include sys/wait.h
-
-Fixes:
-src/login/logind-brightness.c:158:85: error: 'WEXITED' undeclared (first use in this function); did you mean 'WIFEXITED'?
-  158 |         r = sd_event_add_child(w->manager->event, &w->child_event_source, w->child, WEXITED, on_brightness_writer_exit, w);
-      |                                                                                     ^~~~~~~
-
-Upstream-Status: Pending
-
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
----
- src/login/logind-brightness.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/login/logind-brightness.c b/src/login/logind-brightness.c
-index a6a1603396..54848ce209 100644
---- a/src/login/logind-brightness.c
-+++ b/src/login/logind-brightness.c
-@@ -1,5 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
-+#include <sys/wait.h>
- #include "bus-util.h"
- #include "device-util.h"
- #include "hash-funcs.h"
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0024-Include-signal.h.patch b/meta/recipes-core/systemd/systemd/0024-Include-signal.h.patch
deleted file mode 100644
index 2820d7b322c..00000000000
--- a/meta/recipes-core/systemd/systemd/0024-Include-signal.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 0592da08e16a17ceef0949ec9901397d8ec5af92 Mon Sep 17 00:00:00 2001
-From: Scott Murray <scott.murray@konsulko.com>
-Date: Fri, 13 Sep 2019 19:26:27 -0400
-Subject: [PATCH 24/26] Include signal.h
-
-Fixes several signal set related errors:
-src/basic/copy.c:92:19: error: implicit declaration of function 'sigemptyset' [-Werror=implicit-function-declaration]
-src/basic/copy.c:93:19: error: implicit declaration of function 'sigaddset' [-Werror=implicit-function-declaration]
-src/basic/copy.c:93:34: error: 'SIGINT' undeclared (first use in this function)
-src/basic/copy.c:95:13: error: implicit declaration of function 'sigtimedwait' [-Werror=implicit-function-declaration]
-
-Upstream-Status: Pending
-
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
----
- src/basic/copy.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/basic/copy.c b/src/basic/copy.c
-index 6a9c3a396f..8948bb4013 100644
---- a/src/basic/copy.c
-+++ b/src/basic/copy.c
-@@ -8,6 +8,7 @@
- #include <sys/sendfile.h>
- #include <sys/xattr.h>
- #include <unistd.h>
-+#include <signal.h>
- 
- #include "alloc-util.h"
- #include "btrfs-util.h"
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd_247.3.bb b/meta/recipes-core/systemd/systemd_247.3.bb
index b1a38ba9b88..a99e543a779 100644
--- a/meta/recipes-core/systemd/systemd_247.3.bb
+++ b/meta/recipes-core/systemd/systemd_247.3.bb
@@ -51,8 +51,6 @@ SRC_URI_MUSL = "\
                file://0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch \
                file://0021-test-json.c-define-M_PIl.patch \
                file://0022-do-not-disable-buffer-in-writing-files.patch \
-               file://0023-Include-sys-wait.h.patch \
-               file://0024-Include-signal.h.patch \
                file://0025-Handle-__cpu_mask-usage.patch \
                file://0026-Handle-missing-gshadow.patch \
                "
-- 
2.27.0

