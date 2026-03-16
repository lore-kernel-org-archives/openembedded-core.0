Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2585F4642B
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:30:19 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46894.1773653409770441433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Xi2HXYJb;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4853aec185aso35590875e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773653408; x=1774258208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uaMhNdICFOrDlMBNga1IjZfuwrgqlKcD+qiepACoglU=;
        b=Xi2HXYJbau/djEfQ0vG//ya2x1UlMxIG77UQ+7jbA5mHfN7fgB37BIhkUVzxi1x06n
         AUrUOo2H6emtMCuJnnCv7rIH0fOYmbMf2i1814+mFs1/8L9ryUde2W/5IVVo5xHq6jEU
         ERHHa7qxlfznB5fP+zggbGFyk8XjKAkdt4Nh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653408; x=1774258208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uaMhNdICFOrDlMBNga1IjZfuwrgqlKcD+qiepACoglU=;
        b=VBTNPW33pKK/YxiGrv+udcKIvcMoM79e1B7CEHIiKHtO+p9mPCgD1hy1sEmfagnzD/
         pFpIAAnT3zLdP1Cgp/5+pLoHbpV7rcKXsfbYdqYmXbHXgzfsSuTYCV9p1nO+rWVJrYTQ
         2NcB+KCSiYZNlgck4K1i9ym6mPV8VRAhuRqLduOYTWR8oKYRhpGpDwAqIVAk0mGl29Aa
         WpGUh1XC+X/Ss0+XUBnEk5dSl8WndaDC5LM1DzjZfADojTYMKJo+rOfKlYekddN8FhG4
         6KoLqld6F5cmElSco2Hl/H40urxaehL/FzlMiKQKIORca7IVGez7AszSerydNBZ4Jcly
         UjlA==
X-Gm-Message-State: AOJu0YzbggJXq+/k9w8ER+nvZoc40AHQlE4E5xp/6dkpGoPw1GNp1j5d
	7CSnRY967KXqhCwrvMJcl1agOzZNmP2k5sKYksswcOugWna+mOVRsUZq/fYpGxePt6aNfDTT7HC
	aK694
X-Gm-Gg: ATEYQzwItivuyC9ks4ZmAMvDZ1m4aIxaYzVt1zbSKvDE3RfXk/cEVcPbIMiPxM/gA/x
	ewQGsOix+or0cNQQVNgQzb7YtSXcE1SZVtknyy2p6Jo+hgq239T/boiuX4poQs4vSRyx800njio
	2IqUrOlZUx6ITD+yMCycX4M4QiHMOVwTutrmdh1MnpGizTgZxd4Iyi8nwrYxkvMnRWr4ji4odkn
	FMV1fvvUBfDU1ahjJN1CegR0MW89P7rOyIsLlh72K7+0YQEOk1Kwkvrvb7QRMOIN0fmZKl9dYau
	1c2xsv1Zo7xDrKAIA9b8Otw8oHmR4b7k9iCGCxPkLKFrVYeOCloZUpXV0Hxxe/XmwjrhNL8c/4O
	CvhlNQG3XN6DY0dQLZOB6EjRfT8xF1esw1F+tq+Jl6hHQi5LjDLEEkeg0CW/Aa0T3zhak3XDcuo
	bDStJDUBuVlap4FscajcrSjAt7EHQIH6vALuOypjy9FPvkHzCLoVCwPCcCMNY/d+kdXkxaRvj+C
	f9dSRy1MUzum4p08CH60AhT38q3ghuC7w==
X-Received: by 2002:a05:600c:4753:b0:485:3fe6:2209 with SMTP id 5b1f17b1804b1-485566d516dmr196522565e9.11.1773653407723;
        Mon, 16 Mar 2026 02:30:07 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm91138265e9.12.2026.03.16.02.30.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:30:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/17] tiff: set status of CVE-2025-61145 as fixed by patch for CVE-2025-8961
Date: Mon, 16 Mar 2026 10:28:28 +0100
Message-ID: <9341a9be6f5995bd8810288b4118365aa9833364.1773652940.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773652940.git.yoann.congal@smile.fr>
References: <cover.1773652940.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233231

From: Peter Marko <peter.marko@siemens.com>

Gitlab issues for these two CVEs mentioned in NVD inks lead to the same
merge request.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch
index 05b11a866e7..f87eaeb1084 100644
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] tiffcrop: fix double-free and memory leak exposed by issue
 
 Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/0ac97aa7a5bffddd88f7cdbe517264e9db3f5bd5]
 CVE: CVE-2025-8961
+CVE: CVE-2025-61145
 Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
 ---
  tools/tiffcrop.c | 8 +++++++-

