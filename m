Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C15C3ABC3
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 15:14:25 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.78319.1746544458601513634
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 08:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=d+v9+Jke;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22c33677183so69808255ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 08:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746544458; x=1747149258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5NLnq6VhbqA7SpbCL8LDFmZ3BdwnNzNpSrUxsoIEz0=;
        b=d+v9+Jke+3+ku8Yr1D0LRRkS++5jBHGXwaHQeDhkv1TVGubgB94weCd+vCWsgZKU2d
         0kBqRxruB4cGV99qIBbdSe9gMI6nsTBWAOxlikd72FtKEhtFUnvzQhTG+2u1CszreAG7
         Pjz51n2z+TuFqohrNcXZvwt2zmDvwrAIYuc2JxK5Kz/XslwyvuBVow3VgRyi5o3E7QwB
         zIPfavat8SA3eFfqs9pHAy1TvUgnDlXUGBQiMbvtqwQwZmFRQd+0wo3aX5HFmFAcU+di
         nxRdYP+qHKSXmHfCW/mx9z3r/VWuTx3F+9a//ktTK58ZxcsvdDTMBoKas3TeQIn6U+La
         E7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544458; x=1747149258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5NLnq6VhbqA7SpbCL8LDFmZ3BdwnNzNpSrUxsoIEz0=;
        b=pnGKwKufanZ1aszABaa1W06CW5m3pbuZtJCm7P8yxIuVlDJtklr/1doGbztdjoZ4i7
         Qg/hfocjoonOg1IHI4cIBJ6YdLQvW3haAYNXkI14UDKQ8fp7XHLVCnhhuKdAoaLaFTh3
         VXPOmNERG7gXKkvdc0TGKIuIDJ1Pxv8HSjQ0xPF3FaiKIceHqQy6Ys0TPjf738xxSesg
         KEPepsvHyBiwz67fQflZmMPg637MORdgypTEPJYVMWskOvL8FDwU3EHPn+WR8RGR5dOP
         B7vF/aETTm9KtYYH/i61I7dK6XGNhiyvaFWF8fs0KysNBDaiJNis45lMJlyfLQ2zjkmD
         KcPw==
X-Gm-Message-State: AOJu0Ywwm9Yzr7veqLxm8MDCf9dubvUfwgWNbFCX3wkJePUh5dW9CucF
	KZwRis2BI+MlwckqSQqkJkbDFuaWja2ffhy5GSJIKL+rNDvn/XVbyf8kSMfckjy6/hCCECVZp+q
	S
X-Gm-Gg: ASbGnctvTMhvPpDY1vpMEaetIpRgNYWCMCP0t/zHZlAx9LBTJNk3kPVnbSI8seYy5Fu
	+XqRT3TWzosgJGqCThs/Gw53ZW+S6HX0Bz8oIEw5XAaEbzwyGBbaDhPgh6iFHmF72A1XvQNqkQt
	UM/1YnpC9w0vmO/eZf4roTR+1TWo5fPKxz6itawXyQkXss2lABqCyNqz/34DYVAJD/8y66usgNv
	prdQB48tPmxJ7PbgxuU6rR9gu4MuyO5av2jd7eKe4t1S27HkYqshHHVa/UeS+1Hws6+IklKJj6f
	Bf7pvJsDr926NUSW1YUdXM2mCZDK/Ets
X-Google-Smtp-Source: AGHT+IG1+OqWVcuZBVYldOC7YrDh11yZaJiae+7ImG0PFUTQlf70YjmVS3tlHmFXzFn6pwNUWj0m5g==
X-Received: by 2002:a17:903:1b30:b0:223:53fb:e1dd with SMTP id d9443c01a7336-22e1ea1e788mr160153865ad.9.1746544457951;
        Tue, 06 May 2025 08:14:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:8d37:c5d1:328a:ee43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fa58sm75222545ad.150.2025.05.06.08.14.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:14:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/7] binutils: stable 2.42 branch updates
Date: Tue,  6 May 2025 08:13:57 -0700
Message-ID: <08d6ca500e6dd571f5882f82f6ad804bd2eec8c8.1746544207.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746544207.git.steve@sakoman.com>
References: <cover.1746544207.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 15:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216062

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commit on binutils-2.42 stable branch is updated.

6558f9f5f0c s390: Add support for z17 as CPU name

Testing was done and there were no regressions found

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 9fc29301f0..e103e712a4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "758a2290dbdf0d6d6c148c6cf25b2bcfd7a5b84f"
+SRCREV ?= "6558f9f5f0ccc107a083ae7fbf106ebcb5efa817"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.43.0


