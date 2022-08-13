Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5270CC3F6B0
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 17:02:05 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web08.6815.1660410121667133586
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 10:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WHqcKFS6;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id s206so3249212pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 10:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=vE2Kds4atTK0jFIo4r5i8OuVSJHO51bRs8GlEl8VQxU=;
        b=WHqcKFS6/TCkcc1SxFWpboUpzDsD8l7qhIA4wTTE0uOmBBxiPOfomcnDufhAi+wdNV
         pyZaLdHZ6TTgjxdR2JibC44RzL+OGiINkwrzE57aN5nAT2wPxjRvUyX9replkdU7OuFQ
         z7e00jAdc+rLBS9LptXe0OI3Pi5T0PLGOVbQRh/XQUkA2+z9Wslz5sWyRPOjxKKCvLsw
         JO3mBgqLMXqD2Y9kPt5cqnrCUwYhnvT8lGo5N3taFuNX5QxzVWs9q80XxBgXciM7lCb8
         uD/E7vPxuJnooN+p/jVvyMUWK2SD/dYxBJCTzqBjkYdlOx2R5CnI0w4FRGag+LVdcZro
         v+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=vE2Kds4atTK0jFIo4r5i8OuVSJHO51bRs8GlEl8VQxU=;
        b=oVbB05Cm/VGEcllwkdKy0xR0x+eutaKBrxwhTPq6626GI0Xk5M/3AlWaKqygdnl/vd
         f5jJ43r/+pYMUVgXHzYN67IdpHRJ2KcY4j6cBrm+WQF4dB7m+++iHBf5X4c8uJ0Xhki8
         53/esYN0WvL6IR4V1oF9HiArQ9v8O/pinVAEPoXiOKWPwCaIIPjfMojsVVQMxccUL0Pi
         /uGeogyV17fIIDIfyrp/wigJOFgl9HYp9zvSlqWuxCddhWyV+2AyFn17XWOS1eKwc+Th
         v68/RdqBwgBIbsqZVkwV8jaA2iQNHk9QquARGmvtoD1tsgFDkbvpWpGvuVuHiG6wjfoe
         zzkw==
X-Gm-Message-State: ACgBeo1OuPz0R59FWM/cJUkjCU8p9MFpOXkYeK6TFKmXNP2uTl+Rzspi
	3vxSubBv892xRoWCVzcEFGpr6ikJJqBzbQ==
X-Google-Smtp-Source: 
 AA6agR7PJySnx6zayh2emLsyhdSVauBKUogxorEE5slQOoufeVwAuQQ5IW2pbk6G77FEN68zEyiCUA==
X-Received: by 2002:a05:6a00:3106:b0:52d:53d4:ccc9 with SMTP id
 bi6-20020a056a00310600b0052d53d4ccc9mr9106305pfb.9.1660410120597;
        Sat, 13 Aug 2022 10:02:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 n7-20020a170902e54700b0016c78aaae7fsm3975713plf.23.2022.08.13.10.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 10:02:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] gstreamer1.0-plugins-base: Include required system
 headers for isspace() and sscanf()
Date: Sat, 13 Aug 2022 10:01:55 -0700
Message-Id: <20220813170156.4040589-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220813170156.4040589-1-raj.khem@gmail.com>
References: <20220813170156.4040589-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 17:02:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169311

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-system-headers-for-isspace-and-ssca.patch | 35 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.20.3.bb       |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-include-required-system-headers-for-isspace-and-ssca.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-include-required-system-headers-for-isspace-and-ssca.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-include-required-system-headers-for-isspace-and-ssca.patch
new file mode 100644
index 00000000000..23c1048a362
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-include-required-system-headers-for-isspace-and-ssca.patch
@@ -0,0 +1,35 @@
+From c85a53a41d4e6bfc49c377217ece12a1f330a690 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 12 Aug 2022 22:50:06 -0700
+Subject: [PATCH] include required system headers for isspace() and sscanf()
+ functions
+
+Newer compilers ( clang 15 ) has turned stricter and errors out instead
+of warning on implicit function declations
+Fixes
+gstssaparse.c:297:12: error: call to undeclared library function 'isspace' with type 'int (int)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+while (isspace(*t))
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2879]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gst/subparse/gstssaparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
+index ff802fa..5ebe678 100755
+--- a/gst/subparse/gstssaparse.c
++++ b/gst/subparse/gstssaparse.c
+@@ -24,6 +24,8 @@
+ #include "config.h"
+ #endif
+ 
++#include <ctype.h>              /* isspace() */
++#include <stdio.h>              /* sscanf() */
+ #include <stdlib.h>             /* atoi() */
+ #include <string.h>
+ 
+-- 
+2.37.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb
index 7eebbba9497..e5e346e5e96 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch \
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
+           file://0001-include-required-system-headers-for-isspace-and-ssca.patch \
            "
 SRC_URI[sha256sum] = "7e30b3dd81a70380ff7554f998471d6996ff76bbe6fc5447096f851e24473c9f"
 
-- 
2.37.2


