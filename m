Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6602DC4332F
	for <webhook@archiver.kernel.org>; Sun, 11 Dec 2022 17:03:04 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.21297.1670778177598839069
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Dec 2022 09:02:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T+rIZ3Md;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id b2so22553804eja.7
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Dec 2022 09:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EyIO7MFpZAnysdyB2TCy91orelLK/WRaIiK2R7b8O5I=;
        b=T+rIZ3MduZ3wqmUP9VNiVZdKG3outDLcB8AecNODpzE30vo3vXwWi9eVMYirpdykCy
         yfOAHPcFJyaXPOE5W3WQWtjg4rcq/KD59QtTzgjhu6J3QbCAn4Ld2eCfbI+crKhVdoZz
         N+MApdkw+eFtZphDtp4X1nZtkXv3l5SfcFgJPkNP//p0Ob7zEjjksljSLX28ICjnB+bV
         i7yR3xqUQUEDlegMQ6+xh2QyJUx04p3ZOvH6uNb9S95gH/0BFlsjsEXfFgR4eiRL08Vy
         23MTJMdoy4FTBi9MoKWIvoIXNlTLWw5j6JXzV7a5cwLmaU9IJvzkJX19qmvmdt1wTMEr
         0RDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyIO7MFpZAnysdyB2TCy91orelLK/WRaIiK2R7b8O5I=;
        b=TdsCJZ4KOcQYO7st3QIhowcs3SaIFDjFE/aFENeUL7XO2btcI9/T2MM020RPdON2AY
         IPbV9NOg1g2SvAAw4H8AJSM6R9lN/mC6QDlqEXQz6wWpuXSr+ohIrZKRk9ob139IqzUl
         BtecCIcVND0ql1Hxsa3lPkmRuf56P3A4RfV66PMqpC6q2puzeRz8wtaXIbXeH+IpQWal
         66bgsHnAO/1gbgcVJL4RZyTdULYzG3eelcBI6yEpBSMwwYIeysXqSmPIjNsflQ6lecWD
         cueWKKuvLCl4dMP0vX/d0zbiuzbbpI1iNOB1cKJhLe6aqMtbnXH5BO8VZlPaIXXtg+QQ
         qo0A==
X-Gm-Message-State: ANoB5pnKO2IjKnx83dCwuFVOqO2wSXPsyNqr/lUsHMtx6P33fufPyScR
	3NVUbh11LK/PpckSEf1BjwLnwaW7Gz4=
X-Google-Smtp-Source: AA0mqf6ybK747zZTKU4HHTgy9RP3TOoSP7Az6NwTmm3Cx24z5m7tsjNZfiC5AFMq/twstobUXOGCHA==
X-Received: by 2002:a17:906:4c94:b0:7b5:860d:7039 with SMTP id q20-20020a1709064c9400b007b5860d7039mr12180193eju.10.1670778175739;
        Sun, 11 Dec 2022 09:02:55 -0800 (PST)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id h20-20020a170906111400b007c094d31f35sm2243218eja.76.2022.12.11.09.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 09:02:55 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Robert Andersson <robert.m.andersson@atlascopco.com>,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] go-crosssdk: avoid host contamination by GOCACHE
Date: Sun, 11 Dec 2022 18:02:47 +0100
Message-Id: <20221211170247.80303-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Dec 2022 17:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174476

From: Robert Andersson <robert.m.andersson@atlascopco.com>

By default GOCACHE is set to $HOME/.cache.

Same issue for all other go recipes had been fixed by commit 9a6d208b:
[ go: avoid host contamination by GOCACHE ]

but that commit missed go-crosssdk recipe.

Signed-off-by: Robert Andersson <robert.m.andersson@atlascopco.com>
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-devtools/go/go-crosssdk.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
index cd23cca2fe..766938670a 100644
--- a/meta/recipes-devtools/go/go-crosssdk.inc
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -4,6 +4,8 @@ DEPENDS = "go-native virtual/${TARGET_PREFIX}gcc-crosssdk virtual/nativesdk-${TA
 PN = "go-crosssdk-${SDK_SYS}"
 PROVIDES = "virtual/${TARGET_PREFIX}go-crosssdk"
 
+export GOCACHE = "${B}/.cache"
+
 do_configure[noexec] = "1"
 
 do_compile() {
-- 
2.25.1


