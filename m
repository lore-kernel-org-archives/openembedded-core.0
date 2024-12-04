Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BD7E7716B
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:49:51 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.8176.1733294981489281092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y/yIZXoj;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a044dce2so78159915e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294980; x=1733899780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhOwnU8e2Mosk51lCQSjYRqrA8ZzkyBKQa9WF9aMgKM=;
        b=Y/yIZXojPQ+qs5JrXVX16mocqVXHeG4Dt685TQeBH7TOtkG6qi629aguDCZPyQ2XdC
         MiRQ1BmsEvH9doczlIxwSu1NoAVLJth9k63V/m+IZvWq8yY4h64w8KWTbpZmh7kRxxVn
         sgJZxsYAF4E+dbQuMhtUqYSdO2FIevhOvaJ4L741vLySF+MNYRtFwMQSVjo1/WdDoye/
         BJeauR55ETDi1l0REj5HBvjJkxbTtOCWAYH2G+DzJmhlZAZWQlTL5LDlCedhx17/7C27
         b5kdTDWLp0JV3C8iSo0qrH2GzT6e2FNX5gDU415A8DJZGLKEc1qkmDuY4PgEv3GIYYEU
         3ZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294980; x=1733899780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhOwnU8e2Mosk51lCQSjYRqrA8ZzkyBKQa9WF9aMgKM=;
        b=dLysuIsqtMrwjz8xJCVCYn+aRg6BgNX1I4CXUrrrVMrvxQkDEduyjyg/AmMh/JU6yQ
         QewM410R0w+9JpzLN9OnPxFu1FiG6N0s2P/z3311ZF5qzWk6i8y8ljW0q0Kci+biZCpe
         tCO+2tf3lJ3BYyJnAo/EDxMsDMLJNBgKTfU6NXp8uLJS/gNQ2Be59WAeBAAr2Z52lVQg
         ZrGKYN3RtvseqABFfcTywMDf3CcmtKk7wjGGIKlS3PHR4lqceYiNGZOEcU6wJchJ2quw
         lZ91EXmkyAxL1w0+w7wDjQhAvowtcuAg7Z3zKyBBUtXrYia4Pdr0eV8PXEUjlsZ9kMCu
         +VNA==
X-Gm-Message-State: AOJu0YwQQQnLszCPXFukduCKqSX9O84jBTjJZYCvGAJFbSLqD6w+jAL3
	q7WkpsluN9uMFMsigw3qPtvVXPybzoSsgDyUdr8IzBciD45ANw1eQ8A1EA==
X-Gm-Gg: ASbGncteQEi2RqLFojIagJdu6VoZfToXVLuRKRDEuV4TxqtxhyW4c9I8L3BcV3s4Ael
	oZYfnOsLfTgIVsYtGOMJkCL3WIzEa4UYdui8WDzXYpWzGajpsWwmoloZX3leU4UUe5+32QSIncC
	ytFcVR/cKH5RmiGncmZJkcYNE8jkEqw1SQn2zRFewutWj2ayZi9O/YS73/d96xtwLVc7Wh4QLov
	3dv1UuZbFD6ehCJia2USCSQT3tPAVYmginTEUy3/7AdIoUXdOgaiPguCAtVuTSZhBx3GJBno4tU
	1U5oT3TVa6c=
X-Google-Smtp-Source: AGHT+IHOElGpjB+AoBEG3VucRli0IMw8btZtwadIMp0EWrPt9BUZprUu0XIs6F00lXCKo2INiOQQIw==
X-Received: by 2002:a05:600c:1c8b:b0:434:a802:e9a6 with SMTP id 5b1f17b1804b1-434d09b2e53mr46023465e9.7.1733294979665;
        Tue, 03 Dec 2024 22:49:39 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/37] python3-beartype: upgrade 0.18.5 -> 0.19.0
Date: Wed,  4 Dec 2024 07:48:54 +0100
Message-Id: <20241204064920.817016-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208240

From: Alexander Kanavin <alex@linutronix.de>

Change backend to hatchling.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-beartype_0.18.5.bb => python3-beartype_0.19.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.18.5.bb => python3-beartype_0.19.0.bb} (68%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.18.5.bb b/meta/recipes-devtools/python/python3-beartype_0.19.0.bb
similarity index 68%
rename from meta/recipes-devtools/python/python3-beartype_0.18.5.bb
rename to meta/recipes-devtools/python/python3-beartype_0.19.0.bb
index 95d947c90ee..ee2c068e09b 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.18.5.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.19.0.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e71f94261c1b39896cacacfeaf60560e"
 
-SRC_URI[sha256sum] = "264ddc2f1da9ec94ff639141fbe33d22e12a9f75aa863b83b7046ffff1381927"
+SRC_URI[sha256sum] = "de42dfc1ba5c3710fde6c3002e3bd2cad236ed4d2aabe876345ab0b4234a6573"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_hatchling
 
 RDEPENDS:${PN} += "python3-numbers python3-io"
 
-- 
2.39.5


