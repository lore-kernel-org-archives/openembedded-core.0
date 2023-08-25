Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77477EE49B7
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 22:27:53 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.2561.1693002463569356145
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 15:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=i40zXX7A;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50078eba7afso2194607e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 15:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693002461; x=1693607261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/JU2AOFiMtjJt9nxjy8Xjf4md5X6Dyo8Xa9UuZQhDM=;
        b=i40zXX7AdEwB/Y2jtxhyadGoESNPqy9hGh98opqoEGhJ0C5g4NfWnW0w4nl9OTEWr7
         cPsapGCMnAjs71RE/fXHxBBlMAbmOeVxLkNBTirpvoToXTJ/0gZYiB4Lcg7krT/t/gh5
         B0BEkv+RcLgY8m9XRjzaITtAUhvgQYw9rXTnRxta0T4/jrxGsClUfExxJofopo0AGKIc
         tFb5bDm+ADFgsaaxbIGnnO7A9HvgQLcUrS7C3BYJTwq0jXbc+gmqjZjwIoiVjZlLcPwc
         QqXPFO7SfdJoC6YRC5zM/MfZpWy5d3Sg/GH7s5h2W/3zmp6pQFSXwPqIYBt58/0Jk0hC
         SL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693002461; x=1693607261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/JU2AOFiMtjJt9nxjy8Xjf4md5X6Dyo8Xa9UuZQhDM=;
        b=OnO7MWtLjLiwR9hKdtlA27LvlTCn7cXHX3bmF3jwLgsnf7teZBuKJkxXwbgyCC7BoT
         p1wSuGI98/UTA+og5SswHmCR0s+BSsILgYYyzBwrzj0gXOfMvwCR5RjyoKCiOZPHPxGm
         l2hqBzcOVlSxbE34Jw9B5DWAYPhmG/XqvEjfLg0tA+445IQTt5g+h0cCea0YnSTlwdpj
         kMUe9zLBz3S3DGQxPrmkiH349bByErqNcgE8uB/2EC5nEFAiGMNsO+cQyzpUrVHPbAu3
         DceKLuTVd8OsjQbxbsA/86Br1qc25dMduNbhUs1VjOVKGtvorA0HnmmB7sbvXa9f2+E4
         pmyQ==
X-Gm-Message-State: AOJu0Yz6f7Bs69L0tl6BrzXeOsjPz9Uh9N3+5zDnHA1vVb/cwBjBD7hJ
	jgzg+ftsKR8i/LVK+D2HDaIvxlBckm4=
X-Google-Smtp-Source: AGHT+IE/jq/WgE+la9ifarHKWX4/K+1wZPWbY3XYhZlq60o94OARf2Y3Vfmkg9gRR8CTXkMiyJIO9w==
X-Received: by 2002:a05:6512:3b28:b0:4fe:ecd:4959 with SMTP id f40-20020a0565123b2800b004fe0ecd4959mr18592417lfv.32.1693002461398;
        Fri, 25 Aug 2023 15:27:41 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id n24-20020aa7d058000000b0050488d1d376sm1449057edo.0.2023.08.25.15.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 15:27:41 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 07/13] cmake-example: workaround for pseudo breakeage
Date: Sat, 26 Aug 2023 00:25:47 +0200
Message-ID: <20230825222711.2735745-8-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
References: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 22:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186734

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta-selftest/recipes-test/cpp/cmake-example.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-selftest/recipes-test/cpp/cmake-example.bb b/meta-selftest/recipes-test/cpp/cmake-example.bb
index 96d543180b4..fbf1f266721 100644
--- a/meta-selftest/recipes-test/cpp/cmake-example.bb
+++ b/meta-selftest/recipes-test/cpp/cmake-example.bb
@@ -15,3 +15,9 @@ SRC_URI += "\
 "
 
 FILES:${PN}-ptest += "${bindir}/test-cmake-example"
+
+# This is a workaround for packages with sources in-tree
+# Without this bitbake ... does not work after running the install script.
+# newenv['PSEUDO_IGNORE_PATHS'] = newenv['PSEUDO_IGNORE_PATHS'] + ""
+# path mismatch [3 links]: ino 37529096 db '/home/adrian/projects/oss/meta-yocto-upstream/projects/poky-oe-glibc-sd/tmp/work/cortexa57-poky-linux/cmake-example/1.0-r0/package/usr/src/debug/cmake-example/1.0-r0/oe-local-files/cmake-example-lib.cpp' req '/home/adrian/projects/oss/meta-yocto-upstream/projects/poky-oe-glibc-sd/workspace/sources/cmake-example/oe-local-files/cmake-example-lib.cpp'.
+PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
-- 
2.41.0


