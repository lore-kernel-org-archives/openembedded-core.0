Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6E0C4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 22:30:14 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.3718.1666305008099971740
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Oct 2022 15:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SErECCzD;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id ez6so754869pjb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 15:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TLHfjrKi7EBMw5pTYzXxS4IARDYAHg0hp2sGSoJBt6E=;
        b=SErECCzDMNeO2TKo2Lfv7cMC2Y041t4q/zleLAkQNNH/bWy9x/ZlYjTb0NxjgQB9rD
         oKZeTKRCfr+j+1xjIBST6eMlMyzbeBPjwMa902WcmeiMHDPBRPKXUSgl5l1YIRIGAck3
         t6GzhB7s+Pfj4AIbhhdDxYgvxPNlh45EHceFLFyLqJJ1OvrxvmQ2nIqP0E7NSL22x/Y/
         3AhR6Op6w+KuKmRlT7QZkRBEeURt6uHYjkNK1Al5mvDwIbUy8VxoWSBXLJsq/UzKk7Tf
         reW1UdTuRxem7+wbmTQQ8IWEqF/VW7Jfx53j2lItBeMODmfpEOuSyRbEoGF2kR3Ru0kS
         C1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLHfjrKi7EBMw5pTYzXxS4IARDYAHg0hp2sGSoJBt6E=;
        b=fv4P3biZZzt3CU9aJ/4skirK+TS97kkIl13PSQ2cz+0NFz2DKPUSmF4vpG5YIRmIP0
         2YRj1xb647UQiZvMl8iAxQrghX+N7RGjyRdZSp8RoVXj00Ay6brCP/PEq84zZFUB6zjv
         kmMM6GzSALv8zQCAG6xD56k8ZLE9wWaD2nhZ65iSeQkc5zfCK9C0rQEXrEqp7FF/S92r
         VLEyPK8+IMmhz301rQ2SGWOxaJH7oMazI6WgTtAOtHZVXECmpmyAIiMSX/b7wmZJvptg
         MohBKVVoVmu4LiNw1c1GvM7W3s9PUnX/un37ki3KhG+bdUY9Hr5G74CeywEF8Awodnxi
         clbg==
X-Gm-Message-State: ACrzQf247bwFhj4aEWeVM5i0Hct/nOWHjgmDdgCqd0FZ4Lyf0kppODtX
	xgImXreWQHlcW0R2Anr1+iM6mK0K7UY=
X-Google-Smtp-Source: AMsMyM45jkdJ/m4XVbVdMze9jr98JRSxJu3OLnOKeLsqsKP1Zg8CqQ8h3J8wdwIkc3re/sGlwOXM/w==
X-Received: by 2002:a17:902:ce82:b0:185:47af:a0e8 with SMTP id f2-20020a170902ce8200b0018547afa0e8mr16114279plg.7.1666305007165;
        Thu, 20 Oct 2022 15:30:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::751e])
        by smtp.gmail.com with ESMTPSA id p1-20020a1709027ec100b00172973d3cd9sm13165701plb.55.2022.10.20.15.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 15:30:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rust: Disable 64bit atomics on crossbeam on riscv32
Date: Thu, 20 Oct 2022 15:30:04 -0700
Message-Id: <20221020223004.1665512-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 22:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172006

riscv32 builds fail since AtomicI64 is not available in sync::atomic for
this architecture. Therefore it needs to be opted out and the way out is
to pass it by RUSTFLAGS, however rust target recipe overrides RUSTFLAGS
before exporting it so its better to piggy back on the variable its
using which is RUST_DEBUG_REMAP

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/rust/rust_1.64.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust_1.64.0.bb b/meta/recipes-devtools/rust/rust_1.64.0.bb
index 1f9dbd3cce..b05f188d9c 100644
--- a/meta/recipes-devtools/rust/rust_1.64.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.64.0.bb
@@ -9,6 +9,7 @@ FILES:${PN}-dev = ""
 
 # Used by crossbeam_atomic.patch
 export TARGET_VENDOR
+RUST_DEBUG_REMAP:append:riscv32 = " --cfg crossbeam_no_atomic_64"
 
 do_compile () {
     rust_runx build --stage 2
-- 
2.38.1


