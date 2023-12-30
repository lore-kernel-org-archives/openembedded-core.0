Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AFBC46CD4
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 00:39:11 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.170421.1703896742843156556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 16:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NY55rMHU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d60c49ee7so22813635e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 16:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703896741; x=1704501541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MzCs+vzdMMPtF41toZg98WxI82OKng+iqap/S/3nrKk=;
        b=NY55rMHUcHYOCrrjhN05Wy+U+D9spGbhxnNvAEzdo3i4xMozeZ5iot0AjRtlD970gD
         k7dxFvMZ8xiEaaPFoaLFHA4R5RxDZs3VstCFsidCs0qmtJP8qOs5tr8m1mSAhVFi+vXa
         tvNhDOD0CqpAh6WtByq7tN4YHyuYWf7dqCfM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703896741; x=1704501541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MzCs+vzdMMPtF41toZg98WxI82OKng+iqap/S/3nrKk=;
        b=sx4fCk/jcP0W/YwCXVa5gTKKx7Yq7XJ54Hmx+sZXmh+ZgPx6OJKsmtBdiuYqRaFcjR
         U546NqGph6B/E/kEc17iS10RQ33Voy4HlQO9f4ry618BpBAAoA6eaZ8FpNV79flw8t2p
         1AR+IEbdrOy42BTbE9nDW0xuD3AilbVG+xRT9ZDQTY1t9O8JFYbQIJ88v12+4jOCHtzu
         /H/NAB5W9/nI85R9Rc/IfkKDG8u7p/66cgVXdXVB4csHN5WalD0JQgB9dX4luAZ7NK2S
         JGvPrS9MoqA9tdfpunwLgA5V3w+8sFu4JT8YH7eHl59jIOoNQOzaEILhYlsogGGHLFTW
         rM/g==
X-Gm-Message-State: AOJu0Yz9Bzgv/+fMCoXuNWqjGgC8aA+JuqmkcRfOteRF8Tq4CZY4RNfy
	YNSx0V2tbPB6qw9OZFCPpgPC9Zpb5zhUBO6B6PEjStvzeJc=
X-Google-Smtp-Source: AGHT+IECjRub31w4DBjO4YGvyxWjWr12tw5WkegBBlZD8XaRM3WDvx4WLju3+83Q5/C7QoRQW6IPxQ==
X-Received: by 2002:a05:600c:19c8:b0:40d:5f64:3498 with SMTP id u8-20020a05600c19c800b0040d5f643498mr2286149wmq.59.1703896740892;
        Fri, 29 Dec 2023 16:39:00 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a152:ea8e:7a3:4258])
        by smtp.gmail.com with ESMTPSA id hn34-20020a05600ca3a200b0040d1bd0e716sm32027351wmb.9.2023.12.29.16.39.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 16:39:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] curl: Disable test 1091 due to intermittent failures
Date: Sat, 30 Dec 2023 00:38:59 +0000
Message-Id: <20231230003859.474720-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 00:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193065

Disable another test that intermittently fails on the autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/curl/curl/disable-tests | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-support/curl/curl/disable-tests
index 38a4d944765..419022091fd 100644
--- a/meta/recipes-support/curl/curl/disable-tests
+++ b/meta/recipes-support/curl/curl/disable-tests
@@ -7,6 +7,8 @@
 413
 # These CRL tests are scanning docs
 971
+# Intermittently hangs e.g http://autobuilder.yocto.io/pub/non-release/20231228-18/testresults/qemux86-64-ptest/curl.log
+1091
 # Intermittently hangs e.g https://autobuilder.yocto.io/pub/non-release/20231220-27/testresults/qemux86-64-ptest/curl.log
 1096
 # These CRL tests are scanning docs
-- 
2.39.2


