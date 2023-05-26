Return-Path: <pramanik.souravkumar@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AC5C7EE2D
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 08:39:02 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.3809.1685090336498859324
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 01:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LoZBXFud;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: pramanik.souravkumar@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5346d150972so450548a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 01:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685090335; x=1687682335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5/Y3h6m0H27Cc0gz66SWgllqJeJbsBPtQsVvR8egP4s=;
        b=LoZBXFudSHpdSQjM+WkXLmkx3XRAx6KOZBgkdAZDn88GlfxwGebIgpBf5ykS4tfnSe
         oTQPOU8hMi3XWcvRDUGFySW1peSK6gG54y1AGqSDKkUHpQT7tDmK4kIGAFZL1NpDDMiQ
         8y95mcL6qkkyORvnoxiqaJZMedO+AfhPeOxdQ/UKivF9YJipGhnLSL1+KPZfTF1UuFqc
         0ySu9729w6UsDh/BH0hTQBkSu1BU3cduhEq0ncm73NpL1/ht7JniaRmyqSbO8a+UaCeg
         d3soKESiK38yHO6WIceZXxcqB2/yT180/jUu2j/qjHY7v2FmZwLe9gjXD6Klw25H+Pef
         1A6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685090335; x=1687682335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5/Y3h6m0H27Cc0gz66SWgllqJeJbsBPtQsVvR8egP4s=;
        b=h7+47NI/ca/sg+FVerdJsZEdwxrF3mqwAd4vuARmG7YWJJqLSO1x8Zn3xJLD3VT0ge
         QADtDdmVvLSKCPDOZb7joS9QcNIculOipe9zfSZTtzUkGdz8CzIMFAZgil+eQXwB7Tb1
         tYk6LvaSD0e5N1GMyC2U0kZb0c3os1fHy2jkOhvaUJ85AkZOrnOjYxDvcLIpBx3q1uv2
         C/KJ61eNxpuaC9tXcNu4dmgOhQeO2xnQy8ZPm4baO3lQfe2bWtEL9NoQKWNs/uK0C113
         pQqEkoU3xaoOVIUm6gx/S9MqqRiDo+y530UO8HcTIvAg7L+5GWpvfbCv2L4oobjqndsF
         gGPQ==
X-Gm-Message-State: AC+VfDz2OnzjhKOfOpIUtyUNuf3gDzaDWVkv6KMVji1Tj+Ly4bPdjKbV
	IDbsGid7KdSIvzPvH+YYNmQ0iIeKvzI=
X-Google-Smtp-Source: ACHHUZ5hOglTLSyOGPsEUeAiNSf3vDtLS0ZEPNptiknWFPUZHnakIIGBLvU6FjSjQ/6H57Zmrd13gw==
X-Received: by 2002:a17:903:245:b0:1aa:ebaa:51ce with SMTP id j5-20020a170903024500b001aaebaa51cemr2303009plh.14.1685090335505;
        Fri, 26 May 2023 01:38:55 -0700 (PDT)
Received: from localhost.localdomain ([103.53.233.89])
        by smtp.gmail.com with ESMTPSA id w8-20020a170902e88800b001ac55a5e5eesm2715763plg.121.2023.05.26.01.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 01:38:55 -0700 (PDT)
From: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
To: openembedded-core@lists.openembedded.org,
	pramanik.souravkumar@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Omkar Patil <omkar.patil@kpit.com>
Subject: [OE-core][kirkstone][PATCH] curl: Correction for CVE-2023-27536
Date: Fri, 26 May 2023 14:08:31 +0530
Message-Id: <20230526083831.33336-1-pramanik.souravkumar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 08:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181765

From: Omkar Patil <omkar.patil@kpit.com>

Correction of backport link inside the patch with correct commit link as
below
Link: https://github.com/curl/curl/commit/cb49e67303dbafbab1cebf4086e3ec15b7d56ee5

Variable type change from long to unsigned char as per the original
patch

Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
---
 meta/recipes-support/curl/curl/CVE-2023-27536.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl/CVE-2023-27536.patch b/meta/recipes-support/curl/curl/CVE-2023-27536.patch
index fb3ee6a14d..51a5c0eef1 100644
--- a/meta/recipes-support/curl/curl/CVE-2023-27536.patch
+++ b/meta/recipes-support/curl/curl/CVE-2023-27536.patch
@@ -3,7 +3,7 @@ From: Daniel Stenberg <daniel@haxx.se>
 Date: Fri, 10 Mar 2023 09:22:43 +0100
 Subject: [PATCH] url: only reuse connections with same GSS delegation
 
-Upstream-Status: Backport from [https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb]
+Upstream-Status: Backport from [https://github.com/curl/curl/commit/cb49e67303dbafbab1cebf4086e3ec15b7d56ee5]
 CVE: CVE-2023-27536
 Signed-off-by: Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
@@ -44,7 +44,7 @@ index 6e6122a..602c735 100644
    int socks5_gssapi_enctype;
  #endif
    unsigned short localport;
-+  long gssapi_delegation; /* inherited from set.gssapi_delegation */
++  unsigned char gssapi_delegation; /* inherited from set.gssapi_delegation */
  };
  
  /* The end of connectdata. */
-- 
2.25.1


