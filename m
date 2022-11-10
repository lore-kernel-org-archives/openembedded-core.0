Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75EEC4167E
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:15 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.7.1668103982787486239
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ftVv+5QW;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id h9so3512364wrt.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Zm9xvhe9CxUjaHqmR2IGIZw6Ugqjz5wldMoZExVWa4=;
        b=ftVv+5QWZ9uEt/zQnCEW8Xwrbu80ywV+sw0PjQLxZ27V95nhVl2P8eUP2ktXh2NFQj
         Xuq5/jBzviitaE4/cCsP8raXb1oJPJXX3qXH61D5D4lrypSotVoJHd0g5l9LlGwaCeN/
         vaUl/rEYd1hWDmPzGn3OYtGi2vC04RRb5Y0GRy7L1q+QDRH/7CBqUdiCnSoXaV1TszQd
         hufe+R8JpI3TlpW21OmRQzqXRkLtvtcukH21FFKJzzFOOtPWaxg51CaujlzinPCxy7hd
         dkitiJitipjkCsYWhoNRwZPsjURWA15xcU97Vogv8iV7QEYAHNL/JFP1qdA0MyvU4ETE
         oJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Zm9xvhe9CxUjaHqmR2IGIZw6Ugqjz5wldMoZExVWa4=;
        b=xhZY4xbZAl2R6LzDtE3gk/pjUv4YoRoO4Q5KuDgZe20Hv/6L3E7YGdaV68Np0WuTOm
         iZou6wpqblTS8uoeDqn6jyVANHLH9qQ390mhur2J2kH5WbSnjLvjHmyX7BTnDCxPwcyh
         0ctg+bSqPbtvogXIW8tskSfAJdH4aiqGzVUxo1n3zhB6604RGBl549oVH7N75YizOFWW
         zjIWrJw1nWMPITNdEC2yc4d8GYptIztVbp3KihimyqgAfi0DANeTm1Kqzv/1c0gK08P9
         RolVvz79h3Z+unlmKEnn97fHxKToX1bWS3+ulzTs6eu3nmxUmFhksElzRC1tbO5xgCf9
         mC3Q==
X-Gm-Message-State: ACrzQf3KFvx9xF6pP8WNhtj0EJij/qsOncURn6cautK954Hix/Xc5BsI
	rUyFlg4/Uox8f9mfdS/NuZR3pFu4jxc=
X-Google-Smtp-Source: AMsMyM5e7UOB5egd6OaCuFj2qnyvbGESu6IXfK5gBxYxGQ6h68e1HY2mt2ij7S5VLHZW1P8/j6MUQw==
X-Received: by 2002:adf:8bc4:0:b0:236:73b7:84a with SMTP id w4-20020adf8bc4000000b0023673b7084amr41539233wra.8.1668103987266;
        Thu, 10 Nov 2022 10:13:07 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/19] xcb-util: update to latest revisions
Date: Thu, 10 Nov 2022 19:12:41 +0100
Message-Id: <20221110181249.1240200-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110181249.1240200-1-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173093

Also, default to tar.xz, as the majority of tarballs
are now using that.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{xcb-util-image_0.4.0.bb => xcb-util-image_0.4.1.bb}       | 3 +--
 .../{xcb-util-keysyms_0.4.0.bb => xcb-util-keysyms_0.4.1.bb}   | 3 +--
 ...-util-renderutil_0.3.9.bb => xcb-util-renderutil_0.3.10.bb} | 3 +--
 .../xorg-lib/{xcb-util-wm_0.4.1.bb => xcb-util-wm_0.4.2.bb}    | 3 +--
 meta/recipes-graphics/xorg-lib/xcb-util.inc                    | 2 +-
 meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb               | 2 ++
 6 files changed, 7 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xcb-util-image_0.4.0.bb => xcb-util-image_0.4.1.bb} (67%)
 rename meta/recipes-graphics/xorg-lib/{xcb-util-keysyms_0.4.0.bb => xcb-util-keysyms_0.4.1.bb} (50%)
 rename meta/recipes-graphics/xorg-lib/{xcb-util-renderutil_0.3.9.bb => xcb-util-renderutil_0.3.10.bb} (68%)
 rename meta/recipes-graphics/xorg-lib/{xcb-util-wm_0.4.1.bb => xcb-util-wm_0.4.2.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.0.bb b/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb
similarity index 67%
rename from meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.0.bb
rename to meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb
index c6bb5a61cd..018ac913bf 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb
@@ -9,5 +9,4 @@ LIC_FILES_CHKSUM = "file://image/xcb_image.c;endline=24;md5=eafdf965cfb89955fded
 SRC_URI += "file://clang.patch \
 "
 
-SRC_URI[md5sum] = "08fe8ffecc8d4e37c0ade7906b3f4c87"
-SRC_URI[sha256sum] = "2db96a37d78831d643538dd1b595d7d712e04bdccf8896a5e18ce0f398ea2ffc"
+SRC_URI[sha256sum] = "ccad8ee5dadb1271fd4727ad14d9bd77a64e505608766c4e98267d9aede40d3d"
diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-keysyms_0.4.0.bb b/meta/recipes-graphics/xorg-lib/xcb-util-keysyms_0.4.1.bb
similarity index 50%
rename from meta/recipes-graphics/xorg-lib/xcb-util-keysyms_0.4.0.bb
rename to meta/recipes-graphics/xorg-lib/xcb-util-keysyms_0.4.1.bb
index bca64ed61f..f1a4c3e500 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util-keysyms_0.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-keysyms_0.4.1.bb
@@ -3,7 +3,6 @@ require xcb-util.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://keysyms/keysyms.c;endline=30;md5=2f8de023ed823bb92f0b47900574ea9e \
 					"
-SRC_URI[md5sum] = "1022293083eec9e62d5659261c29e367"
-SRC_URI[sha256sum] = "0ef8490ff1dede52b7de533158547f8b454b241aa3e4dcca369507f66f216dd9"
+SRC_URI[sha256sum] = "7c260a5294412aed429df1da2f8afd3bd07b7cba3fec772fba15a613a6d5c638"
 
 
diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.9.bb b/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb
similarity index 68%
rename from meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.9.bb
rename to meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb
index 25c22e5fa7..6590fa3301 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.9.bb
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb
@@ -6,5 +6,4 @@ LIC_FILES_CHKSUM = "file://renderutil/glyph.c;endline=24;md5=c517c483b8d726234ec
 					file://renderutil/xcb_renderutil.h;endline=24;md5=d0ddab3052dd4949c93cfcb0891c96df \
 					"
 
-SRC_URI[md5sum] = "468b119c94da910e1291f3ffab91019a"
-SRC_URI[sha256sum] = "c6e97e48fb1286d6394dddb1c1732f00227c70bd1bedb7d1acabefdd340bea5b"
+SRC_URI[sha256sum] = "3e15d4f0e22d8ddbfbb9f5d77db43eacd7a304029bf25a6166cc63caa96d04ba"
diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.1.bb b/meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.2.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.1.bb
rename to meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.2.bb
index 39f1383299..65d340f88c 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.1.bb
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.2.bb
@@ -7,5 +7,4 @@ LIC_FILES_CHKSUM = "file://ewmh/ewmh.c.m4;endline=27;md5=63fd80552d7dc886f4eb267
 					file://icccm/xcb_icccm.h;beginline=4;endline=31;md5=393772b7b07b9868d479d538238c1d8a \
 					"
 
-SRC_URI[md5sum] = "87b19a1cd7bfcb65a24e36c300e03129"
-SRC_URI[sha256sum] = "28bf8179640eaa89276d2b0f1ce4285103d136be6c98262b6151aaee1d3c2a3f"
+SRC_URI[sha256sum] = "62c34e21d06264687faea7edbf63632c9f04d55e72114aa4a57bb95e4f888a0b"
diff --git a/meta/recipes-graphics/xorg-lib/xcb-util.inc b/meta/recipes-graphics/xorg-lib/xcb-util.inc
index 0e5ab70b2d..9898a6a13e 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util.inc
+++ b/meta/recipes-graphics/xorg-lib/xcb-util.inc
@@ -16,7 +16,7 @@ SECTION = "x11/libs"
 DEPENDS = "libxcb"
 DEPENDS += "gperf-native"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.xz"
 
 inherit autotools pkgconfig features_check
 
diff --git a/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb b/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb
index 206f07a65c..6d0af2aa23 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb
@@ -1,5 +1,7 @@
 require xcb-util.inc
 
+SRC_URI = "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.bz2"
+
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/xcb_aux.c;endline=30;md5=ae305b9c2a38f9ba27060191046a6460 \
                     file://src/xcb_event.h;endline=27;md5=627be355aee59e1b8ade80d5bd90fad9"
-- 
2.30.2


