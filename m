Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E9AC71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:50:13 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.26715.1750067406636759526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y21K8xSi;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so36112975e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750067405; x=1750672205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1ccgwSfJZu/IjdrwOkhuO3zMeTCCa1olxPhnZwi6Hk=;
        b=Y21K8xSiiB33MQC/JkWaIawylPayz6cQQjqMbH7OoLX7oyhgS07crhhA03zIwNNvQL
         tEZTizfSeyT/4AMDiPEeldOgqB5OHmi5Xjo0F923k+cpPT5PSjvtzk1yCXYIm7hsPcAR
         QSO8cv1G6foIPost/9DxeBqRX01wl5sCGEIxqz98ggv5z3gU3XLH1b1eiIV0DrhQvjjm
         ebJLAHgYQhv17/9UYnP4vJ2wFmqdijr0IcYK0MD6K2dJDNJn9mjjf3ikb1l7YmWFk717
         77PakF+7gJ131lQwtFvJg14sBhButTgGdvaMslrgCTSkyVL35v6dFPsqBk94Py2wzBlN
         6VVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067405; x=1750672205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1ccgwSfJZu/IjdrwOkhuO3zMeTCCa1olxPhnZwi6Hk=;
        b=Bb8gmCDC2v/E0vWVbBItBMe4OaBQmqllLnHHscwFVoHfGRyTLNf7hSxIKtHZAXOwCf
         P/OxhFFLMwu89RlToy99icwNrtC3uiagrQvZ4KzuMzt11drFjv9sgvnwgp/CPnJL/HdH
         9qGnf43CwLuVKW9d0GjOxnN0otNypxT3zl/cikPi9g5bfdiPbM6P8cBLBuQsPbOWzuyM
         x+0tCo9q0wodXUFKjEMjxZaMVZf1OjUxBq5EO7Yc11I/HM7wdw6hJnjw3GU8HpeGPN8L
         OqMWmiXKUWnSJSPH075FHo/rtnJewn59xsEJ9adrAdXcP3dd2XGg7D1PmH3pL/yBTbLk
         qY4g==
X-Gm-Message-State: AOJu0Yz8hrATStN4Lql35on3lTaOFosVcyOwyW/CC88jupsbkQk67czt
	MpMddwy3z5PFdSucox57j5Pzc6X6FtAil1saCeNzGx3XNUW3PXsapExZR8pB9g==
X-Gm-Gg: ASbGnctRV9vswo/fzw1ZffTkceqvWjdZf9ZQ+iOtC2NYBUQwymQijaIWsy5IWXSCZ79
	znpVXavniaLpJBdgGUFfxHgY3sjd9nKt0Tg/KM/1T9AIwnLqR2NdC0V3SH7ovPeuI5//b5oU3Zb
	8cb+Lk3C4xOUMAlZtqjyWMt2nzP86qf7hr1VWUmarJp7uRcqf35a1lDC/97QvlGkdULr8MttUeL
	Jn+9r9s3nqip1GJ4wGe498hP2VS9mGeAQUgn9EqJ/EuhJ9/DdSATrE+n0Lzlv9NzO5AlY7UTEHw
	K+U6enKyr8WBs0hT3LdD8JEPdxPfaFqEUtQTvb86QpM/B20L2X+lk8s8GLincOhFbhpoQBzRHm5
	8SN9HflL/gENiQ8TfSEIos4w=
X-Google-Smtp-Source: AGHT+IG0dNwXMyT8qyeivJcxt9YPSIV6fD3OrXIgTglf+NmepNZ+dC/2RkCzSf7zGhL8uJNd57nHRA==
X-Received: by 2002:a05:600c:64c8:b0:442:d9fb:d9a5 with SMTP id 5b1f17b1804b1-4533c92e02dmr80229255e9.9.1750067404922;
        Mon, 16 Jun 2025 02:50:04 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4533fa7a9a8sm72811805e9.23.2025.06.16.02.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/10] bitbake.conf: set UNPACKDIR to just 'sources' and not 'sources-unpack'
Date: Mon, 16 Jun 2025 11:49:52 +0200
Message-Id: <20250616095000.2918921-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616095000.2918921-1-alex.kanavin@gmail.com>
References: <20250616095000.2918921-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:50:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218799

From: Alexander Kanavin <alex@linutronix.de>

This is shorter and doesn't include the unnecessary task name, just the
result of it: source trees and files.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 77ca92929b9..e7496221ebd 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -407,7 +407,7 @@ STAMP = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
 STAMPCLEAN = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
 BASE_WORKDIR ?= "${TMPDIR}/work"
 WORKDIR = "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
-UNPACKDIR ??= "${WORKDIR}/sources-unpack"
+UNPACKDIR ??= "${WORKDIR}/sources"
 BB_GIT_DEFAULT_DESTSUFFIX = "${BP}"
 T = "${WORKDIR}/temp"
 D = "${WORKDIR}/image"
-- 
2.39.5


