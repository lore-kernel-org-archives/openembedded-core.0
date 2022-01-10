Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD332C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 10:38:51 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.29865.1641811131118380779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 02:38:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iW6uZ5NN;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id 78so2259300pfu.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 02:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a7WiQBnHjfBzs6LpMlS1SBcJpqapSuIvR1BVkB7+xMw=;
        b=iW6uZ5NNdj2OBcT/oWfq+jeDsSasW/lmjBqR8k+dwiHQ4u01gOkuvxy07gDEYfoop7
         STwVS3+XaaoWDbAOuWd7lIpYIDqixUrr8zH47NCYGGnxLx27b+7NNG4vVwDJU+YsOJM+
         rJc5mg9A6qHG9AF+5AO+qPdwzeSW+8+eRaRtB2lPD6yTH3f04fZhmjNgZm68/8sdsJHj
         WRQcbXZX07SPHs8iZsxDjhSGLEk/ktCeeiMAS2+kfH1W7x9IYhGY1Efs0A1jzu0CH0RH
         iy15wozGuD6aMxfvuAdW3EGSGC+Jk4ZrRMPAVtRIfKEMeFxE+eggmIwWBrSt3dn0cq+Z
         Q45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a7WiQBnHjfBzs6LpMlS1SBcJpqapSuIvR1BVkB7+xMw=;
        b=IfX7VT0teo95TD0Cij3zGMR1vi+4WI+YNhBjPsm657cVBbJwtcf6m7pE9edh0HyCD1
         2TYYtwcCKq2HmMixMfpPSwslUnq7xmZ5fDfId9y9xaTCl57mHs8g6AFVVNfDAs8h0t0v
         1xOOmHMficNAGhd/omjKNAn95dZlPNu1+bBQI5kZgmXaG2lgiiXZEw6k6qCLaQ+4OLrI
         35M1bd7xl8FePRQ1BP9cEB9GcPcJimurTlhL8KoXeazSwfDFreeEp0xgG1g5C0nNjEqx
         KBnHim8mSzScVodC+xup6iTKvLsRSWB59mUwtdUK8xTRUGwe/eVwQC6YGMOAhiYlTfqJ
         6EwQ==
X-Gm-Message-State: AOAM5312P4QUED7EzGtBt6noAZ3TisIF6EBeQBUWM2fYbWpL1S13iUkp
	cuGLgp8ktA2uPoUZVkFgprWAkLFY+iVjcg==
X-Google-Smtp-Source: 
 ABdhPJzvsXn77435A8+gDGbjtHgDI0qWm5QoEdPylp0LpCCYzqz5/Y7M0MYFp4CugtTY7cJWv+9U1w==
X-Received: by 2002:a63:8a49:: with SMTP id y70mr3821051pgd.385.1641811130481;
        Mon, 10 Jan 2022 02:38:50 -0800 (PST)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 u8sm6450539pfi.147.2022.01.10.02.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 02:38:50 -0800 (PST)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [hardknott][PATCH v2] Add ARM support for Neoverse N2 CPU
Date: Mon, 10 Jan 2022 02:38:47 -0800
Message-Id: <20220110103847.5601-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 10:38:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160342

This patch backports the Arm support for Neoverse N2 CPU.

Upstream-Status: Backport
[https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=d7e8411f6a333d4054894ad3b23f23415a525230]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-10.2.inc                           | 1 +
 ...verse-n2-support.patch => 0038-arm-neoverse-n2-support.patch} | 0
 2 files changed, 1 insertion(+)
 rename meta/recipes-devtools/gcc/gcc/{0038-aarch64-neoverse-n2-support.patch => 0038-arm-neoverse-n2-support.patch} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools/gcc/gcc-10.2.inc
index 656c43258c..e7e3395c55 100644
--- a/meta/recipes-devtools/gcc/gcc-10.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
@@ -74,6 +74,7 @@ SRC_URI = "\
            file://0002-CVE-2021-35465.patch \
            file://0003-CVE-2021-35465.patch \
            file://0004-CVE-2021-35465.patch \
+           file://0038-arm-neoverse-n2-support.patch \
            file://0039-arm64-neoverse-n2-support.patch \
            file://0001-CVE-2021-42574.patch \
            file://0002-CVE-2021-42574.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0038-aarch64-neoverse-n2-support.patch b/meta/recipes-devtools/gcc/gcc/0038-arm-neoverse-n2-support.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc/0038-aarch64-neoverse-n2-support.patch
rename to meta/recipes-devtools/gcc/gcc/0038-arm-neoverse-n2-support.patch
-- 
2.31.1


