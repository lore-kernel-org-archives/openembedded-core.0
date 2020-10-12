Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.32737.1602472821046113296
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2020 20:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=vyb193Eb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id y198so16652209qka.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2020 20:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EY+UcymiPNcj4r6yYLGmUH6XBRSj0Abp7xROq9VgSi4=;
        b=vyb193EbglN1iDLCaQHAmdLw+XwcsNSbvnBm2o6swclxYw1P/t7wDpHw5VR8iSiv0Q
         4UOgiaGf09c9ceiUugLWi0eJTWGf2F50ZI3CMNB1NRsFmEZJkIj1kznUWIyrgtIw96fe
         eIKC922FOJ32rVdKMHw2BnLeGaeR7y9D8dE9/6rfXcgpBPqbbIWd8W5XynGGa/sY9j7G
         u6JsqhfeX7kbigYvWjJysx/Pm9MoRy/+lU2wlp0BAf4JcoV2c5RljArn5Ion4SLlZ6eO
         J4VOJQIyN0Pzab08a5KoF4MrK9tFUxTg2Jtux8D2dg3QcOFLj7MTNE2+K9eD94oywWgX
         jd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EY+UcymiPNcj4r6yYLGmUH6XBRSj0Abp7xROq9VgSi4=;
        b=CKeawTAlO0nFBep2RfoZQOX+irg+F70DuHHJnfAIAkskfahpQaFA1CN9WxOctNZabi
         I6ohktKpavs6l6f0EAizYd5ceUfVOvWvnVIhYeuW4wFUXxmOFBTTfyl3rr0YLeWntW9g
         sT188MpWjyFUTWvejOiesAtTpUobTlqSSQERX6/ufidLzMyChihAtVx7m3T528k2nRs3
         QJ4qJbjPlaYJ4fciYJhPlPvBMyCJ6NuZuWeYZZWIrvml94kAci97T8NQ3/rDXtKo8WEL
         YgpJ3Gv18JX5nyi8AuahZ2MNf/40qRhES/YFKRcB4DUargeXfyqDGYrjk26UPKGrvfre
         w44w==
X-Gm-Message-State: AOAM533HLiPMLuJMStslLfllY2j6nzqcpTr1U2KUDSBx699t7hsk6VBG
	1pyfCAs8DbO16mq7p7Eq77Of9u+zxESLtma/
X-Google-Smtp-Source: ABdhPJx0gvGPcpI975zOoheZN5gzcBX3pKMod3q9GXd52Btj9fFhJRkWqkQcHfGxVUvFIFBn9TIcUw==
X-Received: by 2002:a05:620a:10b7:: with SMTP id h23mr7848645qkk.132.1602472819942;
        Sun, 11 Oct 2020 20:20:19 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id w40sm8533159qtj.48.2020.10.11.20.20.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 20:20:19 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH] tune-cortexa32: fix cortexa32 tune
Date: Sun, 11 Oct 2020 23:20:17 -0400
Message-Id: <20201012032017.25676-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cortex-A32 is 32bit only, but the recent changes had it working as
64bit (causing build breaks).  This reverts that change in this file.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/tune-cortexa32.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-cortexa32.inc b/meta/conf/machine/include/tune-cortexa32.inc
index a11ab7bb0052..e86de6ccb7a4 100644
--- a/meta/conf/machine/include/tune-cortexa32.inc
+++ b/meta/conf/machine/include/tune-cortexa32.inc
@@ -9,7 +9,7 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa32 cortexa32-crypto"
 ARMPKGARCH_tune-cortexa32             = "cortexa32"
 ARMPKGARCH_tune-cortexa32-crypto      = "cortexa32"
-TUNE_FEATURES_tune-cortexa32          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa32"
+TUNE_FEATURES_tune-cortexa32          = "armv8a cortexa32 crc"
 TUNE_FEATURES_tune-cortexa32-crypto   = "${TUNE_FEATURES_tune-cortexa32} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32"
 PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto"
-- 
2.20.1

