Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3E3C67871
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:44:12 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.146872.1673808244000325416
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OhmXKCAc;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id e10so18239633pgc.9
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 10:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kO5F0qd8u4K4Rd+5BN12eWBNjWPJi19p/7QgPTPPcs=;
        b=OhmXKCAcr7NldVRB0FE6jMuv7YzgQYvD9jwqwTCoNWWESJ7O5rs/LmYs7Mk6AKkb6E
         bphqaGqmg+W7jOwKot1ugZvI5bpM8wbIxDh39S3VQ9pCESKgTVMT4A41QGvTSfmbJMsV
         tPRpP9bPHVTobOkRQDG/umr+p4xmNwEF7f29FqLEzWaQjwFi9qAOJcTXEczWNOyfyr1G
         Pnr79nCIZ3bT6WhVZyn4OFrRF4UQSEWeHE6YR8RedN8y7r2z0Erg9a4O6PItAy5R/cYq
         zwQsLOz1civY1dUogGPu7muL9nXBXnxUzBDB+5QuNBN+BFU9uFnLPmYzX+AsGTvsQoNl
         tMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kO5F0qd8u4K4Rd+5BN12eWBNjWPJi19p/7QgPTPPcs=;
        b=vLjaNPmVrwIhK0U7dD6WE8q55tU14VLT5C+STVZkDt5IXdjCjRswxossHop4SrjHhW
         m3nx9ypU5TiX+0O47Cjt0ftZA9QUeAVElxTGqFobo3Eskbz/8eyJ0wAVsKjvZo+dqEyA
         g/UX3tIQz7QvmZDRgN541V58HfNbJRa32aiZvizzWhuCDY5jFGuVV4R3uHP6+hMFd4sa
         97/gWbo40ONo3PDYBx8MczE9gjXiS6MbM+akKEQu8wtZEpYeV0t1QXvkkozggp63Fz+H
         rKLAdkqqBmY/EkqPAtRSoC31/y56W/lGdGXmu4Zk/lBtUJsAVaBFExbqetbY74EwOZD8
         apww==
X-Gm-Message-State: AFqh2kodIsL5RqVXy3Pr/EvJenzB1HiirRxL47I60a8EQlZxN+MRl48m
	La9sWSmYPmk6E0/b/ricH5w3nLxva7rnrw==
X-Google-Smtp-Source: AMrXdXt1dW1lJ/I85jcldwZ2fMKWUd1ZonH2f24RZEwVEI5iMckkl/3RcC9nJMuxb9cwAHyqLNPSnQ==
X-Received: by 2002:a05:6a00:1308:b0:586:6e0d:2aca with SMTP id j8-20020a056a00130800b005866e0d2acamr33988169pfu.7.1673808243065;
        Sun, 15 Jan 2023 10:44:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id x27-20020aa79a5b000000b0058bc7453285sm2665436pfj.217.2023.01.15.10.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 10:44:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] binutils: Package libsframe
Date: Sun, 15 Jan 2023 10:43:56 -0800
Message-Id: <20230115184358.2276696-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115184358.2276696-1-raj.khem@gmail.com>
References: <20230115184358.2276696-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175947

libsframe is newly added in binutils 2.40

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils_2.40.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils_2.40.bb b/meta/recipes-devtools/binutils/binutils_2.40.bb
index 67240383f7..9087af87c5 100644
--- a/meta/recipes-devtools/binutils/binutils_2.40.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.40.bb
@@ -66,7 +66,7 @@ PACKAGE_BEFORE_PN += "libbfd libopcodes gprofng"
 FILES:libbfd = "${libdir}/libbfd-*.so.* ${libdir}/libbfd-*.so"
 FILES:libopcodes = "${libdir}/libopcodes-*.so.* ${libdir}/libopcodes-*.so"
 FILES:gprofng = "${sysconfdir}/gprofng.rc ${libdir}/gprofng/libgp-*.so ${libdir}/gprofng/libgprofng.so.* ${bindir}/gp-* ${bindir}/gprofng"
-FILES:${PN}-dev += "${libdir}/gprofng/libgprofng.so"
+FILES:${PN}-dev += "${libdir}/gprofng/libgprofng.so ${libdir}/libsframe.so"
 SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch "
 
 USE_ALTERNATIVES_FOR:class-nativesdk = ""
-- 
2.39.0


