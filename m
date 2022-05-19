Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AAEC433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 19:30:17 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.10.1652988601850776748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 12:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QYT31tKg;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id n8so5645095plh.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 12:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eMUDcBdJBK9qvhDnvNxak29r117KBn6MgExzkMnif7Q=;
        b=QYT31tKgCE4BK4O97khsmgZF15agog+Zw0f4CUW1Jx39xfLwa1FlwoLY2f32bO1iNu
         GWvpksJeQZYoENYI+KUffCAA5eQZ6gPFPrIKwliCU3oTJf9V6ptPQTNjOuvKpEHaiKL1
         NRebVJoIcC9Cn68cuYbx/3bL1vqXp8jZUYA+1HxOaiwNwbiJEBRgarOKnh3yOeVGet2I
         8qNgUDI4ImsxCxPzRrk26fatUTZ6vDzsl8UiPOcfQAvH9fZcLdCSxon6HKgmc4y2mi6N
         wv+SuNBe/yiPsC8Zk4yGqvFP/RtJoRMeDp7eHBoWSWyZ2v3yAG/Fqho/f714qCfm8Rjg
         31+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eMUDcBdJBK9qvhDnvNxak29r117KBn6MgExzkMnif7Q=;
        b=3bxyr4bDYm7x587+vKZ5pkJ4+WJNVMyKKHscuZvckHWl8VDbZxtYjg0/te9H15JH2p
         uV7p67pYFBMkaHVN0qUjsub8gwzXz2truco9/Fiid9fkKt3EYMVM35UaNoyCh4Lo1j8q
         +H1J6jQqu6kMjWq2J51+oU5rhnwYuOJz0k4+uPQvQEfVhajqo8xunfnpjjgrmjTspXfP
         UyWuY3OWUTeZJhahpI5i0bOutYsKssXOTAr4hDp2oePgITY2rGEB6nPQIDv645BwJKlD
         fvnQxRqb+LICLcmzHowOO494nDUqOPu45hA09PaO4SRo6X2XnVLTe5iUaeWwziszWuDD
         dlKA==
X-Gm-Message-State: AOAM530gc3W3y3h0vfV/l6W7NMd8PwjFdG7NvWz0GZ/+LRKoNug0Mv2Y
	WY6xMtnJDCNtk26dhMQcqqk4sC6YnLvy8A==
X-Google-Smtp-Source: 
 ABdhPJysngIzN14kJM6fsbT8Bcnk9pMRT4EvX6v1t7DBCMdBPTy5mRuekhv7cP4zchJJIANe4bfnOw==
X-Received: by 2002:a17:902:9309:b0:156:983d:2193 with SMTP id
 bc9-20020a170902930900b00156983d2193mr6094753plb.158.1652988600890;
        Thu, 19 May 2022 12:30:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 f62-20020a17090a704400b001dcf49d92a1sm177894pjk.28.2022.05.19.12.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 12:30:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] systemd: Drop redundant musl patches
Date: Thu, 19 May 2022 12:29:55 -0700
Message-Id: <20220519192957.1129486-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 19:30:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165905

These patches are no longer needed in version 250, they have been
dragged along rebasing over releases unnessarily. Lets remove them

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ype.h-add-__compar_d_fn_t-definition.patch | 28 --------------
 .../systemd/0019-Handle-missing-LOCK_EX.patch | 24 ------------
 ...ible-pointer-type-struct-sockaddr_un.patch | 38 -------------------
 meta/recipes-core/systemd/systemd_250.5.bb    |  3 --
 4 files changed, 93 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch

diff --git a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
deleted file mode 100644
index 5ee212a4e72..00000000000
--- a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 68bb59615e91c4d3e5eb2076979c2b760f4bf027 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 15:27:54 +0800
-Subject: [PATCH] missing_type.h: add __compar_d_fn_t definition
-
-Fix the following compile failure:
-src/basic/util.h:71:18: error: unknown type name '__compar_d_fn_t'; did you mean '__compar_fn_t'?
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
----
- src/basic/missing_type.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
-index 3df1084ef2..697aa7f58a 100644
---- a/src/basic/missing_type.h
-+++ b/src/basic/missing_type.h
-@@ -13,6 +13,7 @@
- 
- #ifndef __GLIBC__
- typedef int (*comparison_fn_t)(const void *, const void *);
-+typedef int (*__compar_d_fn_t) (const void *, const void *, void *);
- #endif
- 
- #ifndef __COMPAR_FN_T
diff --git a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
deleted file mode 100644
index 662f8110db5..00000000000
--- a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From f1574cf91340800cf8253e922b2c613d6b9b5e4a Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Fri, 7 Aug 2020 15:19:27 +0000
-Subject: [PATCH] Handle missing LOCK_EX
-
-Upstream-Status: Inappropriate [musl specific]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-
----
- src/partition/makefs.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/partition/makefs.c b/src/partition/makefs.c
-index b6979b7e4f..63d70d861e 100644
---- a/src/partition/makefs.c
-+++ b/src/partition/makefs.c
-@@ -6,6 +6,7 @@
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <unistd.h>
-+#include <sys/file.h>
- 
- #include "alloc-util.h"
- #include "blockdev-util.h"
diff --git a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
deleted file mode 100644
index 70ac8b607ce..00000000000
--- a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From d2f3293ceb22731e0e97945f0d1132e356b66d07 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Fri, 7 Aug 2020 15:20:17 +0000
-Subject: [PATCH] Fix incompatible pointer type struct sockaddr_un *
-
-| ../../../../../../workspace/sources/systemd/src/nspawn/nspawn.c: In function 'cant_be_in_netns':
-| ../../../../../../workspace/sources/systemd/src/nspawn/nspawn.c:4893:25: error: passing argument 2 of 'connect' from incompatible pointer type [-Werror=incompatible-pointer-types]
-|  4893 |         if (connect(fd, &sa.un, SOCKADDR_UN_LEN(sa.un)) < 0) {
-|       |                         ^~~~~~
-|       |                         |
-|       |                         struct sockaddr_un *
-| In file included from ../../../../../../workspace/sources/systemd/src/systemd/sd-daemon.h:22,
-|                  from ../../../../../../workspace/sources/systemd/src/nspawn/nspawn.c:21:
-| /home/ubuntu/poky/build/tmp/work/core2-64-poky-linux-musl/systemd/1_246-r0/recipe-sysroot/usr/include/sys/socket.h:384:19: note: expected 'const struct sockaddr *' but argument is of type 'struct sockaddr_un *'
-|   384 | int connect (int, const struct sockaddr *, socklen_t);
-|       |                   ^~~~~~~~~~~~~~~~~~~~~~~
-| cc1: some warnings being treated as errors
-
-Upstream-Status: Inappropriate [musl specific]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-
----
- src/nspawn/nspawn.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index a2af4948c0..fb6af295b5 100644
---- a/src/nspawn/nspawn.c
-+++ b/src/nspawn/nspawn.c
-@@ -5399,7 +5399,7 @@ static int cant_be_in_netns(void) {
-         if (fd < 0)
-                 return log_error_errno(errno, "Failed to allocate udev control socket: %m");
- 
--        if (connect(fd, &sa.sa, SOCKADDR_UN_LEN(sa.un)) < 0) {
-+        if (connect(fd, (struct sockaddr *)&sa.sa, SOCKADDR_UN_LEN(sa.un)) < 0) {
- 
-                 if (errno == ENOENT || ERRNO_IS_DISCONNECT(errno))
-                         return log_error_errno(SYNTHETIC_ERRNO(EOPNOTSUPP),
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index e5a2f65202c..2f5b9d1367e 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -45,10 +45,7 @@ SRC_URI_MUSL = "\
                file://0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch \
                file://0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch \
                file://0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch \
-               file://0017-missing_type.h-add-__compar_d_fn_t-definition.patch \
                file://0018-avoid-redefinition-of-prctl_mm_map-structure.patch \
-               file://0019-Handle-missing-LOCK_EX.patch \
-               file://0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch \
                file://0021-test-json.c-define-M_PIl.patch \
                file://0022-do-not-disable-buffer-in-writing-files.patch \
                file://0025-Handle-__cpu_mask-usage.patch \
-- 
2.36.1


