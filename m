Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4C0C77B7F
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 17:47:24 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.31328.1683913642002618115
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 10:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=l05uX2gj;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-643b60855c8so8252269b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 10:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683913641; x=1686505641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KY7dLg1SC20utfRR2unXiDgm5hUDVeetNGitVBRemWk=;
        b=l05uX2gjwImMnpOWOswyNblBOXhjFE9m2Qqf9WCmIp3HTP1QwlbkWGiaN03P915pug
         5EhKHg32DIvN39YfnwhHoGZ3QfikvjXXNfQIlcFiUEoSkt90oYCxEJqsh6EljKjoYMNt
         tXDKRS40GF030JRf1hN1+LWSTeOfjM8Yfk/x5TYF9hYFF37GX4AS5NXaQO7XebwFyGmO
         Ghf/k8RnV5aug3vdHO0mwzg8hB68877xvo9X2Xa9dJ8EiMW0frnppACD7gTOFy4OHvHy
         9jfLiNUrrjgmwBiZtk8hnw6IRZsemLoCterpuIl/DRB6Tzw0VjGvlxyEPWXpj+OS+BAP
         IEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683913641; x=1686505641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KY7dLg1SC20utfRR2unXiDgm5hUDVeetNGitVBRemWk=;
        b=LYpTJMpaDrdu8itW3K/AznbDsI2nppDR0kZxGe2jiTFYwkHzxIDPDL8efujWc9yIvF
         X331UnGhdgBRRrEXKwWYSeSBlIasAUZk4MAbdZFvBhcYCsbtBaDtAH2qSf6AP1HZC+vh
         dDuvbWikez58+gcIxyJLwV2rJq+4ulI9kwR5SsR6X8XNe/7nLbzpkmFld0+4FPtSKiWv
         KytCGu4T3iH66EfekoxM1NqdcTHwR43DRWrfHNhaSIjouPNbfCBx/ThrklDeGjjqQQBD
         Yg+wUNzDftpU7Kct4omR4oPjx8sdu24Q8FAhX15H+TxevBx0hq0cFMAtyIDAXjmAerDG
         14Cg==
X-Gm-Message-State: AC+VfDwHbKatEdLqDuoFxFjT99RDdp8ZZZ7NpKUkDXc/s5I1HC+oNM1y
	1Js6jH5TPs73CDnwVf0Vsmt19FaOmoRBAQ==
X-Google-Smtp-Source: ACHHUZ6eVbWXRc6P1hScwVBId/azhzt/PsvmtgjVHE68wZgYgkOjuO/FIOLdpNHABintqF4UpCfk9g==
X-Received: by 2002:a05:6a00:b8a:b0:646:2edb:a23 with SMTP id g10-20020a056a000b8a00b006462edb0a23mr25845337pfj.1.1683913640940;
        Fri, 12 May 2023 10:47:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id b26-20020aa7871a000000b00641114ef2dbsm7581558pfo.90.2023.05.12.10.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 10:47:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: Enable RISCV support
Date: Fri, 12 May 2023 10:47:18 -0700
Message-Id: <20230512174718.2937695-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 17:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181193

LLVM 16 should work well for RV32/RV64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index eb918383e6..71bc1a022a 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -10,9 +10,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=8a15a0759ef07f2682d2ba4b893c9afe"
 
 DEPENDS = "libffi libxml2 zlib zstd libedit ninja-native llvm-native"
 
-COMPATIBLE_HOST:riscv64 = "null"
-COMPATIBLE_HOST:riscv32 = "null"
-
 RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
-- 
2.40.1


