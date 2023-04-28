Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634F9C7EE26
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 08:48:37 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.14761.1682671711801435561
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 01:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TermSWDg;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-2f4214b430aso5985412f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 01:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682671710; x=1685263710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9O+wDU/fL0m2dm7FNEuNswV/O2rbclHrIFfEPHGT918=;
        b=TermSWDgp7HngJwnNZTFi7q+Yfyy2wqFG2tvoaFVF3fSQ2f19xxAr9OeR6mId0j4fs
         kp+DOqgp347sdVeC0nf50/0EBt9CIHT6GAbVsDMLNnQrbOIfwq8dve5PwGlUp8AlLJiC
         BClsBYgyxf/xIzH9nnrGbbsTknF6wYkwIW1qdItutWEs2qOuvXE+u5+9w0oSXUifwpEF
         aLZ5WUsC76m0kxxNH5jl89tkZDkXhU9ZyIJm8M1ljzZCUIWUmvoF6CwUTDBShPM37iwx
         f3pZiSIUptGta7kpoMujdpRTNPTBL+LcxdSlZ2ttgxWiJYBlqgXTg2BYrmSK26MttcyW
         lJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682671710; x=1685263710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9O+wDU/fL0m2dm7FNEuNswV/O2rbclHrIFfEPHGT918=;
        b=CkM4Nx6+UOQC/qPE+cRwEdIkTBqfVYVPRdRH4yy6c3ciwCxm0BaK8AJU86DSXjfIBo
         Qvrt4ONKRYiCeWvA0Kr4ZXEcQsSI0VmX1yJpT4QEf4O+7AN36ESOAoYvsnHUwzAavZti
         6MDqXNscU4MUgCzuSaXJEIG+H/4ke40KyKaFFhn/t6GOkywCkC1bh9/OZVK8RrUpZ9YI
         tGSldY04jg0kE8XQt0oZ+bFmB0ezqBobIIo7nYhq20WeIrgudnlW98uONWzeagw5AXVt
         wP0LqN8g7q3r9GVway/dErFBOUUFjae6eu1QD21oaQZZIJjFccEaWZFL0tsfE8zgkvzA
         612A==
X-Gm-Message-State: AC+VfDyyzViJxtXzhktP/Lm/sm1wy0i2vaG3rHt3fJX//u+7BGOMrg2Q
	qjnLnA1NQ9jxzWt+tiUyJO1o/1XVgN0=
X-Google-Smtp-Source: ACHHUZ4ius0nLiWRoT0UIEXj/1nLzcO9LV2veeBmX/aL44H37PB42V4M1U2IGnglvlb5zKBy4eGX/A==
X-Received: by 2002:a5d:4907:0:b0:2fa:f8c2:45f4 with SMTP id x7-20020a5d4907000000b002faf8c245f4mr2814255wrq.0.1682671710252;
        Fri, 28 Apr 2023 01:48:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id j8-20020adff008000000b002f6176cc6desm20563375wro.110.2023.04.28.01.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 01:48:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 06/11] python3-pytest: add missing tomllib runtime dependency
Date: Fri, 28 Apr 2023 10:43:47 +0200
Message-Id: <20230428084352.836515-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230428084352.836515-1-alex@linutronix.de>
References: <20230428084352.836515-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 08:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180517

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-pytest_7.3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.3.1.bb b/meta/recipes-devtools/python/python3-pytest_7.3.1.bb
index 9965844d1ad..914ea553464 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.3.1.bb
@@ -26,6 +26,7 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-py \
     ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-six \
+    ${PYTHON_PN}-tomllib \
     ${PYTHON_PN}-wcwidth \
 "
 
-- 
2.30.2


