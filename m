Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E20C10F1B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 18:39:15 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.25153.1672425547186515434
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 10:39:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JoYh7qG0;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so13453759wms.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 10:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnA3QvKJECUKMQBjr/9fOHj8eol3XS3YXZ8jtMSTRCs=;
        b=JoYh7qG0PLhCg/96kJ9bnY1yzPpMWrxVX8cA+B1bw9Fhj+Wie4By/eut3gANQvJF7y
         +vVUBdDZmxMVWb700WcesjTbgm45HBlPKbfR4St3e8+GMFH+M4vEawFjln0fFfKAN5uW
         FIewEErl6TujS0S0YcSXtE9VMNaGnQibD+Vnrf0ZZuutjhDMsDvH72cYxi4Us4LEVYAv
         w6ee57RHIgYBt6oDZDKelzeWLE+dV4CUSOZ8UVVW8mPYdraSGjhAAGf5xnf+I2qfj2UT
         oqCn85MSvmiT/bxDair+X3VytjCZwz5wEU9PYu5YpIOuI4wOPQgXMvn7WRCNB82lV3vD
         DyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnA3QvKJECUKMQBjr/9fOHj8eol3XS3YXZ8jtMSTRCs=;
        b=Cb2FsIsYdGFcpHwtYkuJ+N37leqDGa9GLGRzMsOn5R4vOujgPe2dHRPH3Z1jv2V+HO
         oApIbaPfcvsjvcOwbnIrWHu+RHvbmAseFu+idymWEFvngdZy5bU7Wq8XL80Ge/U0QH7k
         paafJJ3pfNkNikPBpbX+pRRSvJqzZol/h6U3orU8MGOlqUPylIZFZcDOHHfjR8mnyMFa
         u7gF4bOAgXNVhIDrEs4gJ53SUquyWNkIRSTFEvlpbwj9aL793X+JPE6NgGNblJBiVklo
         gaMEq/yLm1RCU0j4WN3+zRHgPYNNq1UFi/z+yB8/x5mhMm38bIIxdjWPgbHp1j6w2nzB
         U5AQ==
X-Gm-Message-State: AFqh2krMj3Hu8XwauXJRz+rWANGfXcOG0obcD7NXJlOW7IyH/XZYRFRP
	+hHGFRoXVO+tWraZZbvUNh9q7oO8Oeo=
X-Google-Smtp-Source: AMrXdXtFdLWuZN7T2iuV94fgUujDuylhwsNF3/FU6d5ACKyzb8LChbL3O0zgOv05AgBh6CtG9D8ZNw==
X-Received: by 2002:a05:600c:22c7:b0:3d1:cf66:3afa with SMTP id 7-20020a05600c22c700b003d1cf663afamr23656270wmg.19.1672425545741;
        Fri, 30 Dec 2022 10:39:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n1-20020a05600c4f8100b003d96b8e9bcasm31426682wmq.32.2022.12.30.10.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 10:39:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/11] boost-build-native: update 1.80.0 -> 1.81.0
Date: Fri, 30 Dec 2022 19:38:48 +0100
Message-Id: <20221230183850.3089510-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221230183850.3089510-1-alex@linutronix.de>
References: <20221230183850.3089510-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 18:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175172

boost itself is already updated.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...oost-build-native_1.80.0.bb => boost-build-native_1.81.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/boost/{boost-build-native_1.80.0.bb => boost-build-native_1.81.0.bb} (92%)

diff --git a/meta/recipes-support/boost/boost-build-native_1.80.0.bb b/meta/recipes-support/boost/boost-build-native_1.81.0.bb
similarity index 92%
rename from meta/recipes-support/boost/boost-build-native_1.80.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.81.0.bb
index 54c0b2064f..d01c7658d5 100644
--- a/meta/recipes-support/boost/boost-build-native_1.80.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.81.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master"
-SRCREV = "405d34a04d29519625c5edfe1f3bac3bc3dc3534"
+SRCREV = "0271fafc1141c182d4aaa8db8b1c08a109d04c87"
 PE = "1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"
-- 
2.30.2


