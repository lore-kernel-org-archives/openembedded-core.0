Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86ADAC54E68
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 21:07:52 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.27824.1710882469252407779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 14:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fQqMoSbV;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dde26f7e1dso43859835ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 14:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710882468; x=1711487268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6IlIl7ViWNbzkyk4mlFSJJdeS+Gfa+eY6hKkAxlDIiA=;
        b=fQqMoSbVUXYDarmRhdYObigREEupKUNd3qiMJ/sOVA9ZhDcaB+qmo7QGD2dkPc0zF2
         /wkHbq3KUEa+BuhVdrFHT+QVPfxAx1jIxV02KWkNKnObxQQMQGLKVAcxtQp2RyJxQdLT
         9SXtFHioXElnVtjaLKVj/xpndKvqOVsjpr8jTCFp44Ux/TkYDTcnM7bKcZatB/u4YMgu
         VOgupk5nxq5Ju7OK0PwcgKUbyamahFyXlUtV1GzUmbsWEEt5zhF46BryncM3+k8uTTB9
         y4YcEtfLj1YnvLAdQ9WekpdHka34c2NYGflI11VhUcaZW3a7qtsQ4Qz6IhklLDKeKO2m
         Fa7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710882468; x=1711487268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6IlIl7ViWNbzkyk4mlFSJJdeS+Gfa+eY6hKkAxlDIiA=;
        b=n5/zOmya5kf/hGihE4hetEqPyEOxoXa0HfssjeeJ+AJHNwIIC2d3ZRZrIdJCmKNbrz
         CcKxuO0Fyw7jrgAU7dpkg5FFlGsl0aPJFe4VrLxGpqZxyNGtWy4HoW2WU1kNN9POTl6E
         2ky0hOUj2lwQq+1keClLt00U1r19ehSuhluShtEX7M2mq5hvmjCMPa9eDoqDWaleAUB3
         NKfRdzKEkM64E8u2Vv89GS30PDFWJ12SW+uhG94Qg5H+JA49IW3GsX7TZHV5r3Hvcj9X
         oGbTsglBG8tds7Gdo/YyKvnpwOTYi08/1dyQOk2M+hcfmLoKa5OOOPI6xoc8sqbdKhMP
         JNow==
X-Gm-Message-State: AOJu0YybzE9R7oJLDlErq49faHNZolhGW0D0J5DriZtR+yvM8g+KM/IV
	AzVR3pHqwana5ez7Lmxb3D2CizAek+Z/KQK7BB+7wKD4s/17XLJrOfF0IvYx
X-Google-Smtp-Source: AGHT+IEmIKRujmbrmTwriu5ZpQcVM1tLK2G6eEKcpwB5ln3u6F9o+ePQElOTgtP1LbFCAoticpuiYA==
X-Received: by 2002:a17:903:248:b0:1dc:b73b:ec35 with SMTP id j8-20020a170903024800b001dcb73bec35mr18838245plh.4.1710882468315;
        Tue, 19 Mar 2024 14:07:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::debd])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902ce8c00b001ddda95074fsm6544825plg.11.2024.03.19.14.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 14:07:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] piglit: Switch to upstreamed patch for musl fix
Date: Tue, 19 Mar 2024 14:07:45 -0700
Message-ID: <20240319210745.68432-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 21:07:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197332

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...clude-libgen.h-on-musl-linux-systems.patch | 83 +++++++++++++++----
 1 file changed, 69 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch b/meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch
index e180664d6e4..2875dd52ec8 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch
@@ -1,28 +1,83 @@
-From 608cdeddc8e8a679b195927c4d34dc8d93142a91 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 13 Feb 2024 08:53:37 -0800
-Subject: [PATCH] utils: Include libgen.h on musl/linux systems
+From 6c852e6ac292008137a6f3a8aa908090bb5b4b11 Mon Sep 17 00:00:00 2001
+From: Erik Faye-Lund <erik.faye-lund@collabora.com>
+Date: Tue, 19 Mar 2024 16:34:02 +0100
+Subject: [PATCH] properly check for libgen.h
 
-musl does not provide GNU basename like string.h on glibc based systems
-does, it does provide the POSIX compliant basename function therefore
-allow to include libgen.h on non-glibc based linux systems
+Some users are reporting that basename is not available when building on
+Linux with musl libc. And since the POSIX spec[1] says that basename is
+defined in libgen.h, we should include that when available.
 
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/877]
+So let's properly detect the header, and include it if it exists. This
+should hopefully make things a bit more robust.
+
+Since we're also including this from the CL program-tester, let's
+rearrange the includes a bit so we know that config.h has been included.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/888]
+Reviewed-by: David Heidelberg <david.heidelberg@collabora.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- tests/util/piglit-util.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ CMakeLists.txt                    | 1 +
+ tests/cl/program/program-tester.c | 5 ++++-
+ tests/util/config.h.in            | 1 +
+ tests/util/piglit-util.h          | 4 ++--
+ 4 files changed, 8 insertions(+), 3 deletions(-)
 
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index dd2bf67125..5563fe0e20 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -492,6 +492,7 @@ check_include_file(unistd.h    HAVE_UNISTD_H)
+ check_include_file(fcntl.h     HAVE_FCNTL_H)
+ check_include_file(linux/sync_file.h HAVE_LINUX_SYNC_FILE_H)
+ check_include_file(endian.h    HAVE_ENDIAN_H)
++check_include_file(libgen.h    HAVE_LIBGEN_H)
+ 
+ if(DEFINED PIGLIT_INSTALL_VERSION)
+ 	set(PIGLIT_INSTALL_VERSION_SUFFIX
+diff --git a/tests/cl/program/program-tester.c b/tests/cl/program/program-tester.c
+index 97fe64906d..e47fb5aacc 100644
+--- a/tests/cl/program/program-tester.c
++++ b/tests/cl/program/program-tester.c
+@@ -31,10 +31,13 @@
+ #include <inttypes.h>
+ #include <math.h>
+ #include <regex.h>
+-#include <libgen.h>
+ 
+ #include "piglit-framework-cl-program.h"
+ 
++#ifdef HAVE_LIBGEN_H
++#include <libgen.h>
++#endif
++
+ /* Regexes */
+ 
+ /*
+diff --git a/tests/util/config.h.in b/tests/util/config.h.in
+index 8ed5af1709..437eb91418 100644
+--- a/tests/util/config.h.in
++++ b/tests/util/config.h.in
+@@ -16,3 +16,4 @@
+ #cmakedefine HAVE_SYS_RESOURCE_H 1
+ #cmakedefine HAVE_UNISTD_H 1
+ #cmakedefine HAVE_ENDIAN_H 1
++#cmakedefine HAVE_LIBGEN_H 1
 diff --git a/tests/util/piglit-util.h b/tests/util/piglit-util.h
-index 4d3606c70..fdfd903b3 100644
+index 4d3606c708..de999980b6 100644
 --- a/tests/util/piglit-util.h
 +++ b/tests/util/piglit-util.h
-@@ -52,7 +52,7 @@ extern "C" {
+@@ -52,8 +52,8 @@ extern "C" {
  #include <math.h>
  #include <float.h>
  
 -#if defined(__APPLE__) || defined(__MINGW32__)
-+#if defined(__APPLE__) || defined(__MINGW32__) || (defined(__linux__) && !defined(__GLIBC__))
- #  include "libgen.h" // for basename
+-#  include "libgen.h" // for basename
++#ifdef HAVE_LIBGEN_H
++#  include <libgen.h> // for basename
  #elif defined(_MSC_VER)
  
+ static inline char *
+-- 
+GitLab
+
-- 
2.44.0


