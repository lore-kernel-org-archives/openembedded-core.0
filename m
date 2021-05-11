Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.6452.1620695465188973414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 18:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L92i0vgc;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id m190so14631121pga.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 18:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r0iyPHfLLgfX136DdKv8MvLMjK5wc9FTY0r2W0gKJJA=;
        b=L92i0vgcNMkys4uuLOFfEsgalvAwELMbPTRZ4B21yp9HrmAIr4cLEdrSG6DJ/ysgyu
         pflVs2ABJEDC+s/sksKptiKkenv5BLTs8R09oej+Kwi6mcLBWqrpKZ/bpZERvXPwkEI8
         NNlEMJEjvZOtBFjRfhUme0q7maRWaxSkt/4ug1Zc8m9sQ2abkPUJOVv4kKrMSsxIns+F
         v+8SBKakxc2DduoKxSKFqrSVSafkdD7iCpWiMxcB3j6SJipf6teurTT/b5UBsinI4LVT
         AdGOCtcb2/cjOtFtkNNSdAG5YXcBHl4UUMudQkEeMYw9DsXaeYOidSYX6ffwuaFPj573
         WD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r0iyPHfLLgfX136DdKv8MvLMjK5wc9FTY0r2W0gKJJA=;
        b=V1NGPq/3YAwnfpciX0zA095G3ogC92+ImIxbL0Sle4ulrxOvZrNqSsp43DTxbTnDMh
         zqm335m6nYZYeiaigtdGokWSWiPjW7eO1SikUYsamQuA5hosGnGP6f/bACjAfUYr8Hlt
         zZazRqFFMjRW4U5EgSDNNEC9CH1wf7RM825lrH+RLU3Jj1hFhsAQxvHaResLr9cVLIR0
         Z2ebigQfyatPqwotqm+kOrIuIA4WLpE+hXgBCxDhTCpw2sNOy8gUujgDfLK5tpMqeA5H
         uEm0Mh+QGydYY5JzzKkju60ZfFRaqYCHPxdMIhM+Zl6DecJJ2s3GuYpMD08XHx0RtLKS
         L4nA==
X-Gm-Message-State: AOAM533JBwd/PXg5FAXqZMu4Wfs8G7jTO0/6KZvLdTBbLqdTtPeEvBif
	nNkclnCe/U9Czxma/r4Au0yTUyiQH92iWQ==
X-Google-Smtp-Source: ABdhPJyYM97XrCozdGt5rGXzKItk7PAM2o6dK6QctdVDf3KAWh9t5YQhBpYrcfRiQWBmOjUou/crTg==
X-Received: by 2002:a62:2901:0:b029:28e:ef3d:10d2 with SMTP id p1-20020a6229010000b029028eef3d10d2mr26967791pfp.45.1620695464127;
        Mon, 10 May 2021 18:11:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id l10sm11785047pjy.42.2021.05.10.18.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 18:11:03 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] ffmpeg: Fix build on mips
Date: Mon, 10 May 2021 18:11:01 -0700
Message-Id: <20210511011101.1859568-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

configure is not able to decode, right options to compiler, it needs to
be set according to default tune manually. Fixes build issue on mips
e.g.

 {standard input}: Assembler messages:
| {standard input}:2162: Error: opcode not supported on this processor: mips32r2 (mips32r2) `dmult $22,$22'
| {standard input}:2164: Error: opcode not supported on this processor: mips32r2 (mips32r2) `dsrl $5,$5,32'
| make: *** [/mnt/b/yoe/master/build/tmp/work/mips32r2-yoe-linux/ffmpeg/4.4-r0/ffmpeg-4.4/ffbuild/common.mak:67: libavcodec/aptxenc.o] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb | 22 +++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
index 19a8e58370..384e07362a 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
@@ -103,15 +103,15 @@ EXTRA_OECONF = " \
     \
     --cross-prefix=${TARGET_PREFIX} \
     \
-    --ld="${CCLD}" \
-    --cc="${CC}" \
-    --cxx="${CXX}" \
+    --ld='${CCLD}' \
+    --cc='${CC}' \
+    --cxx='${CXX}' \
     --arch=${TARGET_ARCH} \
-    --target-os="linux" \
+    --target-os='linux' \
     --enable-cross-compile \
-    --extra-cflags="${CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
-    --extra-ldflags="${LDFLAGS}" \
-    --sysroot="${STAGING_DIR_TARGET}" \
+    --extra-cflags='${CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}' \
+    --extra-ldflags='${LDFLAGS}' \
+    --sysroot='${STAGING_DIR_TARGET}' \
     ${EXTRA_FFCONF} \
     --libdir=${libdir} \
     --shlibdir=${libdir} \
@@ -121,6 +121,14 @@ EXTRA_OECONF = " \
 "
 
 EXTRA_OECONF_append_linux-gnux32 = " --disable-asm"
+
+EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa64r6', '--disable-mips64r2 --disable-mips32r2', '', d)}"
+EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa64r2', '--disable-mips64r6 --disable-mips32r6', '', d)}"
+EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mips32r2', '--disable-mips64r6 --disable-mips32r6', '', d)}"
+EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mips32r6', '--disable-mips64r2 --disable-mips32r2', '', d)}"
+EXTRA_OECONF_append_mips = " --extra-libs=-latomic --disable-mips32r5 --disable-mipsdsp --disable-mipsdspr2 \
+                             --disable-loongson2 --disable-loongson3 --disable-mmi --disable-msa --disable-msa2"
+
 # gold crashes on x86, another solution is to --disable-asm but thats more hacky
 # ld.gold: internal error in relocate_section, at ../../gold/i386.cc:3684
 
-- 
2.31.1

