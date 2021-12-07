Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823BDC433FE
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 19:25:00 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.1764.1638905099341081003
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 11:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oONRzFL6;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so2636896pjc.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 11:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mvQyGl1l0EyH5uFCOk7XfxGjQDF/pj3HijaDp0JgfWw=;
        b=oONRzFL6v3Tpka2Tw42bVJlfLKXhdHMw9G1UjdnO3YMWxM0iEWuLF99UDi2Ev1A87P
         FEaAop//kKo8EW4oSDsqGYktFX8CWZmUmVCEDUXNYFi7TFc+hjmzWieThfoKARXF0zab
         vq9CUDsGJE6jWRBrtA1BS/cSRbLmXLqrN19EKM5IpS3oBzf3Kg7dtqgYneqjOvwjOhww
         fDkLya3fSViuWGZJqq0ugXZFALzXbFs+bkvW4Bo9yh2fxMNtf5WKi3DEqzShBS5ugw2s
         KbRgneg7oUC/nKxi3jLfn40t6KxChsxIMmwy2qxogj0XkeI6tgBa050ktKvB53wrA5Vq
         Bb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mvQyGl1l0EyH5uFCOk7XfxGjQDF/pj3HijaDp0JgfWw=;
        b=Yl74N+oWXTe5X2W6eAPH4W/d20zS2eHrT7wj+UqU87XlWQsgLQxM9YPXdoRzxfz4x7
         BXO0ETaUV/xyaQd/Gnu0jJhgFPeT75JDTkEMe2HCeEa/1ixWD5/BoV5Rsy0BodhY1GXh
         0fAogp9ecUc627kywEdFmJZEcWrS3p8uB5B3vnpzTp4+SC31/EmDYwy0bd+KlX+UuhwR
         Ajr83OwW5HC2p0y3uhm5rh62uNG6QKtn4FfGlNM/3Suy7uIh//F5LqHczAGfj+wicu8Q
         zRqqV2ECOAqmqG22LntIH3ujaONHAeHFgdtyWgY5wdgJklSIzJugQY/Mszx8t8zdrj00
         IUbw==
X-Gm-Message-State: AOAM5336JeH0RZfw4CSu5HX1U7AZY+e9D144g+7zxAqscDV1WQf2SrwZ
	yy6wcFkrF5AfVYOfB9SyOC+AhwIzxe1P7g==
X-Google-Smtp-Source: 
 ABdhPJzN5Pmqf9qRrZPgmsBWwv8YfAzinGr4X5vCHoRYUjMVA+TfzpakplkDwxrmfDUBkgNKBNWDNQ==
X-Received: by 2002:a17:903:185:b0:141:f5f3:dae with SMTP id
 z5-20020a170903018500b00141f5f30daemr53881832plg.56.1638905098479;
        Tue, 07 Dec 2021 11:24:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id y8sm530437pfi.56.2021.12.07.11.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 11:24:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] binutils: Drop patch to wider sh regexp
Date: Tue,  7 Dec 2021 11:24:54 -0800
Message-Id: <20211207192454.477297-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211207192454.477297-1-raj.khem@gmail.com>
References: <20211207192454.477297-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 19:25:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159330

This was needed during uclibc days and remnants have lingered on.
Remove this patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../binutils/binutils-2.37.inc                |  1 -
 ...iden-the-regexp-for-SH-architectures.patch | 41 -------------------
 2 files changed, 42 deletions(-)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.37.inc b/meta/recipes-devtools/binutils/binutils-2.37.inc
index 6093558e4b1..8f91c6460d7 100644
--- a/meta/recipes-devtools/binutils/binutils-2.37.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.37.inc
@@ -22,7 +22,6 @@ SRCREV ?= "87d4632d36323091e731eb07b8aa65f90293da66"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-     file://0004-configure-widen-the-regexp-for-SH-architectures.patch \
      file://0005-Point-scripts-location-to-libdir.patch \
      file://0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch b/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch
deleted file mode 100644
index f476ff210f4..00000000000
--- a/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b8d43b6b8d98e176346871c92935458b06598c5b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 2 Mar 2015 01:07:33 +0000
-Subject: [PATCH] configure: widen the regexp for SH architectures
-
-gprof needs to know about uclibc
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure    | 2 +-
- configure.ac | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 3dd206525a7..e8ba1a1d3de 100755
---- a/configure
-+++ b/configure
-@@ -3892,7 +3892,7 @@ case "${target}" in
-   nvptx*-*-*)
-     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
-     ;;
--  sh-*-*)
-+  sh*-*-* | sh64-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
-diff --git a/configure.ac b/configure.ac
-index 797a624621e..3a8a3ae1f3b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1175,7 +1175,7 @@ case "${target}" in
-   nvptx*-*-*)
-     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
-     ;;
--  sh-*-*)
-+  sh*-*-* | sh64-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
-- 
2.34.1


