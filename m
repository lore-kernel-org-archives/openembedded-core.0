Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F4EC433FE
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:07 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.3031.1639000806692717558
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZHqrBa1z;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id t18so6450331wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6cFnKtwinP94InthuSmqAx7Ap1aOv01F9wAsq1XTW2E=;
        b=ZHqrBa1zd9bbjbt8f9aVyRWGbNnMUn49FdcGFcbjH0tID8UqYk5IMPjMEhrYcrqlr3
         oDYEdzRHkMxeQ6EL/HGeNIuFJcppzTCEJfyuJ4cXGElGKN6utjb/SVYSH7qCqpvzoouj
         TshMMzB3uTrIVShRcw4PbKdhsUtlUrtxKQqQQL1E2Aw8w6ph0fOfIZoCqOZv+5DgCBJo
         tW3xoIMDKQNwTaJWBetzLqrXQk5TjE8JaovedOS3M8dljTI8UVckm8fS3BVqEURTcREA
         IEEiGqRhmilAYntnVcqbQ4n8tILE0wwiSU4hO4N03VwKv/qFVd0oq7UXHSsJH3oC5T3r
         8HFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6cFnKtwinP94InthuSmqAx7Ap1aOv01F9wAsq1XTW2E=;
        b=XhA4hyGWBhlJ+f+FYZcgUb+4as9jcRkeoy68+tZzATn8/psCVC1n3L14o2iGwf0u3P
         ckkmzFo0x8f+AODay2ZKkusBbGhdva/ITB9a3n4AWxm8Q5seDA7jEbhObe04nG6uiDYM
         nqXDbw4em8/9cJaXLmBDdxK5RlmBRho4auQg7aca+ugWKoXNo4z8t3rC/uHGWdZBlJtS
         9KQPpojqdORGITjVln7ZZ5gge282dKghDgnETJ2lPqWLLYsqdp8AsBq1Ttvvh/6BvTFb
         MM8z9Tc6pzkr1pQVEQUDRcSCFNKdk+WDYdSxhM73sluCPgwH5O3CKiLXkdS4+hitU+8z
         6DwA==
X-Gm-Message-State: AOAM530fqsT0uQrribcUGnc695VJdnCyrAtJqqcMOfBfSrT+L4EijsFm
	wsQaHgpxyC+vWJwxR5dVzMYaV4A8O7mArg==
X-Google-Smtp-Source: 
 ABdhPJwmKWO/jDWCiRhLVfz5TlsNYRQfXl1T84ja1d/1XE4/ZMm82togjHadPe1IBKAw4Ltf7VT7Hw==
X-Received: by 2002:a05:6000:92:: with SMTP id
 m18mr1570716wrx.617.1639000805335;
        Wed, 08 Dec 2021 14:00:05 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/29] python3-hypothesis: upgrade 6.24.3 -> 6.30.0
Date: Wed,  8 Dec 2021 22:59:30 +0100
Message-Id: <20211208215947.1979470-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159378

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ython3-hypothesis_6.24.3.bb => python3-hypothesis_6.30.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.24.3.bb => python3-hypothesis_6.30.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.24.3.bb b/meta/recipes-devtools/python/python3-hypothesis_6.30.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.24.3.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.30.0.bb
index 431a5e328a..59c56e2d94 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.24.3.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.30.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "fccfba3803f391eea2c8c6f21667886ca7407b135b6121e0701a7f8addc176f7"
+SRC_URI[sha256sum] = "6d81d409b4a1a3ff9458de5f2cf7ee37b1dd51473aacc79f257c62e2369a5fd7"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.20.1


