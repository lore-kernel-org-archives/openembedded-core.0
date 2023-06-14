Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AE3C04A6A
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.7368.1686734992533109575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HbGPB086;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-518793ef6ebso2377499a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734991; x=1689326991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrF8uL+FJtwgTn2GTLyVgZKZsmjYPepyhvjDwa1USEM=;
        b=HbGPB086igd64NjMBE0JJVviJ1epY+S90GuykgxB84U/rQ/YqpcVXEc0P5bUTLmPef
         NkPfNF2o1fxrS1ILYCxUiEquUINlDl1dUCGZAd18Zypl/4dEw1IL8vQac5vCsH21xYG5
         8rdgihxVmk50+SYBJOQn3Kpj1c0QUomlCES8/AG4ryyEGuWt0bxshEfb8yRUeG4BYqkJ
         WU6RY96kWVh7P+rXwNX6HbvHdBfG637kIUT6JZ5CRKQdyS+vqQWt1W/gOvVw2jSdz+sZ
         p2HlOWAqq6rAG8vD4kkKzPX0ifIEQdwgql62VBxM+81ecWRBviTcP3cxEGa4dtXYIGP9
         NGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734991; x=1689326991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrF8uL+FJtwgTn2GTLyVgZKZsmjYPepyhvjDwa1USEM=;
        b=kqaXLU2A5Vz7GzwYyPFeGImwxHBKF3Dia6uxpKrKQTdn8IXteFepoZ0GmSv+hazIA0
         ZkxDNRDhUEbdsgegCzWLIGvYfmAMYiPeDkIGsI4m3RIN7UYJln/CkaxHE2qdQNpPeZGT
         /k96naZ0uENa8QwBfsc0cWQ4i8wRt33L7mESWs5ZGh90gnY5CSdz639Q3c+7AYtJopJR
         lDJ4wwTV1ZCdOdjhEdM3Zw5I3FY67RF5U80MkdVxwn95uAd47Byk9/cFHAi+AaTwOHOi
         uJ/eips3Oy8BgVKtFQ9+LcCO6Eyj6pNQRZeJIWfYM02FZgqxWaUIZ6wER7KVjGkQBocq
         DmUw==
X-Gm-Message-State: AC+VfDxL5YcoIlkKjwVdeGBwFwifX6kemImEwpxcwsa/rii/CbHkNv7I
	Eh7HsdqFfwnLJSYLPRYarrZIFourbLk=
X-Google-Smtp-Source: ACHHUZ4v0hrj8EsY8DkAFB4lzbCmCgckXPjiDyZ1Mhxpr1Bz8PmjVm6TAtD9y+dey1apb6Ppuav+UQ==
X-Received: by 2002:a17:907:608a:b0:968:c3b5:8b92 with SMTP id ht10-20020a170907608a00b00968c3b58b92mr15213838ejc.57.1686734991004;
        Wed, 14 Jun 2023 02:29:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 43/55] python3-pyopenssl: upgrade 23.1.1 -> 23.2.0
Date: Wed, 14 Jun 2023 11:29:06 +0200
Message-Id: <20230614092918.4065570-43-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182788

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-pyopenssl_23.1.1.bb => python3-pyopenssl_23.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_23.1.1.bb => python3-pyopenssl_23.2.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb b/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb
index 90a6252f7c1..86ae406ffb3 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[sha256sum] = "841498b9bec61623b1b6c47ebbc02367c07d60e0e195f19790817f10cc8db0b7"
+SRC_URI[sha256sum] = "276f931f55a452e7dea69c7173e984eb2a4407ce413c918aa34b55f82f9b8bac"
 
 PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools3
-- 
2.30.2


