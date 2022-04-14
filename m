Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEABBC48BD1
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.7214.1649904755288423401
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=de2tpdqs;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id f3so3649091pfe.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rl/hYsLITPT3qM5NT017wBMPNpQV31FZ5mq746YMfnQ=;
        b=de2tpdqsNDKj20LJA6FtY0YTincxXeh6CwMFzpSvsKLu1Fw4y6upuPLGzfvLsbEOlg
         keoh3Aoqg928698FxvriCyDFuL7wnwoP1V2Qqtw1lF0uJSq70MKYgWvUOwLIEbezgGEw
         wgRfh4oIfml1NMTkTzHCHWTdabVmxZGhXlUjsD6tq2PISu2beFnA5AGSmRiAgvgyW8cL
         u0VgwcaQs7gkZODG3RsWh2uoV4xC4YMLk04T/qlIPTi0y37xOoEV8arTf9iRk3n8itLF
         50EbJjlqtXL6ON4sj05A+R4EM4+kjO4lrGJuPx3CUFxsqu3UjA+qI0gPJ0ZOLYnwS046
         nNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rl/hYsLITPT3qM5NT017wBMPNpQV31FZ5mq746YMfnQ=;
        b=1YV7IQCyr4gF0Zw+8u0cRT/88N/pFG4qwZEGfZ6xea+P3zhWhMwKwv7M4ukkR08xLr
         MqmaA2ppG6A+XmH1niFUOsw/69WdsBh5RLTAjXM+44QzElU/yjsXbJ0TSxi7XpCGbsFq
         57gDOvFZmstChjZJIvp/E63vvJwadvYjIVbfCkDjRO5u0/vLEo2UOt1RVSWVNDvvqrFZ
         fM7oT3lNmBk4e75+Z9+A+Ps+sL/NNrOV3TmkctAQcjNjKX/pCy1gpSWSnt1tO2pG6Szy
         UwtP8oBqB8PSiMM2+6EJH91YEMfBpZJXDtkxZC2alL57QIcI3xzTLAySsXLzrA22KuZF
         5XUw==
X-Gm-Message-State: AOAM532QGnt3kPan/YgSxhEgiJRhYZWS/lvJ0HP5zD+LpZm5PiQAs+mV
	27WMNmvQlE8ITk0B531pGQeHd6o5mmBclQ==
X-Google-Smtp-Source: 
 ABdhPJyHRHTVPzbRQJvyULyuhuZXk7oj+GCncRx+14Tytvqy4WuInJx7pZ1z0Ic+Ze9gUKRCjnMWeA==
X-Received: by 2002:a63:3841:0:b0:399:26da:29af with SMTP id
 h1-20020a633841000000b0039926da29afmr526450pgn.489.1649904754655;
        Wed, 13 Apr 2022 19:52:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::4307])
        by smtp.gmail.com with ESMTPSA id
 81-20020a621754000000b005082073f62dsm453735pfx.12.2022.04.13.19.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 19:52:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/6] riscv: Add tunes for rv64 without compressed instructions
Date: Wed, 13 Apr 2022 19:52:25 -0700
Message-Id: <20220414025230.1166825-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164378

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/riscv/arch-riscv.inc | 2 ++
 meta/conf/machine/include/riscv/tune-riscv.inc | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index e5611a12a66..230a266563a 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -7,6 +7,8 @@ TUNE_PKGARCH = "${TUNE_PKGARCH:tune-${DEFAULTTUNE}}"
 TUNE_CCARGS:append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv64nf', ' -mabi=lp64', ' ', d)}"
 TUNE_CCARGS:append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32nf', ' -mabi=ilp32', ' ', d)}"
 
+TUNE_CCARGS:append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv64nc', ' -march=rv64imafd', ' ', d)}"
+
 # Fix: ld: unrecognized option '--hash-style=sysv'
 LINKER_HASH_STYLE:libc-newlib = ""
 # Fix: ld: unrecognized option '--hash-style=gnu'
diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index cc2896f277b..659801496c9 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -6,6 +6,8 @@ TUNEVALID[riscv32] = "Enable 32-bit RISC-V optimizations"
 TUNEVALID[riscv64nf] = "Enable 64-bit RISC-V optimizations no floating point"
 TUNEVALID[riscv32nf] = "Enable 32-bit RISC-V optimizations no floating point"
 
+TUNEVALID[riscv64nc] = "Enable 64-bit RISC-V optimizations without compressed instructions"
+
 TUNEVALID[bigendian] = "Big endian mode"
 
 AVAILTUNES += "riscv64 riscv32 riscv64nf riscv32nf"
@@ -31,3 +33,9 @@ TUNE_FEATURES:tune-riscv32nf = "${TUNE_FEATURES:tune-riscv32} riscv32nf"
 TUNE_ARCH:tune-riscv32nf = "riscv32"
 TUNE_PKGARCH:tune-riscv32nf = "riscv32nf"
 PACKAGE_EXTRA_ARCHS:tune-riscv32nf = "riscv32nf"
+
+# no compressed
+TUNE_FEATURES:tune-riscv64nc = "${TUNE_FEATURES:tune-riscv64} riscv64nc"
+TUNE_ARCH:tune-riscv64nc = "riscv64"
+TUNE_PKGARCH:tune-riscv64nc = "riscv64nc"
+PACKAGE_EXTRA_ARCHS:tune-riscv64nc = "riscv64nc"
-- 
2.35.2


