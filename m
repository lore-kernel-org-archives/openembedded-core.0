Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC3CC43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 14:38:55 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.32696.1654526331892407768
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NFjVULDf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 q12-20020a17090a304c00b001e2d4fb0eb4so18009680pjl.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tE0MrRMKIilCB9PbxRMTWahrL7JPFxwoervX0M4CACM=;
        b=NFjVULDfTiH6MmCxPcUOFOfGXFIQBXfHuoLBrzDgzdW3Cnx5nwv/88mlJLr9Mb/m8J
         71fgcm9sRt47XDyAAV0OLIVIRy0PV6eW+kwSssmSb+rlv3wy1VS7vBXxBEFtmFZTlpxD
         dkKT6jrmbvA+XqE5ZMIu3XYT7zHS28sUw58RkU4NEXZoFY8Uf3pdiZ3Fppg9Dqhz198Z
         1vKeadLHUpQeGuu2cyvH10B88vD9RcqTYuNNBbUlcSVgfd9ywAKqJvPSxFLM0Ho4lug9
         MGy4afZDoooxqomxUK//QfuN0qTHIvgwJ5xeNy7y0xXTKv8U3MDjP3DvN0z4Q5BuVwYt
         zOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tE0MrRMKIilCB9PbxRMTWahrL7JPFxwoervX0M4CACM=;
        b=JqwPyh/+nniipndLJgRXxq3QIO/YO7mlCtnCMdkJ+5FQp/ChYYv92zKaoYU4lxJtJ9
         NnH3S3PfkMtPEV5A+3s3F4jQXHaIlO4VHNH3Q2CopPIfVorY9I8kM2n29AOKXugGEUAH
         iruSeeIyuZ5I+j5VNjoey996UjGTa1dH9HNIsVk+5XfxbV0oA+kefJyNpgEHM3a08Ri2
         5rS5Ac5ncLwuwVBgaDwy2IMVKwNRMGRqp9PDCs58reTBTwYGKE3SFG2AfOVb7Ga2ARDW
         1jr3uCLc/QlhFZLozt2yySItlrD7Eyi73q/bckHuJSB5upe52NpiOL0XDeu6bQqMGCAV
         hMTw==
X-Gm-Message-State: AOAM533K50JOBGDLdNwi/GSEfTuC0WDH2rbJM5rtOfCmefLth71KG2Ia
	NzZysAXaQRaczjFuXUMsNr68iOhZAvchIZxg
X-Google-Smtp-Source: 
 ABdhPJx6Adolmwa1LAk5DPBapbqJe8Olj8EdUm3Q9F/LSR0NWgYQKm+hdXWUxNQWxXaFBkb+ILaDuw==
X-Received: by 2002:a17:903:230b:b0:167:5310:9eed with SMTP id
 d11-20020a170903230b00b0016753109eedmr15853149plh.46.1654526330309;
        Mon, 06 Jun 2022 07:38:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm10544112plm.191.2022.06.06.07.38.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 07:38:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/13] systemd: Drop redundant musl patches
Date: Mon,  6 Jun 2022 04:38:19 -1000
Message-Id: 
 <5420919e3e5c1e4b816c60a5b1ddd7da44cd6905.1654526060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654526060.git.steve@sakoman.com>
References: <cover.1654526060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 14:38:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166634

From: Khem Raj <raj.khem@gmail.com>

These patches are no longer needed in version 250, they have been
dragged along rebasing over releases unnessarily. Lets remove them

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 216fe2b8e53640ae5794e9426de56cd87637dde4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 5ee212a4e7..0000000000
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
index 662f8110db..0000000000
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
index 70ac8b607c..0000000000
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
index e5a2f65202..2f5b9d1367 100644
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
2.25.1


