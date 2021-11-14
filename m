Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9787BC433FE
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 16:52:39 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.11137.1636908759182327247
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 08:52:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iVOYs2Dp;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id q126so12491051pgq.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 08:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KMzVbb07oAxPIDYpYBwRTGK8B91OPXW5kUPD8K/L3fM=;
        b=iVOYs2DpOPCU6Npy+QaFFctk2GQeaw/uO+SGEjQdvG2fBkawhn4ls+U/IpHfIIOTmr
         pVMuyEXVQ2RAwLWIC4nmybaf9sH6T+UE8u7kye5ErfvIe3511q1mWDc1IoTqlrw9PiMy
         nXj32uHxZiGs2az+ojJ5FG/joQdJO2S27oX/4TJbwQ0MOpYYwpl10bRg8gPtVRx9mb33
         rEMyvQDwF3BwixDcZJAnf498ysgW+vcOX7/ihrN9OpLnOipJ+e2T1R3eEIatP6bogiAH
         SwwZdTuXAZgXSh+NY0CnacF5CuEdSQ7gFUKU0zZCR5PmqqJKDbjqsmeew+VOC9T9Joie
         /A6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KMzVbb07oAxPIDYpYBwRTGK8B91OPXW5kUPD8K/L3fM=;
        b=5vTZAtZgyXMskpaVSaHGDMei6TwWcUlnUYcse8ZnhMfqP5VVPd5ZUPpJhWfURBiXsd
         M+ijzzu2V2cAS/Z8VF1i+EMLtbs4P1bPwCGpsEKHFDUjFMrIJ8YTIQ96j3OIdjcL4nwS
         14EBT3qa7O3NrfmMLjp0aOwa671dOFA2dYy5Q6CJnENuum5X18YlLRmIOKiBUB5WFuzg
         NLkFRdo02Jz/jQypFiyGeK1UHaiRNFAflAJ5AsfyMssaI3M1n3Zyf5aVH7H0ot81R7Sk
         Ru3InUuGWIj+lkoXwxiwxqCCOJYM/a4ymi0IvPKTnhoAJLH5wtrNApf1Xsrq2GN+PG1G
         5/Lw==
X-Gm-Message-State: AOAM531kYiPBdMw8xrOGHorTIPY3ZIFIKdzwc8W9sr6aGRqEch7QdHtY
	Q8JiIMGV4hJG/t/flYeZEAvLuahRlEww6Q==
X-Google-Smtp-Source: 
 ABdhPJw+IES9Z94YzacRwJcIP0a7v0lAhpYZIHmftIgOuqxYJ9QV/ryCAM4dWDaGV8xLQo+nzE7dfA==
X-Received: by 2002:a63:4f44:: with SMTP id p4mr12080023pgl.398.1636908758474;
        Sun, 14 Nov 2021 08:52:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 a8sm13395625pfv.176.2021.11.14.08.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 08:52:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] vulkan-samples: Enable for architectures where it builds
Date: Sun, 14 Nov 2021 08:52:35 -0800
Message-Id: <20211114165235.3053064-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114165235.3053064-1-raj.khem@gmail.com>
References: <20211114165235.3053064-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Nov 2021 16:52:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158261

With last upgade it has stopped working on arm/mips/x86/rv32
basically all 32bit architectures. Until this is fixed enable it
for architectures where its known to build now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 81d8c6faf91..1e45e9f04bf 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -19,7 +19,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
 
 REQUIRED_DISTRO_FEATURES = 'vulkan'
-COMPATIBLE_HOST:x86 = "null"
+COMPATIBLE_HOST = "(x86_64|aarch64|mips64|powerpc64|riscv64).*-linux"
 
 inherit cmake features_check
 
-- 
2.33.1


