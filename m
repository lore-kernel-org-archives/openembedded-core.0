Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55C7C282DC
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:04 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.20222.1741090140306813163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 04:09:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AATK1GcB;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223cc017ef5so25090935ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 04:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741090139; x=1741694939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tWz3x5OwCyXwiCYAAYF3ERU/I+YovDHuufX6oVJ7Z44=;
        b=AATK1GcBBFD8WRuYBovqkpvVpJEqgl2l9Viy4fWiV/oxx7NiuAm1Y0Bs6cjS6C3TD0
         FvWi5NHRbi9z8aN7/inYImBUaIn9waHxLzAOuQCm6Q+elvpPTE+KDaujdubrcK9m8+kx
         HW6VsNSh8wEtj7/DQSbzPWgswQ9t7CYiw3oTXDknQOxRg/lgnlCpYcJjKZguYK7py8fn
         QCRIbZBkIewYhy5KRg7O4PuIzq2FV1Z02EdWfQZltaAina6w4TZvkhBh7n1cgRM4Ut1u
         R8e5PbvbN6FYrJdO/bN39fCeXcSF50a8ip1t6R0lHEFv9l/q48k9s0q/x0Yszo8HsRUx
         Fnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090139; x=1741694939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tWz3x5OwCyXwiCYAAYF3ERU/I+YovDHuufX6oVJ7Z44=;
        b=Y2O83EOpdo8gm3+S45NkpPyGcc7Dq2DYYwStJp28+B97Dhkl7Phjg2Pz1YuoriF+eZ
         6NqdOn/kMviovwQtJLJ9toNuSE9QUCM38BOLK6E1fe43PkYF4bmzCrLapOOXiBI7gCVD
         l1kp7OGv4s9ztW9P61fodb1v4sEXbwvLfc9fKFXbUDF8uC7GyCI40Bo0vm4B4BvJ1fec
         htj+Rwa5DL8FoinfHkqCz4BmGP8kqhpRpn9wJJ4I0oognir6WhywGF8gNdPKeC2CcIQC
         kGcRzrPlY8KFzDlvK2890P/K0MjM4XuWFAXUUSSfWiFzrUVac6dDnUn5dmNGviaw11Q8
         M7BQ==
X-Gm-Message-State: AOJu0YyJJ48cSwNbJfuSC9EdPfVaScIRI82GjftVYxiyMiQea2hONyxS
	hIKt0tp8xcWJDzuSgY4M2EF689a3B4jwR+9p1uH2AhZNKG/JI4K1VBr56Fqp
X-Gm-Gg: ASbGncvE7i1FCD3o5SGywxcsRSZq+8orXLkEUpbF/cqXqADV7XxqoH87zJzWY5t2B57
	Bp8ECfIyU6McCt1BNGHauw01GxeVmWNFGggY/Pxo6ZQThJa+T1oLsTOI5BbQR4NP94HuLVfTBca
	gkZ6PEmyMkj++jN0cXj7qitdDIZaYOnES+2zSjBV+8ShgEKYeTSczGKtOxdFRGIHSTFZD1yvMj4
	3Pk6h0DWMBKvjPMPyMWmcl89zKVI0LDqe1YGTpiL/fGMyTYN/JbTQ3GGncG3s82Yu0Jtluu8jKi
	ef033g4YIh+fFZPUyaaa6ghqJRCS6a61MWXFsReMetI9m3ECbqNmHyCKIbYf/A==
X-Google-Smtp-Source: AGHT+IEu776SnHmdjldgtmW2vEWW9uSkyLCBP8cP2W3A00lhI+fTTgp9pd7VPrKkArBJrHuQBe4SEg==
X-Received: by 2002:a17:903:138a:b0:223:4816:3e9e with SMTP id d9443c01a7336-22368fbea82mr254034765ad.13.1741090139504;
        Tue, 04 Mar 2025 04:08:59 -0800 (PST)
Received: from localhost.localdomain ([103.176.135.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d3219sm94560835ad.38.2025.03.04.04.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:08:59 -0800 (PST)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ppjadhav456@gmail.com
Cc: virendra.thakur@kpit.com,
	Poonam Jadhav <poonam.jadhav@kpit.com>
Subject: [OE-core][scarthgap][PATCH] curl: ignore CVE-2025-0725
Date: Tue,  4 Mar 2025 17:38:52 +0530
Message-Id: <20250304120852.47835-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 12:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212265

From: Poonam Jadhav <poonam.jadhav@kpit.com>

CVE-2025-0725 can only trigger for curl when using a runtime
zlib version 1.2.0.3 or older and scarthgap supports
zlib 1.3.1 version, hence ignore cve for scarthgap
https://curl.se/docs/CVE-2025-0725.html

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 439fcb7881..ddd591dd96 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -27,6 +27,8 @@ SRC_URI[sha256sum] = "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c65
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
 CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
 
+CVE_STATUS[CVE-2025-0725] = "not-applicable-config: gzip decompression of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older"
+
 inherit autotools pkgconfig binconfig multilib_header ptest
 
 # Entropy source for random PACKAGECONFIG option
-- 
2.25.1


