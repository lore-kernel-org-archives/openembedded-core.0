Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC152C25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 03:30:15 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.11704.1660620609381524746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JmMhwjlg;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 24so8180719pgr.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=r4uBnhxG3n+arh0PG+jN1R/G5EDDbe9j9nWk5xshwyc=;
        b=JmMhwjlgXKc2Xz32gCUSjvgP0+T5KOKFpKyNRtRj5547tEPOem2Im+AbleBKBE2wu2
         WK62r8LYehIzrMVeCUc/coz/tRZTXiRv2gewhMVwQH06/daWb0NsMoDQIlBBUiG0hOUo
         lFnddkxm0TMzLYsA1yalU5e+F1yXuIwqgWoY30xLIQvE4zxJph2dMxCXZ1cmv/XCDybg
         xQQHOPCmG31NEBtg8VE7TKiokYBqTxdG9nmPp9klA+akZTKDmPQe46jYVGdBsjWaadne
         UoqBEHXPGcEFKQdzBIosBGbNGIKzrrHA+vrHJ2dwN7cUXqZrmaFBvFbxxkN4LVbuccgC
         6ZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=r4uBnhxG3n+arh0PG+jN1R/G5EDDbe9j9nWk5xshwyc=;
        b=2od8T1Fb51TY0TD/lnokmzxiJkdblGSmEiOb8JLZSUPa5LNFTUqZXXpPV5QtuzW6tX
         3CYSbgbgQoe4wxTqCTkW7Ycp4hhOQgLhd1xB5qEcux0Afsl/3akFhzmZWWk7X3CPpUjG
         pHxgmELUFK84UN4IyJRXFXWueE/3acY0eMl4FwYgvWuhnq/DqRgQf86sjl5/EQeNHCYQ
         +fcx/Zo2VlqymKEP2Z7SsCuWerOyg9r8nZDtSY01BFFi8J7iYJ23yNG8pfpT5TP0L+cH
         6+TigvfTB6axszejqFznMjtKfaWvmCXMrWUNOCGpuU6IPp6QRvyPMRsVOPz3fRc4Y2At
         yv9g==
X-Gm-Message-State: ACgBeo3SU6RIpIV5zxOP2KbpPUMYymz/DbNebZM2jIxLoJF7zFbCq7BC
	qStDjmRhL44U/vQ2UFYRiZbTwmjB1jxxPA==
X-Google-Smtp-Source: 
 AA6agR6yU6yImn06qzWON2KX1ZmCVBKIxGYB0ZRhvmqXubN892Hf1LuPCnjwxFZwCAvxLgoTI85xKg==
X-Received: by 2002:a63:d0:0:b0:41b:c075:acb5 with SMTP id
 199-20020a6300d0000000b0041bc075acb5mr15890676pga.480.1660620608387;
        Mon, 15 Aug 2022 20:30:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 b190-20020a621bc7000000b0052d87b76d12sm7218807pfb.68.2022.08.15.20.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 20:30:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/6] time: Add missing include for memset
Date: Mon, 15 Aug 2022 20:30:00 -0700
Message-Id: <20220816033005.2700801-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 03:30:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169415

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-string.h-for-memset.patch    | 27 +++++++++++++++++++
 meta/recipes-extended/time/time_1.9.bb        |  4 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/time/time/0001-include-string.h-for-memset.patch

diff --git a/meta/recipes-extended/time/time/0001-include-string.h-for-memset.patch b/meta/recipes-extended/time/time/0001-include-string.h-for-memset.patch
new file mode 100644
index 00000000000..f6ea212667e
--- /dev/null
+++ b/meta/recipes-extended/time/time/0001-include-string.h-for-memset.patch
@@ -0,0 +1,27 @@
+From c8deae54f92d636878097063b411af9fb5262ad3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 15 Aug 2022 07:24:24 -0700
+Subject: [PATCH] include string.h for memset()
+
+Fixes implicit function declaration warning e.g.
+
+resuse.c:103:3: error: call to undeclared library function 'memset' with type 'void *(void *, int, unsigned long)'
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-time/2022-08/msg00001.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/resuse.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/resuse.c b/src/resuse.c
+index cf5a08c..9d3d18a 100644
+--- a/src/resuse.c
++++ b/src/resuse.c
+@@ -22,6 +22,7 @@
+ */ 
+ 
+ #include "config.h"
++#include <string.h>
+ #include <sys/time.h>
+ #include <sys/wait.h>
+ #include <sys/resource.h>
diff --git a/meta/recipes-extended/time/time_1.9.bb b/meta/recipes-extended/time/time_1.9.bb
index 706605fe065..8364210e61c 100644
--- a/meta/recipes-extended/time/time_1.9.bb
+++ b/meta/recipes-extended/time/time_1.9.bb
@@ -13,7 +13,9 @@ ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz \
+           file://0001-include-string.h-for-memset.patch \
+           "
 
 SRC_URI[md5sum] = "d2356e0fe1c0b85285d83c6b2ad51b5f"
 SRC_URI[sha256sum] = "fbacf0c81e62429df3e33bda4cee38756604f18e01d977338e23306a3e3b521e"
-- 
2.37.2


