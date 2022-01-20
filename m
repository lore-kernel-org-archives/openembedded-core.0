Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40791C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 22:23:09 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.3527.1642717388400473996
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 14:23:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LUUKGl+F;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso14041901wmf.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 14:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0xSNuiHR+4JxrfXjeXrwI3+vRiLKE3WsX/4qUq4x4Iw=;
        b=LUUKGl+FpEYajWnh2D6LeAACnLrGNx5vYY2Wcgv+KpwETI25+oK5WOeraAgz5abzeN
         0/8GNtRXo/lL8kCpi4epe30FBpiTf4NziA0jHNHFWZ0+IUmIPIXiqxmEdZNCc8xy3LqM
         +Lo7C5SIVVmvNhH2EOYqvw/e/olUze12+TAH2MhPrAvpisF4O1vULgAZJcjmhEszvtbR
         oMObwCFjwfvDwyIgYYWsURESO98gU98uN+ODXP2X3Pb+pxUxDyT6GLz50GprTR/YYOkJ
         fPIQ8tOLQQBMq8SLJDxgvFlI6LqcNayey25fjb6gzpkQNSFiMcgkDTNyeNUVVxhqGjRA
         j5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0xSNuiHR+4JxrfXjeXrwI3+vRiLKE3WsX/4qUq4x4Iw=;
        b=UzHvn2SpvYUXh1Ou+a+5XiHzTZqvVidveKKLpasZ+IaTlBE+APGGieRWHDL/CS0VQJ
         VL90exSK+x3nYbAeqsL3WEQR02a0Gv7Faztr2+i3lkVxLjlnt/SQ66uDuik+VFdEb0lu
         xFnrhvm3t8QmWqCqifQ1YEm3n7SAgMFHEw5eF7uvYmTh+ud/v7beJZUWWzi3rwQ9YwpO
         DXKVssqxy0uJ5s8LeRbU3pZpmYuZHWH5sxbRrQEE2Xl6Eu5nESIqFQ3ubTfL8JGmOsXo
         02BfKqyaFl/ZWasmIG0DwmHqgavfsAW30MvHkpTZFRUhIxvqg9DC0AFewOZvlOdvjkcv
         1GAw==
X-Gm-Message-State: AOAM533VxLe8vGQABdU7rNDhltF5H+3NTFBhIKjkSWFB4DSEmS+SyBH0
	TFegdJaoJHjyeHMxb418LovGxpxTZxY=
X-Google-Smtp-Source: 
 ABdhPJwKUQIZ9+bG9UsTb+1DjFe+k434B974zh/ogTlje/juR57NvNLwP6yW2z0nBh/7MKiaNoxVLA==
X-Received: by 2002:a1c:4c0e:: with SMTP id z14mr905068wmf.11.1642717386608;
        Thu, 20 Jan 2022 14:23:06 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 p2sm3364349wmc.33.2022.01.20.14.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 14:23:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] ruby: disable libruby.so
Date: Thu, 20 Jan 2022 23:22:56 +0100
Message-Id: <20220120222256.1697929-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 22:23:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160802

It was found to cause races in make install, as observed in
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14695

[YOCTO #14695]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/ruby/ruby_3.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby_3.1.0.bb b/meta/recipes-devtools/ruby/ruby_3.1.0.bb
index 7183c93d45..128e4527e1 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.0.bb
@@ -29,7 +29,7 @@ EXTRA_OECONF = "\
     --disable-versioned-paths \
     --disable-rpath \
     --disable-dtrace \
-    --enable-shared \
+    --disable-shared \
     --enable-load-relative \
     --with-pkg-config=pkg-config \
     --with-static-linked-ext \
-- 
2.20.1


