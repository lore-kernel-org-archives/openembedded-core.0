Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8689C433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 07:16:23 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.4818.1647674183245437684
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a/pADO/R;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id d7so14341328wrb.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CfOm7BtsRHi0KRp8qlt5OSKVnK6mWxFfk64U4/DK0DQ=;
        b=a/pADO/RqALAPHgzuA7e264kNnmG9ik3Ur/5okxTbQ2J9/YvO4PZ6uOdsZg7fYAlwg
         Lk6+20UjZLKWbLobRrsiBjtYDoTesXONtBYFy4Wb5uVsWqiOlOACcFYZP3agK1Ne0MZo
         ptC+jPsTG/jOku48FUJJiqbXY+MvoRJARYq+q0qrCy+JEit3YrPdJUl6VUh54CX/rkHN
         1Y11S+cFknIZ8W/lk/zhph4nFXTQKxetoZb6mFWEyurh9lkmYZTZ5MtD/d7KaXGNXB07
         SRdO8NYeApFMDgBKnxjJNeKLdDBX90LkwimwhmvmdAm/hM1WXf8L7VZ9Vr4hKFyXYUdh
         lhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CfOm7BtsRHi0KRp8qlt5OSKVnK6mWxFfk64U4/DK0DQ=;
        b=m199pwP5B+x3vNqyIu6+w6cy0I3hnRSFAnEaevSl0is2cK7eTwIJJQlWh7TlQMsX/1
         5TEC/rc7YEceTtm2MvQRbDl/TyHbUdeqNMGMbcXAOMKkYmtfutH/BY5FFc8IfY9MfGYR
         576Efp2Rlh6BGWruIgHkvmgHgG/sQver4SDel0zzZOZoo+3InwglxHDkL3us+RoEoASt
         w7gCGewKzw4rK+047brM3qnTUQVDObDY8HmoAHpqd8310vhdbqfYuAgL4Wecq1EWvcEs
         2jcYRuVtLJT06QgDvc1p7h8xWcNzd1BVn20r0oNBYPFxl9LpdRYQtiRrEJ9iSY7/dMR2
         heEg==
X-Gm-Message-State: AOAM531H46h0Uh53d2wrYcudyXDFF/QigpMeq+taskzak9oHz8EnhEcN
	jqwZnNnVsgvUNqGeLRQLgoQCNolr16c=
X-Google-Smtp-Source: 
 ABdhPJwYKTEoKZ0jT+y/b50fw97wsxgENrGEZlSeNncayqCwywo2jJ1EqXnqc7NT7tiMl8MWZehcMg==
X-Received: by 2002:a5d:62c8:0:b0:203:e3bf:9259 with SMTP id
 o8-20020a5d62c8000000b00203e3bf9259mr10356903wrv.509.1647674181803;
        Sat, 19 Mar 2022 00:16:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b001edc2966dd4sm7656999wrx.47.2022.03.19.00.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 00:16:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/11] mtools: upgrade 4.0.37 -> 4.0.38
Date: Sat, 19 Mar 2022 08:16:04 +0100
Message-Id: <20220319071605.152904-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220319071605.152904-1-alex@linutronix.de>
References: <20220319071605.152904-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 07:16:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163466

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mtools/mtools/disable-hardcoded-configs.patch               | 2 +-
 .../mtools/{mtools_4.0.37.bb => mtools_4.0.38.bb}               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.37.bb => mtools_4.0.38.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 6185f4d19f..25ee2b74b5 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From a5076415ed2c226ca7115d27e0ce51a8a0302090 Mon Sep 17 00:00:00 2001
+From 142f40b80ea908831ef7a4d694cec6a5985a0724 Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.37.bb b/meta/recipes-devtools/mtools/mtools_4.0.38.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.37.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.38.bb
index 3e072b0d93..dc2b9f8794 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.37.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.38.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "799b197e23e47b61259628810b27790efb7a1fe36037ef1da8a27b0ae4fa8342"
+SRC_URI[sha256sum] = "7b94485f486e7df08cca68b00a164a13cd38f4c63cb8684d188759ee7bc5e729"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.30.2


