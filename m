Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4AEDC5B553
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 14:43:38 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.17465.1748443415789793737
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 07:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yNFMYx3H;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22d95f0dda4so50468915ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 07:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748443415; x=1749048215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAnFlkA8So27/5ZaH5B/oXMHV6qrwY0cZc5r1ufpqBw=;
        b=yNFMYx3HGYwl91b9MFy5kXSv9n7PjZtcwFiIgZeUpd8XkSMduV3uJ53G68BNpQoFOW
         ByFMWn4OU18TEOTHlzs7DK1S0DWt4aiZc04qA4Xe7X05DrmqagVP04W7pAlrZyBQ24qO
         7IlI96gIJmOd2rI6Hu1oOW0jC/0S52Je5Vg+dhuc/fnKGINSDgQJqwH7w27PmUjBq9j1
         VhtBh/t5Q2zRb5ZBcfoSA4DzUZpVBzs91zrHZe9LJ/4FDvb2fsNwHhBgtt1mXXRJZPK7
         Uti5BcLo3lfaAAdn78oUdSV9IsFYaAanC/tvbT3BQSv5Q83++7WbKGBocN4SLGlihewy
         ZMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748443415; x=1749048215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAnFlkA8So27/5ZaH5B/oXMHV6qrwY0cZc5r1ufpqBw=;
        b=AjY8cmaamyZEbKRbDJ1CpXJL2Sd5ep4j9Ox/k82qBel4bK2dE53xEcRpyrvuBcxx1C
         1Hr+dd7yOCgvRXup64i7CSF9NAC6N7lPQm1uRIsI46x+r1d8YqkX4GecSJO6RHyXF6jf
         NCF4HcgLr151/3GYFXCmIk36KIIyg5eCI3tR/bnUiErwR1ZmaQnzyvdtnr/SsUNw+TU6
         WYEgLnZHKp0Xol7d2e1PBDjWdJ8Lw1U04u4JiPa3xLPTND7J8U1xeOkewYIHu/tukfb2
         DpBv/QBzLnZDgmWvubfCF6aiBomZ6kyMcxWro36Yk0zBSKx8Jjza3E6ouodCLzhTd2u6
         AxdA==
X-Gm-Message-State: AOJu0YyZi7gOilzL97q9kleLSsxwcJTYTNWaLzkYaCQwSeDKB5oRDkAH
	NIbmrFbn3wNUl6pb6dGPMNgWXCc2tBQ34fIGCPHd83GadhGISX4fNdfRIj7TVtrNx9P58aPlIAB
	C6E6n
X-Gm-Gg: ASbGncsmKSL2Ee5DqeGlUjFrp32yCfIundqBiKWB8Y7afmWfzKc50IVpLZraPAqBC7t
	k87BZaPOZC2Q8xxHLaiCbAn4sIkuLCMFbhEepocMwbAFbsNsZEc5pjx6V6EWfMZ8ftiA9oLVYzl
	o5yoQKY6UHnbOdu7rEJdJakwnjbGFjRA38WDNEs0ml64pbkqvBrv/j8AFgO8XorljQoJH/NksA0
	g5uH66u9swKkRsfJo2ZwOAlCGs/oFSaiDEqQN0b5/2J39X2uaf3KjWn99F//kPV4Z5cn8zAUU4B
	FY8I/C0396HUfQpKUReSakA2T3JWl/O3IuM1dZwahJI=
X-Google-Smtp-Source: AGHT+IEaRMI+UvNwWStRCpAs7HJdQrTo0Ohdozg/QyWZ0m3Xd7lINgNgYX6wOMVaE2ErBrJTfHknrA==
X-Received: by 2002:a17:902:d2c5:b0:234:a992:96d8 with SMTP id d9443c01a7336-234a992983fmr86143375ad.19.1748443414966;
        Wed, 28 May 2025 07:43:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f1e2sm12626285ad.140.2025.05.28.07.43.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:43:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/11] binutils: set CVE_STATUS for CVE-2025-1180
Date: Wed, 28 May 2025 07:43:11 -0700
Message-ID: <9c63f1c73426532a94f01fbbe26c9f52a3c4fdf7.1748443238.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748443238.git.steve@sakoman.com>
References: <cover.1748443238.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 14:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217360

From: Harish Sadineni <Harish.Sadineni@windriver.com>

CVE-2025-1180 is fixed with patch from CVE-2025-1176.
More details about CVE is here: https://nvd.nist.gov/vuln/detail/CVE-2025-1179

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 6d0390b5a9..16db8bc05e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -19,6 +19,7 @@ SRCBRANCH ?= "binutils-2_42-branch"
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
+CVE_STATUS[CVE-2025-1180] = "patched: fixed by patch for CVE-2025-1176" 
 
 SRCREV ?= "6558f9f5f0ccc107a083ae7fbf106ebcb5efa817"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
-- 
2.43.0


