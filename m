Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E678C25B0F
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:42:56 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.22274.1659940971827696107
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dU19/+fJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id k26so14819789ejx.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kQTVpgP/B5sUzXX9siDUIJMUjDuWFevj+4LzLw1ZYRY=;
        b=dU19/+fJ2r8uGLgrK2f6WH86bMbf9DHv0n76rvhNbiS7KzSl76UBlSvCWbHWRQieGw
         Xr98SPy8eV5g4FKQJw5UGTpQSh852qRg0Yqqoh7Vi3Rx1JWRBL24sUOkgWdoh7LCUOGT
         7zwTYjZWvgHcCX7EO2otOQjr6gDdzsUjCj1eFVrvV20foMYYE3hVr8oEqsN8d02kG1ff
         q+5K6A/eeq1lmHmXuHDlSJuNoBlo6e0xEUcO7VcwNE/ZT1VyhLhMFMkX8c4BBbtJUHz0
         xPYXEdJxp+sPMlFA1Nr0xbbDAIK83bNDRwrahFJKg/bhnDhGtiqkA/gKOZCr8KKfZWMg
         X27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kQTVpgP/B5sUzXX9siDUIJMUjDuWFevj+4LzLw1ZYRY=;
        b=BXQl70YaZOekRChDQuvEg5942YwHeHxZ7e90yfXRYxl5qIhiUriXhQ5z9YuIkTBH4Z
         +rv4hC7BMavkBmSqmiV+kbZXYc9NeE57hUVe4fqRewiCrOJ3Wr5SOI9uRJJQKcG1aUj8
         vU0Aj55MZkjPdDCqO6x6BF6qx0NRE3I5irrWPMJxuQulOGExs1MD7b3TciguEPX6iHhc
         YahbpKMnTnYr1LWHd6u+U+k06zFnIlgoeWsrqJuYbUXpz2JoBXhIucUPmaD9vOMg03f5
         S8V9m0ybmG4DckepQzQZe04bhacRVIQUaHE3rcMBucbC3nGs4JiCAouYIsLrEi2imZkB
         JV0w==
X-Gm-Message-State: ACgBeo00YjneIOqhcKpzgNDf7KX4W9S4CnxgCeT++J3ekjavuzqNxQUI
	EIvJQzCqeCuJaBROK2u4Apvs62AsCFY=
X-Google-Smtp-Source: 
 AA6agR6nLKSq1UYpSSrR8wMuTJPX8QBDSMeMcqTThUm1Fc5Pz8QZR6yItCNrIRZVd/9UUeNWHqPZ0Q==
X-Received: by 2002:a17:907:2bf7:b0:730:996d:5e8d with SMTP id
 gv55-20020a1709072bf700b00730996d5e8dmr13016752ejc.382.1659940970374;
        Sun, 07 Aug 2022 23:42:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 10/44] ffmpeg: update 5.0.1 -> 5.1
Date: Mon,  8 Aug 2022 08:42:03 +0200
Message-Id: <20220808064237.3975347-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:42:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169034

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...e-assembly-with-full-path-from-sourc.patch | 112 ------------------
 .../ffmpeg/{ffmpeg_5.0.1.bb => ffmpeg_5.1.bb} |   6 +-
 2 files changed, 2 insertions(+), 116 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_5.0.1.bb => ffmpeg_5.1.bb} (97%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch
deleted file mode 100644
index 7d0a06f85b..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 4a891e1eddbf63f32fe769b5bff289f6748abf45 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 10 Nov 2020 15:32:14 +0000
-Subject: [PATCH] libavutil: include assembly with full path from source root
-
-Otherwise nasm writes the full host-specific paths into .o
-output, which breaks binary reproducibility.
-
-Upstream-Status: Submitted [http://ffmpeg.org/pipermail/ffmpeg-devel/2022-January/291781.html]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- libavutil/x86/cpuid.asm      | 2 +-
- libavutil/x86/emms.asm       | 2 +-
- libavutil/x86/fixed_dsp.asm  | 2 +-
- libavutil/x86/float_dsp.asm  | 2 +-
- libavutil/x86/lls.asm        | 2 +-
- libavutil/x86/pixelutils.asm | 2 +-
- libavutil/x86/tx_float.asm   | 2 +-
- 7 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/libavutil/x86/cpuid.asm b/libavutil/x86/cpuid.asm
-index c3f7866..766f77f 100644
---- a/libavutil/x86/cpuid.asm
-+++ b/libavutil/x86/cpuid.asm
-@@ -21,7 +21,7 @@
- ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- ;******************************************************************************
- 
--%include "x86util.asm"
-+%include "libavutil/x86/x86util.asm"
- 
- SECTION .text
- 
-diff --git a/libavutil/x86/emms.asm b/libavutil/x86/emms.asm
-index 8611762..df84f22 100644
---- a/libavutil/x86/emms.asm
-+++ b/libavutil/x86/emms.asm
-@@ -18,7 +18,7 @@
- ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- ;******************************************************************************
- 
--%include "x86util.asm"
-+%include "libavutil/x86/x86util.asm"
- 
- SECTION .text
- 
-diff --git a/libavutil/x86/fixed_dsp.asm b/libavutil/x86/fixed_dsp.asm
-index 979dd5c..2f41185 100644
---- a/libavutil/x86/fixed_dsp.asm
-+++ b/libavutil/x86/fixed_dsp.asm
-@@ -20,7 +20,7 @@
- ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- ;******************************************************************************
- 
--%include "x86util.asm"
-+%include "libavutil/x86/x86util.asm"
- 
- SECTION .text
- 
-diff --git a/libavutil/x86/float_dsp.asm b/libavutil/x86/float_dsp.asm
-index 517fd63..b773e61 100644
---- a/libavutil/x86/float_dsp.asm
-+++ b/libavutil/x86/float_dsp.asm
-@@ -20,7 +20,7 @@
- ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- ;******************************************************************************
- 
--%include "x86util.asm"
-+%include "libavutil/x86/x86util.asm"
- 
- SECTION_RODATA 32
- pd_reverse: dd 7, 6, 5, 4, 3, 2, 1, 0
-diff --git a/libavutil/x86/lls.asm b/libavutil/x86/lls.asm
-index 317fba6..d2526d1 100644
---- a/libavutil/x86/lls.asm
-+++ b/libavutil/x86/lls.asm
-@@ -20,7 +20,7 @@
- ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- ;******************************************************************************
- 
--%include "x86util.asm"
-+%include "libavutil/x86/x86util.asm"
- 
- SECTION .text
- 
-diff --git a/libavutil/x86/pixelutils.asm b/libavutil/x86/pixelutils.asm
-index 36c57c5..8b45ead 100644
---- a/libavutil/x86/pixelutils.asm
-+++ b/libavutil/x86/pixelutils.asm
-@@ -21,7 +21,7 @@
- ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- ;******************************************************************************
- 
--%include "x86util.asm"
-+%include "libavutil/x86/x86util.asm"
- 
- SECTION .text
- 
-diff --git a/libavutil/x86/tx_float.asm b/libavutil/x86/tx_float.asm
-index 4d2283f..ea39f21 100644
---- a/libavutil/x86/tx_float.asm
-+++ b/libavutil/x86/tx_float.asm
-@@ -29,7 +29,7 @@
- ;       replace some shuffles with vblends?
- ;       avx512 split-radix
- 
--%include "x86util.asm"
-+%include "libavutil/x86/x86util.asm"
- 
- %if ARCH_X86_64
- %define ptr resq
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.bb
similarity index 97%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.bb
index dd14f8df6f..bb507b4974 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.bb
@@ -22,10 +22,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
-           file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
-           "
-SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
+SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
+SRC_URI[sha256sum] = "55eb6aab5ee235550fa54a33eaf8bf1b4ec66c01453182b12f6a993d75698b03"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
-- 
2.30.2


