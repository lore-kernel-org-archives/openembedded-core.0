Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AED9CCF9E0
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 05:08:22 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.1764.1761109698222265809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 22:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LYmqN1/8;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-79ef9d1805fso5881073b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 22:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761109697; x=1761714497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dh6wHqDne5lcD3gCIDKN7+HUfWXcAAEghB5srI3Gxzw=;
        b=LYmqN1/83qirwDZlF/QJ70TNXhx90Z4iZ+XYifmuibQLhDvGEfbe23FNWGc9kOZIXw
         XIySsoKOywFvm8t+aWFWIbfYLopJ9b55RVqXlL9nfMpe95nSBT5kzNrF528x63sC8QMS
         CX144a9bpFo2/AtZ6h8sw5jIkMTKNr99SCgnvXFYfXykkDv0Bkgo/tTZSA5izscE36As
         1QfXlKHeMdTUPMtgT0TkDf0O6HezX2fywh9MWauyTZ9Npl/IwXUz7bg5GZukQkwrfibD
         qvP9hl6cUm03sqWxycEdf3c3HtTQP+dn7qk83vV/XUPVZUKzbI8t0u9fFdUGUksFyeWd
         yeqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761109697; x=1761714497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dh6wHqDne5lcD3gCIDKN7+HUfWXcAAEghB5srI3Gxzw=;
        b=adXPfe7+R8PU7rcFJ5i0KXhvM/4FhywHjnlDjhAcXfBu8PnJk1cIZgcz2OogfsoRSj
         jn6J/j4RlxILIfj87E8cSegf9gXMNWYYoHa7Wbod1aqv0WDpArpFb4zE7FIlSjUa+6GP
         nB7DvOYsotmRd+zXhnWDrZ75uu30JxfXFem9sZk8mBitalI04tQzLDc23uE7b33Hkk4I
         XPcomcV6NrNB/2UOg2Xfn1q67+xVE9YNrnR0/2FGNuW5xs9LSzb9lE6VLUyGHKEc/Ox1
         bt/sbJFq6pCLK4WXqFgwmib8CsuyvTEpWl9RwesVvV/g2hAoHsWpNOJeNaROmIT7nBUB
         k99Q==
X-Gm-Message-State: AOJu0YzsTmWJWdPKUgGmGwT2CpUawjKIPOfYqV3meH62947DpXw1BG3D
	SvU/2MUzX9phHUJNCsbttUQ+aY4WInxDI2tNddrLEd38cE5nhZaIhR16BP+36G4z
X-Gm-Gg: ASbGncvi8B4fRMuTfkQxP6Nlu+ZWvqCOxAgtAwbUxGL2sfhh/CT+C61Ep9A0lpx2m7c
	8ctYUSBsofBK+jGGPVrZnVG8tV3Rxse94+rFwgdpXGBtSwa6vhOWhim0tNvwGmA0H56aEaHJfu4
	VxCHNPeLz+eN/AiVofRKO35ZpS4dhLkI7k+kx1Kps7/oUFSezbhEAQaMkDSV0pMgcieqFLaFuW5
	jEnBtLCcQQNP3QyXxISibNXKrrNaFFYeotzy3iXcfc8kHsKXmfE4dyRUXR7CSktO81yrYBaoD9P
	jX9EYAJpq8wyr8IhqFrCPiz6CkTutjQuSUNwct011Yls1Nes5oFN1bF44bC2PQ2RXcKxcptaOjU
	2XPCZoirPrzguZQd8bP2sRe7gloupfHoWaWkvcN9mJ62pUNIdcZ8FMXmLdYTz6SeGOqvK8i3RXS
	P78Ke4a9UjmOHb0j0NG2cKZGV/G7hsM8rY9hvgSm+PFRjN36vjH3X72RJidoCo4g==
X-Google-Smtp-Source: AGHT+IHCMcbmr4tOxl1EO4ZEhHe6f3IScFXzhStTNIXTPF54Aw7hYAtNHEEeRFKBRnNoIsVEI9WEFw==
X-Received: by 2002:a05:6a00:1889:b0:781:f0a9:a38 with SMTP id d2e1a72fcca58-7a220b33cd0mr22985857b3a.24.1761109697393;
        Tue, 21 Oct 2025 22:08:17 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::b6ef])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff157f4sm13328563b3a.6.2025.10.21.22.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 22:08:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/5] elfutils: Always use gcc for native compiler
Date: Tue, 21 Oct 2025 22:08:10 -0700
Message-ID: <20251022050810.1572184-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251022050810.1572184-1-raj.khem@gmail.com>
References: <20251022050810.1572184-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 05:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225175

Clang can not compile full elfutils for build host.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.193.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.193.bb b/meta/recipes-devtools/elfutils/elfutils_0.193.bb
index 29a8ee5af63..b4498fa76ed 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.193.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.193.bb
@@ -33,6 +33,8 @@ EXTRA_OECONF = "--program-prefix=eu-"
 # Only used at runtime for make check but we want deterministic makefiles for ptest so hardcode
 CACHED_CONFIGUREVARS += "ac_cv_prog_HAVE_BUNZIP2=yes"
 
+TOOLCHAIN_NATIVE = "gcc"
+
 BUILD_CFLAGS += "-Wno-error=stringop-overflow"
 
 DEPENDS_BZIP2 = "bzip2-replacement-native"

