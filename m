Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7D8C4332F
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:40 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.3498.1637741320056985730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=isivWfJv;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id s13so2638176wrb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YWpvgp8nScXxZGKCiLtLjLbVb3mDp2Q8s22XYGslKFQ=;
        b=isivWfJve+Bs2FNsQYyKP8cLu/ZkQZOKOcpTIobSC9fd9pFmboeVBVA1F33gkW+SPT
         8T6asXTT/Av0Z5Q83SDNX0o+QCMtSEdZbAYi69v6+mpmSPWUrYpynIvzhDyQ9N7R8B28
         YwdIaSSeWb9HMkqaEUlc0HJKlTWek+7Gkan/HUEkSTQ6U5d9FJmctKyuR/ilrC8X0zHb
         UGwtgeS8RHZVE6m+8g6CPGzVFRrAgPttcT4PCXqCjc8RMyMLPB5JECg/sZq9GFIJ2zR6
         SLHI7mw0Mp5W7sMEwxV3UqeHYQdovunLqeJcW/TYpAEejl9+BNjJ9aV4grTdP4gfPJ7c
         WNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YWpvgp8nScXxZGKCiLtLjLbVb3mDp2Q8s22XYGslKFQ=;
        b=5Q13Wv0Lz8BnFg657hj+TCX9bpL7bUEN9RMOID/mQK8ZCZrQRwEHuWO/Ozz428FH2k
         gk0mxO1Cl99pu5TaqlLXKtAH0hviTB+8UC9/AmBWdZYsnfdaLNe9LxB+cxj3S/+ORxAV
         acL2gErxQkMrcfghaZZpfrcPOP2GIdr0PlERz49F3OHocX8+jF8sDiw+nsThNKKOZ70J
         +C1VbuqqBUQvwi4ECU9uPkD8BC5rmJWZajTDeD3ny1+cv+fwIbpsuH8y83uVOaufFi0c
         BQd5yeUBJGZbiUZEtO8QmE8U+eBsqhsFxv1UHKRXTjHvCFBfMNVxkeqg2EhY3AQ4TcyK
         xnPA==
X-Gm-Message-State: AOAM53231fD5CpCeC/pDSeMLVUQBPpHDfpVcwqr94hS9W7iEM3Om0n6a
	YpknNEMh0P/lDYd3E9TzHii+mvAINwqvBQ==
X-Google-Smtp-Source: 
 ABdhPJyoR9VwSyMFBuNsQQnb2PNHblu71Iq0RwPRnyMPEutzKHL/dxIUdpjTIzTu04g1RgmgGMBj+g==
X-Received: by 2002:adf:df0b:: with SMTP id
 y11mr16041588wrl.181.1637741318565;
        Wed, 24 Nov 2021 00:08:38 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/21] apt: drop unneeded chunk from a musl patch,
 submit the rest upstream
Date: Wed, 24 Nov 2021 09:08:16 +0100
Message-Id: <20211124080828.530981-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211124080828.530981-1-alex@linutronix.de>
References: <20211124080828.530981-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158665

Upstream has inserted guards around the use of offending constant.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../apt/apt/0001-Fix-musl-build.patch         | 35 +++++--------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch b/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
index a6e8ef1e51..0cefbedd6d 100644
--- a/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
@@ -1,22 +1,18 @@
-From 081c6be2f2f1cd77f399ea414f8d89c107826624 Mon Sep 17 00:00:00 2001
+From 6b8547161b902b01b639d05a4cdf849d7694556f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 22 May 2020 15:29:23 +0000
-Subject: [PATCH] Fix musl build
+Subject: [PATCH] apt-pkg/contrib/srvrec.h: Explicitly include sys/types.h
 
-methods/connect.cc: Musl doesn't support AI_IDN flag in netdb.h
-header so define it manually.
-apt-pkg/contrib/srvrec.h: Add explicity include of sys/types.h
-to avoid errors in types u_int_SIZE.
+This avoids type errors with musl C library.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/merge_requests/200]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  apt-pkg/contrib/srvrec.h | 1 +
- methods/connect.cc       | 5 +++++
- 2 files changed, 6 insertions(+)
+ 1 file changed, 1 insertion(+)
 
 diff --git a/apt-pkg/contrib/srvrec.h b/apt-pkg/contrib/srvrec.h
-index e22b7a1..b1115f5 100644
+index e5d0f43..2010184 100644
 --- a/apt-pkg/contrib/srvrec.h
 +++ b/apt-pkg/contrib/srvrec.h
 @@ -9,6 +9,7 @@
@@ -27,19 +23,6 @@ index e22b7a1..b1115f5 100644
  #include <string>
  #include <vector>
  #include <arpa/nameser.h>
-diff --git a/methods/connect.cc b/methods/connect.cc
-index 1d6f891..122df35 100644
---- a/methods/connect.cc
-+++ b/methods/connect.cc
-@@ -42,6 +42,11 @@
- #include "connect.h"
- #include "rfc2553emu.h"
- #include <apti18n.h>
-+
-+#ifndef AI_IDN
-+#define AI_IDN 0x0040
-+#endif
-+
- 									/*}}}*/
- 
- static std::string LastHost;
+-- 
+2.20.1
+
-- 
2.20.1


