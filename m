Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D65DC2FC3F
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 14:23:59 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.188750.1692282236889681661
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 07:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=nzcTwUXl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.179, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-58df8cab1f2so8259227b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1692282235; x=1692887035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+nalBiQlDO0ajrzDtstjVTSgBoiIUv6XnswqgrZey3I=;
        b=nzcTwUXlr1SE9bg1tKKBtY7SSUTRfDPTzlmiWkz3iBsVfVWeUS/BlKE/7DzKu/3Q7m
         FqecIh/7PWGU8VWyiGxeEUEmnwUM7A8x4tDjiW1mFDh3pzwTpM64kjdt8BbSRbxQr2en
         OOjMXr8j/kSpopZ2DVW4hvMSHKKYb2WhrbOv84Idw4tGtGtN3euvHV0ul9QkZ0p5g1ZH
         QpYHlb0dAXVXcOyhxtSmKpD90rIw7LJ3puPW5/hPDoKRntnpXZq42RDOrE8ORyiy5CDz
         lP6UpvHSy8wUFMkoWfQTtVUULqQCt6F8w96nvuHJf3dJGcX7QWFSEiaoDJSoZw+u4pP6
         Q1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692282235; x=1692887035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nalBiQlDO0ajrzDtstjVTSgBoiIUv6XnswqgrZey3I=;
        b=e1JglRWN65b89LYgfNMbU00IauyGXBlcflzw9u9j9MHgjzA8ov6BIChivy/1OlZn2R
         6M45c37BBAcRwyc51G/znxg1vYGvR+GAkGEVKyI5ERsjeecnTkfYxrUV5IuZ0vn6NpxL
         jW87ar0DANMik49nSbVzXihHRcPCSXxS6BRRU+Oh981wFBzYtwbX5e75SCXAv2YtWdp0
         9ioMDUb+e6cOgHee+os9sVOjmr1B0sd6GuJ/oHD02xhis2TzkvU2RUHq3vSZADiw0yIz
         PcW9NHlyIPmy12z3NXuFvTMXAZoVL3MgGq1/2gckOYOPQG9cBAGl5G/kxcyr1U1ErYHk
         Mj0Q==
X-Gm-Message-State: AOJu0YzQtf0++SqoVvQYnOzYL+QaYkpWFCtSxUhVx77/ofx3BpcU0B5H
	TA+NngZQx2Ig2dicaOe4BX1zqxxky/cbncx00bA=
X-Google-Smtp-Source: AGHT+IELy2n4uQsdacbP8xBtF4SkNIus8coKYJZy+Dr55Sxl+RNeH6AtCJCP+PJN7gR0tcz6suKXzQ==
X-Received: by 2002:a81:5206:0:b0:57a:2f01:31d7 with SMTP id g6-20020a815206000000b0057a2f0131d7mr4645821ywb.1.1692282235615;
        Thu, 17 Aug 2023 07:23:55 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id 11-20020ac8564b000000b003ef189ffa82sm5195187qtt.90.2023.08.17.07.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:23:55 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] linux-yocto-dev: correct qemuarmv5 device tree location
Date: Thu, 17 Aug 2023 10:23:49 -0400
Message-Id: <20230817142349.4137947-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 14:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186321

In Linux kernel commit 724ba6751532055db75992fc6ae21c3e322e94a7
all arm arch device tree files were moved into vendor directories
(similar to what was being done in arm64).  This is causing the
following error when building for qemuarmv5 with linux-yocto-dev:

| make[2]: *** No rule to make target 'arch/arm/boot/dts/versatile-pb.dtb'.  Stop.

Correcting the location to add the vendor directory of "arm" addresses
the issue (and is what is being done for arm64 machines already).

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index e695e2d83eac..fba603b0f2b8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -51,7 +51,7 @@ DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', '', 'python3-
 
 COMPATIBLE_MACHINE = "^(qemuarmv5|qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64|qemuloongarch64)$"
 
-KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
+KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
-- 
2.30.2


