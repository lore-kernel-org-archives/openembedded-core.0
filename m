Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E1BC433FE
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 18:58:22 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.1302.1643050702213249023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 10:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=awVM9HSJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so70313pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 10:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n0e6R+Eg+GhjMaGE2RrWeX2y4xcLeU9hCoObSMMFcbs=;
        b=awVM9HSJIe3z/lH4qYfxcnqlsbBxf3Gi9M5k9F6l7RXhnfvo0eFYJwo+fufuhfGu+O
         QuHLeeYzjCXc8bt8knUHmHF2Yi16Z5SbyEoKqQR0fsH1epFXWNZ4Qd5Ar2F0KkGz+Uq/
         KSxNxaxLFalrFcs7Hb/XmNNKjiP57dqrsV0vj0KlQHvhfADtdE8KUdVMLlQQgKKE633/
         UGKlIxyDrcBEMQ2XNUlOumMJ4RjkrZkBKuNzgdGV7srGH0BL6fKzt87BOrA+Hrdo7ch3
         hGYOJjGX5V9aW2lkhVGkzLWI+qPiYkvdeRFAYdRXVwoB8L8x5+TnFhZw3efwtQIF697D
         X3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n0e6R+Eg+GhjMaGE2RrWeX2y4xcLeU9hCoObSMMFcbs=;
        b=AVTU3FjIZ8qYp+IUlMsKUfkRs02JIpTL8PYDa7CJD5Au/h6Gcd/nvOxqixx2Bq0ut4
         K3+aMsBWIo03O/CaRPT4iDScSvtHxcOUTNv4qxLRq9GCFwypXf9E+WeDOGbboC50y6em
         tdmzxS6ysmqFVKDsxZ48EXCFd5uxkZihKr6Cea86kl4yuvOUNds/YxB/fbfUzJTkc6D0
         Sco+uxC1oGLrGYM7Tbmxyj31VdVtq6UxlJVT7pqir/tHSwhETTVwvveYRK8cl4GmQgr2
         LuU6friwgqSng0H5Q7FppxYl56fkEfL3CqM3Nkzh2454EdV10ksGwzULS2TFOBABrQPa
         XSXQ==
X-Gm-Message-State: AOAM530gWYtrUB4wB4LIXK7aDgt3Pb26VTnmh2kLMkUUWXUNF26f6qrO
	3X54iGg2g/huCIuVujjlRnQO4MFdTE/WcA==
X-Google-Smtp-Source: 
 ABdhPJwAhRw/pf7WiLGkw0oexD8+YeedrCD1TT8WN5S7qO2qxeJjV48SgS3KjuS+qrAbecHVPzqHJg==
X-Received: by 2002:a17:902:bcc8:b0:14b:14c8:e82c with SMTP id
 o8-20020a170902bcc800b0014b14c8e82cmr15055318pls.24.1643050701498;
        Mon, 24 Jan 2022 10:58:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id n11sm97945pjf.29.2022.01.24.10.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 10:58:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ffmpeg: Remove --disable-msa2 mips option
Date: Mon, 24 Jan 2022 10:58:18 -0800
Message-Id: <20220124185818.3038902-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 18:58:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160892

This is now deleted option in 5.0+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
index 4ba5ff45377..4ff7bebbc9a 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
@@ -126,7 +126,7 @@ EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa64r2', '--disable
 EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mips32r2', '--disable-mips64r6 --disable-mips32r6', '', d)}"
 EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mips32r6', '--disable-mips64r2 --disable-mips32r2', '', d)}"
 EXTRA_OECONF:append:mips = " --extra-libs=-latomic --disable-mips32r5 --disable-mipsdsp --disable-mipsdspr2 \
-                             --disable-loongson2 --disable-loongson3 --disable-mmi --disable-msa --disable-msa2"
+                             --disable-loongson2 --disable-loongson3 --disable-mmi --disable-msa"
 EXTRA_OECONF:append:riscv32 = " --extra-libs=-latomic"
 EXTRA_OECONF:append:armv5 = " --extra-libs=-latomic"
 EXTRA_OECONF:append:powerpc = " --extra-libs=-latomic"
-- 
2.34.1


