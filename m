Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C0AC001B3
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 18:38:53 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.41192.1688409531818167463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jul 2023 11:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=a0O+QY88;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b89d47ffb6so4576205ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 11:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688409531; x=1691001531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CK9k69JMxl4U2dFG8V9suNefyEdqEpheTmk+vCY50FU=;
        b=a0O+QY88b/Tp2lFEfWAWCXKOBYIUYWPRrpB5krwaWLoVgeykzy8ewDn6twicg6Uv1J
         LQAlCjkf2hr1ahr64G4r92hTizQhXsPP0CnaNEcGpWwoW4HtlFB3mM5r4vTSa0P6y47Z
         1DIILhLfMvjKoffeH+f55qshXtndeSqLYJkvwvcDir0hcR0AaspRb2YsBJWvrCNp17wq
         PxfKrU+BuI7VxZ7LnbBD6UW9nVGFj6Un4/8JLz4ETp/sVWRxRnHXYBIojYcr2PYQAnxt
         YAxg14R8CmJ4UNMOmg2gYCdO/CpdrClhmsgtVk1t75JK8kx05kBYgdtsbCFGCW9Ewak+
         frXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688409531; x=1691001531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CK9k69JMxl4U2dFG8V9suNefyEdqEpheTmk+vCY50FU=;
        b=EZ9uixeOXIvlpTgHwdaRFqPGZUN0HvqytL8H3rKa4Iy1IZoeVwDchQOCdCrvKPPbrM
         yOzkEWwPPV4hhb8vFZVU4SpWaBxaNhVK0zxy3Ftts1QfCMzVBcrkBULs3WAxHMn8jZDI
         XZVylALmLXvu4unol+j+ROVZhoOXoswQvkFAkYd4+clCaFsKB6qKHmZvURUKIl63+IY2
         yxBUZSpwc8pyOkiWO38nVP7vkkD8uPBKBQg/6WlfJBqc50W1TvAeRce3FfMO2MFzllVR
         CN2ve52DnuzxBSLRNMgJBnHdxDZ0Zkg2Ydfl5M/a6Xty+XzWQuwyU99dEM1DCoz0CIS3
         mp2A==
X-Gm-Message-State: ABy/qLaPlsc+8blmcaGcjXjVZVZZ/MhDiYd8rI8l1hdrxQhclMwOVKmK
	iRZ/3ZeqGCbEhHZkrPwn/Mlt8uafDww=
X-Google-Smtp-Source: APBJJlG2/unudVD7Mxam+IvS97mv8bt0NFWR/PZgApmdo9AOyK9rEJXaKqhqNdORfjFJTG0WK91ZEw==
X-Received: by 2002:a17:902:8212:b0:1b1:753a:49ce with SMTP id x18-20020a170902821200b001b1753a49cemr7835593pln.53.1688409530886;
        Mon, 03 Jul 2023 11:38:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::fcf3])
        by smtp.gmail.com with ESMTPSA id jj11-20020a170903048b00b001b80e07989csm12680807plb.200.2023.07.03.11.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 11:38:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] webkitgtk: Enable JIT on RISCV64
Date: Mon,  3 Jul 2023 11:38:47 -0700
Message-ID: <20230703183847.27993-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 18:38:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183809

Its supported in 2.40+ release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.40.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
index ac6681a0ced..b0dd95b78fc 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
@@ -109,7 +109,7 @@ EXTRA_OECMAKE:append:powerpc = " -DUSE_LD_GOLD=OFF "
 
 # JIT and gold linker does not work on RISCV
 EXTRA_OECMAKE:append:riscv32 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
-EXTRA_OECMAKE:append:riscv64 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
+EXTRA_OECMAKE:append:riscv64 = " -DUSE_LD_GOLD=OFF"
 
 # JIT not supported on MIPS either
 EXTRA_OECMAKE:append:mipsarch = " -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON "
-- 
2.41.0


