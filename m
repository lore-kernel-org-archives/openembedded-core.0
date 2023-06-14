Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60C5EB64DD
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:33 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.7347.1686734969990078861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HD4mDZd8;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9745d99cfccso84744266b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734968; x=1689326968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+gkVntiKmIuHHvYaAA//dTVQCQTfKXYkqmlzEapp64=;
        b=HD4mDZd8eEOWf3NqXlptoWHiU6wUVBYjW4ouvWMIG22vlfbBJU71hyJQeJtQfxjCWW
         TlP+OianYkhLjXeTF8dWNLFJ4gTMOwuDeu66r2xChTD3T93lUz4oJDBAPCNDciIp1ZHD
         S5tAll1H+WGI2/ImQxkoYd2/8gZXiQ6wGz7ZQ9MrIOm2L6RcdZh8Z7QuaxFGIvu8A5li
         O3MaUUhCYK691zQWwQaCHr4xrMzOST1IHWKWzRVj7LMmqWsts/d5xE+REMFztR1E8TaV
         cX/GHIMjnGUA8O8jizcLf/N+NBkVXg9aQgsYR7Tka3GyUcnA+Y23c3aXyNW6BYiTPmi9
         YwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734968; x=1689326968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+gkVntiKmIuHHvYaAA//dTVQCQTfKXYkqmlzEapp64=;
        b=Nz4jpOAHw00tw9QoRwIizM5uY/+IZzFKWfDIVa8j/W7hqUXOSJHn9/PP5hRkCFPTyM
         jdPQzvDS/WEniiGoxn4lCI/UGWB/zMDMcCOf8KZ4DXQfuCdXUNKluOTw6FzxMg7fUKED
         odmFdQNHjhzCP+dQrtjydR3KMdNsWmygLoYcfsa79OrE15i8DRY46Y0984NzG8NUcRXQ
         u0GnUO3U0uK0+tnkPNjIUkSpc6kvS77t3wNZUqGV0CZwXYOTpsREXDpc2azHh714c4DA
         Ip1kIL5SPawNdpqyhmXOJLJ/ZSR37KLWBb490OY1sD1NJ6U2CmEZEk4iItD2J1RsXE8D
         MqLg==
X-Gm-Message-State: AC+VfDwCHl48DMTW2c5Lam79jaAIau3pcQ1U+PJOBg5Nih3LpEvQ4/xY
	waMkYom5+DkilFCDcBth8p2CCtbC+NQ=
X-Google-Smtp-Source: ACHHUZ7gNMpeVHlBu2U6gsAgoPhFz4BpmxXeLPDzLv27KLHRJfYw/Mll9XFnpDzXGMQdgo8m2oZ8Mg==
X-Received: by 2002:a17:907:9620:b0:978:8790:9103 with SMTP id gb32-20020a170907962000b0097887909103mr18716298ejc.70.1686734968319;
        Wed, 14 Jun 2023 02:29:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/55] apr: upgrade 1.7.3 -> 1.7.4
Date: Wed, 14 Jun 2023 11:28:32 +0200
Message-Id: <20230614092918.4065570-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182754

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/apr/{apr_1.7.3.bb => apr_1.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/apr/{apr_1.7.3.bb => apr_1.7.4.bb} (98%)

diff --git a/meta/recipes-support/apr/apr_1.7.3.bb b/meta/recipes-support/apr/apr_1.7.4.bb
similarity index 98%
rename from meta/recipes-support/apr/apr_1.7.3.bb
rename to meta/recipes-support/apr/apr_1.7.4.bb
index 9a93fe09679..e5714693416 100644
--- a/meta/recipes-support/apr/apr_1.7.3.bb
+++ b/meta/recipes-support/apr/apr_1.7.4.bb
@@ -24,7 +24,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch \
            "
 
-SRC_URI[sha256sum] = "455e218c060c474f2c834816873f6ed69c0cf0e4cfee54282cc93e8e989ee59e"
+SRC_URI[sha256sum] = "fc648de983f3a2a6c9e78dea1f180639bd2fad6c06d556d4367a701fe5c35577"
 
 inherit autotools-brokensep lib_package binconfig multilib_header ptest multilib_script
 
-- 
2.30.2


