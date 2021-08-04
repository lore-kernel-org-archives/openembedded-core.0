Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web12.4080.1628045342053430198
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Aug 2021 19:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EEpTHGgP;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id x15-20020a05683000cfb02904d1f8b9db81so373718oto.12
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Aug 2021 19:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t2CIW4fgaXM4De4C8COqgtbkxJTLO2MgOsM+Tqxf5Mk=;
        b=EEpTHGgP9YsWRldMy36dpTie8nSzlZW2Y3lrKV5Zxr8TD9ZNi6FSipufhTSYCnwcwm
         2yL4jpqq6qXBQkANKyhcgFBcegSY3C3qv+yucj3VDw9fYs3ad5sOZLM3bdh8jNJBPP9J
         4pf0JM18CsF7fl5g//GRz0B/HPcXtD59XtO0Divr+24bdR2DtVHpOIAYhn5YFqIyXpGG
         1nAyJqowPtZ7X8UEZdNF4MTIcQsg7HTzGPcYQxhs1qwRjJHQwsOsKg7pYensp5A5EBqY
         66OVXo62mPS+q07NDcsukAuTfCNs3asnQrPkYy2fE5x2paDPoKHoyJn0uq65QA3gIHfM
         F2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t2CIW4fgaXM4De4C8COqgtbkxJTLO2MgOsM+Tqxf5Mk=;
        b=oiIUesJHdAbOF7deeLrLJqRnHIVGChLCp34kDnHE2GhfeU5YNX48N8Yfnaum5+L+NM
         3EYZ5susjhWmTf5pvfuMiFsaTGiuoBdJSB8TS5Tzhu5AG7F5UgLOQz6isTuqyUAncb5q
         rYBPFustIWNjmrBPtBM2/SNj2tN4xepB6IE5k/W0VQAgT05KGPn1FIoKzh2Wg4+ynuWY
         2yKh5Q8e4PrTC6Z5lEb4oa/MV4yT3jGvFZ1MCoov5liaur5zOf2AH9fknEdkt7BGrBCb
         n/+uMSv3i8f/epG59QNJcGYuuxJpYl6Q4NNIQ0scOiglQLUyKsNnxO22YZ8j9gM0pi9R
         nF8g==
X-Gm-Message-State: AOAM530OhiW5F5an4CtQeMIng/kp36Zylr+DxRUOgc9HT0ZHsqvi4kwK
	PD565BeouqHmSTu2BDVwI5e43PFZt+OgLw==
X-Google-Smtp-Source: ABdhPJwpgvDB7R13tl5Q8Wqgc/n2zdzrClXL9pePeFsKaxRDn6dvxyTHQgefX7oHXB7vrwWyBxWHMA==
X-Received: by 2002:a9d:6ad4:: with SMTP id m20mr18050850otq.338.1628045340834;
        Tue, 03 Aug 2021 19:49:00 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id w75sm213727oiw.12.2021.08.03.19.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 19:49:00 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] libxft: Fix bad PKG value
Date: Tue,  3 Aug 2021 21:48:50 -0500
Message-Id: <20210804024850.19048-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PKG value should only be munged for DEBIAN_NAMES during
populate_packages. Otherwise, native packages can have the wrong value.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb b/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb
index a6fb5642da..9695afd625 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb
@@ -27,7 +27,7 @@ XORG_PN = "libXft"
 
 BBCLASSEXTEND = "native nativesdk"
 
-python () {
-        if d.getVar('DEBIAN_NAMES'):
-            d.setVar('PKG:${PN}', '${MLPREFIX}libxft2')
+python populate_packages:prepend () {
+    if d.getVar('DEBIAN_NAMES'):
+        d.setVar('PKG:${PN}', '${MLPREFIX}libxft2')
 }
-- 
2.32.0

