Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E120C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:08:01 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.9302.1635325680083622377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UKPMwReT;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id v17so2850406wrv.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5KFNxZK//cIw0CmV2yR24BjmB3an6NxXleGQeVXiNaU=;
        b=UKPMwReT93OwKayqXjn358B1wdkwqJ3P8OFA1E7sN1KR3/pgBC8JUnIF1wEVCAiGKu
         oGEXWxs4WHodl5OsOSz2kT8nEJBPxikV+3MZWJ4sruQHDNts5H29BGv1u4F4ofyOii6W
         kf0X621JB+SfDc/y5uH2zwnQ33oBHQ9WWm9+S0/okv6n9zahg+bOWDhnBsuDkWZpOBoM
         L/uosPi9/9ppR2k9E7BkiEaaOoFI2D+Fa2YN9Zbd1EhKbg6h0CaLuUol1atutpRMmVyX
         mmQD0Fc6AglhoLTv/qRPaxzx5lBNuvbMVep+V+juVKQroIMd8JuUSWGfFWBpXvOBcL6G
         U9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5KFNxZK//cIw0CmV2yR24BjmB3an6NxXleGQeVXiNaU=;
        b=s5ignzuVcWhilAgA4zzGQ9tmlduIAB8ckef0dtpR7dGFN5HwL6iSrEuSz9ePhHVjFX
         0aAO7dmbFzeiRWHk060rAmTue8ZKqh2u/SGq/UQHxOfYQBi+zGEnUccUeoFWsKgm4kzY
         5+aBxJiY5Rcd8t8qzfuezs+Yigwh8aIF4WbOuWPPdoIkWVBzdsWnX6oaQtGu9I6SJkjD
         42lhqoVZxFVOtNJDGBwKfZJlUXIoNN6Yop/Yw3oOM0zj9n7umOwD/oB+sw8I0xGi2+4r
         F9jSJ28yzV/P/U/+d/aL669sbTlYNqEecV+dDmrteWY6LyzW27IyjS0ETNLCmIFRC4Ay
         Tx2w==
X-Gm-Message-State: AOAM532vmrtOGklkceUyF5591xz4Eag6r7r1Km6UxuoObAQf77So65GE
	DC1b3dlRmamHn60lf9T2M1zFBD7/YeA=
X-Google-Smtp-Source: 
 ABdhPJwTuGvQjrs4AnlOyZ4Hf9A2veHjWldhYSV1vIqFwD8gSfuADnsP21HqCR/yL8Spy6AWTSFnUw==
X-Received: by 2002:a5d:6da5:: with SMTP id u5mr38036827wrs.436.1635325678702;
        Wed, 27 Oct 2021 02:07:58 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/30] webkitgtk: drop unnecessary SSE disabling patch
Date: Wed, 27 Oct 2021 11:07:36 +0200
Message-Id: <20211027090736.2546759-30-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:08:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157506

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-ANGLE-do-not-enable-SSE-on-x86.patch | 26 -------------------
 meta/recipes-sato/webkit/webkitgtk_2.34.1.bb  |  1 -
 2 files changed, 27 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-ANGLE-do-not-enable-SSE-on-x86.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-ANGLE-do-not-enable-SSE-on-x86.patch b/meta/recipes-sato/webkit/webkitgtk/0001-ANGLE-do-not-enable-SSE-on-x86.patch
deleted file mode 100644
index 1c6ba97037..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-ANGLE-do-not-enable-SSE-on-x86.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From c71a4e18afb4869a0fbb0efd59c4860b72f493f7 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 5 Oct 2021 13:32:28 +0200
-Subject: [PATCH] ANGLE: do not enable SSE on x86
-
-The code does not actually build there.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- Source/ThirdParty/ANGLE/src/common/platform.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/ThirdParty/ANGLE/src/common/platform.h b/Source/ThirdParty/ANGLE/src/common/platform.h
-index 41f3cf4f..cab85a82 100644
---- a/Source/ThirdParty/ANGLE/src/common/platform.h
-+++ b/Source/ThirdParty/ANGLE/src/common/platform.h
-@@ -89,7 +89,7 @@
- #if defined(_MSC_VER) && !defined(_M_ARM) && !defined(_M_ARM64)
- #    include <intrin.h>
- #    define ANGLE_USE_SSE
--#elif defined(__GNUC__) && (defined(__x86_64__) || defined(__i386__))
-+#elif defined(__GNUC__) && (defined(__x86_64__))
- #    include <x86intrin.h>
- #    define ANGLE_USE_SSE
- #endif
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.1.bb
index dde8963d04..4e2562df14 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.1.bb
@@ -18,7 +18,6 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://include_xutil.patch \
            file://reduce-memory-overheads.patch \
            file://musl-lower-stack-usage.patch \
-           file://0001-ANGLE-do-not-enable-SSE-on-x86.patch \
            file://0001-Fix-build-without-opengl-or-es.patch \
            "
 
-- 
2.20.1


