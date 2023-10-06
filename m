Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8EFE81DE8
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 11:36:48 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.10482.1696592205507881444
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 04:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A5+Le8y/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4065f29e933so19238725e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 04:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696592203; x=1697197003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=i2ih0FvaX3Wc05FJDDq8yi568gLU2zRa+RKNiw+xMYA=;
        b=A5+Le8y/QINM1+RLWuBWnBq4M59mQAPqcI2+dRg5qgjbB0xQ0vj+dE0LDzxGLPG7pk
         lkVko4tHZpzbtf7emD6dhrDqvjg47gDv0OOMe9IJKVHPakF+GXoQA624WkyyxPtSnEZz
         QXqSO4ylWxB+Q4QgaS2MIqpHk+4NnsB5eZLh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696592203; x=1697197003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i2ih0FvaX3Wc05FJDDq8yi568gLU2zRa+RKNiw+xMYA=;
        b=aMTXliGFKHCl42kHhFkatpZ09kz2B10qzqENBEjM06/CrHpqg3r+Th3VpqugUNJLdK
         yUcE6UCccCmXtQhfQrdXa4V9+ypJSfu22c+f5UfZUuP8l4HtwOHnKEHjLn/EClY04Ua1
         SHKJg2+FIC8kBB+Ejj3sZwOvJsFx2I8GsCaYNZgbD8zGpRHKR2KXm9byOUR3kzcr6XE3
         PhqftuMDwFxIIlxLtG6C5kezVVQYkXYWXPcCuv6gPrAKCt4qy5g3BOA72231t9VVWVYI
         ddqVqLrEK9/+tyoJlQQgj3hYfu1olONR8+nxUOGR+h+jUL38y3JLCPSKzykyr9XQVa+Y
         E3wA==
X-Gm-Message-State: AOJu0Yyc2YzpQlIXeJ10+K8UT+2ootpIqAzZ4cL1djIttRf/3KKOJ+gh
	2XGK9bl/N89pUQ8nCKvHGxls5SWGEROiaefEfVQ=
X-Google-Smtp-Source: AGHT+IGjKQHH2gBcXfZYXywrYTYKh7JsLWX4BF9/EO4FWEWFcUBcZ2wf4M9N5Nuh9Cfh22Eza5F0eQ==
X-Received: by 2002:adf:f546:0:b0:317:634c:46e9 with SMTP id j6-20020adff546000000b00317634c46e9mr7448990wrp.43.1696592203370;
        Fri, 06 Oct 2023 04:36:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2964:cec5:fab8:2212])
        by smtp.gmail.com with ESMTPSA id m15-20020adfe94f000000b0031984b370f2sm1449098wrn.47.2023.10.06.04.36.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 04:36:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] cryptodev: Update to latest git for 6.5 kernel fixes
Date: Fri,  6 Oct 2023 12:36:40 +0100
Message-Id: <20231006113641.3248432-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 11:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188761

Update to pull in recent git changes which allow cryptodev to work
with 6.5 kernels.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/cryptodev/cryptodev.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 61c688f1d0e..64a9c2926b8 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -10,7 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master;protocol=https \
            "
-SRCREV = "795f5fda1485d447cdbad342e8304be317d4f7e8"
+SRCREV = "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
+PV = "1.13+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


