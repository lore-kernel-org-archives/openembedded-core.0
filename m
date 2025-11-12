Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CC5CCF9E3
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 15:16:22 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7746.1762931895454945646
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 23:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hB0WcikC;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: saquibiltaf@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso440963b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 23:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762931894; x=1763536694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CIJ8jdrjopa9jFk7KlxZHLQ+WZ9A2mIlK0ukQhYisTc=;
        b=hB0WcikCD3qbDrVeRdcyWcmoK+BnfvbE+2p1ordJ7ZrCtDsVk0nS9hBQOM5Ynk6b++
         Krd+L7mv/5E2VFyZqUMzFGNC+5Gsaovts3XU38fPmTJHjDvswGoYSl+kJA3YliIYzygb
         NYsrtp9WcapYRRVaJJdtMuGdbep02NbzeG/UanvyttFgRAxIhoZe5RqKKh25z09nQrZz
         TsRfxJ2ZAKJMIkDP5sOhvAWxYAisRrMdHBihCezZkfosUxjvWC+PknctVjIix60jMTVy
         h6UE+MYnWqkLKglHs95tpXvkeVe39nuy/ngi4PBJNq8BIORuxRMk3Yywu8t15QK7mM9z
         s5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762931894; x=1763536694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIJ8jdrjopa9jFk7KlxZHLQ+WZ9A2mIlK0ukQhYisTc=;
        b=wDTlln017rbzsxRD8qwOdivRbmV11tJGgLlZs5PNfrfL+Gj3mCTNgob6eXKU0vy4XZ
         iXy/t462cvC3ETcKGHpCV7dYuDXYMLbKkCWN8RVDU2RPcLlsJhwwrbeYygnojrpUcuIK
         e2BsRMyKx5t/Kb6rn8NMOEu1EcvoaY6jyOujFolpsDIzkUEPB1WAR+ICvh0U7BC4X0po
         VMVPSAJw9rfuDghozgKTnnjqZ1NWFEmC9vNXUb+iYj2NzgTHepD21YHYp0lJ2oXO+Mg0
         ZYTwANqPX7fhWTFobzR5Pa8chXWJlvkgL1HIG96//f2nVPRCFFI86gIc2WMARAoMslkG
         rJ/g==
X-Gm-Message-State: AOJu0YwR3/Rgq3hU9XyRWO3lgg31BO3J1F6Y+Z600TXwRf383dh5H9TQ
	g7re5PomXYhEf58niyV03Phu4BDrBumwaNxitMbEQccdfAfPC1aad8Rv9EDgKQ==
X-Gm-Gg: ASbGncvAGisxRkznaIwY5HoLmYaraTLw6ihh33eoWSBzI9tYQAIqfYiNiO8nxWr4OBB
	Dw1eBUitKIToH7qrHyKttC8tKhu1+887YwL9p5BL7aWnZ2+ROVY8UBkRUUjvHQsihtUlNsMGlso
	5FRE7uFAGq7cNPeQ/xj1NkY43mPW2BDtM48221ev2Bx34AKMyN8Qd7BUeVnSHSGG2oFKF8o9NMx
	eF/uzMNnXL5OoZBEKCijQTHWNx0iBb7kffA3MJAJ3CffkMuYKJj1bfnkMzPovEV6F+ZJmZFAvzy
	T8Ln2Kc1ynk6U1Bs8AdSox+sQwjF2Zylq59b5cdwMF2nNHyZECUQurn6/M3CevMJPe3LVhZrgkn
	j1N3RZ65q76mmBv4twzncm5qYSIHqYcr6B7qmWR7NSDcnBA7OIzineLKHubfW+G9bAifwHvlius
	QPgyNYP+8Cjvr+QNX41+28
X-Google-Smtp-Source: AGHT+IEUZYaTpCI5cDQ2dS5R7q9XLUZqKB5UI0mX4p1oG4TZA1rwiagvMZJmiykJ8EWDwTrw3oH2Bw==
X-Received: by 2002:a05:6a00:4f88:b0:7ad:1082:fdf0 with SMTP id d2e1a72fcca58-7b7a53c30a1mr2682521b3a.31.1762931894174;
        Tue, 11 Nov 2025 23:18:14 -0800 (PST)
Received: from L-18433L.kpit.com ([45.250.227.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b2c83906e5sm13342356b3a.71.2025.11.11.23.18.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 23:18:13 -0800 (PST)
From: Saquib Iltaf <saquibiltaf@gmail.com>
X-Google-Original-From: Saquib Iltaf <saquib.iltaf@kpit.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta][kirkstone][PATCH] rust-cross-canadian: Ignore CVE-2024-43402
Date: Wed, 12 Nov 2025 12:47:42 +0530
Message-Id: <20251112071742.3263627-1-saquib.iltaf@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 15:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226205

Ignore CVE-2024-43402 as its not applicable.

CVEs are specific to Microsoft Windows.

Signed-off-by: Saquib Iltaf <saquib.iltaf@kpit.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 8bbbd61bdc..044df5123a 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -76,3 +76,5 @@ SUMMARY:${RUSTLIB_HOST_PN} = "Rust cross canadian libaries for ${HOST_SYS}"
 SUMMARY:${RUSTLIB_SRC_PN} = "Rust standard library sources for cross canadian toolchain"
 SUMMARY:${PN} = "Rust crost canadian compiler"
 
+# These CVEs are specific to Microsoft Windows
+CVE_CHECK_IGNORE += "CVE-2024-43402"
-- 
2.34.1


