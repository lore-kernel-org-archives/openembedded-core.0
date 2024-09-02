Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53514CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 21:20:34 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.9379.1725312026500396527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 14:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ewRJe8eK;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-205659dc63aso11660215ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 14:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725312026; x=1725916826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PXGlsDXJacbjIdVr/D5mDgJS/1ePaQtj89At8tGaQuE=;
        b=ewRJe8eKZns2x1LKj/ysvpFrSBDpvbEEUPDLPfBs+lzVqL2MdrFERGUTgX6JeX5Ufm
         7MD4oBwwc3wS9Te7ejOjnL+R29esL0iUJfmhaUPOg7kz7kbJP1Zp2J9mPSA/VcC2oBox
         WHfER7+c3WToMyeIRF1aM0Fg7gj0mPYS0N+U2JiX49DIpFol3TThLfT5WVFhgO0iPal8
         ytMs5Ft0UUmWLZEm5zqevscJ5NLISifIyr6yN4qagE3M34J4Cn66M0xta99PXcQhURxV
         H+KuI1imWA1pmymkSMdaMLG5j2bU/nKnB5QTdeHt0BmH2krLyGirxIhBszZfl/EEetOk
         YKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725312026; x=1725916826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXGlsDXJacbjIdVr/D5mDgJS/1ePaQtj89At8tGaQuE=;
        b=CQEE4r2x6ZQRGkyAc6tiBK+qaGGunX6caxRKlqY9T825kNl1YxmIWzo2kYCLMeL8uE
         fc94g1PKB/3bXLQVQva4sRUY9HnPbSkm6ByadCIsXI6TbmxUlRHUADfMeNECqxu9Oqn0
         2owQZJRo4OXcFbmoIWqOKrHnE8k4asWuPpFguT68d6zlmK+S4tkaE1+zsZ0uv25I9E40
         qC7tEuxKvlU+5g+cKBnnw9GBlyBLAheA48QMISIvmC4Th2ffYdCNBSbc+v77vHAZWbM7
         FJ0Vv1brPJjFvdsB9DQZgt6jtffMGGjOVM5CMBz3oFf6UCUcavvUwupkHFrybEHwyZGr
         DjhA==
X-Gm-Message-State: AOJu0YxB8jp4jX4jV+GM9Daz4Dvt94LlGjS7OcxxKBuH3DHfVX/xzbU0
	Bdd4ADlu5o2udJeZQ9T6lTyOKlChoBBUErYcqAQUpspxRpY8S7Q/njnMyjtE
X-Google-Smtp-Source: AGHT+IHJqT1ltp4sSSH2hLB378JccijdEeQ+xukgYZyCZMekuionwZpNTcct1BEBibP/RwUQS78byw==
X-Received: by 2002:a17:903:2451:b0:202:4b99:fd3b with SMTP id d9443c01a7336-20547642d35mr90819115ad.42.1725312025588;
        Mon, 02 Sep 2024 14:20:25 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::496c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2058d208be5sm13014575ad.152.2024.09.02.14.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 14:20:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ffmpeg: Fix build on musl linux systems
Date: Mon,  2 Sep 2024 14:20:22 -0700
Message-ID: <20240902212022.2119138-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 21:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204114

Improved detection of ioctl API makes it easier to use the right
implementation rather than bunch of ifdef condition checks.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...figure-improve-check-for-POSIX-ioctl.patch | 48 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-configure-improve-check-for-POSIX-ioctl.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-configure-improve-check-for-POSIX-ioctl.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-configure-improve-check-for-POSIX-ioctl.patch
new file mode 100644
index 00000000000..b7c8cb21356
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-configure-improve-check-for-POSIX-ioctl.patch
@@ -0,0 +1,48 @@
+From 82b5617b8197246cf5b2af98a28f2aa37b8c8aa1 Mon Sep 17 00:00:00 2001
+From: Ramiro Polla <ramiro.polla@gmail.com>
+Date: Thu, 29 Aug 2024 15:40:00 +0200
+Subject: [PATCH] configure: improve check for POSIX ioctl
+
+Instead of relying on system #ifdefs which may or may not be correct,
+detect the POSIX ioctl signature at configure time.
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/00b64fca55a3a009c9d0e391c85f4fd3291e5d12]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure          | 2 ++
+ libavdevice/v4l2.c | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 8642513..d70b0bb 100755
+--- a/configure
++++ b/configure
+@@ -2517,6 +2517,7 @@ HAVE_LIST="
+     opencl_videotoolbox
+     perl
+     pod2man
++    posix_ioctl
+     texi2html
+     xmllint
+     zlib_gzip
+@@ -7131,6 +7132,7 @@ perl -v            > /dev/null 2>&1 && enable perl      || disable perl
+ pod2man --help     > /dev/null 2>&1 && enable pod2man   || disable pod2man
+ rsync --help 2> /dev/null | grep -q 'contimeout' && enable rsync_contimeout || disable rsync_contimeout
+ xmllint --version  > /dev/null 2>&1 && enable xmllint   || disable xmllint
++test_code cc sys/ioctl.h "int ioctl(int, int, ...)" && enable posix_ioctl
+ 
+ # check V4L2 codecs available in the API
+ if enabled v4l2_m2m; then
+diff --git a/libavdevice/v4l2.c b/libavdevice/v4l2.c
+index 50ac47e..ee01711 100644
+--- a/libavdevice/v4l2.c
++++ b/libavdevice/v4l2.c
+@@ -107,7 +107,7 @@ struct video_data {
+     int (*open_f)(const char *file, int oflag, ...);
+     int (*close_f)(int fd);
+     int (*dup_f)(int fd);
+-#if defined(__sun) || defined(__BIONIC__) || defined(__musl__) /* POSIX-like */
++#if HAVE_POSIX_IOCTL
+     int (*ioctl_f)(int fd, int request, ...);
+ #else
+     int (*ioctl_f)(int fd, unsigned long int request, ...);
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
index 1dbb7e04efb..9e60b5cd23e 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
@@ -25,6 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = " \
     https://www.ffmpeg.org/releases/${BP}.tar.xz \
     file://0001-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch \
+    file://0001-configure-improve-check-for-POSIX-ioctl.patch \
 "
 
 SRC_URI[sha256sum] = "8646515b638a3ad303e23af6a3587734447cb8fc0a0c064ecdb8e95c4fd8b389"

