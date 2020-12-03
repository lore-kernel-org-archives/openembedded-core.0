Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.9900.1607002662595026247
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 05:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y6+sOvEF;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id f23so3482252ejt.8
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 05:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q6PMeZP9X7Gvi7HAhuQ4StGYTp/eZ8AwREfddWCRmbk=;
        b=Y6+sOvEF55A4Ry28FcnGmLoIwWZAXJdnigCnci02nNTuJrC7HxuYlDb+1aHi6WqMoS
         dCUSmRixgM2mxc2mylgw52YO6Jic1yO0ULPQySn4tOYqx7WVxZvqxyOfUHysDr4/sXbm
         a2wcYVbOFRvocLzWJ297l+gUoc0FC/HiBaScD2OI5agKZeIHJi35egt3OHhAcnfOMnpp
         QG+QPZ9nOrYlyBmcfh5PGTt6xhshyKgU2hgn57kPJVSYgYwJeV9ti2Qjvcb8m5WKXtYY
         ZPePXKyW5mLGxnnjNKI/tXUAHj7A49YHLCVUKQv2clTZVll6n0naAea6xatGHugLcg+r
         Dqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q6PMeZP9X7Gvi7HAhuQ4StGYTp/eZ8AwREfddWCRmbk=;
        b=avZCV/AKFUoyG4CjWLT9bCcYdmserP6qR7Dv/GNb6735PieEE6jFtrfMtHxJcpliFK
         D2rwRpc/2zBroArhMr4bJHJOOZkKBH0p7aMgD8o1vghdeActtEpCgQNIJNf4xzh/b1xb
         2qgzIgkwuyBEFIcQrvQz0MRZ8KQdx2dJAqscCZufj4bvD5htL12o9vWUZIZOh8DgsRIp
         qoT0D88wLbdQUn9viAQbJwsOrMGq/Msq0GdZ46Z5q1wmhO8GU1woH7Scp+m0Ja4DJuJn
         +WPLkv25KD1iFgU5+v7CRGrCL/95atXxP1w5oPXyysmYwu/V8sana1ulmhyL9cbR7r6q
         9nZQ==
X-Gm-Message-State: AOAM530g5iodGXaUQvUgzStUMeszAgGrskoMPFTkj9o/qJYd7k0JoH1O
	iqmonvi1PygCEFT8h83/G3xTAQSeHfrG8w==
X-Google-Smtp-Source: ABdhPJyNWPc6i3kAgzSEpFgi+USgXAp5DhF4WKuPOPlHWLUusw7Tw1hjbU6Wiepdu8MpDPyVdt4fFg==
X-Received: by 2002:a17:906:b851:: with SMTP id ga17mr2466658ejb.386.1607002660684;
        Thu, 03 Dec 2020 05:37:40 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id ng1sm77130ejb.112.2020.12.03.05.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 05:37:39 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/11] ffmpeg: fix reproducibility
Date: Thu,  3 Dec 2020 14:37:22 +0100
Message-Id: <20201203133727.12936-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203133727.12936-1-alex.kanavin@gmail.com>
References: <20201203133727.12936-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...e-assembly-with-full-path-from-sourc.patch | 97 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb |  6 ++
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch
new file mode 100644
index 0000000000..3b503c49c9
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch
@@ -0,0 +1,97 @@
+From 24a58d70cbb3997e471366bd5afe54be9007bfb1 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 10 Nov 2020 15:32:14 +0000
+Subject: [PATCH] libavutil: include assembly with full path from source root
+
+Otherwise nasm writes the full host-specific paths into .o
+output, which breaks binary reproducibility.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ libavutil/x86/cpuid.asm      | 2 +-
+ libavutil/x86/emms.asm       | 2 +-
+ libavutil/x86/fixed_dsp.asm  | 2 +-
+ libavutil/x86/float_dsp.asm  | 2 +-
+ libavutil/x86/lls.asm        | 2 +-
+ libavutil/x86/pixelutils.asm | 2 +-
+ 6 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/libavutil/x86/cpuid.asm b/libavutil/x86/cpuid.asm
+index c3f7866..766f77f 100644
+--- a/libavutil/x86/cpuid.asm
++++ b/libavutil/x86/cpuid.asm
+@@ -21,7 +21,7 @@
+ ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ ;******************************************************************************
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ SECTION .text
+ 
+diff --git a/libavutil/x86/emms.asm b/libavutil/x86/emms.asm
+index 8611762..df84f22 100644
+--- a/libavutil/x86/emms.asm
++++ b/libavutil/x86/emms.asm
+@@ -18,7 +18,7 @@
+ ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ ;******************************************************************************
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ SECTION .text
+ 
+diff --git a/libavutil/x86/fixed_dsp.asm b/libavutil/x86/fixed_dsp.asm
+index 979dd5c..2f41185 100644
+--- a/libavutil/x86/fixed_dsp.asm
++++ b/libavutil/x86/fixed_dsp.asm
+@@ -20,7 +20,7 @@
+ ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ ;******************************************************************************
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ SECTION .text
+ 
+diff --git a/libavutil/x86/float_dsp.asm b/libavutil/x86/float_dsp.asm
+index 517fd63..b773e61 100644
+--- a/libavutil/x86/float_dsp.asm
++++ b/libavutil/x86/float_dsp.asm
+@@ -20,7 +20,7 @@
+ ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ ;******************************************************************************
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ SECTION_RODATA 32
+ pd_reverse: dd 7, 6, 5, 4, 3, 2, 1, 0
+diff --git a/libavutil/x86/lls.asm b/libavutil/x86/lls.asm
+index 317fba6..d2526d1 100644
+--- a/libavutil/x86/lls.asm
++++ b/libavutil/x86/lls.asm
+@@ -20,7 +20,7 @@
+ ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ ;******************************************************************************
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ SECTION .text
+ 
+diff --git a/libavutil/x86/pixelutils.asm b/libavutil/x86/pixelutils.asm
+index 36c57c5..8b45ead 100644
+--- a/libavutil/x86/pixelutils.asm
++++ b/libavutil/x86/pixelutils.asm
+@@ -21,7 +21,7 @@
+ ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ ;******************************************************************************
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ SECTION .text
+ 
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
index 72c2fe16ec..97b2d21d31 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
@@ -26,6 +26,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            file://0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch \
+           file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            "
 SRC_URI[sha256sum] = "ad009240d46e307b4e03a213a0f49c11b650e445b1f8be0dda2a9212b34d2ffb"
 
@@ -130,6 +131,11 @@ do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
 
+# patch out build host paths for reproducibility
+do_compile_prepend_class-target() {
+        sed -i -e "s,${WORKDIR},,g" ${B}/config.h
+}
+
 PACKAGES =+ "libavcodec \
              libavdevice \
              libavfilter \
-- 
2.29.2

