Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2303CEE57DF
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 15:34:34 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.62846.1694446463673412422
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 08:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=F4bB7Tf2;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50078eba7afso7944443e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 08:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694446462; x=1695051262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GeHPxLyPwr3SiTesiQSQVqxEl45a2SPCLtL6Ra6nXjA=;
        b=F4bB7Tf28Sj5kXccFWqpjwuNxlX1peo1wSKMbvyrg0E+KkYLJeI1DOs6fMn4m+uvkA
         vPh69sxXJl9rtNLhO/ZpHieMP5lFat5uRImQ3T1/yXJkDkBzU5A888dSy9U4AYTe1rl3
         MI26F0QxMDxlN2G4cBlSTo7wUua9DsP+CUboGH3LyCD3E53c4S36evHA4bfPHVz4MBbb
         s7jj0leanfMKAfLMcwmiAFRxcoOK2KkNC1fxSNIcKg+I5KY3DhEJz+0DiLIsipGsNWcz
         yyou4tXsFzn2owXhHPfO2P8adoyZhC2XZf5wPJv4qMZh4R0lhF5osfrk3jGRsUhK/QDI
         FbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694446462; x=1695051262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeHPxLyPwr3SiTesiQSQVqxEl45a2SPCLtL6Ra6nXjA=;
        b=kH9TuctlKu4eJDxopr/tX1WfmIDeQ6aOi2c001wbfRiYp4wT/uaTIv4usaO1p2z4aq
         E6sT07VdxQW7zc6LtXwVWiMkaXabnAc9HzchY052W4WumFh0t/0xpfq61JCu49LMd1Jl
         5PWjaVx7f9f/38AEHzzKPnWPgSpsCXbT9WY+81+zw11LmL0KkkGxjS2JRyop8IaYVzEw
         XQ3dJxExjsSYJwzi5vvRyNSkOI614nGIIn48OwevUp9TNxQgAo44w0QJHCiUv8AvTWQg
         ZRu6zdRDCyGyyXhcm8iCLpVGrzMSPBYuOMAzIz8vxWQefD+yGGkvaNKgneJwiAb3VfMj
         Zkng==
X-Gm-Message-State: AOJu0YzqK0rRW04U1e/85iqeedeKtIpiZx0ScmsUu3MohpuRtGdnTg5E
	POphrN0gfoJaB7HwvxAJg6A75Ki6itU=
X-Google-Smtp-Source: AGHT+IFDDUh5+x5HUIMnxfQUY9Y9l5KH4fOmwV0zhvNP44o1xhB9n1u/cFiESg8WujmlORyBv09PDg==
X-Received: by 2002:ac2:4463:0:b0:4fb:9d61:db4d with SMTP id y3-20020ac24463000000b004fb9d61db4dmr7214710lfl.18.1694446461563;
        Mon, 11 Sep 2023 08:34:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x24-20020a170906805800b009a198078c53sm5479432ejw.214.2023.09.11.08.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 08:34:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] cargo-c-native: fix version check
Date: Mon, 11 Sep 2023 17:34:18 +0200
Message-Id: <20230911153418.2312703-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 15:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187494

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/rust/cargo-c-native_0.9.18.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/cargo-c-native_0.9.18.bb b/meta/recipes-devtools/rust/cargo-c-native_0.9.18.bb
index 4f34f50ca90..44423b7aa87 100644
--- a/meta/recipes-devtools/rust/cargo-c-native_0.9.18.bb
+++ b/meta/recipes-devtools/rust/cargo-c-native_0.9.18.bb
@@ -11,6 +11,7 @@ SRC_URI = " \
 	git://github.com/lu-zero/cargo-c.git;branch=master;protocol=https \
 	file://0001-Add-Cargo.lock-file.patch \
 "
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 SRCREV = "4eaf39ebbbc9ab8f092adf487d5b53435511d619"
 S = "${WORKDIR}/git"
-- 
2.30.2


