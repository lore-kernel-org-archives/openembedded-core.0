Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C30C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:42:41 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.1937.1667356961201249011
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ja0/BLRc;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso807951pjg.5
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=THWR40gPksit7VnOxfsZmX1tbnos+titt5ueJZ8IjHc=;
        b=ja0/BLRcccj/ZlnvNV1+ykYm0kygOYcmmtMpZrYwQ6Emb8aGHxGdhloeAG2w/RoPBo
         kiwOyQ7RCiRMeYZhqZ1rm0NBSQA/FkPyaaKm57PH2N+2o4Z5xcujFa2Wzp6vHSGC3XOW
         azqWrFgl3pgL/8iKnpuY4QtN5UdFDgWURCtKBdypQpSyJ6kikjBBHk6W5lEOsOn0Ds0n
         y9Oif9UvFvEAPvwaLUYIsJ0JGI2D8//rHIK4/+MTb927B9taOpxsPN/AA2+k/5DaDrrj
         EJamQsWBjbeuV6fKRKHZWDpBI+HEeqqP5lOKYe7wHYVRJ1YLXBkc4S83LzMN+xihYp/I
         2oUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THWR40gPksit7VnOxfsZmX1tbnos+titt5ueJZ8IjHc=;
        b=T58PHV2AVbnvFqx9fNEDbjZM5VpsZp/SogkRRKDLrYXTEhb+HINBm6aItdsmfRJrYb
         U8ayja+bvBg7PTU+2sv6fWQjSCcmdUYnoQLJUn+ehXiEgtG1WPosjeFPwaa4vehalCAE
         7VyUHNnAGW9pMWT2wvQQeVgLvjO314h277ge65hKz3/JrMwSqLThQbGDITVosIa7cTTi
         DeBhe3TUOIALaBtw6tsgRVTUse7EryMoaUP7p5ddNgx6CEA/vvJOBiBbCDWwNE5WPdQz
         0lwT+M4Pgj9UJQ/duRQo0sN/Zd+t8fHrlVjodSwoTfLg5nF8qzTJSGB3WhCPGSGXA23B
         Z7Iw==
X-Gm-Message-State: ACrzQf3bgGCJSWgLA3avbkqAJfzpzttgOrGQyJpk96DWYJh/AZz+HaKF
	aPGp3qqplArVvQnHD5KbBvxAEIdH0h1JkOw1
X-Google-Smtp-Source: AMsMyM7FrVywztSY+ZIS2N8/K9u9gVsNEeht0C35WPjMLmCi1nPxOjlNYhQXm5KAj2QBqXTvT5vAKw==
X-Received: by 2002:a17:902:a383:b0:187:34f6:439d with SMTP id x3-20020a170902a38300b0018734f6439dmr7360777pla.35.1667356960256;
        Tue, 01 Nov 2022 19:42:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.42.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:42:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/20] meson: make wrapper options sub-command specific
Date: Tue,  1 Nov 2022 16:41:58 -1000
Message-Id: <4475250ee0d83cc90322f2fcd9ec8df7c05b6903.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172548

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
index c62007f507..fca64a5692 100755
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


