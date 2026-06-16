Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63344CD98F3
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:49 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5783.1781637403563911444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DE6ywQmx;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b64c8311so48502005e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637402; x=1782242202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4/1+wI12Uy7vJmmYbttQCbU8Arkg/4X3A77B6ejeXA=;
        b=DE6ywQmxn+cj3oXEwQHITNIJ1XIH3/QMO6Bd8+2uWhDxCvPETkr2WuCNbAPdLtqYin
         e17BEdMmlmuWLl6wK5gFj0nusX1He4vgdfl6Pz7ownGc+qRb2VaGVHrcbJGuz1+pONOA
         zJrGMFV5MfJIdQF9J/kk1NIgE6PXbGwIT05UdoYsocyMpqa8eLasB2gks82b1noROcV5
         FFyNvnBNO1sK01NqD1B2K3PUb9P2zYIoIWE4xB6WuBgOmhogNCtzCq2lfO3v1I5rfqqw
         03V2eoBWTDf8l1N+cLgViaJ5Qg+RmQs6Xrwv7RL234la02wp/a+mVGlCH/a+7UkQZuYR
         kwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637402; x=1782242202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G4/1+wI12Uy7vJmmYbttQCbU8Arkg/4X3A77B6ejeXA=;
        b=WcsjtBQ7rfzpxDazuijyL4N9D6ZhWl0OdORXJtvDFesxiE12j+pgxLSIT4SeLX/rai
         GpyRXfG9n7byfucaU8vgSL4m+ZQ6K/YenGNGSQqrSKznySJehL2Y6rUKMzKvENZ/7TSm
         oQApTmgG5G5Xo0hNj2VvmF2AK+WMusbAYiHFK2vNFxNylUBfkKQCHC2h/+iOYQ4Rrgcs
         vPKKTBU26kroDldnHd4OmcxvA8vHEbd0jIzk4LBCtflT1wFb8ugdcmKW+W4nq7pq8CMd
         0ZdXMy7ixvUY/xyeWLeL1qkFaEE+FAw5Ffo5ncWVE3OzSOCtR6C+mSG16aYJsIrbL07g
         Nuvg==
X-Gm-Message-State: AOJu0YwWu0zIBuHtSZhSMsd9e8YYq0+jAU6ZB1jkCoWvWcUpGJJzoIkM
	NQLD2i+gx0H/E0s5Npx9ZdI1e2M9y33GvRgbHaSJAhdINqu7Ck1l+Dj8bmdBbD9Q
X-Gm-Gg: Acq92OHmoi0j5Y+nGiMzJX8XPukxcY9JU26vz2ifJ3Js+TiUIQ0y1d0wCVcqtLOqavE
	6cQiNQXLJnS5aGbdNHJ8G+p33oM9POSvPSlWQjyJBmJihxuhnEmW18GC9uW06PrOdiUoAF+g5Gt
	kGvuA+AD1L72yVqv8g33yJcDQUALXOHKNQ1CvI8c3K4Hi0HMrDCEuge4gx2nq2TLQOdMPvpGzV1
	x6MBT3v7mpk9guuYNaeIVdBhyIz58mcL2vmYXYCsqXSFt6ht9x8eXEJFC+ZrQIhRrisSzmMn+rx
	6liXzKPrP9t3ZcXJB6OU9NAC1ErKnb4q0PcE1gbKWmfMm5iBac98ftGmaC1q9K8fw5NYulf72Km
	IrMPMKHEvCH1LzdlCvlLb22ebqRxoItczjMuJ+xlAEq8IPyEof111b8PdU/VufFr/ejn4wMkmlN
	8PA0sUd1c7DP5rwDkeZVoIREBoSiIW+hXTGxKGbmePCb2+Rm1QRmVkEzjVlQ8=
X-Received: by 2002:a05:600c:8b16:b0:490:ae52:499c with SMTP id 5b1f17b1804b1-492333ca24dmr14252815e9.21.1781637401404;
        Tue, 16 Jun 2026 12:16:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/30] gn: upgrade to latest revision
Date: Tue, 16 Jun 2026 21:16:05 +0200
Message-ID: <20260616191628.2014553-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238934

From: Alexander Kanavin <alex@linutronix.de>

Remove patch as issue is fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...001-gn-fix-build-with-gcc-16-on-musl.patch | 33 -------------------
 meta/recipes-devtools/gn/gn_git.bb            |  3 +-
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch

diff --git a/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch b/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
deleted file mode 100644
index e933c17d8a..0000000000
--- a/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 6d22f5c9e96811f1abcedd8fb1849fe72747b5c4 Mon Sep 17 00:00:00 2001
-From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
-Date: Mon, 11 May 2026 02:43:10 -0700
-Subject: [PATCH] gn: fix build with GCC 16 on musl
-
-Add missing <cstdint> include in src/gn/pool.h for int64_t.
-
-Fixes:
-| ../sources/gn-0+git/src/gn/pool.h:26:3: error: 'int64_t' does not name a type
-
-Upstream-Status: Submitted [https://gn-review.googlesource.com/c/gn/+/22740]
-
-Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
-
----
- src/gn/pool.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/gn/pool.h b/src/gn/pool.h
-index e03113608..247cb6425 100644
---- a/src/gn/pool.h
-+++ b/src/gn/pool.h
-@@ -6,6 +6,7 @@
- #define TOOLS_GN_POOL_H_
- 
- #include <string>
-+#include <cstdint>
- 
- #include "gn/item.h"
- 
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 6047ab5e2b..c5ba7761b4 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,9 +7,8 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
-           file://0001-gn-fix-build-with-gcc-16-on-musl.patch \
 "
-SRCREV = "eab8a9f92dca9b8548a89d9e5eb6aeb8ac6bba77"
+SRCREV = "bac66cfc3254aabcd8640c8ebbeb6d62a198d454"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.47.3


