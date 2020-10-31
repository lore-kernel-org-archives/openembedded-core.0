Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.3936.1604104763946638352
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 17:39:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=i8KjySU0;
 spf=pass (domain: foundries.io, ip: 209.85.222.195, mailfrom: ricardo@foundries.io)
Received: by mail-qk1-f195.google.com with SMTP id 12so2741078qkl.8
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 17:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bc3q5pOb0Y0JEx/8afa0G/xTJj5Mta74uVAIi7a7d74=;
        b=i8KjySU01nZv5cX87WN9kX2pHlf/P8S8DoNShKQIJG9vzH4BnAayv/l0cwFBJsb6B1
         JjjjWr/txcaq8P45bvfjxP2IHQ1xCqxJaRmS3M3tC2vA/D5QXN2iIAtyJijVmUC6e5Mu
         QX3/yOD3ikGYS4PCBz4dr0hkSXzg8VQlNpH8fSbXb8kEZEmfFScztg2LpJ/pIqH37Z0v
         P1m8IUI9A4qPTCqfr6A1cRPESj/Uvpce4SvW6I7xjVzaPb8j3DPZbLblol4FonAWVI8R
         h1pIMPx3nylHeDHhIVl0tzeJ/pd9Y+XitruX3tiHLcpkQV0DlDMikuJ1iXHpErZK6pC4
         a5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bc3q5pOb0Y0JEx/8afa0G/xTJj5Mta74uVAIi7a7d74=;
        b=ONceIbB8uRf8DKqGTgRvR3ZVhW5xcRFZ7C1A5N4YYSlR1ZQGXHK0IJMhFynnNygmIw
         KUxGe4LrwLauKyw+yNoDhnBaa3iHBUaEt6FrooNzLneg9vMZpXlZaRrwn/Ul7QTJjeap
         w+Ktl836zJQOZtofeL1E+aWO1ycWA7T+Gv5BKz/nvVLU+o0dixG+PYo2aHTWvbuR0q5h
         UNpinaWILFZ+VnjfSB1VtAP0/uiNoD2VO6/RPrX7709TqdcEenWTumEVXUyl+3NyRxfL
         0g61sqzlCRzq5oWlNOFllseJ5FLE/fwTAMpFIVrRkvJl1zIcW0D2dVh9W0SBopC9+rej
         6pUQ==
X-Gm-Message-State: AOAM531Lmp1OUhvUr98PglC9JIYPNXoqdbU6zAJVfSR/ID6pzNggXFLH
	9MVOZrOf9NwGygnx6/HkfEuoq5ZqmKvq
X-Google-Smtp-Source: ABdhPJwhTDFKlG/YWXr+PM+eK7fJwxuEt5692OMuyqOBB0mKP5i1IXzva5n7KrCsNw6z+peOe2WOxw==
X-Received: by 2002:a37:de02:: with SMTP id h2mr4435666qkj.99.1604104762760;
        Fri, 30 Oct 2020 17:39:22 -0700 (PDT)
Return-Path: <ricardo@foundries.io>
Received: from localhost.localdomain ([2804:7f5:f480:bcdd:ddb5:2334:2f12:9430])
        by smtp.gmail.com with ESMTPSA id m33sm3863040qtb.65.2020.10.30.17.39.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 17:39:22 -0700 (PDT)
From: "Ricardo Salveti" <ricardo@foundries.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] dosfstools: add mkfs.vfat to ALTERNATIVE
Date: Fri, 30 Oct 2020 21:39:17 -0300
Message-Id: <20201031003917.21190-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mkfs.vfat tool can also be provided by busybox via the CONFIG_MKFS_VFAT
configuration (not enabled by default in OE but can be enabled on
systems avoiding components based on GPLv3).

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 meta/recipes-devtools/dosfstools/dosfstools_4.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
index 97ce449954..0e59fffa27 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "e6b2aca70ccc3fe3687365009dd94a2e18e82b688ed4e260e04b741247
 
 UPSTREAM_CHECK_URI = "https://github.com/dosfstools/dosfstools/releases"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig update-alternatives
 
 EXTRA_OECONF = "--without-udev --enable-compat-symlinks"
 
@@ -26,3 +26,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 # Add codepage437 to avoid error from `dosfsck -l`
 RRECOMMENDS_${PN}_append_libc-glibc = " glibc-gconv-ibm437"
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "mkfs.vfat"
+ALTERNATIVE_LINK_NAME[mkfs.vfat] = "${base_sbindir}/mkfs.vfat"
-- 
2.28.0

