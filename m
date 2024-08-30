Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CADCA0FEB
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 12:52:58 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.13592.1725022375490668406
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 05:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=E//i+6kX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2020e83eca1so18839595ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 05:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725022375; x=1725627175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+Gf8PY6/D0Jddr7kL6vAiXbO4lJfXh8K4Ew4sY/Ipw=;
        b=E//i+6kXeKJ49ZT/xk5EPQwJZiYv6mjF4qMWhK8LFINi4baD4GMGh7BWo/FfZbwzfU
         uGy5PH9eRsmJI5LzLs+w3N4HGgaV1AN1VENiyjQECoEaRnROR3fbev31WvRQIo6aMh27
         Ut/M8Vb4lf6xWrjV7NJFvGBd/iR9ZCXmX2d97mkDjv0eGtEYOnxphhcAhBOZmd+pXlmw
         dzY02sYS6XazW6MXBbaTn9a1AFznrLcPbipWuKzXZDVySZWHklsLTjMVhF7kbjCmdMaP
         7+5vnQo/mbqRQ+zKyLgCVEEs3OglWAOQkCt1NIPnoICEnFEM8C9rLU5xZP0SUEnkFwfh
         6GJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022375; x=1725627175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+Gf8PY6/D0Jddr7kL6vAiXbO4lJfXh8K4Ew4sY/Ipw=;
        b=ZWpFSm25Or9XKeUM8xxUP3Q776K3LTH/0/vF6Flje3+UE+i11q9DSvPRz5dvXgAsEG
         +8Htkw2XD0hisDtwuWaiqTilB3JTUj20+Xcqywykh1IeENLcyugtjbg2FzJd4j0SY9jY
         O2/THx2yRrAtcMlaukiL2Q1Ma86jl++2meYFgwWp7QIV8mfl+MWWyuWwJQ+U3pugNhb8
         s6nlACdS8Qp3EpGnbmeE6tzUbtbMCk8xRtfmLu2r16eS1Ng3UpH6qJxRjq/3D3H+lGmT
         8f6A6UCot5VVhtig6btaE/82UgK2haw0LlDdzRkj85ymKiFQfoJCn/ZVXLnIblvvPkYc
         H6Lw==
X-Gm-Message-State: AOJu0YyuFcswb+QXVWxC73UWriWl61iNOTSR7biLLRMdYI7v8+YUcuAR
	thJWLKL4+P8ldAtRGTnaSngjv/eKgzZpR/GIHe6c8AtgxWN5FJQEOTgm8kqUgP1485TtjvkuuXY
	mEZM=
X-Google-Smtp-Source: AGHT+IFugrYGkWrsBY9ruHKaUFPkbFF5e5ta0Da+vbJPgsxae6v/xLzBh+YiGKgJChSffPSyYgbSjQ==
X-Received: by 2002:a17:903:28f:b0:205:3e6d:9949 with SMTP id d9443c01a7336-2053e6da7f2mr2685755ad.52.1725022374739;
        Fri, 30 Aug 2024 05:52:54 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051554235bsm26295975ad.214.2024.08.30.05.52.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 05:52:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/7] curl: Ignore CVE-2024-32928
Date: Fri, 30 Aug 2024 05:52:42 -0700
Message-Id: <ad703de483258f459acc6a40385ad00a5182eb64.1725022186.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725022186.git.steve@sakoman.com>
References: <cover.1725022186.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 12:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203961

From: Peter Marko <peter.marko@siemens.com>

This CVE affects google cloud services that utilize libcurl wrongly.

(From OE-Core rev: 27ac7879711e7119b4ec8b190b0a9da5b3ede269)
Changed CVE ignore syntax

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_7.82.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 81a653b583..308b508072 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -68,6 +68,8 @@ CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl dan
 
 # This CVE reports that apple had to upgrade curl because of other already reported CVEs
 CVE_CHECK_IGNORE += "CVE-2023-42915"
+# ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack
+CVE_CHECK_IGNORE += "CVE-2024-32928"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
2.34.1


