Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C891C8303C
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 02:51:41 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.5564.1752029494048709729
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 19:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AuaAbM43;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23c703c471dso4656665ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 19:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752029493; x=1752634293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UdjEflhjdkDQ/L71LUmZOvxtewYt31QsakG124oORIg=;
        b=AuaAbM43vKCNX0b8VYJNoH5WKE+KLg8nFFGiWA5F8H3h5VWhfXNrjiDvyWSTpajYei
         a8WH8QHm/p3zF+BGTvSbIevR+a4YIT9inSYSoQsQb5mCLBCvNQsc23yLZ3Wo4FQDg7+c
         OIsMcK3k/cB9u5Lph8tvFIrKTBipuHxhKFsDQf7Td1UDjLD+EI4BMS5bEJ0UK7RFtZJt
         7tslwAUBmMzpBsoOXxfke/MIXWPlcYFzPd5mO+UE+CTXGvR4E8cyB/b664KyoiufhZ6w
         P2KVQYRNRh/qVNUFWl6HvCgt4b2gdwqX/5vXQphPn0ZR2//knn7t/w5k2y9mVaeXQBT4
         BZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752029493; x=1752634293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdjEflhjdkDQ/L71LUmZOvxtewYt31QsakG124oORIg=;
        b=Teh1qitqK6qzrfR5xhCbWqXJWR/MriCN/vpg2f2CxdFTy0IZAU2/zvnXxgG9q0bekC
         k6ezHdZ+29Wbh4eVFarlBz+Nby9glcg33hsvHTJS7pkRQ9DfH6PrbNkZzlPUirTXM11C
         7ln9siR0N1OkJ92bkIUaOWgbE77hnK+rBJSuS3BMdJhTwKWEfP4cipH3lbpUMfM5Klh1
         pn00alejHcKV1kmCU99jfDxaxIJdScogxlLFaXn80fC0uqCID/Fj4jxOybhTfBpMpp66
         6FQyzV/7/MjjQsLlHIdFhLj1fUkwY5/Vpq8d3Bl/lQuM9u1uk/JC6PEVlXVS2pCSMoak
         MNGQ==
X-Gm-Message-State: AOJu0Yx4SCbLRND9zRmhoq8rzbI06Te/+HZdm6wWAcPXyjBVv1LAtd9g
	fFyYScWuj5IrVGbBTyNKKORofLFifTgsyg+KrgBd0/43Rs0Sva+g0KF1Ys0rAUPUphkEwtkve8E
	3JHao
X-Gm-Gg: ASbGncvvk9rI7it3nKuC4kG9hVX3Et5Pc2/Dxy5ZaxKelx4TExQ8DkQoA9LfBdYDyu+
	joTSq7sHGjIVAxqbw1e0FRO4Te3btl1bz8NaHuCPAR2Pr5JR4I6iJ9SBoOYblIPWP4VAACGg+3G
	tdSU3zlfVvtc8IeBvT+pVRDE1sqlw+MSs7NG6cHzSJ9kecymRwTQajb6RHTyVn7tjNFRTK3w6Ql
	gfmFZ7/+iye2tvcb8+JgqaOyIHdyl60lh94xmGLzgsk6w5KmrqXXN/+7pKDOnS86G8FXi+C9D+B
	drIy/S6b9xXAprg+auj5jrIuh8YmjG8tlT7qQLZ2x2Hkv/HnEhB7zA==
X-Google-Smtp-Source: AGHT+IHLVxc/375Cqf5YFCWFl8iqvKEZcIMP2DdavAq7lMz4rzreacg1HgtjTGicYi/NKsrqNH8isg==
X-Received: by 2002:a17:902:e88c:b0:237:e753:1808 with SMTP id d9443c01a7336-23dd1b43dc5mr69522575ad.20.1752029493241;
        Tue, 08 Jul 2025 19:51:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845922b5sm121979075ad.199.2025.07.08.19.51.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 19:51:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/12] curl: set conditional CVE_STATUS for CVE-2025-5025
Date: Tue,  8 Jul 2025 19:51:13 -0700
Message-ID: <8f50b0761fc4d49fae8d174956052e3ff9024a5e.1752029282.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752029282.git.steve@sakoman.com>
References: <cover.1752029282.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 02:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220059

From: Virendra Thakur <virendra.thakur@kpit.com>

If openssl packageconfig is enabled, set CVE_STATUS as not-applicable.
This CVE is applicable only when curl built with wolfSSL support.

Reference: https://curl.se/docs/CVE-2025-5025.html

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 2f5bf8c8fd..a21a086f40 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -37,6 +37,8 @@ CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl dan
 CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
 
 CVE_STATUS[CVE-2025-0725] = "not-applicable-config: gzip decompression of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older"
+CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: build with openssl','unpatched',d)}"
+
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.43.0


