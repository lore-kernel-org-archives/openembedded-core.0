Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69A3E7717F
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 14:34:12 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.36331.1734273250725951632
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 06:34:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a+pXR9HB;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso2774867f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 06:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734273248; x=1734878048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63BC69TcTb1R4VkSOOf6Ik4FaVoUNIq59QJy+l2E9ok=;
        b=a+pXR9HBUodO3ozXFk7N5idzFapvEq+A7W6Plq3qYuMBIf8IRKfQu8K2O637h5HdUQ
         36KSu6PWsMZtwob/BdZmVQ922nkqCxSt4DKzKjw4KpCU0CcJ2GV4MF+VCnneDCqRAcSX
         I93vmcsEMExl098LGXdx9t6RNk4w2hsG96y9TIbrTZH6iFqnbGlfpPZOWbYLLwzJkw9l
         +tcrLU85gULHTrr5N927MO4i778O7pux/o79FrEQD9fZa7zpa2VMrozZHnZajUqO2oYX
         QWcGeW4cnOhnIeVQtlj7CXD6uER8JFYSNP90eJB4E84whtemMgZAy7y4re1GolnwzFJv
         nx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734273248; x=1734878048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63BC69TcTb1R4VkSOOf6Ik4FaVoUNIq59QJy+l2E9ok=;
        b=uBKyym5bvwHZoMCkEogMEPDkBShqVJZHIpxasTLilH7EsPGSMoLxiNCFQjcj7G9Dng
         EfpGefZuww0s8WOyn9IuxX9O5OUGARkpC9EJ2v9Ab22K8igE4BeXZn7D0uw53EknmpK/
         Y+4hwmQdpkXOwHQqoLTnHvDGA0hizgitX1daiTteuf0FPRG5YaXLmmlvfz4wHha/uGnt
         s6mZ28C0O5ON0/4Mkcj7CuJIpSWPY7HeEerIcllf5w/rUzb9ogH+iOT/yxpN8IM7FBN0
         dZDQUOANJVRRJtGfU7hPbULLj8sz78q53P7DyurEf256v1irEnTO5vTHJ+bywH5HGevf
         vV9A==
X-Gm-Message-State: AOJu0YwOJWD7o60/GjI+uFKFPywM6bIy25T7VNbxIUf7bQtHqs+NEJ8W
	Deu8QmGIRoEjbzmMUGl3hC52lQrd1E17aUtTwghhFQrXRQCz/6l4T3cdVI6f
X-Gm-Gg: ASbGncs+fQlYX65F3jh6kfItYY/ZPP+zQUm1DwUMsoaA6OR1dAIHEchfiNEedK/CW3O
	ioabyObf2yNvnGgauc/qaTixmBRWm8c8NRwioU+jGEAjUdyYMtC2K3l431STO6FC8hyhZnj0UMQ
	nH2PNmK5INyyaUNhrlccRHNtZE2VEsXkDCDtmAi2jwWyEK3DTRl8zSfeYkCe5YRBU29vauYvo+9
	XSqBpBRhJNl9tXM2wIdE7tIw3kNBBzdRltefJv476i+LrDE7VEbTehYVFCmXax19ZNqKXW//eD1
	MYceuw==
X-Google-Smtp-Source: AGHT+IGTYMd1gjZMFrHpJLR0Tsz/wyLhZlXQQPmG3V6j/PxpBUSCTEbSPYw4xAL8Bqe90H9FINM8ww==
X-Received: by 2002:a5d:6d06:0:b0:385:e9de:d52a with SMTP id ffacd0b85a97d-3889ad354abmr7154706f8f.48.1734273248362;
        Sun, 15 Dec 2024 06:34:08 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8016427sm5310569f8f.30.2024.12.15.06.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 06:34:06 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 2/2] python3: add dependency on -compression to -core
Date: Sun, 15 Dec 2024 14:32:47 +0000
Message-ID: <20241215143247.1224203-3-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241215143247.1224203-1-gudni.m.g@gmail.com>
References: <20241215143247.1224203-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 14:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208753

From: Ross Burton <ross.burton@arm.com>

importlib.metadata is part of -core, but that will import zipfile which
is part of -compression.

Obviously this shows that our packaging of the Python modules is not
optimal.  I plan to follow up with a redesign of the splitting which
focuses on simply pulling out the larger or esoteric modules and
having a more featureful core.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 46092d4004..292c5bbc5d 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -216,7 +216,7 @@
     },
     "core": {
         "summary": "Python interpreter and core modules",
-        "rdepends": [],
+        "rdepends": ["compression"],
         "files": [
             "${bindir}/python${PYTHON_MAJMIN}",
             "${bindir}/python${PYTHON_MAJMIN}.real",
-- 
2.43.0


