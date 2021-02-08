Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.310.1612807717260791382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 10:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=j2RyNNBR;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id i5so22532wmq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 10:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pGfyGxnalcCk+Sgk4WZHYLKbsvuO5ivaMO3rt4HgxxI=;
        b=j2RyNNBRsidt8X/6f/p4DUmnS2ZgdBnvxT2MuKpUAxKjIZdwopJ2EaTPQHLXliD7Rb
         kg+Cu5Eozp9JmhW+b0WXOoY5aqMLfrHrg/OktPE9TJRMbxgEpR/FFj2paohRn11p8V9V
         vouvc7itbnmGKZvSPtcUCJR9NPVibr8jhHnMXzeXQOgzFPeHg9bUBTXVP3cArhb3yLM9
         9oFQNfpCpuDRw9XrMkTtSfdseajtrJVEYYs5QfABs7fkwlv6+cBbvDADB0gAwKoOOicL
         1UnFu7i0kvB9HCc/iYjy5RUxmXDV6L1SHrTx/2/2FTpUK9Np2yzgUeeA7K0ClK0tmz7l
         4LIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pGfyGxnalcCk+Sgk4WZHYLKbsvuO5ivaMO3rt4HgxxI=;
        b=SjvtGnwC783UVO14kkUD1BNeFRwnKrnzGKnuMnZSINCn9MchU7Ze1C7ZvUVN1HbsrK
         0K8VmkD+NYvybznV3sOM4HQsuz5bc1dnwDrz43Mhl/aiByI6+rPLYhMuLEmspTlQRViI
         uKePVOkG94r7bLd5Q9jbEzGhd60AYLexZrhQNjqwF/mvv6f0RLdIZvr0kKAVr/d1rTDI
         HybJ9AO4netJ6+w/FljMqZKWAPAGlCGZU/z/bnoGahoUIExJBkFVww6LoSb4QJRyiv8j
         rSIlt6b6kA4CvnRXFJaCJmRfr+KtI6/jutU47oJ5RWrWcyKQCE9Kpp/hhLreGaGXUNra
         z/0w==
X-Gm-Message-State: AOAM532z9AuI1LKHo+KGFFzp/vFVsQ3gKDp4XgF7/LoPV+CqZi5gpA1a
	X6hbMRTecx9HbxrR+LzRHRvhmFLwfq8bEw==
X-Google-Smtp-Source: ABdhPJxitR4Xd1h+qrX9uXDYwZf1FAzE2+1MwGEVQP31+/P8C52EH9rc0LpEp92mYRNqLkIuZXgv+Q==
X-Received: by 2002:a1c:1bc7:: with SMTP id b190mr13625759wmb.115.1612807679260;
        Mon, 08 Feb 2021 10:07:59 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from P-ASN-KEVALD.idf.intranet (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id h9sm6157915wrc.94.2021.02.08.10.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 10:07:58 -0800 (PST)
From: "Yoann Congal" <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta][PATCHv2] npm.bbclass: avoid building target nodejs for native npm recipes
Date: Mon,  8 Feb 2021 19:07:47 +0100
Message-Id: <20210208180747.12546-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current recipe unconditionally RDEPENDS on nodejs (the target one).
When building on the "-native recipe" of "BBCLASSEXTEND native" recipe,
the target nodejs is unnecessarily built.

This patch fixes this by only RDEPENDS on nodejs when building for the target.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/npm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 79f55febcc..ac49aa4cda 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -20,7 +20,7 @@
 inherit python3native
 
 DEPENDS_prepend = "nodejs-native "
-RDEPENDS_${PN}_prepend = "nodejs "
+RDEPENDS_${PN}_class-target_prepend = "nodejs "
 
 NPM_INSTALL_DEV ?= "0"
 
-- 
2.20.1

