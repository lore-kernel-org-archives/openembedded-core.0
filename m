Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025F3C001DE
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 19:53:11 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.2048.1690833183362557693
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 12:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IUxhQxCh;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-686f090310dso4906859b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 12:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690833182; x=1691437982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l6AbgZx/JA+4tkhS41DTxOGaUqr4HGkaqNStNReOF2w=;
        b=IUxhQxChrx9bciDtwL5/b0vmZ1dofuqgkuB1sXRAzYHJ2yR7XFQ/PUsYQnZad6my5U
         h+nKg0twgFnt9b4Z0KtZLQrQjYtFR1AKKWWnd5yNaf/zSJffm3Fw9SEXGEr/btZpJDAJ
         QMUxrHM/pE212lFcJPAF53Lv6pyoCGUaz8irFZJ215RHQa6pOEHL2UeuoCt1EFgaAql0
         6GuFijidTIQhOU+AWY2X3cM9DLLb406QcXSL6MOoJZUy1nlXg8cnlEE2sg480SrjOz8z
         NC1s7MxBno0Tjpen3j0IzgoVKvXxTJCO4HP0EjBxO45U+frjCHO+JFoBi4ZRh7gmIUcO
         zNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690833182; x=1691437982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6AbgZx/JA+4tkhS41DTxOGaUqr4HGkaqNStNReOF2w=;
        b=e52vEfFXQreCIHfeI2lMtoSjmolbyd+M/2K+LhZ+AAkxBOPW9R+ZyII6Rlnb7s21X4
         y/PbjFhK4BApgy4xt5nGhI3ISSOxZ/OLpwtKDlBvLTHxsY/LpMayKyAgLU7D0kM1FBz7
         xSb4whezXxihmDGiACf0WW+WozBA2c/ikfZVpXh22X2AW9uPr1ni8r4FeXxooI9C5hWI
         7+BgRSfzcQMw7s6wABc0/6QPsuvagScaZRzXtlfacnsFUDMayFarBDfHPehPt6fH617e
         Nm2aeHiE4UHiQ8gyw5vR+Ok61yXuN00WrJ1QiFVnVweTkhPlUtFyivTVRdA2cV1xS0d3
         Km6w==
X-Gm-Message-State: ABy/qLZp4Ldz48yy7SlB+TJvEf1tmzwbUNi1vMVTmtHkja7MmTasPvag
	QGiKN6yWmZxnnlvIDxCANcF0Wirq+4TfrA==
X-Google-Smtp-Source: APBJJlEiN6mRAhkQdWbT1QN07NC63lEV3FtlnFl6hFK/jy9RMbvOtDsbBbCe9WAR5jIHY6j2eWv5Ag==
X-Received: by 2002:a05:6a20:3ca9:b0:12f:6aee:7e43 with SMTP id b41-20020a056a203ca900b0012f6aee7e43mr13489288pzj.57.1690833182179;
        Mon, 31 Jul 2023 12:53:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::61c9])
        by smtp.gmail.com with ESMTPSA id u20-20020aa78394000000b0063f1a1e3003sm7978500pfm.166.2023.07.31.12.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 12:53:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ffmpeg: Fix wrong code found with gas/2.41
Date: Mon, 31 Jul 2023 12:52:59 -0700
Message-ID: <20230731195259.2183474-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 19:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185165

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ops-clip-constants-used-with-shift-i.patch | 77 +++++++++++++++++++
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb  |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-x86-mathops-clip-constants-used-with-shift-i.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-x86-mathops-clip-constants-used-with-shift-i.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-x86-mathops-clip-constants-used-with-shift-i.patch
new file mode 100644
index 00000000000..a47a20365fe
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-x86-mathops-clip-constants-used-with-shift-i.patch
@@ -0,0 +1,77 @@
+From effadce6c756247ea8bae32dc13bb3e6f464f0eb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
+Date: Sun, 16 Jul 2023 18:18:02 +0300
+Subject: [PATCH] avcodec/x86/mathops: clip constants used with shift
+ instructions within inline assembly
+
+Fixes assembling with binutil as >= 2.41
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/effadce6c756247ea8bae32dc13bb3e6f464f0eb]
+Signed-off-by: James Almer <jamrial@gmail.com>
+---
+ libavcodec/x86/mathops.h | 26 +++++++++++++++++++++++---
+ 1 file changed, 23 insertions(+), 3 deletions(-)
+
+diff --git a/libavcodec/x86/mathops.h b/libavcodec/x86/mathops.h
+index 6298f5ed19..ca7e2dffc1 100644
+--- a/libavcodec/x86/mathops.h
++++ b/libavcodec/x86/mathops.h
+@@ -35,12 +35,20 @@
+ static av_always_inline av_const int MULL(int a, int b, unsigned shift)
+ {
+     int rt, dummy;
++    if (__builtin_constant_p(shift))
+     __asm__ (
+         "imull %3               \n\t"
+         "shrdl %4, %%edx, %%eax \n\t"
+         :"=a"(rt), "=d"(dummy)
+-        :"a"(a), "rm"(b), "ci"((uint8_t)shift)
++        :"a"(a), "rm"(b), "i"(shift & 0x1F)
+     );
++    else
++        __asm__ (
++            "imull %3               \n\t"
++            "shrdl %4, %%edx, %%eax \n\t"
++            :"=a"(rt), "=d"(dummy)
++            :"a"(a), "rm"(b), "c"((uint8_t)shift)
++        );
+     return rt;
+ }
+ 
+@@ -113,19 +121,31 @@ __asm__ volatile(\
+ // avoid +32 for shift optimization (gcc should do that ...)
+ #define NEG_SSR32 NEG_SSR32
+ static inline  int32_t NEG_SSR32( int32_t a, int8_t s){
++    if (__builtin_constant_p(s))
+     __asm__ ("sarl %1, %0\n\t"
+          : "+r" (a)
+-         : "ic" ((uint8_t)(-s))
++         : "i" (-s & 0x1F)
+     );
++    else
++        __asm__ ("sarl %1, %0\n\t"
++               : "+r" (a)
++               : "c" ((uint8_t)(-s))
++        );
+     return a;
+ }
+ 
+ #define NEG_USR32 NEG_USR32
+ static inline uint32_t NEG_USR32(uint32_t a, int8_t s){
++    if (__builtin_constant_p(s))
+     __asm__ ("shrl %1, %0\n\t"
+          : "+r" (a)
+-         : "ic" ((uint8_t)(-s))
++         : "i" (-s & 0x1F)
+     );
++    else
++        __asm__ ("shrl %1, %0\n\t"
++               : "+r" (a)
++               : "c" ((uint8_t)(-s))
++        );
+     return a;
+ }
+ 
+-- 
+2.41.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
index 1d80fd92949..07c641dc96c 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
@@ -23,6 +23,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
+           file://0001-avcodec-x86-mathops-clip-constants-used-with-shift-i.patch \
            file://0001-libswscale-riscv-Fix-syntax-of-vsetvli.patch"
 
 SRC_URI[sha256sum] = "57be87c22d9b49c112b6d24bc67d42508660e6b718b3db89c44e47e289137082"
-- 
2.41.0


