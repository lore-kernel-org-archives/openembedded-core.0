Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A0FC43219
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:02:07 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.7197.1667530925117850979
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Pl277rBH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id l6so3433007pjj.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5c5QSo5R805eSJQxUUx6hmvmgmfAiDeBBj/XT2Qw1g=;
        b=Pl277rBHxuM0zYrQB4wVcWdlTzDwjUQhXp1erRDhyUQuGIzo42azBsoDwv+OQLQoS3
         29+6L8ULD/UveuquSp6bNwgAKJtuGkIpsBxi4oVM9+MdninwoOfhKGTOh0E29EZbQ9oG
         07mb0Q3ou6BbOkINZPUnPXHbhrYWFCGdMpFeSz/xpCH/Qu00JcZi7nvPM50gv6FgVJlp
         5PJXsvdfXkJ5wg9D1nl1lM/W3XcpxSxckwTiajN1xECFYseZU0S2DaV7gp05x8vXgSHY
         BatyazY8YP3qH3r0l5Wb0QvBGwPUZyI/Qs3L/kzHNHwaUCCRQ6XKkKoTEXEuQNJyky9b
         tbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5c5QSo5R805eSJQxUUx6hmvmgmfAiDeBBj/XT2Qw1g=;
        b=OAjtXcl2N+zRPWsHBhJ5ns5og5UdlCK9yJP7M02rfGdKNtNtVw9U7po9VUAi0lwOYn
         aKqG0ht5r8hKF5CEK8zLjEzXUdtmI++lPxjdQrvJiUXNI8fSUphQ4ouIN6CmBuq90IDe
         hjEfCvGdVYqx+i/jmH9vTlof8r12lTVJHL6N6Apx2FY3AebSdDVdAYRtNPJDUaCVG+/4
         qHXBb2PXdz+jB/dypgC4CFTXD17jMOZVuJtJB0esv8bVb94aeZyjyjFrfQ+tzUkFByyz
         2kRA354dMY2uJTLLRPLN8XUbFngSdEPq3/y1p8Me0iTvQ7HjCX9kw36IkNhKfvEPCmbm
         PZKQ==
X-Gm-Message-State: ACrzQf3pLPQ1Qt6cX7KOpmBC5yLzFnxUeVH9OczawJpJ3uMO80dgBj8L
	pQrMBeiCGGm0uZ6kOWjpCAtavQfsW4C315M3
X-Google-Smtp-Source: AMsMyM4/CtfNFin+vbdHQ206xlevBHBmOJwmQPDzKy1v+y2VySI4BqaKZV8xSC9kAYfNYqgsJOfORQ==
X-Received: by 2002:a17:90a:8504:b0:212:c1f4:ddf1 with SMTP id l4-20020a17090a850400b00212c1f4ddf1mr35107083pjn.224.1667530924241;
        Thu, 03 Nov 2022 20:02:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.02.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:02:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/31] meson: make wrapper options sub-command specific
Date: Thu,  3 Nov 2022 17:00:58 -1000
Message-Id: <a8739ccdca5ade6db40d7b6c7e67acc8c973b4a7.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172684

From: Liam Beguin <liambeguin@gmail.com>

The meson-wrapper adds setup options to facilitate cross-compilation.
The current options are exclusive to the setup sub-command and might
cause issues with other sub-commands.

Update the wrapper to make options sub-command specific.

Signed-off-by: Liam Beguin <liambeguin@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7bcda141f2019862b4fb5d8dec7956cd8344b420)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../meson/meson/meson-wrapper                 | 21 +++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes-devtools/meson/meson/meson-wrapper
index 8fafaad975..b65ba8e803 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -5,7 +5,7 @@ if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
 fi
 
 if [ -z "$SSL_CERT_DIR" ]; then
-    export SSL_CERT_DIR="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/"
+    export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/etc/ssl/certs/"
 fi
 
 # If these are set to a cross-compile path, meson will get confused and try to
@@ -13,7 +13,20 @@ fi
 # config is already in meson.cross.
 unset CC CXX CPP LD AR NM STRIP
 
+for arg in "$@"; do
+    case "$arg" in
+    -*) continue ;;
+    *) SUBCMD="$arg"; break ;;
+    esac
+done
+
+if [ "$SUBCMD" = "setup" ] || [ -d "$SUBCMD" ]; then
+    MESON_SUB_OPTS=" \
+        --cross-file="$OECORE_NATIVE_SYSROOT/usr/share/meson/${TARGET_PREFIX}meson.cross" \
+        --native-file="$OECORE_NATIVE_SYSROOT/usr/share/meson/meson.native" \
+        "
+fi
+
 exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
-     --cross-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFIX}meson.cross" \
-     --native-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native" \
-     "$@"
+    "$@" \
+    $MESON_SUB_OPTS
-- 
2.25.1


