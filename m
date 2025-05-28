Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9832CC5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 18:28:30 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.2764.1748456906574373246
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 11:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ayl99hfc;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4774d68c670so1224621cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 11:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748456905; x=1749061705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovUsaQm7mPepkOQFW2G6XnP1Pi+400ZlwWT/Z6C0t/4=;
        b=ayl99hfcdGxUtX2Qk3/A+bCjX75ZNhn6O0+0v+smI5uJsnRbtuukSF16itrS8Iml7B
         j2ZVY/y7stDd8HiZhzfg4O4FnrZbF/Tejjlz524Qd8B79BnEqCKyfxbUqYIFFdXe4pDc
         9nT8iWQRt/Q9GyV9rqqEnGlmpTSg/3HJLP16Q77UXZFPmwDQdU/yHPRF7WQstO4oKvLd
         TchePe6mId3+yDiiImyVaRchg9kHgKWRd6OuhFOYSbF28ffQeXmD+EkWrXUrQNSwh4hJ
         5Yv4IamfuNcW/Hw3sdqzt3pjZWKWw4xC2yNo4HQce6pdqOOOSY71v/B0kX5XioE2tWSx
         DxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748456905; x=1749061705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovUsaQm7mPepkOQFW2G6XnP1Pi+400ZlwWT/Z6C0t/4=;
        b=D70mOU+CYtiRQImWA7NylV0G058Ek/XtNLXciOoRaCgPp+yKaXafIS5FxCKjqnibIP
         ta93Px3OPF+ys8SjzS0sSKygQshNx03ZX79LcOqdWI4rDs5z02CBUh4QRFQhlQB4cW3C
         3jwdvO1YH7YYCNwL5OvQ8HOU/PJQlCmhyr0gtvUYjz5VojHIGZ4a5uyqAFTK5G9M4YlW
         vsCBW3Zrbs8WbSgAPLmBJKJkTTZzuj2qt02RJMe7YrTu5q/pNw1E1HWIKLV82wsl2N2o
         6eDVUVn47nfYThXDZqorVoBvgFTyjHD/7O5PJ1BfNQEWs7PMfdofH+GaAFcYeL/ehB83
         E+0g==
X-Gm-Message-State: AOJu0YxCjU/y0Q4Lkc7OK+5TdxAv8XwLxy3JqgPXJGH6YzV/xONx/dD/
	BYbFa/iBl8uelpbY7IHK1mafP5zqhblOlm3Xq5XEWyccHvmOcOfmQUMbzUKg+pY4
X-Gm-Gg: ASbGncuJbASN9HowbeNY2bNbi2dbr0IKGrzU+pIdjxzl1pRuNSPNOMgkUv1ZfczRZxV
	Ue72VOJ5tYdHWvWwWetV//N5xwzdpOWwaNTPy2szyMb2hTaDBuXV/RTCXOuaBEscZyYidGQ35Ox
	f+maNIixukr5kqYrcm+ZJ61eY80G/y9Yjimom3BPfrOF2gs8SHu4ZL+e+zMWcXwHmwyXOsT2DYP
	grc4eSn4pK4LlNivIM+pP8M2iTX4bVHmO/ckN+YApIkSnEHlmqbWhbA2eT5I8vjyPbEBuYy9ZpL
	qqtJzGl5nFgN5QsT3V1g+2gr6oPGpPUTCXitrl/ekVXrI+NOntYFpzrvwEsvQwWjVlRvAVjdMQl
	q+hViz3240iPyYqObsFbCA3QDk/u0afMBgaGmGMNzJPM2btpsX0ve
X-Google-Smtp-Source: AGHT+IGg2nFIX1SMvDXGJ1TvA6iaCcjtFSjVVq0+dS+X/P0NHopusd0BcvW+Hq/8NkBqUctthN+YZQ==
X-Received: by 2002:a05:622a:429a:b0:497:7412:1174 with SMTP id d75a77b69052e-49f4624f30fmr334474471cf.11.1748456905356;
        Wed, 28 May 2025 11:28:25 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a3c80d4dd3sm8992151cf.54.2025.05.28.11.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 11:28:24 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/6.12: riscv config sync
Date: Wed, 28 May 2025 14:28:18 -0400
Message-Id: <a9decbdcfa110aec1c61ed83381d9147029ee0e3.1748456757.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1748456757.git.bruce.ashfield@gmail.com>
References: <cover.1748456757.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 18:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217382

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Khem Raj
    Email: raj.khem@gmail.com
    Subject: bsp/qemuriscv32: Sync config with upstream defconfig 6.12+
    Date: Tue, 20 May 2025 09:36:06 -0700

    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index c6be153d16..f2ab88bc55 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "9ee7ecfcabe12ffae693f11c83d8cf6d8181f12a"
-SRCREV_meta ?= "020a66c734ee618ed2b25a89102fd8de2ef98f9b"
+SRCREV_meta ?= "da71eb19ceab34a7a6ff4284f1580e043c870168"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index f81f20e74e..bf7c61415e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
-SRCREV_meta ?= "020a66c734ee618ed2b25a89102fd8de2ef98f9b"
+SRCREV_meta ?= "da71eb19ceab34a7a6ff4284f1580e043c870168"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index e1a7d05fbb..79fc65f826 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
 SRCREV_machine:qemux86-64 ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
 SRCREV_machine:qemumips64 ?= "e2f38ec1df747da895699dcb9955606e1a8d60da"
 SRCREV_machine ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
-SRCREV_meta ?= "020a66c734ee618ed2b25a89102fd8de2ef98f9b"
+SRCREV_meta ?= "da71eb19ceab34a7a6ff4284f1580e043c870168"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


