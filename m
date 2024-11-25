Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CE4D58080
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:43 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.17204.1732536096470718446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=joWfcEvs;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ff550d37a6so47725101fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536095; x=1733140895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWWLxVtv7aPiitJ4wv2kj2mDXtDmprNQ/DGgNxkCmKI=;
        b=joWfcEvsrukobJ+8YGdPMnwMNWH4A12f7vEHKMPbZc3L4ALZhBYf5FIUXYpk4rNlAS
         JYNCUy+YYqH0UKg8nmt9NeQeZwWAxoRjK8XS1jddNH0jhnA1OtkiDgB6+gFTzSfkvnnJ
         RhaaTFQBHpNzX9/m5CuF4m8h21JgMFZZtU0FSQctZU5sFt8neGkAPqp5ltZaDwuZOAZm
         MhpvN7B8MMrvxLziDlz1QR6nVlg4XBS9XIeXTtoCAjqAdMwIpQUyJmXdLxpoDnNnj0Nx
         3rZtrioAWSCSnyTNynXr78gjJHjSQL+D1r2U3OpmlH/M48t/k8FhJNlkijCMu0ZZ+I5z
         83Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536095; x=1733140895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWWLxVtv7aPiitJ4wv2kj2mDXtDmprNQ/DGgNxkCmKI=;
        b=R99eDe/UqcwZGZt+w5mu/OozJQaj1bFglzUGL/+6F01cnpp2F7P4VKvpvvmZ/TZP75
         TbIHV+O1oCvYM7X8Ndq4Vg+OGxIXqDh8sX7lacT12xIWxi+GiZdCBWYOOCm8G/yXdj2P
         K4nLa5fl4WN6ujQ7hLyfRW/SsbW0Qg96lLL8+lWDqNcGd4hyiWYBP7BkSg2hYVA6JKHL
         WtQIbzj4N957obW4bdUMoIFJTKOgflmXJD+dKaeI4FUMsQvsVMVPv+nyJ8Smhz8x6yut
         SpGV1ftxqo1pKu0CH4e4fD3uWnDHslMkqk4upNcBl4xkWdzN0ItAQBJaPM2nPo2ZMfOx
         GWnA==
X-Gm-Message-State: AOJu0YwkqgIlkyMuGEBxJ0XfnZnFAlYCooGmKuhXoc3+ucr4S/9x9dS3
	GBqS7MgKhJ9O/0nySvnVdg3CHxD9HxDUDltG3YLCxqutpMWuLBpalIDf/g==
X-Gm-Gg: ASbGnct0vI6rNdKV1B47oCLhpTe5wQurgRfov67nHEXrFnEkKr2i201ttxhm7ncWloc
	54xsZj1G4js3unyJ+RpbPEajObDP9Cfl4gpawlcMgC77YXq/5XUR3ULh7T6gdoNTfMvr+KcppWL
	Mj3fG/WMdMe6Hjgm549sJMz5YsFfqDltrzqmzDflpBalo6N6iu4apOAe2y7e0YNlCqfn8Uf4Nuc
	2Jp5JN3SN4b4oSZD92OmUYP3KjmMgs9wMGvVsY44+VVGcA1x51BlbzYAD7oHXzvE/TrPBuUdj8g
	96gwkgtly34=
X-Google-Smtp-Source: AGHT+IG5jwHTImVVJngtj7h0bKngFgEbBHi7ZhqVNw708fFOuzKsPNbux3D/BstdTfnM58euFtWIHA==
X-Received: by 2002:a05:651c:247:b0:2fb:8774:4412 with SMTP id 38308e7fff4ca-2ffa71a571amr52591971fa.24.1732536094024;
        Mon, 25 Nov 2024 04:01:34 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/35] ffmpeg: upgrade 7.0.2 -> 7.1
Date: Mon, 25 Nov 2024 13:00:59 +0100
Message-Id: <20241125120127.2205232-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207754

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...figure-improve-check-for-POSIX-ioctl.patch | 48 -----------------
 ...lpdsp_armv5te-fix-label-format-to-wo.patch | 52 -------------------
 .../ffmpeg/{ffmpeg_7.0.2.bb => ffmpeg_7.1.bb} |  9 ++--
 3 files changed, 3 insertions(+), 106 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-configure-improve-check-for-POSIX-ioctl.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_7.0.2.bb => ffmpeg_7.1.bb} (96%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-configure-improve-check-for-POSIX-ioctl.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-configure-improve-check-for-POSIX-ioctl.patch
deleted file mode 100644
index b7c8cb21356..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-configure-improve-check-for-POSIX-ioctl.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 82b5617b8197246cf5b2af98a28f2aa37b8c8aa1 Mon Sep 17 00:00:00 2001
-From: Ramiro Polla <ramiro.polla@gmail.com>
-Date: Thu, 29 Aug 2024 15:40:00 +0200
-Subject: [PATCH] configure: improve check for POSIX ioctl
-
-Instead of relying on system #ifdefs which may or may not be correct,
-detect the POSIX ioctl signature at configure time.
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/00b64fca55a3a009c9d0e391c85f4fd3291e5d12]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure          | 2 ++
- libavdevice/v4l2.c | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 8642513..d70b0bb 100755
---- a/configure
-+++ b/configure
-@@ -2517,6 +2517,7 @@ HAVE_LIST="
-     opencl_videotoolbox
-     perl
-     pod2man
-+    posix_ioctl
-     texi2html
-     xmllint
-     zlib_gzip
-@@ -7131,6 +7132,7 @@ perl -v            > /dev/null 2>&1 && enable perl      || disable perl
- pod2man --help     > /dev/null 2>&1 && enable pod2man   || disable pod2man
- rsync --help 2> /dev/null | grep -q 'contimeout' && enable rsync_contimeout || disable rsync_contimeout
- xmllint --version  > /dev/null 2>&1 && enable xmllint   || disable xmllint
-+test_code cc sys/ioctl.h "int ioctl(int, int, ...)" && enable posix_ioctl
- 
- # check V4L2 codecs available in the API
- if enabled v4l2_m2m; then
-diff --git a/libavdevice/v4l2.c b/libavdevice/v4l2.c
-index 50ac47e..ee01711 100644
---- a/libavdevice/v4l2.c
-+++ b/libavdevice/v4l2.c
-@@ -107,7 +107,7 @@ struct video_data {
-     int (*open_f)(const char *file, int oflag, ...);
-     int (*close_f)(int fd);
-     int (*dup_f)(int fd);
--#if defined(__sun) || defined(__BIONIC__) || defined(__musl__) /* POSIX-like */
-+#if HAVE_POSIX_IOCTL
-     int (*ioctl_f)(int fd, int request, ...);
- #else
-     int (*ioctl_f)(int fd, unsigned long int request, ...);
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch
deleted file mode 100644
index b7cd048165c..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From e52fc2c11c3935085ccf1a5707ce50223ad62b58 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Thu, 8 Aug 2024 18:04:17 +0100
-Subject: [PATCH] libavcodec/arm/mlpdsp_armv5te: fix label format to work with
- binutils 2.43
-
-binutils 2.43 has stricter validation for labels[1] and results in errors
-when building ffmpeg for armv5:
-
-src/libavcodec/arm/mlpdsp_armv5te.S:232: Error: junk at end of line, first unrecognized character is `0'
-
-Remove the leading zero in the "01" label to resolve this error.
-
-[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=226749d5a6ff0d5c607d6428d6c81e1e7e7a994b
-
-Upstream-Status: Submitted [https://ffmpeg.org//pipermail/ffmpeg-devel/2024-August/332149.html]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- libavcodec/arm/mlpdsp_armv5te.S | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/libavcodec/arm/mlpdsp_armv5te.S b/libavcodec/arm/mlpdsp_armv5te.S
-index 4f9aa48..d315686 100644
---- a/libavcodec/arm/mlpdsp_armv5te.S
-+++ b/libavcodec/arm/mlpdsp_armv5te.S
-@@ -229,7 +229,7 @@ A .endif
-   .endif
- 
-         // Begin loop
--01:
-+1:
-   .if TOTAL_TAPS == 0
-         // Things simplify a lot in this case
-         // In fact this could be pipelined further if it's worth it...
-@@ -241,7 +241,7 @@ A .endif
-         str     ST0, [PST, #-4]!
-         str     ST0, [PST, #4 * (MAX_BLOCKSIZE + MAX_FIR_ORDER)]
-         str     ST0, [PSAMP], #4 * MAX_CHANNELS
--        bne     01b
-+        bne     1b
-   .else
-     .if \fir_taps & 1
-       .set LOAD_REG, 1
-@@ -333,7 +333,7 @@ T       orr     AC0, AC0, AC1
-         str     ST3, [PST, #-4]!
-         str     ST2, [PST, #4 * (MAX_BLOCKSIZE + MAX_FIR_ORDER)]
-         str     ST3, [PSAMP], #4 * MAX_CHANNELS
--        bne     01b
-+        bne     1b
-   .endif
-         b       99f
- 
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb
similarity index 96%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb
index db0aa608266..35dbda8c3d9 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb
@@ -22,13 +22,10 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = " \
-    https://www.ffmpeg.org/releases/${BP}.tar.xz \
-    file://0001-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch \
-    file://0001-configure-improve-check-for-POSIX-ioctl.patch \
-"
+SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
+           "
 
-SRC_URI[sha256sum] = "8646515b638a3ad303e23af6a3587734447cb8fc0a0c064ecdb8e95c4fd8b389"
+SRC_URI[sha256sum] = "40973d44970dbc83ef302b0609f2e74982be2d85916dd2ee7472d30678a7abe6"
 
 # https://nvd.nist.gov/vuln/detail/CVE-2023-39018
 # https://github.com/bramp/ffmpeg-cli-wrapper/issues/291
-- 
2.39.5


