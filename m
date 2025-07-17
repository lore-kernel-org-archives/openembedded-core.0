Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22372C83F38
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:55:51 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.40450.1752720945222885206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gLClDns5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-31329098ae8so475342a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752720944; x=1753325744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gWtXN1I8jx06x7/TFU6OKBmyh+nlky1SUgTksdoq2I=;
        b=gLClDns5xP1r/wyvDjwRWt+ud25xaOBlhXJkbTc0ii4Yr7PWDMOeTb/ywK6RurDyKq
         u9UCPaDrZMH1i/lGmg/0ysrBGVUuknueFtARfnFMjWqB0LNsXv1tAowBJNVno91RCyeR
         LSjow5k9m0UZUiusnPoHehufFrOHaCJlS3XxVXdbIg1bArUIMQpomOMklfisKn6S5Gcz
         evrb0VN4jIdg3fMuNkjfeWmmUxJDcdhjOTn+JWaCVaCXXwK7KOCQ9iLMQkEMVQl3s2VS
         4EOs/x67xU9d/tCvLWSHydrklhB2h66HV3eFMV98KgARkZDRumIT39elqnWKiWuP/THT
         5FwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752720944; x=1753325744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gWtXN1I8jx06x7/TFU6OKBmyh+nlky1SUgTksdoq2I=;
        b=Y7mXNY13JIZBIiXihLySLOmpNTiWnsoDxUM4u/DLxi2AfG+/18rVXDZlJIypSz4O2m
         yHXfMJeNEgsbn97OarGlYDUH6heYcRaWIfd+qcILMWy5isgZj8UjygKx+UHgse0m4esl
         qf33nDyStW+/I9rFWy1Tt5epLpDsIa96RJhzFUtaMVCVQA235EfpWwKIcjGstBDpbZZx
         qnKM5LjYOVU1ga+Fw57Snx0nh3NOdLnu1Ii03nVE5ygRP++d+F5cK5oPthNkkCZbBRbD
         MRt2FuRORW1y7wy1joXAOqNN1z8KP8+t0j+l2WMm2T7The62KkLG0jH48oGOIKM5sdxY
         3nRg==
X-Gm-Message-State: AOJu0YwZqs5il8AKuM2A0YhAZfcNWjPWQf9069x+VbNr8BM+XiB4Mjhm
	PyWhCWiQ99Pgy+vuq/XQkdaGabkdRHMpS46+ZdwiUlfQqerPrz/20lr2+nmBGpi6K2MfGsDPvzv
	Dxnko
X-Gm-Gg: ASbGnctTAFIdMhym8XwQom5FV0jUSZMmfG7PKrWftSYmlII09AnNg+oUCWJ5unHSTQp
	PQwByancy3G4xnYXCKZdjPx8/DVHxxqy/rlFTtz/BRfZ1Sv5hi8sJrfML4vLDVS3GbYL2urF0HA
	7YMNM6e9xMEg84laDyLxfyko/KcOUHMdvgBPIkn8iI26i6y1ktRnRS+kYVOsFBiikEmhK8QvL7v
	uoYoSvm4kRXHWaP/Vgr7HR6a612TmLwz8U9atI9Rb5Hbjnv1AFQMP67Q4SsOGK7spISzyC4YOxl
	vCkKPpvuKom3SouwJbIDaruy8B70pUeOivUBs2exK9H6s8S2ynpuseyskx/EWmQhS2suAAdIAfh
	XX9jk4oVh4pVLmWEpww8D/my2
X-Google-Smtp-Source: AGHT+IGVl/hGD3D9TfIz6RSM0zq1km6fBl7t8WokIQqPUu5gHyrcWlMUPSfyxLA+2tpvrVnO4aAneQ==
X-Received: by 2002:a17:90b:390a:b0:311:a5ab:3d47 with SMTP id 98e67ed59e1d1-31caeb67544mr2450295a91.1.1752720944415;
        Wed, 16 Jul 2025 19:55:44 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f288173sm2333256a91.25.2025.07.16.19.55.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:55:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 02/13] curl: ignore CVE-2025-4947 and CVE-2025-5025
Date: Wed, 16 Jul 2025 19:55:25 -0700
Message-ID: <93ae0758ef35031c21a29f84e5481d99c218a232.1752720827.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752720827.git.steve@sakoman.com>
References: <cover.1752720827.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220488

From: Peter Marko <peter.marko@siemens.com>

These CVEs are for integration with WolfSSL which is not supported by
this recipe.
Ignore it if openssl packageconfig is enabled as it was done also in
scarthgap branch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_8.12.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/curl/curl_8.12.1.bb b/meta/recipes-support/curl/curl_8.12.1.bb
index 4192693da8..9e279bbad1 100644
--- a/meta/recipes-support/curl/curl_8.12.1.bb
+++ b/meta/recipes-support/curl/curl_8.12.1.bb
@@ -25,6 +25,8 @@ SRC_URI[sha256sum] = "0341f1ed97a26c811abaebd37d62b833956792b7607ea3f15d001613c7
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
 CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
+CVE_STATUS[CVE-2025-4947] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl', 'unpatched', d)}"
+CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl', 'unpatched', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.43.0


