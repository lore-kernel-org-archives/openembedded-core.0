Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FFFCD98E3
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 21:47:43 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4369.1763070457464953680
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 13:47:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oPR+b/Mc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-295548467c7so14773205ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 13:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763070457; x=1763675257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPD79Fm1wkYhS84p5PTs2LIXexrFUIBnjSVHQJbeWIY=;
        b=oPR+b/Mcj7VORISpGemBulX7F4oOwsheiSRUlJkcfaC98kiTLjHE1vK5+fcsJgRDju
         RIQdwQa7ECwcB1Kc81daEmIbLtIdcm7rZYoiLlXmqJuQF/AeXs+1+FKZgHJkJlHM4EcZ
         a4biN9fWYGZVmwErtH6mWhG72kjjZ8M38/k1pTxGtl3BEzFVC+b7JCoCyUMukYHwQWVv
         qdprPFGbkRfH74Oo9xr7ztd0SXMmuByL9N2C001Kzm8gbhEPxqeaoXAGWScuGzsCP9Tt
         6wJzn2Z9IJ5SM34LBcZEjr66BTcGG7gyv2Y15x9e6zT/H6KtaFwDHk+FkSz2E0+4nj3M
         Q9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070457; x=1763675257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BPD79Fm1wkYhS84p5PTs2LIXexrFUIBnjSVHQJbeWIY=;
        b=USQlnlDs1c48w4k0vyiGkdtd2q3nUaxvQvojZQSz4mmdO216Mzz9M+koCO7FRU6yrN
         GNX8UluppA1S7Kj+wBwcxYdSZkrNXJQqQ0TZll06iLxP+txOKTLuc0+5rJoyXS9vTUvU
         Aox2A9MzJ132gVvZAGckTGZh7Xj+HIrzge/Cg64xLLCHshOYuQEiuPsCwtvlGMSctRYI
         2CsJcHuCgsUC7FunXRf8w8Vnm32iCyyc8X0KO7g/rtBs7j5/F1N4XJsGBcdpg11dCCT4
         XmDMIHjMACRMEcc2Wn5sW5euaT2d8AUydl1abthCoTBfL+G8J7e70X0aZt9e3iQEWce9
         fW9w==
X-Gm-Message-State: AOJu0YwxpoUQGRO02vNZLSQgyM+AlJIAaHDaWYkqxtByuf7taJfglcVy
	tGnijwpmg6jNqIHafYkj4RsmNELdLe4NAR27zqHrMK/LKD2knpD/pIF9f6MfdsQhGYRL+LdJo0s
	3OWxi
X-Gm-Gg: ASbGnctzgY4FweHdPIWrSbbo8pIhfeb8MrowLWCuhYsWd6BFJvkHLHjUanFFImjCLqM
	VMz9jufzayLJJ4qywHQ2BHnpeNz2V/M1AIDppjnU/DJrUaYRkC2d/QarAn8JIJlbC9RY73JvNkT
	4G1Mk/teB3MogZJDD0yOwb0fM4alvGgmsCXY4KN9igX4bvc52NS7s2l7w1HnzlZK6aDzrGT5j1q
	85A4lkdFo2Jn7jmE6TdsEo30blbrQpzbXRLv6pWrABxg1W04AgXwu8l6iaE4kkpCJ36cnmW//0c
	ZLxeEzZqZokEd673f3yXsoAyc3CiFV/uauQfK7VnA/U6//QmRy5TBD1ugWWImslmdE4psdnCPb6
	wYO3Se+AtXBJ6bdajpvg7/sTD6xgJkhnJNLHsaUuGLBkMZcYkWXhR6r5gzbwAjE60Tg==
X-Google-Smtp-Source: AGHT+IEzIL2JoyAW+ThXp+ym5xvfLXJBrQqH5TPwJsqfwWPREcnAeIZ4NyedF+7DbmS5rxSf4oeW/g==
X-Received: by 2002:a17:902:f712:b0:295:a1a5:bae9 with SMTP id d9443c01a7336-2986a6ad9f5mr4143805ad.8.1763070456658;
        Thu, 13 Nov 2025 13:47:36 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:70b:f91f:acd9:f6d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d68sm34639815ad.61.2025.11.13.13.47.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:47:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/10] curl: ignore CVE-2025-10966
Date: Thu, 13 Nov 2025 13:47:20 -0800
Message-ID: <41c4735658e9ba5322bd06ef50aa3a1edb1f7fd8.1763070333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763070333.git.steve@sakoman.com>
References: <cover.1763070333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 21:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226273

From: Peter Marko <peter.marko@siemens.com>

Per [1] this CVE applies only when wolfssl backed is used.
8.17.0 removed WolfSSL support completely.

[1] https://curl.se/docs/CVE-2025-10966.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_7.82.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 54362e6978..2326392a4f 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -79,6 +79,8 @@ CVE_CHECK_IGNORE += "CVE-2023-42915"
 CVE_CHECK_IGNORE += "CVE-2024-32928"
 # ignored: gzip decompression of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older
 CVE_CHECK_IGNORE += "CVE-2025-0725"
+# not-applicable-config: applicable only with wolfssl
+CVE_CHECK_IGNORE += "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'CVE-2025-10966','',d)}"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
2.43.0


