Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31AF7C83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 23:03:21 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.7033.1753398192931501473
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 16:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G9NqFEyQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23f8bcce78dso17616065ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 16:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753398192; x=1754002992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uupC9BpJU+wlCucEXx32psJXbCB3WBUC+4B49G9UiZE=;
        b=G9NqFEyQ3Tzyl9SXBi6YQdNg1tdBuhLzPkh84UK+1z0ipbz1o9cZJqBGqh6aU1/cRh
         zjwlWnf00U9a0nOqFPy9D37iWq/okv41f+BdUZaWjnALugtSmJ2OvI/P/URbOG0MstPv
         OGpogVZpzi1yfgQZR+ZvTnjmQogY0WjWAmEdxSiv/hVueENNf729kCWGzrD30NecDX2s
         1aKy+4i9RahsPxya8OvEqUkXI7U90VrAHWHKbbP7i31LPQY7pcN416zlhwGCuhXaU+cb
         i1GVQaYkFBJmUUkYj322Tn0t3x10PJvzpnP3iDP8ZXRYIfXhZ80YdKt0GHl/64KW7IDu
         PMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753398192; x=1754002992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uupC9BpJU+wlCucEXx32psJXbCB3WBUC+4B49G9UiZE=;
        b=QwE8X26yujMrwmNsQlwtcgmH9Q8HL4QpiJxNGufvzOTfv6louStVPdJ9iptNNavHI9
         BuOJ7l65feCp2sGGKCglVgrbXPYqyii4n7x8rmtpuhso00Ektugvm5ywMCQTaO01+324
         MYGJzSHVugRHQNPFcukVcwdhDCokdY9ws0eJMPX2N0ZbZT1ZolyqSA2dyuHHQeGxLPQi
         kzRygFYBmtXx+oNKP7akraVBn+X6CuiyZwgWlbJthIkqBENzLWSG5rHVTY9MAUaJFsSB
         kL5PrHIrivJ1DeueHUSvckkQA1lKnJsxgmbvJEgN8nfUSAq99MmMzdYT4JSqwk8WWQC5
         ImLA==
X-Gm-Message-State: AOJu0YxmshZf5M60SX9ye2b3nJZXVFFbaxmzgSiMMc+LtNmSDgN1Mr+k
	Otf82q69zZ9fPeK7xdF41tr/4X99XUzyJX8v6ggvgc5Ut4DZywBelnfC0f8iii+W2cM=
X-Gm-Gg: ASbGncvGw6oDWb9MsBMezQNfiTWjWlhKl1fQUiPWLQ89VcURTmyDp44eHQC/4T6c/k1
	54PEFu+Rl4w6wOEEqXkUg7JDBNL+3OwZmauPejdUaQi+A406m3W8YXH24GAkwfY8j6yBCjEfCzn
	sZIperQzqOnNUkuIbp+1T6c41kj3GYV8W/HTKZ6V/v/1qq3oEkF3Y2kQsY/t3w6BqCTIHuO9Wz2
	hLft/4eerh62f7su/rxIM+got4ky+iN0uShwM6xCBbNROB9FCqgBPyaFURF+t1JBqAF5cLpm+wf
	6fZPc/lMiPifHHYujQwwN4fuUU0AjdFHTdPiH0CiWIyP1L2W1f3qTNKhS08K+xa+NGQPONVVb+z
	s2nBTHDyNuTm/RQ==
X-Google-Smtp-Source: AGHT+IH1wGoPK+g/DBeBkXBY6FFsQ/+yCXvwSNc53uMtGYQFp9+h7Cqs9XWWLwhrMxoTOy1u58Ygvw==
X-Received: by 2002:a17:903:2cd:b0:235:5a9:976f with SMTP id d9443c01a7336-23f981943c2mr149257505ad.24.1753398191915;
        Thu, 24 Jul 2025 16:03:11 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa49007bdsm23289325ad.185.2025.07.24.16.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:03:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] tune-octeonx2: Do not use -mcpu=octeontx2 with clang
Date: Thu, 24 Jul 2025 16:03:08 -0700
Message-ID: <20250724230308.2465859-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 23:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220894

-mcpu=octeontx2 is not implemented in clang, therefore
replace it with -march option denoting underlying
armv8 architecture revision.

 Fixes:

    |   error: unsupported argument 'octeontx2+crypto' to option '-mcpu='
    |   error: unknown target CPU 'octeontx2'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc b/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
index e9d7a59c511..83ba6745343 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
@@ -1,7 +1,9 @@
 DEFAULTTUNE ?= "octeontx2"
 
 TUNEVALID[octeontx2] = "Enable Marvell octeontx2 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'octeontx2', ' -mcpu=octeontx2', '', d)}"
+CPU_TUNE_ARG ?= "-mcpu=octeontx2"
+CPU_TUNE_ARG:toolchain-clang = "-march=armv8.2-a"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'octeontx2', ' ${CPU_TUNE_ARG}', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 

