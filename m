Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4741098792
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 07:38:36 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7245.1774078713606417342
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2026 00:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WMzTFLF4;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so7266685e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 00:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774078712; x=1774683512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=147eCLL9FDGkMQNMtJCQxDdhWlmmtRBG6Hqb0GactPM=;
        b=WMzTFLF47KlM1FPnF46RYNFLRlPKU3x07enkt43CvwPHo5+ocuHLDC8LHQbXNwAdSr
         NYl4ue0hoV1YGbrUoS1DKSx74OpVYfyoKoQHY3ca39Mwe3o5Br6yM4LpOjt4YYV0OJmS
         Tbs5PVA7J7JXkW/NEp7J0vaiLDCkSYeX/dBt0nNgxIB1a6PpMM68NZEpIWaYIin4FDp5
         AABz5bsZprawVKpR2F6wZOyS7CvIXL4HLcuORti8AJc64FHwevDb7pAEOkwbTyl/xC/z
         TJzy1LDc1sYjd97htndKJ34yA4NKiJMaXSRlJB3rC59qJ7qe8kCOr4XwCoTR8LdvJVPz
         oBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774078712; x=1774683512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=147eCLL9FDGkMQNMtJCQxDdhWlmmtRBG6Hqb0GactPM=;
        b=kBr1zlyteT8tuG6v2G6LD1AgvYNQZB+B7LX59j4R7iMSThBHMbE+Knvigv4B1LqrD6
         3NELopYyDFlWmq1RpJqYzBMCoHwmBVJpRjeXRnermKehAF16py5ERg4Jth46vuGjIMVv
         3Hlsypr7DCHa4jEmkdOLIXGeno6iN8U8lmqsfJNxKd98+1snWYTLWKEzpLyAU2bR034a
         RK9dCYdiH80a7ZGlDfYM+4Q+NlzXgBt0f/7ggf8iOoMX9D5R2iD2yuU6ieaE9qP56Fn1
         54G0qj2YbkXCN08hrNKouNju6+aSdCx4esSxAEjCKQxwUmduGoaWlMesWiqT1+Z8962Y
         ZCfg==
X-Gm-Message-State: AOJu0YyQEDCoF6SNcqPRIMRSspIog46bGAOa9mTFL6RUhNbDCrkpqceH
	mM4aQjrKOM5LBC/IhZamMSXPvQ37GwLlS3aIaQXb5QyWGgOpTCaD7gFB+LBGOg==
X-Gm-Gg: ATEYQzxO2OI5s+IWpLuNil78Q1sVWlquO6GQjNY0UwrhdRfhRNvLMiRh+6iy3nrwqi+
	kZkR6CIxD1skXh7EX8/IZA7GZRKcA2YyjLhMsY5qQKM+GnTZUjDUJt9XEg5SD7ORAl8b/gH0VJL
	dQ/viMHUyYxdjK8SsbW6HhllBwsXyCeFA6P72XbwjiY2k5ngDLnq4rQQLxLuv9o3F2tZ+m3rIhQ
	Jkj7JkuVb5wLitxUg4yb7UPm/lAisaAgPVDJY/aJL0wVclpwT0EbpSs9fpeLXb0VEauHaIgoAgS
	VrxcPaX+MEIwgKo21OkfZzYVBQ5wBTIntOt462oKMtDeoJ9DbSXayMylYyFkM6bvcmO1F7HB61r
	bi8TPDCqnISV2kh9QknLxV9rZ1NXZFQj05Y8QmLWOO5DznTSPfe7rjyTmTVLGpVyULP0NZE8yxt
	9oaS1L0fMcewdb4n4y8sS3TSlR
X-Received: by 2002:a05:600c:c16e:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-486fedb9497mr73161045e9.8.1774078711740;
        Sat, 21 Mar 2026 00:38:31 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700658441sm149916245e9.4.2026.03.21.00.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 00:38:31 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [whinlatter][PATCH 3/4] gn: upgrade to latest revision
Date: Sat, 21 Mar 2026 08:36:39 +0100
Message-ID: <20260321073820.1403645-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321073820.1403645-1-zboszor@gmail.com>
References: <20260321073820.1403645-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 07:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233649

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8a59c0c601cd9c52c15f24e0d7b65c0012f1ecc7)
---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index e61f3936c9..81d1814191 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "64d35867ca0a1088f13de8f4ccaf1a5687d7f1ce"
+SRCREV = "103f8b437f5e791e0aef9d5c372521a5d675fabb"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.53.0


