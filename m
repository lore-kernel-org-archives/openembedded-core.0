Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11708C77B61
	for <webhook@archiver.kernel.org>; Sat,  8 Apr 2023 20:19:09 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.5174.1680985145414234465
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Apr 2023 13:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g1tH+nbV;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 60-20020a17090a09c200b0023fcc8ce113so4023948pjo.4
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Apr 2023 13:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680985145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Wj7ZhUtv4rjQmMLzU2NLZpdiRWNOtBBsYvuCUEePCY=;
        b=g1tH+nbVM7BZ1lguQ20j1/UDStA+33vqdjLTpaNiq+JcbBhKUlchHecUXGNUnieYLE
         lvsB5Gp/2ro8+eG6mlyQfmVSjaL43IhNlPis40eR43vEuRW1SO69Jj54No/VnoqqziAn
         6o+B+NMk2ucK3OX3KWGh+fBrAkCClI3x3ZrmDXcNWM9+lagDgHG/Z3xL3HhZ70zesm1T
         tvxAOHarcT+5G8ZWom9Whdi1kJXA3x6V4AF8CAYcva8fpmuLxmKBEh8Gzw47YbLYnGAQ
         ipCH4y0zz1kUNFV+nButQwu2pVoXZagCz/uKhTZoXrDct9YuCbZZR35It2vOPq0vd4G0
         LZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680985145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Wj7ZhUtv4rjQmMLzU2NLZpdiRWNOtBBsYvuCUEePCY=;
        b=AeExwV/JJ/twjgprdj7QreaB0TnmZEeGG917u9CqhfD4JH+uPPMYSocY4+vKdPLefB
         6++dpL+pndisW/7YfAu56MrO3XOp8YLSUpX9VkCChItsQAC3AJ1+i4T4RufkbDF+2ZE5
         pxFPcQmkMT67LNcAadTfSurmq49UBExoUs6GV+15qEFuPJAFglm+v0UU9Lc+dQH2ZVEg
         Vgoa3Lb4i9XlVhTkYwOItcE5p09/i6vwVzghHPs8vjN7U2AsN40QQsNyJOr2VCGArrn+
         uvE8hLjRcdKMp+PRwt3MnTwcanyWmiEF1+0DF+aAfknSnzN7OBxTms5goURSfe+xfRzp
         8FNw==
X-Gm-Message-State: AAQBX9eS0OUqhz8DVb77RNf+5HwFR2ogYSGhvgaJJUo8n24wrCC8xLgw
	biFsSiA3OyTAwwwFk6dUuUe2ttbhRIGuCg==
X-Google-Smtp-Source: AKy350aLPp8sRG+4qtLjy6QquWz5f+XjVpkc+SfQ6jT/o+SCRvxGprCxpsT3ZPjtLDUogCDeaxBUBA==
X-Received: by 2002:a17:90b:1bc1:b0:23b:bd09:7f0b with SMTP id oa1-20020a17090b1bc100b0023bbd097f0bmr7468398pjb.30.1680985144303;
        Sat, 08 Apr 2023 13:19:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id g6-20020a17090ac30600b00233b196fe30sm2895271pjt.20.2023.04.08.13.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 13:19:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] ffmpeg: Disable asm and rvv on riscv32
Date: Sat,  8 Apr 2023 13:18:59 -0700
Message-Id: <20230408201900.485080-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Apr 2023 20:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179831

ffmpeg 6.0 has added assembly routines which uses rv64i ISA
unconditionally, ideally it should check for ISA before using those
instructions.

Fixes errors like
<instantiation>:1:1: error: instruction requires the following: RV64I Base Instruction Set
ld t0, (a1)
^
src/libavcodec/riscv/pixblockdsp_rvi.S:24:1: note: while in macro instantiation
.irp row, 0, 1, 2, 3, 4, 5, 6, 7
^
<instantiation>:3:9: error: instruction requires the following: RV64I Base Instruction Set
        sd zero, ((0 * 16) + 0)(a0)
        ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
index e4a4a0effa..7db43a8281 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
@@ -126,7 +126,7 @@ EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mips32r2', '--disable-mi
 EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mips32r6', '--disable-mips64r2 --disable-mips32r2', '', d)}"
 EXTRA_OECONF:append:mips = " --extra-libs=-latomic --disable-mips32r5 --disable-mipsdsp --disable-mipsdspr2 \
                              --disable-loongson2 --disable-loongson3 --disable-mmi --disable-msa"
-EXTRA_OECONF:append:riscv32 = " --extra-libs=-latomic"
+EXTRA_OECONF:append:riscv32 = " --extra-libs=-latomic --disable-rvv --disable-asm"
 EXTRA_OECONF:append:armv5 = " --extra-libs=-latomic"
 EXTRA_OECONF:append:powerpc = " --extra-libs=-latomic"
 
-- 
2.40.0


