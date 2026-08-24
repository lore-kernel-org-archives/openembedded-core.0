Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44096C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:01:06 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15960.1787576456366370340
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZT7vrFko;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f703a9d05so1665862f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576455; x=1788181255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wed56L5O2BaA7/06bNHC1U80Z9kfkxvxhKcYRsc6kMs=;
        b=ZT7vrFkoFQDha07v/f2fg/w6R9d6rS17FiFwFWpkCCWkxw7mFvuI5lq6geEw9LchDv
         c46JP1P2TQpBIH4nxFuLpWlbLbqP3DE9O+yMa6zFO7d110nACpM1fs6CV4IQdEyF2IKy
         wfIBvP432WroVry493yb1MzRXQ1SJgRvo05p0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576455; x=1788181255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Wed56L5O2BaA7/06bNHC1U80Z9kfkxvxhKcYRsc6kMs=;
        b=fAiAQrxTD+WmkPiz0HuZtGqsj3HwUXgTxsFZwWO8YaUtyzdZdp3U/PKzMZXrGRqczD
         0TMbEKrqz7DwEUWE+VJmd7ChSBGZqZFOF9I7yjFX8v5TXhLmTDEngGa34guNCVRuqMsV
         nicyG55Er7qFITuRDqpkCpr6+VQw0xf+ismKMYsCeg/9QsQWNEN/V1TJqZZWKWhaYA7l
         7LzunmSrNX4Nc8q20ebVab0uZZ8qxqcnYYgSdU+x8qMz0/YgOIxOPLvkNbyjfgtdKZ5Y
         63g36igCBo7NFPMlOvwub+sJaihI44KZ4sSMs+wKtll1qxq/VzNBi/TZT4SywQKjE9Iv
         qsWg==
X-Gm-Message-State: AFuF++n5kky69OZLDnR9kMM17biRdzrqEMZwdU4lbmCSetuM47Vn9z9q
	uQ9NXN1Nz7o4AOIdTG7M610oZ/BR5sPssASmU2AVSmjtOtifxhFY0p6qJZ2o4CbWf87H9TThGoP
	Csf7GbYI=
X-Gm-Gg: AR+sD10WrHfHjdLsJ1AnpBSE/sGao1uT+tInGyWSozVgmyheJzrshackLSdY4j/oPiS
	NeNN+HkKILhQ48bK1AA4lut+vTdxAslrEFfwvVofiHDRNXsXzQ13nsAKr5XEVslJDFdYAfrBiaD
	Ey+fjS1lrt4UZKlE8fcwRJQ1MeQbiSb89tP9zEOc+7gtXLFghU0+vb04MNa3bMZRpaxWDwgjY5J
	hMYL7Ht6WKKnTU2kb82YbYC1A4klL8DdxHJK5U/epanGZGROFftBD7vbq7p5wS/a4XzsBWHlYYI
	HlJbjCwIWcyrGu3wvfM2Rd5a3p8CLctFcptL+Qlr3Kce6A8tclxiXQ8HUH6D4ShnMRkaOmpxB9e
	m8nqLz95xpFmJBJY9JQc8yHRrKl4P+qNhD40iZIMbcdMul32vHrqRIHa5Qv72AXK2iIeVsVUIzb
	Dghhykd1Oi9x6pVh6AlcD2sNlzc4KKiNppGE9ETDEQ2FzmlvZVb3sR7IRlX4+HgBGjxGILlFX6f
	7ub9bPvPZPbdbpv4+EJidx8YRY/9socQ0EJvk0/Eo3udz0u69rhuu5pDNaeunwXpQboZ3o91CFg
	WbVO3E0=
X-Received: by 2002:a05:600c:a313:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-499bf8cd003mr201450245e9.2.1787576454432;
        Mon, 24 Aug 2026 06:00:54 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 18/19] oeqa/maturin: Update dependency version
Date: Mon, 24 Aug 2026 15:00:00 +0200
Message-ID: <09d9cf2846e96d6b41d7efe7fccb80365411fed7.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787576160.git.yoann.congal@smile.fr>
References: <cover.1787576160.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244111

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are security issues in earlier versions of pyo3, update the minimum version
to avoid security warnings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 294409c4bfe392471509d4cb6c1e6fb1063d2b3b)
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml b/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml
index 5c0c06db4bc..0bf83bb6c43 100644
--- a/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml
+++ b/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml
@@ -14,7 +14,7 @@ crate-type = ["cdylib"]
 rand = "0.9.0"
 
 [dependencies.pyo3]
-version = "0.27.2"
+version = "0.29.0"
 # "abi3-py39" tells pyo3 (and maturin) to build using the stable ABI with minimum Python version 3.9
 features = ["abi3-py39"]
 

